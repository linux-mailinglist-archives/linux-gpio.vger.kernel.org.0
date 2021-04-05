Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8D7353BB2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 07:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhDEFYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 01:24:48 -0400
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com ([40.107.21.46]:51681
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232065AbhDEFXw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Apr 2021 01:23:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2nRNkoZ/1LwJ9zHvEa3C/OAn6WiHzx5NXA2l916IHEAD4nw2y8lQjFFgwuclGksGl/OkKqbilrBZXyyMz6YV2EVi8CuV7ronbOPLGjmImCyNApldR9Ru6kgPepJhCu2omV5EJFCHFhzwQWAQd0x/BPAF4tIddoLH0kLtYGarefd1fvC3dSyoH7t3XrM7jWjgyZtvkhlRFgijR91Cv9Iqe8x23FCfOFa1Wdcuz4dSbFJtMkqEcMa7ybjIjZOhuqPdxUZ6d6e6CxQv7KHkp1sMC/zR9dh4klgib41SznpBiIp3O3/E8KhhZ4wDuee8HAjiPahRebhwgq3CtSAPKi52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWCjWZVRjvaGodqNylLB0EssfajXZTgpOwyRLrRLYDU=;
 b=TTASRbMKZOpMuyycxEmjEy5qGTyW2IXmMe+S68IHpS6r/38CBS11NZjOEctM0gO95etiVRZ3aXR6Us/bz1irZeS+mGE618+gQ2EWsHYRP3b/ubl+3w/mBTY5CTC9+vQlOCuu5kzGe4r0hEyaKO91038+73yiYhz59aC7nCC1fWJZHxYXyjOt077aKoH34hi/IjWp/2CqhINw4+9ppvxqJf+/fwQC60kYyhV4ej+SnCeOhGGgT10NshMfSq+bRIYlJTH/0CqsHCTOMauATyjvxafdC0LgJXHN2tc2sMWdBuKk6VFfUeVKZTll1U7WnuDcbyZZmd6sI8GkRyWc4O4+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWCjWZVRjvaGodqNylLB0EssfajXZTgpOwyRLrRLYDU=;
 b=ee70KcWNCCoiYVFOxklXilpkLr76GQu/ahpCoo4OAjNl2IaJYG5OUaOnEp2EM8LfhAVFbm7aDwWyrn5KaQIzNKwzJY/P2EtVuj6/iHrtQb8i3Hu7ts40/Df3EjY6iKJufoJ32rC3WwsxFxAkFs5r3JT7g8OmmDX2/xluzfP8NN0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2396.eurprd03.prod.outlook.com (2603:10a6:3:67::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Mon, 5 Apr 2021 05:23:41 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 05:23:41 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Thread-Topic: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Thread-Index: AQHXJJps4G37QdCWoUakTStXWzuSFqqcYF4AgAVAugCAA81egA==
Date:   Mon, 5 Apr 2021 05:23:41 +0000
Message-ID: <e0b83eee4417e4e267b15a8c22bbc7f70df919e9.camel@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <303b164aaa3d36cf8c9d03ee9b3863635be4073d.camel@fi.rohmeurope.com>
         <20210402191950.GK5402@sirena.org.uk>
In-Reply-To: <20210402191950.GK5402@sirena.org.uk>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 595c90c5-15fb-41ac-3220-08d8f7f2f99f
x-ms-traffictypediagnostic: HE1PR0301MB2396:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2396108C9E03B0A09D2BAEC1AD779@HE1PR0301MB2396.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi3+rPEC3WHykCG861/puXSHl1hF/cqkjDtDTvkerweAVnVM9VcxAuogkF9wTALtXzhmqib9A5XaJmZUnU202haB+0LwQ8canOUbT7ZTaaiGyDVMxug1U98WsvSVyBVPnfZBEGCFWLEPW6WUM2LU4gR2ZUoEYz60h3hItN4Fo17YrEJ4qwYELABUt2IR38AyjnHT12g23xfT/eVGVfBHHFlSXH56jHOIp6tTf4laNlJKTKjSKWyfVkaFMCe/JQzmLDd+hS5LEueVnYgRWN7yrEJh8lMiJFc4o4ADm5F+AdgF/tJ03efurLJteA94lRJaTx1GeCDWu/SwiBXoPNyy6Bsc7JzHGdtHh8fljkgFL5pD1WqlayUMzDA7fTQicnkJQK60rsJx1vznPVxHfNL2Hb3s2qAb+2ksXeUytnRhMopOU2x6Foh9SvAeHx3w6EVNn8YUcGTI9oncfVhNFwDCE0zapneItsjVNvdeRJ0GoMhE/XZjlLkPWflafbn5yzoDfaKL6B+2gW65b4my+mBwLYwBGAGWnAiJE5VXZcK+BW/8qAus1oU5MiFgw7jhCD4xGMKQmzKoaeMwguSPDcjHwz4XxuOhK3mmwOy71Z7NMx69r+6CiR6n8DPB9wT4AEn5k+L8tWBOQExCtE63+M2GoKNJf8PVUOd7I8YuuxQk27c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(478600001)(6512007)(7416002)(86362001)(2616005)(6486002)(71200400001)(6506007)(186003)(76116006)(5660300002)(6916009)(38100700001)(66476007)(3450700001)(66446008)(4326008)(64756008)(66556008)(2906002)(8676002)(316002)(8936002)(66946007)(83380400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R3g2S21jQ1RFWkpVeXFDdVZjdy9KaTRwdmR4R2RaZThXTVJoRThkUTVWOWtO?=
 =?utf-8?B?a0szVzAxVnJyRENTN1U0Y0VtOElhOHROV09vUS8vT1VvUzJPZkVxYU5HWTVu?=
 =?utf-8?B?K1BJWFYvaTNmbGIrWkdBdDljS2Y5eE5pdDNiVG5YMTNRcDc4TmJZNEgwekZn?=
 =?utf-8?B?Q3U3N3dPU2ZBSXhjd0tieDZxS0ZKOGxnb3pLeEhRNUVKRXRoU2tSRzNsdkxL?=
 =?utf-8?B?b0tmc1NXamlUQklyMDlqbTNITmhwK0dseXRKQ3RkSk5uWXJ0SEg2RXdQMW9t?=
 =?utf-8?B?NkZKK2MzaVR4b0RjQlpNMVl1WW1nSVkwdzROSWgvRFdSQjA1emkrQUFQaDg0?=
 =?utf-8?B?VUszTURlbExJMzZpZVkweE10bEZoNkV5dHdxYkQyN3NIdklTWUo0NXl2bE1T?=
 =?utf-8?B?SHNzb2VuS3o5NFlkbU8wM0o3ZVNVUDNlUlJmK3FUZXA0Z2xDc3hjSzJFb3dT?=
 =?utf-8?B?aUlIbENObTUzckoyM3lBR3RJcmw1cUl1QjVER24wYU9RU3gyM3gwVDBEQU91?=
 =?utf-8?B?WVlRYUFTRVY3bERRbVU4UWYvak4vTHY1RGpTczdTNGZFK2FWRzR5NWd1ZFds?=
 =?utf-8?B?MEovWVBISlRQNGlYQ1FCdE1qS1d6U3c2REFSaS9TTWdzRHdXL2RYSUpyTndD?=
 =?utf-8?B?blNLaEVyeGJHRkFSYjhXZWRIQTJHc05sL1RHR08rdmZ6TW5Ed0l4bGhXY3lu?=
 =?utf-8?B?dnp5bG1HRjk4UVMxNlliTkNwWitvem5NQTVKMXBEaFY3WmRaeXRaTVR5MnZq?=
 =?utf-8?B?emR5dWVLODZ3OGEwaXB4S0h0SGhDb2ZVdm9VYmY2UHFGTWkveXE5Mm0yZkNu?=
 =?utf-8?B?Ums2TUNwQWs3WUZDaGRKZloyMklxb29JSU85U0IxK2JLTi9CbHg2dE5rVzM2?=
 =?utf-8?B?QStRQjIrMWdRbTE5SHJMSnIxY0MwMGVNNEZjTDB1c0xPWE5kOXpwM1RPQzZW?=
 =?utf-8?B?ODVybEcvU0lYVHdTM2VPVEoveFVvN2NNZUkzcGhYby9vUWhJcTQyOWhvcWtS?=
 =?utf-8?B?V3NLVGVBT1RRYUJ1UDFFcWdqZTBERFgwV0pGeG4zVmo3Zi8wWWp5am9mREZE?=
 =?utf-8?B?WGU4VUhqSzRvTUlWT2kvUjVyYUdYVUZFcmU1bWNENUFkNnpuQjgxSjFHZ1lX?=
 =?utf-8?B?eTVKQlpobkZLNEk4Z1IwbXFBRTdRbHVZZVAveks5S2tGV0NzQTJRN21hMDZV?=
 =?utf-8?B?Vk5pd2dNeTNnVmNCYmZ1Nm1zQU02NWliVjNvNzJWNmJueHNpczVoMkI3RUdj?=
 =?utf-8?B?bUhHQTAxVU1uK0I4UDgzY3FaRVNRc24zSHFEMmIzaHN3M0VQUGxndGJmSTcw?=
 =?utf-8?B?NzhJaXBkYU04dXJ4S3pSR0xYMzBzQ2FWZUxKcHcxRWdPOGNFWDEycE9rRENF?=
 =?utf-8?B?L1dCZ2d2K3d0by9mQWdKTWIvekoxRXgxYmRXZWFhcCtlbU43bDJEN0lNL0Fz?=
 =?utf-8?B?ZUdTdi84NlkvQ2FHWTJ5eStLOXRZKzBhMnp3dW1GQlhxUEgrdlk0WmxicmFZ?=
 =?utf-8?B?U24yV0pEQzd2OHFtREE5UXorclM2Y0ZNeGZMcUgzZ1dWOXhvMGVmUVJPdVdY?=
 =?utf-8?B?N0VpdnFDS1dBOEpBcmZSM1Vqa1VXVDF5TlU3TmIzVnNZRGNsMHBrN1VwQ05S?=
 =?utf-8?B?blJuZnAwRXhmQkNlOEJMdW9JU2t1WUt5TzhYUjlRYktkTVovS2grQ1NBQjIv?=
 =?utf-8?B?OU8rODQ0UG9CemEzSGQrcWVTakNzME0vMkpoQkFDcVJIbWRmU2IybldZZ0Rk?=
 =?utf-8?B?VjJla1UyU3d4TUMxUURkV3BES1VQME9NaXNXR1RQaHkyTTlYZ0hmZ2pFNGV6?=
 =?utf-8?Q?gbMj5hMaMqbtAVYx/E1YiZRqblSWNQO/oMGlM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF6A72578D7386489178652C8B359CBE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595c90c5-15fb-41ac-3220-08d8f7f2f99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 05:23:41.3432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqNFKQIdYdGkjZP/wMglUaGbYqdzDVMWCmnBbh5wQ1VzwO6thoLokc9gLjxmE1DX1ues+vY/GGlqFQmC0Tg0euvbibKTsgBG2XXONfkl+ZNvypUr7ZrHktFUM46RU0oW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2396
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDQtMDIgYXQgMjA6MTkgKzAxMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFR1ZSwgTWFyIDMwLCAyMDIxIGF0IDExOjA2OjUzQU0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiA+IERvIHlvdSB0aGluayBMZWUgY291bGQgbWVyZ2Ugb3RoZXIgYnV0
IHRoZSByZWd1bGF0b3IgcGFydHMgdG8gTUZEDQo+ID4gaWYNCj4gPiBNYXJrIGlzIGJ1c3k/IEkn
ZCBsaWtlIHRvIGJlIGFibGUgdG8gc3F1ZWV6ZSB0aGUgYW1vdW50IG9mIHBhdGNoZXMNCj4gPiBh
bmQNCj4gPiByZWNpcGllbnRzIGZvciBmdXR1cmUgaXRlcmF0aW9ucy4gSXQgbWlnaHQgYmUgZWFz
aWVyIHRvIHdvcmsNCj4gPiBkaXJlY3RseQ0KPiA+IG9uIHJlZ3VsYXRvciB0cmVlIGlmIHJlZ3Vs
YXRvciBwYXJ0IGdldHMgZGVsYXllZCB0byBuZXh0IGN5Y2xlLiAoSQ0KPiA+IGRvDQo+ID4gYWxz
byBwbGFuIGZ1cnRoZXIgd29ya2luZyB3aXRoIHRoZSBHUElPIHBhcnQgZHVyaW5nIDUuMTMtcmMg
Y3ljbGUNCj4gPiB0bw0KPiA+IHV0aWxpemUgdGhlIHJlZ21hcF9ncGlvLiBUaGF0IGNvdWxkIGJl
IGRvbmUgaW4gdGhlIEdQSU8gdHJlZSB0aGVuKS4NCj4gPiBJDQo+ID4gdGhpbmsgdGhlIG90aGVy
IHBvcnRpb25zIGFyZSBpbiBhIHByZXR0eSBzdGFibGUgc2hhcGUgbm93Lg0KPiANCj4gVGhpcyB3
b3VsZG4ndCBiZSBhIGJhZCBpZGVhIGluIGdlbmVyYWwgZm9yIHRoZXNlIHNlcmllc2VzLCBlc3Bl
Y2lhbGx5DQo+IHRoZSBiaWdnZXIgb25lcyBvciB0aGUgb25lcyB0aGF0IGdldCBhIGxvdCBvZiBy
ZXZpZXcgY29tbWVudHMgb24gc29tZQ0KPiBwYXRjaGVzLg0KPiANCj4gSW4gYW55IGNhc2UsIGhl
cmUncyBhIHB1bGwgcmVxdWVzdCBmb3IgdGhlIGhlbHBlcnMgdGhhdCBhcmUgYWRkZWQNCg0KVGhh
bmtzIE1hcmsuDQoNCj4gTWF0dGkgVmFpdHRpbmVuICgyKToNCj4gICAgICAgcmVndWxhdG9yOiBo
ZWxwZXJzOiBFeHBvcnQgaGVscGVyIHZvbHRhZ2UgbGlzdGluZw0KPiAgICAgICByZWd1bGF0b3I6
IEFkZCByZWdtYXAgaGVscGVyIGZvciByYW1wLWRlbGF5IHNldHRpbmcNCj4gDQoNCklmIEkgdW5k
ZXJzdGFuZCB0aGlzIGNvcnJlY3RseSwgdGhlIGlkZWEgaXMgdGhhdCBMZWUgY291bGQgcHVsbCB0
aGVzZQ0KY2hhbmdlcyB0byBoaXMgdHJlZT8gU28sIEkgd2lsbCBkcm9wIHRoZXNlIHR3byBwYXRj
aGVzIGZyb20gdGhlIHNlcmllcw0Kd2hlbiBJIHJlc2VuZCBpdC4gSGVscGVycyBhcmUgbmVlZGVk
IGZvciB0aGUgcmVndWxhdG9yIHBhcnQgb2YgdGhlDQpzZXJpZXMgdG8gYXBwbHkuIExlZSwgTWFy
aywgcGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdG9vZC4NCg0KDQpCZXN0IFJlZ2Fy
ZHMNCglNYXR0aSBWYWl0dGluZW4NCg0K
