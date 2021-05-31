Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DBC39566C
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 09:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhEaHo1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 03:44:27 -0400
Received: from mail-db8eur05on2061.outbound.protection.outlook.com ([40.107.20.61]:3041
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230385AbhEaHnq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 May 2021 03:43:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKGb4nUPlZMGzrksvupCxeRMpvaUZXAsY3WfctLfPbgGagZODaJRMgxrGkI3M6S+ZhLCpV3gBid5bfdh4YACcH8vdBp5KSh0zLXuliDx5wBAxdYfYfSNJwkS9ul4G20Qn9WgPkuxkf/vBxTZIfrK9moP53CjapCuiybmlSq4k/cCCbxfMmjl1iaU+vNMh3lzRuJFdGmVMklROXCgJS97U8zFkHKlkbWpJ8sm2i2huj+tszFTewECUGXb3Eq9/sOdDOA6/OunVrYwrmE5q4XCWCA+F4x376H2HR4b0bTAtEfkm7uHcUQhYgZQTiSp72lH9ec4pjAgXSxcR6nIt7YMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVeY2nDSuqhu+InTHAg4KyhjRFb93GZ4My4FLjCj8Xs=;
 b=VWkVS0r9NfjcQT4Vi/jwN/u6QqIzcYXTSuutet3lzBfHMN1g0wy47jnVzF9wQfvlbUCZUtSIySePZScg1hM6MsEsN+hL7tY+n+fQQ6SGTsE/klYU2qEc4rD3HhRBfvoUKQqWprdlAmy05x+jafTgBYKNO4e4vN57DUy81JNTeu6Lw1Aj6YlTHzzbqxns1B/NSBFrlqw//YgTPswPqIC36w1VbF1+mgHPaJsRRmsCp2CrUKUxcaM3+ehFKP82kbgnEIJ3SOoV5EnM6bmjoJLuYvVL0w/s0CHgiQDZqdSn8YeFTB3nXJw6jElJ0MyXOrqCaeCwxVbHPhZK5B/4S/ghQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVeY2nDSuqhu+InTHAg4KyhjRFb93GZ4My4FLjCj8Xs=;
 b=csCFVj9DgDpoOA8NWaIsBmwTtTPLOHf6b+0ifnin70znSy6DdFXvqnm8Md0Tk5rNWLSLWQoU5lOknlTkH9g29NzjXx8agsrziakEGPh0se/RWQzSRm+1qle22CrFaM10uUdcZrB0NuBAvdRkHkEmNyp6iEYOAc7u96TSEyJnGw4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2313.eurprd03.prod.outlook.com (2603:10a6:3:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22; Mon, 31 May 2021 07:42:03 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44%4]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 07:42:03 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "michael@walle.cc" <michael@walle.cc>
CC:     "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "jonas.gorski@gmail.com" <jonas.gorski@gmail.com>,
        "noltari@gmail.com" <noltari@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Topic: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Index: AQHXUfTMWdGKRh/nT0q8zsRZfWZU3Kr2XhQAgAG1tuWAAF74AIAAhauAgAAT4QCAABwagIAEFJEA
Date:   Mon, 31 May 2021 07:42:03 +0000
Message-ID: <dce05205de61abae035ddf3629584ce851ad56e3.camel@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
         <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
         <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
         <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
         <CAMpxmJVJAX8jPrYg3=jkG4JqEEnUfpexfn+cFKWJQYpdRJaRUA@mail.gmail.com>
         <93578f0271fba68429f911c74acc1b7bd5610644.camel@fi.rohmeurope.com>
         <ee700b25c170047045a65bed2236089d@walle.cc>
In-Reply-To: <ee700b25c170047045a65bed2236089d@walle.cc>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313bc472-3fb0-4c94-3a9e-08d924079536
x-ms-traffictypediagnostic: HE1PR0301MB2313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2313AF9F3A178224310CDB51AD3F9@HE1PR0301MB2313.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rhRozTwAjQHQGa+NXqr5kgnDlpB+Z2Sho7IjPvfcdAVD6XNS9lMxYXv1Zox3S3/a6ujFP6R3ubFBxGWqZieXxS/UHL/NVNGKUNlrgyTQutc01I3QXJjS1kIuqpMP8ZAuZsHjWZOL17VK6hDxcSLbZ2PFwslR2SxozmQC3m8oQGVTin3BY/P1R9YJUWwLD9EE3ywQEVs2NtG92b75j9CcNXm+0mZuA8Fhgn7rG3Mna/Lyc64je6m9C39ohPefY7hLuIGXXOh/UC2A0hy1nr3qpgDUaODSkCSL7n2bKKnp54fVp8r5EHBioCIZd81+nHibyTmVkgCmOfuczwCn2a0YBmKxGMUI+E8CxHvdBP+lmkWHNSDgkQ45ysWTofwi00XJTQ0NsdiVz/BUXR3QWy+aK5qHg8VpU2n7J9fPlW7Px/cjou2yCjPTu1ZieOaUMNh3opsGjaKmwDvEUmwc8OubT0FQWVXrUb69xZJSYFNp0Eqsi9L4xvdbn0s50i3CtgDr71tbv+Ig0Zd/5NzxtPJ53pPM2KMnyWVondu1tOE67duNK9XV3kPeZeBm5M+rNg2o8SriSoMM5eWaJehYZHm/8r9PMwtUBwz2PAYOg1EM9/M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(316002)(5660300002)(54906003)(2906002)(6512007)(4744005)(478600001)(2616005)(4326008)(122000001)(38100700002)(6506007)(8936002)(66446008)(64756008)(66476007)(71200400001)(3450700001)(8676002)(53546011)(86362001)(186003)(66556008)(66946007)(76116006)(26005)(7416002)(6486002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZWE0a2o1U2lrQ1ZLUFZxNzNCVmRVaHlveGpqRi84NDQ4ZHNxanV1bElOR2lJ?=
 =?utf-8?B?K1l2ZmZod3FkOExGRVM2aXZqcEJtTGdVcUZtZkxRSWxEQlBSRGN4VE50WWNI?=
 =?utf-8?B?RE5sZG9lR2UycDljSUZ1T1FBM3BhWXM4RXZ4cm5PT3lCOC9CWWhUQ1VTQnJ1?=
 =?utf-8?B?ZlhqbTBXMm1uV0x0YTVENTJKeUgyeDhBUTF2U3VzQW5tN2tqTmRyL2Yyalh5?=
 =?utf-8?B?RWJtbThNMzRURTJ1SnNzdEZQRUM2TU82OFBKdVYvVUJsenAwQlo2MXVwREt3?=
 =?utf-8?B?cWV6UVJzZFE1MHFxem1ScG9wVFp3YlpKeUVwZytuWis0THpUdlBOZ0I4UlZu?=
 =?utf-8?B?bU4wcUczY3JDRkU4UVQyYXM5UHBINnZjeURIMDhlbldVVnhpVzRSU0xhY3Rn?=
 =?utf-8?B?bFdFZEdKeFFjd2RvZWx2U3FOdlZQZVMwV1UyRU9LK2FLMmpZWnlvRFFzNWJR?=
 =?utf-8?B?Vy9KZ3p5NldmMFAwMXV4dm9xWVBjYzcwQUtYQS8wTEExUlBlQm85RWptWFJm?=
 =?utf-8?B?TjI2T2FDUlF6K0ZmUWh0c0VDbkJqb25UN2tGMFZwbmFkckxnMkR4d3dHQ255?=
 =?utf-8?B?bG82TzV1d3NwTnFkOTVsWTZNamtrRkxnTWE3M3VTdExndURUWXB5RnhRWDEr?=
 =?utf-8?B?dTVtTkcyN2kveWNBa3hlSFRHV0hJWTlTWXc1M0NzbUwzalBDbmNaM0RNMGlB?=
 =?utf-8?B?a3NsblRnV3BTMTlGbktHNFR2RTFKQTZXSk1JMEVwUFFmZ3NKVTd6bTNKQ3VY?=
 =?utf-8?B?dXo1azAzcXJZMkFLNGQ3T2EvcTJ5VVlGdm9qNW12ZkgybmZDNXZKRlFXemI5?=
 =?utf-8?B?QUxrQ2k2bWNkUzNKMGpkQlBLNTI4M2VvQWd6ZTVGVHBPREQ5VFo5RStLdC9K?=
 =?utf-8?B?THJnek9oTW1iWlY3T09taGVZQ2QzelZuZHIzZHFtOXFSaVhjM293ZUdSZkQ2?=
 =?utf-8?B?bEozcXgyYWN6a2hwb0NKVUFMS1JpMjJYNkw1NldqM29jK3A3c3JrR1FmcEkr?=
 =?utf-8?B?U1BSbHNWOVhlYk5xbjJiUVNVcmF0ZkprOFBmSzIwajF0eEtwSVl0S0x0Q1RW?=
 =?utf-8?B?L0h5V0pNd1ZZVzNhSHR0enVsRVdVeGVhcUNqdTREQ1dYNEJtZjY1dmhQTEd6?=
 =?utf-8?B?WVlFbnZNVUJKaDZRNVVhNnJFZUlnZmVnNm1JWFpUM3NYemNucldHM0JZQXdM?=
 =?utf-8?B?VVduZ05aaDIxT0ZKUkIwVVA2MFowV0FHZEJ3eTJrdzE2aUZjWDR5UlhZTkpr?=
 =?utf-8?B?NkZnNERacVZlWFVnS1gwOXRnazF2TCtNZmgwRzBLcXNib2h3NzBRM0Ezdllo?=
 =?utf-8?B?cnlNMmk3SC9SQkFjZFF5QU9OblpUaWFoeE0yUWU3YXhLNjgwUXBJOWt2MVJY?=
 =?utf-8?B?alNPV2NwOTJXUnRkbnRjZmVVS1MvUEZPcmU4UWxDNGg3b3lzRTNUbkFQWk5J?=
 =?utf-8?B?azBEdGpaUlQvdXZYS0NNaGZENUhGNWkvSjJwanY3M2swYVZxRGVsMUtvYkt6?=
 =?utf-8?B?NWM0S0Uvekg1dng4cGgzaTdLOVJaYmM0NGZuOC96RTFqaW80cjlKSjFSZXN4?=
 =?utf-8?B?OXZQUm9WK29DRXA5K3VXTXA4S1NBMThMbWg1YUpkazgwYTkwaHFyeE1ib05D?=
 =?utf-8?B?SmkrT09lVCtLRlBGYlJ0RU1XakljaEd2elVDN2FKMDB0ak9pMzBFQ0IwQ1J2?=
 =?utf-8?B?cnczM0NOZkRrYlBpbnpSazFad05RcS8rZnBNZGVNMVUyTm5LdkJuVGpHWkpM?=
 =?utf-8?B?a2h6Z3RJMzI0RHJrS0dacFFBRzgySTBZVmlRaWhBd0pHRzZmT1RVbVpZd3hi?=
 =?utf-8?B?V2RMRnZPbU9sb201SG45Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB888D5FB3C35A4BA521DE0165D882B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313bc472-3fb0-4c94-3a9e-08d924079536
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 07:42:03.4257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwECx2VaytgQ8+yuxtI9K9ih8Zf/P7nulbabGAa69RL7JpDRPw3VVUBTAGzCOJ5UMDMHW+/3y4kgNtEZbL2r4h7YomvsJrFCHr70CYiawcTCA/yAZd10dALlxp/zA/jm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2313
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjggYXQgMTk6MjMgKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6
DQo+IEhpIE1hdHRpLA0KPiANCj4gQW0gMjAyMS0wNS0yOCAxNzo0Miwgc2NocmllYiBWYWl0dGlu
ZW4sIE1hdHRpOg0KPiA+IEhpIEJhcnRvc3osDQo+ID4gDQo+ID4gT24gRnJpLCAyMDIxLTA1LTI4
IGF0IDE2OjMxICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gT24gRnJp
LCBNYXkgMjgsIDIwMjEgYXQgODozMyBBTSBWYWl0dGluZW4sIE1hdHRpDQo+ID4gPiA8TWF0dGku
VmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gSSB0YWtl
IGl0IHRoYXQgcGF0aCAyLzMgaXMgc3RpbGwgZ29vZCB0byBnbz8NCj4gPiANCj4gPiBJIGRvbid0
IHRoaW5rIGl0IGhhZCBleHBsaWNpdCBhY2sgZnJvbSBNaWNoYWVsIHlldCAtIGJ1dCBJIHRoaW5r
IGl0DQo+ID4gd2FzDQo+ID4gbm90IG9iamVjdGVkIGVpdGhlci4gSSBjYW4gcmVzcGluIGl0IGFs
b25lIGlmIG5lZWRlZCBidXQgd291bGQgaGVscA0KPiA+IG1lDQo+ID4gaWYgeW91IGp1c3QgcGlj
ayBpdCBmcm9tIHRoaXMgc2VyaWVzIChhc3N1bWluZyBpdCdzIE9rIGZvciBvdGhlcnMpLg0KPiAN
Cj4gSnVzdCBzZW50IG15IFItYi4NCj4gDQo+IEknZCBwaWNrIHRoZSByZW1vdmFsIG9mIHRoZSBn
cGlvX3JlZ21hcF9zZXRfZHJ2ZGF0YSgpLCB0b28uIElmIHlvdSdyZQ0KPiBmaW5lIHdpdGggaXQg
SSdkIHN1Ym1pdCBhIG5ldyBwYXRjaCB3aXRoIGp1c3QgdGhhdC4NCg0KUmlnaHQuIEJlc2lkZXMg
dGhlIDIvMyBtaWdodCByZXF1aXJlIHRoZSAxLzMgdG8gYXBwbHkgY2xlYW5seS4gSQ0Kc29tZWhv
dyB0aG91Z2h0IEkgc2VudCB0aGUgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgYXMgZmlyc3Qg
Y2hhbmdlDQppbiB0aGUgc2VyaWVzLg0KDQpGZWVsIGZyZWUgdG8gcmV3b3JrIHRoZSBwYXRjaGVz
IGFzIHRoZSBiZXN0IGZpdHMgeW91ciBwdXJwb3NlcyA6KQ0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0
aQ0KDQo=
