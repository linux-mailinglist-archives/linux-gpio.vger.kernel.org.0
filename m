Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24CB1FEF03
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 11:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgFRJvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 05:51:46 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:43617
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729060AbgFRJvn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 05:51:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVaGjuwvKzzkc7H7coRjiV9rP6vHgzXjHpwa+wsxkowwdBsWJt7f1g0QDh6T+lBVacBwr+WfuNcX1H514pcz5melt9p/RNR/hw8VjJYtvBAfUEKQsCfMTUPgibQV3Ngr2UyxVQMsOVwoMLloOcXoZ89C5G4rMLzpfDCH26iCpjP/AChLa08OjENDgguH+wFzrqhPKI+uJvD+vh8nlnIlbd2EcVpJT0mN9N8HhaKoChrmok+iccSVRfZA9iRpN0rVX+PHGfFGeetKo9j8rn9tIjBkTNtBalsLxFj+1L+lw3jvA/rEsmSnEFWSciHAus+4yd7t9zMbqThBEl6Wqdhd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR/FsfpBP+eZ4NXwBmOqZSdme6qd+i3dDZTwvy/nYAE=;
 b=S4+ab2/S5qK4VvTYXueEINUOW6Q/hbf91jPif9HobdQ+/o6/hhndIQy/UmxBk+/aY7FFD6kbqqYxE7OKPFUGtdEcIv+vU8002fl/csKroT2oImh/yBc0hSo+vDcob3ORFIAkbqurOJcLbrok2UitqbSyPRmCNAXMyD6ZODt8/QRez4KtHvNvQeJQjNOyZpp5IxWFDHhShE9AdMwZ7MRmdAeH5Y5eU3BTsIvtd3wXcOahGWd989kqD8AbfncFQobHgjBRx2MGayqyMTCOKHRySBrUfZiD3RRF5jg+TYN6JjGLMhUpahinZys6f+jIQyjpLG2MUtmxNRmHGA1nf84iEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR/FsfpBP+eZ4NXwBmOqZSdme6qd+i3dDZTwvy/nYAE=;
 b=lScC9AtpGRliMOVezxatk1uCyKhcSmdTPoDkIYTdgrT6nA5SWtptBcEqWzl7Kr5sicf2WLpQeqGXcfbLCJhiEvNHYwFt6QaC46nc0eKwujpRh5n+JXyQz1Gjm2dQKhkx3NAE5AYyDKIam6zXnp38vDPlNqGikrHk5fJett0V5ys=
Received: from DB6PR03MB3032.eurprd03.prod.outlook.com (2603:10a6:6:38::32) by
 DB6PR03MB2869.eurprd03.prod.outlook.com (2603:10a6:6:34::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Thu, 18 Jun 2020 09:51:38 +0000
Received: from DB6PR03MB3032.eurprd03.prod.outlook.com
 ([fe80::945f:bfb0:7d94:2865]) by DB6PR03MB3032.eurprd03.prod.outlook.com
 ([fe80::945f:bfb0:7d94:2865%6]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 09:51:38 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
Thread-Topic: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
Thread-Index: AQHWRULLCylAWLl8vUS+dOeTyuJSw6jeBRIAgAAchYA=
Date:   Thu, 18 Jun 2020 09:51:38 +0000
Message-ID: <989997fc90b9e90b17f3a9f2bf600595bd6ee3cf.camel@fi.rohmeurope.com>
References: <20200618073331.GA9403@localhost.localdomain>
         <20200618080932.GZ2608702@dell>
In-Reply-To: <20200618080932.GZ2608702@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b353fb32-335d-4a0e-430f-08d8136d3230
x-ms-traffictypediagnostic: DB6PR03MB2869:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR03MB2869A9A1DE9A26DF202135C7AD9B0@DB6PR03MB2869.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3tt0kiQtTpbhpNUIe33ykTQoAHDYddHicvlVCC4pLFdZu1WwX/d1pAQBPrq50SpKgeCNf7xSC+DwiBl9ouZ+sORpkCIEEvzyXXAloGj4edpe4Go4HiZeu+NVKjNIOkXWGLziZIgapamLbChiXdVA+xXoLrRd8fOvWTp+JXvwZtT1PhWLDNjkQzQ4Zrs+lIJNsBt6bbsBSve1BDnjY+5/24b5ci31ML3cOAUSKzv5Q76Vqm5ajw8jKb9XQ1wBdlxYTIxQ++KVU588XRu4+XD7VZRRMph7U/SxPYdWZVPGRurK2XzWAe+ZxiH1Z+mp3c89azZZiJV6x9yekYE8uFj2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3032.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39850400004)(136003)(346002)(366004)(6506007)(316002)(2906002)(64756008)(66476007)(91956017)(66946007)(6916009)(76116006)(66446008)(66556008)(26005)(3450700001)(6486002)(4326008)(186003)(86362001)(2616005)(6512007)(478600001)(5660300002)(4744005)(8676002)(54906003)(7416002)(71200400001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: pzDFKP6s8m9mWhySlk66l13LHlU8Bzo13j2d82oIY75AjXipcHP0aEFmX6wAcXAYNWxsAFsE8u4YgHxrgrzPQMqbscAV5QEcHAEyhljlu0/ty6V143L9FrXsN6hnBECC2oXINou4R1JvoqeqFcWYDDqnOBo5AO1XBvh2zPc/7yZU9IwFdoLuZ4aEzta9c/nXn3J8R3+GXuIPAj7dJfDCm1O/j7XuY2lkBg8Wjrx6hzCHfT+UGGmHWwCRIkMmPVRl+Sfkr/XTiQRVdctcggn0beI+dzzwXtQUuYXt287M9ZyVOvJ7wxTrI4lB25frE5bTSB6jGlKNsSgHgcWYYca0rt+3wUCSVAMRRVPorItMraZsK9838ks1yRY/La6Tx7NRnjBHZtkBdNwtZdBXlROpRgyEK7rYNPUveeasUmhSlFn8g7d2IfGHyMbpNcutbJh8UtkQuwn/cPpQJhKS8wgPreWxr+YkJbpSpIoeOpc3SSnoVVsVkCwZECqv4PTQ9l8b
Content-Type: text/plain; charset="utf-8"
Content-ID: <73E5041237464244A5307169A4A1FCFD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b353fb32-335d-4a0e-430f-08d8136d3230
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 09:51:38.5083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkHC1/Vf5wQgXE8+XabdB1wBlypH2cllEz3YMdiBFSZo5vEaGjZFmJ6Fl8KnNXUd0WraMLhWR6ODRkchMTl5v8nUxsnFEn0Mfn8cPGKMV8uOc4EbZok6nsmkediDP/wu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2869
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMDYtMTggYXQgMDk6MDkgKzAxMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gVGh1LCAxOCBKdW4gMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4gPiBBZGQg
ZW50cnkgZm9yIG1haW50YWluaW5nIHBvd2VyIG1hbmFnZW1lbnQgSUMgZHJpdmVycyBmb3IgUk9I
TQ0KPiA+IEJENzE4MzcsIEJENzE4NDcsIEJENzE4NTAsIEJENzE4MjgsIEJENzE4NzgsIEJENzA1
MjggYW5kIEJEOTk5NTQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVu
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gQWNrZWQtYnk6IFNlYmFz
dGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiBNb3JuaW5nIExlZSAt
IGNvdWxkIHlvdSB0YWtlIHRoaXMgaW4gTUZEPyBUaGlzIGlzIHNjYXR0ZXJlZCBhbGwNCj4gPiBh
cm91bmQNCj4gPiBkaWZmZXJlbnQgc3Vic3lzdGVtcyBhbnl3YXlzLi4uIEkgZ3Vlc3MgY3JhZnRp
bmcgYnVuY2ggb2YgcGF0Y2hlcw0KPiA+IHRvDQo+ID4gZWFjaCBpbmRpdmlkdWFsIHN1YnN5c3Rl
bXMgd291bGQganVzdCBlbmQgdXAgd2l0aCBsb3RzIG9mIG1lcmdlDQo+ID4gY29uZmxpY3RzLg0K
PiANCj4gWWVzLCBubyBwcm9ibGVtLiAgTGV0J3MgbGV0IGl0IHNpdCBhcm91bmQgZm9yIGEgd2Vl
ayBvciBzby4gIElmIGl0DQo+IGRvZXNuJ3QgZ2FpbiBhbnkgbmVnYXRpdmUgYXR0ZW50aW9uLCBJ
J2xsIGFwcGx5IGl0Lg0KDQpUaGFua3MhDQoNCi0tTWF0dGkNCg==
