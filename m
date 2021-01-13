Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B744B2F4D0D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 15:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbhAMOY1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 09:24:27 -0500
Received: from mail-am6eur05on2087.outbound.protection.outlook.com ([40.107.22.87]:63072
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725772AbhAMOY1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Jan 2021 09:24:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBfoQRUlf4Y1fBrBlROwcZpQNTj+lrr4ixWgQ99RXhSphTOOv153PMRmuz5GKGc0oIYYYmTYWAbSGp5rU7NvHjwiMm9VOYIVh91BEn0vCnWKLG9mL85NrJKwjjtnUrpvMJrv6CEXJ2UvxZ6ndidrycaeP8fXbTTzubaBVmKQa/nT+TfepBbi9HxvoI8rAsF1FPKXcLzyUplsFBUB8E8Z6pmOYSdRu7hHVWhCKmDM1fBQkcg243e8G37p86fpYXoyBBNL/RCa9QqX4fGbQGQ25tW0iLNB3qVrv9rNs8f3L15UVgaVoKI/zr6bOD4pDaquXakokWLTM4bYHQHEGqvT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15gHnh1BZ14yn7SqFrX5b+9dFlBT4MjGDTJFovLoBwY=;
 b=NJOz0SK96B/DOjgW/jcOq8GyPo5Qh2CvnXSm7UIP2SUrxYjnX1GSEV2GgophW41764RparUyhBmCchZk/pwn2LvGPQ4DX4hyVDRRqpxX+PLPg0CA2Qt24Vo0Ob9/SBbYx2KLZJZ5ZvkfH1bzXogqJIsh5rSm2wqTRJFo3/yz4CIXkgARpRBsKpVmHhcf8qmDBCU2as3bNNsBx6rf/f56klzWUOSJot642yNMJDWMEoRL+Khto+pAGJYJf5Td4MiBOZqKWmpgbE82eZVyNjBLzj/kVeRi/3T0HNE+aGMLsrCa0yGfi/reRGLKR70KYVITQWoagUCroByRYrMprvMFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15gHnh1BZ14yn7SqFrX5b+9dFlBT4MjGDTJFovLoBwY=;
 b=um5cjwD23m69RszxeD4NTX7zdPvcTsFF6l9D7TMwxMcSZfolfzsxW5w+s5d6fS3kULtr7UllsF8bzF9D91fS7bIyaPvp5iw3ZRHWrrI7z8Cx2eIKVhpDLW0viICiCYSvmc83l8G0ITRj/wV82esTtn/mqXVWjV5EtbiKPzKcik4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3065.eurprd03.prod.outlook.com (2603:10a6:7:60::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.12; Wed, 13 Jan 2021 14:23:36 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 14:23:36 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Thread-Topic: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Thread-Index: AQHW5cNQA+oVZxxx30GEkoUe3SIhBaoizyiAgALMXYmAAAhQAA==
Date:   Wed, 13 Jan 2021 14:23:36 +0000
Message-ID: <55d19aaa27522c06c1a34f2a6422b82d069117c8.camel@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <20210111190953.GB2890911@robh.at.kernel.org>
         <c953405d630efba5377b89931ae4e0aa1abfa4dd.camel@fi.rohmeurope.com>
         <20210113135345.GA2332349@robh.at.kernel.org>
In-Reply-To: <20210113135345.GA2332349@robh.at.kernel.org>
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
x-ms-office365-filtering-correlation-id: e0a15e3b-7eac-40df-5822-08d8b7ced0be
x-ms-traffictypediagnostic: HE1PR03MB3065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB30659CB332746C5221354A37ADA90@HE1PR03MB3065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tuc8ScD1MfVxLt+ttFnd3umskYltqqlDCS0kBAxWjzblEcL6lt1XEKBud67DeXELShD99l2Nv/+oQCnJ33INxaP/m6FrhC3eBX9CKig+REL2URyD5gmnbiHsofIpkGy4ktBTZkaLel1m5hLG/LtNiI1ueLT6cLap6MPnoYxeft8jWfob8bzhnnWNCoreW5jnviFMMCNnv2/6GFbO1RvnbB0pakaDkcRDNYinLiBEa4NH+cMyArm/c0As+Oaz26PFL0FJIO+dV+VNvVaYhcGdAHwYu5k3Mi7fKpd9wF2lznQGjIetiR5SVomJu7VCgnqLsDVOYj/x8NKouOgj4D0sbwjdn3Ca1OhuxuMPhsVHGSV4VeCjUFSVt4cX1DQ/Abbnlmv5P0cuKCXLl8EBxPUSmpFEXmBufnkMuiAjlhNRExQ7iNy4KfyN31Z1pdamn09Hzn4XRWQF2BZzuD1mVZbzow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(66556008)(2616005)(66476007)(64756008)(76116006)(6486002)(66446008)(26005)(66946007)(54906003)(8676002)(316002)(6512007)(86362001)(5660300002)(186003)(478600001)(4326008)(2906002)(71200400001)(6916009)(8936002)(6506007)(3450700001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dXRhMU92enN3V01Ldy9FZHNwTGlBUkZVRFMxOFgzWDVTaU1GK1ExS3FqclFj?=
 =?utf-8?B?UFZQdXBqc1hBUHNqR0VDaVU0Z1owYTZZUXdkaWwrZ3FQd0I0Q0xlcDc2QjJW?=
 =?utf-8?B?Y1VUQU51Ymo3Qy9zWmFLRTFNMlgvT0l4WjRxdVZHRDd1NjA5NDRjdE03ZG15?=
 =?utf-8?B?Y1BONFpjS3ZpRVFXWlJXTnliS2ZPbEc4UHRIUHhncWE5c2VUUy9ZRU1oVzhC?=
 =?utf-8?B?eFU1SnVUUUw2MXNPSmcvbTErQ3NOUHp2YmNidldKS2lPY21TMW42OVVzSk1F?=
 =?utf-8?B?L2JiVGRZZEFHbnRBeDdRcGd1TXVtaVNpelhuc3M2WEVlYXdJQXl5Tm83eDQ0?=
 =?utf-8?B?UTNBR3pIaXUxa0UxeEVIdUN6dkJTQkUrSmw1UkNvVjVjNVJoQUNuSFJCbTBC?=
 =?utf-8?B?VUdBRzh3YkZ4OXMyMzVIUVBoczdWMks0d3B6L1FvM2dhQ1BWREdlNGplaXdu?=
 =?utf-8?B?NERlbmZmN2tFUlQ1NWlUV0NJcWQ0dzVLUVB0cVdubG1weUhOalJWVVF2UW9H?=
 =?utf-8?B?T2RoT1hCSkRMR2E2ZE9xeVNFVmdxcDloOEQ0d21sTVFtVnlXYTN4dHVsZlZE?=
 =?utf-8?B?dXZ5ZUQ5ZVVNU3RYN2cvOVg2VnZZR0EyOWc4MWg0RE8zUlB4QkRMSFZ4OEIx?=
 =?utf-8?B?SE1yQ0greW9wN2lLZXNMWmVCT2xJRU1ZMEpwVGg3a3NUVGYzT0ZHaUlwcENB?=
 =?utf-8?B?KzZtWnloTFZzM2VXQyt5bWxQVjdncjZNdHlZM0NNYnRXeEVlTWQ3QnU3MnRn?=
 =?utf-8?B?TVEyKzZ4QitpRXBkdko3VVY2SEZhUEo5UHo3T1B1NFBYMWdlZC9NNldnVlhE?=
 =?utf-8?B?d21Yd1BENm1rZk1kRUdRK2dUVEZPV0hvOWNYb2ZtTjVES1F6QlMwMUppTGsz?=
 =?utf-8?B?c2N3ZmdZU2NrN0hIYzd1a3pvekVpWDl2M0VZT0lIQU9qbnY4SnpzWk9mZ0da?=
 =?utf-8?B?YWZvZkwxd2FJWjNwRnk1cHNWdTgzdU1YclVXcGFrU2E1STJKTSt4V2p0dG9T?=
 =?utf-8?B?UFljdWxmNWhmNVVkTG1iVERzci9VbE9KRnNCZHFRSFM1OXd0YjQrVUxHV1A3?=
 =?utf-8?B?R1pJbURvd25yd2h0bWxkY0g1ZXA1ZFhqbUY3U3JPcHZMK3VRQld5c3VIUmFF?=
 =?utf-8?B?eGVlVTBERTlwN0htRXQwejRKLzRNSW9TajdDL0RPR2Z5VVllalc5cWVpd3Rj?=
 =?utf-8?B?TEdXOStqUWUyM1JYeTNybU5kUzVLZkFUMnRQQXFwSUw1VnFpZk9wbHVXelZD?=
 =?utf-8?B?NzJuaVRIUlo0bzJReUoyN1VpQWd1aWN0TlpNR3AzVytYZUhhdHNNZUtaaFMv?=
 =?utf-8?Q?GH58N6Ohfy47QCe7DcRoLKKldm9EOhN5fO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <815AF16B3A448E4BBC6690864C6A4019@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a15e3b-7eac-40df-5822-08d8b7ced0be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 14:23:36.5486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQAXTgN0LdFVeweopWE10ViBddwxwWQomPBW7doLHex+667SWu+Nk/Ry8Fi8thSrJnsmkFx3JqhAnoqJcidKJqqGnaaWhzwORznjZYrl7YK2zJ2EQ7zd3keX5N0da5Hh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3065
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjEtMDEtMTMgYXQgMDc6NTMgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAxMiwgMjAyMSBhdCAwODoxMDoxNEFNICswMjAwLCBNYXR0aSBWYWl0dGlu
ZW4gd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIxLTAxLTExIGF0IDEzOjA5IC0wNjAwLCBSb2IgSGVy
cmluZyB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSmFuIDA4LCAyMDIxIGF0IDAzOjM2OjM4UE0gKzAy
MDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+ID4gQWRkIGJpbmRpbmcgZG9jdW1lbnRh
dGlvbiBmb3IgcmVndWxhdG9ycyBvbiBST0hNIEJENzE4MTUgUE1JQy4NCj4gPiA+ID4gNSBidWNr
cywgNyBMRE9zIGFuZCBhIGJvb3N0IGZvciBMRUQuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0KPiA+ID4gPiBtYXR0aS52YWl0dGluZW5AZmkucm9o
bWV1cm9wZS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL3JlZ3VsYXRvci9yb2htLGJk
NzE4MTUtcmVndWxhdG9yLnlhbWwgICAgIHwgMTA0DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlZ3VsYXRvci9yb2htLGJkNzE4MTUtDQo+ID4gPiA+IHJlZ3VsYXRvci55YW1sDQo+ID4g
PiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9yb2htLGJkNzE4MTUtDQo+ID4gPiA+IHJlZ3VsYXRvci55
YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRv
ci9yb2htLGJkNzE4MTUtDQo+ID4gPiA+IHJlZ3VsYXRvci55YW1sDQo+ID4gPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMmFhMjE2MDM2OThjDQo+
ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9yb2htLGJkNzE4MTUtDQo+ID4gPiA+IHJlZ3VsYXRvci55
YW1sDQo+ID4gPiA+IEBAIC0wLDAgKzEsMTA0IEBADQo+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlDQo+ID4gPiA+ICslWUFNTCAx
LjINCj4gPiA+ID4gKy0tLQ0KPiA+ID4gPiArJGlkOiANCj4gPiA+ID4gaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvcmVndWxhdG9yL3JvaG0sYmQ3MTgxNS1yZWd1bGF0b3IueWFtbCMNCj4g
PiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KPiA+ID4gPiArDQo+ID4gPiA+ICt0aXRsZTogUk9ITSBCRDcxODE1IFBvd2VyIE1hbmFn
ZW1lbnQgSW50ZWdyYXRlZCBDaXJjdWl0DQo+ID4gPiA+IHJlZ3VsYXRvcnMNCj4gPiA+ID4gKw0K
PiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gTWF0dGkgVmFpdHRpbmVuIDxtYXR0
aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Rlc2Ny
aXB0aW9uOiB8DQo+ID4gPiA+ICsgIFRoaXMgbW9kdWxlIGlzIHBhcnQgb2YgdGhlIFJPSE0gQkQ3
MTgyMTUgTUZEIGRldmljZS4gRm9yDQo+ID4gPiA+IG1vcmUNCj4gPiA+ID4gZGV0YWlscw0KPiA+
ID4gPiArICBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yb2htLGJk
NzE4MTUtDQo+ID4gPiA+IHBtaWMueWFtbC4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICBUaGUgcmVn
dWxhdG9yIGNvbnRyb2xsZXIgaXMgcmVwcmVzZW50ZWQgYXMgYSBzdWItbm9kZSBvZiB0aGUNCj4g
PiA+ID4gUE1JQyBub2RlDQo+ID4gPiA+ICsgIG9uIHRoZSBkZXZpY2UgdHJlZS4NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICBUaGUgdmFsaWQgbmFtZXMgZm9yIEJENzE4MTUgcmVndWxhdG9yIG5vZGVz
IGFyZQ0KPiA+ID4gPiArICBidWNrMSwgYnVjazIsIGJ1Y2szLCBidWNrNCwgYnVjazUsDQo+ID4g
PiA+ICsgIGxkbzEsIGxkbzIsIGxkbzMsIGxkbzQsIGxkbzUsDQo+ID4gPiA+ICsgIGxkb2R2cmVm
LCBsZG9scHNyLCB3bGVkDQo+ID4gPiANCj4gPiA+IE5vIHNjaGVtYSBmb3IgdGhlIGxhc3QgMz8N
Cj4gPiANCj4gPiBUaGFua3MgUm9iLiBJJ20gdW5zdXJlIHdoYXQgSSBoYXZlIGJlZW4gdGhpbmtp
bmcgb2YgOiggSSdsbCBmaXgNCj4gPiB0aGlzDQo+ID4gZm9yIG5leHQgdmVyc2lvbi4NCj4gPiAN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gPiA+ICsgICJeKGxk
b3xidWNrKVsxLTVdJCI6DQo+ID4gPiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsgICAg
ZGVzY3JpcHRpb246DQo+ID4gPiA+ICsgICAgICBQcm9wZXJ0aWVzIGZvciBzaW5nbGUgTERPL0JV
Q0sgcmVndWxhdG9yLg0KPiA+ID4gPiArICAgICRyZWY6IHJlZ3VsYXRvci55YW1sIw0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgIHJlZ3VsYXRvci1u
YW1lOg0KPiA+ID4gPiArICAgICAgICBwYXR0ZXJuOiAiXihsZG98YnVjaylbMS01XSQiDQo+ID4g
PiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAgICAgIHNob3VsZCBiZSAi
bGRvMSIsIC4uLiwgImxkbzUiIGFuZCAiYnVjazEiLCAuLi4sDQo+ID4gPiA+ICJidWNrNSINCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgICAgcm9obSx2c2VsLWdwaW9zOg0KPiA+ID4gPiArICAgICAg
ICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgICAgICBHUElPIHVzZWQgdG8gY29udHJvbCBs
ZG80IHN0YXRlICh3aGVuIGxkbzQgaXMNCj4gPiA+ID4gY29udHJvbGxlZA0KPiA+ID4gPiBieSBH
UElPKS4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgcm9obSxkdnMtcnVuLXZvbHRhZ2U6DQo+
ID4gPiANCj4gPiA+IFRoZXNlIHNob3VsZCBoYXZlIGEgdW5pdCBzdWZmaXguDQo+ID4gDQo+ID4g
SSBrbm93IGJ1dCB0aGVzZSBhcmUgZXhpc3RpbmcgcHJvcGVydGllcy4gSSdkIGxpa2UgdG8gcmUt
dXNlIHRoZW0NCj4gPiBhcw0KPiA+IHRoZXkgaGF2ZSBleHBvcnRlZCBwYXJzZXIgaGVscGVycyAt
IGFuZCBJIGFtIHVuc3VyZSB3aGF0IGtpbmQgb2YNCj4gPiBicmVha2FnZXMgY2hhbmdpbmcgdGhl
bSB3b3VsZCBjYXVzZS4gKFRoZSBCRDcxODM3L0JENzE4NDcgd2hpY2gNCj4gPiBpbnRyb2R1Y2Vk
IHRoZXNlIHByb3BlcnRpZXMgYXJlIG9uZSBvZiB0aGUgUE1JQ3Mgd2hpY2ggYXJlIHByZXR0eQ0K
PiA+IHdpZGVseSB1c2VkLikNCj4gDQo+IE9rYXkuIEhvcGVmdWxseSBJIHJlbWVtYmVyIG5leHQg
dGltZSBJIHNlZSB0aGlzLi4uDQoNCkFjdHVhbGx5LCBJIHRoaW5rIEkgY2FuIGFkZCBzdXBwb3J0
IGZvciByb2htLGR2cy1ydW4tbWljcm92b2x0IGFuZA0KZmVsbG93cyB0byB0aGVzZSBzYW1lIGhl
bHBlcnMgc28gbmV3IGRldmljZXMgY2FuIHVzZSBhcHByb3ByaWF0ZWx5DQpuYW1lZCBwcm9wZXJ0
aWVzLiBUaGF0IHdvdWxkIG1lYW4gdGhlcmUgaXMgZHVwbGljYXRlIHByb3BlcnRpZXMgZm9yDQpz
YW1lIHB1cnBvc2UgLSBidXQgbWF5YmUgaXQgYWxsb3dzIHVzIHRvIGV2ZW50dWFsbHkgZGVwcmVj
YXRlIHRoZSBvbGQNCm9uZXMuLi4gV2hpY2ggb2YgdGhlc2Ugb3B0aW9ucyB3b3VsZCB5b3UgcHJl
ZmVyPw0KDQo+IA0KPiBSb2INCg0K
