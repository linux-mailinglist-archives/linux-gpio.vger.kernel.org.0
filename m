Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE07314FD3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhBINLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:11:07 -0500
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:20491
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230288AbhBINLA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 08:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+1HH+yL7rrFs1Gu9ZWzzl56qheab9YEn+cjky3MKXvUlw2Abqt0ktJlu0vko3wvVVMtfb4NLFXotFJ/5CqmZHd2w3Geg4GNuxYlMUKvHYFSSSwobEDbg7F53nLEfOUCSfjS4M0J57MOlNA0THioIZYM7jaE3Q3aeBV1GVDDyRFrqYOqx0bB2qjootZe2JfNvFlD2LiIBU3SaAzkojgiv+ZnslEhouFsAgWM6O5o1GrU5YwVGMMi1fWIBOCHXdn8YPmDN95lE/m+JoD+Z9/hzZ3nVb+Ab71dH+cvD9CXulUW6n2mN/lQEdgldm6mQJhgPUVHGy7usTs20aAez9IEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyS/GpGrDokUteb7qG46CLvf55LgFg5YVbWziIIPFPc=;
 b=iFKpA4zxxCLDBpDa3FqtEe9S+vxByJT+83mAA+h5RjfU0iCVSfBv4fiMNTlQL1CSA+//UZhYy4Y7voEgXOfBlwJaVUxmrmk9bTag8h2xvnwEsPgim25wlIPXJG9SuJwcFs7AQ/ou3j2oE4NvA4qQb6FlKWFxp62RD25QaxqZNE98huqb4Ap6OdUONKdjElto94fAyFBHbAu1/x4Nwa3s7as/gszp3sJIGjYGI6seWYVASYrcyW/fneQIyg6q1qJq7Ad0ADhhNHWdGE5mxpnm54tku1/7gmnNdzVOnLuGZkdcga1dUM8ysPMOitVle887sfBiLhQnRTxVhlrlfUGDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyS/GpGrDokUteb7qG46CLvf55LgFg5YVbWziIIPFPc=;
 b=A+moV+iDYoh5NH7Ubp60FrkziOe++f/r5dzQhFgfah0/HsHDAYVxYBWJcnGny0uq/zOfURTFD0gv5jVPXLSO4GEPwWyYtx+LHLzh37NBhx81tq1nGfwdXh6VU7akwS8dVNdZsdZ1MA0ZyVZo5DwyAe/0GEyr/xfpyTWCyN4KUwk=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3068.eurprd03.prod.outlook.com (2603:10a6:7:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Tue, 9 Feb 2021 13:10:04 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 13:10:04 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 06/17] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Thread-Topic: [PATCH v2 06/17] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Thread-Index: AQHW7jMhsE1r/M8dc0G9kkX6Nl3qp6pPORUAgAC0RoA=
Date:   Tue, 9 Feb 2021 13:10:04 +0000
Message-ID: <0534345fdba452baefed4ad740a51d394b2ac423.camel@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <950a87e680822ab6457ff95bba96730fed93e14d.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <20210209022450.GA2546257@robh.at.kernel.org>
In-Reply-To: <20210209022450.GA2546257@robh.at.kernel.org>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9048d7ee-c5e1-4eb3-7be0-08d8ccfc0427
x-ms-traffictypediagnostic: HE1PR03MB3068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB3068D0FA21CB8054559B49E1AD8E9@HE1PR03MB3068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YDpPPWRZ2YixK07MVm5QHmZnCacmHDfah2wSEBraRBLWjAJqwW6g6jSOWpJKapk73pPBXh2vB2OaAentb4gSCbg+U8qUGA7Y1Y4Xkb7w7H4AOjFBbhpzu75MuEwEUqlSbXlr/71Jhb7kk0KPyB/czDe9atLoeOB40pgHhHh9wUELI1jcye4y55E5FMHRmS7QITFzJ21+PwRHcIicuXyyAemeoIz2qypwPU+zvxSuHNHZLsCZCjeYz+crl9XH96cRpCUrdQW4UJLfibhsuV8JOPRZs9oqzkFPWi/W8QYzFcH215QgbEpaSxGJgz4luoohD2haFkcsQoyvtsRZVeGuQESS4zMAhEXbFuQPZ+SPrG8/UIUmyxWvv8ofShDY+RFsgJPjr/Wo16hjB/iHu+qg+jVTuSSRG4KBU38ReO0Ps54TTOzw6WnQKXCzwhiexL3NhT75TrBZyeJi/W+xLifwWSfh56y2lKCan913PNIM3KsxJlPjDo6+S4SzjsPAWm95GsmCUMAw1X4ePW3uAjs0TQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(8936002)(186003)(26005)(6916009)(2616005)(6506007)(7416002)(86362001)(54906003)(3450700001)(66476007)(66556008)(66946007)(76116006)(64756008)(316002)(478600001)(66446008)(4326008)(83380400001)(5660300002)(6486002)(6512007)(8676002)(2906002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TlBZNDQzbnByUWJZY1JRbDNWVmhFVHgrWEsyc3pDb0NBRzQydmREZmtQamU4?=
 =?utf-8?B?R1NLRStrOHBVeldiai8xSTFpRUlydlNxS3I3YVl1Z3FjRStOejFVZXFZNDgw?=
 =?utf-8?B?MlNuMmgwaWhONzEzQzQ3aC9ORllYUmFGZkdJNmszMWdtNUhVcTVkWWRFbTEw?=
 =?utf-8?B?dDFBS3U3cGhDS1IwWUo0WmJhQ3MxUUgvdmFaemRnWnU2WXhGQXBzR0dKdDRz?=
 =?utf-8?B?bHRBNjdITEtPeDdUWjV0RGd3UkVrN3huZ3VibmlTY0k0aVphYktrOG4rbUFz?=
 =?utf-8?B?ZTgvU29BUEQ5Z29YZTlkZXQ2dUZZczFsSERnVlNzUFRNVmFQS2JLOEh6VWMx?=
 =?utf-8?B?RFZCemZRZjM5R0diQThtakZjcHMvc2pEb3g3clczY3B1Uk5MVkdPYlkzWTZq?=
 =?utf-8?B?MzFneEhIcFBncVY1N2Q0WW1kM3N3ZXdMQzNLV2JoZnVLRDRqbG0wa01Cdmdm?=
 =?utf-8?B?d1F5VTlDckJGZUtXenJYY085QWFkam82L1pVTGdjSlErbTB3S3NndmsrMWxy?=
 =?utf-8?B?bHorVEVMd0RMQVhFSFM5OEdoUVYveEJud2JaYzEraUFJSktBMzREVEtxQkZI?=
 =?utf-8?B?RVRaN0ZzdTd6ZU5KdjViTktnV2N2VVBPL0tSZEs2bDloVWxMMS95Vi9EYjRu?=
 =?utf-8?B?RURwSEdOUmxXZWwvMVVHMWR0UzYzdjB0dGMxTitnLytBUHR6ckVoNzAwYytK?=
 =?utf-8?B?eFNiaGZBNzI3SHhkOXFkRzVYU1A5cnpYUzVOWHQwbTljcmVGMFVuYy9za0pl?=
 =?utf-8?B?c1dCVkw3Wk5DaFFMdk5INFRoTUdJV0ZkUzg4T2xXNVErMmt3RHhsUHhYM2c0?=
 =?utf-8?B?U21lSTMreUM0TUhpa2dGaVQ4R2t2L3dkUWRNTURSTmhMNHpHWDgzWlA0N05C?=
 =?utf-8?B?V3dlM3RtQnZHdWp1bGhjdTIvbEoyeE5MTGxSSWNKaFJha3FaYkd0UGwvWEl4?=
 =?utf-8?B?N3lsc0p3c2JnNEFtTVJJZkRIaUFXOFlPNXJRcEJIakdiRHlKMVlkTmtBT1cv?=
 =?utf-8?B?K2J6dDVSbFJRZ240R2pkb1lXSUZJS0pJeTYyeFpnN1NzaERuVUd6UElkTTBL?=
 =?utf-8?B?WUZJYkM3NXovS3FoRUZpbDFtR1NkSjlydlhaUnM3NCtIRnIxTkoyc1NpRGVB?=
 =?utf-8?B?ZEx4UTZUOUFSY2h1S2tiZE0wTXZPTjR2SVJzTytoajhOVlVBQlVUOFg5QktD?=
 =?utf-8?B?aFhqZVQxcitDaTNHbHVwdFR5MVcxR3BSdWlwdUpHbk9SNlVXUTcrdEpUaFdy?=
 =?utf-8?B?MFZHK1dqSkNySjR4dk9KNENXdTdaSmFIdCs1YUNKN29VeGRxekQwNE1KL3Ry?=
 =?utf-8?B?LzVPTU9nT1ZwQVVWQUZhSzV6RFNlZmVNMXkrbUg5UzNBb0FUOHRLbWZjQitl?=
 =?utf-8?B?cGxNdlYvV2lBczBnWVRHNGU1TGxlTG42S00xTGFxcStUVCsxQzZIUUNyK2JH?=
 =?utf-8?B?dk13cEthY08wR1BUdEMybi9JYXRadDBSZDBTaUE2Z0szWEFxbUlGS2ovWC83?=
 =?utf-8?B?UU9RcWZjTG1KVmd2aXZ4MjZ2OUY4Yk9PNkwyR3VHa05PWnUzTUNES0QvTmgx?=
 =?utf-8?B?bzgzejRtU1h2UWpnV1pLb0RBbTFEMUIrQjkrd252TVdrSlVTMVFIM3NieXJn?=
 =?utf-8?B?eDBuUWN5NTJFZFNOVldYdENXUzFNNGxZbUdRb05qelg1SHdSa3lHUnNwOE9q?=
 =?utf-8?B?M2JRSDk0LzJKRmJjK09EZGdqd3lQRjczeCtUTlN1dWtPbHRqdWNudGwxU1M3?=
 =?utf-8?Q?rcdu/zoAYd7hORx3yZNcZcEz+hyXUEL2exUA/dj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59CE0D73147729449FB44F472232E452@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9048d7ee-c5e1-4eb3-7be0-08d8ccfc0427
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 13:10:04.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoDNlREz9TBmaSfjjd8jzCNrAjB1cYYOEarjsyCmT0q33VVulQkY+Da2XGpW+RH4R82ddnL2Vc0EU4A3r+WDEbd2zaTpK/qxl3n0OBe9HjNY6DcrJK8pPYcpzoICkk95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3068
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWdhaW4gUm9iLA0KDQpBbmQgdGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIGJpbmRpbmdz
IQ0KDQpPbiBNb24sIDIwMjEtMDItMDggYXQgMjA6MjQgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3Rl
Og0KPiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCAwOToxNzowOUFNICswMjAwLCBNYXR0aSBWYWl0
dGluZW4gd3JvdGU6DQo+ID4gQWRkIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgcmVndWxhdG9y
cyBvbiBST0hNIEJENzE4MTUgUE1JQy4NCj4gPiA1IGJ1Y2tzLCA3IExET3MgYW5kIGEgYm9vc3Qg
Zm9yIExFRC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCg0Kc25pcA0KDQo+ID4gKw0K
PiA+ICsgICAgICByb2htLGR2cy1ydW4tdm9sdGFnZToNCj4gDQo+IFVzZSBzdGFuZGFyZCB1bml0
IHN1ZmZpeC4NCj4gDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBQ
TUlDICJSVU4iIHN0YXRlIHZvbHRhZ2UgaW4gdVYgd2hlbiBQTUlDIEhXIHN0YXRlcyBhcmUNCj4g
PiB1c2VkLiBTZWUNCj4gPiArICAgICAgICAgIGNvbW1lbnRzIGJlbG93IGZvciBidWNrcy9MRE9z
IHdoaWNoIHN1cHBvcnQgdGhpcy4gMA0KPiA+IG1lYW5zDQo+ID4gKyAgICAgICAgICByZWd1bGF0
b3Igc2hvdWxkIGJlIGRpc2FibGVkIGF0IFJVTiBzdGF0ZS4NCj4gPiArICAgICAgICAkcmVmOiAi
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIg0KPiANCj4gQW5kIHRoZW4g
ZHJvcCB0aGlzLg0KDQpRdW90ZSBmcm9tIHYxIHJldmlldzoNCg0KPiA+ID4gPiA+ID4gKyAgICAg
IHJvaG0sZHZzLXJ1bi12b2x0YWdlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlc2Ugc2hvdWxk
IGhhdmUgYSB1bml0IHN1ZmZpeC4NCj4gPiA+ID4NCj4gPiA+ID4gSSBrbm93IGJ1dCB0aGVzZSBh
cmUgZXhpc3RpbmcgcHJvcGVydGllcy4gSSdkIGxpa2UgdG8gcmUtdXNlDQp0aGVtDQo+ID4gPiA+
IGFzDQo+ID4gPiA+IHRoZXkgaGF2ZSBleHBvcnRlZCBwYXJzZXIgaGVscGVycyAtIGFuZCBJIGFt
IHVuc3VyZSB3aGF0IGtpbmQNCm9mDQo+ID4gPiA+IGJyZWFrYWdlcyBjaGFuZ2luZyB0aGVtIHdv
dWxkIGNhdXNlLiAoVGhlIEJENzE4MzcvQkQ3MTg0NyB3aGljaA0KPiA+ID4gPiBpbnRyb2R1Y2Vk
IHRoZXNlIHByb3BlcnRpZXMgYXJlIG9uZSBvZiB0aGUgUE1JQ3Mgd2hpY2ggYXJlDQpwcmV0dHkN
Cj4gPiA+ID4gd2lkZWx5IHVzZWQuKQ0KPiA+ID4NCj4gPiA+IE9rYXkuIEhvcGVmdWxseSBJIHJl
bWVtYmVyIG5leHQgdGltZSBJIHNlZSB0aGlzLi4uDQo+ID4NCj4gPiBBY3R1YWxseSwgSSB0aGlu
ayBJIGNhbiBhZGQgc3VwcG9ydCBmb3Igcm9obSxkdnMtcnVuLW1pY3Jvdm9sdCBhbmQNCj4gPiBm
ZWxsb3dzIHRvIHRoZXNlIHNhbWUgaGVscGVycyBzbyBuZXcgZGV2aWNlcyBjYW4gdXNlIGFwcHJv
cHJpYXRlbHkNCj4gPiBuYW1lZCBwcm9wZXJ0aWVzLiBUaGF0IHdvdWxkIG1lYW4gdGhlcmUgaXMg
ZHVwbGljYXRlIHByb3BlcnRpZXMgZm9yDQo+ID4gc2FtZSBwdXJwb3NlIC0gYnV0IG1heWJlIGl0
IGFsbG93cyB1cyB0byBldmVudHVhbGx5IGRlcHJlY2F0ZSB0aGUNCm9sZA0KPiA+IG9uZXMuLi4g
V2hpY2ggb2YgdGhlc2Ugb3B0aW9ucyB3b3VsZCB5b3UgcHJlZmVyPw0KPg0KPiBKdXN0IGtlZXAg
dGhlIGV4aXN0aW5nIG9uZXMuDQoNClNlZW0geW91IHByZWRpY3RlZCB0aGlzIFhEIElmIHlvdSBz
dGlsbCB0aGluayBpdCdzIE9rIHRvIGtlZXAgdGhlDQpleGlzdGluZyBvbmVzLCB0aGVuIEknbGwg
dGFrZSB0aGlzIGFuIGFjaywgT2s/DQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
DQo=
