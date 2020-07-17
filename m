Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054D3223831
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 11:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGQJWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 05:22:41 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:45153
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbgGQJWk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 05:22:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgqDvVHgJJE0sPzuezsbXheiucwbEEPj0t0+iWnU2tWAHnAmXJukplk4SaW9I4fdjuEKnqTaqHGLcDP+UAdQ4p+S9dilK86+81SbX5iNMGccrCo1anTHGQUU2PGOxKv6NZ5x9xLOpwI1ql/3i950GCVXq+FF3D0teEaFV9Qc6OsLKCrUK7JO0TwxrWtwx5aPQdGpKrTrHOotJiSi5NO6KPZNF7zVQ7CPr3bhwMH2KZJvkisxF388KW0anpqv0vFDzr1Wf86PyNMAkxSjNR7I78Mkimqoalu7i5xRRL1KWloBJwzYuD6bG4+Py40N7ukomNz+g3LLQWY9ZD3yFpS0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlM+LazuZKdZI4QFR7ngTVL5K/qdurZ8RtcfN5k6fVQ=;
 b=jryupJkJfMhC52wj7LqoPoJ0O6Rl3vn8+vIHQi4mqv0Tel9wCTYXRNTIh+xU+XHcHMvh/QJqWHE9qfaPY7l3dRf+kCrUwj1H0zsOku+23+EfNr1WmPIp2jKSiRyKF/maRa4VZQW7tkF/yi/Y4pZFnPJdWMMUEqDVYtLRy3YIckOLye/6XAGyvxkANR2B8ny9sUUVw1kIMA+Kvx4iz37ZTotArwZkNjoEPMmdrAGDvuxWi6umRIUCSADQTuqs4fVMiB2fmNEmwNLJanU5KL6aEK/8H6axUZOiFvqDWccRmjt5XA6xP4FQxoBBgD4OQPkeNanBWgg7XrBFwB+iT64VvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlM+LazuZKdZI4QFR7ngTVL5K/qdurZ8RtcfN5k6fVQ=;
 b=ki2f38qtfv7rlzFavxqz63QsiI88vxpiF4k4zumkbs8UH3bMxOGw1bmWDjE58Pv8hUG+ALXp+xIap/WF+2NMuW/Raz6D3jhfzdk3GbJzLoB303Vp01o3iOwl1SLOB/82RWca+qL6SFAi6CCRRDISHGYZuuxfLgohHPdckNbQhsI=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0402MB2936.eurprd04.prod.outlook.com (2603:10a6:4:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 09:22:35 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 09:22:35 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Daniel Baluta <daniel.baluta@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
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
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9akKUIoAgAABVNCAAArtgIAAgWswgACWcoCAAAinQA==
Date:   Fri, 17 Jul 2020 09:22:35 +0000
Message-ID: <DB3PR0402MB3916A84BEF5EEC327EE35180F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
 <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com>
In-Reply-To: <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5680295-dd5d-4a9a-68e9-08d82a32f141
x-ms-traffictypediagnostic: DB6PR0402MB2936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB29360D6A26EDB5FC9FCBCE4BF57C0@DB6PR0402MB2936.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E+eFUmmHxtUmm/Dmgxw3isSat+h7G7z5740Sj6r1h4PBBJckR7UwLZzN4oVGK58EE3dU8/8Em378U/I5ZsKnQ6phy0sLskqJJEge8xM1NRDjkWZsrs95A9blgzpOmZNhY3AT/P3+8DhVCyUaiNGJaepFfiyNdGYWWylBlHS7UeLHiC6NJsJmvV7GGsw3n5IPUdY/+PiYfsrac2J3CSQGt8RtvyJOkotY2QA/yK9sJJtGI5LJP5f+Igxw1l9mn1dKx7IBH0OZ8oI9Y8urfi5jcjatfNEysbtepYFhQd5caEHC/LeL45x6hC+0dwGOJd3Tvl+wrgX8uau7T3j5kCbxJ4ntSWurFImczXNFCsu7aOFDPr4Lujr87W3x7W6fnY4+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(316002)(7696005)(9686003)(52536014)(55016002)(4326008)(5660300002)(478600001)(44832011)(71200400001)(2906002)(6506007)(33656002)(186003)(53546011)(86362001)(110136005)(8676002)(66446008)(66556008)(66946007)(76116006)(8936002)(64756008)(66476007)(26005)(83380400001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TSOCJ4E7hVbPWv7pwhdwzEQHZA08cCeyrNcOPNHO9hrt9cWFFJnBdmHsUPXtzcIGOmAUW2OdA5r+fbS8tUoCCQOc7VPmAyeREmNpf9OF7+0j1Z8yCsl8Mk9LFX1SKnNIN0vim801zcX902XWBp7jrg1YQLYT+3lNSPG4tQwkkV08Z2buKyLZjvE/uk0T5z2c2srx0cdhZ+w6Q5Fmt34n56jDXmFyfju4dU9XWStWZGESxugUxVlN0zOKB/qF8FSw2Y5LFSAW6//iOXqac6JI5SQk3ay9iSSB6Ttqv52SS8B01MvUdR1EXG9t9WLN5c8e/uHQmRUqpAOCLEjerdu1IUGsrINbvBwuauwEZLVpWrGXgySS9dIiC8GJihMtauvaCvvwiHid5QlyObpX57+ncups6Y7v1VS/WivtfWnLZnJIvU9rteTHfrAj2CVrxOwkTEvdZrzfCM6VFU0hn01ku1ga3FEzADU1pZjnFtf2Tlg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5680295-dd5d-4a9a-68e9-08d82a32f141
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 09:22:35.5603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtRcvpcbPa6qEwzJn74TRPxWY6tJS88pRCuJbGsLoMWmApcw4n270M4eMOcLoG1UGUQ7gEQHpzIKgbAmotqOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2936
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIERhbmllbA0KDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6IGlteDog
U3VwcG9ydCBidWlsZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiBP
biA3LzE3LzIwIDI6NDQgQU0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEhpLCBEYW5pZWwNCj4g
Pg0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBwaW5jdHJsOiBpbXg6IFN1cHBv
cnQgYnVpbGRpbmcgU0NVIHBpbmN0cmwNCj4gPj4gZHJpdmVyIGFzIG1vZHVsZQ0KPiA+Pg0KPiA+
PiBPbiA3LzE2LzIwIDY6MjEgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+Pj4gSGksIERhbmll
bA0KPiA+Pj4NCj4gPj4+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6
IGlteDogU3VwcG9ydCBidWlsZGluZyBTQ1UgcGluY3RybA0KPiA+Pj4+IGRyaXZlciBhcyBtb2R1
bGUNCj4gPj4+Pg0KPiA+Pj4+IEhpIEFuc29uLA0KPiA+Pj4+DQo+ID4+Pj4gRmV3IGNvbW1lbnRz
IGlubGluZToNCj4gPj4+Pg0KPiA+Pj4+IE9uIDcvMTYvMjAgNjowNiBQTSwgQW5zb24gSHVhbmcg
d3JvdGU6DQo+ID4+Pj4+IFRvIHN1cHBvcnQgYnVpbGRpbmcgaS5NWCBTQ1UgcGluY3RybCBkcml2
ZXIgYXMgbW9kdWxlLCBiZWxvdw0KPiA+Pj4+PiB0aGluZ3MgbmVlZCB0bw0KPiA+Pj4+IGJlIGNo
YW5nZWQ6DQo+ID4+Pj4+ICAgICAgICAtIEV4cG9ydCBTQ1UgcmVsYXRlZCBmdW5jdGlvbnMgYW5k
IHVzZSAiSVNfRU5BQkxFRCIgaW5zdGVhZCBvZg0KPiA+Pj4+PiAgICAgICAgICAiaWZkZWYiIHRv
IHN1cHBvcnQgU0NVIHBpbmN0cmwgZHJpdmVyIHVzZXIgYW5kIGl0c2VsZiB0byBiZQ0KPiA+Pj4+
PiAgICAgICAgICBidWlsdCBhcyBtb2R1bGU7DQo+ID4+Pj4+ICAgICAgICAtIFVzZSBmdW5jdGlv
biBjYWxsYmFja3MgZm9yIFNDVSByZWxhdGVkIGZ1bmN0aW9ucyBpbg0KPiBwaW5jdHJsLWlteC5j
DQo+ID4+Pj4+ICAgICAgICAgIGluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIHNjZW5hcmlvIG9mIFBJ
TkNUUkxfSU1YIGlzIGJ1aWx0IGluDQo+ID4+Pj4+ICAgICAgICAgIHdoaWxlIFBJTkNUUkxfSU1Y
X1NDVSBpcyBidWlsdCBhcyBtb2R1bGU7DQo+ID4+Pj4+ICAgICAgICAtIEFsbCBkcml2ZXJzIHVz
aW5nIFNDVSBwaW5jdHJsIGRyaXZlciBuZWVkIHRvIGluaXRpYWxpemUgdGhlDQo+ID4+Pj4+ICAg
ICAgICAgIFNDVSByZWxhdGVkIGZ1bmN0aW9uIGNhbGxiYWNrOw0KPiA+Pj4+PiAgICAgICAgLSBD
aGFuZ2UgUElOQ1RSX0lNWF9TQ1UgdG8gdHJpc3RhdGU7DQo+ID4+Pj4+ICAgICAgICAtIEFkZCBt
b2R1bGUgYXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZS4NCj4gPj4+Pj4NCj4gPj4+Pj4g
V2l0aCBhYm92ZSBjaGFuZ2VzLCBpLk1YIFNDVSBwaW5jdHJsIGRyaXZlciBjYW4gYmUgYnVpbHQg
YXMgbW9kdWxlLg0KPiA+Pj4+IFRoZXJlIGFyZSBhIGxvdCBvZiBjaGFuZ2VzIGhlcmUuIEkgdGhp
bmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHRyeQ0KPiA+Pj4+IHRvIHNwbGl0IHRoZW0NCj4gPj4+
Pg0KPiA+Pj4+IHBlciBmdW5jdGlvbmFsaXR5LiBPbmUgZnVuY3Rpb25hbCBjaGFuZ2UgcGVyIHBh
dGNoLg0KPiA+Pj4gQWN0dWFsbHksIEkgZXZlciB0cmllZCB0byBzcGxpdCB0aGVtLCBidXQgdGhl
IGZ1bmN0aW9uIHdpbGwgYmUgYnJva2VuLg0KPiA+Pj4gQWxsIHRoZSBjaGFuZ2VzIGFyZSBqdXN0
IHRvIHN1cHBvcnQgdGhlIG1vZHVsZSBidWlsZC4gSWYgc3BsaXQgdGhlbSwNCj4gPj4+IHRoZSBi
aXNlY3Qgd2lsbCBoYXZlIHBpbmN0cmwgYnVpbGQgb3IgZnVuY3Rpb24gYnJva2VuLg0KPiA+PiBI
aSBBbnNvbiwNCj4gPj4NCj4gPj4NCj4gPj4gSSBzZWUgeW91ciBwb2ludCBhbmQgSSBrbm93IHRo
YXQgdGhpcyBpcyBhIHZlcnkgaGFyZCB0YXNrIHRvIGdldCBpdA0KPiA+PiByaWdodCBmcm9tDQo+
ID4+DQo+ID4+IHRoZSBmaXJzdCBwYXRjaGVzLg0KPiA+Pg0KPiA+PiBCdXQgbGV0IG1lIHN1Z2dl
c3QgYXQgbGVhc3QgdGhhdDoNCj4gPj4NCj4gPj4gLSBjaGFuZ2VzIGluwqAgZHJpdmVycy9waW5j
dHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jIChpbmNsdWRlIGZpbGUNCj4gPj4gYW5kIE1PRFVM
RV8gbWFjcm9zIHNob3VsZCBnbyB0byBhIHNlcGFyYXRlIHBhdGNoKS4NCj4gPiBZb3UgbWVhbnQg
aW4gcGF0Y2ggIzIsIHRoZSBjaGFuZ2VzIGluIEtjb25maWcgYW5kIHRoZSBjaGFuZ2VzIGluIC5j
DQo+ID4gZmlsZSBzaG91bGQgYmUgc3BsaXQgdG8gMiBwYXRjaGVzPw0KPiANCj4gDQo+IE5vLiBJ
IG1lYW4gbG9vayBhdCBwYXRoICMxLg0KPiANCj4gVGhlIHNlY3Rpb24gYWJvdmUgc2hvdWxkIGJl
IHBsYWNlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KPiANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBpbXg4cXhwX3BpbmN0cmxfb2ZfbWF0Y2hbXSA9IHsgZGlmZiAtLWdpdA0K
PiBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYyBiL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYw0KPiBpbmRleCA5ZGY0NWQzLi41OWI1ZjhhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmMNCj4g
KysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLXNjdS5jDQo+IEBAIC03LDYg
KzcsNyBAQA0KPiANCj4gICAjaW5jbHVkZSA8bGludXgvZXJyLmg+DQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2Zpcm13YXJlL2lteC9zY2kuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9waW5j
dHJsL3BpbmN0cmwuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+
IEBAIC0xMjMsMyArMTI0LDcgQEAgdm9pZCBpbXhfcGluY3RybF9wYXJzZV9waW5fc2N1KHN0cnVj
dCBpbXhfcGluY3RybA0KPiAqaXBjdGwsDQo+ICAgCQlwaW5fc2N1LT5tdXhfbW9kZSwgcGluX3Nj
dS0+Y29uZmlnKTsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwoaW14X3BpbmN0cmxfcGFy
c2VfcGluX3NjdSk7DQo+ICsNCj4gK01PRFVMRV9BVVRIT1IoIkRvbmcgQWlzaGVuZzxhaXNoZW5n
LmRvbmdAbnhwLmNvbT4iKTsNCj4gK01PRFVMRV9ERVNDUklQVElPTigiTlhQIGkuTVggU0NVIGNv
bW1vbiBwaW5jdHJsIGRyaXZlciIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiAN
Cj4gDQo+IFRoaXMgY2FuIGJlIGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkkgZG9uJ3QgdW5kZXJz
dGFuZCwgd2l0aG91dCBhZGRpbmcgbW9kdWxlIGxpY2Vuc2UsIGNoYW5naW5nIHRoZSBTQ1UgcGlu
Y3RybCBkcml2ZXINCnRvICJ0cmlzdGF0ZSIsIHdoZW4gYnVpbGRpbmcgd2l0aCA9TSwgdGhlIGJ1
aWxkIHdpbGwgaGF2ZSB3YXJuaW5nIGFzIGJlbG93LCBzbyBJIHRoaW5rDQppdCBkb2VzIE5PVCBt
YWtlIHNlbnNlIHRvIHNwbGl0IGl0IHRvIDIgcGF0Y2hlcy4NCg0KICBDQyBbTV0gIGRyaXZlcnMv
cGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3Uubw0KICBNT0RQT1NUIE1vZHVsZS5zeW12ZXJz
DQpXQVJOSU5HOiBtb2Rwb3N0OiBtaXNzaW5nIE1PRFVMRV9MSUNFTlNFKCkgaW4gZHJpdmVycy9w
aW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLXNjdS5vDQogIExEIFtNXSAgZHJpdmVycy9waW5jdHJs
L2ZyZWVzY2FsZS9waW5jdHJsLXNjdS5rbw0KDQpUaGFua3MsDQpBbnNvbg0K
