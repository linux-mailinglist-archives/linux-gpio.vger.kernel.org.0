Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4680C36B410
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhDZNVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 09:21:39 -0400
Received: from mail-dm6nam10on2089.outbound.protection.outlook.com ([40.107.93.89]:39008
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233471AbhDZNVj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 09:21:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJcMEpK5RLPRWSwY5SGMKC8svSyCv847XcDZs++RwGTzdmkXBO3qQfCBZG7f6pcLKYm7PNcgZlPe661sVc4ZKM04mcFNJzYMp0T8L/AHmA73CYSnzAulhD1/bO2dIp71M3UlnMn7/ZQPHP17FVla2kZIhJBPOwN1Ibl+7SzZJm8ImY9UEZB9aCZ4vTikQejxv7LtthMaYXcNpMtkF8XT9p9Tauloh9M90rS/kHSt4resIJrbdgBB8d7XQUIOiSMQ9UsWD1PaBxjOui67bIvzEcA/5NUJKO6zeDbqu6K3BlH8d3UL0Qd74WKP2gSsS+S0xdKoLANs3CFQLNfWMdmkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8IVo4wvmj8fEKThZFI11zUnnICHv41D16VlkIr1hv4=;
 b=bJXRxDd8rj0TYOsM3fJiG0k0I5RCG/0Byqpez0cObLSeZeczSTeZ3TdHKM+PgBvZETAjgTgxLvx/RJmv1uy9P+zNt/vJp8adxdSONz6i+FJgIyeTPNpoWalGMsrvqR6uQvfUdCezV2+s+6WkCGyF7cNDv8u7eQiVWKZDUUfR/LBtFaqZc5fm2OByit60iTyfOxVIkkSda8KL+O+WgLbdALJU8GW5M8wYtSfmZsDtmpCUHIlaarm/a+7N2qsHu118xsEY0CcN2NBguwxjBW1q471pnrg/HBfI81aQxBbvtuS6agxEdf+Q5Z8ov9MGyHFOGWPcJ1QX3KNTLMOxbzlIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8IVo4wvmj8fEKThZFI11zUnnICHv41D16VlkIr1hv4=;
 b=aMr6v5JjoUQ3yqNGsfrGECOuO3XiKGIaOztYlyTSllHUDjSog/2mwsYlQOr+AjUxzOpV5Wm0N7ISHNBcog6daUCne369Q7OsDaOOYrXKEp4WAo+RGjoKZ8EIMow7Q08gLr5aY8dBB+8uS7K4XbaGt8vKQ+3RSTMOd5qUdbbkrVk=
Received: from DM5PR02MB3877.namprd02.prod.outlook.com (2603:10b6:4:b9::34) by
 DM6PR02MB5276.namprd02.prod.outlook.com (2603:10b6:5:46::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21; Mon, 26 Apr 2021 13:20:55 +0000
Received: from DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327]) by DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327%3]) with mapi id 15.20.4042.024; Mon, 26 Apr 2021
 13:20:54 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXN1HnJ1dD/z2380CasZDNOXc+DarCQxoAgAQix4A=
Date:   Mon, 26 Apr 2021 13:20:54 +0000
Message-ID: <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
In-Reply-To: <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75cb4eb0-f10f-4ca5-f66a-08d908b61f2d
x-ms-traffictypediagnostic: DM6PR02MB5276:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB5276113974E4242ED3DEC69CBD429@DM6PR02MB5276.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y/ORp1j+NGDcO0EuupWT2cKZk4uqjLA9G4LSZugFiiOfky3LcbE+zUVZgTfFc+y8BCwbukxLuhvOAa3j7n0LsNeKezn6CQTry4jm2DGxQjLKREidRsFUbXF/cBDFoCmGf5WV6QsSZoPAo4o99MR/iqtW0iIb0HXIjmyYMVfSd/x9S5oSa362ruHYyfwU9VDq2GpkTJDuL275dlCsFfP2gmn2UinIx0GHZxUN8BtQwtxPHh0mqJY+XbU6N+c1gRxYF1P9nSGl0b4d+0lQYKYOQd8Lv1r4CoBEizmgbG1hZ7rYPfF9yVNzWran3E1cqO/Xb3yNyliXGv4sbLc+4559QwUvxi2YI4kYBzIU8O0mJqDXRU72dcDSunPoW00AnwjTqK+DeUTWhwLY2JSJTVts/clPU514gmr4BOxLJORCxIHCVcyXEa1HxnnTNmwuTnWXlpcbZeXbFI7TMMX4W/nGD1CLaSOMuiPKCUqHlaxjsKE6jmSLzZCcPdt5jF3mXlb1E+RInXHpDbKNNNOzRLNLC7PTmuH2CejPTQg3YHm+DAUE77zO0QMxIS2fFKFT122KEAj5EMK008UBWmUm6g5+k0CbGqJDBBsZrki6pI0+Cd0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3877.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(186003)(6916009)(8936002)(8676002)(26005)(38100700002)(86362001)(122000001)(478600001)(33656002)(83380400001)(316002)(2906002)(7696005)(9686003)(6506007)(53546011)(55016002)(7416002)(54906003)(4326008)(64756008)(71200400001)(66446008)(66946007)(66476007)(66556008)(76116006)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?elAwMkR4Q29mTi9RMXVHNjU2UW00aFE0M3ErK2tWeE8rN2MzZVUvaG51U3lU?=
 =?utf-8?B?ZGEvb055NVJ5V0s5L1VNZlJyclYzekJ3Qk9WVlh6bzVLWWFzSVZkeWhnSjN3?=
 =?utf-8?B?dXNQaTcyak5oNmlhVlNaOVE5OUVnZ0ZqTURidFo0dHExcmQxRmpzZXY5Y2k4?=
 =?utf-8?B?a1BpaDkxcTB1aHBObWJ3bkpCYUZQclNqZkNkYVRpVmg5YjNCS3E4YUtiTDhZ?=
 =?utf-8?B?UmZ3SVpjSWdDQk54dmdQd1BDSCtuRVliSUNRM0lKVFk4R2JNVWF1SHdmWkZH?=
 =?utf-8?B?WmNIN2NHM2xMcVU2Q0s1TkY3enlzcUxWMGlyZktqcnJFQU4zQ3YvaEFuSmpn?=
 =?utf-8?B?ZERXVUllcUJlV05lR3AvbEFOdWhyZW1xRFBjeml6OS9hWDUrWWZnNVA0aWtS?=
 =?utf-8?B?Mk9KSWJTSkE1Sjd6RUUzN3loeXgycHRFeGJzc3hYZUdNcWV0ZWdZOWJSbDZ5?=
 =?utf-8?B?K2xSWUxhRUZ3MHZ0WlJjQjhqK2twOTFvc294b0w4NHhWbnVDcS9aNU9VVXRy?=
 =?utf-8?B?S2thaWRWTXhENlR5VTJ0alN6TlZBWU5KOEtQOEZaNHlTNys1RGMrQWFqbXVs?=
 =?utf-8?B?Tm51YzVpK2hDcTJGTnZGNlNhSGliUE13RnNsYjY1UDlLR2hsTVY4dzRDNEQ4?=
 =?utf-8?B?NVh6RDNiNkpqU0Vwc3lvZitvcWFxUTI2WklGZitYZFlzNkNEMkVKdmk3ZnIy?=
 =?utf-8?B?WGhUTEsvUGtHdXJJUmtGQVdPUDhFUFVvWUlOK0NiemVlZWlqODl1a2ZPVW4x?=
 =?utf-8?B?Zm5CaHl0R0llNWk1Nk0va2JJNkk3THorMEZHeStmMktucG4zTFRyTEEzQmxE?=
 =?utf-8?B?RFRsbXFFa3lTUUVBTDJaZGdrbmhlR3Z1U0paOTZyajFIQTZkeHZCUXFDVWhU?=
 =?utf-8?B?MGZQL21zU0J3b2NpQW1mVWZNbXFiU3NtQjZSRDJjeG42SlhXeTMxaE9nelNE?=
 =?utf-8?B?L243b1BNRmwreExBd003MEdKamY0cTBleWhJWjhZdUlKaXZNdVQwQlBnMUYw?=
 =?utf-8?B?MmxPa25CZFkzRFlwTHZCVE5qWDFXSVpadjBuOFY3TXBOeEhWSjFvMDBYWFhR?=
 =?utf-8?B?dGZOV2xrZnd3UHl6N0RrR3pib1h6Ni9PMzFKMkI3VGgvL3dlZzlIMnpLNlpR?=
 =?utf-8?B?b2JRNXNwaTRxenVPNlNaWUNpbTdhSnJicnhDSGx1dDBSOGpUYkZpZDR6Y2JY?=
 =?utf-8?B?L1Z4TUhJdFdQNHBqNkNiQlVhaWhDMU51ZEpNS1YwdTNrcks5SVlBVkRnUnFT?=
 =?utf-8?B?QlBVWmRMdk5XWWhVampXNWY1VnhKQUxGZ25DSWZaNU9QVWtpQ3dHSFFtOEVQ?=
 =?utf-8?B?UVQ3bENyeEpTN01JaSt4enJJUHdxNS9ibHh0NnBUREhOWkdjS3JLaGxTMEl2?=
 =?utf-8?B?eStNcEVqUEw0aEpzWnJJaEd5M2NwdjQyVGVJd0l1WWFqU0hDd2d1VzJNUnY1?=
 =?utf-8?B?QVJieHNNQmR0ajVJaFZuaUtHZy9hWWtFNm13V1BnT3JJRkhWRmNrWEFmS2Rh?=
 =?utf-8?B?K0cvTkRkby9KeSsrWmtoWFZPcGk1SnRqcHhPV251T1FWU0c2dlpTajkyNUYw?=
 =?utf-8?B?QjZyamtGelZZUDgySVNzUEVqNVRnbnFqYldkRjNkS2s2TGE2UnlRRnp5clhK?=
 =?utf-8?B?TFBmV25TbGNJR0hpLzNDcWZsQ2IrR1V1a3o4V1k5WXBJRDV3MS9zeHROb3FT?=
 =?utf-8?B?Z3VVcmlicEd4WVh4aWNRN3hTdWl2WGRyYjlRditjUjhRN1RheUR6MXJDREM1?=
 =?utf-8?Q?iiGUieArJtDvVqLyZaCxBf5zsri8iO7gEsut5q/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3877.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cb4eb0-f10f-4ca5-f66a-08d908b61f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 13:20:54.7782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AorYRVAvK54QjCa6pnLvTU6SphgtZw2LA9Jv1JhhAstWNyVEkfnsGZZA8QIQFtoO8mQ00/q48AVmFP9WvdKZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5276
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSBTaGV2Y2hlbmtvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZj
aGVua29AZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDIzLCAyMDIxIDk6MjQgUE0N
Cj4gVG86IFNhaSBLcmlzaG5hIFBvdHRodXJpIDxsYWtzaG1pc0B4aWxpbnguY29tPg0KPiBDYzog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgUm9iIEhlcnJpbmcNCj4g
PHJvYmgrZHRAa2VybmVsLm9yZz47IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsg
R3JlZyBLcm9haC0NCj4gSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBsaW51
eC1hcm0gTWFpbGluZyBMaXN0IDxsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBkZXZpY2V0cmVlIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IG9wZW4N
Cj4gbGlzdDpHUElPIFNVQlNZU1RFTSA8bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc+OyBnaXQg
PGdpdEB4aWxpbnguY29tPjsNCj4gc2Fpa3Jpc2huYTEyNDY4QGdtYWlsLmNvbQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDMvM10gcGluY3RybDogQWRkIFhpbGlueCBaeW5xTVAgcGluY3RybCBk
cml2ZXIgc3VwcG9ydA0KPiANCj4gT24gVGh1LCBBcHIgMjIsIDIwMjEgYXQgMTE6MzEgQU0gU2Fp
IEtyaXNobmEgUG90dGh1cmkNCj4gPGxha3NobWkuc2FpLmtyaXNobmEucG90dGh1cmlAeGlsaW54
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGRpbmcgcGluY3RybCBkcml2ZXIgZm9yIFhpbGlueCBa
eW5xTVAgcGxhdGZvcm0uDQo+ID4gVGhpcyBkcml2ZXIgcXVlcmllcyBwaW4gaW5mb3JtYXRpb24g
ZnJvbSBmaXJtd2FyZSBhbmQgcmVnaXN0ZXJzIHBpbg0KPiA+IGNvbnRyb2wgYWNjb3JkaW5nbHku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA+IDxsYWtz
aG1pLnNhaS5rcmlzaG5hLnBvdHRodXJpQHhpbGlueC5jb20+DQo+IA0KPiBZb3UgbWF5IHJlZHVj
ZSB0aGUgbnVtYmVyIG9mIExPQ3MgYnkgam9pbmluZyBzb21lIGxpbmVzLiBTZWUgYmVsb3cuDQo+
IA0KPiAuLi4NCj4gDQo+ID4gK2NvbmZpZyBQSU5DVFJMX1pZTlFNUA0KPiA+ICsgICAgICAgdHJp
c3RhdGUgIlBpbmN0cmwgZHJpdmVyIGZvciBYaWxpbnggWnlucU1QIg0KPiA+ICsgICAgICAgZGVw
ZW5kcyBvbiBaWU5RTVBfRklSTVdBUkUNCj4gPiArICAgICAgIHNlbGVjdCBQSU5NVVgNCj4gPiAr
ICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTkNPTkYNCj4gPiArICAgICAgIGRlZmF1bHQgWllOUU1Q
X0ZJUk1XQVJFDQo+ID4gKyAgICAgICBoZWxwDQo+ID4gKyAgICAgICAgIFRoaXMgc2VsZWN0cyB0
aGUgcGluY3RybCBkcml2ZXIgZm9yIFhpbGlueCBaeW5xTVAgcGxhdGZvcm0uDQo+ID4gKyAgICAg
ICAgIFRoaXMgZHJpdmVyIHdpbGwgcXVlcnkgdGhlIHBpbiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBm
aXJtd2FyZQ0KPiA+ICsgICAgICAgICBhbmQgYWxsb3cgY29uZmlndXJpbmcgdGhlIHBpbnMuDQo+
ID4gKyAgICAgICAgIENvbmZpZ3VyYXRpb24gY2FuIGluY2x1ZGUgdGhlIG11eCBmdW5jdGlvbiB0
byBzZWxlY3Qgb24gdGhvc2UNCj4gPiArICAgICAgICAgcGluKHMpL2dyb3VwKHMpLCBhbmQgdmFy
aW91cyBwaW4gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzDQo+ID4gKyAgICAgICAgIHN1Y2ggYXMg
cHVsbC11cCwgc2xldyByYXRlLCBldGMuDQo+IA0KPiBNaXNzZWQgbW9kdWxlIG5hbWUuDQpJcyB0
aGlzIChtb2R1bGUgbmFtZSkgYSBjb25maWd1cmF0aW9uIG9wdGlvbiBpbiBLY29uZmlnPw0KPiAN
Cj4gLi4uDQo+IA0KPiA+ICsvKg0KPiA+ICsgKiBaeW5xTVAgcGluIGNvbnRyb2xsZXINCj4gPiAr
ICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIwIFhpbGlueCwgSW5jLg0KPiANCj4gMjAyMT8N
CkNvdXBsZSBvZiB2ZXJzaW9ucyBmb3IgdGhpcyBwYXRjaCBzZXJpZXMgc2VudCBpbiAyMDIwLCBo
ZW5jZSBtYWludGFpbmluZw0KdGhlIHNhbWUuDQpJcyBpdCBsaWtlIHdlIG1haW50YWluIHRoZSB5
ZWFyIHdoZW4gdGhpcyBwYXRjaCBzZXJpZXMgaXMgYXBwbGllZCwgd2hpY2ggaXMNCjIwMjE/DQo+
IA0KPiA+ICsgKg0KPiA+ICsgKiBTYWkgS3Jpc2huYSBQb3R0aHVyaSA8bGFrc2htaS5zYWkua3Jp
c2huYS5wb3R0aHVyaUB4aWxpbnguY29tPg0KPiA+ICsgKiBSYWphbiBWYWphIDxyYWphbi52YWph
QHhpbGlueC5jb20+ICovDQo+IA0KPiAuLi4NCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4
L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvZmlybXdhcmUveGxueC16eW5xbXAuaD4NCj4gDQo+IC4uLg0K
PiANCj4gPiArc3RhdGljIGludCB6eW5xbXBfcGluY29uZl9jZmdfZ2V0KHN0cnVjdCBwaW5jdHJs
X2RldiAqcGN0bGRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IHBpbiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyAqY29uZmlnKQ0KPiA+ICt7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgYXJn
LCBwYXJhbSA9IHBpbmNvbmZfdG9fY29uZmlnX3BhcmFtKCpjb25maWcpOw0KPiA+ICsgICAgICAg
aW50IHJldDsNCj4gDQo+ID4gKyAgICAgICBpZiAocGluID49IHp5bnFtcF9kZXNjLm5waW5zKQ0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+IA0KPiBJcyBpdCBwb3Nz
aWJsZT8NClRoaXMgaXMgYSBzYWZlIGNoZWNrLg0KUGluIGluZm9ybWF0aW9uIHdpbGwgZ2V0IGZy
b20gZHQgZmlsZXMvWGlsaW54IGZpcm13YXJlIChxdWVyeSBwaW4gaW5mb3JtYXRpb24NCmZvciBh
IGdyb3VwKS91c2VyIGFwcGxpY2F0aW9uIGFuZCB0aGVyZSBhcmUgY2hhbmNlcyBvZiBnZXR0aW5n
IHdyb25nIHBpbi4NCj4gDQo+ID4gKyAgICAgICBzd2l0Y2ggKHBhcmFtKSB7DQo+ID4gKyAgICAg
ICBjYXNlIFBJTl9DT05GSUdfU0xFV19SQVRFOg0KPiA+ICsgICAgICAgICAgICAgICBwYXJhbSA9
IFBNX1BJTkNUUkxfQ09ORklHX1NMRVdfUkFURTsNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0g
enlucW1wX3BtX3BpbmN0cmxfZ2V0X2NvbmZpZyhwaW4sIHBhcmFtLCAmYXJnKTsNCj4gPiArICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICBjYXNlIFBJTl9DT05GSUdfQklBU19QVUxM
X1VQOg0KPiA+ICsgICAgICAgICAgICAgICBwYXJhbSA9IFBNX1BJTkNUUkxfQ09ORklHX1BVTExf
Q1RSTDsNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHp5bnFtcF9wbV9waW5jdHJsX2dl
dF9jb25maWcocGluLCBwYXJhbSwgJmFyZyk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChhcmcg
IT0gUE1fUElOQ1RSTF9CSUFTX1BVTExfVVApDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBFcnJvciBjb2RlIGJlaW5nIHNoYWRvd2VkLiBJbnN0ZWFk
IGNoZWNrIGl0IGhlcmUgcHJvcGVybHkuDQpBcmUgeW91IG1lbnRpb25pbmcgdGhlIGNhc2Ugd2hl
cmUgcmV0IGlzIGFsc28gYSBub24temVybz8NCklmIHllcywgdGhlbiBJIHdpbGwgdXBkYXRlIHRo
aXMgY2hlY2sgdG8gDQppZiAoIXJldCAmJiBhcmcgIT0gUE1fUElOQ1RSTF9CSUFTX1BVTExfVVAp
DQoJcmV0dXJuIC1FSU5WQUw7DQpyZXQgbm9uLXplcm8gY2FzZSwgd2UgYXJlIGhhbmRsaW5nIGF0
IHRoZSBlbmQgb2Ygc3dpdGNoIGNhc2UuDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBhcmcgPSAx
Ow0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNhc2UgUElOX0NPTkZJ
R19CSUFTX1BVTExfRE9XTjoNCj4gPiArICAgICAgICAgICAgICAgcGFyYW0gPSBQTV9QSU5DVFJM
X0NPTkZJR19QVUxMX0NUUkw7DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHp5bnFtcF9wbV9w
aW5jdHJsX2dldF9jb25maWcocGluLCBwYXJhbSwgJmFyZyk7DQo+ID4gKyAgICAgICAgICAgICAg
IGlmIChhcmcgIT0gUE1fUElOQ1RSTF9CSUFTX1BVTExfRE9XTikNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IERpdHRvLg0KU2FtZSBhcyBhYm92ZS4N
Cj4gDQo+ID4gKyAgICAgICAgICAgICAgIGFyZyA9IDE7DQo+ID4gKyAgICAgICAgICAgICAgIGJy
ZWFrOw0KPiA+ICsgICAgICAgY2FzZSBQSU5fQ09ORklHX0JJQVNfRElTQUJMRToNCj4gPiArICAg
ICAgICAgICAgICAgcGFyYW0gPSBQTV9QSU5DVFJMX0NPTkZJR19CSUFTX1NUQVRVUzsNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0ID0genlucW1wX3BtX3BpbmN0cmxfZ2V0X2NvbmZpZyhwaW4sIHBh
cmFtLCAmYXJnKTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGFyZyAhPSBQTV9QSU5DVFJMX0JJ
QVNfRElTQUJMRSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gDQo+IERpdHRvLg0KU2FtZSBhcyBhYm92ZS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGFy
ZyA9IDE7DQo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgY2FzZSBQSU5f
Q09ORklHX1BPV0VSX1NPVVJDRToNCj4gPiArICAgICAgICAgICAgICAgcGFyYW0gPSBQTV9QSU5D
VFJMX0NPTkZJR19WT0xUQUdFX1NUQVRVUzsNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0genlu
cW1wX3BtX3BpbmN0cmxfZ2V0X2NvbmZpZyhwaW4sIHBhcmFtLCAmYXJnKTsNCj4gPiArICAgICAg
ICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICBjYXNlIFBJTl9DT05GSUdfSU5QVVRfU0NITUlU
VF9FTkFCTEU6DQo+ID4gKyAgICAgICAgICAgICAgIHBhcmFtID0gUE1fUElOQ1RSTF9DT05GSUdf
U0NITUlUVF9DTU9TOw0KPiA+ICsgICAgICAgICAgICAgICByZXQgPSB6eW5xbXBfcG1fcGluY3Ry
bF9nZXRfY29uZmlnKHBpbiwgcGFyYW0sICZhcmcpOw0KPiA+ICsgICAgICAgICAgICAgICBicmVh
azsNCj4gPiArICAgICAgIGNhc2UgUElOX0NPTkZJR19EUklWRV9TVFJFTkdUSDoNCj4gPiArICAg
ICAgICAgICAgICAgcGFyYW0gPSBQTV9QSU5DVFJMX0NPTkZJR19EUklWRV9TVFJFTkdUSDsNCj4g
PiArICAgICAgICAgICAgICAgcmV0ID0genlucW1wX3BtX3BpbmN0cmxfZ2V0X2NvbmZpZyhwaW4s
IHBhcmFtLCAmYXJnKTsNCj4gPiArICAgICAgICAgICAgICAgc3dpdGNoIChhcmcpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgY2FzZSBQTV9QSU5DVFJMX0RSSVZFX1NUUkVOR1RIXzJNQToNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBhcmcgPSBEUklWRV9TVFJFTkdUSF8yTUE7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICAgIGNhc2UgUE1f
UElOQ1RSTF9EUklWRV9TVFJFTkdUSF80TUE6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
YXJnID0gRFJJVkVfU1RSRU5HVEhfNE1BOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOw0KPiA+ICsgICAgICAgICAgICAgICBjYXNlIFBNX1BJTkNUUkxfRFJJVkVfU1RSRU5HVEhf
OE1BOg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFyZyA9IERSSVZFX1NUUkVOR1RIXzhN
QTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAg
ICAgY2FzZSBQTV9QSU5DVFJMX0RSSVZFX1NUUkVOR1RIXzEyTUE6DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYXJnID0gRFJJVkVfU1RSRU5HVEhfMTJNQTsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgZGVmYXVsdDoNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAvKiBJbnZhbGlkIGRyaXZlIHN0cmVuZ3RoICovDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X3dhcm4ocGN0bGRldi0+ZGV2LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJJbnZhbGlkIGRyaXZlIHN0cmVuZ3RoIGZvciBwaW4g
JWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGluKTsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAgICAgICAg
ICAgfQ0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGRlZmF1bHQ6DQo+
ID4gKyAgICAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOw0KPiA+ICsgICAgICAgICAgICAg
ICBicmVhazsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpZiAocmV0KQ0KPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIHBhcmFtID0g
cGluY29uZl90b19jb25maWdfcGFyYW0oKmNvbmZpZyk7DQo+ID4gKyAgICAgICAqY29uZmlnID0g
cGluY29uZl90b19jb25maWdfcGFja2VkKHBhcmFtLCBhcmcpOw0KPiA+ICsNCj4gPiArICAgICAg
IHJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiAuLi4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+IA0KPiBJc24ndCBpdCBFTk9UU1VQIGZvciBhbGwg
Y2FzZXMgaGVyZT8NCkdpdmluZyAnT3BlcmF0aW9uIE5vdCBTdXBwb3J0ZWQgKEVPUE5PVFNVUFAp
JyBlcnJvciwgd2hlbg0KZHJpdmVyIGdldHMgYSByZXF1ZXN0IGZvciB1bnN1cHBvcnRlZCBwaW4g
b3IgY29uZmlndXJhdGlvbi4NCkNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB5b3VyIHF1ZXN0aW9u
IGlmIEkgZGlkbid0IGFuc3dlciBwcm9wZXJseS4NCj4gDQo+IC4uLg0KPiANCj4gPiArICAgICAg
IHJldCA9IHp5bnFtcF9wbV9xdWVyeV9kYXRhKHFkYXRhLCBwYXlsb2FkKTsNCj4gPiArICAgICAg
IGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgICAgKm5ncm91cHMgPSBwYXlsb2FkWzFdOw0KPiA+ICsNCj4gDQo+ID4gKyAgICAgICByZXR1
cm4gcmV0Ow0KPiANCj4gcmV0dXJuIDA7DQpJIHdpbGwgZml4Lg0KPiANCj4gLi4uDQo+IA0KPiA+
ICsgKiBRdWVyeSBmaXJtd2FyZSB0byBnZXQgZ3JvdXAgSURzIGZvciBlYWNoIGZ1bmN0aW9uLiBG
aXJtd2FyZSByZXR1cm5zDQo+ID4gKyAqIGdyb3VwIElEcy4gQmFzZWQgb24gZ3JvdXAgaW5kZXgg
Zm9yIHRoZSBmdW5jdGlvbiwgZ3JvdXAgbmFtZXMgaW4NCj4gDQo+IG9uIHRoZSBncm91cA0KPiAN
Cj4gPiArICogdGhlIGZ1bmN0aW9uIGFyZSBzdG9yZWQuIEZvciBleGFtcGxlLCB0aGUgZmlyc3Qg
Z3JvdXAgaW4gImV0aDAiIGZ1bmN0aW9uDQo+ID4gKyAqIGlzIG5hbWVkIGFzICJldGgwXzAiIGFu
ZCBzZWNvbmQgZ3JvdXAgYXMgImV0aDBfMSIgYW5kIHNvIG9uLg0KPiANCj4gYW5kIHRoZSBzZWNv
bmQNCj4gDQo+ID4gKyAqDQo+ID4gKyAqIEJhc2VkIG9uIHRoZSBncm91cCBJRCByZWNlaXZlZCBm
cm9tIHRoZSBmaXJtd2FyZSwgZnVuY3Rpb24gc3RvcmVzDQo+IG5hbWUgb2YNCj4gPiArICogdGhl
IGdyb3VwIGZvciB0aGF0IGdyb3VwIElELiBGb3IgZXhhbXBsZSwgaWYgImV0aDAiIGZpcnN0IGdy
b3VwIElEDQo+ID4gKyAqIGlzIHgsIGdyb3Vwc1t4XSBuYW1lIHdpbGwgYmUgc3RvcmVkIGFzICJl
dGgwXzAiLg0KPiA+ICsgKg0KPiA+ICsgKiBPbmNlIGRvbmUgZm9yIGVhY2ggZnVuY3Rpb24sIGVh
Y2ggZnVuY3Rpb24gd291bGQgaGF2ZSBpdHMgZ3JvdXAgbmFtZXMNCj4gPiArICogYW5kIGVhY2gg
Z3JvdXBzIHdvdWxkIGFsc28gaGF2ZSB0aGVpciBuYW1lcy4NCj4gDQo+IGVhY2ggZ3JvdXANCkkg
d2lsbCBmaXggYWxsIHRoZSBhYm92ZS4NCj4gDQo+IC4uLg0KPiANCj4gPiArZG9uZToNCj4gPiAr
ICAgICAgIGZ1bmMtPmdyb3VwcyA9IGZncm91cHM7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJu
IHJldDsNCj4gDQo+IHJldHVybiAwOyA/DQo+IA0KPiAuLi4NCj4gDQo+ID4gKyAgICAgICAqbmZ1
bmNzID0gcGF5bG9hZFsxXTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4g
RGl0dG8uDQo+IA0KPiAuLi4NCj4gDQo+ID4gKyAgICAgICByZXQgPSB6eW5xbXBfcG1fcXVlcnlf
ZGF0YShxZGF0YSwgcGF5bG9hZCk7DQo+ID4gKyAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIG1lbWNweShncm91cHMsICZw
YXlsb2FkWzFdLA0KPiBQSU5DVFJMX0dFVF9QSU5fR1JPVVBTX1JFU1BfTEVOKTsNCj4gPiArDQo+
ID4gKyAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gRGl0dG8uDQo+IA0KPiAuLi4NCj4gDQo+ID4g
KyAqIFF1ZXJ5IGZpcm13YXJlIHRvIGdldCBncm91cHMgYXZhaWxhYmxlIGZvciB0aGUgZ2l2ZW4g
cGluLg0KPiA+ICsgKiBCYXNlZCBvbiB0aGUgZmlybXdhcmUgcmVzcG9uc2UoZ3JvdXAgSURzIGZv
ciB0aGUgcGluKSwgYWRkDQo+ID4gKyAqIHBpbiBudW1iZXIgdG8gdGhlIHJlc3BlY3RpdmUgZ3Jv
dXAncyBwaW4gYXJyYXkuDQo+ID4gKyAqDQo+ID4gKyAqIE9uY2UgYWxsIHBpbnMgYXJlIHF1ZXJp
ZXMsIGVhY2ggZ3JvdXBzIHdvdWxkIGhhdmUgaXRzIG51bWJlcg0KPiANCj4gZWFjaCBncm91cA0K
PiANCj4gPiArICogb2YgcGlucyBhbmQgcGluIG51bWJlcnMgZGF0YS4NCj4gDQo+IC4uLg0KPiAN
Cj4gPiArICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiByZXR1cm4gMDsNCj4gDQo+IC4uLg0KPiAN
Cj4gPiArICogUXVlcnkgbnVtYmVyIG9mIGZ1bmN0aW9ucyBhbmQgbnVtYmVyIG9mIGZ1bmN0aW9u
IGdyb3VwcyAobnVtYmVyDQo+ID4gKyAqIG9mIGdyb3VwcyBpbiBnaXZlbiBmdW5jdGlvbikgdG8g
YWxsb2NhdGUgcmVxdWlyZWQgbWVtb3J5IGJ1ZmZlcnMNCj4gDQo+IGluIHRoZSBnaXZlbg0KPiAN
Cj4gPiArICogZm9yIGZ1bmN0aW9ucyBhbmQgZ3JvdXBzLiBPbmNlIGJ1ZmZlcnMgYXJlIGFsbG9j
YXRlZCB0byBzdG9yZQ0KPiA+ICsgKiBmdW5jdGlvbnMgYW5kIGdyb3VwcyBkYXRhLCBxdWVyeSBh
bmQgc3RvcmUgcmVxdWlyZWQgaW5mb3JtYXRpb24NCj4gPiArICogKG51bWJlciBvZiBncm91cHMg
YW5kIGdyb3VwIG5hbWVzIGZvciBlYWNoIGZ1bmN0aW9uLCBudW1iZXIgb2YNCj4gPiArICogcGlu
cyBhbmQgcGluIG51bWJlcnMgZm9yIGVhY2ggZ3JvdXApLg0KPiANCj4gLi4uDQo+IA0KPiA+ICsg
ICAgICAgcGN0cmwtPmZ1bmNzID0gZnVuY3M7DQo+ID4gKyAgICAgICBwY3RybC0+Z3JvdXBzID0g
Z3JvdXBzOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiByZXR1cm4gMDsN
Cj4gDQo+IC4uLg0KPiANCj4gPiArICAgICAgICpucGlucyA9IHBheWxvYWRbMV07DQo+ID4gKw0K
PiA+ICsgICAgICAgcmV0dXJuIHJldDsNCj4gDQo+IERpdHRvLg0KSSB3aWxsIGZpeCBhbGwgdGhl
IGFib3ZlIHNpbWlsYXIgY29tbWVudHMuDQo+IA0KPiAuLi4NCj4gDQo+ID4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoJnBkZXYtPmRldiwgInBpbiBkZXNjIHByZXBhcmUgZmFpbCB3aXRoICVkXG4i
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCk7DQo+IA0KPiBPbmUgbGluZS4NCj4g
DQo+IC4uLg0KPiANCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiZnVu
Y3Rpb24gaW5mbyBwcmVwYXJlIGZhaWwgd2l0aCAlZFxuIiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQpOw0KPiANCj4gRGl0dG8uDQpJIHdpbGwgZml4IGFsbC4NCj4gDQo+IC4uLg0K
PiANCj4gPiArICAgICAgIHBjdHJsLT5wY3RybCA9IHBpbmN0cmxfcmVnaXN0ZXIoJnp5bnFtcF9k
ZXNjLCAmcGRldi0+ZGV2LCBwY3RybCk7DQo+IA0KPiBkZXZtX3BpbmN0cmxfcmVnaXN0ZXIoKQ0K
SSB3aWxsIHVwZGF0ZS4NCj4gDQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKHBjdHJsLT5wY3RybCkp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBjdHJsLT5wY3RybCk7DQo+IA0K
PiAuLi4NCj4gDQo+ID4gK307DQo+IA0KPiA+ICsNCj4gDQo+IEV4dHJhIGJsYW5rIGxpbmUuDQo+
IA0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB6eW5xbXBfcGluY3RybF9vZl9tYXRjaCk7
DQo+IA0KPiAuLi4NCj4gDQo+ID4gK307DQo+IA0KPiA+ICsNCj4gDQo+IERpdHRvLg0KSSBzZWUg
c29tZSBkcml2ZXJzIGFyZSBtYWludGFpbmluZyB0aGUgZXh0cmEgbGluZSBpbiBhYm92ZSB0d28g
Y2FzZXMuDQpXZSBzaG91bGRuJ3QgbWFpbnRhaW4gZXh0cmEgbGluZSBhZnRlciBzdHJ1Y3QgZGVj
bGFyYXRpb24/DQoNClJlZ2FyZHMNClNhaSBLcmlzaG5hDQo+IA0KPiA+ICttb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKHp5bnFtcF9waW5jdHJsX2RyaXZlcik7DQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3Qg
UmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo=
