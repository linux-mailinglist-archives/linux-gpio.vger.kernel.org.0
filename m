Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C871F1A8B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgFHOGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:06:40 -0400
Received: from mail-am6eur05on2055.outbound.protection.outlook.com ([40.107.22.55]:6113
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728988AbgFHOGj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 10:06:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRKChsCMwAqeQqc79gZXwQAa0z7CuWTcjDL09me7EGYWm+MesmLirCRI6nHxfMk5F6dgIJPDZeamO4vtsfre/CE3FZtjzDKDCS2CRXNPYUxnIETIb1E4ORCN0ErfvuD2pEQFxqi++XfTGI+2WSIILPGYAlFPIx/XHETrS5hUAnrUmgiCxjXST8PIJ2pympf5dO/AE2ITIpDUExRh2dNrNLOaZUgx3fI1Nmn2JJZWKyHk8IAAmkgsNj9+9mQroYVkuRX+K+9LkcFh8nrG362+RNmvNB+QXHsl5fop1sMFjIGiCdRDGfW3Qs2M10Yufzv8PPGej+p7ch+Qx9365d+1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v88NTImO3t8WwiKxDTtr2hRBhi4kHV8PRqYB33+9VEg=;
 b=PUU9HiIm44ow9fphQw8Pc/u2QmZc73LQcfZOIuXoUoXB9d/nOtsA8xFQRQhMjIsFptCJQCpaBMojQzB6g9rjxnRBl5qow57Te9vNrAqEQsFS60cAsK1HDpRpkeN0Cm9YPi+YtTv/r2nBaMoy6npifeSwCgLUWIm3pa2KRttKKbXHuDNkA2GenedCJzD+49sBH9Bd+W3ajl5MlXrjJGo0Skt5PcNkQ/r+L3z/754kOw3Iayw6s+q+wYJCaI63dqgFC0FoQqKJzfJrr84kABm9iED2Xq0TENLAQsKXfnwmxodRxFa8iNiBa+QHKneGABnCu8NBTw0RAZLQ4PxZ0wNy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v88NTImO3t8WwiKxDTtr2hRBhi4kHV8PRqYB33+9VEg=;
 b=awuMixieiKBOY13L2b4NTiAfu2To3AbA0LIVMhCwuYmK9LxB+19odLgyuVZLZd87VkMm2OZOoJWmMvy3BsNr2hVSFzNlcMJHYV9S7hII2cPKMwRe2EcA4nivAj27SFHwdUEfNVpd27/uqo5zzWU1Jx0Ck+oMi1aPIgqTSrRUJi4=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5750.eurprd04.prod.outlook.com (2603:10a6:20b:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Mon, 8 Jun
 2020 14:06:35 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 14:06:35 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        BOUGH CHEN <haibo.chen@nxp.com>
Subject: RE: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Index: AQHWPX0cYhLWYDNPYkKbg7yA3TlBhajOv29A
Date:   Mon, 8 Jun 2020 14:06:35 +0000
Message-ID: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [218.82.155.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 136158da-a6ea-4cca-6c8f-08d80bb5278d
x-ms-traffictypediagnostic: AM6PR04MB5750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5750316A2659143109C3EBEC80850@AM6PR04MB5750.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:168;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NUruJsfondLeT8Bhq+ZJiStAaA1GxTeEgzJcbe/GD513jQRuOVJ6q4fo0L+aT+ADzPMCSoovQu/H8MTKVpTgq5brp2fTpnD2x57FxpFMAASVXv2PgxL13dwKJPgbsdtXHNm87ugzU07ocScZmkH0l6pX8veeFFEHcc7wXYqZ/M89EKFT5LxzzuvBUrBBXYmRMKdc8Wrz30zkxlILBpSaai712MdJT0TZC/bQNnKV5Tt6HkJIejwGcdh/b89cu0pzeqZNw8W8pDLY1LjSJipskSOt0BusKYxEsu2EOpZ39r+8hRGFCLoQlYcNc9A5fCFR35tD9bJQgbClxs+zO6ODbAcvp2/p5fC8IuiY1CcNY9bHmDhauEkBHy3PiUVWscyc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2906002)(9686003)(26005)(316002)(186003)(6506007)(33656002)(7696005)(55016002)(44832011)(83380400001)(110136005)(71200400001)(54906003)(66556008)(64756008)(66446008)(8936002)(4326008)(8676002)(478600001)(66476007)(5660300002)(86362001)(52536014)(66946007)(76116006)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ADot9Z2lg4Jd/S2XUKxcLdArwWDusLS2+WYi551wo7kPU67ZAQk7aEWitjkEQp3T5DwAz7hlwL5Itg4g/QNxC20uN90gBnUsdp5tvK1DKvb4tP9kV2O6z4mJJcxdGvkhaZrYJ15Oe2ouEwnQ5fkPApOCaitl98VQF/zXnUD5lkc+RcS8W6SHD2TOcBrKPm3JUGg+30Kbbtp8dveahR77PmDxuFoWEuOFg7TZ/ZYdwJuAo9ioyex20FsPq3ODhyk0eb99sanDGUogI6sNFOClASMwDNKqHxx1AW+9TgK4HbmVdOQRI85eLNDBZ+QcL3tFEfy6xxg+VMNJQilamdZkeQyLgwiF/uMZBNPYvqorkFZccG53Yr+nbsr9EtjObf59VaKBPMvejjLgIfNswP84F2VyD39kU4VU0HC9e0VTb4RwBwFTwmvDNg45BmKUpkxOC8k/BmHvdQ22vKEC6EWO7aHdb0owHK7rEJjCA/PjyqeYK9Rphq43mbEAHOql/2pc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136158da-a6ea-4cca-6c8f-08d80bb5278d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 14:06:35.2541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BOi4b3XP+6j8simI8+pR6HltPQ+1NrFuP75cxrP85+/KaUSRdY+Ifhw/5Y5tr3XUStcc5tdHvjYcigs94VkRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBoYWliby5jaGVuQG54cC5jb20gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gU2VudDog
TW9uZGF5LCBKdW5lIDgsIDIwMjAgNjowMCBQTQ0KPiANCj4gVGhpcyBwYXRjaCBibG9jayBzeXN0
ZW0gYm9vdGluZywgZmluZCBvbiBpbXg3ZC1zZGIgYm9hcmQuDQo+IEZyb20gdGhlIGR0cyB3ZSBj
YW4gc2VlLCBpb211eCBhbmQgaW9tdXhfbHBzciBzaGFyZSB0aGUgbWVtb3J5IHJlZ2lvbg0KPiBb
MHgzMDMzMDAwMC0weDMwMzNmZmZmXSwgc28gd2lsbCB0cmlnZ2VyIHRoZSBmb2xsb3dpbmcgaXNz
dWU6DQo+IA0KPiBbICAgIDAuMTc5NTYxXSBpbXg3ZC1waW5jdHJsIDMwMmMwMDAwLmlvbXV4Yy1s
cHNyOiBpbml0aWFsaXplZCBJTVggcGluY3RybA0KPiBkcml2ZXINCj4gWyAgICAwLjE5MTc0Ml0g
aW14N2QtcGluY3RybCAzMDMzMDAwMC5waW5jdHJsOiBjYW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3IN
Cj4gcmVzb3VyY2UgW21lbSAweDMwMzMwMDAwLTB4MzAzM2ZmZmZdDQo+IFsgICAgMC4xOTE4NDJd
IGlteDdkLXBpbmN0cmw6IHByb2JlIG9mIDMwMzMwMDAwLnBpbmN0cmwgZmFpbGVkIHdpdGggZXJy
b3IgLTE2DQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0IGJhNDAzMjQyNjE1YzJjOTllMjdhZjc5
ODRiMTY1MDc3MWEyY2MyYzkuDQoNCkJldHRlciBhZGQgeW91ciBzaWduLW9mZi4NCk90aGVyd2lz
ZToNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpN
YXliZSB5b3Ugb3IgQ2hyaXN0b3BoZSBjb3VsZCByZXN1Ym1pdCBhbm90aGVyIHByb3BlciBmaXgg
Zm9yIHRoZSBvcmlnaW5hbCBpc3N1ZS4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jIHwgNyArKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiBiL2Ry
aXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiBpbmRleCBjYjdlMGYwOGQy
Y2YuLjFmODE1NjljN2FlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9waW5jdHJsLWlteC5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3Ry
bC1pbXguYw0KPiBAQCAtODI0LDEzICs4MjQsMTIgQEAgaW50IGlteF9waW5jdHJsX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ICAJCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJ
CQl9DQo+IA0KPiAtCQkJaXBjdGwtPmlucHV0X3NlbF9iYXNlID0gZGV2bV9vZl9pb21hcCgmcGRl
di0+ZGV2LCBucCwNCj4gLQkJCQkJCQkgICAgICAwLCBOVUxMKTsNCj4gKwkJCWlwY3RsLT5pbnB1
dF9zZWxfYmFzZSA9IG9mX2lvbWFwKG5wLCAwKTsNCj4gIAkJCW9mX25vZGVfcHV0KG5wKTsNCj4g
LQkJCWlmIChJU19FUlIoaXBjdGwtPmlucHV0X3NlbF9iYXNlKSkgew0KPiArCQkJaWYgKCFpcGN0
bC0+aW5wdXRfc2VsX2Jhc2UpIHsNCj4gIAkJCQlkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ICAJCQkJ
CSJpb211eGMgaW5wdXQgc2VsZWN0IGJhc2UgYWRkcmVzcyBub3QgZm91bmRcbiIpOw0KPiAtCQkJ
CXJldHVybiBQVFJfRVJSKGlwY3RsLT5pbnB1dF9zZWxfYmFzZSk7DQo+ICsJCQkJcmV0dXJuIC1F
Tk9NRU07DQo+ICAJCQl9DQo+ICAJCX0NCj4gIAl9DQo+IC0tDQo+IDIuMTcuMQ0KDQo=
