Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C411FCEB9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgFQNnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 09:43:42 -0400
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:47809
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgFQNnm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 09:43:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajM+HrqWLvS9qVmLxExrdDokwKKBwm7wvLjHjqqkzQKrcMkNHXjKqYw6W8N3d95qB2VN01Er58TlM1SYn+ZgceWQSo8RGwiaZGluGgwta1d4FgKQ1/a5V777CLYky0d/8NXi5Ll+UfcYvV7Sg1HsmqWnDLuaGl6JVZMSPkbNZsoqRrWbHM6oH+XgvV/XqyreDj+lXOEi1IT1pxB2ijQPDfwXYqkMRxSPny5ff2Ugl3z1uSnr2SV7aXYg21p3p26OroEtKTC0dX+aj7gbjcIUxTKAU7vBMSYkHhj7huhZdFQaV3+ynwW4Jfm4/dB3G1KnpVzX2eQYDQAeAVem7UmMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGUUtIu2ym3wcL5yqgPDLZZTiGR/N32oAiER5pCp4Qg=;
 b=en6Vo+LXAHSKQMQkFcjZDBI7j6XqQSfRgYu7Iy4WBko6MgZGkmXOtPetHI96UY8hQMuWwE3GpQ3/G/X05JOswcEL2s4cM3/hO34XfwefIk2L2DePn/BTSbW34ngj2oeaDvuPnvGut49mjL+rvAXoQNENiBmKmauvqW5pXGApR9Zx56yLiiWQAoXH41l+SaPPXiH7Cnj8G+z9ayoFeDVQpHgOKkkRZfD7yZGcECBQBVdOvKwj1CkkrjsNj5HdhFgNuaopwnOj6KbarOGqr8LssHrsNDg/aUEY7JQAzcd7JF1TVrbE0/5zCokOrd1aobEm2d5YrIswU3q0WOtyhwt6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGUUtIu2ym3wcL5yqgPDLZZTiGR/N32oAiER5pCp4Qg=;
 b=RkfJyA/qXLHeR78/J7y1PcB5uAs+fcAoLDwsBAvdMiwaoM3pc+wkzDStHd1tf+brZnigyi7U0ZB34WsFsSfJhvQ8yQBrGqsuEg2vxwja6REPAICRreY58RO14XOYocURqYzapJlj44GYek0hTFYnpvqEB4dy1lFoBEBJS3YY2Vg=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3675.eurprd04.prod.outlook.com (2603:10a6:8:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Wed, 17 Jun
 2020 13:43:36 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:43:36 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Topic: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Index: AQHWP+XeJP9OTzRQzUu8oLCGsNFyaKja/seAgAAQIUCAARffAIAAA42QgAB6UQCAADSjcA==
Date:   Wed, 17 Jun 2020 13:43:36 +0000
Message-ID: <DB3PR0402MB39160988A5AEBF0DBEA4A49EF59A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
 <1591875295-19427-2-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB4966C661D52B43E6938FCBF4809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916610502199D90B4BFC5E3F59D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM6PR04MB49661AA8A25B73D04FFF6769809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <DB3PR0402MB391687D9A9CFAAAEB3E4F236F59A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM6PR04MB4966243E1116C43C595CDD47809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966243E1116C43C595CDD47809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.13.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bff3c55-6103-4290-3cbb-08d812c46f6d
x-ms-traffictypediagnostic: DB3PR0402MB3675:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB36751DD3181E9769242FF9C1F59A0@DB3PR0402MB3675.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3bejludNUrISYHerANepM5+sRj7MBceR+KgBuY4N6tLHNS0550ANmcpXkEUpgwbZoiOR19yllkR8B9My64tOkCIS+BstH/LBUN5RCFPVkdnQP8R8UV0z0dAWmTi/VPcXPLTjS2n8pVQkHJvFVd1m7+gYfi3k168Xer8EEV7pC5nmAim8UZOIKPL3wPiNlcxh4ZyRX0dgphWZJumkGvrfTZVt/72BVAgY1q5Z2VgREylCWKT1KReISuwKQPmR3nE3O7Q/H8k3EYPoCqw074ZBP4wviC44Fkb+YSL8Si7iDOhK3ZM+/1tL37hj5J+ORcH/wfqjDPVSATHofFtosxy4aE5pBHMNThRj18gWUIoBzqzR7Eg/v/jaddDe9b1WgAI8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(5660300002)(76116006)(64756008)(66446008)(66946007)(186003)(66556008)(66476007)(8936002)(478600001)(26005)(8676002)(33656002)(110136005)(2906002)(316002)(71200400001)(4326008)(9686003)(44832011)(7696005)(52536014)(86362001)(6506007)(55016002)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9E/LI2LvUpwAZ8aTFPceWJ2ABk6jgcS/yX/ODT+rmCQ8HIwLDJFyoRWAFJDhGk2UFje1ang0kCPstC5PelOXPEVsaOHt7xZPf9nzTjRSgiWDB0cMsPAGVrXK3WvUWgUdH3le6hDOyhd4IJCEMjumeBkaIasr34AQPWdBNSHd1s7AxBeiO8x5A1o6akacbEJVvjhoCJ+z3IU4lJbiLB5cZRhs3oIfyOirLOq9/aUD5qiKrYTJn3G2EoybhPZ00ttLAyk4+suM1eC6DQ78y6m+G9S4+aXBGQbmJagxPOCtwL/ylE2JMjrY49TJXL5yS8MfMJSkbpdy8OIJmIFtYRaz2T99uEC6QvD+r/0ikSg66BKc5OtWHiU+MWGi8Rdil+YBIPW44/gP2c9lQxdk0GeKWVCuNm6rGBJbJXnxHHCWRiLmVSiD1baItzsavMmyzRIVf2qZc6R1Mni8iXOmCpF+wYBGeN/Q0G+CGdPSbjNvIYJ6UnwVnW777oaTcd0zvjLL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bff3c55-6103-4290-3cbb-08d812c46f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 13:43:36.4805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxZk1eed6u5coPf9PcBSD++2F9ePAfNUUHlfX5o0a9/x4VU8DnunylKBKe0sMpOtZNnCWerdZ9Ch6EivRBCqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3675
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCBWNSAxLzldIHBpbmN0cmw6IGlteDogU3VwcG9ydCBi
dWlsZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiBbLi4uXQ0KPiAN
Cj4gPiA+ID4gPiA+IC0gKiBAZGV2OiBhIHBvaW50ZXIgYmFjayB0byBjb250YWluaW5nIGRldmlj
ZQ0KPiA+ID4gPiA+ID4gLSAqIEBiYXNlOiB0aGUgb2Zmc2V0IHRvIHRoZSBjb250cm9sbGVyIGlu
IHZpcnR1YWwgbWVtb3J5DQo+ID4gPiA+ID4gPiAtICovDQo+ID4gPiA+ID4gPiAtc3RydWN0IGlt
eF9waW5jdHJsIHsNCj4gPiA+ID4gPiA+IC0Jc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ID4gPiA+
ID4gLQlzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGw7DQo+ID4gPiA+ID4gPiAtCXZvaWQgX19pb21l
bSAqYmFzZTsNCj4gPiA+ID4gPiA+IC0Jdm9pZCBfX2lvbWVtICppbnB1dF9zZWxfYmFzZTsNCj4g
PiA+ID4gPiA+IC0JY29uc3Qgc3RydWN0IGlteF9waW5jdHJsX3NvY19pbmZvICppbmZvOw0KPiA+
ID4gPiA+ID4gLQlzdHJ1Y3QgaW14X3Bpbl9yZWcgKnBpbl9yZWdzOw0KPiA+ID4gPiA+ID4gLQl1
bnNpZ25lZCBpbnQgZ3JvdXBfaW5kZXg7DQo+ID4gPiA+ID4gPiAtCXN0cnVjdCBtdXRleCBtdXRl
eDsNCj4gPiA+ID4gPiA+ICsJaW50ICgqaW14X3BpbmNvbmZfZ2V0KShzdHJ1Y3QgcGluY3RybF9k
ZXYgKnBjdGxkZXYsIHVuc2lnbmVkDQo+ID4gPiA+ID4gPiAraW50DQo+ID4gPiBwaW5faWQsDQo+
ID4gPiA+ID4gPiArCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKmNvbmZpZyk7DQo+ID4gPiA+ID4g
PiArCWludCAoKmlteF9waW5jb25mX3NldCkoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LCB1
bnNpZ25lZA0KPiA+ID4gPiA+ID4gK2ludA0KPiA+ID4gcGluX2lkLA0KPiA+ID4gPiA+ID4gKwkJ
CSAgICAgICB1bnNpZ25lZCBsb25nICpjb25maWdzLCB1bnNpZ25lZCBpbnQNCj4gbnVtX2NvbmZp
Z3MpOw0KPiA+ID4gPiA+ID4gKwl2b2lkICgqaW14X3BpbmN0cmxfcGFyc2VfcGluKShzdHJ1Y3Qg
aW14X3BpbmN0cmwgKmlwY3RsLA0KPiA+ID4gPiA+ID4gKwkJCQkgICAgICB1bnNpZ25lZCBpbnQg
KnBpbl9pZCwgc3RydWN0IGlteF9waW4gKnBpbiwNCj4gPiA+ID4gPiA+ICsJCQkJICAgICAgY29u
c3QgX19iZTMyICoqbGlzdF9wKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IENvbXBhcmVkIHdpdGgg
VjQsIHRoaXMgbmV3IGltcGxlbWVudGF0aW9uIHNlZW1zIGEgYml0IGNvbXBsaWNhdGVkLg0KPiA+
ID4gPiA+IEkgZ3Vlc3Mgd2UgZG9uJ3QgaGF2ZSB0byBzdXBwb3J0IFBJTkNUUkxfSU1YPXkgJiYN
Cj4gPiA+ID4gPiBQSU5DVFJMX0lNWF9TQ1U9bSBjYXNlLg0KPiA+ID4gPiA+IFdpbGwgdGhhdCBt
YWtlIHRoZSBzdXBwb3J0IGEgYml0IGVhc2llcj8NCj4gPiA+ID4NCj4gPiA+ID4gSSBhbSBOT1Qg
c3VyZSBpZiBzdWNoIHNjZW5hcmlvIG1lZXRzIHJlcXVpcmVtZW50LCB0aGUgZmFjdCBpcw0KPiA+
ID4gPiBvdGhlciBub24taS5NWCBTb0MgYWxzbyBzZWxlY3RzIHRoZSBQSU5DVFJMX0lNWCB3aGlj
aCB3aWxsIG1ha2UNCj4gPiA+ID4gUElOQ1RSTF9JTVg9eSwgc28gaW4gdGhhdCBjYXNlLCBldmVu
IGFsbCBpLk1YIFBJTkNUUkwgZHJpdmVycyBhcmUNCj4gPiA+ID4gc2V0IHRvIG1vZHVsZSwgaXQg
d2lsbCBzdGlsbCBoYXZlIFBJTkNUUkxfSU1YPXkgYW5kDQo+ID4gPiA+IFBJTkNUUkxfSU1YX1ND
VT1tLCB0aGVuIGJ1aWxkIHdpbGwgZmFpbC4gQW5kIEkgYmVsaWV2ZSB0aGUgYXV0bw0KPiA+ID4g
PiBidWlsZCB0ZXN0IG1heSBhbHNvIGNvdmVyIHN1Y2ggY2FzZSBhbmQgYnVpbGQgZXJyb3Igd2ls
bCBiZQ0KPiA+ID4gPiByZXBvcnRlZCwgdGhhdCBpcyB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVlZGVk
IGFuZCB3aXRoIHRoaXMgY2hhbmdlLA0KPiA+ID4gPiBmdW5jdGlvbiBpcyBOT1QgaW1wYWN0ZWQs
DQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSXMgaXQgcG9zc2libGUgdG8gYWRkIHNvbWUgY29uc3Ry
YWluc3QgdG8gbWFrZSBzdXJlIFBJTkNUUkxfSU1YX1NDVQ0KPiA+ID4gdmFsdWUgaXMgdGhlIHNh
bWUgYXMgUElOQ1RSTF9JTVg/IE9yIGNvbWJpbmUgdGhlbSBpbnRvIG9uZT8NCj4gPiA+IElmIHdl
IGNhbiBkbyB0aGF0LCBpdCBtYXkgZWFzZSB0aGUgaW1wbGVtZW50YXRpb24gYSBsb3QgYW5kIG1h
a2UgdGhlDQo+ID4gPiBjb2RlIHN0aWxsIGNsZWFuLg0KPiA+DQo+ID4gQ29tYmluZSBQSU5DVFJM
X0lNWF9TQ1UgYW5kIFBJTkNUUkxfSU1YIGlzIE5PVCBtYWtpbmcgc2Vuc2UsIHNpbmNlDQo+IGZv
cg0KPiA+IG5vbi1TQ1UgcGxhdGZvcm1zLCBQSU5DVFJMX0lNWF9TQ1UgaXMgTk9UIG5lY2Vzc2Fy
eSwgdG8gbWFrZQ0KPiA+IFBJTkNUUkxfSU1YX1NDVSBzYW1lIHZhbHVlIGFzIFBJTkNUUkxfSU1Y
LCB1bmxlc3MgbWFrZSAic2VsZWN0DQo+ID4gUElOQ1RSTF9JTVhfU0NVIiBpbiBQSU5DVFJMX0lN
WCwgYnV0IHRoYXQgaXMgYWxzbyBOT1QgbWFraW5nIHNlbnNlLA0KPiA+IGJlY2F1c2UsIFBJTkNU
UkxfSU1YIGRvZXMgTk9UIGRlcGVuZHMgb24gUElOQ1RSTF9JTVhfU0NVIGF0IGFsbC4NCj4gPg0K
PiANCj4gUElOQ1RSTF9JTVhfU0NVIGNvdWxkIGJlIGNvbmRpdGlvbmFsbHkgY29tcGlsZWQuDQo+
IFNvbWV0aGluZyBsaWtlIGZvbGxvd3M6DQo+IG9iai0kKENPTkZJR19QSU5DVFJMX0lNWCkgKz0g
cGluY3RybC1pbXgtY29yZS5vIHBpbmN0cmwtaW14LWNvcmUteSA6PQ0KPiBwaW5jdHJsLWlteC5v
DQo+IHBpbmN0cmwtaW14LWNvcmUtJChDT05GSUdfUElOQ1RSTF9JTVhfU0NVKSArPSBwaW5jdHJs
LXNjdS5vDQo+IA0KPiBDYW4geW91IHRyeSBpZiB0aGlzIHdheSBjb3VsZCB3b3JrPw0KDQpJdCBk
b2VzIE5PVyB3b3JrLCB3aGVuIFBJTkNUUkxfSU1YPXkgYW5kIFBJTkNUUkxfSU1YX1NDVT1tLCBj
b25maWcgYXMgYmVsb3csDQpidWlsZCB3aWxsIGZhaWxlZCBiZWNhdXNlIHNvbWUgU0NVIGZ1bmN0
aW9ucyBOT1QgaW1wbGVtZW50ZWQsIHRoaXMgaXMgdGhlIGV4YWN0IHJlYXNvbg0Kd2h5IGhhdmUg
dG8gdXNlIGZ1bmN0aW9uIGNhbGxiYWNrLiBDdXJyZW50bHksIHdoZW4gUElOQ1RSTF9JTVg9eSwg
UElOQ1RSTF9JTVhfU0NVDQpNVVNUIGJlID15LCBidXQgdGhhdCBpcyBOT1QgbWFraW5nIGVub3Vn
aCBzZW5zZSBmb3IgaS5NWDhNIFNvQ3M6DQoNCiBDT05GSUdfUElOQ1RSTF9JTVg9eQ0KIENPTkZJ
R19QSU5DVFJMX0lNWF9TQ1U9bQ0KIENPTkZJR19QSU5DVFJMX0lNWDhNTT15DQogQ09ORklHX1BJ
TkNUUkxfSU1YOE1OPW0NCiBDT05GSUdfUElOQ1RSTF9JTVg4TVA9bQ0KIENPTkZJR19QSU5DVFJM
X0lNWDhNUT1tDQoNCmFhcmNoNjQtcG9reS1saW51eC1sZDogZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9waW5jdHJsLWlteC5vOiBpbiBmdW5jdGlvbiBgaW14X3BpbmNvbmZfZGJnX3Nob3cnOg0K
L2hvbWUvYjIwNzg4L3dvcmtzcGFjZS9zdGFzaC9saW51eC1uZXh0L2RyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1pbXguYzo0NDQ6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlteF9w
aW5jb25mX2dldF9zY3UnDQphYXJjaDY0LXBva3ktbGludXgtbGQ6IGRyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1pbXgubzogaW4gZnVuY3Rpb24gYGlteF9waW5jb25mX2dldCc6DQov
aG9tZS9iMjA3ODgvd29ya3NwYWNlL3N0YXNoL2xpbnV4LW5leHQvZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteC5jOjM3NzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW14X3Bp
bmNvbmZfZ2V0X3NjdScNCmFhcmNoNjQtcG9reS1saW51eC1sZDogZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteC5vOiBpbiBmdW5jdGlvbiBgaW14X3BpbmNvbmZfc2V0JzoNCi9o
b21lL2IyMDc4OC93b3Jrc3BhY2Uvc3Rhc2gvbGludXgtbmV4dC9kcml2ZXJzL3BpbmN0cmwvZnJl
ZXNjYWxlL3BpbmN0cmwtaW14LmM6NDI3OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbXhfcGlu
Y29uZl9zZXRfc2N1Jw0KYWFyY2g2NC1wb2t5LWxpbnV4LWxkOiBkcml2ZXJzL3BpbmN0cmwvZnJl
ZXNjYWxlL3BpbmN0cmwtaW14Lm86IGluIGZ1bmN0aW9uIGBpbXhfcGluY3RybF9wYXJzZV9ncm91
cHMnOg0KL2hvbWUvYjIwNzg4L3dvcmtzcGFjZS9zdGFzaC9saW51eC1uZXh0L2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYzo2MzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGlteF9waW5jdHJsX3BhcnNlX3Bpbl9zY3UnDQoNCkFuc29uDQo=
