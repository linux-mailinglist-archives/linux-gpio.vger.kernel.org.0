Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6DF260C1D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 09:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgIHHeG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 03:34:06 -0400
Received: from mail-db8eur05on2052.outbound.protection.outlook.com ([40.107.20.52]:26113
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728786AbgIHHeF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 03:34:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfgB/y5LTQV08UIhbpEXznP0RebQfZ0Vh+s2EOXJEdvODIkUxAXQ/VjzhLGqXTgxcF0dWBUty7HsElmtWhIZduhCKfmExNq/uDnaVxi6Xc3mCBf0DpvFvTqV19eblcqCquoJBlq2Zfn7kq22ORx7iJYHfYK1ctH1UKUtEHWh4QqmmSkh8hAMi2S9w8n24BaXk+O0JFCesNp5Bn5bqACV3iTOHa8DzW5lNb73zo5VAu4Y4B2KVfzXTaI66AZVriBLGvo+PaJrRczlg/D0kCoymcmV3BhZGXynOuMfsSQXu0sPnG1EaroHE8Qzam8SHzFfN+ZTLenqvUJENmnQB2PIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hoc8VoCXauKqwpqcqKTbknuM3ZlEZm4R967f5KIPIk=;
 b=gElysDy64H+kZQORnKK+2zkNG/3F1AhhZmZwrBeqOYSwaTFJttajRWHA5rAuHdpeJIJUT6A8wdKHfFtmAHleyggIL9M7TW7Ml8RAkjzDaBq6tUcexfAOaG+O7ul9Bkrv0HPlyKnheX/5aaNBdvlc02zdAC4XZz6omYK2Gp7FgLTg2zdEsl2D8IIpBKCQDiuLmdl693n5rlNz9IyjiqUm9sHz47RppKIBNBWAnwdt3rYS0dUv/EVtKXYGKIicY0RP93Uml9+0w8ltDmQdFba44SqAvroWWFPqyRtnbobV/d8IGyMmiNYSo58ApsHdD7wVrbGQsaGDLdwc2KAWYzSjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hoc8VoCXauKqwpqcqKTbknuM3ZlEZm4R967f5KIPIk=;
 b=KVuqoG65g0wEiX+lRXUSCGGYNUvPhf7j8nOy3+ZsP5mDaqXlAkOLOoDpr81t1k4dROFO9CBWKWy78fxrkM118p6fxm6+k/VK7MN79YRxnHwEpy00KmrNwBGoXBupLKoJWOTLe2nHed9jU6XGkH09FS/dzVBI9IAnVm17gOpW64g=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4761.eurprd04.prod.outlook.com (2603:10a6:10:23::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 07:34:01 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:34:01 +0000
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
Thread-Index: AQHWhbBDjiUh5DFSJEaP/TwCOvRVnqleWKmAgAAAdkA=
Date:   Tue, 8 Sep 2020 07:34:01 +0000
Message-ID: <DB3PR0402MB3916716E9FC26ADF9161B4A4F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com>
 <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
In-Reply-To: <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32a87816-8d74-418d-45ba-08d853c98e85
x-ms-traffictypediagnostic: DB7PR04MB4761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4761FD2E7DCAF10D66DAF227F5290@DB7PR04MB4761.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Sud2kjoulGRg7amCh7H2x5ZEvo0IGrlzwjiTzR0PQ+01lX+dFWbAQu9qklpmOqmYv+k9dOiLmer0X381jeiTrRETiAsaHsYi+H8ezsd3BqQRuzJ5kObSjDIx6BQZy7cQjIKmUTFfJNNW1F+QRorjrpnofgbmLPobvMEfRFghcoFZYpB45QV47sfBHXm4QIWTT+FVnxxHJPPwHAbdwj8hPqgnqHO60APkUYmV2VFmYx8nDvSD+FlU/Ma28g0sNHr8xY2ICGtr7M/5tI2HBh0gWj3cpxuBtT37joedKGK8L5q2SD7MPbZJq/LIxvbFxVo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(8936002)(44832011)(7416002)(5660300002)(4326008)(71200400001)(86362001)(52536014)(55016002)(6916009)(9686003)(4744005)(186003)(76116006)(8676002)(26005)(2906002)(66946007)(7696005)(316002)(478600001)(33656002)(64756008)(66476007)(6506007)(54906003)(66556008)(53546011)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4PvMD2zw4n6EDyeY2RCt2it86Vz85INeyQkAR5giC8NVOf3sxt6boVY246IjCFpIjXuWR3wEb78RYR474OyxHSyrfQRhk9Q3t9rO2CTidPsqJmFbDffAleBiKWywPOHPP6z6USaP7HVUoAAj9DODnwDmhRSdEe0Oa1B/BMT0w43Nz/4HcLmIOopsc3Tn90H5Su+r5psBt1VyM2DPJZLArkR9of2U2gSd721pRd4nl9S6uErPuKHcIm6xDwiamRbQ0hDPGMe0f8D2tojK26LSGEhO3DAN2jaMm0eb4YbVNIobrpd1Cmxbw4+blU1EPbDhoYqZ5BhMcW8EHay/JH4bzKw9gW1+qicuMeb8CkuS7FioTNBiRNMiL+X2v7HIFRMPSGtwQJQvkQLYPrc8bmNnY8HyWNFv1mUMm03AiUGIYdlxxcQCuupmTCluAuK1di2gR3ua+fM+Wmnj7ls+FhxiTwkITfkOcUMNdTQ0ZNZx3dAww/FUBnGD+pTs/W9zr5p4vLhoHdTLKeu+gjgNmm6TIN0nUW0gQRED3W0b2sZnqUdEuXaAt44DX5Zet/RgtfoYHvQnEGhl4uV5wk1LoE0tJRnShw+wPMrwinPHLvlPoabQnLqo+OE1v1o+oM7uLNADvoeIVgPQF38aaNEmDrW0Tg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a87816-8d74-418d-45ba-08d853c98e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:34:01.6156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PW1c6bfu1Czq4RdYNvRFidcEVrAuLqus77jbjTciqOt/zIM4TUIfwkys8ndTKQMQmjsPLb7gT/nO5OOs1ftGXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4761
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAzLzNdIHBpbmN0cmw6IGlteDogU3VwcG9ydCBi
dWlsZGluZyBpLk1YIHBpbmN0cmwgY29yZQ0KPiBkcml2ZXIgYXMgbW9kdWxlDQo+IA0KPiBPbiBU
dWUsIFNlcCA4LCAyMDIwIGF0IDk6MjAgQU0gQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5j
b20+DQo+IHdyb3RlOg0KPiANCj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5ICBjb25maWcgUElOQ1RSTF9JTVgNCj4gPiAtICAgICAgIGJvb2wNCj4gPiArICAgICAg
IHRyaXN0YXRlICJJTVggcGluY3RybCBjb3JlIGRyaXZlciINCj4gPiArICAgICAgIGRlcGVuZHMg
b24gT0YNCj4gPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTkNUUkxfR1JPVVBTDQo+ID4gICAg
ICAgICBzZWxlY3QgR0VORVJJQ19QSU5NVVhfRlVOQ1RJT05TDQo+ID4gICAgICAgICBzZWxlY3Qg
R0VORVJJQ19QSU5DT05GDQo+IA0KPiBJIGRvbid0IHNlZSB3aHkgeW91IG5lZWQgdG8gbWFrZSB0
aGlzIG9wdGlvbiB1c2VyLXZpc2libGUgd2hlbiBpdCBpcyBhbHJlYWR5DQo+IHNlbGVjdGVkIGJ5
IHRoZSBkcml2ZXJzIHRoYXQgbmVlZCBpdC4gV291bGRuJ3QgaXQgYmUgZW5vdWdoIHRvIGNoYW5n
ZSB0aGUgJ2Jvb2wnDQo+IHRvICd0cmlzdGF0ZScgd2l0aG91dCBhZGRpbmcgYSBwcm9tcHQ/DQoN
Ck1ha2Ugc2Vuc2UsIHNvIGl0IGlzIHNhbWUgZm9yIFBJTkNUUkxfSU1YX1NDVSwgcmlnaHQ/DQoN
CkFuc29uDQoNCg==
