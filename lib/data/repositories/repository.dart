import 'dart:convert';

import 'package:alfaridzi_me/data/models/models.dart';
import 'package:alfaridzi_me/services/call_service.dart';
import 'package:alfaridzi_me/services/locator.dart';
import 'package:alfaridzi_me/utils/constant.dart';
import 'package:alfaridzi_me/utils/utility.dart';
import 'package:dio/dio.dart';

class Repository {
  var callService = locator<CallService>();
  Future<List<Experience>> getListExperience() async {
    try {
      // final response = await callService.connect(
      //   Constant.listExperience,
      //   {},
      //   Constant.post,
      // );
      await Future.delayed(const Duration(milliseconds: 2000));

      // request API
      ApiResult result = apiResultFromJson(json.encode(dummyJsonExperience));

      // changes the data into experience object
      List<Experience> experiences = [];
      for (var i = 0; i < result.results.length; i++) {
        final data = result.results[i];
        experiences.add(Experience.fromJson(data.resultData, i));
      }

      // sort data by start join date
      experiences.sort((a, b) => b.startDate.compareTo(a.startDate));

      return experiences;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }
}

const dummyJsonExperience = {
  "object": "list",
  "results": [
    {
      "object": "page",
      "id": "edb2ed3a-fe64-454d-9e7c-ec93e00a336c",
      "created_time": "2022-12-22T12:29:00.000Z",
      "last_edited_time": "2022-12-29T05:47:00.000Z",
      "created_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "last_edited_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "f9e16463-bba4-4256-9a72-8613cb9fc1fb"
      },
      "archived": false,
      "properties": {
        "Technologies": {
          "id": "DxRl",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Dart, Flutter, Go", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Dart, Flutter, Go",
              "href": null
            }
          ]
        },
        "Detail": {
          "id": "NFPB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": "Developing Mamalyfe Mobile app using Flutter.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Developing Mamalyfe Mobile app using Flutter.",
              "href": null
            }
          ]
        },
        "Image": {
          "id": "_DtV",
          "type": "files",
          "files": [
            {
              "name": "mamalyfe-image.jpeg",
              "type": "file",
              "file": {
                "url":
                    "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/06a333a9-0c0c-46ce-add7-1e5917153b30/mamalyfe-image.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221230T101522Z&X-Amz-Expires=3600&X-Amz-Signature=2bafb24412ee7a5171b2ab9bc2c253561a27b9a196a07a97dc96cfa7878bc52e&X-Amz-SignedHeaders=host&x-id=GetObject",
                "expiry_time": "2022-12-30T11:15:22.618Z"
              }
            }
          ]
        },
        "Hashtag": {
          "id": "pOOM",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": "Mobile Developer, Flutter, Parenting Consultation",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Mobile Developer, Flutter, Parenting Consultation",
              "href": null
            }
          ]
        },
        "Responsibility": {
          "id": "pqho",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Developing features like spinning the wheel for a present to the user, some catalogs, and a leaderboard. Learning Go for the first time to help manage the Backend.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Developing features like spinning the wheel for a present to the user, some catalogs, and a leaderboard. Learning Go for the first time to help manage the Backend.",
              "href": null
            }
          ]
        },
        "URL Website": {
          "id": "sY%5BT",
          "type": "url",
          "url": "https://mamalyfe.id/"
        },
        "Description": {
          "id": "%7BxYY",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "My first experience as Mobile Developer and also working in Startup Company.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "My first experience as Mobile Developer and also working in Startup Company.",
              "href": null
            }
          ]
        },
        "Join Date": {
          "id": "%7DREe",
          "type": "date",
          "date": {
            "start": "2021-03-04",
            "end": "2021-07-31",
            "time_zone": null
          }
        },
        "Role": {
          "id": "~%7BGh",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Programmer", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Programmer",
              "href": null
            }
          ]
        },
        "Company Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "Mamalyfe", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Mamalyfe",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/Mamalyfe-edb2ed3afe64454d9e7cec93e00a336c"
    },
    {
      "object": "page",
      "id": "9c2425dc-cdb2-47e6-a0d9-5b6672a4eaed",
      "created_time": "2022-12-22T12:29:00.000Z",
      "last_edited_time": "2022-12-29T05:45:00.000Z",
      "created_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "last_edited_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "f9e16463-bba4-4256-9a72-8613cb9fc1fb"
      },
      "archived": false,
      "properties": {
        "Technologies": {
          "id": "DxRl",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": "Dart, Flutter, Firebase, Android, iOS",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Dart, Flutter, Firebase, Android, iOS",
              "href": null
            }
          ]
        },
        "Detail": {
          "id": "NFPB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "I work remotely as a Software Development Engineer focusing on Mobile Applications with Flutter at The Software Practice (TSP) located in Singapore. TSP is a technology development firm that builds software for clients and its own business.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "I work remotely as a Software Development Engineer focusing on Mobile Applications with Flutter at The Software Practice (TSP) located in Singapore. TSP is a technology development firm that builds software for clients and its own business.",
              "href": null
            }
          ]
        },
        "Image": {
          "id": "_DtV",
          "type": "files",
          "files": [
            {
              "name": "tsp-image.png",
              "type": "file",
              "file": {
                "url":
                    "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/cc544d36-04f8-4746-ae87-76722628d4a9/tsp-image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221230T101522Z&X-Amz-Expires=3600&X-Amz-Signature=8cece125fe7ae0e55d2672dcc3904c85d347a1a89e1858fbbdf28524029254c7&X-Amz-SignedHeaders=host&x-id=GetObject",
                "expiry_time": "2022-12-30T11:15:22.618Z"
              }
            }
          ]
        },
        "Hashtag": {
          "id": "pOOM",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Flutter, Mobile Developer, Dart, Software Development Engineer ",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Flutter, Mobile Developer, Dart, Software Development Engineer ",
              "href": null
            }
          ]
        },
        "Responsibility": {
          "id": "pqho",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Developing App with Flutter. Using State Management like Provider, Secure the local storage data encrypted using Flutter Package. Implement security checks such as jailbroken or root, hook, and tamper detection.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Developing App with Flutter. Using State Management like Provider, Secure the local storage data encrypted using Flutter Package. Implement security checks such as jailbroken or root, hook, and tamper detection.",
              "href": null
            }
          ]
        },
        "URL Website": {
          "id": "sY%5BT",
          "type": "url",
          "url": "https://thesoftwarepractice.com/"
        },
        "Description": {
          "id": "%7BxYY",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Software Development Engineer that focuses on working as a Mobile Developer with Flutter.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Software Development Engineer that focuses on working as a Mobile Developer with Flutter.",
              "href": null
            }
          ]
        },
        "Join Date": {
          "id": "%7DREe",
          "type": "date",
          "date": {"start": "2022-03-28", "end": null, "time_zone": null}
        },
        "Role": {
          "id": "~%7BGh",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": "Software Development Engineer",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Software Development Engineer",
              "href": null
            }
          ]
        },
        "Company Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {
                "content": "The Software Practice Singapore",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "The Software Practice Singapore",
              "href": null
            }
          ]
        }
      },
      "url":
          "https://www.notion.so/The-Software-Practice-Singapore-9c2425dccdb247e6a0d95b6672a4eaed"
    },
    {
      "object": "page",
      "id": "e1eba6d4-00cf-4c53-8ca1-a9c8eafd56f6",
      "created_time": "2022-12-22T12:29:00.000Z",
      "last_edited_time": "2022-12-29T05:45:00.000Z",
      "created_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "last_edited_by": {
        "object": "user",
        "id": "92784a61-780e-49b7-a371-f6e289205015"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "f9e16463-bba4-4256-9a72-8613cb9fc1fb"
      },
      "archived": false,
      "properties": {
        "Technologies": {
          "id": "DxRl",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Dart, Flutter, Obj-c, Kotlin, Android, iOS, Swift, Firebase",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Dart, Flutter, Obj-c, Kotlin, Android, iOS, Swift, Firebase",
              "href": null
            }
          ]
        },
        "Detail": {
          "id": "NFPB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter such as Bank INA, Bank MAS, Bank Sampoerna, and Bank Artha Graha Internasional.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter such as Bank INA, Bank MAS, Bank Sampoerna, and Bank Artha Graha Internasional.",
              "href": null
            }
          ]
        },
        "Image": {
          "id": "_DtV",
          "type": "files",
          "files": [
            {
              "name": "dsi-image.png",
              "type": "file",
              "file": {
                "url":
                    "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a04083c3-2860-4e31-80ef-be46b92c841e/dsi-image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221230T101522Z&X-Amz-Expires=3600&X-Amz-Signature=9b088b4cb1a713237f671639ddf54b0771ef25951511235d3a6a23a8314ef27c&X-Amz-SignedHeaders=host&x-id=GetObject",
                "expiry_time": "2022-12-30T11:15:22.618Z"
              }
            },
            {
              "name": "primavisi-image.png",
              "type": "file",
              "file": {
                "url":
                    "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/672ab0db-5bf8-45b7-99d1-248c58c02abf/primavisi-image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221230T101522Z&X-Amz-Expires=3600&X-Amz-Signature=8db022e4ce86513fa301b69d2a35163b687e9b1af7b422758570e5c3978fc6eb&X-Amz-SignedHeaders=host&x-id=GetObject",
                "expiry_time": "2022-12-30T11:15:22.623Z"
              }
            }
          ]
        },
        "Hashtag": {
          "id": "pOOM",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": "Mobile Developer, Bank, Flutter, Mobile Banking",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Mobile Developer, Bank, Flutter, Mobile Banking",
              "href": null
            }
          ]
        },
        "Responsibility": {
          "id": "pqho",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Developing Mobile Banking from zero or revamping the existing app into new Mobile Banking with Flutter. Maintaining Existing Mobile Banking such as fixing bugs, adding new features, and improving some features with Flutter, Obj-c, and Kotlin. Consuming third party/library like face recognize for registration bank account (Online Onboarding) from native (Obj-c/Java) to Flutter.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Developing Mobile Banking from zero or revamping the existing app into new Mobile Banking with Flutter. Maintaining Existing Mobile Banking such as fixing bugs, adding new features, and improving some features with Flutter, Obj-c, and Kotlin. Consuming third party/library like face recognize for registration bank account (Online Onboarding) from native (Obj-c/Java) to Flutter.",
              "href": null
            }
          ]
        },
        "URL Website": {
          "id": "sY%5BT",
          "type": "url",
          "url": "https://www.dwidasa.com/home"
        },
        "Description": {
          "id": "%7BxYY",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content":
                    "Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter.",
                "link": null
              },
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text":
                  "Developing and maintaining a Mobile Banking Application (Android/iOS) using Flutter.",
              "href": null
            }
          ]
        },
        "Join Date": {
          "id": "%7DREe",
          "type": "date",
          "date": {
            "start": "2021-08-01",
            "end": "2022-03-27",
            "time_zone": null
          }
        },
        "Role": {
          "id": "~%7BGh",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Mobile Developer", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Mobile Developer",
              "href": null
            }
          ]
        },
        "Company Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "PT Dwidasa Samsara Indonesia", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "PT Dwidasa Samsara Indonesia",
              "href": null
            }
          ]
        }
      },
      "url":
          "https://www.notion.so/PT-Dwidasa-Samsara-Indonesia-e1eba6d400cf4c538ca1a9c8eafd56f6"
    }
  ],
  "next_cursor": null,
  "has_more": false,
  "type": "page",
  "page": {}
};
