Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8EF25F554
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 10:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgIGIeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 04:34:03 -0400
Received: from mail-eopbgr80079.outbound.protection.outlook.com ([40.107.8.79]:56295
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726978AbgIGIeB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 04:34:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtc+yTzDjUvsyTLZ6iMLAHTxsp5nt7LUiVvbo0wK7HLgsWpqWW/lGHb4+S5NWcFAtwZX0UT5E25cH7rba0HleSVGlALhm5h4vTUqqWulyr4zOLMbl3T4VUYxy/MizXEu/lzvsLf3MhjjGK9GVF4JKbiNiJ5vmB+LWZ6yysozO0gwC3ioG/q6G9tXtfj7TEcLVHe2CvsRdv+kmFDQvhU91Bqo3vYfRC0HPajZElbHad+0940OXxjbzn3OnnInbjhJMuEhw0qlZSX6xWDr1tYkuo997TobSWHO8XQ3mmciRJ3gG+9gq6nok7CnRwS7uPkLQNaKhOBBlmrkvxtf2c664Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIMdWVzgGymajfyBHWxuXUKGU6+lPqF1E0UfeXuUSw=;
 b=LbYP3ATfDQP+FlQj8rFXrzUsoZHs8XrnWC6zSuqpqkL8I5q/lUA17Z454gC6BXC+V7gaRueKBDXnVGGZmML+ossAJS9sREkrQMy7Ni99ryLVKBZlMLjNUxKROe/WMaNpJ3hBzbpdj50C5zcv4ae0eiBlaRIr1YM/I9DLLgOJ6HUJrdvcfKuw/tGQRSBJUoTaHuo1bpKBHdpcT7UdoOyhdguy/30n2j7wbcbVfW6iR33xClrsegZV47nOGOWJ4nYSzJj72TWZ2l3Yax9KaHiEH27jApAIS5fEpiA6zylvlyE6OlrQ1tZ8QRD4LohIZpP9BR72EDptQYrqZgjhEr+hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nIMdWVzgGymajfyBHWxuXUKGU6+lPqF1E0UfeXuUSw=;
 b=Tu+wNJmqRA+5P2Rn+JFQS22BZot1P+TLMHzg8LsItnVNajgvNjzV4VP8A7+I3nH7CMl094Ng5ImttnekkleLFLbD2IiX5/SuBhBdXw2S13inFGlPwxUqFZR9aywrPHxeRHx3Dz+irtt/LxVLOw8FGpfoRRwZUrbYCPt0mjG0BvI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:33:56 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:33:56 +0000
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
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/2] pinctrl: imx: Support building i.MX pinctrl driver as
 module
Thread-Topic: [PATCH 2/2] pinctrl: imx: Support building i.MX pinctrl driver
 as module
Thread-Index: AQHWW4NEW1H/YcaISUCXEXNdAqqKd6ldKqKg
Date:   Mon, 7 Sep 2020 08:33:56 +0000
Message-ID: <AM6PR04MB4966D073690BB9CD8CC434F480280@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <1594912013-20859-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1594912013-20859-2-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a33caeb-db2a-473a-3aec-08d85308c2a1
x-ms-traffictypediagnostic: AM7PR04MB7013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB701388DB0063A680ED017ECC80280@AM7PR04MB7013.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tbdp/iqPdKPA6mICdYiihxtN5IB93RSldgZNvNPSeWA0gsl/zQKzJKUKULWnjngBHplK9jr1XMXm2nZPdqsPq7E42b1gxWvNvrxWV4szSdk70YO75EKxrSYVmB/zQm/Ey1aJxK83zru2hNvAhR+s2//a6zaGHbPIS3JPNUjbQUj8PI9mIVXfbv0sw7LSWGKn5bhr3/dEIMuS4o3Uic7agLk+B38DwMZ+usuN1ULmAqPBA+9791QPVuVQUuMeJg5Tt6kLRf6v4MiSamKX/RXafU/ZqM3Oj7PO2OU9nPkjCdZAcU39HOhhLgUB84blPXZCid4dbRoPfLlY1aFiSsrdtHvXrP6won5O3UY6UpnXoqBOeOmO4Sbas1qqx9QWMzJ/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(6506007)(44832011)(33656002)(2906002)(55016002)(66946007)(478600001)(66556008)(64756008)(71200400001)(66476007)(9686003)(76116006)(66446008)(7696005)(8676002)(8936002)(86362001)(316002)(110136005)(5660300002)(53546011)(186003)(4326008)(83380400001)(52536014)(26005)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9RzAii6uQq14r72BkB+LS1RIMV5dp7f2+JlqYVthOqYtRZJvGzjz6KqfDN49f7ind8Qx71TOCWkLFaxxkTurkQPi/E8EvnfnF8Kh769ETWntW/0Cvl037p6X7I7LFErLffC4Iztu1nldQQd+PaGM1avhzKwQseBtHjjTNujebNNuz/tI8nFZC6FMBFOvjMLfFTfwBuUwULfiJEHIYBQmDnCVJPHPjX8blEs2x/nN6HzFaReH9RrNfyK3CdHmgfuZLMlNckIclKQfDK3L/kcqDDh5OSxD05KO0MMLpkg3WuhTqLobolt/by9mEYebA9pDea1drn6b/+VlEGLR4hOAy45APtMlk+SmLMVPCE/jR4kH4OTttSQ7ORRGdcccUU3VdKd0yzumgQJnqGNF7ER7ChCEriyeK+NdPfukgMXL6Ipi15LwCg3WX15uXp39d0rw+yzz3btVSmor0fV5LhcQ/0YfAISujOFWMTr8ioznkTM09KbWkedLSujZVa8CTXNZXLrpRM0tHRr/YAbSFt3C+AIjs3BDldP/lc1xiwFnjsdo3kEAU2V40X5aX5rvVlfVqUgJaz7Z6Fw7SngOmV6JAjGdQ+KgBXX7rSjM3o+NrJ3Ek1grWEDBcBDbxmH+8oDfRp2ylhfSdHM91yQH5a7LLw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a33caeb-db2a-473a-3aec-08d85308c2a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:33:56.2355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ef0dLwO04GTvkD7X1um+9Wn/ov3ZNhZmBzfRYYtJmLeKDWKuVDtd+PvrhCL1fDCQD4SW4L9liy+6ZTBgAlMxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEp1bHkgMTYsIDIwMjAgMTE6MDcgUE0NCj4gU3ViamVjdDogW1BBVENIIDIvMl0gcGluY3Ry
bDogaW14OiBTdXBwb3J0IGJ1aWxkaW5nIGkuTVggcGluY3RybCBkcml2ZXIgYXMgbW9kdWxlDQo+
IA0KDQpTL3BpbmN0cmwgZHJpdmVyL3BpbmN0cmwgY29yZSBkcml2ZXINCg0KVGhpcyBhbHNvIGFw
cGxpZXMgZm9yIFBhdGNoIDEvMi4NCg0KPiBDaGFuZ2UgUElOQ1RSTF9JTVggdG8gdHJpc3RhdGUg
dG8gc3VwcG9ydCBsb2FkYWJsZSBtb2R1bGUgYnVpbGQuDQo+IA0KPiBBbmQgaS5NWCBjb21tb24g
cGluY3RybCBkcml2ZXIgc2hvdWxkIGRlcGVuZCBvbiBDT05GSUdfT0YgdG8gbWFrZSBzdXJlIG5v
DQo+IGJ1aWxkIGVycm9yIHdoZW4gaS5NWCBjb21tb24gcGluY3RybCBkcml2ZXIgaXMgZW5hYmxl
ZCBmb3IgZGlmZmVyZW50DQo+IGFyY2hpdGVjdHVyZXMgd2l0aG91dCBDT05GSUdfT0YuDQo+IA0K
PiBBbHNvIGFkZCBtb2R1bGUgYXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZyAgICAgICB8IDMgKystDQo+ICBk
cml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMgfCA1ICsrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZyBiL2RyaXZlcnMvcGluY3Ry
bC9mcmVlc2NhbGUvS2NvbmZpZw0KPiBpbmRleCA1NzAzNTVjLi45MjJhZTRiIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9w
aW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+IEBAIC0xLDYgKzEsNyBAQA0KPiAgIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICBjb25maWcgUElOQ1RSTF9JTVgNCj4gLQli
b29sDQo+ICsJdHJpc3RhdGUgIklNWCBwaW5jdHJsIGRyaXZlciINCg0KSU1YIHBpbmN0cmwgY29y
ZSBkcml2ZXINCg0KPiArCWRlcGVuZHMgb24gT0YNCj4gIAlzZWxlY3QgR0VORVJJQ19QSU5DVFJM
X0dST1VQUw0KPiAgCXNlbGVjdCBHRU5FUklDX1BJTk1VWF9GVU5DVElPTlMNCj4gIAlzZWxlY3Qg
R0VORVJJQ19QSU5DT05GDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxl
L3BpbmN0cmwtaW14LmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14
LmMNCj4gaW5kZXggYjgwYzQ1MC4uM2VhYWZiNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5j
dHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVl
c2NhbGUvcGluY3RybC1pbXguYw0KPiBAQCAtMTEsNiArMTEsNyBAQA0KPiAgI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9vZi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gQEAgLTg5OCwzICs4OTksNyBAQCBjb25zdCBzdHJ1
Y3QgZGV2X3BtX29wcyBpbXhfcGluY3RybF9wbV9vcHMgPSB7DQo+ICAJCQkJCWlteF9waW5jdHJs
X3Jlc3VtZSkNCj4gIH07DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChpbXhfcGluY3RybF9wbV9vcHMp
Ow0KPiArDQo+ICtNT0RVTEVfQVVUSE9SKCJMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Iik7DQoNCk1PRFVMRV9BVVRIT1IoIkRvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25n
QG54cC5jb20+Iik7DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJOWFAgaS5NWCBjb21tb24gcGluY3RybCBkcml2ZXIiKTsNCj4gK01PRFVMRV9MSUNFTlNFKCJH
UEwgdjIiKTsNCj4gLS0NCj4gMi43LjQNCg0K
