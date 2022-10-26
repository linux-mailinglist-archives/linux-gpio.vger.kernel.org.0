Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A6460E50F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 17:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbiJZP7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 11:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiJZP67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 11:58:59 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7067EACF43;
        Wed, 26 Oct 2022 08:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxQtptbJH4m3TeyIuegtJ9lOaQfAgmIcz+96+8S4/Kr1cLJzqfoYMezdJkAFiYL3uwNxwzxHo4h/woq/Lp/8QMbtJe17YOoLDa6m4tr9iDPTmvjRI3udevqXV9nMNp+20A4pGClC1v0c5rTeG3JlchkytPc2l36pY8HDeaSMfaFODEHFqlawkMuPtAAS9fW3Lqs9+IUBwByTEjdi0c1CKx4MdvUvDnnaCczMZYnploqz3cmT00S4BwUsC6SZBEt+02OAI5BSYZP8wCv6rkJfW9MOMrLmWsn+NdZTZ4zPrc9ReTcYILVU3KWvA/YV8rBN3TpHoBkFVmM9VJUbgDr8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7IRRyv4bBNvI9FhOMaASnEoq8lxJGpTKaDH07abji4=;
 b=VmXICRdONgRre5XORu2rOXY7j/H+lPEDhN+aJfnW/PFXnmo0BQspxO/WSZUIXoYF6lGidwMDEp+F2NJcl69otRuyvu3yoe2eHLABd8Q+iZyLxjy3Rg8PvQAjSx1699QtqDzwHlnrniTjXe4fNTZyCX44RhKZGJdPGXbP3sxK7R0UQJ0Qie2oLqt/L/WmQA9qkmtH4hVNsabPnQkpL3EDEfE3MhepblsijGbjZysCmfSx5R1LPVIdax/egtboWcLhoWy4icb6HOKaR+liGpU54YynzKp6dRAmJ69F4kdFzbNn5WpK/EdcYmG/cBKeDzEUOhULP5K3G+kDgdA3rxggeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7IRRyv4bBNvI9FhOMaASnEoq8lxJGpTKaDH07abji4=;
 b=T6OSiE6WOhlADVVHwdizeawvWmF9O3AGo1pRtoQ6r1uFp8gDvkXiFWzj3UxAEcgvvXF2QbluAou+UvBd0n1mqS1wsI7q/ej224VsmckRTVtTmCeJnOpmvN1nFdebF7NkV59veOlinb2Wdlcv35P5qpIhdD724JuyFZCHjqkoDls=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 15:58:56 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::282d:edef:88ac:662e]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::282d:edef:88ac:662e%8]) with mapi id 15.20.5723.034; Wed, 26 Oct 2022
 15:58:56 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: RE: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
Thread-Topic: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
Thread-Index: AQHY1LapyzooWXqlU0KgLv05IGTJ8q4gmiYAgAAdsICAABIEAIAANDyw
Date:   Wed, 26 Oct 2022 15:58:55 +0000
Message-ID: <BY5PR12MB490225682B7B31ED987B97BF81309@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
 <20220930102259.21918-3-shubhrajyoti.datta@amd.com>
 <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
 <Y1keKRzBhSDi671j@smile.fi.intel.com>
 <CAMRc=MfR14_Pd57AgqyGTRsghb7OjyPNOyoWmvnae5i=Fnznug@mail.gmail.com>
In-Reply-To: <CAMRc=MfR14_Pd57AgqyGTRsghb7OjyPNOyoWmvnae5i=Fnznug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-26T15:58:54Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=66dd1101-abfd-4f23-8f70-269b9772b5ab;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|BL1PR12MB5253:EE_
x-ms-office365-filtering-correlation-id: 90712227-4594-45bc-e975-08dab76afcad
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NcinfkWft0d1tapZl1E/iAX1rKG2TgjgTyiifMIdp2grRJKeTjn98FhoPhZNJjpyhVSkRI+mTa541YaOeUGlBXKPvYYKAEq13a3WW9QBwVAPQzCqJ696DIUnpTKoYKTOAI0zAxwASwX/snFECsZK/3OWAWUbBHCW/q2xwGwLqBxnGBS1z88qTp/pwHqkjJZbDCRhQg31PcH16FijhNHic8oD2ehGGMTSpPPWXPddFNJ1Tfrc7mU7FjBrS6Kwv12GyQ6MR600w4TIMUpN2Uv4NItRr26xFG68df8/3cpNgdyWxjSg8C3N0F54oyRj2bP9Q2dbgFvbxR+WOBd2hdEq6Xio7Hui9WscGsFLrKci3QEeeascZz5BbzSpd1kV1cPnC9kgXm5luoaVcq+qTXeXckF7pc9B78GTjpotjqSoNV/XGThICFNWqxTmADMi5Xv54HE4U8gavCkDuMXF7J8VmjUbsbqh417wp+yTHV3qVHHtOEEA6GVNAIpxoWwRryfwQeYX0n9fuB3NmtLgkMjpCPB6QHnxk2pia/dnm07JzzfCHeiYT/fNVVX/dBZe2vzY/ZPafDiv4Ja9LDVHP+BmWrSGaBk6XDWUuil0ASBWun9BY8aXi7BlPWqWrmH0lynCY4ygiKxY6wuEJXxcyZGfjX+Ko8fCkwT6RdGufJ+dPWX3XCPKiJD0NvTP6TcyEds01BpBtIbnDUQn4Uwxny41MZr3qKXrg06qLYprVUV6F4jtAHMM4+DRZrCSDZW6PGL4/jrXWdxq/2pIoU2p42iGHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(9686003)(38100700002)(52536014)(76116006)(66556008)(5660300002)(122000001)(66946007)(38070700005)(66476007)(83380400001)(86362001)(33656002)(8936002)(66446008)(54906003)(110136005)(71200400001)(26005)(55016003)(478600001)(186003)(316002)(64756008)(8676002)(2906002)(41300700001)(4326008)(53546011)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0RJdm1KMFZlVTJSVWRvSWxHQW00Q3kwaXRYUlN3OVBMdk9SZEZjN053bzRv?=
 =?utf-8?B?VzBxUHVORjdEVm5HMGE0OURVcklXUURhV3IzV2p0RUk4UDkrb2hNSlFTOWw0?=
 =?utf-8?B?aVZ2VllpQWZ2SE8wd05neU0za3pjZmd1SS9xMUpRMWhIVEtaYUdaSEVmZXM1?=
 =?utf-8?B?NElYRWxycW50cXVIU0h3ZWlHRWk3Q3Y5N2h4VEJ5bU1JQVNxTkowVWtCcVlU?=
 =?utf-8?B?amVPWlRwbWVra2V6MkhKOVF0TlU4MG8zMFdRYkYwUlhUOVBCUmJSR2Z4cGVm?=
 =?utf-8?B?eTRIZVUyYi9LM2ZHSDJHK3E3b2N2a1k3WS81cXJVTXNiTHBZSEM4djB5cTFz?=
 =?utf-8?B?MlBoMkovcnhBVFRmMjd1TVAzb3E1VTVpeGJFRDRGUkRlYU4zZy9ZWG5FV2pB?=
 =?utf-8?B?YjBnckcvMi9yWlkyWVU1dnQwT1pablBTZ2ZxdGE5cTQwSytCekNhNW81R1ow?=
 =?utf-8?B?bnRtTHpxYUpqMC9rdmFaWGtlbkNTOGRmUGQxajcyN3NGZDdwck1weFZmWDQr?=
 =?utf-8?B?a0IwYkU0Z0o4VGFxbGt0alB6Y05ydm5EdjJ4YjFRcWs5cW92VU1rc1V3S1F5?=
 =?utf-8?B?YnN4cnlVekhEa3EvM0g0VUxwajZNTUhLbUZIQ2dRNXdvdmtrbmFNeTRmMnhv?=
 =?utf-8?B?eWU1Vm5uT3hpN0dlVkpncUNWYmptT1lzeSs0T0xyc3dhQ09qZEhTd2FNaHRP?=
 =?utf-8?B?dkkzK0w4dXhlQ2R0bXlQalVsZnRNUEVzb2xtOGo2bXZDdmtxdVJZSXF3clZG?=
 =?utf-8?B?ZjBBNjRtT3pFR2I2NXpDeWRHaUtaZnZkZEE3cjZ3elA5SGlmMG5aNjh0ekRR?=
 =?utf-8?B?ZUF1SjZBR09oT0lsZFZaUlJQMUh4Q3YvUXRYeEVzZG5MT3ZHUjNvRk5CU1Zp?=
 =?utf-8?B?RlVaakEramRnRVM0Wjlkbnk5YmtMNW5rWlpqbXlLa1ExU1hZZmZZYjN3Mi84?=
 =?utf-8?B?RUxnUDlvNmF2a1pOU2NqMzE0VE50Sk1jTWN5UlV2K01wUHNweTQ0L0FaZjlj?=
 =?utf-8?B?NmJObnBLSUhmK2ZHRmxVRVRZUkpxZGRuS3BBbmtLbVN3MGJoMzYyNHZrSnVz?=
 =?utf-8?B?dExLY24wdVJpajRkdFp5eWpkKzd4SXZDOWY5TzJjWEVjYzg2NG5jdWc2a0k2?=
 =?utf-8?B?aUFUYmk5eFd1Z1hoM1VFRTdoM29IOVI0ZThNbXcvYnZKdTVURGpGV3FqT2Vm?=
 =?utf-8?B?THBzakcvazZoWXZsNXlnZjU1RXpKZE45VVh3M2Zkc3ROelpGQy90bWNpUXEw?=
 =?utf-8?B?U1IrKzlOdUxlcElCQU9GV1loNHprNXdVMTNhVW5KZFBPeHZRUGR6QWlMQW5o?=
 =?utf-8?B?cHFYd0ZSUDN0ZFFueFRnNjdEd05Nc0g4aUIxZVkxY0NUcDRya1g2TVNCTG5C?=
 =?utf-8?B?UU02WXJpRzdzMksvNmd3SHNCcVNPa3lndmE4RE51anNYaUI1ajlYVytncTFI?=
 =?utf-8?B?NUVRdXhBUnRCWUxWNm1VaUFuZCtjcE4wTGxUSjAra0NTdkFJWWVqOHVHQ3gv?=
 =?utf-8?B?RVc0bjhLRzFCTUdUUXhTbll6ZWlJT2ZINlpzSWFMVWVsUUVtTXZFeGo3Vlha?=
 =?utf-8?B?UXN5WTc3TmVSV3ZSRWhCQnM5OUpXWWlGRFFaSDVJbU83UExXOVlwbUpibkJK?=
 =?utf-8?B?UU9lOGZsbU41c1p4OS9IY014MHB1YnZFdW1jMkhyNGNEamg1WUN1V1Bqc0Zs?=
 =?utf-8?B?UnhlQXN3S3hlQVE1ZDN1R0pFNTE3czl6ZGRkRVJPRHVSMC9Wa1YwZ3d5NjRs?=
 =?utf-8?B?WWtvTDZtVHhNY2FGdmRMTm5aTDNLRGZtbUtWaS9jeENlL2R1RGppK2wrSDF6?=
 =?utf-8?B?bW9vaDJ0M2JKVDZZQkZ2RjNPYURNWFU3WjVxSTZMUkxmRU4zSDBsUjJaVUZu?=
 =?utf-8?B?a3BLejBkd2dHdks3NmFwd1pZWkRoS0JLN210ZUxrZERHVjJKa0c0dStIa1dR?=
 =?utf-8?B?WVkzb2o4WUo2MnErREQwcGg2NDJKMTlyT0NCbkUzWHF6UlZHRXNleFNSa0dG?=
 =?utf-8?B?bXA0RjhmOHc4djFESlh6TkdmK0VxUzA2VXhENWZrYVZSUGZoOWp0VkIvNUp6?=
 =?utf-8?B?TWp6NExZcW1vQktva08wUFo4MUlPSW9naDFDK1phMHRudkhvRTVZeUxFZnhK?=
 =?utf-8?Q?EK9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90712227-4594-45bc-e975-08dab76afcad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 15:58:55.9393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTsmz+9RH2RibWHfTnqLcMC9oSK0Q/3VQhfvSZU0vLlHTexh1VpF3rfAAZXPFJRRjUgcaffu+DXpZ1Y+jgPZxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNiwgMjAyMiA2OjIxIFBNDQo+IFRvOiBBbmR5
IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+OyBEYXR0YSwgU2h1YmhyYWp5
b3RpDQo+IDxzaHViaHJhanlvdGkuZGF0dGFAYW1kLmNvbT47IGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnOyBnaXQgKEFNRC0NCj4gWGlsaW54KSA8Z2l0QGFtZC5jb20+OyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyByb2Jo
K2R0QGtlcm5lbC5vcmc7DQo+IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY1IDIvM10gZ3BpbzogcGNhOTU3MDogYWRkIGEgcGxhdGZvcm0gZGF0YSBzdHJ1
Y3R1cmUNCj4gDQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0
ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1l
bnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gDQo+IA0KPiBPbiBXZWQsIE9j
dCAyNiwgMjAyMiBhdCAxOjQ2IFBNIEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgT2N0IDI2LCAyMDIy
IGF0IDEyOjAwOjM0UE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+IEhp
IFNodWJocmFqeW90aSwNCj4gPiA+IE9uIEZyaSwgU2VwIDMwLCAyMDIyIGF0IDEyOjQxIFBNIFNo
dWJocmFqeW90aSBEYXR0YQ0KPiA+ID4gPHNodWJocmFqeW90aS5kYXR0YUBhbWQuY29tPiB3cm90
ZToNCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNo
IGlzIG5vdyBjb21taXQgMzVhNGJjOTRhNDdmMmVhNiAoImdwaW86DQo+ID4gPiBwY2E5NTcwOiBh
ZGQgYSBwbGF0Zm9ybSBkYXRhIHN0cnVjdHVyZSIpIGluIGdwaW8vZ3Bpby9mb3ItbmV4dA0KPiA+
ID4gbGludXgtbmV4dC9tYXN0ZXIgbmV4dC0yMDIyMTAyNg0KPiA+DQo+ID4gRHVubm8gaWYgQmFy
dCByZWJhc2VzIGhpcyB0cmVlLi4uDQo+ID4NCj4gDQo+IEkgd2lsbCBiYWNrIGl0IG91dCBvZiBu
ZXh0LiBTaHViaHJhanlvdGk6IGNhbiB5b3Ugc2VuZCBhIGZpeGVkIHZlcnNpb24gb2YgdGhpcw0K
PiBzZXJpZXM/DQoNCkp1c3Qgc2VudCBpdCBmaXhpbmcgaXQgdXAuDQoNCj4gDQo+IEJhcnQNCj4g
DQo+ID4gLi4uDQo+ID4NCj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHBjYTk1NzBfb2ZfbWF0Y2hfdGFibGVbXSA9IHsNCj4gPiA+ID4gLSAgICAgICB7IC5jb21wYXRp
YmxlID0gIm54cCxwY2E5NTcwIiwgLmRhdGEgPSAodm9pZCAqKTQgfSwNCj4gPiA+ID4gLSAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm54cCxwY2E5NTcxIiwgLmRhdGEgPSAodm9pZCAqKTggfSwNCj4g
PiA+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm54cCxwY2E5NTcwIiwgLmRhdGEgPSAmcGNh
OTU3MF9ncGlvIH0sDQo+ID4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJueHAscGNhOTU3
MSIsIC5kYXRhID0gJnBjYTk1NzFfZ3BpbyB9LA0KPiA+ID4NCj4gPiA+IFRoaXMgYnJlYWtzIGJp
c2VjdGlvbiwgYXMgLmRhdGEgaXMgc3RpbGwgY29uc2lkZXJlZCB0byBiZSB0aGUgbnVtYmVyDQo+
ID4gPiBvZiBHUElPczoNCj4gPiA+DQo+ID4gPiAgICAgZ3Bpby0+Y2hpcC5uZ3BpbyA9DQo+ID4g
PiAodWludHB0cl90KWRldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LT5kZXYpOw0KPiA+DQo+
ID4gWW91IGJlYXQgbWUgdXAgdG8gaXQsIEkgaGF2ZSBhbHNvIG5vdGljZWQgdGhpcy4NCj4gPg0K
PiA+ID4gPiAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ID4gPiAgfTsNCj4gPg0KPiA+
IC0tDQo+ID4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+ID4gQW5keSBTaGV2Y2hlbmtvDQo+ID4NCj4g
Pg0K
