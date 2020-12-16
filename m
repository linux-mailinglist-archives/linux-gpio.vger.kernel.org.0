Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51B42DBD88
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 10:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgLPJa2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 04:30:28 -0500
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:43998
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbgLPJa1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 04:30:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PICJWV2A9YJ5RHikvQ+7WhHl6XdcRnh+B7rDNXZXfnbc8ljh2gWe5djuYJ3FsH2bELyITGh13hx4T73Hk3QlPxukp/P9ICTfKVAjl/bqNNYwWT5q3qpDNCTYBCKYd3x/G0v+fvW7uCxOC6KY6imS2dnV0MI9HqZkI9jXzeJvcDAfWL85Kp5dNakV6xG9oj6rC11oH8EZM4tV8IUMUI0mIZG8aSuPRcrGty3XghE/SsWtGWb5BBTdXgoQ1pC9LFVAqqRnUpKX5nvGnZZKWPSIBUgJUV/QGATLT5JgAwvk6K4kE5AWr6n+8M3JSKxdJe367KWEkf41WfAZF3gFzfkNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv4QguJA2D5SIT/VsZpFDvhW0vgcUTS1xwlUwhPYIXc=;
 b=DGooJzNHYwZASMpUXSG54tfqj31ffAq5yyWXPSZb6tsBqoG1mWrP12j6+NS0lzLyukR0jSQQRcy1Caeuppm5ZrJNA6CWFOtDw2tE5NwI6OVMllddeOnnru/ZNo9c2dMae4+m3Frmifp8hTDLdBMTe3WCOspeGOekC2RquzMILgcEselUvXW0sk3NIVWKFhFkchgixc2zYIfiK3rZw1P3jLJ69PjaBjmGFqgX/WDJqczMv5z1VVvoPCIk216uuAsr1xlqd/v44KAz0CMFSkDxVPK996nSXmg/YEE7igtCfBkA828VE6ppfWh8ufFX5JZ3UUDqCBTmX1WytRiP9C6Z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv4QguJA2D5SIT/VsZpFDvhW0vgcUTS1xwlUwhPYIXc=;
 b=nfQENvQIrAkufD6JMNsTDLnOjsLH3th1mH7DMl3CSYu3YibOWccmQPP7Bb9zlBfkcLxbJe1GcsYUAUthPxzSrdesNYhTwIaL2h5LVN7cPhtF92XsgW3DEZGgHYaCPMYjhGgB/xLYu4HCwSoiA6wRh7XU/2zGGvZz8HhCD0FhOuA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3068.eurprd03.prod.outlook.com (2603:10a6:7:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.17; Wed, 16 Dec 2020 09:29:37 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 09:29:37 +0000
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
Subject: Re: [PATCH v3 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v3 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW035yi+35IDOo0Uu5Ax/VenPLNqn5aCkAgAAFKICAAAedAA==
Date:   Wed, 16 Dec 2020 09:29:37 +0000
Message-ID: <2899efa7a9a762531f9a23d216601c697d783b1a.camel@fi.rohmeurope.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608104275-13174-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <6937e03fd87f12925d904c2cad0cf665efdc895f.camel@fi.rohmeurope.com>
         <20201216090217.GB207743@dell>
In-Reply-To: <20201216090217.GB207743@dell>
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
x-ms-office365-filtering-correlation-id: a45f6115-e1d9-416a-086b-08d8a1a51b83
x-ms-traffictypediagnostic: HE1PR03MB3068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB30686293E28309163E2CB661ADC50@HE1PR03MB3068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFs3UZmG2YxzMW5f0MT9spSkjkLagc+wA2kCTRwpUlqhRdtUGgMpIFDOUtQLOI3P0DdkH8BqCpQWJUBrGxxdCSJ9eNG9nhxPOEQWlPYq6QyZtywzodjol7ajPIggHHRsxabl6yZXB2YlPwLEB9/wfXB0Et6PrADJFrU9LTFUHd2qqi8KQMtmwLkKqpAYx75nfgmaxuT/qiiQkc6JL6wsCh1orN6yX1NMQbM48UHZ5dnPWFpOhF8EQ47MuAZpRQhSqWXcb0IjmlU0K2kOpNfswSpwChEy49OqD7G5nBmbuV+CXREUHlyJx6BIMuYx88V5VdiYTAQo7oaImdsJmSOB8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(26005)(316002)(83380400001)(3450700001)(76116006)(4001150100001)(478600001)(5660300002)(71200400001)(7416002)(6486002)(66946007)(2616005)(6916009)(86362001)(66556008)(6512007)(186003)(6506007)(4326008)(54906003)(2906002)(66446008)(66476007)(8936002)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aHJXTFpvZitxY3NQanF1UUJIWVppcmZaUEh2Tk42V1N3MnB0U3BEUzhHcWIr?=
 =?utf-8?B?N09INm1qb3dmbHdISGxSVStnKzZMZVBwUitFTXNEYk1zUlZBTkpDVzRqejRL?=
 =?utf-8?B?NVpleEllb3VYMUFnWTdCaUhtY2EzUXJERVl4cDNOS3UzZFZSUUNLa1lTOUEw?=
 =?utf-8?B?QWFUSHkwQ1lhVTlaRmc4Z2ZDMkt5QTZ2b200VDRQU1dyOHNrUXFpMUxYaWl1?=
 =?utf-8?B?empGWXMyTVE3cS93NUYyM09aVlZ5SXBHazIrWmFocUtyL1FaTU4zb0F1T2R2?=
 =?utf-8?B?NWg2TlNqU1J2N1d6Q1lOWDlUdXhXUjNGZ3dBcUZXK25pcHdOTjI3akRMMmRT?=
 =?utf-8?B?REozOTd5ejczU0tzalQ4akE3bEhNKzQrUFhNbG9xNG52NmhiMHhudDRrMVZZ?=
 =?utf-8?B?dkNrVXdISEdOc2ZNU0l0WmNSU2ZrTkZRQklUbjVoTFlzWkQ4a2FpNjljWHlR?=
 =?utf-8?B?OEo3ZDE5bUFtbDlybGlJU0NWQzI0eklMKzBvUmZRenlPUU5XZU5DM0ZqRTE1?=
 =?utf-8?B?MTdJMzZwUmdBaHYxK1pUQUxXcWI2eDZnaTFHT3lXL1g4cWYrVnVqVWN5WVo0?=
 =?utf-8?B?ZVRIUXRyc0lpQ1ZZYnpuaGNXcWgvTVNLRjlTZ0NQNjdwdWJLdDFTRWdpVitz?=
 =?utf-8?B?ZG5sVHNNWHJvZlZ3SVNJRFFRbE1QSnEzc0lBQ0JWaHF2NXFiTjJ1dnBJeGIw?=
 =?utf-8?B?NVdOQzJwMG5XY3ZJTGJyU2E2YzZQMzg0ckhvcW9oNzdjd29sTFM1Q0xkM1cr?=
 =?utf-8?B?ZnRTMjFkSUJyV2RNUFNmUFFXTWdGd3BVMmNJSU16VWdlZWNST21FVHBoY1p2?=
 =?utf-8?B?S0o0MFRCQ0swOXRaajlzbzEzZGV3TWhzbFcwM3FJeEJhR0I5VWkvZmJ3RE9J?=
 =?utf-8?B?c2tWUjcyNGRjTHdTK2I4bmtZMXQ4YTZzdEFqL2hmaGVvU0JZODFncTA4MXJ1?=
 =?utf-8?B?WFRIQVRhOU02NmpLWkV0WndlZkJEZGpScFYwREVwZjhzVUF3MVdaaHo2aUtm?=
 =?utf-8?B?WkpYczR2NlE0Y1hpOFQ0SkY3QzQ3cENSdk43dkRjTk5FU2xvdTVTR2NybDFk?=
 =?utf-8?B?c3JKRXd4NGU2c1E5ZGpKdjVoaCtxWXZ6T2p4aEFnaTRZZFZpK1ptMFpZL0Zx?=
 =?utf-8?B?TmgvUXdWZnFaYmhoalBrc0VpaitqVHZLemVJanduMFNiQkt0VUIrZzdFZFhK?=
 =?utf-8?B?QW9hKzVScnNWNWIzbkpOV3hvYTBQYWhiRGdnM0NSWFBCN2FyQkRiaXlCZlFS?=
 =?utf-8?B?ajNoU1lZNnlWMHhyNEhOSU1PL0tlTVdLdWIxRWM5L2k3VTYzTkhkZXFpcnBN?=
 =?utf-8?Q?+UddSvYB5cjT1GN00pf2Zy1rAoxJq1/dVi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35AD46259AA1A94CA5A8BD73AB1190C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45f6115-e1d9-416a-086b-08d8a1a51b83
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 09:29:37.5143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1pGAnnYLykWhWJu5KDH41zqDg0pCIC4A2T8LasOGQQXOKLhS1xS3pT08kKuVLHy6GA1k/MhB8kpIWGf6ggZJv6k0R/UKn2zsGIFqw+6+T86t9n7ACIKHVnHnwkD2WEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3068
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMDk6MDIgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gV2VkLCAxNiBEZWMgMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gDQo+ID4gT24g
V2VkLCAyMDIwLTEyLTE2IGF0IDE2OjM3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToN
Cj4gPiA+IEZyb206IEtoaWVtIE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0K
PiA+ID4gDQo+ID4gPiBUaGUgbmV3IFBNSUMgQkQ5NTc0TVdGIGluaGVyaXRzIGZlYXR1cmVzIGZy
b20gQkQ5NTcxTVdWLg0KPiA+ID4gQWRkIHRoZSBzdXBwb3J0IG9mIG5ldyBQTUlDIHRvIGV4aXN0
aW5nIGJkOTU3MW13diBkcml2ZXIuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtoaWVt
IE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0KPiA+ID4gW3NoaW1vZGE6IHJl
YmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9k
YSA8DQo+ID4gPiB5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiANCj4gPiBS
ZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9w
ZS5jb20+DQo+ID4gDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAg
ICAgICB8IDg2DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystDQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvYmQ5NTcxbXd2LmggfCAxOCArKysrKysrLS0N
Cj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+IA0KPiAuLi4gYW5kIHBsZWFzZSBzbmlwIGxvbmcgcmVwbGllcy4NCj4gDQo+IFNjcm9sbGlu
ZyBkb3duIHBhc3QgbG90cyBvZiB1bi1yZXZpZXdlZCBjb2RlIGFuZC9vciBwYXN0IHRoZSBlbmQg
b2YNCj4gdGhlIGxhc3QgcmV2aWV3IGNvbW1lbnQgaXMgYSB3YXN0ZSBvZiBwZW9wbGUncyB0aW1l
LiAgVGhhbmtzLg0KPiANCkhtLiBSaWdodC4gSSB0aG91Z2h0IHRoYXQgbGVhdmluZyB3aG9sZSBw
YXRjaCB0aGVyZSB3aGVuIGp1c3QgYWRkaW5nDQphY2sgb3IgcmV2aWV3ZWQtYnkgZ2l2ZXMgZnVs
bCBpbmZvcm1hdGlvbiBhcyB0byB3aGljaCBleGFjdCBwYXRjaA0KdmVyc2lvbiB3YXMgcmV2aWV3
ZWQuIEJ1dCBJIGFkbWl0IHNjcm9sbGluZyBjYW4gYmUgYW5ub3lpbmcgLSBiZXNpZGVzLA0KdGhl
IHNlbmQvcmVjZWl2ZSB0aW1lIGluIHF1b3RlIGNhbiBwcm9iYWJseSBiZSB1c2VkIHRvIHRyYWNr
IHRoZSBleGNhdA0KdmVyc2lvbiB3aGljaCB3YXMgcmV2aWV3ZWQuIFNvIHBvaW50IHRha2VuLiBU
aGFua3MuDQoNCkJlc3QgUmVnYXJkcw0KICAgIE1hdHRpDQo=
