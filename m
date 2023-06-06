Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27597247C5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238579AbjFFPcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238597AbjFFPcB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:32:01 -0400
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA9C10D4
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:32:00 -0700 (PDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356CSPwa019383;
        Tue, 6 Jun 2023 15:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Gy5qbmA4B6Z2RPWSjwtP+yQ/36hmZ6dzMGEHjAjUN4U=;
 b=MTviB1Han5G+fqdPVcf3t5eMGCvGAy/ZgOayD1ZZXul1AoEml1lR2CVaen4W5gmGNCUA
 7GayRetAef5X4rwXwXQoiM/zOwDe3KhdrBRr9z+3QmayV0qxmw03+OKiCbtlQGRw7Adc
 VaCX03qQ8ynk+6KhckhR0J8xX/W/1Kx+O/3HFdp3gmEz/Nt8spy3D8wgEu8wHvRUJqzN
 f8Mq+6+56GEHMoE9CK1A4/UZ4kVozhVOOHYD4sPXzVM30oQ4W5ANBJwpRpLhTw5ta79N
 JKV5nkYER8SPOQbLyvMXeasWdeXTpiXy1tzCAwibyrc9VLGrz5jyunZbHrHLuCxiyMHp oA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qytr0tnm9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 15:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdXZADy5ptfCBR0sXVu5vdgG5KjMHnapbqlbON35UgA0lqXhVlmuVcORBTzvo2/bAouEQJEfgo5/ZUW9n9v5EHEfd+ppYC9jtFGLl6rAojnghhrMePgh43lkaaFYLGD3CIQM4y7rB2XWvJgfjHJ1k55ZYwiva/C+d11kUxwmkqbCfoOU+PdIm7dKnaUzJj4JVlPzo9d3vizRmpFPGK3SDK37waABSRoXlSnKreZlHPu8mn8WXAwvuwpvd6mARbIIklwnRfr2J7k2Lu2FGAGVN6ZtB813E1H++jufpKGtw0R+TN+yXU1PS4JFH8t2BYF6P4ioh16vv1B/ChUaiRgJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy5qbmA4B6Z2RPWSjwtP+yQ/36hmZ6dzMGEHjAjUN4U=;
 b=nmlHSjhDUKBUXTAt9NpTWxmwSICKbMEYAMhnIUKB3AiudFB3abdN/G5xaIt4VOn4iR4LFYxfUduVWtOwoo1jBgssdaXqW/LzSM5Ue7nMfZzAnALKn6ukEwP+BtbMhPTnFg+yIUQyK4FFeDzzBnQ9WIhqKJmNhxUYDQ91ayhfR1iix+wP0J2YkPEpOXxgYm5NwC0OlKKI/8+/m1wigM2ju5Fkx0bXBUYi3GG3ugwI5lWMGptJTbnBjQIgFlSYlhwn7Kug4sl9NT6ZVbFqhrRwyAyVzxfKyKTAB6YVtvcjWSia2hCbxCyYPzYg1g2+ViKOsOcqwXK6NK49HssK+F4OnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 15:31:56 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c257:292:f881:ea%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 15:31:56 +0000
From:   "Slater, Joseph" <joe.slater@windriver.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Topic: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Thread-Index: AQHZl+5pvj1hxBofsEOLUMUg7rlo9q9949qAgAAA+ICAAAH/sA==
Date:   Tue, 6 Jun 2023 15:31:56 +0000
Message-ID: <BY5PR11MB3992A04C104F7FFF169CCCF88852A@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230605204335.4060789-1-joe.slater@windriver.com>
 <CAMRc=McsF9B+csnbTpmW30hfogkT6U=X6wi3TTJEwmVBF-OBfQ@mail.gmail.com>
 <CAMRc=MdLFQ6U6Mu5LoEwO2CsvE7V8S4Wy7RNRM+idje-qvCoww@mail.gmail.com>
In-Reply-To: <CAMRc=MdLFQ6U6Mu5LoEwO2CsvE7V8S4Wy7RNRM+idje-qvCoww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|LV8PR11MB8558:EE_
x-ms-office365-filtering-correlation-id: 46bce8b3-7655-474e-302e-08db66a32997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: odPx9Qu6wJAW6G4wCu7Yh4NYcBdiVsV64hFkHMpvcVcmMM1zg+wqYP3bI9XXcVLQ49cEs9/K7sdC8kyX43ebgFj0EtSOrTVxsnkvVNGnTMmWGu8XWO8ag0jSh2Zkf7ePmYuuJg/xE8He4LLwJvBiVhi4/7XdnBqD6MNPZo1DJLEtirgYBk7h7yRKCU8LAvtzFfng6Q0mG/MYCNmDGAi3//nm0AGbaTTXwjGASF1nEMoc0D7rVQQLWIizBQGfki6jdHt5NniDjCnMYRwuC9+5/RjkZSOiDneyuzdIgk6LIQawLgzng3qSW9lh3Q4V8AKiuLB3SYFSoK0s/sZ8gvLv8ipudEbPnUqnYDBbi9PLZWde6ZsWBurlvLgYpS6U5z0aXKVzVtxhGDAT376/FEbVSVviM8wdoMia2XTi2Mk3gGMY6fbIi5u9Re9hSM2JSh0scMm8XfMqkPskdC39OpefL8JsHa0A25U0/17qW8qJTzuEoG6awO6O1/HbL5yPom2+A9IpdVc/DdokdbY20r7sghtsNQc3S3L8oWoe+MBVl60xsOW4ENVjJ961keBufqcVMldyP4V2utwae2oNesmvhqF2fltEG8BWnoqAxfhOizrzdqfMThT1ueEuFvFTp6Zt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(451199021)(66556008)(66476007)(66946007)(38070700005)(52536014)(8936002)(8676002)(76116006)(64756008)(66446008)(4326008)(6916009)(5660300002)(316002)(54906003)(86362001)(41300700001)(38100700002)(478600001)(122000001)(2906002)(71200400001)(9686003)(7696005)(26005)(107886003)(53546011)(55016003)(6506007)(186003)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1V2UTB2V1RRaXF2Yk5JaThmTXJUMGdPS1g1bnk3Qk9xaTZoWUdJUDJUM2NQ?=
 =?utf-8?B?Tk84cHdxRFJYNEZ2WmNmWGpJdHIwMU1lVWdwc3pxZC84ZDIzQ1VjT3F0dGFR?=
 =?utf-8?B?MExweXVXWjlFd0FJZjEydit1S2g4blFkT2RENmJpRTlGYS91ZFRHb1FGT2Y1?=
 =?utf-8?B?ZjAvbWg3OGRzM1pBR1MrVVRtR0xrcmtLNUFBZ1JHdFRsNXlvSzBLQjc1bGFW?=
 =?utf-8?B?TTQ5WFo4b2JYZ2NwZkt6OVhSeDNlNURLVWhwbGtEWTRvaGhsTzBOQ3hHTkZl?=
 =?utf-8?B?V3M0KytmdCt0NC9EUWNnbGZOUnRROXIzTjQ2U0ZGT1VTZGpoRC9SZU9JNGFX?=
 =?utf-8?B?OWZvZ053bXNTZ0xKWE5qRE1SU1FZWWxLUDZFMktsOEE1VTQyOHozQ2UxRWNQ?=
 =?utf-8?B?eTdQR1JPbnhmZ0dRaHFwWGtCM09lNyt2d05rN0NMSlVicDZ6TE94VlRmSUww?=
 =?utf-8?B?d0RwV2JLRDBoaGVDSnU4S2xBK2RqcThOOVpISzllcThocEVhOUYrVUwvQ0t4?=
 =?utf-8?B?Yy9DZFlqM2FLQ3krUGk4c1dWZWxVUGFIMFZJcElxU1UxN2JxYWM1TEhQZUFC?=
 =?utf-8?B?TWhxZUszZmdNRzhUbFJYaHJyTFJyNG5SaWNET1JReGZlNSs2Z25YYy9paEFv?=
 =?utf-8?B?NCtkaWpNK3Z1akRvdEc3RkZuY0E3YnFSZGVlK0RqTFE4b0VpMy96TVRNenUx?=
 =?utf-8?B?UEwxaWV6Sm0xdVJPczNjOGdVVUxvR3p1bSsxc3V4M1BzeXNLSFQvVHl3M2tB?=
 =?utf-8?B?MmtMNXhiY2I4ZW9rbjBVenZ1ZFRuQzNtdTFaOWJ5RnJTL2V5c0M1bnVuV2ZR?=
 =?utf-8?B?V3RwTnRSWGhHcjdDeFRmTWNkT2lpTCsxKzJydm1ETEo3T2hDVzJzdVJYZG95?=
 =?utf-8?B?MS9rN09WOG9lTTh6ZWhaOGFIZlhZSXBwVDRrekJHN1B0VFI3OVVWd28xbGhC?=
 =?utf-8?B?eEpEdmpwSHc2QW5oeXJjV3Z4R0toY1YvbnV5NW1MV3JrQnh6bjZkcGhaWVQ5?=
 =?utf-8?B?MXk5TldROVVBWTJ3V3Q3YVUvbGNJVzhHSUpNd3FTUFpZcGJaVnhlNG1DQmtt?=
 =?utf-8?B?MWU5SnJxWEg0VWh3bWQ3TDhwZUpUK05CdUEvTFpFdWxNOXJkeFFZbnF6dFpv?=
 =?utf-8?B?SzVGQURsTXZNcFhRZG1mK0FWTTNMVU5HTG5iZ3hNTTFDQnI4VTlFVHpPNFkx?=
 =?utf-8?B?RnorbUJKU3hXSHNwMzFZajZDVnNvdjN3Q25BNDVhVk1wOFl1RjhURGdMekh6?=
 =?utf-8?B?REVvWXVPdlB6ajFpellEZHo0K2ladDdybFV4QXlnbDdGbUJUQVNyNWZqRHZO?=
 =?utf-8?B?b1ZnMzhZbGZBVWVGRWFGOW84NEVUTktGdm1TUkhIUkZvMSt5b0JhRjJvM3o1?=
 =?utf-8?B?OC80RG1SYUJVNEV1aXN2cTBaTmxUelNvNUZ5aDIvL2hOMVluVnk5Wm45RHF6?=
 =?utf-8?B?UUV1S1dqSEpmV0ZUb0tJWklCQU5CbjY4cDJNM3o5WERTek45K2E3cC9IRDBh?=
 =?utf-8?B?aW5oNHR1bm40UzBVVkxVdHh5SDg5b2d2ejJKSHhZZGhROG1rbHd1QkF2MnFm?=
 =?utf-8?B?dEpRMlpxUWpMVWFrd1JuckdmVitxSDFJYkVBY3dTN0QzQ0xUdUZYR21zWjNz?=
 =?utf-8?B?NUZWU3N2S1o0VFFvZGNjQThnM1gybDNyeHFJWm0zQkpVOEF3d0MveTNXK2Ji?=
 =?utf-8?B?c0tJWld4em1QRnNlQVpzYWxlam5OR3hYM1hOVXlqeXhzWkcxYnZjTzdZV3ll?=
 =?utf-8?B?ZjZuN3JWKyt0bEdzZXJpNjlFMmNiaC9rSi93bHVwbCs0SU5wNndsMklyeFhX?=
 =?utf-8?B?WnZDcGJ5LzFyWjN5NDdod2xFb25yeDRUdllJRzViVnExTmJEQ0k2MStSZHdz?=
 =?utf-8?B?UjNwVWtTUHhnM0c4bmF2R3lYNUNwVWNFM0l1WDBCK2NSR2ZKdmZneG9PK053?=
 =?utf-8?B?VnRSazl5MW9iOGYxNXhLQkorOVZJRVBNaFF5cDJPNFFMTHVabWdFUklDKzZp?=
 =?utf-8?B?K2VKb2xkWjZwMzBvY2RJZEhDMXp3cXc0SFNxdWVMTmJGNkx2V2NHbFlOWTFl?=
 =?utf-8?B?T1FTZ1NQcWw1K3IxKzZPZWJBbzVOTi9abWthWFRkNlIxQzkxeGxIS0FMTWRU?=
 =?utf-8?Q?Sz/c6cHq6daoRzS9PTNLYqlg0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bce8b3-7655-474e-302e-08db66a32997
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 15:31:56.6359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oa5guXlPL/FYQskBJtHjkWl4gHl5855RnIUIMFBk4Cxm45wFFRVIwH9jWBsScP6QXxmZeybESgmjJBfpuCPj/6JMAi8oAOf1DYawswCY5oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Proofpoint-GUID: wz_58MdWnzZaBik8noB1JPSLUMtl8qmk
X-Proofpoint-ORIG-GUID: wz_58MdWnzZaBik8noB1JPSLUMtl8qmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_10,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060132
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVHVlc2RheSwgSnVuZSA2LCAyMDIzIDg6MjAg
QU0NCj4gVG86IFNsYXRlciwgSm9zZXBoIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+IENj
OiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgTWFjTGVvZCwgUmFuZHkNCj4gPFJhbmR5Lk1h
Y0xlb2RAd2luZHJpdmVyLmNvbT4NCj4gU3ViamVjdDogUmU6IFt2M11bbGliZ3Bpb2RdW1BBVENI
IDEvMV0gZ3Bpby10b29scy10ZXN0LmJhdHM6IG1vZGlmeSBkZWxheXMgaW4NCj4gdG9nZ2xlIHRl
c3QNCj4gDQo+IE9uIFR1ZSwgSnVuIDYsIDIwMjMgYXQgNToxNuKAr1BNIEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOg0KPiA+DQo+ID4gT24gTW9uLCBKdW4gNSwgMjAy
MyBhdCAxMDo0M+KAr1BNIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IEZyb206IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiA+
DQo+ID4gPiBUaGUgdGVzdCAiZ3Bpb3NldDogdG9nZ2xlIChjb250aW51b3VzKSIgdXNlcyBmaXhl
ZCBkZWxheXMgdG8gdGVzdA0KPiA+ID4gdG9nZ2xpbmcgdmFsdWVzLiAgVGhpcyBpcyBub3QgcmVs
aWFibGUsIHNvIHdlIHN3aXRjaCB0byBsb29raW5nIGZvcg0KPiA+ID4gdHJhbnNpdGlvbnMgZnJv
bSBvbmUgdmFsdWUgdG8gYW5vdGhlci4NCj4gPiA+DQo+ID4gPiBXZSB3YWl0IGZvciBhIHRyYW5z
aXRpb24gdXAgdG8gMS41IHNlY29uZHMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9l
IFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgdG9v
bHMvZ3Bpby10b29scy10ZXN0LmJhdHMgfCAyNCArKysrKysrKysrKysrKysrKysrLS0tLS0NCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ3Bpby10b29scy10ZXN0LmJhdHMgYi90b29s
cy9ncGlvLXRvb2xzLXRlc3QuYmF0cw0KPiA+ID4gaW5kZXggYzgzY2E3ZC4uMDVkNzEzOCAxMDA3
NTUNCj4gPiA+IC0tLSBhL3Rvb2xzL2dwaW8tdG9vbHMtdGVzdC5iYXRzDQo+ID4gPiArKysgYi90
b29scy9ncGlvLXRvb2xzLXRlc3QuYmF0cw0KPiA+ID4gQEAgLTE0MSw2ICsxNDEsMjAgQEAgZ3Bp
b3NpbV9jaGVja192YWx1ZSgpIHsNCj4gPiA+ICAgICAgICAgWyAiJFZBTCIgPSAiJEVYUEVDVEVE
IiBdDQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+ICtncGlvc2ltX3dhaXRfdmFsdWUoKSB7DQo+ID4g
PiArICAgICAgIGxvY2FsIE9GRlNFVD0kMg0KPiA+ID4gKyAgICAgICBsb2NhbCBFWFBFQ1RFRD0k
Mw0KPiA+ID4gKyAgICAgICBsb2NhbCBERVZOQU1FPSR7R1BJT1NJTV9ERVZfTkFNRVskMV19DQo+
ID4gPiArICAgICAgIGxvY2FsIENISVBOQU1FPSR7R1BJT1NJTV9DSElQX05BTUVbJDFdfQ0KPiA+
ID4gKyAgICAgICBsb2NhbA0KPiA+ID4gK1BPUlQ9JEdQSU9TSU1fU1lTRlMvJERFVk5BTUUvJENI
SVBOQU1FL3NpbV9ncGlvJE9GRlNFVC92YWx1ZQ0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBmb3Ig
aSBpbiB7MS4uMTV9OyBkbw0KPiA+ID4gKyAgICAgICAgICAgICAgIFsgIiQoPCRQT1JUKSIgPSAi
JEVYUEVDVEVEIiBdICYmIHJldHVybg0KPiA+ID4gKyAgICAgICAgICAgICAgIHNsZWVwIDAuMQ0K
PiA+ID4gKyAgICAgICBkb25lDQo+ID4gPiArICAgICAgIHJldHVybiAxDQo+ID4gPiArfQ0KPiA+
ID4gKw0KPiA+ID4gIGdwaW9zaW1fY2xlYW51cCgpIHsNCj4gPiA+ICAgICAgICAgZm9yIENISVAg
aW4gJHshR1BJT1NJTV9DSElQX05BTUVbQF19DQo+ID4gPiAgICAgICAgIGRvDQo+ID4gPiBAQCAt
MTU2NywxNSArMTU4MSwxNSBAQCByZXF1ZXN0X3JlbGVhc2VfbGluZSgpIHsNCj4gPiA+ICAgICAg
ICAgZ3Bpb3NpbV9jaGVja192YWx1ZSBzaW0wIDQgMA0KPiA+ID4gICAgICAgICBncGlvc2ltX2No
ZWNrX3ZhbHVlIHNpbTAgNyAwDQo+ID4gPg0KPiA+ID4gLSAgICAgICBzbGVlcCAxDQo+ID4gPiAt
DQo+ID4gPiAtICAgICAgIGdwaW9zaW1fY2hlY2tfdmFsdWUgc2ltMCAxIDANCj4gPiA+ICsgICAg
ICAgIyBzbGVlcGluZyBmaXhlZCBhbW91bnRzIGNhbiBiZSB1bnJlbGlhYmxlLCBzbyB3ZQ0KPiA+
ID4gKyAgICAgICAjIHN5bmMgdG8gdGhlIHRvZ2dsZXMNCj4gPiA+ICsgICAgICAgIw0KPiA+ID4g
KyAgICAgICBncGlvc2ltX3dhaXRfdmFsdWUgc2ltMCAxIDANCj4gPiA+ICAgICAgICAgZ3Bpb3Np
bV9jaGVja192YWx1ZSBzaW0wIDQgMQ0KPiA+ID4gICAgICAgICBncGlvc2ltX2NoZWNrX3ZhbHVl
IHNpbTAgNyAxDQo+ID4gPg0KPiA+ID4gLSAgICAgICBzbGVlcCAxDQo+ID4gPg0KPiA+ID4gLSAg
ICAgICBncGlvc2ltX2NoZWNrX3ZhbHVlIHNpbTAgMSAxDQo+ID4gPiArICAgICAgIGdwaW9zaW1f
d2FpdF92YWx1ZSBzaW0wIDEgMQ0KPiA+ID4gICAgICAgICBncGlvc2ltX2NoZWNrX3ZhbHVlIHNp
bTAgNCAwDQo+ID4gPiAgICAgICAgIGdwaW9zaW1fY2hlY2tfdmFsdWUgc2ltMCA3IDAgIH0NCj4g
PiA+IC0tDQo+ID4gPiAyLjI1LjENCj4gPiA+DQo+ID4NCj4gPiBJIGFwcGxpZWQgdGhpcyB2ZXJz
aW9uIGFzIGl0IG5vIGxvbmdlciBicmVha3MgbXkgcWVtdSB0ZXN0cy4gUGxlYXNlDQo+ID4gZmVl
bCBmcmVlIHRvIHNlbmQgaXQgZm9yIG1ldGEtb3BlbmVtYmVkZGVkIG5vdyB3aXRoIFVwc3RyZWFt
LXN0YXR1cw0KPiA+IHNldCB0byBhY2NlcHRlZCBhbmQgbWFrZSBzdXJlIHRvIENjIG1lLg0KPiA+
DQo+ID4gQmFydA0KPiANCj4gSSBhY3R1YWxseSBhcHBsaWVkIHY0LCBqdXN0IHJlc3BvbmRlZCBo
ZXJlIGJ5IG1pc3Rha2UuDQo+IA0KPiBCYXJ0DQoNCltTbGF0ZXIsIEpvc2VwaF0gIFRoeC4gIEkg
d2lsbCBzZW5kIHRvIG1ldGEtb2UuDQoNCg0KDQo=
