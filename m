Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1653C1EA1AB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 12:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgFAKQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 06:16:24 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:6237
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgFAKQX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 06:16:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsnunleFyzPPTV/LSermN7syM5Ic9kWGhNKArr6xqk6kLpHmN673fquJKv+7xtdpDzCCLws/L0n2HOzQ/2iX1ZUc5d83lbkW9jcNJazI9OjpVO/Wdkz08clo+Mwfn4TCjcz667GItzPQ8G5uGMCEyusejdblbvGuMKU0zF1u7s1247LnPXKbOT7ULUkhpE9NV+J3pu4aSLAFHepeK5LXj5XrTqJHRqKBoPf7xFSARzJCWiMkWBZuyJ9dA45bAUd7WNnjwU0XIE6pZBwkZpNbiZaIps3kBtBKWoxq8oDdnSh8SSmglB/Xf1tBjiovjJjNTTX7CI2GO81DUeuPAnL0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4OHZkbQdFPlFTgF/DtvlEq8Td4ac5xsKtXGzjPUc3I=;
 b=WWgJFSriF5HuxIge845F7DLO2Lri5cEw2kb1HdiVuHoaJzM5qGFRXN4O3cwUEtNlRwIKgJHhnqtkGhVyT86DnJE6A2n1FBsXXr57+HIh1TvhT3Saft+9GLh5YAUVwPBcVMtuQqpv/X0vq94R2kKhgk9s6QQpKiLMfKG5HiBEwKHsruVQO8Ceb/mwzSjE4zarzu0Mc9TIBcfxdAHZ28DmVyaVF+VIaTxC8QqGXDOvvaSHkGaKqM1A29FnLKyImb+jzsX18khu5Sp2PTq9/qVVBFZKUbYjSaK6YCLckv/m+cfw8bibM/NcR3RC8K7RAxLhnJD07ElGxshEA7Q0Kh8d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4OHZkbQdFPlFTgF/DtvlEq8Td4ac5xsKtXGzjPUc3I=;
 b=Cf5lcC1nsllXLEf5h1C271xXf1RgP+sqrJK9+Itazgbwj/b9G7iPHC6hTJuV2nY3TiU/7RlHYbQ5YFGTsgAbDUTSGPzSjdXmjCuaWxuUcnylbR1sdCip2FmK/1xXe6JmWGuRA8/On0YvOl9Yz0yEilqIESxG+rqyWXVbCOV8BiI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4998.eurprd04.prod.outlook.com (2603:10a6:20b:f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Mon, 1 Jun
 2020 10:16:19 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 10:16:19 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Gary Bisson <gary.bisson@boundarydevices.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: freescale: imx: Fix an error handling path in
 'imx_pinctrl_probe()'
Thread-Topic: [PATCH] pinctrl: freescale: imx: Fix an error handling path in
 'imx_pinctrl_probe()'
Thread-Index: AQHWNsPj8tlpXuDuT0ye55IEW7BSE6jDjWYw
Date:   Mon, 1 Jun 2020 10:16:19 +0000
Message-ID: <AM6PR04MB49667D023D9C5ACB7CABF229808A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wanadoo.fr; dkim=none (message not signed)
 header.d=none;wanadoo.fr; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 867180a4-0b95-430e-d8fc-08d80614d3e2
x-ms-traffictypediagnostic: AM6PR04MB4998:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB499803DAAC07E8AD53FFB312808A0@AM6PR04MB4998.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cty4bjJsVdUZMGOtZl7eV7/lJGhnd5QPoXBV7kAU7s7vnZFycA4oExklCSubQisfqX5E6Do8bnCm/JrDKBgqt6AB5hTAHiTlnbGDYnaBYRIdzPlXTDTpjc0x+HKfDyAMeoXYcgumM2zKWWw7AY2SrZOXTEiFIBaY5ihOXgXfgeWYf94ojv6A9PRScS8rXGPTXCpEVNLZf81OPvYILgvxuDjC7+CY4/k/4oyPwtWZyGTDV7QhnZTSkChGNX4GpE4O4hQhUadK8Ivgav+dMlBmEX67ni6YQ5KhC6WFsZ/MrS2EKbNUq4SZPHH3Z4d5aQZ32PLgnwL6n+cH6yG3vn58gw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(316002)(2906002)(44832011)(4326008)(5660300002)(110136005)(54906003)(9686003)(478600001)(8936002)(7416002)(8676002)(55016002)(76116006)(64756008)(66556008)(66476007)(66446008)(186003)(86362001)(71200400001)(66946007)(52536014)(6506007)(33656002)(4744005)(7696005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: N7kCS5j+ylbfCePzl2Y6T8C6jvINIh/MeOZ1rgVj1lSk/ZJvgpHoVvEfZ7rvOuytVMI4O4UgKflt5Lwdz/Xv5dzJxxGBM5t6ll0KtrfPS1JUH8jfqpk5cfMNT7yGlkGbA0KV+fftgVbTUbB9z2ihM5zN43JqDFqVH/VyTezFwgZG0dqV2tQQFp6ZJ9n4x2WY+UvyIe9hQnxsN2XC3XkKpLG89vXHWIOm4CjA/RL7scFo3V51w9xOEPFY50+q5wiAoTDt+BOCHZ1/W7uLD+UiUnPoia3jpAk+lx8j3olba3zKGaLlgUfQubclR94vVlJeCoRcsaWWaWL4TuNiELpuLt48RjNGzrdENsW1bYTekA/8eTgKMNGZeJ65Dv0l+YPC9pj0UgcR+9tZ0is6NFZDDSSVSTEIE09clGItHEtHODAS8o1uOO3/xac31q/yXZRIBIfVmRnI4Boq9bT28H5GHLxLs/LVWkjkcdaq+RH7fp0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867180a4-0b95-430e-d8fc-08d80614d3e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 10:16:19.6227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lrE817ubhxrVGk/665edRMfb+okPAe72CfvR2mDZxajbYJEafv/WdVEDUtO3EKF27E6SMg9W9yzMRGqTqeuqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4998
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZy
Pg0KPiBTZW50OiBTdW5kYXksIE1heSAzMSwgMjAyMCA0OjUwIEFNDQo+IA0KPiAncGluY3RybF91
bnJlZ2lzdGVyKCknIHNob3VsZCBub3QgYmUgY2FsbGVkIHRvIHVuZG8NCj4gJ2Rldm1fcGluY3Ry
bF9yZWdpc3Rlcl9hbmRfaW5pdCgpJywgaXQgaXMgYWxyZWFkeSBoYW5kbGVkIGJ5IHRoZSBmcmFt
ZXdvcmsuDQo+IA0KPiBUaGlzIHNpbXBsaWZpZXMgdGhlIGVycm9yIGhhbmRsaW5nIHBhdGhzIG9m
IHRoZSBwcm9iZSBmdW5jdGlvbi4NCj4gVGhlICdpbXhfZnJlZV9yZXNvdXJjZXMoKScgY2FuIGJl
IHJlbW92ZWQgYXMgd2VsbC4NCj4gDQo+IEZpeGVzOiBhNTFjMTU4YmYwZjcgKCJwaW5jdHJsOiBp
bXg6IHVzZSByYWRpeCB0cmVlcyBmb3IgZ3JvdXBzIGFuZCBmdW5jdGlvbnMiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZy
Pg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0K
UmVnYXJkcw0KQWlzaGVuZw0K
