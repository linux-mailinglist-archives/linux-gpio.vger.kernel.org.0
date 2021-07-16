Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486123CB13D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 05:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhGPDwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 23:52:47 -0400
Received: from mail-vi1eur05on2061.outbound.protection.outlook.com ([40.107.21.61]:34914
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231230AbhGPDwr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Jul 2021 23:52:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUQ4CII1WZDrwr9oqWkwdtP3YLE0BsdUpJ6gNsuNmaKSEg/N6xM1g8VbjrFZ6iycm87xBGrQoMFPk3/UNO74gKw1M7RXZ7flNpQEVvnZn/PSqh+ZQ4/kEwr8GI2PusChTaS+Rx8CY26LF3i8dBcGqBw5kSgtBxjHK+j2lU+SfWVUfewwG5rNi5vWIs+o5Ym52VSJ2e0ENtqjcDOV+ui+2y8sss6eRyqf+vtb2BLeVdyJbEgxGleK8LDwkkUv4M/FhaXUc6dlEWoDC3Fko+A1XOfmrtYplaIpO/tYQj/JMUjXLi8QLNf1qD8FBARKqC9UUkg3veI+GvfSXwP/uk3HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGI1xHNeEaT/a+rxXsYyE4H1K+C1KloyiToqbdkvMFE=;
 b=gRfVeOYFdjku2uUv/lFzMtIZ0t4+SEYsgNiB/eAhMp0Xqna8j90mRnYkd0OZaakp1FTxdmsTFqgFtyksYztDx7FvHW9gt8GwmcS9aeKQwDdnVggcrcnVlkTYGc+Mff4Nt4tiXf7+UmXJZUOaW/7qqm0yRqyWzd3fphgUhkPwqnyFwBhZmefD8w+0tdGtM9peShy7Dk/Uq7aa7Bml2QF2f5mT3hLUPB/Yyih8Nfm+5rC5OLEC9WUcUVoP6XVeYYArL7S00/aD6vdGxKiBIiR8Nm8qxb+Q/jRMFIkF3kvsWC9ypD7WEH8AqYU+DF5O4oVjnwJ65pkVbKwxs5H1QutnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGI1xHNeEaT/a+rxXsYyE4H1K+C1KloyiToqbdkvMFE=;
 b=qHqVW8fTd4+7trVfSoyw8zLFQcWfnp+cRQDRwejHauNa5J0zrIjo8UnqlI+WaC0+ZynaBUoNuZ/n5KlyvsO1hzg96f4tMROAYevQOZDbjZ2njWTEBmNsyothNX5a6Lhm9RYKExPVy77ipJiT/xJkkhJ7qhYyhwiQ2yZt7vNjxEg=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 03:49:51 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 03:49:51 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 2/2] pinctrl: imx8qxp: Constify imx_pinctrl_soc_info
Thread-Topic: [PATCH 2/2] pinctrl: imx8qxp: Constify imx_pinctrl_soc_info
Thread-Index: AQHXd+ItMIfbqdAVqEmD2Z5ai6WxtqtE+pow
Date:   Fri, 16 Jul 2021 03:49:51 +0000
Message-ID: <DB9PR04MB8477C93EBDC8D83B3FFFCF2180119@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210713122513.3112941-1-festevam@gmail.com>
 <20210713122513.3112941-2-festevam@gmail.com>
In-Reply-To: <20210713122513.3112941-2-festevam@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f21fee47-c657-46a1-de82-08d9480cc3cc
x-ms-traffictypediagnostic: DU2PR04MB8662:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB8662223E0FF12E1E044A680B80119@DU2PR04MB8662.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ktiwRnf1kneSzUvvG3rarMjkQosa3z4mKezP6tgHCCkglAeSpkKxVQEslCBm0aHAD48AOX0wy1f6N3LXLul4XqZbxcRJAK7R8NaQpUhOBmRtwgvtgro2NXg6Ix8PRmA/0icywZrl7Y5dagP4aHzHpBIy+w5VbUZMAMgygsv89g+LUvwAmaY9Q6Iyv/9kJmVww0JfxMidRAHtxwG17ZHClMLnZdU352om/yDLKp9HQKXR8W4s5Nbg1ZMFLWA45qjp01+pnBnOJq/JF5ZMPJJHkW3r1LAz9r7/7cyVDWq81c3Q6AkT6BCDh7BgvJgyieo1OBhY5ma2unMA3MVndcZxIVLQo03YnYN4JT+a2ayIMMlpl5GdmzJUftN8hMkDuMfM1PA4xhMuSu/u+3A9Vd7brDVhQDb9DQLlpUoWzk1ryCvGHSyFC79NT2/brfsc6jqpkJ1WwPuOaEytu2hlmeQDJEOdSPx6vgey5b/J/GLaRDb2HcC4iADC6u0LGK4zmW/iYkK7YdrCfizFmEKJANWVuAeSLT90xXocL+lM9Fjc/vLUpVsZfhyYqo06Bc4pbVOaYkcIwTT4dF4eg1dMiHKaMOFmKIXkMvwXhVRLirmcSB8YTX4hlzUQlqGAOFnLba0uAlqfO/nRxCUOGhhNIjkYUogTKWea4nRZyeaGtRStma1FY1HDaHUReJWftsXiggNJ9cbdQzYJyGGAeNkQC6kiGPr0vW9QzEtZx5gCIZvu6Mw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(64756008)(66446008)(55016002)(71200400001)(186003)(52536014)(7696005)(86362001)(5660300002)(83380400001)(33656002)(66476007)(66556008)(54906003)(66946007)(76116006)(110136005)(8676002)(316002)(4326008)(38100700002)(122000001)(26005)(9686003)(2906002)(478600001)(6506007)(8936002)(44832011)(32563001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVpIRVY1eW56QVhabFlIZ2hQdUpqWWxrOG9JU2xjMVpyVzdXR0p5aEt6dWhY?=
 =?utf-8?B?MmtkZmxRZU5oTExvUHJONG01eUxUcWJkeGJuelVXRGQ3SmE5M1RSMDYzUjZW?=
 =?utf-8?B?emlKUVFzckhMc3JzbnJJd3A5T2hFUE9FOSthZEhNemxLOCsrdzdSOEJEWGRh?=
 =?utf-8?B?NFpQa0NLdHptVURCdTdPbDdwc29TS0dGQ1kxYkNEMjY0UlhCS01YK2FLcnZz?=
 =?utf-8?B?VUZBbnFlLzZpUm1ZOUZ6amhuOVBnd3ZEOGxqQXhXWUkvSno1T2JqaHE5M2R2?=
 =?utf-8?B?V01VR0pzQWRqak92Q2lPcmx4eWJJRFM3Um83T1RTTkozbGgzYUNKb3RsR3l4?=
 =?utf-8?B?QU93cEliZXlzVkxMRnpqVUsrM1N1L2EwemdqV09NYkUvUG9wRXFoTkJxR3FP?=
 =?utf-8?B?MGhRUEorRTFtZGREaHFoQmh4N3N2cWZNTjcxT2l2MXpNb3B0SU55T3REanhG?=
 =?utf-8?B?TzJHQTQ2WHJJMWlFODRwaHNadmlBZzJNNTNDVjBkSHI4OUNIMDRtWlBJZkRH?=
 =?utf-8?B?a29tcVVNRk12bTYxNDJHeEdzN2I5YjlJeXpvYUtLU0JXTDNQcldwUE1Ob2pW?=
 =?utf-8?B?OUt4elhNdFhzYy85YS92K1hoRmRWOUh0MFhaNGtEcUxNNWhCR0NXK1Q3MVEz?=
 =?utf-8?B?bURRQXNLMENJQnZMU2VhT2hVYm5sT3dYdnVTNENhLzRSSThQcFJOaE90U0JX?=
 =?utf-8?B?aUNJRStsS3FWSTRkU0gvd2dCUThiMmt6TERRTVZMQXVJTXNSaCtueXUrMUdK?=
 =?utf-8?B?a3NEYkdYSUxTTjJJeFpVSUo3UDFnajcyUER4UWhsSmtyVFU0Tm1uWm1vSUxZ?=
 =?utf-8?B?eHZyWW5pSmJGN041K3RNbnJrUjVhK3EyVG1XdjUrNlRic0hvcnFOcWx4OGpR?=
 =?utf-8?B?NjdSSDVaTkRLTy8xaWFHaE1UMXNEZ1loMW44UElRUzhhUTRyV0djYkp4NWoy?=
 =?utf-8?B?SEk5TzY2aE1PZXZoWEZXWURHOFlvYWtvaHZ4SytwYUlQSjNENWsxWUdyWGdi?=
 =?utf-8?B?NndhcjV3VDZiRytocmllUUd6RzE1aERjbTRscHVRT2E4SjBIazNMdk1oVjRk?=
 =?utf-8?B?MWJjVkZwWFRFZWlzVDFTdzVIM2ZpbmJLNyszQ0F5d0tvUEEzSktKRFU4Zll2?=
 =?utf-8?B?d3VhdU5Xbk9TNmpCbTY3TllkWmNIdkUwNUNPcnorTDBTVkJzUjdZeXFhSFdi?=
 =?utf-8?B?ZmNNSldPd25NWXFTd2luYmI0d2JuRmpaK0FzODRMd01BRThnaXpKYWo1UFM5?=
 =?utf-8?B?QUlnSVo3aDZyZUZTSExidUdNV2FaNjU5NkpreWJPYzlNL2o0VGJGbmhEQlpS?=
 =?utf-8?B?SVdJM1U3SGtaQnFGTGNWZ1N6amVHalp0dDZSWUhwQitWWTJ5aUhLRktNc3JZ?=
 =?utf-8?B?T0FrZVJmQlZFeGNla2R0WVl6RFJ5NlBOblU4SEpVOFBGc05abFNabUdBUHo2?=
 =?utf-8?B?NHEyVG5NTnZET0xXTDgrQVovcmJ6TDFRd0xQYXVLc04vdzhmTW1wUGpYaTN3?=
 =?utf-8?B?cmJISmdTaEE3MnpiZ3Q1RmlWblB6VXd0aHhCcjFQR3YyT2lwMW1aVEJIeFVM?=
 =?utf-8?B?czdEeHlqdlJBZGN1TWxseW02Q3VPcTV1UnJYZHMwZ0NRTzZqUEFxbHNNWk9P?=
 =?utf-8?B?amdGOFlhWlVva2NMa0Jwem1TT0VLTzhXUVNyMnFOMlF6Nm96VnlZdE5MRkJa?=
 =?utf-8?B?UytCMmlHZjlUUUM1OUJDMWRKbHVHVVZudFBYRzZncG5lVVg3bmdESkJrSFlE?=
 =?utf-8?Q?xkfgMZD1WgP/157CBG+F51eeboOM3Sw0o87uBnz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21fee47-c657-46a1-de82-08d9480cc3cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 03:49:51.0510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gIhwXdpxnMq7PU7djgHBcMRiicedk0+Knk5R5u16w+0o2iwb2h0bP24x0tXdvBfP2+sjMjhZ8kYMVsyXqk2odw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEp1bHkgMTMsIDIwMjEgODoyNSBQTQ0KPiANCj4gVGhlIGlteF9waW5jdHJsX3NvY19pbmZv
IHN0cnVjdHVyZSBjb250ZW50IGlzIG5ldmVyIGNoYW5nZWQsIHNvIGl0IGNhbiBiZQ0KPiBkZWNs
YXJlZCBhcyAnY29uc3QnLCBsaWtlIGl0IGlzIGRvbmUgb24gYWxsIG90aGVyIGkuTVggcGluY3Ry
bCBkcml2ZXJzLg0KPiANCj4gTWFrZSBpdCAnY29uc3QnIGluIHRoaXMgZHJpdmVyIHRvby4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNCkJUVywg
eW91IG1pc3NlZCBwaW5jdHJsLWlteDhkeGwuYy4gQ2FuIHlvdSBjaGFuZ2UgdGhhdCBvbmUgdG9v
Pw0KDQpSZWdhcmRzDQpBaXNoZW5nDQo+IC0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9waW5jdHJsLWlteDhxeHAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1pbXg4cXhwLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxl
L3BpbmN0cmwtaW14OHF4cC5jDQo+IGluZGV4IDRmOTc4MTNiYThiNy4uMGEwYWNjMDAzOGQwIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14OHF4cC5j
DQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXg4cXhwLmMNCj4g
QEAgLTE5NCw3ICsxOTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MN
Cj4gaW14OHF4cF9waW5jdHJsX3BhZHNbXSA9IHsNCj4gIAlJTVhfUElOQ1RSTF9QSU4oSU1YOFFY
UF9DT01QX0NUTF9HUElPXzFWOF8zVjNfUVNQSTBCKSwNCj4gIH07DQo+IA0KPiAtc3RhdGljIHN0
cnVjdCBpbXhfcGluY3RybF9zb2NfaW5mbyBpbXg4cXhwX3BpbmN0cmxfaW5mbyA9IHsNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gaW14OHF4cF9waW5jdHJsX2lu
Zm8gPSB7DQo+ICAJLnBpbnMgPSBpbXg4cXhwX3BpbmN0cmxfcGFkcywNCj4gIAkubnBpbnMgPSBB
UlJBWV9TSVpFKGlteDhxeHBfcGluY3RybF9wYWRzKSwNCj4gIAkuZmxhZ3MgPSBJTVhfVVNFX1ND
VSwNCj4gLS0NCj4gMi4yNS4xDQoNCg==
