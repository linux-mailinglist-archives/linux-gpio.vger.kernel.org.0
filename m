Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586C7260C87
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 09:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbgIHHyC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 03:54:02 -0400
Received: from mail-eopbgr10089.outbound.protection.outlook.com ([40.107.1.89]:21225
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729714AbgIHHyB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 03:54:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc/Kx252pw82s77dnTMYFN0FEZpMDG0Rifn/oV4NpGTxehAjpsVN/cFDUxCDhkxYhGaBa2N65v7kWaCvyjyTVDkDhjr09HZnVXmbPvqSC0lMst3dyz2cNVSh52+eS7IUtXMwksamuYIlheWW6z29nl9eAQ23x3nhxKRBuYLyhxhsWMDEzl2RGGrDgAfpVTu0VWaA6wo+gMKPVz77qYJQ/aRcfTg/cNgfTVWarfqVk0eHy1xmmd1mSisJNvtnkdnKZRUStX0nMwFFlzK0EH/xqTw5Yu0rLNpR3sKVq1ti3NswSL0gL806WjzzSDdLOs0X8E1jGUfWYXLuyqBEuOSCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAKSicD1UbleOJolXPD1wa1ndAEYmWcM6oCjb4I73nU=;
 b=bkZiwhA+f01HE+QqOig4unF4LMnzgVPnMITFCXhYJKuST4LfedzCVE/pyYNEg/He1lo9qvbUbZKUHkbvqIXT/gt1rlVdJe0mueZcr4IxtR4ZLHeLvpaj7t4mhbSy2UbWtcmGzx2kSAsm6/erGGJobJbLg90H2KdUltJCkx0SDSrBYt6HN9EeWo+yIOMG/5oBWnjrdfsY49+cs4C7uP4phHQo6A0W06XUtlbIyavTmrGi4EFuct3dZgR1hnDg4s0VQ130OWhlipe8Z6MT3qkiErxwDZ46qhqFb2jYVXPxlDOD4Kr+MyBjGJ/b5yTrwMzHLgzsRChlGqGIszI8iExMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAKSicD1UbleOJolXPD1wa1ndAEYmWcM6oCjb4I73nU=;
 b=OGPi759hNhC4FyhBVt+soJzZhu/YxcK4k17T4xD3iWpX72b9IFmOEVh6AuddnzwiUxMOaibR18aDsZdfAO5YZG7quVkLogheiaAVspskG4XH0coMHZjdV8hl8nFgyHX2ezSPUUXxPJ5Fiez6h57cyupXitEDW2qEGNEFb7F6Ozc=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5466.eurprd04.prod.outlook.com (2603:10a6:10:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 07:53:55 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:53:55 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
Thread-Topic: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
Thread-Index: AQHWhbBDjiUh5DFSJEaP/TwCOvRVnqleWKmAgAAAdkCAAAOnAIAAAarg
Date:   Tue, 8 Sep 2020 07:53:55 +0000
Message-ID: <DB3PR0402MB39168981C3DB1BE25C7EA09FF5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com>
 <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
 <DB3PR0402MB3916716E9FC26ADF9161B4A4F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2v9i+iT5_TKSjDwVpw_dQrhfRiVNm3YOL7W7YTAEdagg@mail.gmail.com>
In-Reply-To: <CAK8P3a2v9i+iT5_TKSjDwVpw_dQrhfRiVNm3YOL7W7YTAEdagg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb190fa1-3075-4fef-f4d4-08d853cc5637
x-ms-traffictypediagnostic: DB7PR04MB5466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB546626B9EC154CABD2568D80F5290@DB7PR04MB5466.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekI26rna8iDmxQFPlLmbcTkzIL8CpjfneS3930nWKQrIoC8ZmmfEcpJyFelis1rCO0sm0ijKURC1j1Ei+0HnyyUJ1bMW6wygJcF1hY6cYnEOusPeITfPm2DoY0hwKi59DWESCjY9LhdgQYLiPH7p1P2oPgOOW9jxDxxGqphX55dF4aq3THv2twU9rqbRfQ6aK5OOcU5h3UCHxqXZPjVEirnzhWwG8fv1NW/pQlm2RGeRugao6gMlJGA2aIQH6WQWdfMR1DXRAXK6lMg+A6kNQ1DJbQVrPJh1YblFgPG1RyQQ1gKgXRndSB/RkbBfgHlo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(4326008)(33656002)(86362001)(2906002)(6916009)(55016002)(9686003)(7696005)(66556008)(66476007)(66446008)(64756008)(53546011)(6506007)(7416002)(66946007)(44832011)(54906003)(8936002)(8676002)(186003)(478600001)(76116006)(5660300002)(26005)(316002)(71200400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WJq/MxsDH3U20TWOho8SxxqNrMF68TJIxCfyTsIk0y1RPTfpqtoPrDcEJRe9ius4SN0sA10s0PqygrYYIBWmd7xGYAIQl5si7dFkVXgqWXEPn8MuUE+ecvwvzCtpMT3g6KUcMWV8KEQUAUCmxVa9b9lFgxw+oBa9rpJwVAe7/3EBnZMvhUUjaFQLeeql3JihLAWKCbzJK3HeyfUAQjv0C3KK52U1UHOguthhC4s+EcsSgIW1vRekqoippUdRkF+DbsJARq4ZseN1AJ2IkfKmU6kEzQcmA2DO29FBT3501Y//Bb1ZiSGfeV/AFRW4kA1bIRFSvo37Un5FY3WwX03sIGB7o0G7cJy43Al6hupkF4FeNlpf1l5Ak910wiSIjneTw5sewm5UF5SJk/PClcVmdxH+GELT8DPvwAV06Mrdw8zdcQkr8yOfmSiNbq4/x//0zXF/YRnMomj51gN22elKJQP1bqmyAmKG0g20f7pY0uKN5kPnBZkT7tI/7GdHrEmeNp0HC+mWVT5b0ut+tg5Ry8uVyztltak8PKQdfCpfkliWm+FMXIC2FbR+dpHER0buoSYKCs9vMEeAcy7yupNihAq/beNgzUS2OvPL0PY5cKYfkI3mU2XEGq12+VtVPwzQdr71EOiBuWNLNvXsSkDEGA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb190fa1-3075-4fef-f4d4-08d853cc5637
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:53:55.6287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YehcViCKLv9sgvPsADTCAYhgj00RLK1iCKpSHL2SMu+vTttF9xjy43KOX8a0hg1vmt5HVCqrCI3Dbxww7Jv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5466
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEFybmQNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDMvM10gcGluY3RybDogaW14OiBT
dXBwb3J0IGJ1aWxkaW5nIGkuTVggcGluY3RybCBjb3JlDQo+IGRyaXZlciBhcyBtb2R1bGUNCj4g
DQo+IE9uIFR1ZSwgU2VwIDgsIDIwMjAgYXQgOTozNCBBTSBBbnNvbiBIdWFuZyA8YW5zb24uaHVh
bmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDMvM10g
cGluY3RybDogaW14OiBTdXBwb3J0IGJ1aWxkaW5nIGkuTVgNCj4gPiA+IHBpbmN0cmwgY29yZSBk
cml2ZXIgYXMgbW9kdWxlDQo+ID4gPg0KPiA+ID4gT24gVHVlLCBTZXAgOCwgMjAyMCBhdCA5OjIw
IEFNIEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4g
Pg0KPiA+ID4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICBjb25m
aWcgUElOQ1RSTF9JTVgNCj4gPiA+ID4gLSAgICAgICBib29sDQo+ID4gPiA+ICsgICAgICAgdHJp
c3RhdGUgIklNWCBwaW5jdHJsIGNvcmUgZHJpdmVyIg0KPiA+ID4gPiArICAgICAgIGRlcGVuZHMg
b24gT0YNCj4gPiA+ID4gICAgICAgICBzZWxlY3QgR0VORVJJQ19QSU5DVFJMX0dST1VQUw0KPiA+
ID4gPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTk1VWF9GVU5DVElPTlMNCj4gPiA+ID4gICAg
ICAgICBzZWxlY3QgR0VORVJJQ19QSU5DT05GDQo+ID4gPg0KPiA+ID4gSSBkb24ndCBzZWUgd2h5
IHlvdSBuZWVkIHRvIG1ha2UgdGhpcyBvcHRpb24gdXNlci12aXNpYmxlIHdoZW4gaXQgaXMNCj4g
PiA+IGFscmVhZHkgc2VsZWN0ZWQgYnkgdGhlIGRyaXZlcnMgdGhhdCBuZWVkIGl0LiBXb3VsZG4n
dCBpdCBiZSBlbm91Z2ggdG8NCj4gY2hhbmdlIHRoZSAnYm9vbCcNCj4gPiA+IHRvICd0cmlzdGF0
ZScgd2l0aG91dCBhZGRpbmcgYSBwcm9tcHQ/DQo+ID4NCj4gPiBNYWtlIHNlbnNlLCBzbyBpdCBp
cyBzYW1lIGZvciBQSU5DVFJMX0lNWF9TQ1UsIHJpZ2h0Pw0KPiANCj4gWWVzLCBjb3JyZWN0Lg0K
PiANCj4gSSB3YXNuJ3Qgb24gQ2Mgb24gdGhlIG90aGVyIHR3byBwYXRjaGVzLCBzbyBJIG1pc3Nl
ZCB0aGF0Lg0KDQpTb3JyeSwgSSBtaXNzZWQgdG8gYWRkIHlvdSB0byB0aGUgbGlzdCBhcyBJIGp1
c3QgdXNlIHRoZSBsaXN0IGZyb20gZ2V0X21haW50YWluZXIgc2NyaXB0LCB3aWxsDQphZGQgeW91
IGluIFY0LiBTaW5jZSBtb3N0IG9mIHRoZSBtYWpvciBjb21tZW50cyBhcmUgYWRkcmVzc2VkLCBJ
IHdpbGwgc2VuZCBWNCBzb29uLg0KDQpUaGFua3MsDQpBbnNvbg0KDQoNCg==
