Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C26260E0D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 10:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730101AbgIHIvl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 04:51:41 -0400
Received: from mail-db8eur05on2041.outbound.protection.outlook.com ([40.107.20.41]:42209
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729999AbgIHIvl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 04:51:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5N5FiPZSfG5PKZ9hnavxWZymXmkNebx5B0HUTdDhcjt9IJ+8mF0PyQ5/6hjt7cA2UHugZGTA3S6J7LvT+71s0swpl6L5NGD7uK3NGpqpNoPuM74o5Pb9HefU6xNdMBHazZX9MTCvBC0Wn1kHDWnvVWff5nZCMj4GVC3DFRd6d1KAU+tKYaE6QlET18Fpgo/W6AdHzEdPxWMdFXP2K8m2UK5UzjhWFdE14tt8WPaq+Wu5HbQXaCzrabGYsh+HWTLk9MshXFV8C05M4SwcrjfYCQf+shm9kDXnbdcZzZLi+n++r4pp8ykUW7HdLbgEainPeCenCTDW0SYtMMIcwUqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xPsj9+27xQe+TeH5duGtAO9qk3eDMOf1FeoqGS9oCo=;
 b=hyCnopgXqIZFcqqJaRz1DARNae/wuot1RQZItBctLz9KvAIeqlh6V3fOz/4gdpeu+fUjxVzoslYMOoivAzw3HvVdW//l2gn7YILLQMVvZRu2NWi2C1jA5dzGrL34bd+luvu6fjlOTw1hd1BtuL7+/h4m5fv2NPvfdBp9x1q7SbTLsb8Dnz1KDp4yS7bQXmB8zzTtdS0wt5l/21+ASPhMAoo71YoU4s0QpAF6GHwYLKotLkAOCp+SSaBbzeUoazjOV71pIE5GEIBOZYzroyF4riYOI/jv1TGN3tvEIyE3DD3lb+24tBxQS9yG5HEjC77CizDBvqVSplJoON8t8qCeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xPsj9+27xQe+TeH5duGtAO9qk3eDMOf1FeoqGS9oCo=;
 b=KxUeH3MVAsngVOnmYEnKugRwVuR8NKF1ast5EK8EZjEEUUXDDhiF6W4Q2BMDEUWECdAh2hUEzMfl4qZToWobaTWrYtiBXuOPEE4l0BjBgWkpdvOfHo0YhJMHb0TnsRPOiUDnqFdltLqMT4J3Ixl8Qfp4nm3x/NaeqZk980X+wWU=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6774.eurprd04.prod.outlook.com (2603:10a6:20b:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 8 Sep
 2020 08:51:37 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 08:51:37 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "arnd@arndb.de" <arnd@arndb.de>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V4 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Topic: [PATCH V4 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Index: AQHWhbiiDJ5+meTy/EGYPxSNr8EOW6lebtjw
Date:   Tue, 8 Sep 2020 08:51:37 +0000
Message-ID: <AM6PR04MB496667E921B181A050912EFE80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1599552721-24872-1-git-send-email-Anson.Huang@nxp.com>
 <1599552721-24872-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1599552721-24872-2-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 511c53d7-9e2f-4af9-0f54-08d853d4656c
x-ms-traffictypediagnostic: AM7PR04MB6774:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6774650B32F76B2731CC3DF080290@AM7PR04MB6774.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwO8ZqAgUL875pIp1QBm49g3Yv5xTF2fo3FQFfjgctUPRRx+j+VjjMsyZtHgDONOU0B5H/7dHhwSs/pcYnVWNYpY9MQAbFc/bQE8Ga321yFv4GX3VJUvazKkTeGF3KCz2/zOtQ0G/sUepaHYSlMAh9nOjPJMkcMLPZTHjoupycpDq63cDuW0pFPT76DobVMr7aHCdSlZaXBcCrDnOesd6qb54+K6++qfm9SIbfQiBVgCoMuEsDuWgKEJtQfWBu5FUA7A9Lj+M2sgrpM2ygUF6Cg35dFTMZXRhMMh+5LkBdRoKePVKpKqEGMuFSBXOBCFFSY/I3ZBDtXp+bAsFga2yYgNVGWBpL1owHxlQDTuZLSq3MLKZconrQ33g97VGMKm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(66946007)(66476007)(64756008)(76116006)(66446008)(8936002)(66556008)(83380400001)(33656002)(44832011)(5660300002)(7416002)(52536014)(71200400001)(7696005)(316002)(6506007)(26005)(186003)(2906002)(9686003)(55016002)(8676002)(86362001)(478600001)(110136005)(4326008)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GYb4yX1BOzt52lr9XWZ+Xq+oKihXXmEmzbjI+ybkTtvNc+a50Sepo7J+7gC7lVJkiaK32EAtDe5ONIMURrmLtRP6g+B6UkisuArXrYqnj9Ouuoc7OtZwcdKIG5LTct+y9x4YigCvskK/niDzm+5CUDgWT8Gmx1WoKT4EWj70ZmCJnCpWlv/xk6KUSUy663RpPdPJkTixej/NyL2M9GLDC8clcloymfcdle2Lm02V6nnNMiVcLSWSllkWjok8sJ9hILEDXh3ByYdh6JTG5sYPQ9dVw5VXcd4hO1cIyl7XlFbfbL0NwVUP1v10wDb8KjiGNrcaSbMnQmYBtzqlAAJb2OUmqjsD42Rto6iNzsQFRH+7UC1xnNq6CqYvOplCvOdxsBUqROkwQVd9XrG3jJoP4frPNJ8twYPtf54QQnW9rFO/LRUkynALaC09TPSg/ynTZEK0uwVZHL/+5cj8WOr/Dh0Y0ujmABOToHSDkP9IiU2gmAAMKw4y0zxRJ1olAqjXC48+tZO7pyR3AWFRd8mqU5WOUKboxM4p2KNFAWYcKeS/ndAgJr2l68dNWbKj5wPJQuFdmtuejsKaUo2JCFAmZl/zej06ET7H5hGwWvu4Wt7A1ZnUHAuTrCJrat65ZxF7Zrzl3rbojw5s9SYXVF02Bw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511c53d7-9e2f-4af9-0f54-08d853d4656c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 08:51:37.1818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTfrU+EfssWs07AoRq2Q904Q04xcCo89m2fiLIK70dzpZ6FV+Rd0qUioCVUi4h/vjH5oVPiDLUunHa/j9fHWlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6774
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDgsIDIwMjAgNDoxMiBQTQ0KPiANCj4gQ2hhbmdlIFBJTkNUUl9JTVhfU0NV
IHRvIHRyaXN0YXRlLCBhZGQgbW9kdWxlIGF1dGhvciwgZGVzY3JpcHRpb24gYW5kDQo+IGxpY2Vu
c2UgdG8gc3VwcG9ydCBidWlsZGluZyBTQ1UgcGluY3RybCBjb3JlIGRyaXZlciBhcyBtb2R1bGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4N
Cj4gLS0tDQo+IGNoYW5nZXMgc2luY2UgVjM6DQo+IAktIHJlbW92ZSB0aGUgcHJvbXB0IGZvciBQ
SU5DVFJMX0lNWF9TQ1UuDQoNCkdvb2Qgc3VnZ2VzdGlvbiBmcm9tIEFybmQuDQoNClJldmlld2Vk
LWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNo
ZW5nDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcgICAgICAg
fCAyICstDQo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmMgfCA1ICsr
KysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZyBiL2Ry
aXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZw0KPiBpbmRleCAwOGZjZjVjLi43MTk4OTE2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gKysr
IGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+IEBAIC03LDcgKzcsNyBAQCBj
b25maWcgUElOQ1RSTF9JTVgNCj4gIAlzZWxlY3QgUkVHTUFQDQo+IA0KPiAgY29uZmlnIFBJTkNU
UkxfSU1YX1NDVQ0KPiAtCWJvb2wNCj4gKwl0cmlzdGF0ZQ0KPiAgCWRlcGVuZHMgb24gSU1YX1ND
VQ0KPiAgCXNlbGVjdCBQSU5DVFJMX0lNWA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYw0KPiBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvcGluY3RybC1zY3UuYw0KPiBpbmRleCA5ZGY0NWQzLi41OWI1ZjhhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmMNCj4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLXNjdS5jDQo+IEBAIC03LDYgKzcsNyBAQA0KPiAN
Cj4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS9p
bXgvc2NpLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfYWRkcmVzcy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPg0K
PiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiBAQCAtMTIzLDMgKzEyNCw3
IEBAIHZvaWQgaW14X3BpbmN0cmxfcGFyc2VfcGluX3NjdShzdHJ1Y3QgaW14X3BpbmN0cmwNCj4g
KmlwY3RsLA0KPiAgCQlwaW5fc2N1LT5tdXhfbW9kZSwgcGluX3NjdS0+Y29uZmlnKTsNCj4gIH0N
Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGlteF9waW5jdHJsX3BhcnNlX3Bpbl9zY3UpOw0KPiArDQo+
ICtNT0RVTEVfQVVUSE9SKCJEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPiIpOw0K
PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJOWFAgaS5NWCBTQ1UgY29tbW9uIHBpbmN0cmwgZHJpdmVy
Iik7DQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7DQo+IC0tDQo+IDIuNy40DQoNCg==
