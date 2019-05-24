Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDF929187
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 09:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388891AbfEXHKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 03:10:35 -0400
Received: from mail-eopbgr820075.outbound.protection.outlook.com ([40.107.82.75]:9911
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388460AbfEXHKe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 May 2019 03:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ww0LyfRxGFq8R5I05daDtQhsIkDCr1jVHS1jTB8NDVg=;
 b=k2WAcfx2hzIWOfrslF5oEh+yVX8XkKuVaWq4T6gQKRKMdbfpXT/Rp02LknvvSWvybEqoad+Ov56TKyOkCPG9EwQWz5Diw9rZMGaiyS83PtJdl63iI/MtXhJzziLcCUJQL810u5ALN50gEVFVFRSXplhDAWz/Au2Qgqly8uFsEHI=
Received: from BY1PR0301MB0901.namprd03.prod.outlook.com (10.160.195.140) by
 BY1PR0301MB1319.namprd03.prod.outlook.com (10.161.206.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 24 May 2019 07:10:28 +0000
Received: from BY1PR0301MB0901.namprd03.prod.outlook.com
 ([fe80::f582:135:91b7:eb89]) by BY1PR0301MB0901.namprd03.prod.outlook.com
 ([fe80::f582:135:91b7:eb89%4]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 07:10:28 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     kbuild test robot <lkp@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: [PATCH] gpio: fix gpio-adp5588 build errors
Thread-Topic: [PATCH] gpio: fix gpio-adp5588 build errors
Thread-Index: AQHVEbMIs/GUdK8HvES52ZhkR4tgfKZ53FCA
Date:   Fri, 24 May 2019 07:10:28 +0000
Message-ID: <BY1PR0301MB090122CBC8CED2B6830425378E020@BY1PR0301MB0901.namprd03.prod.outlook.com>
References: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
In-Reply-To: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Michael.Hennerich@analog.com; 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 284cbd15-3702-4909-52c4-08d6e016e6dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:BY1PR0301MB1319;
x-ms-traffictypediagnostic: BY1PR0301MB1319:
x-microsoft-antispam-prvs: <BY1PR0301MB1319DC372529CF925CCA5F588E020@BY1PR0301MB1319.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(396003)(376002)(39860400002)(136003)(199004)(13464003)(189003)(52536014)(305945005)(6246003)(25786009)(5660300002)(11346002)(446003)(53936002)(26005)(4326008)(316002)(8936002)(76116006)(14454004)(256004)(486006)(476003)(71190400001)(86362001)(7736002)(66446008)(66476007)(66946007)(64756008)(73956011)(66556008)(71200400001)(102836004)(66066001)(6506007)(53546011)(99286004)(33656002)(72206003)(2906002)(478600001)(2501003)(110136005)(76176011)(7696005)(54906003)(68736007)(6436002)(9686003)(55016002)(186003)(8676002)(81166006)(81156014)(74316002)(229853002)(6116002)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY1PR0301MB1319;H:BY1PR0301MB0901.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2N67lV7P4oE7PINIHd1W+YTKgUqh+GCqzD1AyRp8sVnMkMnkagaLSBdQ70Hm3/CWt0738ONetqwYLDB8wOaPUc7O2SI4EzVfE9Ez3DLo6KtTCXDAvgnFCfCda6TncZeqStzHvPkSTejAbefQQdUzdzRKMzoQeVlUsK9A5WwqUYvfVL17L0NKfDuXfbB8/DxvRV3mxE3JGIpoaPEs9vw6vzvUWA3ey4jdGZ2UfXvAaIMQrog68Id0+2bxt9YFzERgLcCBcUdrjz5w4cf25t9mJpventHp5VYy02ToNQzFBO0jnHiwSETv0d1ULCm99HW15u6xjLxAbW3Of6FBVJh7JZLkbwFOKK/UCoFbMaQI7bLLQEmttislwc8Fd2qSW+O977YbvX45yarMpdQnsh+AqF9h+h4voP5UAJwbEe+zmv4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284cbd15-3702-4909-52c4-08d6e016e6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 07:10:28.4173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1319
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYW5keSBEdW5sYXAgW21haWx0
bzpyZHVubGFwQGluZnJhZGVhZC5vcmddDQo+IFNlbnQ6IEZyZWl0YWcsIDI0LiBNYWkgMjAxOSAw
MDowMQ0KPiBUbzogTEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWdw
aW9Admdlci5rZXJuZWwub3JnDQo+IENjOiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT47IEhlbm5lcmljaCwgTWljaGFlbCA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IExp
bnVzIFdhbGxlaWoNCj4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZ3Bp
bzogZml4IGdwaW8tYWRwNTU4OCBidWlsZCBlcnJvcnMNCj4gDQo+IEZyb206IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiANCj4gVGhlIGdwaW8tYWRwNTU4OCBkcml2ZXIg
dXNlcyBpbnRlcmZhY2VzIHRoYXQgYXJlIHByb3ZpZGVkIGJ5DQo+IEdQSU9MSUJfSVJRQ0hJUCwg
c28gc2VsZWN0IHRoYXQgc3ltYm9sIGluIGl0cyBLY29uZmlnIGVudHJ5Lg0KPiANCj4gRml4ZXMg
dGhlc2UgYnVpbGQgZXJyb3JzOg0KPiANCj4gLi4vZHJpdmVycy9ncGlvL2dwaW8tYWRwNTU4OC5j
OiBJbiBmdW5jdGlvbiDigJhhZHA1NTg4X2lycV9oYW5kbGVy4oCZOg0KPiAuLi9kcml2ZXJzL2dw
aW8vZ3Bpby1hZHA1NTg4LmM6MjY2OjI2OiBlcnJvcjog4oCYc3RydWN0IGdwaW9fY2hpcOKAmSBo
YXMgbm8gbWVtYmVyIG5hbWVkIOKAmGlyceKAmQ0KPiAgICAgICAgICAgICBkZXYtPmdwaW9fY2hp
cC5pcnEuZG9tYWluLCBncGlvKSk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAu
Li9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1NTg4LmM6IEluIGZ1bmN0aW9uIOKAmGFkcDU1ODhfaXJx
X3NldHVw4oCZOg0KPiAuLi9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1NTg4LmM6Mjk4OjI6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhncGlvY2hpcF9pcnFjaGlwX2Fk
ZF9uZXN0ZWTigJkgWy1XZXJyb3I9aW1wbGljaXQtDQo+IGZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0K
PiAgIHJldCA9IGdwaW9jaGlwX2lycWNoaXBfYWRkX25lc3RlZCgmZGV2LT5ncGlvX2NoaXAsDQo+
ICAgXg0KPiAuLi9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1NTg4LmM6MzA3OjI6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhncGlvY2hpcF9zZXRfbmVzdGVkX2lycWNo
aXDigJkgWy1XZXJyb3I9aW1wbGljaXQtDQo+IGZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgIGdw
aW9jaGlwX3NldF9uZXN0ZWRfaXJxY2hpcCgmZGV2LT5ncGlvX2NoaXAsDQo+ICAgXg0KPiANCj4g
Rml4ZXM6IDQ1OTc3M2FlOGRiYiAoImdwaW86IGFkcDU1ODgtZ3Bpbzogc3VwcG9ydCBpbnRlcnJ1
cHQgY29udHJvbGxlciIpDQo+IA0KPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPg0KDQpBY2tlZC1ieTogTWljaGFlbCBIZW5uZXJpY2ggPG1pY2hhZWwuaGVubmVy
aWNoQGFuYWxvZy5jb20+DQoNCj4gQ2M6IE1pY2hhZWwgSGVubmVyaWNoIDxtaWNoYWVsLmhlbm5l
cmljaEBhbmFsb2cuY29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPg0KPiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT4NCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncGlvL0tjb25maWcgfCAgICAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPiANCj4gLS0tIGxueC01Mi1yYzEub3JpZy9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiArKysg
bG54LTUyLXJjMS9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiBAQCAtODIyLDYgKzgyMiw3IEBAIGNv
bmZpZyBHUElPX0FEUDU1ODgNCj4gIGNvbmZpZyBHUElPX0FEUDU1ODhfSVJRDQo+ICAgICAgICAg
Ym9vbCAiSW50ZXJydXB0IGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgQURQNTU4OCINCj4gICAgICAg
ICBkZXBlbmRzIG9uIEdQSU9fQURQNTU4OD15DQo+ICsgICAgICAgc2VsZWN0IEdQSU9MSUJfSVJR
Q0hJUA0KPiAgICAgICAgIGhlbHANCj4gICAgICAgICAgIFNheSB5ZXMgaGVyZSB0byBlbmFibGUg
dGhlIGFkcDU1ODggdG8gYmUgdXNlZCBhcyBhbiBpbnRlcnJ1cHQNCj4gICAgICAgICAgIGNvbnRy
b2xsZXIuIEl0IHJlcXVpcmVzIHRoZSBkcml2ZXIgdG8gYmUgYnVpbHQgaW4gdGhlIGtlcm5lbC4N
Cj4gDQoNCg==
