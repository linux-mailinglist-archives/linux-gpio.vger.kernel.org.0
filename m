Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA73638AC9D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 13:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241970AbhETLnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 07:43:03 -0400
Received: from mail-eopbgr10061.outbound.protection.outlook.com ([40.107.1.61]:14336
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239154AbhETLlC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 07:41:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbTJYtKSknin2/d0j+A8CCUXKrv9m7xEmP50gc2M5RNj9ejtT31YKmBrLVcxMnwWUn10minLB17wc7xrEdYEsofdtS/Exqyea1w/hZHeb0ohQUfYOjZKJlrzU3MIhmmkgO6AHZh/55PUz2VNijOus/1hw48MNZ16nj0j+Wsy7ClJxx2nBO3a2vG35Dz4HdkFgYx/uWmYQA4mg1Y55SYMhH03ijmXKM6hngbtOSw4+g6FF3Avq184q3Mu0E7+T5SLT5joqNj/VDB/73a4V0kgyQx3UtWFa0h0T7dbndtfcEZygoZgHyGU/J2Ch3b9cH6fsFQerW6MOVpXIKNaEDlKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3tzFKN4gZ8tVQYKVcM5fgNiBv8s5QBwOp55TNKJ1Vo=;
 b=ocVGLfIof4HH+4Qyrfi38C8WgpcBe5XbUHGlbJurxtC6xuRAvLaQSVH3fLQH6LX+P14kawn/9uAfJjMpSWuuSCPWTyBmMeIlPTEKRGvo26dZ7oHnzUs0o4+N6Eb01y4Bcv0v5RKZYUV4+JIWq5c3jwyVgJGyHOd6tQuo0xcMLoJcsd+Fjz//P2eOBRq0rJbq/tTOQgN0TFVkB42RIHwVulR8dTCsORaR/Fe1lWBWuTXfGYHJAKh7NkLemC9bGyElhO/heAXzXCwzZwHrRfxPPrVWL55OZWcyjEDvpOrWw2C3bGWlhrcBv4fzfCxmlRs53TXWtzgeu6p104M+h3XlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3tzFKN4gZ8tVQYKVcM5fgNiBv8s5QBwOp55TNKJ1Vo=;
 b=Kireg9W2jSVY88DSNEXEcDmUkIlGkWShdIjdg+dv4eYe3kmgBhc90yaCt0co10+RGdDL/lTaoRw8qWOE2uVAawvKYD2s7TBYy38Ti8/6DEc4hmQGpcxK0KVSdicIk34w0EGQZbEZIh9B7d6ZMBkGdwDTnytMui0LLxrDWLyajck=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2474.eurprd03.prod.outlook.com (2603:10a6:3:6a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 11:39:26 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 11:39:26 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH 1/2] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXTWtCG0BzFgXhPkyGPTOK/IVxL6rsPrqA
Date:   Thu, 20 May 2021 11:39:26 +0000
Message-ID: <06808578468493bebe8115e54fb1c439c4175cf6.camel@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3964df5-9a47-4774-3dcd-08d91b83ec29
x-ms-traffictypediagnostic: HE1PR0301MB2474:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB24741751ABE639F3DC3DF617AD2A9@HE1PR0301MB2474.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LVGBNBEYrcLZr3OIDUuh2YaILHZX8cdwger2oZGLZ69UjVsef70f+EhgylIw6l6zn7Gv2FM9ZQOYsw5io6pqjZpxQmM0BZL1HdAIljnwGvSNGyWvfVobcW7kIU9mHu/t8UIsFwYw8qOhMXsvLjn8IQhPf52gLtKl55WFFhKJPfRRovisX+BhxpDJZKBkM2V7PLf+q4QWmZBxqchyX9lD5CSzB4ApwZHRvTqn8zFBEfGKhpHrI00FeQ0Rq/Sn8orfSp+UlL/01cphSa4gRXduQey8e0EFuzUfVTIh+OAEieG91jJr1NOS/x5JhrDiomudlURCvm0YjymHKGB2X0DoyllX5dXuxPjXN2+BSdtfLpFXa9kGpQGwIBXBGqR/sS7Nx+cbBApiA+u5TRyiG504/qjBv7WEvc+uzMarmdgUIojlnrnTHNB63aYLES5KSuUjRfWPc7Tfa14n8GzcAvxeeHcNKENe6UOgpThLvpn43Ky+pb4gK+yOXPAB84hnEl90LfNOxTwIKOmNMF2TraIySpF4xVNRWaqLm1Dx0D5Gxzz+RQ1oMxuLzWNcfjqtRWEFMwXE5imox4vdbXp+KCMsLWbWL8DaHZ7CtR1y+C/7LpvNTbc1H/udWx2Qn2VitNoxLJBT2QHMDzfmMjQQtJrhjkvoIzScxiOckzsFX6xIzp4VSCjuFBZw3NDZ9QQtzH25
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(396003)(366004)(4744005)(5660300002)(38100700002)(6506007)(2616005)(3450700001)(8936002)(122000001)(6200100001)(6512007)(86362001)(8676002)(6486002)(66556008)(37006003)(966005)(66616009)(54906003)(66446008)(83380400001)(316002)(478600001)(71200400001)(76116006)(2906002)(186003)(4326008)(64756008)(6862004)(99936003)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QnJZY0lQemx3enZwYkFRc2htYWJOaFJwcVFpZVZFVzI1d2pMWGg3MjNhOHB1?=
 =?utf-8?B?c2N4SkpEZEZXYnlDejdaOENjbUM0UnQwcytjUXcvLzYvemthVU1KbXAra0ly?=
 =?utf-8?B?Wm5VK3F3T0t1RlVkYkRQM05va3JWc0RWMmtML20wYXBJNkVMTzFMNjc5dXpJ?=
 =?utf-8?B?Kzkybk5NemVCU25za24xYUdRYVNTbUVHUDgyVFdVbURScGh0bEdlM3U4U3NP?=
 =?utf-8?B?Qjk5clczVTB6amNYekQzajFZMHJoZmdwaFBNMUFIRHhqeFpxTkMwTFBiZmZs?=
 =?utf-8?B?ZXBLbXpmNlBqRjgwUnMzT3NRR1piWXFrbVEybUtWaC9HZXcrcHkra2xSb28v?=
 =?utf-8?B?bngvd0NrQ2lmQm1pNFBZd3lJaW1QSjdkbUtnR0VkMEdiM0pIUTBwZ0wvYXpv?=
 =?utf-8?B?NEV6SjZyZjdjcStocXRMTFdJRUtWajU0TGZrU3RmWHVHZGV4OXpReWpod3Fk?=
 =?utf-8?B?eUdSb3ZmTURXRUovRFhqOWFoaWxUUkRVVjdaWldNTXF4YUhuN0haWnFqR0hL?=
 =?utf-8?B?NHVXeXNKRzBzZkdnZ2EyRG1KT0E3V0RQR2VDN3Q4OTVVRVFHdkpkWEtyYW1H?=
 =?utf-8?B?TDlER3JVRHdPYUlRTTE1eml6L1lDWGU2eDY5VGpSRldEL1pEbi9YZU52TTdP?=
 =?utf-8?B?elllamtncFhxcjBOYXFodlo0NlRCblhaY3VFZXNjTVFOZmVIU0dvTnpjQ3dw?=
 =?utf-8?B?RXpORHVjSVE3Tm4xc2JqTW1DR3cwc1dCRXBqU2preFB2dWY5QnVXR0VybFB3?=
 =?utf-8?B?Qk5SWE15L0c1TE5paTFVZk52c1phY3lMd3F2ZW1hYWhLUzBvajdzYVJUT2tp?=
 =?utf-8?B?VGZvRklFN0VJRS93bEtyclJza0JDWWo4NVJJOUR3Y2JGa2lXenYzMUdYeVBE?=
 =?utf-8?B?cmlSK01NZUp5bE92c1hjLzZrbnY2SEFxMkNTQ2htM01qOFhuMUJ1bzdDYUg0?=
 =?utf-8?B?QVlqNzNJVkJ6N0ppckpWWjR5MXFUeXl4YUQ1bkhqUGJCczg3OStuRG5TUzMz?=
 =?utf-8?B?ZHJiQVlLUkVvanhLT3BvdzNBdDU3b0FPcWROSWdyQ1RRNXArQzhZWnFlSEQ3?=
 =?utf-8?B?ell1MDJ4bGFjYmVpRjYxajg0TlJva0VvaGJDajNJWXVpMHZIaDZjN0NuMktS?=
 =?utf-8?B?c3BKWERiOG9rbjE5aTZ0MzFmWk9xNTQxanRneVBFU09MeDFsZERnNjBqTUUy?=
 =?utf-8?B?MlVacENlZUdTVnhEL0NVNmpTUlZ3Y2ZEaXlqaW5YSXgrVC9tZ2lXUFRyc0xh?=
 =?utf-8?B?V2hpdWFDNjVWOHNWN3phR2NnM2VGUzlTKzZRZGYyUGRlTjgvQUJLKzFaUVV4?=
 =?utf-8?B?VEdVZlZkS25BYWQ5V29BdVJCaWNENEhZMDJ5ckNFbFR3TXVucXhDME5tblJj?=
 =?utf-8?B?YllGVXZqSys0bzhDYnFyZGFZaGVoaHB4SmVnK3dvU0FIRmVYVkM3YkVyWmth?=
 =?utf-8?B?N0ppMzVuMmJwdWp6cHRKZ0dXN255dDU1UEs5cmxIclAyVFdPTnFuTEdMK3FE?=
 =?utf-8?B?ZFp0OFNMZk1LWm1jeTcvcjQ0bEpQOTlzT1plV2Rsb0FKT0owM2JhUVB4Tm9X?=
 =?utf-8?B?NlRSZXhkay80QmxDTS9ubmwzYjd5aXgvVTh5eEh3QVZMNVh6WUlHVUdCcnFZ?=
 =?utf-8?B?UGJjd0JDNytxSGFQb2hQeklvVDQxZkwxZjZXa0NVT1U4Tzl0TnlTR1g0NXdh?=
 =?utf-8?B?ZGpoWDRFLzVDdFlPSFkvMHNWRmZRVUl0cUwxT205UVNHYm5sQjcrbHNUSUtG?=
 =?utf-8?B?N2JVMXRnZVROSW1DZ2xSckZNOHZubmF1VmJpRTB4eTRNbDdjM3FuaGVSbGQr?=
 =?utf-8?Q?7vVJBIzRQDEdRwz2kGXTkDXgkaUXZJIRYNVzA=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-z8l2Q3TWI3bCSZ7rJD4G"
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3964df5-9a47-4774-3dcd-08d91b83ec29
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 11:39:26.4930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MZF0B0rG063FxNuD69VqROgQNSvesSraREBZqmi4eE2eNl8hj8/B26vKmsdWEiC30whBffe9ZEClEy6ocFFF7clnJs+VHk+jOU/zWltUOZhoKip+js8wkgQmwwx1KkZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2474
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=-z8l2Q3TWI3bCSZ7rJD4G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On Thu, 2021-05-20 at 14:28 +0300, Matti Vaittinen wrote:
> The set_config and init_valid_mask GPIO operations are usually very
> IC
> specific. Allow IC drivers to provide these custom operations at
> gpio-regmap registration.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Ouch. Immediately after sending this I noticed that I omitted the
cover-letter. Sorry folks.

In a nutshell - idea is to support providing some IC specific
operations at gpio_regmap registration. This should help broaden the
gpio-regmap IC coverage without the need of exposing the gpio_chip.

Some preliminary discussion can be seen here:
https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974=
.camel@fi.rohmeurope.com/

Best Regards
	Matti Vaittinen


--=-z8l2Q3TWI3bCSZ7rJD4G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCmSm0ACgkQeFA3/03a
ocUYyggAkbMvzL22LH54DBnyzvD9bsMHohOGnlFxq1mTcPEPeK/jfDY052izgF4j
+kO9Afl6oasRxlSyj9H+p2pdBl0+Yx0c0m9OzkZLnjpCcJMYG9R+0JrAhBSMjah8
KKuWBmJhgg2GrfkGvtXeXC7ULkH5SzCx0hHv4qCi5mzeoDG8nwrDgJ8MS4+6rRTy
zJGBRMTLNj001Cmy8VgDX4YdsZLtSgw6fbHPiiFx2dANYTx5IbFdzKoKwirnbW3r
AYOiKWnhGlS0PvCKWeTWiSjfCP06LJeyMPhZjABmlXq2yk7jBlDr+BqlTmcDiYoR
hdmsOTdxDts3KBnVhy5CwpwpV44xuA==
=//GP
-----END PGP SIGNATURE-----

--=-z8l2Q3TWI3bCSZ7rJD4G--
