Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478DF343689
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 03:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhCVCFc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Mar 2021 22:05:32 -0400
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]:6999
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229915AbhCVCFN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Mar 2021 22:05:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmtT3D0EPmY5a1u+lo/xw8rgdUUkKwVj3P4JOZcpRPS84a/loZy1QOnAyuhoh2a9d/nLkthurtf4tlxHh7sgqUWzM1qacceqQ4kT2TSVFxRmaJasEqTa8IC5Xiesl6DahYnfJyKXoFSDB4mX1ZyZeVXSm1hks/kI+XA8SvvoJfhAe8XFeZn1SPzvfNQeyLZfRG+99TeG6I+Guq/Gy6ZIcFcZGPPj6a03N/gd6RzqdvxI0Ban8s250bMfpsy+afkt0Pe+FGcKdihh5r4Rh9h+lgbMuEfrkICATtmtuzBPWxH5NNGzsJUJcJaslxv8YtL1/jmW/nnWr30xMOkJ/a9w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIAhgEKVAGnnJ4kmdlGbrZcEA0NezpVRg+MbDRaMj5Q=;
 b=N/hHjdSHqUXw06emcJ/uQPvPtoU+KIN2WCMgscaVmkSXrFnrSWQMa0ihSQlSud/EOSte/wnfnh88/wncIRiEI4LLhJg2yCO+0xUMOS4oVx3vs96Xh9SeI43elhqJg1qLmRItca1NYrebm6DfNz+ewLwV6nTwrR367Yn5nc/uKt5exjcj/ok+tcOZtJYWevfoinyZmtvTBtOlXJQTiDmK09/vfocVrxrCVfQZijTfWUNVVrPulRYvbbMzQJYXAWhPEVAZR0hRdbe72LUVU/1QxdjD0zxW5BaylladdWMxKRJ/6ku0rqWB1Ttr1tyjmafp0UR9zA0L9E8f3BItd2s/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIAhgEKVAGnnJ4kmdlGbrZcEA0NezpVRg+MbDRaMj5Q=;
 b=E7kdxQr1eEmtdKAPtpErIPoXMCO09AtFEYNdZ3plr322vcBHOF9rHwmM4NPB+oF+QfVhqL5lbUN+sJxnnRJLDM/M7A51EVrkzbemcrjyHvXH26leey/h5n+pxbnI1IbRbmbw4Seuvs020PSMx4cocEDaVU/TeQr6bw/rDaCiH+A=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4454.eurprd04.prod.outlook.com (2603:10a6:20b:16::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 02:05:11 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685%3]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 02:05:11 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] gpio: mpc8xxx: Add ACPI support
Thread-Topic: [PATCH v3] gpio: mpc8xxx: Add ACPI support
Thread-Index: AQHXHJdhoOuCVjOxsEyGbtHnQ2z6OKqLHRYAgAQnp7A=
Date:   Mon, 22 Mar 2021 02:05:10 +0000
Message-ID: <AM6PR04MB5413C279D47BEE68B21E7BBCF1659@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210319081751.3149-1-ran.wang_1@nxp.com>
 <CAHp75VebBcLf5X9TVVdydVZD2wzeNgU=uQ+JLnKD1g4XwjWbAg@mail.gmail.com>
In-Reply-To: <CAHp75VebBcLf5X9TVVdydVZD2wzeNgU=uQ+JLnKD1g4XwjWbAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 89aac70e-8912-4d2b-29d8-08d8ecd6ecb7
x-ms-traffictypediagnostic: AM6PR04MB4454:
x-microsoft-antispam-prvs: <AM6PR04MB44540804999D8134F34EE363F1659@AM6PR04MB4454.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JmzZu1/l99aAIj0hh1s+Q9jf+fZRMqTdLg96om64ICj1e6rmLEeFm/pcrdwg6ix0t+9cATFYUGZAzg6vDrPA74ZPQigPvmhjF+i0AAoaBjv1qq8hVwx/vEls+t08C9P6kMxMYlGFQkXQmeLWSFHnqQ+nJp9IoaJRH3zXqjZrtXDI3iltDiuizcgUcHTUM7XiX8lcQMt+sYXvNJbBNIokV61Uw5zh1q9Qgsb1Kq6eUhR54KEJngqr3lnhZfUrj3ge50aFlviH4Je1hbimIpSdxJyBIZNmI6GZgewu77Y5l0kQCbOL8lHM+cMaQFDJvKQk3vvDm8DPEy3uJF99Kyxcx5PpSnoDEO1y9nu1JKm8Q9lXuR4ppfaO/fOuwgSTiSlDPeTE+bP24KmFgZMBk+YfZLcKlJCis8eST9zMph63LFJJDgJ6a3zqe4HymyOQudqijMn6xOVpzpkAEHROS46pq7EHZUOKSykQ3Ra9+gLo+PAh/o8uvbIvBoybkaWYRjmKx5wWypr7IP3Ww0DecwKfgdaEm77rM/FiuIZmDFGdLcb55j9okotrNpaiYaMHJvBwb9h20CUIjg0fgzSfeUOdDhNXnNTGNUpipkKL72yZndf4hHrNNtDJb0kZ855DZxwfcs/xCihpDuehISz8pZM8AeGoe7Fn2medQmtqOX5SzuEPVnQ/v9vP5caP8Z/qiS0m
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(55016002)(9686003)(38100700001)(186003)(54906003)(66476007)(316002)(26005)(52536014)(8936002)(66556008)(66946007)(76116006)(6916009)(8676002)(7696005)(71200400001)(5660300002)(66446008)(64756008)(4326008)(86362001)(478600001)(33656002)(83380400001)(2906002)(6506007)(53546011)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aXFKR21iZmZuUzhBZkxjTVNFNzdaRmFhSTRKOG0yK25kR2s4b2NRMEVPMldW?=
 =?utf-8?B?bS93WlhOYk9MNy9KQks1SzdtZXJTZ285QlNDcU1BaUUwNXl3YWJEejR6V1Ru?=
 =?utf-8?B?RFBKVmsxVk9yNmlxd1h4V241Ykc0TlN3bHpnT1hHN2RxMm5hdElUYVkvMWFX?=
 =?utf-8?B?L3JOL3c1RjlDRWxSMzF6TW5HY0lzN2RMaDdNV2YvakR2RXk2bmZodGFlUzNw?=
 =?utf-8?B?Nkt2MGlGQXZOT2hUNEg1eEJLOFlWKzlUSVQwZnNtUmVtRDNVb1Q4Q1BhQ2JP?=
 =?utf-8?B?eklvalBJZW1RazBiY1haUTZYOW1LTnU0RTJWTXZvdnlsK0xyRFFNTWtWV2FE?=
 =?utf-8?B?dnZ5MzhFZ2dSTlZxNWlQc0ZWS29OdGo2SFVMVFVsUE05MnlqdDN2R1pPdFdL?=
 =?utf-8?B?ZzNjaWp4SDg1K1BEMTFsVXFDcnZ1U1lnVWs2ZmxNOEdiQ0o5aVJPQlBtajcy?=
 =?utf-8?B?eFBYcnI2N3BzTVVhWVpwcWczaEt5WHNONTRaNmU0UG5wb2JSVk16dld0OXda?=
 =?utf-8?B?anBOVnZtbDltL0ZpVGVtUlhsUENxZXV6aHhwWDhVdzVpRzY1VUV6VVAwRlpz?=
 =?utf-8?B?RFp0VXY5OHVrclR3UVpVUnFpSW1jRnNzdUVTUmhoaHVyS3pWU3B6UzFYQk1p?=
 =?utf-8?B?MFJGeFVqbklnd1VxSlRBcjcrSGprSE00UVA5THI0eCtUS2ladnpNUFlQOFJa?=
 =?utf-8?B?SlNIZTYzNm9DSUN5eXhPVTc3T3RPczZvbTREa21zd2x3LzR3MzdRU1lHTWls?=
 =?utf-8?B?S0JaaUJYK0NZalEyZ2hVYUdwdmFlNkN5dXlBZW94eXhteWoxT0xqYWNBRlg5?=
 =?utf-8?B?M2QzRXoyVHNKWjd0WE90aXZjMWFqelFqR2Vra1llUWpCU0JMTVZrc05LakNQ?=
 =?utf-8?B?YXNoUE5aUCtMZ2RSQXFkMmkrY0ZBdzQ5RVRmdENsT2UzZjYwdnhXWHFrN1Yz?=
 =?utf-8?B?T3dISVRENWpqeHgzdkZEN3BMNUd6Rng5dHNob0lBeEZ5bkdEbWdpeE5vWXpP?=
 =?utf-8?B?cHZLaVMrRWhrYUgyRVF4cU9Dci9qK254blBvTnBHaGc0d1ptTk0vV3dFeXRr?=
 =?utf-8?B?OEZQajJtZEZyckx4WTB3emxIcnpjUFFnWUhISWxvRFBNbjdnWTZtQlhFd3Jk?=
 =?utf-8?B?LzlLWXdQYVNTNGd2MDh2Q3VneTFKYU1GUUF1NmVkV3hjZTlOMHl6YUM5ejhw?=
 =?utf-8?B?dHF6Y0g2d2RJMVl5WUlNc0JUU0ZEVE9RWERFQU1XbkZmOVcrWmZhMEpmR0Vp?=
 =?utf-8?B?anB6WXpRY05lekdlZkZjaVJxRmxLL2N3dzVLTEJtdzArbi9aUCsrblRERnJI?=
 =?utf-8?B?bHU4b0dUdmVrRktyR1B1UnY3dW5OSjFyaGxkZGI2dVJqbGF2YkcxdW1KL1hm?=
 =?utf-8?B?RlNENWwvRDQxWndqNU1MYS9hTXY1bTh2WWZ2dE1mQ0U1SE5URjEzblhpend5?=
 =?utf-8?B?aWJpUDg0ZlR0MVpVTzRqR2dXTGNsaE1SYUpiWmoyQTU3LysyTGo1TnplSW4r?=
 =?utf-8?B?SUtpOU1aSmpJUXFRd2RnYzltM3pHRlZLTUhHbVpnMlAwc0l1d21MeVNBMnBo?=
 =?utf-8?B?RGpwS29MVHkwTXcwRHFZVmI3MWRVUHppZXhsMEJRNDhsMVJLUTA4c0NCT1NG?=
 =?utf-8?B?eERUUURqYlMrSUlsZk1tVWZERm9BYklGb29wOGZBZ3dqWkowZFk2cWVqbG5p?=
 =?utf-8?B?QnN6S2VydHhGSEdhQmQ4TDZYaUZ1eHZPZnVhTG02Z2t0eTZrZWlNdmNHUDIx?=
 =?utf-8?Q?F5X3HYjRhoiUBdhceDiuooLkdjxNH9upyTNTvcU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aac70e-8912-4d2b-29d8-08d8ecd6ecb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 02:05:11.0009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNi7NeSsLeQhnug18yFtkdCs03s0JcQzLmuacddpFHi5+T5HKQYPNC4cKVeAHluJyUP2JFk/brmPdzl7As19GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4454
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KT24gRnJpZGF5LCBNYXJjaCAxOSwgMjAyMSA2OjMyIFBNLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE1hciAxOSwgMjAyMSBhdCAxMDoxMCBBTSBSYW4g
V2FuZyA8cmFuLndhbmdfMUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gb25seSBzdXBwb3J0cyBEVCwgbm93IGFkZCBBQ1BJIHN1cHBvcnQuDQo+IA0KPiBU
aGFua3MgZm9yIGFuIHVwZGF0ZSwgbXkgY29tbWVudHMgYmVsb3cuDQo+IA0KPiAuLi4NCj4gDQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+IA0KPiBNaXNzZWQNCj4gcHJvcGVydHkuaA0K
PiBtb2RfZGV2aWNldGFibGUuaC4NCg0KR290IGl0Lg0KIA0KPiAuLi4NCj4gDQo+ID4gLSAgICAg
ICBtcGM4eHh4X2djLT5yZWdzID0gb2ZfaW9tYXAobnAsIDApOw0KPiA+ICsgICAgICAgbXBjOHh4
eF9nYy0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4g
DQo+ID4gICAgICAgICBpZiAoIW1wYzh4eHhfZ2MtPnJlZ3MpDQo+IA0KPiBUaGlzIGlzIHdyb25n
IG5vdy4NCg0KWWVzLCB3aWxsIGNvcnJlY3QgdGhpcyBpbiBuZXh0IHZlcnNpb24NCg0KPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IFRoaXMgdG9vLg0KDQpHb3QgaXQu
DQogDQo+IC4uLg0KPiANCj4gPiArICAgICAgIGZ3bm9kZSA9IGRldl9md25vZGUoJnBkZXYtPmRl
dik7DQo+ID4gICAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJmc2wscW9y
aXEtZ3BpbyIpIHx8DQo+ID4gICAgICAgICAgICAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAs
ICJmc2wsbHMxMDI4YS1ncGlvIikgfHwNCj4gPiAtICAgICAgICAgICBvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShucCwgImZzbCxsczEwODhhLWdwaW8iKSkNCj4gPiArICAgICAgICAgICBvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShucCwgImZzbCxsczEwODhhLWdwaW8iKSB8fA0KPiANCj4gPiArICAg
ICAgICAgICAhKElTX0VSUl9PUl9OVUxMKGZ3bm9kZSkgfHwgaXNfb2Zfbm9kZShmd25vZGUpKSkN
Cj4gDQo+IFNpbmNlIHlvdSBsZWZ0IGFjcGkuaCBpbmNsdXNpb24sIHlvdSBtYXkgc3dpdGNoIHRo
aXMgdG8NCj4gDQo+IGlzX2FjcGlfbm9kZShmd25vZGUpDQo+IA0KPiBvciBkcm9wIGZ3bm9kZSBh
bmQgdXNlDQo+IA0KPiBoYXNfYWNwaV9jb21wYW5pb24oJnBkZXYtPmRldikNCg0KT0ssIHdpbGwg
dXNlIGlzX2FjcGlfbm9kZShmd25vZGUpIGluc3RlYWQgKHNpbmNlIGZ3bm9kZSBpcyByZWZlcnJl
ZCBpbiBmb2xsb3dpbmcgaXJxX2RvbWFpbl9jcmVhdGVfbGluZWFyKCkNCg0KVGhhbmtzIGZvciB5
b3VyIHBhdGllbnQgZWR1Y2F0ZSA6KQ0KDQpSZWdhcmRzLA0KUmFuDQoNCg==
