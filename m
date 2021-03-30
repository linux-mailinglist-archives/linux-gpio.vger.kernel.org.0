Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73A634E602
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 13:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhC3LDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 07:03:05 -0400
Received: from mail-vi1eur05on2049.outbound.protection.outlook.com ([40.107.21.49]:45470
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231872AbhC3LCk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 07:02:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKJ/G/qmruJb/zmi5K0u8DnRJBvIuN+9xUJoDgOkT428HIx1pz7e1wWmfnFivtEMCh8z+tQoNrF7cspJeLFmx6vruHmV7Xqo0qog7+yWAr9a2f/sLYNFfBD9FxLtVr0bed4NpfCOxjrAeg2o/u8CcNce41YIo82Kpg1EsHFenXD3u9u6iiGgySoJHEQc1+X3Mhqxu2cwGT0HDDyCZSPzJH7qUDlofUpvf+lawy2Mx8oyalX0HfqSVhWn/PUcNVk9F5HwmEFZrDFOMoXyUJRAdihiTtX0CJUqw2Lf6q15Yrn+vbzLz3ZTKZWIU78NgYouCWtqZR1RNgxBUqZei3zJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NVghAHHkaVufr1JGM7PM3zMSgxfT1Zf+czadhYusv4=;
 b=O49nranNIpPebDO6nVswo1F1XK0Ac5w+jLehRjZ/CrU2kE79oXp9wNZkOByPgEHs01LmlivhrZorDMjCCdJi995lQgQTsFIY0WzYwLD//JriS6KlZrIgSqeW2whYvQDccUxuEWdXkGHaX0Yas1KTYma2bab81Mxi/iKsGbwy8gO8WPejwT7PuMXNvPj+FyG62guRu/YCeJfZTMNlE9Esf8QC4jhDSIcGoVAnZfkzOy4kAUghRnzZHs7bFRv+h3Kj73JNDfdgYSTiIAAzRFslWfXxp6SCa9ZVHBklqOl0LlK2KGJS91Wc3Pbxk7QIstVItNG/Ptvy2gYxsTQ4GdVS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NVghAHHkaVufr1JGM7PM3zMSgxfT1Zf+czadhYusv4=;
 b=VljOvMsaxHVYSrjZ8AaxTaMo4RcLgqmgh8K/vtQh8FDZZ9/05PUNShqnHWmW+tvF8K2uYmmw1JQFEuwO3P0+rbpk4d/EEpQEB2gp5mz6lGZ6zypZy1nUHVj+BBUsgNf4+fIkesX74ERyx31JSWS2vFH8WwKxESZeK0L/kkn6WSs=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3067.eurprd03.prod.outlook.com (2603:10a6:7:5e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Tue, 30 Mar 2021 11:02:35 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 11:02:35 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHXJJsGjHVvEbwzhkqZmf3zCM/hD6qcUO+AgAAMBN+AAAI1gA==
Date:   Tue, 30 Mar 2021 11:02:34 +0000
Message-ID: <1d44856fc20e3b5821848ee32ea968c3ea79aa3c.camel@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
         <d4e78b93a62d2882492b46942a927293bad81d66.camel@fi.rohmeurope.com>
         <CAHp75Vce8sUsVz0YgHLDFbVMEmbYzaUZ-nRwgOeEfDHowEnxrw@mail.gmail.com>
In-Reply-To: <CAHp75Vce8sUsVz0YgHLDFbVMEmbYzaUZ-nRwgOeEfDHowEnxrw@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bd75b1f-7c0a-4813-5be1-08d8f36b5303
x-ms-traffictypediagnostic: HE1PR03MB3067:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB3067B79B9A7C2FED1754227EAD7D9@HE1PR03MB3067.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oQ64pgoi9R4P4ElntqIDNJyzG1ihnmN9UnZhtUdOTh07KylQpG01+qysiY7wAemShJ9teKqXYMLvbzNulw5sJGrSa6eoyIPOJgemml5z04jlVYBXBtDsgD6bq07ijGF84sQ02hTbPxcnD2gsbp3mqIbfvx9/hukx7y3DNNMayQvEEaXArNsXrqKwS+54siFec2lagG+tttTBUZIpY4WSsfbd6Zx1UJDOxbHux41akOQm+bH3EC8L6xOPaXiN1+ohuX/Ozxf+s9AgGoAdqAZ0/55ZlbPtX/7SY11bQFINRmcB0P7GzPqHszhjP4B/owM7SQ5SaeC/GGTJyD66RpFjRcks49OuB/PFB72UMQViARUzTmQ7C0UHMRwEaImBn6KoXD6Ud93N4P6Xsj7tQ5DhC7MS7p+Mr8FZfroQzGnB57fEC2Av/WX6QUpc3Qi8Rz9g2WZQmNKtRixVwWnd2f8S3n/R2/3M9r/qM5xyX7Nppt1k4f5zCb16wTdEHbeb8sQ/MelauGIcG0cIavt1MPAH0TyzPpeEizp4kwbED2unkAlMVoYtU0oWRq6Q9ZrkEchokSKKIrWdPO6wTwr8PG1BWtvvmODIQDQ2oTZOP4WOh9iz/567f/Q8/E+F9hq9IxmRqCB/VTTcufl4RqJnyBku1h5R6P9mE/eMlNzaHcjSRUg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(2616005)(6486002)(38100700001)(6916009)(186003)(76116006)(66946007)(66476007)(64756008)(66446008)(66556008)(316002)(53546011)(6506007)(54906003)(5660300002)(4326008)(8936002)(8676002)(71200400001)(478600001)(6512007)(3450700001)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VFg4cWo3S0tHL0l1WnI1RGt1bC81clI2VGQ0MjhZa0dEc253aUZCTGJidnpW?=
 =?utf-8?B?S2pVbkJhSlVmY3JwSGJxV1FZVXBhWmxRQTZiUDFlcVgwNGc1bVkzdm9qYXNU?=
 =?utf-8?B?NDFtMmZzRmJCVENzMGZpK2dPaGpqNi8xQ2FsY1BMaXA3anZudjgvc2ZsbS8v?=
 =?utf-8?B?bkMyVVZDQlNmZ0RBRGYwTWhKbnl5N1lCem5MUGlYZFVJNmxpYmdveHFuRVdC?=
 =?utf-8?B?RlRYUUttOE5oV1lmYWphRllKcTVObUNIK3FTd09sNUN6cEFHTFpNR3M5TXIz?=
 =?utf-8?B?bWlZYU81eGxPVm1OMUF0emU3T0ROUlFkQW93ZTNPVG9pdC82OTA3TktNK3BZ?=
 =?utf-8?B?R3E0TnlYUXVvbTYyK3ZubVNMT0RZMG16dU1KU21vU1BVT1pKUGJSVDlxK1Zv?=
 =?utf-8?B?dHh2bHNZYzdwSlozeEwzNVQ5eUs0OUM5MEwyWTBvL1RQT1F4eEllOElYTGVO?=
 =?utf-8?B?emFSWlRSVzdDR29GSXNHY1F4eXdRVjM1MlFPTjdNVTJ1emRqQklwdDdubTBN?=
 =?utf-8?B?REFsSW9hZndiaGhvY0QvLzdqY0QrQVM2RUJVUU1BcHByUEo4djZPSjQ3ZnIr?=
 =?utf-8?B?RjlJRlVLUWxteTE2M0FVTk5QdUtkWGFxYlZNVE5MTlRoSzBPTUxyajk0TUdz?=
 =?utf-8?B?WUJGRmREZUdJbnRvY2l5bjF0YjFZT0k0R3ZwTHpObDllZmlxNkg1dWJDNjdC?=
 =?utf-8?B?RkQ4bmd1VXFCT1dUOVEzZEduR3V1UzBkOWJRQ3lDbWQ1b3VuYm4xVTlyVTFF?=
 =?utf-8?B?ZFZnTTQyMmFCdTNQalRuK0Y1aTd2Nmt2bWlQb3RIT3N4aDkvN1JHWWdqSlRu?=
 =?utf-8?B?NlpES3U2VU05ZGk3L0dJcjgzcGdoSXVvVzRyR3ZLWk51OXdsOWlPemQwZGpx?=
 =?utf-8?B?aSs1L21XWE5UdzVwUUpGVXJIYjBKM2FnaVdUaEhzaThYTHZyT1NNem9sM2hh?=
 =?utf-8?B?YTQyT2NxeWVwdjlVNURrUHArdXpzWlMwQ1MvdjFPL1dvSmRKeUxOSmQ3Q0pt?=
 =?utf-8?B?SldCVVdJYzJCNS8vRXBuOFVtd2dZekpJMTZjaHR4Y0VMSTV4OEdVK3BWRzg5?=
 =?utf-8?B?SHBOL0FNQm9kcFV4b2ZCQVpGbVlmVWVQY0U2TXZXditnTTFFWVo0bzlBVjgz?=
 =?utf-8?B?WlREbzF3THFaWFFkalFac2pLdVFSMzg4YUQva040d21CZlpZZi9WM2hybnpr?=
 =?utf-8?B?U0hXYjRXZUp4ZnJXSXVkb3FGR1pSODRwNGRaa21nbG5abjVrWXBoWG9IWGhz?=
 =?utf-8?B?SEpUT2R5T0VQZjh4ZStFK1BWSU1jcXcxVFpMNXc1RXBYenlNUitkRFk0cXBq?=
 =?utf-8?B?WUtLbmRWMW03TWV6SUpUZXE3MzZzamw5L0xtQmFoREdBbzFpYXcxT3BKenJY?=
 =?utf-8?B?Y09peWhqaVB2YndtVnhDWnlSNHR0MEhCV2FzTEQ4T0dIRVU5OUw2U3RubTJ1?=
 =?utf-8?B?eTlmQkpqdTZiVFkwbVFqZDR4eVpKUXlFMm5sZXJTMHh1T25YNTU5VkQvN2lD?=
 =?utf-8?B?dG1vQ3ZDdmhvSHJhdWMzNFlGcDMrMlp0NHBUb3JFNWR1SzhOc3ZxZm5RcWEw?=
 =?utf-8?B?MVFNRmUyYmQ0aWgxQkFHOUdBdHptRkRQLzFubmN0empGTFN6MmtjdmtUS1Uy?=
 =?utf-8?B?OVk2NVBHdEozNVowZVVJMGxuSmdnSnU1VFB0RlJ6dTVzRWQzTTA2N0dab2xr?=
 =?utf-8?B?NS9uZ0grRUdEb0h6WUFzbEU1dndsUENSaWJJWENYUW1iNUxhd29RVFpuSlVx?=
 =?utf-8?B?Y0FEV0c3dXQ3ZTNyN0NoUUNXV0Y2Y2tBSUVKampBRkNRK016Yy9RZldoUHVr?=
 =?utf-8?Q?d2JBBAZHjQSET/0eSU4A0lM0ZCyHQjdhs5Ld4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BFABFB9ED8CBE499515BC27B7AFC1D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd75b1f-7c0a-4813-5be1-08d8f36b5303
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 11:02:35.1345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4lU1gC3DTYo4I9zz3kjcB4WciwinM0/nMIto0MsyDl1/OXuNn6qyIiyztE7zHj972t/5w6o3OrNg0/0sqF/7+2QcL2dznLWy6wckrvn5tKi8bBAJ10R/FiV4Crc4RN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3067
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjEtMDMtMzAgYXQgMTM6NTQgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gVHVlLCBNYXIgMzAsIDIwMjEgYXQgMTo0MyBQTSBNYXR0aSBWYWl0dGluZW4NCj4g
PG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gT24gVHVlLCAy
MDIxLTAzLTMwIGF0IDEzOjExICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IA0KPiAu
Li4NCj4gDQo+ID4gQW5keSwgaG93IGZhdGFsIGRvIHlvdSB0aGluayB0aGVzZSBpc3N1ZXMgYXJl
PyBJIGRpZCBwdXQgdGhlc2UNCj4gPiBjb21tZW50cw0KPiA+IG9uIG15ICd0aGluZ3MgdG8gY2xl
YW4tdXAnIGxpc3QuDQo+ID4gDQo+ID4gSWYgeW91IGRvbid0IHNlZSB0aGVtIGFzIGZhdGFsLCB0
aGVuIEkgcmF0aGVyIG5vdCByZXNlbmQgd2hvbGUNCj4gPiBzZXJpZXMNCj4gPiBvZiAxOSBwYXRj
aGVzIGp1c3QgZm9yIHRoZXNlLiBJIGFtIGFueXdheSBnb2luZyB0byByZXdvcmsgdGhlIFJPSE0N
Cj4gPiBQTUlDDQo+ID4gR1BJTyBkcml2ZXJzIHdoaWNoIEkgaGF2ZSBhdXRob3JlZCBkdXJpbmcg
dGhlIG5leHQgY291cGxlIG9mIG1vbnRocw0KPiA+IGZvcg0KPiA+IHJlZ21hcF9ncGlvIHVzYWdl
LiBUaGlzIHNlcmllcyBoYXMgbW9zdCBvZiB0aGUgYWNrcyBleGNlcHQgZm9yIHRoZQ0KPiA+IHJl
Z3VsYXRvciBwYXJ0IC0gc28gSSB3YXMgYWJvdXQgdG8gc3VnZ2VzdCB0byBMZWUgdGhhdCBwZXJo
YXBzIGhlDQo+ID4gY291bGQNCj4gPiBhcHBseSBvdGhlciBidXQgcmVndWxhdG9yIHN0dWZmIHRv
IE1GRCBzbyBJIGNvdWxkIHNxdWVlemUgdGhlDQo+ID4gcmVjaXBpZW50DQo+ID4gbGlzdCBhbmQg
YW1vdW50IG9mIHBhdGNoZXMgaW4gc2VyaWVzLg0KPiANCj4gSSB1bmRlcnN0YW5kIHRoYXQuIEkn
bSBub3QgYSBtYWludGFpbmVyLCBidXQgbXkgcGVyc29uYWwgdmlldyBpcyB0aGF0DQo+IGl0IGNh
biBiZSBmaXhlZCBpbiBmb2xsb3cgdXBzLg0KDQpUaGFua3MgQW5keS4gVGhlIHNlcmllcyBhbHJl
YWR5IGhhZCBhY2tzIGZyb20gQmFydG9zeiBhbmQgTGludXMgc28gSQ0KaG9wZSB0aGV5IGFyZSBh
bHNvIE9rIHdpdGggZml4aW5nIHRoZXNlIHdoZW4gcmV3b3JraW5nIGZvciByZWdtYXBfZ3Bpbw0K
KEkgaW50ZW5kIHRvIGRvIHRoYXQgZHVyaW5nIDUuMTMtcmMgY3ljbGUpLg0KDQpCZXN0IFJlZ2Fy
ZHMNCglNYXR0aSBWYWl0dGluZW4NCg==
