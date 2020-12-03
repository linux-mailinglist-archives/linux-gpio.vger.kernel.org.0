Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899B42CD0CF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 09:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgLCIII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 03:08:08 -0500
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:46625
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727957AbgLCIIH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Dec 2020 03:08:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxzEgTjlB4jvLdtdP8ELyNTvYaZWe2V23FWWQmBdQ6krEOcna8ZzL2rpYlgA/hd7WeoS5X4BZ+rHHUFBJDNra64Wpe1xL1jhAim7QqEOXwHNNLP9fv+gxXe4jTCmf+CWJ/YsssewWq1zdvaKDmgtWXk665QydfwVJ90qcDI1JrQgCtNwDR3PTNhvWSSM5I73p+EtC4Ee/XcCpwZTXiC/oSnUWcs5PCjXvYaqAvLHBhdP1gG8InJ6kxw4OguF2dnp+YI3F2EkJ1U3Tm+Lalbmz0HlXsiq86EXJSompwl6iLL+rfeeGledPI0NkgQF9Zq2JGxeq7jx6/0dGtT3gWn54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHVY/WxdrB87sNWTCSyanKDpm2owXPFi8/Ic0qszHjU=;
 b=TNemCobGyftholoqRvX8Km5q8u0oQV654KmLYC4+BuKDyOrADxk9VWEq/4GZEVp6bshUwLJMfhbZcXEIqTXpwRDNpQJ4vE/OppcByEyvda0iZRcN8rpBKxp6v2swufQKx5mdHeN9gHDGLJHizo/xZkV23zomfNxPuoFJyq7aldfhulkOx3Fsokigh/Ktc6i2zpHfnve037yYU0Pt9tXJRD422Os2IOABE6keETP1oqAhTMoORMpMOkRFKbiP2vA5yg7p7bemPwYTBfCDKDf0q8vX/ipnIz7hj7HXFL9UZgQGx+SQjqvbXzI6fc/C/mEEDzngVBJ/qA3cXvtPwKvujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHVY/WxdrB87sNWTCSyanKDpm2owXPFi8/Ic0qszHjU=;
 b=Aef9B8CmD13Ps4Yd3xQneucnwaTojHVhYk18nqDBxVd8aUxBMv3lWNMoTvIVcLvuhg5dbCZUratMn5yQlVjdDltMjI6XnddAyM9b6KDFpi93OndB7/HQhcvRQkgm8ob0PUilAEtZBiLaYG0Rx907j/nD6k/QecVy2yfEHdrVI/E=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR04MB3029.eurprd04.prod.outlook.com (2603:10a6:6:8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Thu, 3 Dec 2020 08:07:18 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3632.017; Thu, 3 Dec 2020
 08:07:18 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] gpio: mpc8xxx: resolve coverity warnings
Thread-Topic: [PATCH] gpio: mpc8xxx: resolve coverity warnings
Thread-Index: AQHWyUtRJ4BA1tNfTEyqCOWxdR0/wg==
Date:   Thu, 3 Dec 2020 08:07:17 +0000
Message-ID: <DB6PR0401MB243884BFCB97E719642385FA8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201203073910.20113-1-biwen.li@oss.nxp.com>
 <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
In-Reply-To: <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 854426d2-af56-4d7e-9ad5-08d8976273f7
x-ms-traffictypediagnostic: DB6PR04MB3029:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB30290BB1EB52CC742D72DEE6CEF20@DB6PR04MB3029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MiRum7h1r7peFYnFBOsVdLzcXy8dW7y5U5HN1zIdSGisf128TB5nv+MkpgOBh2M6ceNnFNcyzJkl5nX0cxEdYvYCMccy2k+A2WLDgU1zNg833sex20uBDd+ICWHmoLkEf0PO2WxiAFsNRTEalJqOFpVeWI+65Yw6yvjzBzsI8IHKzkbDsnNWBjYK+ol5x0USeL26fcyUaRsk/6BAeXQ7XIUsREKs176zl/J68OTlx5vnnVggpz8AP+7gm4kDFrH3FsJUZ0gIHm8cgF3dsRh5eKdnVjxHve//sRnqklLbRT3ZiY5oTX61DNz0gERhOLWVABULNpwVnbRuBTgt55uqhjZ05EJgrNJDeBcsvBFv2kJn+v6U/mcrxeDZoF+z0OzF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(86362001)(66476007)(52536014)(64756008)(66946007)(5660300002)(66556008)(66446008)(33656002)(54906003)(110136005)(316002)(7696005)(6506007)(53546011)(8936002)(71200400001)(8676002)(4326008)(83380400001)(26005)(76116006)(55016002)(9686003)(186003)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y21KOE1KdDEwam1HUEpHYjNWMWQwejhaeUx6Q3lsbHBMQTV4M3huNGppak5k?=
 =?utf-8?B?Qjd5dkNMWHR3VUFZbkN2SjI3TVB1ZFlMdTdGV1BqZCtjbDJnOTVLcjVNeU1D?=
 =?utf-8?B?b2RpejJUUDhtWnMxMklucUluT2ZpSTNkeEptd2ZMMlZkdHowZlhzL0hqaExu?=
 =?utf-8?B?RDRLZmw4Ujc3Zm5tdmU1VFhBMyt3TFB5elZBNjZUQ3BreHJycTlaY3pDc0pv?=
 =?utf-8?B?YzMwa01hckJRWXUyU1dWSVk4aG93MUNXd0V0VUhuWlJRQUhwQS9Mank0d1Vz?=
 =?utf-8?B?VjVxRHJ1cHcwNnlFZzFQRGpmRldxaG9oN3llR2l2YlFyd254aVRqdTBid1gz?=
 =?utf-8?B?M1pzUXVVWnBrV08rZi9KVExsamFpbUthVGJsY1lJcnZMZEgwWithcStHUVJF?=
 =?utf-8?B?N0VIZld6NXZpUjVqTkViRlNKQ2lja0g2T3UyQzE5MW5ia2x5Ym9zakFMdnFD?=
 =?utf-8?B?SERYNWlLZ0gyQ0JrbmxYRU1CNWlnNmwrVlhrWjlLUWhSSWlEOVZoRStpZ1FD?=
 =?utf-8?B?eFJMMlk5WHd1eUdNSmRRbHRFUUhKK0MyR0hZOElBMVBQd3dUOEx3UzgzbC8r?=
 =?utf-8?B?VThQZVR0d1FYV1pUY01wYkordUR3MU1haVpXZlBBeEkxUzVWQWVvcFlMbWQ4?=
 =?utf-8?B?WmI1Z0Z1KzBYb0l2OHZ2M051c2FkeDc5SU1Ec2swZjlTUjR3RFZvcGtxUHhT?=
 =?utf-8?B?c1pjNVkyWHBOOE5MT3EzVkRxSUtiZHJvUHB0cWZPSEkxbEJqaisxUkNjSHE2?=
 =?utf-8?B?M2tUenpiVS9Na3dtQi9vOGVwcDNPcjF3dkZOa0dSeHZGcWJzVGdpb3ZLcFIx?=
 =?utf-8?B?eERteEpMRnh3SmJVeTRqd3dYYmtTSEIrS0E5ejF4dTFralRqeHY1cmhGdXoz?=
 =?utf-8?B?eFM1bzN1NWRkTUlmWUJSTjdxVko1RDBsMS8veEp2ZFRURlcwcjFRSkxBU2o2?=
 =?utf-8?B?UWM0bTNtMm83a2ZyNkZiVEVCdlBGcHpzSDBXNWQxcy9aSFBheFVkVzk3cjlG?=
 =?utf-8?B?enYvRWVyZWd2V01aVlJWMU9iWHpmUXZWTEFmZHpnMFNVNmtDOWNhRC9KaXI4?=
 =?utf-8?B?L3VzdVFVREpoUktINVI2bVdMdlpncnVsdFo5ZHBqNXhCTFV3bEdtcTFtOWoy?=
 =?utf-8?B?czhJSFpRREQ4SUFXUFJhQmYwL1Z3K1hzV1pGVFlQNlFlTS9kWjVVWHVobFZH?=
 =?utf-8?B?dmdxdTN4ZjgyZktsV1pnbnlmcE54MTl5dnRLRWlQcGRwMG9IOVFDTnZWNEZM?=
 =?utf-8?B?SWRSU0VZR1VXWVJYamZBYzBMY2J2OHdaSCtTMFN5SUhMTXdFejBCeUVJUXBI?=
 =?utf-8?Q?UvNppCqGs+q4c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854426d2-af56-4d7e-9ad5-08d8976273f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 08:07:17.9621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q84aFDWcZEnWJXiq6QH1MmisjRbYRY2EKC/AnML+lDcOod6SyNfsgG5Uk4yjGBhkUb+l+d5iydq8Oe8FZuucfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3029
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBPbiBUaHUsIERlYyAzLCAyMDIwIGF0IDg6MzEgQU0gQml3ZW4gTGkgPGJpd2VuLmxpQG9zcy5u
eHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29t
Pg0KPiA+DQo+ID4gUmVzb2x2ZSBjb3Zlcml0eSB3YXJuaW5ncyBhcyBmb2xsb3dzLA0KPiA+ICAg
ICBjb25kX2F0X21vc3Q6IENoZWNraW5nIGdwaW8gPj0gMjhVIGltcGxpZXMgdGhhdCBncGlvIG1h
eSBiZSB1cA0KPiA+ICAgICB0byAyNyBvbiB0aGUgZmFsc2UgYnJhbmNoLg0KPiA+ICAgICBvdmVy
cnVuLWNhbGw6IE92ZXJydW5uaW5nIGNhbGxlZXMgYXJyYXkgb2Ygc2l6ZSAzIGJ5IHBhc3NpbmcN
Cj4gPiAgICAgYXJndW1lbnQgZ3BpbyAod2hpY2ggZXZhbHVhdGVzIHRvIDI3KQ0KPiA+ICAgICBp
biBjYWxsIHRvICptcGM4eHh4X2djLT5kaXJlY3Rpb25fb3V0cHV0DQo+ID4NCj4gPiAgICAgY29u
ZF9hdF9sZWFzdDogQ2hlY2tpbmcgZ3BpbyA8PSAzVSBpbXBsaWVzIHRoYXQgZ3BpbyBpcyBhdCBs
ZWFzdCA0IG9uDQo+ID4gICAgIHRoZSBmYWxzZSBicmFuY2guDQo+ID4gICAgIG92ZXJydW4tY2Fs
bDogT3ZlcnJ1bm5pbmcgY2FsbGVlJ3MgYXJyYXkgb2Ygc2l6ZSAzIGJ5IHBhc3NpbmcgYXJndW1l
bnQNCj4gPiAgICAgZ3BpbyAod2hpY2ggZXZhbHVhdGVzIHRvIDQpIGluIGNhbGwgdG8NCj4gPiAq
bXBjOHh4eF9nYy0+ZGlyZWN0aW9uX291dHB1dA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQml3
ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlv
LW1wYzh4eHguYyB8IDUgKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bp
by1tcGM4eHh4LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMNCj4gPiBpbmRleCBhNmMy
YmJkY2FhMTAuLjEyYzlhOTFkODdiNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bp
by1tcGM4eHh4LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMNCj4gPiBA
QCAtMyw2ICszLDcgQEANCj4gPiAgICoNCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDA4IFBldGVy
IEtvcnNnYWFyZCA8amFjbWV0QHN1bnNpdGUuZGs+DQo+ID4gICAqIENvcHlyaWdodCAoQykgMjAx
NiBGcmVlc2NhbGUgU2VtaWNvbmR1Y3RvciBJbmMuDQo+ID4gKyAqIENvcHlyaWdodCAyMDIwIE5Y
UA0KPiANCj4gQSBjb3B5cmlnaHQgbm90aWNlIG9uIGEgdHdvLWxpbmUgY2hhbmdlIGlzIGEgYml0
IHRvbyBtdWNoLCBkb24ndCB5b3UgdGhpbms/DQpPa2F5LCBnb3QgaXQuIFdpbGwgcmVtb3ZlIGl0
IGluIHYyLg0KPiANCj4gPiAgICoNCj4gPiAgICogVGhpcyBmaWxlIGlzIGxpY2Vuc2VkIHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4gPiAgICogdmVy
c2lvbiAyLiAgVGhpcyBwcm9ncmFtIGlzIGxpY2Vuc2VkICJhcyBpcyIgd2l0aG91dCBhbnkgd2Fy
cmFudHkNCj4gPiBvZiBhbnkgQEAgLTgwLDcgKzgxLDcgQEAgc3RhdGljIGludCBtcGM1MTIxX2dw
aW9fZGlyX291dChzdHJ1Y3QNCj4gPiBncGlvX2NoaXAgKmdjLCAgew0KPiA+ICAgICAgICAgc3Ry
dWN0IG1wYzh4eHhfZ3Bpb19jaGlwICptcGM4eHh4X2djID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2Mp
Ow0KPiA+ICAgICAgICAgLyogR1BJTyAyOC4uMzEgYXJlIGlucHV0IG9ubHkgb24gTVBDNTEyMSAq
Lw0KPiA+IC0gICAgICAgaWYgKGdwaW8gPj0gMjgpDQo+ID4gKyAgICAgICBpZiAoZ3BpbyA+PSAy
OFUpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gSSBkb24ndCBy
ZWFsbHkgdW5kZXJzdGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgYnV0IGxvb2tpbmcgYXQgdGhlIGNv
ZGUgaXMgZXZlbg0KPiBtb3JlIGNvbmZ1c2luZy4gV2hhdCBhcmUgeW91IGZpeGluZyBoZXJlIGFj
dHVhbGx5Pw0KVHJ5IHRvIGZpeCBjb2RlIHdhcm5pbmcgdGhhdCBnZW5lcmF0ZWQgYnkgY292ZXJp
dHkgc2NhbiB0b29sKHN0YXRpYyBjb2RlIGFuYWx5c2lzIHRvb2wpDQo+IA0KPiBCYXJ0b3N6DQo+
IA0KPiA+DQo+ID4gICAgICAgICByZXR1cm4gbXBjOHh4eF9nYy0+ZGlyZWN0aW9uX291dHB1dChn
YywgZ3BpbywgdmFsKTsgQEAgLTkxLDcNCj4gPiArOTIsNyBAQCBzdGF0aWMgaW50IG1wYzUxMjVf
Z3Bpb19kaXJfb3V0KHN0cnVjdCBncGlvX2NoaXAgKmdjLCAgew0KPiA+ICAgICAgICAgc3RydWN0
IG1wYzh4eHhfZ3Bpb19jaGlwICptcGM4eHh4X2djID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0K
PiA+ICAgICAgICAgLyogR1BJTyAwLi4zIGFyZSBpbnB1dCBvbmx5IG9uIE1QQzUxMjUgKi8NCj4g
PiAtICAgICAgIGlmIChncGlvIDw9IDMpDQo+ID4gKyAgICAgICBpZiAoZ3BpbyA8PSAzVSkNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiAgICAgICAgIHJldHVy
biBtcGM4eHh4X2djLT5kaXJlY3Rpb25fb3V0cHV0KGdjLCBncGlvLCB2YWwpOw0KPiA+IC0tDQo+
ID4gMi4xNy4xDQo+ID4NCg==
