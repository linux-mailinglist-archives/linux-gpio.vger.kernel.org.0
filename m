Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0F42ECA7E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 07:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbhAGGY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 01:24:59 -0500
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:15067
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbhAGGY6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 01:24:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctG1chpKmGxjhAEsoT8rxVOFefKzMdSkBWacWn+uqbHWo6/PyDx1M8MN8t20TH33h/NgCO1p2Ns3WCvUCl4Q01YuqRe9n0E5n6iQ/INbfbgQTXSy7y83RbmgsQyeY14Tp2Ttu6PRn8ebQtjjGCdqz4/hX/B4qwtxwAnfxjIh7u9NNsbSjK2ftY8MK7azWnErz1mS1rVXhBuyVkVCJHZqx7HgE642h0/NGyJdpc+lylhd8qMeGswMyIJhuZdOVkOZBG0jHEFQgCSSwsp8WW/kj8ZMMSNXBJwgIAVioHLp0n0KgTQnIWfMoAy1Xtfyd6qA8fSU35gh3rwCxkywxwsfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMXeFblpQvebbUawpEFJDhXPI4fZ1VYtXXJI1mLXBLs=;
 b=d6+eZ+Qp7q1kVii1JXtQNLnP7QZYSc0ae5h+SvHDfX8rDsumn2tyZjXXuUskD4MuqBEoXiu8qGK2SuP61718pq+yQ0/d6wBLQi6EJqXt3pC3P5ZnSqjmxGJx7MKFzGX3lpQomhhINii3z1aIO1qKI10UmzpaPvh86/gYET768qLwqcWfonsB8Had2wyZmwjd7Bp+1JRCUZQuUFY4RXlr6E/U/EINpJq5S6BO4x9tB2MsMtS+PN61xyDMOYZ3Wt+SwDa8AZ9xCyjvfBvFStwZDBQv1l4WjyhDyOC4LCec8CD6T9XsmifQos137vdWuqLJMwdOJJbzIvhmXh5cT4asqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMXeFblpQvebbUawpEFJDhXPI4fZ1VYtXXJI1mLXBLs=;
 b=dN5StX+Fy6tJA+8jnon9GJEgy7WNfLmXucZ52SQZpnuu1TsV1BXGyCxiH695lh/QZv1q+jeU3ETFaiLFbwgJpfGPL//gjWBhqfKtlI7+iF+OUTjHs7I3RdhzP1wtvqHsWkSmRCkmtXtzlM/j2VaEUBoTRV6yvdv34OcGQLxqTbQ=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2171.eurprd03.prod.outlook.com (2603:10a6:3:2c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Thu, 7 Jan 2021 06:24:10 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 06:24:10 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: bd7xxxx: use helper variable for pdev->dev
Thread-Topic: [PATCH] gpio: bd7xxxx: use helper variable for pdev->dev
Thread-Index: AQHW5BRTB8TkAz5qSEuDptUuYkkLf6obs0AA
Date:   Thu, 7 Jan 2021 06:24:09 +0000
Message-ID: <76dde1826608c737a706ed866af363a6dd5c1b4d.camel@fi.rohmeurope.com>
References: <20210106101133.18379-1-brgl@bgdev.pl>
In-Reply-To: <20210106101133.18379-1-brgl@bgdev.pl>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b95f2c97-b90e-49ba-1044-08d8b2d4d81f
x-ms-traffictypediagnostic: HE1PR0301MB2171:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2171F2D85DBA2F962C5B90D8ADAF0@HE1PR0301MB2171.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6VeLZWdtnbWzvcCgtij/RTc6D5mTEYNb/S5QlE876hgNQLJ6tltYZDWnyA3yI+FJREPUpserOSOS1Vbo/UVeqWFSqJPhIJ2Mp8+/oM3IdcDeYl35e0ivaFyjT5wMCEVWuV6WiuVVH0v77yhLbo+JS/N34Ec2LLEncnlsFayebDEmXT5doJMNlHeqPp4d8g7wJuwrN2PzAblRMrBrV22MJLDD1SfDDRnFKmu3d43uOvL3/CuYZc7NKZheftGs4AA/r3I7aKo/vEaw+ZkjhQu2O+w/+m5wiFQBXxBpX26Kh5I8PNXu4lwTcNtyEiL9TuNLbXNeOhQlICArkO6F1HP6nCtP/3JxPV04kK2Eby6kM7uWgiisJ0PgN9SNZVE+DIqbQGUT5puRtBvzRkujUKjWzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39840400004)(8936002)(6486002)(8676002)(4744005)(66476007)(66556008)(66946007)(76116006)(64756008)(66446008)(2616005)(3450700001)(26005)(6506007)(6512007)(110136005)(86362001)(71200400001)(186003)(5660300002)(316002)(478600001)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eVplOXMrQ2dsYis1dEdJUERGck1vNkJIRzVIdmFydW05WE5IemQxb1hIem9y?=
 =?utf-8?B?a1Z6UVpJNVhDaEpoTjZGVWk2WldFUllrd3dLMWVkajZDblhWVGpiNEt2dXlm?=
 =?utf-8?B?UFMzVG5mMGxsM1NMcjJIR0hnY1VaOU9YS081TjlTTCszRHgvVnZHRFczb0RI?=
 =?utf-8?B?Qm5XMWx3QXVXekZPMWpwMXZSaWJQQ3hycDlYUDdod0IzZUM2MEhHTTdoOU4y?=
 =?utf-8?B?ZldQRTl1aEdEaDZUbTFNcnM1b2kwRW50U0lJRTJvbURSeG45UXZKSHJ5Uk5J?=
 =?utf-8?B?VGExVndxRDErd21sem9MdXJnalZmWjJSU3c4Y0YrZGRlNEFibS9DWFd0cUMv?=
 =?utf-8?B?YkpIdEoya1VzcFFiKzdKWmtrUmVNRkR0M2h2R0ZNWXpYRzRLM3RCVm00cytH?=
 =?utf-8?B?Ky83NW5UN2Z4bUxVMStXanNtR1hRLytVNUZPc0JrbjZnQXBpSk5XWGFMTHVP?=
 =?utf-8?B?QkkrTG9xS1JTK3k3Vnkyd3ZlWndVanJwelg1dzVpL0dqZHFIZ1p2TnZYR2sx?=
 =?utf-8?B?UFU2dEs0T280OG9aNmIyZHhGUDByOXJsOTh3Rk9ENkRmdGt0OEsxemdoaGJp?=
 =?utf-8?B?cTlnQnRlN2E0VXlXeUtzOTBCby9ETDZRUldpN2dRb0g1bks4bG1Wb2xyMUlr?=
 =?utf-8?B?VHl6UW16ZExmQmQ0TkUyaGZTSExCY0dxd1dFZVFwZUxNR1M5OUtidHUwam92?=
 =?utf-8?B?VmQveTB3aEloMUJBSjNvbDdvOG1ITjdYV055ZlpSUmpIYWdkTGlGeTBOU25H?=
 =?utf-8?B?VHpOVW9iWTBvUTFZdW1ROW9XVklzajUrZHNndFlGRERnVXFYenRjZ1VqakxD?=
 =?utf-8?B?ZStiZDNzWE85cUhmY1cyRGd0eGR3MVBuWWJjaTFSb2FUaE9kdm9yNjkzenFM?=
 =?utf-8?B?a3Q2TGxFamV6T2RpOGNUbVBKMXhadDFqMnFHVzhjVG9kMTM3SHBpU1FTV2NH?=
 =?utf-8?B?cUppQW43TnI0dmhVZlVLbHp2Sy9nT3JQbjExejNwbEt4ZFZIZUhPcGdHT2RS?=
 =?utf-8?B?bStSOGZlZFdwOHlod2t3WUdKSk9GSmZqajhrd1lrOFB4WE40SkIvam0zQ203?=
 =?utf-8?B?ellxeXRvL09nZ2dsOGg1SXVNcFY5dUVvemlhMkJySkJURXRqcXpBZmgrQmNJ?=
 =?utf-8?B?bGtqUkozMDJvZVdkMFlIWXNPZnRjQmRud3lLWHQ0UWJBNGxXUldtd29Yc3hK?=
 =?utf-8?B?amh2RFd1Y2Z2K0NLMVpKczFSSzkwTEViTDFlZFR1eDZ3bGZpWnB1aTVpVDZX?=
 =?utf-8?B?TEw2OTdDQm1vYWhsOFNkZFhBTlM4K2YxaEY3bjMzVU9QYWlsY3ZQQmdRZVNQ?=
 =?utf-8?Q?l8zpP1g/Av7vQwoj/5RPHJUdEZTb3EG97v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28C736EA33448C4BAA40ABAD54627365@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f2c97-b90e-49ba-1044-08d8b2d4d81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 06:24:10.0401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNF9tj6tSPulzBSNadb0zvAcvxnPe6g9EUjhXnWrIvOdr7LM2ePRXuvK8xlDl/amit3PI2s1VwXL0TM9/d6U67Zl6JD1hgXRXFa2Mq86FtDiiY0QJbvsxePhV+0DXJeX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2171
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIGZvciBtYWtpbmcgdGhpcyBiZXR0ZXIgOikNCg0KT24gV2VkLCAyMDIxLTAxLTA2IGF0
IDExOjExICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBGcm9tOiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPg0KPiANCj4gVXNpbmcgYSBo
ZWxwZXIgbG9jYWwgdmFyaWFibGUgdG8gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgJnBkZXYtPmRldiBh
ZGRzDQo+IHRvIHJlYWRhYmlsaXR5IGFuZCBhbGxvd3MgdXMgdG8gYXZvaWQgdW5uZWNlc3Nhcnkg
bGluZSBicmVha3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
Z29sYXN6ZXdza2lAYmF5bGlicmUuY29tPg0KDQpSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVu
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQoNCg==
