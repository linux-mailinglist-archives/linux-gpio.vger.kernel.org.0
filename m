Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF54413BA
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 07:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhKAGVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 02:21:47 -0400
Received: from mail-vi1eur05on2073.outbound.protection.outlook.com ([40.107.21.73]:53601
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230508AbhKAGV0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Nov 2021 02:21:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3LTMA1ndzQOBBo5zw7NSKEP1FxlrxDRj9Bb9Bvlta0dZmHmR2GJghnE02ns5nFZCWOXJQ2k9wiErimoPC6bmZfhh5XxzTjYvpiJlyDrX1VMfnEs8zGnw1PzhGFTlDlk6dbJIxl3VPM5YZMIEjIvhmSHPo2yXkjyTB2J5ucddlS/mBFafFlcXVpxxVgcAZ3ESyU7XsFZWwLclnubgPW3xp1GVfV+t3fc6K96t/blxIE9j7kxS7T1R+prEMl5LGPhBgmJRk4E1Os6SxD3KU3tap8xuVC7nNm/j+64je1ibOmZXSKPCJDr8nZZ70+Eeck9YqbSxbjk+smF6j+QtDcsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5viLqnSnAYcCApBaQsoOAgK3dRNTIWEhNH7diXg4AxA=;
 b=ipzzxFblPwRwBQ3BAwOT1kDuhE0AnTFlFwYp7KtfgFLHX2GmM28qS0wctp8lF4LdzK+oEeY5zDrehi9P5/qNy/DXCv+tTSstz/6r39eX5MrlmOJnEN8RuJMRdKOon4MUFsP+awEap8DUYGbOEHKv0Kc4TGqhrybvzxOKE2w67E550rIDSw40T7WS4IWDd023T2aINwgywW6T8eeStOaB67xPZOiL7epKAOlzozWB/Hl7AFEMlbtotq6ZxqRsTre6OLXEDZF5Gy+GenNb5LpPFTvab5uiVpx7Hv7ZsRjUFvlzZW4oNkNaioBgwh5R9nTIycPJRxLEQxUDQESjB+qXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5viLqnSnAYcCApBaQsoOAgK3dRNTIWEhNH7diXg4AxA=;
 b=mZbAQ9aqVf1YrlH5+42t7/9CtlW1ALHHePVh4hKy30ED41My4Zrij4K6Zb6Y3ClMYLuSdGKzNfE5qyW47WTWhS7TCFR4kPmw9tHGuzWg+tuTcblSaMrnO8X54Y5iW6ud/Jo6GVK7r7+3HyMfWm3945AJJtiFQtbD3mk9ZbsE7Ks=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Mon, 1 Nov 2021 06:18:48 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 06:18:47 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [RESEND PATCH 0/4] Drop ROHM BD70528 support
Thread-Topic: [RESEND PATCH 0/4] Drop ROHM BD70528 support
Thread-Index: AQHXy9zG+KAnuIu9IU2Z5oLjeSUE3avtGGaAgAEgiIA=
Date:   Mon, 1 Nov 2021 06:18:47 +0000
Message-ID: <b288b97d-4c5f-1966-92b0-e949588ba97e@fi.rohmeurope.com>
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75Vf12Lx=demULkNhgP=YpnfdH15Y9T5C7PUA4uo=0J15ZQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf12Lx=demULkNhgP=YpnfdH15Y9T5C7PUA4uo=0J15ZQ@mail.gmail.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4dce6c9-5201-4440-c265-08d99cff7727
x-ms-traffictypediagnostic: HE1PR03MB3162:
x-microsoft-antispam-prvs: <HE1PR03MB31621F0278216CA08FBD25FDAD8A9@HE1PR03MB3162.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M/hrdzWvcVCw3lKfNWN2lBVo5Q/rt29NOJBGW2Tb2WpTdTH7+P3IgjbJdRFdBXzMpHAIAj2vlMLzntNBq+6lHv7KLQPvj3bCU1ichM/zmYEOTJJUlHFYH/Qk7t3xc0kH/2iP24Gb/ikswoUAMO2t+CuhG7PDY90BcVrxJSopLVcWAaKrXcPGgQ1r1G0GG2k1R2x9odgk7z4mhNqouYlq4fD/YH8/vfd7s132c9TQSzjOZmjZXyyhPFdEVrja3xanx2vi5c7aQ97/t376h99cnbbuX2Jdtptuf+AIiGl9Ja6hLBGbW66cdpDNMFS+ZiuHABD+hxDqqpBZNSCwG5ftEgF0kfAF4PPmcgSVOHCZcDSUClmuqXIvlNWb0Mkx/e2h2pPqjY+py2//KpvNBXsZ/whTQQ6w9aG3BExYLiwkSbMQXRZLYJfdhcwKZEkr+aaRqAuKIX1obVJ1zDRsWbtSQbAvjCKWR7weUmKgR9OM4Z4rWJ1e6NTfAi+s1g2sE7Hia8XtHxzMOc94TjJa3W2/f3LqbItiFcU2Ro5CIboRNyUy7IGYUVDiLpDvVBv9SuMWRD7atiD9f3HSVmqBucxh7HfQMv19zH1kkxFW5ITag06dP4ciaskJxtIs85X73Qp/nha42lm0RZfJrkqT85tV40Tp4w39w90Yp02TpdetcCrEtfFMlz8pScRH63ggDC5YaTU+VH2zJkt8sDacBUaWSK6Zm+RDLfZUMDCf6yx6zZUp2ngQHXTH8mUgKBrZ1jLoeppNq028TadEmHduIyJDNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(86362001)(6486002)(6506007)(38100700002)(186003)(4326008)(5660300002)(2616005)(76116006)(316002)(66556008)(6512007)(31686004)(66446008)(26005)(71200400001)(31696002)(6916009)(54906003)(64756008)(53546011)(107886003)(2906002)(8936002)(38070700005)(66946007)(8676002)(83380400001)(508600001)(66476007)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhpTUdRWUNkS1FZYmtKMi9TM2VmYjBYS2t0VmlUbSsvSG02WVR2cjhzbGNp?=
 =?utf-8?B?V3BTVjhuVHJKaFdGMGFqb2pUT3NWclFVZ0R2MElBem9lSnlCVm1DUktpbXY2?=
 =?utf-8?B?WXhWaDlMWXMzZ0xDSTIxcldaOEVLdXJIbks0VThSL2Vmc1NtR1pGYTNPTFJC?=
 =?utf-8?B?Rjg5V2VwanNtdnhuUlRlUDJUU0JLaVppdmJOMGdSNEVMeTZ3RFZrSjRlaWVh?=
 =?utf-8?B?ZG1icHZNUXpKTUJyM0FpMExxeDMyMU1RODEyc1lkeTVQcGdYM0JuTEhHV00x?=
 =?utf-8?B?a0QwUk8rWGtpeXU1WEdRcDd4SXZCVVpyRi8rL0xlbjBtRmhCWjl3YUI4aUtp?=
 =?utf-8?B?bUxvTWYrazl4Q3hSeDBTbzlNcjV6cER0MkdSVHRvbUFPQnpadUtGSFI4aHo1?=
 =?utf-8?B?ZXJYTytabWU3WHVTRi8wTFN5RzBQQ3hEc3hzQmdTTEVXN2RBOUpnOGZjdXQ0?=
 =?utf-8?B?SmtYZGtGZE1xam5ZZkNDNVM1cGlHbU5YS0lmVCsxRnNWQ3Yra3BrWTFheHpL?=
 =?utf-8?B?UWxwSXorWnpwZ0h5NFI1eUFoa1dsZTNDaDlhTlhWa3pRbHkrNisybWNNNDVP?=
 =?utf-8?B?L3Q5dU9TWFhkeGJjRzY0b2dCcEo0Rm15VGdTWTQxMklHZFlReVl0MjZpY2tB?=
 =?utf-8?B?SEpBd0kvcnpqNlV5ang5Sk9FYytZMVRtZVc0ZzdYMWJNK3haRlpVU3Y5eFZE?=
 =?utf-8?B?S2VhSEJGcnk4TFFrRUY4V3pja2JWVldQeVU0TEsxMFAvalBIUWJieTU1dUY0?=
 =?utf-8?B?QlBVQWlQMUNjSkJ5aDFGWTMrSlhoazQvRDZScnhpQmZ5K1ZQano1SkRKaEta?=
 =?utf-8?B?MnF1dnovNzNXQ2ZXem9OMEQzTUhOdkVXWVhpVm1PUDBPTEM2U0pQS2h6ZkZN?=
 =?utf-8?B?TXU5NVlCSExQVWh0ZVlhWUdkQ3g1ZGVEVmpSUWRJK0gzbUU4OGpIcU1BZ0Y4?=
 =?utf-8?B?eFhmRjZQdDQ4Qm5pdFdzV3JWY3REZXR4ZkxyNWZEZjRJdkdlNzZuaHhYbzkr?=
 =?utf-8?B?Vk1JdE5JaXdqRWI0b3pYVFJWcnF0T3Zyc20wT09BVi9WbkNxRmdrRy9TU1l2?=
 =?utf-8?B?dUJ1SkdORjY5cFhXSzVORUc1SUVzaVg2R2N2WFlFOWJtaG44cWdudVBvaFNu?=
 =?utf-8?B?MHpHU25sUGlaWGFEa2VndVl6eU1WQkxadVRyTHQ5KzFZa1Jndkg4cCtjbFU4?=
 =?utf-8?B?azRIMG5OQWRQMEc1N3ZJRzU1OTYwbUtWekhUblJYUkdzbFNPcG90Q20yUjR4?=
 =?utf-8?B?K0tCTEhjVXA3NWVxNDJVQ3FpbEdXaFErZjJFbzcyZFFYbW8yVDlMRlZuY3Qz?=
 =?utf-8?B?ZGdQcEMwYUhsVitVWkxlWHRJMWlhcEdkQUZWWm5LZElTdDFVMzMwdElhVi9R?=
 =?utf-8?B?RU1pV1FIRUlCQkdWQkZFcFViNlhBUUQyL3MrYTBiTzE2MVhUVUpVU21qY3hx?=
 =?utf-8?B?VGZYd1U5dWI5ckI0QlAwL2hIKzFzYVhEbVV1TVVsQWJxdENvcGlCakpXS3NF?=
 =?utf-8?B?QXEyNlhPdVRod3FEdERyZXdDY3dPbUY1aWQveURwYTF1NTZqK0Q0dnBJUUZ0?=
 =?utf-8?B?dk52S1BuWmwxenVCelNhemhnNzZBTzBYYURUaWVvNGI1cStNbDRCZnMvV09F?=
 =?utf-8?B?Ty95bkZtTEFtZ2tkUjNpNjJBTldHM0tYRVNXNjF1Qll5MmRzODZzNTFnajUy?=
 =?utf-8?B?MURHM3htTTVoUDVlT0ZMMVZFT2YvM1ljL01JcWtWL3FCRVoxQ1BEdk5yVGNj?=
 =?utf-8?B?NCtLajVZRWh2bXVxRjd6VDhGM1lCMlNFKytPQ0cyUnJjTU5TeWhzQkp0cC9N?=
 =?utf-8?B?SGI1MSs2REtGcm9DWTg2eXBMckwvMUlCNjFrc0hvMC8zZ2I4WnRPKzFjUFM2?=
 =?utf-8?B?NEd2dCtVTjNMbFRYbmQ3RVhRUUtBMGhGZXY4OUJSOGMrY0IySzdiL1lpT1ln?=
 =?utf-8?B?NVBGbmp2eFdqVnVaS3ZPY2V4NnZLYlB2TVd5aUxaV2oyZ1FWbmx4WS9XTVpu?=
 =?utf-8?B?dmhPSUk0S2wydDFuZDMwSk90VCtaY0JpbERTaHpEcE1kV1lmeGd3NFdQTGtp?=
 =?utf-8?B?VFBvTlMxdUVRb3FZRml3eE03NG1OTnlqVGxUOWh0YnRzeDU3dVZNalZOMmFm?=
 =?utf-8?B?R0U4TzhBR2w5NnhndmRiR3dwRmRIYVdxOVdEUzd6THBHMUtvTzMwUUtUTnRP?=
 =?utf-8?B?K0JsaklHYitFYTRDWWxGRnpUM1V4VTBMU3Z0M1MxMW9qQVdIcTRGWm8yUEhP?=
 =?utf-8?B?YWhvSDVJb3F3SWszelRlekg4ZUNZOTh6ekprNTlwQld0bGtDUDVjcUVuNHJE?=
 =?utf-8?Q?vXpFKRI4HNThRJvFdW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <662BAF2EEC46C04186A7166B4D3C85DE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dce6c9-5201-4440-c265-08d99cff7727
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 06:18:47.7294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xn8dORm/lRotY1wzgRarz9ELdQeUCsNGDCcepy69twPHOzZ4dl6kBMqmrsqx17o4mtVW4M2EbpL+8VFXaa0urCaSPo7v/KJMv/nMlppXauScOLO662JAPfswLRnLyonw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3162
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQW5keSwNCg0KT24gMTAvMzEvMjEgMTU6MDYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToN
Cj4gT24gVGh1LCBPY3QgMjgsIDIwMjEgYXQgMTI6MTggUE0gTWF0dGkgVmFpdHRpbmVuDQo+IDxt
YXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPj4NCj4+IERyb3AgUk9I
TSBCRDcwNTI4IHN1cHBvcnQNCj4gDQo+IEkgYW0gYWx3YXlzIGZvciB0aGUgY29kZSByZW1vdmFs
LCBidXQgdGhlIFEgaGVyZSBpcyBkbyB5b3UgdGhpbmsgdGhlcmUNCj4gd29uJ3QgYmUgc2ltaWxh
ciBjaGlwcyB0aGF0IG1heSB1dGlsaXplIHRoZSBjb2RlIGFuZCBhdm9pZCBkdXBsaWNhdGlvbg0K
PiBpbiB0aGUgZnV0dXJlPw0KDQpUaGUgQkQ3MDUyOCBSVEMgZHJpdmVyIHdpbGwgc3RheSBiZWNh
dXNlIHdlIGRvIHJlYWxseSBoYXZlIGNvdXBsZSBvZiANCm90aGVyIFBNSUNzIHdpdGggUlRDIGJs
b2NrcyB0aGF0IGhhdmUgc2ltaWxhcml0aWVzIHRvIEJENzA1MjguIEFsc28gdGhlIA0KQ0xLIGRy
aXZlciB1c2VkIGJ5IEJENzA1MjggaXMgYWxzbyB1c2VkIGJ5IGEgZmV3IG90aGVyIFJPSE0gSUNz
Lg0KDQpBcyBmb3IgdGhlIHJlZ3VsYXRvcnMgLSBUaGUgUE1JQ3Mgd2hpY2ggSSBoYXZlIHNlZW4g
ZnJvbSBST0hNIGhhdmUgDQpwcmV0dHkgbWF1Y2ggYWxsIGhhZCBkaWZmZXJlbnQgZ3BpbyBjb250
cm9sIGRlc2lnbi4gU2VlbXMgbGlrZSBIVyANCmNvbGxlYWd1ZXMgbGlrZSByZWludmVudGluZyB0
aGUgd2hlZWwuIFdlbGwsIHBlcmhhcHMgdGhpcyB3aWxsIA0KZXZlbnR1YWxseSByZXN1bHQgYSBi
ZXR0ZXIgd2hlZWwgLSBmb3IgU1cgY29sbGVhZ3VlIHRoaXMgZG9lcyBicmluZyBzb21lIA0KYWRk
aXRpb25hbCB3b3JrIHRob3VnaC4uLg0KDQpTYW1lIGdvZXMgd2l0aCB0aGUgR1BJT3MgLSBhbHRo
b3VnaCAtIGFzIHlvdSBwcm9iYWJseSBrbm93IC0gSSBkbyB0aGluayANCm1hbnkgb2YgdGhlIEdQ
SU9zIGNvdWxkIGJlIGhhbmRsZWQgYnkgYSBnZW5lcmljIEdQSU8gaGVscGVycyBieSBhbGxvd2lu
ZyANCklDIHNwZWNpZmljIEdQSU8gY29uZmlnIGZ1bmN0aW9ucy4gV2VsbCwgdGhlIEJENzA1Mjgg
R1BJTyBkcml2ZXIgaXMgbm90IA0Kd3JpdHRlbiB0byBiZSBnZW5lcmljIC0gYW5kIG5vLCBJIGRv
bid0IHNlZSBzaW1pbGFyIEdQSU8gYmxvY2sgaW4gb3RoZXIgDQpST0hNIFBNSUNzLiBTYW1lIGdv
ZXMgd2l0aCB0aGUgTUZELg0KDQpBZnRlciBhbGwgdGhpcyBiZWluZyB3cml0dGVuIC0gY29kZSBk
dWJsaWNhdGlvbiB3b24ndCBiZSBhbiBpc3N1ZSBpZiB3ZSANCl9kcm9wXyB0aGUgQkQ3MDUyOCBz
dXBwb3J0LiBFdmVuIHJlLWFkZGluZyBzaW1pbGFyIGRyaXZlciBmb3IgYW5vdGhlciBJQyANCmlu
IHRoZSBmdXR1cmUgd29uJ3QgYnJpbmcgZHVibGljYXRpb24gYXMgQkQ3MDUyOCBpcyBkcm9wcGVk
LiBBbmQgaWYgd2UgDQp3aWxsIHNlZSBCRDcwNTI4IHYyLjAgLSB0aGVuIEkgKG9yIHNvbWVvbmUg
ZWxzZSkgY2FuIGRpZyB0aGUgb2xkIEJENzA1MjggDQpkcml2ZXJzIC0gb3Igd3JpdGUgYSBuZXcg
b25lcyAtIGFuZCBicmluZyB0aGVtIGJhY2sgaW4tdHJlZS4gQnV0IHVudGlsIA0KdGhhdCBoYXBw
ZW5zIGNhcnJ5aW5nIHRoZSBleGlzdGluZyBkcml2ZXJzIGlzIGp1c3QgYW4gYWRkaXRpb25hbCBi
dXJkZW4gDQphbmQgd2FzdGUuIFRoZSBCRDcwNTI4IHYyLjAgbWF5IG5ldmVyIGNvbWUuDQoNCldl
bGwsIGRvbid0IGdldCBtZSB3cm9uZy4gVGhlIEJENzA1MjggZHJpdmVycyB3b24ndCBib3RoZXIg
bWUgaW4gDQpjb21tdW5pdHkga2VybmVsLiBJIGRvIGxpa2Ugc2VlaW5nIG15IG5hbWUgaW4gdGhl
IHNwb3RsaWdodCBYRCBXaGF0IEkgZG8gDQpub3QgbGlrZSBpcyBsZWF2aW5nIG90aGVycyB0byBo
b2xkIHVwIHRoZSBsaWdodCAtIG9yIHRvIHBheSB0aGUgDQplbGVjdHJpY2l0eSBmb3IgaXQgOikN
Cg0KU28geWVzLiBJIGRpZCBzdWJtaXQgdGhpcyBwYXRjaCBzZXJpZXMgYXMgSSByZWFsbHkgdGhp
bmsgbWFpbnRhaW5pbmcgdGhlIA0KZHJpdmVyKHMpIGZvciBkZWFkIElDIGlzIG5vdCB3b3J0aCB0
aGUgd29yayA6LyBPaCwgYnkgdGhlIHdheSwgcGFydCBvZiANCnRoZSBkcml2ZXJzIHdlcmUgYWxy
ZWFkeSBkcm9wcGVkIGR1cmluZyB0aGUgcHJldmlvdXMgY3ljbGVzLg0KDQpCZXN0IFJlZ2FyZHMN
CiAgIC0tIE1hdHRpIFZhaXR0aW5lbg0K
