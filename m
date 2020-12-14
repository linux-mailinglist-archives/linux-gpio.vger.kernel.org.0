Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866F52D938E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 08:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438889AbgLNHNq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 02:13:46 -0500
Received: from mail-eopbgr130074.outbound.protection.outlook.com ([40.107.13.74]:20003
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725763AbgLNHNm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 02:13:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2u7FeK1/VuavAl69BUn9JIPqmTXsG1yxkty/N+G66InApxUZHUO7QRJKVdtNwY7n0zbGGGsUBnJpXGvKCS30FuvP/4eG8AKgzUi9MCEsgTHUWnEzZBGmU9G2DwGa0+LxbfPsmbowZ1fQDj3f4g4yBeLaZRkpGPYwNbzsfHiAQOSHGLKVkNiPVh7/5pol6i/rdPm7ziBOEoaRdLJPCurm20kUkwNQqsAIZCowx4oU46YHeyKmJeCfTx5PI2x7msh97yTfS1BaMKeoW+GA1kAAv1woLzUyYafinQqpuMbWy5NyvVzIyiliVABRVq3LeGFsKeEQCaaufgvwC/TUIMsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOCZeEc0R3I1wH7XGts9/VXz4wQlWA72CoNzb+/D/po=;
 b=ZTSBs92r4dz3nBF5ciUjHU8vJkKgGUfp+F7W9km3I3f93dn2Q+vxWA5ivn3SO9XMQu1dLGnS/gVKlfHh6lrtdy0nDTLSqb0ps1w4uImU9ucN/ZZW9p7X0BhvCLS9F/LIffjX/MloQbHLGxSHKmYqgiqHFje/xY0jq16jdj/8RrWAVKNddSkqlnG0xbkzQrOutr7RoRnvjPe+FfV6oo5USpi3y+kroz1hnmqyJzuPuJe/VbeqqA/Z0DIatLSsPNZhvDNZJEXyaqpS+81edAVKWHvKr7BTOfmFOE67o6NaYcCs/J2GSFa350sW4FBW6q/SYEJY11EPni0sLiR6j6JfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOCZeEc0R3I1wH7XGts9/VXz4wQlWA72CoNzb+/D/po=;
 b=j3ISP15DjL7NXOricOeJWU1yDopuDZLdx0mceuhgEL3QZoubkKaM0fOlRchP3cOENX1iv//NjrOfRKL1OhLEbsmWqWh731eqnInyb1zqNIoIJGDl/lMgIkw8gaC2OAz6ECdCCaf1H3xsyrPUzrBz2u3dEb6P72Jyyaj1+P1ND8E=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2476.eurprd03.prod.outlook.com (2603:10a6:3:6e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.15; Mon, 14 Dec 2020 07:12:49 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 07:12:49 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CwEl0Fmld+qk2IHLLNWBbVIqnx1IeAgAQ3VQCAACXQAA==
Date:   Mon, 14 Dec 2020 07:12:48 +0000
Message-ID: <9ca960355762528f3b91f7622aa799e831492f8d.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <ab27db32a8da1486e14722831da947d37bbdcf7d.camel@fi.rohmeurope.com>
         <TY2PR01MB3692F97109A6E409DEA9EAA6D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F97109A6E409DEA9EAA6D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b874c20-7462-4bd8-19c2-08d89fffaa09
x-ms-traffictypediagnostic: HE1PR0301MB2476:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB24769003155597B26B5C4537ADC70@HE1PR0301MB2476.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 34hQm2c8tzFVR5DJPc4EGB5OXMW79gMpUDZiAZBHcJNfTn7UtePiUpD+7uvUGx2zSC4IeEKC6o6EMZ+RXGsqmq/dME0WFwBJ/VjxGv9xufhJ6yJUz2Nya4UNVhThiRWMVIVicBvBwjvYYsnRe4nKXYeq2FKeLlBlw1ieHC7lMAxDxcUfZuy8WozIAks1hAvrQBTNWuT1zuhs398xyhh011T/Sbcw7H6lEzlgf6XR0JLHjyAiis1lDi0033Ot3ENCj3YyU0Ik9MNOi/suox3zkS+8vxFeAMs4CN7QY6A43iPROTawMWOU6IbA6go7tvEWbQmrlNsqTnVEebhtFD3qWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(366004)(376002)(346002)(2616005)(7416002)(316002)(83380400001)(76116006)(2906002)(8676002)(186003)(8936002)(64756008)(3450700001)(6486002)(4326008)(66556008)(6512007)(66946007)(26005)(66476007)(110136005)(4001150100001)(5660300002)(54906003)(478600001)(66446008)(71200400001)(86362001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TE5ETXBNc3hka3pzTk5rNlp3bFJDUzVibEJoQXY3ZEZVck1VdGJoLy96UnAv?=
 =?utf-8?B?MXJGRXhSTVh6MVBSakdYWUF4UWo0ZWdxTUtRcFFlSXhsN0JlNGtuM3pLZlBL?=
 =?utf-8?B?MmxINy9HSmk3N0QvblluYzVEd1hXR1hQOHV5cDRUREVObnFjTGtlWDdoSDQr?=
 =?utf-8?B?UGpZQkdlVG9DWS9BbXQwa3ZjcXlmSG96ZlRaU1kyOHVjOU5aczlPM2xIbmF4?=
 =?utf-8?B?M216RjUwS2ZwRyt3czN5M0M4TUVaQ3Y3cGQ5U3gvbDFELy9OMVNNS1RLNFRN?=
 =?utf-8?B?S0hNRzVBeUR0MlhNUUpqVjFhMnNWYXNrVUs1blRuZlVtVHVKNUtQaVY2UEZx?=
 =?utf-8?B?b05HY2xxakQ0RHE3SlhTcXRLVWp0aXBjOW5DQkYza1pTREUxb1Noc2M3eHBn?=
 =?utf-8?B?ODFaYkNnL09wbkhxMUU1REtnWHErd1FWR05mWk1qQ21BOWhOVjljdmdzbXB6?=
 =?utf-8?B?OWxvS1M5THRVSncvMlhIODZRa1pNbzE0ZnNJZm51NWZjM25mRlhvT2xoR2oy?=
 =?utf-8?B?WU9aZ0dqZFNjeWoycjRwdlhrQW9sdWN0VUkyS080N1Jnbk1WRGVIWWE5NXps?=
 =?utf-8?B?V2MwakZwYzQvT1A2NHpBT2s4eFJ5Q2E0RndCTUI3RWtxS3I3Umhkb29BWmFr?=
 =?utf-8?B?MUhKNHlSK3BVN3cyVUY5OXdQWDdOdVJUVlNSTjR0N2NNWndPNUdJTHd4U1Rt?=
 =?utf-8?B?Snl4WFMybWp6R0t4clhaN0dBSzVYdGthZ1VSdXQvbVk0T1NpTjZPZUplTTZ2?=
 =?utf-8?B?S1JRYTQvWTZFKzRpcXdxN3A1L2lJajVjM1ltVXF5TUlKSXMzY3NjWGsvanBT?=
 =?utf-8?B?VytLUGt2aU9LeThvdS9DeVBxWEJudGtpRHN2K3lIVEZrMUt2cG04ZE1QN243?=
 =?utf-8?B?WDNEU3RRWkw4QU9oQkFsZE4zVWVocitUZW9CYm9zT2NWNWpOOFM5Ly9DdGNQ?=
 =?utf-8?B?dGtuNU5rRmt0ZlpVNkVRVXUyUDJ6V1lIRHBJZU8zUVlOZyt0T1E0T29oOC9L?=
 =?utf-8?B?TDNwYXFpaUlyNTVoN01XSXNDMFJsQTNxZEUvVmw0SnF4U0RGWGw3YlZFY0R4?=
 =?utf-8?B?MDE1N0ROT1Jpbk52NVlmRS9iTDdueVNzZzVlWXNNcHhZOERHeDcxOHNJN1Vj?=
 =?utf-8?B?K2JTUDVPN2liWURzblFFb0k2TllSK0orT3BicWRab2JJdUxLTGJCejgvU3VG?=
 =?utf-8?B?c2UzMU0xWE9WY0ROejViYklQZUxwVTBwSmNWWmI4V2NiUU43TUhTSGVNVGhM?=
 =?utf-8?B?K2VHdldHbU1yM1JLcy92d1R4YzRMaUpXdkNYMkE5UERLTm1DWmdWV1l5OENL?=
 =?utf-8?Q?cYZEtJU74dJVNM3y8NbcI9Hc6CLIHpV3zY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E77861A638A3364DA4B12124D6FC2A3A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b874c20-7462-4bd8-19c2-08d89fffaa09
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 07:12:48.9576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QguzSnj2fZXl5pW8/pv/suuAg6VNzwB4vMkYMwgbe0wxZ60dA7vp67KUrPuNo6uTzvLRvgNh3t0GGkjh5JsUiIVkFYEZ8YwnSVx0naimDnLXjxPna4LeyNyUmDSnKaGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2476
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gU2hpbW9kYS1zYW4sDQoNCk9uIE1vbiwgMjAyMC0xMi0xNCBhdCAwNDo1NyArMDAwMCwg
WW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+IEhlbGxvIE1hdHRpLXNhbiwNCj4gDQo+ID4gRnJv
bTogVmFpdHRpbmVuLCBNYXR0aSwgU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMSwgMjAyMCA5OjM0
IFBNDQo+ID4gDQo+ID4gSGVsbG8gYWdhaW4gU2hpbWFkYS1zYW4sDQo+ID4gDQo+ID4gT24gRnJp
LCAyMDIwLTEyLTExIGF0IDIwOjI3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4g
PiA+IEFkZCBzdXBwb3J0IGZvciBCRDk1NzRNV0Ygd2hpY2ggaXMgc2lsaW1hciBjaGlwIHdpdGgg
QkQ5NTcxTVdWLg0KPiA+ID4gTm90ZSB0aGF0IEJEOTU3NE1XRiBkb2Vzbid0IHN1cHBvcnQgQVZT
IGFuZCBWSUQuDQo+ID4gDQo+ID4gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0IGlzIFZJRD8N
Cj4gDQo+IEl0IHNlZW1zIHJlYWRpbmcgc29tZSB2b2x0YWdlcyBmcm9tIHJlZ2lzdGVycy4NCj4g
Rm9yIGV4YW1wbGUsIEJEOTU3MSBoYXMgIlZEMThfVklEIiByZWdpc3RlciB3aGljaA0KPiBpcyBw
cm9oaWJpdCB0byB3cml0ZS4gQnV0LCBCRDk1NzQgZG9lc24ndCBoYXZlIHRoaXMNCj4gcmVnaXN0
ZXIuIEFsc28sIHRoZSBkcml2ZXIgbmFtZXMgInZpZF9vcHMiLA0KPiBzbyBJIGRlc2NyaWJlZCAi
VklEIiBoZXJlLiBQZXJoYXBzLCB3ZSBzaG91bGQgcmV2aXNlDQo+IHRoZSBkZXNjcmlwdGlvbiB0
byBjbGVhci4gKFBsZWFzZSBsb29rICJVcGRhdGVkIGRlc2NyaXB0aW9uIiBpbiB0aGlzDQo+IGVt
YWlsLikNCg0KVGhhbmsgeW91IGZvciBkZXRhaWxlZCBleHBsYW5hdGlvbi4gU28gYXMgZmFyIGFz
IEkgdW5kZXJzdG9vZCAtIFZJRCBpcw0KYSByZWdpc3RlciB3aGljaCBkaXNwbGF5cyB0aGUgY3Vy
cmVudCBvdXRwdXQgdm9sdGFnZSwgcmlnaHQ/IElmIEkgYW0NCm5vdCBtaXN0YWtlbiwgdGhpcyBp
cyBkaWZmZXJlbnQgZnJvbSByZWdpc3RlciB3aGVyZSAoaW5pdGlhbCkgdm9sdGFnZQ0KaXMgc2V0
Pw0KDQo+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPA0KPiA+ID4g
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2
ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMgfCAxMCArKysrKysrKy0tDQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0
b3IuYw0KPiA+ID4gYi9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4g
PiA+IGluZGV4IDAyMTIwYjAuLjA0MTMzOWIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3Jl
Z3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvcmVndWxh
dG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gPiAg
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiA+ICAvKg0KPiA+ID4gLSAq
IFJPSE0gQkQ5NTcxTVdWLU0gcmVndWxhdG9yIGRyaXZlcg0KPiA+ID4gKyAqIFJPSE0gQkQ5NTcx
TVdWLU0gYW5kIEJEOTU3NE1XRi1NIHJlZ3VsYXRvciBkcml2ZXINCj4gPiA+ICAgKg0KPiA+ID4g
ICAqIENvcHlyaWdodCAoQykgMjAxNyBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXQrcmVuZXNhc0Bn
bWFpbC5jb20NCj4gPiA+ID4NCj4gPiA+ICAgKg0KPiA+ID4gQEAgLTksNiArOSw3IEBADQo+ID4g
PiAgICogTk9URTogVkQwOSBpcyBtaXNzaW5nDQo+ID4gPiAgICovDQo+ID4gPiANCj4gPiA+ICsj
aW5jbHVkZSA8bGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiA+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gPiBAQCAtMjc3LDYgKzI3OCw3IEBAIHN0
YXRpYyBpbnQgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3QNCj4gPiA+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiA+ICAJc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXY7DQo+ID4g
PiAgCXVuc2lnbmVkIGludCB2YWw7DQo+ID4gPiAgCWludCBpOw0KPiA+ID4gKwllbnVtIHJvaG1f
Y2hpcF90eXBlIGNoaXAgPSBwbGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpLQ0KPiA+ID4gPiBk
cml2ZXJfZGF0YTsNCj4gPiA+IA0KPiA+ID4gIAliZHJlZyA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKmJkcmVnKSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiAgCWlmICghYmRyZWcpDQo+
ID4gPiBAQCAtMjkyLDYgKzI5NCw5IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9w
cm9iZShzdHJ1Y3QNCj4gPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ICAJY29uZmln
LnJlZ21hcCA9IGJkcmVnLT5yZWdtYXA7DQo+ID4gPiANCj4gPiA+ICAJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUocmVndWxhdG9ycyk7IGkrKykgew0KPiA+ID4gKwkJLyogQkQ5NTc0TVdGIHN1
cHBvcnRzIERWRlMgb25seSAqLw0KPiA+ID4gKwkJaWYgKGNoaXAgPT0gUk9ITV9DSElQX1RZUEVf
QkQ5NTc0ICYmIHJlZ3VsYXRvcnNbaV0uaWQNCj4gPiA+ICE9IERWRlMpDQo+ID4gPiArCQkJY29u
dGludWU7DQo+ID4gDQo+ID4gRG9lcyB0aGlzIG1lYW4gdGhhdCByZWFkaW5nIFZEMDkgdm9sdGFn
ZSBpcyBub3Qgc3VwcG9ydGVkIGJ5DQo+ID4gZHJpdmVyPw0KPiANCj4gWWVzLiBBbHNvLCByZWFk
aW5nIFZEezE4LDI1LDMzfSB2b2x0YWdlIGFyZSBub3Qgc3VwcG9ydGVkLg0KDQpJIHRoaW5rIHRo
YXQgd291bGQgYmUgZXhjZWxsZW50IGNvbW1lbnQgaGVyZS4gTWF5YmUgc29tZXRoaW5nIGxpa2U6
ICJXZQ0KZG9uJ3Qgc3VwcG9ydCB2b2x0YWdlIHJhaWxzIFZEezA5LDE4LDI1LDMzfSBieSB0aGlz
IGRyaXZlciBvbiBCRDk1NzQuIg0KDQo+IA0KPiA+IChJDQo+ID4gYXNzdW1lZCBWRDA5IGluaXRp
YWwgdm9sdGFnZSBjYW4gYmUgc2V0IGZyb20gZWVwcm9tKD8pIGFuZCByZWFkIGJ5DQo+ID4gZHJp
dmVyIC0gSSBtYXkgYmUgd3JvbmcgdGhvdWdoKS4gUGVyaGFwcyBpdCBpcyB3b3J0aCBtZW50aW9u
aW5nIGluDQo+ID4gdGhlDQo+ID4gY29tbWl0IG1lc3NhZ2UgYXMgYSBkcml2ZXIgcmVzdHJpY3Rp
b24/DQo+IA0KPiBZZXMsIHRoZXNlIHZvbHRhZ2UgY2FuIGJlIHNldCBmcm9tIGVlcHJvbSBhbmQg
cmVhZCBieSBkcml2ZXIuDQo+IFNvLCBJIHVwZGF0ZWQgdGhlIGRlc2NyaXB0aW9uIGxpa2UgYmVs
b3cuDQo+IA0KPiAtLSBVcGRhdGVkIGRlc2NyaXB0aW9uIC0tDQo+IEFkZCBzdXBwb3J0IGZvciBC
RDk1NzRNV0Ygd2hpY2ggaXMgc2ltaWxhciBjaGlwIHdpdGggQkQ5NTcxTVdWLg0KPiBOb3RlIHRo
YXQgc2luY2UgQkQ5NTc0TVdGIGRvZXNuJ3QgaGF2ZSBhdnNfb3BzIGFuZCB2aWRfb3BzDQo+IHJl
bGF0ZWQgcmVnaXN0ZXJzLCB0aGlzIGRyaXZlciBhdm9pZHMgdG8gdXNlIHRoZXNlIHJlZ2lzdGVy
cw0KPiBpZiBCRDk1NzRNV0YgaXMgdXNlZC4NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoN
ClRoYW5rIHlvdSA6KSBXaGF0IEkgd2FzIGFmdGVyIGlzIHRoYXQgSSB3b3VsZCBsaWtlIHRvIGxl
YXZlIGEgbm90ZQ0KYWJvdXQgJ3doYXQgY291bGQgYmUgaW1wcm92ZWQnIG9yIGFib3V0IHdoYXQg
aXMgdGhlICdzb2Z0d2FyZQ0KbGltaXRhdGlvbicgaGVyZSBzbyB0aGF0IGlmIGFueW9uZSBsYXRl
ciBuZWVkcyB0aGUgb3RoZXIgdm9sdGFnZSByYWlscw0KaGUgd291bGQgaGF2ZSBhIGhpbnQgYWJv
dXQgd2hhdCBjb3VsZCBiZSBkb25lLg0KDQpEbyB5b3UgdGhpbmsgbWVudGlvbmluZyB0aGF0ICJ0
aGUgVkQwOSB2b2x0YWdlIGNvdWxkIGJlIHJlYWQgZnJvbSBQTUlDDQpidXQgdGhhdCBpcyBub3Qg
c3VwcG9ydGVkIGJ5IHRoaXMgY29tbWl0IiBpbiBjb21taXQgbWVzc2FnZSB3b3VsZCBiZQ0KT2s/
DQoNCj4gDQo+ID4gQW5kIGp1c3QgYXNraW5nIG91dCBvZiB0aGUgY3VyaW9zaXR5IC0gYXJlIHRo
ZSBvdGhlciB2b2x0YWdlIHJhaWxzDQo+ID4gbGlzdGVkIGluIGRhdGEtc2hlZXQgKFZEMTgsIERE
UjAsIFZEMzMsIFZEMDkgYW5kIExETzEsLi4uLExETzQpDQo+ID4gc2V0LXVwDQo+ID4gZnJvbSBE
VCBhcyBmaXhlZC1yZWd1bGF0b3JzPyBBbnkgcmVhc29uIHdoeSB0aGV5IGFyZSBub3Qgc2V0LXVw
DQo+ID4gaGVyZT8NCj4gDQo+IFRCSCwgSSBkb24ndCBrbm93IHdoeS4gUGVyaGFwcywgdGhlIGRy
aXZlciBjYW5ub3QgcmVhZCBERFIwLCBMRE9bMS00XSANCj4gdmFsdWVzPw0KDQpJIGFsc28gdGhp
bmsgdGhhdCBhbGwgdm9sdGFnZXMgY2FuJ3QgYmUgcmVhZC4gSSB3YXMganVzdCB0aGlua2luZyB0
aGF0DQppdCBtaWdodCBtYWtlIHNlbnNlIHRvIGFsd2F5cyBjcmVhdGUgdGhlIGZpeGVkIHJlZ3Vs
YXRvcnMgZnJvbSBQTUlDDQpkcml2ZXIgLSBiZWNhdXNlIGlmIFBNSUMgaXMgdXNlZCAtIHRoZW4g
dGhlc2Ugdm9sdGFnZSByYWlscyBkbyBleGlzdC4NCihUaGlzIHdhcyBqdXN0IGEgcXVlc3Rpb24g
c28gdGhhdCBJIGNvdWxkIGxlYXJuIC0gbm90IHNvIG11Y2ggb2YgYQ0KcmV2aWV3IGNvbW1lbnQu
KQ0KDQpJZiB5b3UgcmUtc3BpbiB0aGUgc2VyaWVzIGZvciBvdGhlciBmaXh1cHMgLSB0aGVuIEkg
d291bGQgYXBwcmVjaWF0ZQ0Kc29tZSBjb21tZW50IGFib3V0IG9taXR0aW5nIHRoZSByZXN0IG9m
IHRoZSB2b2x0YWdlIG91dHB1dHMuDQoNCk90aGVyIHRoYW4gdGhhdCAtIGZvciB3aGF0IGl0IGlz
IHdvcnRoOg0KDQpSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5A
Zmkucm9obWV1cm9wZS5jb20+DQoNCg0KQmVzdCBSZWdhcmRzDQoJTWF0dGkNCg0KDQotLQ0KTWF0
dGkgVmFpdHRpbmVuLCBMaW51eCBkZXZpY2UgZHJpdmVycw0KUk9ITSBTZW1pY29uZHVjdG9ycywg
RmlubGFuZA0KU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0K
DQp+fn4gIkkgZG9uJ3QgdGhpbmsgc28sIiBzYWlkIFJlbmUgRGVzY2FydGVzLiBKdXN0IHRoZW4g
aGUgdmFuaXNoZWQgfn5+DQoNClNpbW9uIHNheXMgLSBpbiBMYXRpbiBwbGVhc2UuDQoibm9uIGNv
Z2l0byBtZSIgZGl4aXQgUmVuZSBEZXNjYXJ0ZSwgZGVpbmRlIGV2YW5lc2Nhdml0DQoNCihUaGFu
a3MgZm9yIHRoZSB0cmFuc2xhdGlvbiBTaW1vbikNCg0K
