//
//  RealmRepository.swift
//  Polaroid
//
//  Created by 홍정민 on 7/26/24.
//

import Foundation
import RealmSwift

final class RealmRepository: RealmProtocol {
    private let realm = try! Realm()
    
    func getRealmFileURL() -> URL? {
        return realm.configuration.fileURL
    }
    
    func addLikePhoto(_ data: PhotoResult, _ color: String = "") {
        let item = PhotoInfo(
            id: data.id,
            created_at: data.created_at,
            width: data.width,
            height: data.height,
            likes: data.likes,
            color: color
        )
        
        item.urls.append(ImageInfo(raw: data.urls.raw, small: data.urls.small))
        item.user.append(UserInfo(name: data.user.name, profile_image: data.user.profile_image.medium))
        
        do{
            try realm.write {
                realm.add(item)
            }
        }catch {
            print("Add Like Photo Failed")
        }
    }
        
    func fetchAllPhoto() -> Results<PhotoInfo> {
        return realm.objects(PhotoInfo.self).sorted(byKeyPath: "regDate", ascending: false)
    }
    
    func fetchAllPhoto(_ condition: LikeCondition) -> Results<PhotoInfo> {
        switch condition {
        case .latest:
            return realm.objects(PhotoInfo.self).sorted(byKeyPath: "regDate", ascending: false)
        case .earliest:
            return realm.objects(PhotoInfo.self).sorted(byKeyPath: "regDate", ascending: true)
        }
    }
    
    func fetchFilteredPhoto(options: [String], conditon: LikeCondition) -> Results<PhotoInfo> {

        switch conditon {
        case .latest:
            return realm.objects(PhotoInfo.self).where{
                $0.color.in(options)
            }.sorted(byKeyPath: "regDate", ascending: false)
        case .earliest:
            return realm.objects(PhotoInfo.self).where{
                $0.color.in(options)
            }.sorted(byKeyPath: "regDate", ascending: true)
        }
    }
    
    func deleteLikePhoto(_ photoId: String) {
        if let item = realm.object(ofType: PhotoInfo.self, forPrimaryKey: photoId){
            do{
                try realm.write {
                    realm.delete(item.urls)
                    realm.delete(item.user)
                    realm.delete(item)
                }
            }catch{
                print("Delete Like Photo Failed")
            }
        }
    }
    
    func deleteAllPhoto(){
        let photo = realm.objects(PhotoInfo.self)
        let user = realm.objects(UserInfo.self)
        let image = realm.objects(ImageInfo.self)

        do{
            try realm.write {
                realm.delete(photo)
                realm.delete(user)
                realm.delete(image)
            }
        }catch{
            print("Delete All Like Photo")
        }
    }

    func isExistLike(id: String) -> Bool{
        if let _ = realm.object(ofType: PhotoInfo.self, forPrimaryKey: id){
            return true
        }else{
            return false
        }
    }
}
