Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B05D2DBD4B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 10:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgLPJKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 04:10:07 -0500
Received: from mail-eopbgr130049.outbound.protection.outlook.com ([40.107.13.49]:22244
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726216AbgLPJKG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 04:10:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hda/lfRsDg3d1K13uhKAmM3mNbA3PC6OhqJPvP9twxcsn2z5w3Q/4jqBDRxbGOWRg4IyXlcWaae2z02+I4G/sFwYwahAD8ev83Td4UVmG6353ErTMHGdLnf2m8FwEb5mhLs9jU4+AnGbhgPyIQDvtueFrSUEfy8Lf3pGkvTmA27lhVpOgSMOTily38kZ/OnE9EZz4kyXckR1hnjR25vrl1/vTA0ZM3ePvi2fDOEseejtbjlxMBUxPcWlemh0rw0ZO8TjPPqSLfcIs6Lwod6mIApMWLTzRTWK0NoXzyTL8FJEKKGAW5qPbdI6IXn5PCmTVuAPzh0BB0EdrWsK9rHfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVcR98yYWk91UrMdQtIyWgpWurmw8cJNaNsgKxBClQk=;
 b=gjm5d5s7spMIXQwsxVa8sgaGON/mS7jNKyjnMYG3lDbzf/bSL64+P8ibKccXqQ9BhSl3rIaxjHB/t/aPHNsG2nZysj8wkrPROUsrqI/vjprWc4hBTD90Jrnn5bT7MlHMzG4tR5btYeeQp358woQ6v4dGXBQIOcJjSQqtzJ8CcfzpBAi/8Y1nmxX1A0lbdftac8RUq9sbwE+c+v/d4KAFyCo0AHE5p0YOW294w7Cp6ACol91Uq08kHC1j2P8DLay90rEebPrhdgG04zlE9vBzThYtDAIXy9tYtyEo6soXXRHyTYeZBGaXOJIN7MlmBjEiE1lqIC9acvhNbBSOVnyChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVcR98yYWk91UrMdQtIyWgpWurmw8cJNaNsgKxBClQk=;
 b=f5irEMQXaWkCYaC4kUP+eg3odQvsYlsG0B6aOsNENSgElc967CqcNKhOL6mubLf+clqAfuh2Gu5KJr7TPATLOfUAzpOTqIy8aCLmA5wIy6clMcPIzS3NM0IeIwc5fF9KAK2ylWX5wswdYduVmSjIwZdhM9oe4/piVR8lSaD3Clo=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3065.eurprd03.prod.outlook.com (2603:10a6:7:60::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.17; Wed, 16 Dec 2020 09:09:15 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 09:09:15 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHW035y6BNLGpWx2EuQSEwrpEd9qan5YvcAgAAJ7ICAAAJfAA==
Date:   Wed, 16 Dec 2020 09:09:15 +0000
Message-ID: <858768c6522e9a407617ef21d6c7793fd71964dc.camel@fi.rohmeurope.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608104275-13174-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <4021c3f04bf8c4dcbcb015056455c4acf9e71b6b.camel@fi.rohmeurope.com>
         <20201216090045.GA207743@dell>
In-Reply-To: <20201216090045.GA207743@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 985e3195-1fb1-4b4e-9bd2-08d8a1a24324
x-ms-traffictypediagnostic: HE1PR03MB3065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB30653ECBC93FAA4F8EA3E6A8ADC50@HE1PR03MB3065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fQiPVuG9x+mOhMVzV/fTEXNZaXUFxopeq/2luW6S3qz0aQv07bF6cNRCcWGKIeXKGgi0fr2mFluB5urw3rL313l8lZNI5m8bjrifR9hORKPmdleWoMh2XKZIrO7H1xKPmMsGF3PiYj4s3xR+48DS2vquxMBWS5CIGTCX4/UYFft9XPJiSSCfF+fyvZzdPcV1YsiF7qN8LQLPtW/JbO+0Ye7KWUgK5nt3bzMlbry00n8ToOaSdFRpHdlEAi7cm1A1C71olzyYdGu/PjAE5YLKqS0++0YWipo7KYuXZFzr4nBZ99xXgL5HQDLrQErgmufYi3kS4muLOh1WN1FIEfPJo+9KSNTdUGiV0o+OJm+k1ShdCFjuIpKVz136NtZgvA0k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39840400004)(376002)(366004)(8936002)(6486002)(66946007)(478600001)(26005)(5660300002)(8676002)(71200400001)(4326008)(83380400001)(6916009)(7416002)(316002)(54906003)(2616005)(64756008)(6512007)(3450700001)(66556008)(66476007)(66446008)(186003)(4001150100001)(76116006)(2906002)(86362001)(6506007)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?c2lWQThOQ1ZEYWZkQ29Dc3ovMm1LemttUVlhTGRjSlBBbnlWYVpHTFA1K1hr?=
 =?utf-8?B?MnZHTDFGYWwwM2ExNmFKQWYxM2o0WXFKM3Nyd3IyZUxDeFJoV2s4VDdaRXkx?=
 =?utf-8?B?ZTdTYURhd0tWQUtZV3ZtQVhSMURjU0JUTWJRVzVCSmdRSUNWc1I2OTltTDcv?=
 =?utf-8?B?RHZuQlZVVzVuaTVnem51ZU9ENWp0bFlScUdpWCtpSHFxYVViT1l2Y2c0V3NX?=
 =?utf-8?B?Rnp1NnFzR1JnRDZnK2JNSnJ5NXZKdGNvNVhFNFFMNU1BRlhqSnc1UWFXRzFH?=
 =?utf-8?B?UHlmck9UWk9Qbm50RWxEWjVBTTZyeTFPMUNsZGJlMThuVDN4NCs3elhHNlhR?=
 =?utf-8?B?cTREZjBuTy9PUUkvQm9COFJ3SCtYUHJUUUYxdTdLRi9ybkh1cG9ieGF5QWJz?=
 =?utf-8?B?bUExNmsrUVJHWlRNZWFLSVJZN3ZMNW1TSzBYSW5WRGUza0VEQ3lHZkVGYkVT?=
 =?utf-8?B?NVp2eElxbm1DeFk0bFFtMThGY0xiM1ZWQkJubjFKV3V2Skl4MVVUNnhiYnlJ?=
 =?utf-8?B?bjFlVWRqbzY0ZzhVdzFVdkZDSnFMVVRHaTFpUm8yQStFZkREalZ2TVdPYTJm?=
 =?utf-8?B?UklnVVJhLzJUWWpPYlNPRGxYdWhjRG52YVBIVTZTYmNZalNNS3VUaEYwTmpn?=
 =?utf-8?B?dmN6M1o5VEFqOS9hL1VYOEZLTVRySjdwQU5aQXh5VEoxWUIrZzlGTW05Vytw?=
 =?utf-8?B?UVl1dmNOQksyanp2R0pKM3g0VjExMWVQZTBlOU9ubFJ6VUNsUkJ3d3l6TUFr?=
 =?utf-8?B?TXM5QmdENzZEVFBTZUZ6VlBBdmJVQUF3QjdORFArTDFSOWcvRTdYYmNnYTY3?=
 =?utf-8?B?ekdCd2pNRFpiV0Y3NzFKSVhRYjYwSXdqVEpVcU9wem1nSWh6MUxsOFo3UkVC?=
 =?utf-8?B?OW5PRjJadEhXRG85SDA3NFVlYVNFWkk2YVFQVkF2cmpXK01PSkRma1A0MUNo?=
 =?utf-8?B?Q2RyWWRBNkpiNXU2NFlXdnB0eWlUNy9iR25LTUVGQkxWY1QzbXdEcVkyRVVZ?=
 =?utf-8?B?UUVlb0dRQ1poUnRtcTNVRXRlVldQS29xMStGZkl1VWFZbHlJUTZqUU9ERmN4?=
 =?utf-8?B?VG5pSnRxbDVUSWlkYmZPL2M1enJETitSV0grdFYvSTUwcmdhREtKM0NDTXUx?=
 =?utf-8?B?NDg0ZHo1N2ViMkR0N0ZGaFY3U3RYN1BjU2daRlhzR1I2alR4MmJqRUZmMzJU?=
 =?utf-8?B?ZnRUanMwS0tUNE9XZVhxcTFYd2FhYTRKNUFmWm5YVXlIVy9aTXZ6b2xTYzVX?=
 =?utf-8?B?WkMrR0FqQmRjb0Yrb0NDYU4vYnlxV3ZFU1NxVnNUR2JydXQ5NWtKZjVkYWp3?=
 =?utf-8?Q?d+NWUC/Wxr4aK8f7yYbYM/1NeXL8xz5C+v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCEAE8113C025D459DC0A6E938090FB0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985e3195-1fb1-4b4e-9bd2-08d8a1a24324
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 09:09:15.5232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTOfCFbpxfX7zcYlox0gAqQqeNvqaouXB48/vOIMrE5HKe9QYTzHwFmRtaeRLGvzl/7oNF7Y9wbt0kxQ3VOujO1CVmeFuOCt1llp+7rQE9JDmoG6rVdtxWjh0KlRvb1u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3065
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMDk6MDAgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gV2VkLCAxNiBEZWMgMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gDQo+ID4gT24g
V2VkLCAyMDIwLTEyLTE2IGF0IDE2OjM3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToN
Cj4gPiA+IEZyb206IEtoaWVtIE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0K
PiA+ID4gDQo+ID4gPiBTaW5jZSB0aGUgZHJpdmVyIHN1cHBvcnRzIEJEOTU3MU1XViBQTUlDIG9u
bHksDQo+ID4gPiB0aGlzIHBhdGNoIG1ha2VzIHRoZSBmdW5jdGlvbnMgYW5kIGRhdGEgc3RydWN0
dXJlIGJlY29tZSBtb3JlDQo+ID4gPiBnZW5lcmljDQo+ID4gPiBzbyB0aGF0IGl0IGNhbiBzdXBw
b3J0IG90aGVyIFBNSUMgdmFyaWFudHMgYXMgd2VsbC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogS2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo+ID4gPiBb
c2hpbW9kYTogcmViYXNlIGFuZCByZWZhY3Rvcl0NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hp
aGlybyBTaGltb2RhIDwNCj4gPiA+IHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0K
PiA+IA0KPiA+IFJldmlld2VkLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBm
aS5yb2htZXVyb3BlLmNvbT4NCj4gDQo+IFBsZWFzZSBwbGFjZSBhbnkgKi1ieSB0YWdzICphZnRl
ciogdGhlIG90aGVyIGNvbW1lbnRzLg0KPiANCj4gRm9ydHVuYXRlbHksIHRoZSBmaXJzdCBvbmUg
YmVsb3cgd2FzIHN0aWxsIG9uIG15IHNjcmVlbiwgZWxzZSBJIHdvdWxkDQo+IGhhdmUgc3RvcHBl
ZCByZWFkaW5nIGhlcmUuDQo+IA0KDQpHb29kIHBvaW50LiBJJ2QgYmV0dGVyIGtlZXAgdGhhdCBv
biBtaW5kLiBBbHRob3VnaCBtaXNzaW5nIHN0dWZmIGFmdGVyDQphIFJldmlld2VkLWJ5IGlzIG5v
dCB0aGF0IGZhdGFsIDspDQoNCg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9tZmQvYmQ5NTcx
bXd2LmMgICAgICAgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+IC0tLS0N
Cj4gPiA+IC0tLS0tLS0tLS0tLQ0KPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL2JkOTU3MW13di5o
IHwgMTggKystLS0tLS0NCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyks
IDUwIGRlbGV0aW9ucygtKQ0KDQo=
