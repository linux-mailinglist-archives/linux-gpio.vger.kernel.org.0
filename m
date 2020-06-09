Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C211F3269
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 04:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgFIC73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 22:59:29 -0400
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:20864
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726907AbgFIC72 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 22:59:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhtLGawm4lzBdg11HT91Qp5P7+71razo1adceYmKpFI7j3MrpUc6vGJlP5M0Wo2aREae0VslwBoYksUyY2SeolnGj41N/c9k/q5ruRiqQL4rmdcyW+YfD0tOxBoJze6zlBYRR8Tx3LYbT5L7QnKwhiDcd6CrMtIR+b8OeA7pX8hiGITCl8b2Cxcchur/5/Pk4vs6N6jY+wYM5n+06uNnCMQs1y9L1aVsjv68FaeQN5FEP0KBT+E6zOfHxM93tTjZzHRZ8vgQ25mzjuAaHDpK1GHrOVWRYB4cRpzbKWaU/Sxk556xqWd+egh2ge01jkiSe2F8z6TtRFSAiTvJYvw/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qXfdX3ZroWIxavNDmEqs2JRYw5crPrgtJpT/NY26nM=;
 b=nimpB4mFOlyqrQrNPjK+dzqLvDtSlSOpq6csNQwK9M7lyC5tQtQn+kiN8Z1VYtqWblya3Z/oYSQ2cg/W+bmsTI8tygNzR5VOxhxwj8ovZGDp2+05mjLec7fCHBycuz8aah04L69Cq+Dn8yT+z5w4cbRlfjOIJh5UV7jGKxQl/jIBYRaFXWvYYCw8P9iGR8Yw8yj1wrV+TaXzQ+jjaGmaidT7Z6gjGlmbKYq/+E13O7jVoCxVi3GdOOw5+ByPiDbt22TIHnb18ZbDDWqeYhCaGJD+Hev0rbQVdweCJRq2Gi2CgVv4CN6NAt7nyQo0HTfsjmRZoc6aEsBK6hfUvSriZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qXfdX3ZroWIxavNDmEqs2JRYw5crPrgtJpT/NY26nM=;
 b=YiVDmnbQxzGhc/MWeuELKapu56eLkCMi1G0nPlkSMJePM+6OtcC0zFKGXi7PEoUTDtUwdR0L/ZT13nocAVcbFRIgf0qt2AprU1K1dZxOKafXdpTp1Q3ibQnNp2JBSvnBBZQ3jXLY9BlWCS7lSJqUWS5a1/LeblYyKxC9elhznSo=
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com (2603:10a6:803:5a::22)
 by VI1PR04MB4413.eurprd04.prod.outlook.com (2603:10a6:803:65::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Tue, 9 Jun
 2020 02:59:24 +0000
Received: from VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::7545:cf5d:b8b0:4ab0]) by VI1PR04MB5294.eurprd04.prod.outlook.com
 ([fe80::7545:cf5d:b8b0:4ab0%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 02:59:24 +0000
From:   BOUGH CHEN <haibo.chen@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Index: AQHWPX0cOLXEvPpX6UONorwURhW+lajOwQ+AgAAKmYCAAMeXAA==
Date:   Tue, 9 Jun 2020 02:59:24 +0000
Message-ID: <VI1PR04MB5294968FE100561842F1D0E190820@VI1PR04MB5294.eurprd04.prod.outlook.com>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200608144431.GS22511@kadam>
In-Reply-To: <20200608144431.GS22511@kadam>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d64199cd-33b7-4369-32b5-08d80c211d8c
x-ms-traffictypediagnostic: VI1PR04MB4413:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB441396E8A8799459EAD066CE90820@VI1PR04MB4413.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bEZucqPfRsrA2V83ens5f70BDHsXIH995TNe1UQ2bBu5jRHScfMCW+ZH0mvwWU9PZFNVx/AJkQMQYSGF3uEgNCmjcVb/q/qK+WtBM/GSwc2GbOsF8WSj19pMUvjUg6X9L/sd6zC9bOPHdx4RzV49u+SxV9lg8STDUMGHHLC9q+SClqpbzkyu/aNL9gkvjFGb0SI8pQHCD2Je/K7vj1tUhSLd9dLfCbcZMh0a4Fo5bb02G1IkECFBhJEzFl36jf6RV2FgO9fYr8vl4PO++o+ztFaO/ERx1GXmFKrlSXCGO47tnl/OtzxBVbfeLea+Ay+rocoKkV09EiakBDFH7UFekg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5294.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(9686003)(66446008)(66946007)(55016002)(4326008)(66556008)(66476007)(2906002)(83380400001)(5660300002)(71200400001)(8676002)(52536014)(8936002)(33656002)(86362001)(478600001)(64756008)(26005)(6506007)(7696005)(186003)(76116006)(54906003)(53546011)(110136005)(316002)(6636002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TOy/GIJajyJuXf/3HUbJOkgGjsMFvZkTKlKqMUGDbbyNrDK38pvwI4rxw1CfragAhIa7BB3bxiidfbhV+Nc4AxI0yu6ZlU1NmiVNF3FvEa2NmXtGwfPkrKx2vhf6XQ6ko5YZjTCl0rNZVDitoVYHpgAgUZAUf+I//auDNPLXr/wMbXf8sEQw+obe0+j13cfdn+RP/1tyHEuH2wuKTOrvq9Z0OrbiG2oYhyUWECsKtcOXIOW67h8FkNCzE5/Yb7maPG3v1lwVhV8QdBlAQTNgZguUjAl5TsTBV5xeGTB5n238oizQ87WfkksQhywkg7Gx3p/wUCBolLbXnX2lD4Md8cR1mb+LpEWdwulKNiFI+gVCyViRY42sAbJpqcVN8mjNrBt6xBHqYkJc70DD4SMGb/v4vlxxABxbKUilDA6Q4XlKyBldzKQ3DgoZtACiSPdfOQqdQFFNa/yq58RpYsqWrLs8tqRba0ydSg1FDps9cDo=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64199cd-33b7-4369-32b5-08d80c211d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 02:59:24.0707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZCuwfNLnBnVRlt79YFykz4ew8UDC4i2gCGKkCMT6u4qTBUE6qwK2fUlR6mm3uLB1x1IQhjTQAZ0j5D5px1DyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4413
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERhbiBDYXJwZW50ZXIgW21h
aWx0bzpkYW4uY2FycGVudGVyQG9yYWNsZS5jb21dDQo+IFNlbnQ6IDIwMjDE6jbUwjjI1SAyMjo0
NQ0KPiBUbzogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gQ2M6IEJPVUdI
IENIRU4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gc2hhd25n
dW9Aa2VybmVsLm9yZzsgc3RlZmFuQGFnbmVyLmNoOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+
IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsgZGwtbGlu
dXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0
b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Ow0KPiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBSZXZlcnQgInBpbmN0cmw6IGZyZWVzY2FsZTogaW14OiBV
c2UgJ2Rldm1fb2ZfaW9tYXAoKScgdG8NCj4gYXZvaWQgYSByZXNvdXJjZSBsZWFrIGluIGNhc2Ug
b2YgZXJyb3IgaW4gJ2lteF9waW5jdHJsX3Byb2JlKCknIg0KPiANCj4gT24gTW9uLCBKdW4gMDgs
IDIwMjAgYXQgMDI6MDY6MzVQTSArMDAwMCwgQWlzaGVuZyBEb25nIHdyb3RlOg0KPiA+ID4gRnJv
bTogaGFpYm8uY2hlbkBueHAuY29tIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4gPiBTZW50OiBN
b25kYXksIEp1bmUgOCwgMjAyMCA2OjAwIFBNDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBibG9j
ayBzeXN0ZW0gYm9vdGluZywgZmluZCBvbiBpbXg3ZC1zZGIgYm9hcmQuDQo+ID4gPiBGcm9tIHRo
ZSBkdHMgd2UgY2FuIHNlZSwgaW9tdXggYW5kIGlvbXV4X2xwc3Igc2hhcmUgdGhlIG1lbW9yeQ0K
PiA+ID4gcmVnaW9uIFsweDMwMzMwMDAwLTB4MzAzM2ZmZmZdLCBzbyB3aWxsIHRyaWdnZXIgdGhl
IGZvbGxvd2luZyBpc3N1ZToNCj4gPiA+DQo+ID4gPiBbICAgIDAuMTc5NTYxXSBpbXg3ZC1waW5j
dHJsIDMwMmMwMDAwLmlvbXV4Yy1scHNyOiBpbml0aWFsaXplZCBJTVggcGluY3RybA0KPiA+ID4g
ZHJpdmVyDQo+ID4gPiBbICAgIDAuMTkxNzQyXSBpbXg3ZC1waW5jdHJsIDMwMzMwMDAwLnBpbmN0
cmw6IGNhbid0IHJlcXVlc3QgcmVnaW9uIGZvcg0KPiA+ID4gcmVzb3VyY2UgW21lbSAweDMwMzMw
MDAwLTB4MzAzM2ZmZmZdDQo+ID4gPiBbICAgIDAuMTkxODQyXSBpbXg3ZC1waW5jdHJsOiBwcm9i
ZSBvZiAzMDMzMDAwMC5waW5jdHJsIGZhaWxlZCB3aXRoIGVycm9yDQo+IC0xNg0KPiA+ID4NCj4g
PiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYmE0MDMyNDI2MTVjMmM5OWUyN2FmNzk4NGIxNjUwNzcx
YTJjYzJjOS4NCj4gPg0KPiA+IEJldHRlciBhZGQgeW91ciBzaWduLW9mZi4NCj4gPiBPdGhlcndp
c2U6DQo+ID4gUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+
DQo+ID4NCj4gPiBNYXliZSB5b3Ugb3IgQ2hyaXN0b3BoZSBjb3VsZCByZXN1Ym1pdCBhbm90aGVy
IHByb3BlciBmaXggZm9yIHRoZSBvcmlnaW5hbA0KPiBpc3N1ZS4NCj4gDQo+IEknbSByZWFsbHkg
c29ycnkgYWJvdXQgdGhhdC4gIFRoaXMgd2FzIGxhcmdlbHkgbXkgZmF1bHQuDQo+IA0KPiBJIHN0
aWxsIGRvbid0IHVuZGVyc3RhbmQgaG93IGNvbW1pdCBiYTQwMzI0MjYxNWMgY2F1c2VkIGEgcHJv
YmxlbS4NCj4gDQo+IEl0IHNvdW5kcyBsaWtlIGluIHRoZSBvcmlnaW5hbCBjb2RlIGlwY3RsLT5p
bnB1dF9zZWxfYmFzZSB3YXMgcmVsZWFzZWQgc29tZWhvdz8NCj4gSSBkbyBhIGBnaXQgZ3JlcCBp
bnB1dF9zZWxfYmFzZWAgYW5kIGl0IGRvZXNuJ3Qgc2hvdyBhbnl0aGluZy4NCj4gV2hhdCBhbSBJ
IG1pc3Npbmc/DQo+IA0KDQpIaSBEYW4sDQoNCkkgY2FuIGdpdmUgeW91IGEgZGV0YWlsIGV4cGxh
aW4gd2h5IHRoaXMgcGF0Y2ggdHJpZ2dlciBpc3N1ZXMuDQpUYWtlIG91ciBpbXg3ZC1zZGIgYm9h
cmQgYXMgZXhhbXBsZSwgaW4gZHRzIGZpbGUgd2UgY2FuIHNlZSB0byBub2RlczoNCjQ0MCAgICAg
ICAgICAgICAgICAgICAgICAgICBpb211eGNfbHBzcjogaW9tdXhjLWxwc3JAMzAyYzAwMDAgew0K
NDQxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14
N2QtaW9tdXhjLWxwc3IiOw0KNDQyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MzAyYzAwMDAgMHgxMDAwMD47DQo0NDMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmc2wsaW5wdXQtc2VsID0gPCZpb211eGM+Ow0KNDQ0ICAgICAgICAgICAgICAgICAgICAg
ICAgIH07DQpBbmQgDQo0OTMgICAgICAgICAgICAgICAgICAgICAgICAgaW9tdXhjOiBwaW5jdHJs
QDMwMzMwMDAwIHsNCjQ5NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLGlteDdkLWlvbXV4YyI7DQo0OTUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgzMDMzMDAwMCAweDEwMDAwPjsNCjQ5NiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Ow0KDQpGaXJzdCB0aW1lIHdoZW4gcHJvYmUgdGhlIGlvbXV4Y19scHNyLCBkdWUgdG8g
aXQgaGFzICJmc2wsaW5wdXQtc2VsIiwgc28gaW4gdGhlIHBpbmN0cmwgZHJpdmVyLCBpdCB3aWxs
IHVzZSBBUEkgZGV2bV9vZl9pb21hcCgpIHRvIGhhbmRsZSB0aGUgaW9tdXhjIGZvciB0aGUgZmly
c3QgdGltZS4gRGV2bV9vZl9pb21hcCgpIHVzZSB0aGUgQVBJIGRldm1fcmVxdWVzdF9tZW1fcmVn
aW9uKCkgZm9yIHRoZSByZWdpb24gPDB4MzAzMzAwMDAtMHgzMDMzZmZmZj4uIA0KVGhlbiwgd2hl
biBwcm9iZSB0aGUgaW9tdXhjLCB0aGUgcGluY3RybCBkcml2ZXIgY2FsbCB0aGUgQVBJIGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLCB0aGlzIEFQSSBhbHNvIGNhbGwgdGhlIGRldm1f
cmVxdWVzdF9tZW1fcmVnaW9uKCkgZm9yIHRoZSBzYW1lIHJlZ2lvbiA8MHgzMDMzMDAwMC0weDMw
MzNmZmZmPi4gDQpTbyB3ZSBzZWUgdGhlIGxvZyBhcyBmb2xsb3dpbmc6DQpbICAgIDAuMTc5NTYx
XSBpbXg3ZC1waW5jdHJsIDMwMmMwMDAwLmlvbXV4Yy1scHNyOiBpbml0aWFsaXplZCBJTVggcGlu
Y3RybCBkcml2ZXINClsgICAgMC4xOTE3NDJdIGlteDdkLXBpbmN0cmwgMzAzMzAwMDAucGluY3Ry
bDogY2FuJ3QgcmVxdWVzdCByZWdpb24gZm9yIHJlc291cmNlIFttZW0gMHgzMDMzMDAwMC0weDMw
MzNmZmZmXQ0KWyAgICAwLjE5MTg0Ml0gaW14N2QtcGluY3RybDogcHJvYmUgb2YgMzAzMzAwMDAu
cGluY3RybCBmYWlsZWQgd2l0aCBlcnJvciAtMTYNCg0KSSB3aWxsIHNlbmQgYSBWMiBwYXRjaCB0
byBhZGQgbXkgc2lnbi1vZmYtYnkgYW5kIGZpeCB0YWcuDQoNCkJlc3QgUmVnYXJkcw0KSGFpYm8g
Q2hlbg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQoNCg==
