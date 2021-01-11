Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30A22F0CC6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 07:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbhAKGQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 01:16:50 -0500
Received: from mail-eopbgr40064.outbound.protection.outlook.com ([40.107.4.64]:41793
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725536AbhAKGQu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 01:16:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMyNZ3AwtJHk1limCJsGrl4xoXZUHSx4POQQzRKS2jMWkO12ueYPjaILWl0KruXjQvOWrsnO/+JT6g8LMKNow5zmnR3z3EvXfNzu2r0y366RzlUXme8qnWFzuaFLdbuT4WT64XCwOeupqPjY+xAuI80+4mHgGZK/CL5orgra/h/hu618IyBk9Z+hG+BO6YnxyNXSLaVrIgheE9eyQ4AkumyV1u8pHlknyme2PGw1oT6PkqH5/C6ViESDfN97R+qr2lc/VQP35eUGf2TZTuDlw2ihQ4LvOybAqoDxaDmm50zUOrRFLfn5IOOPu5KDueKMNUiJfsIcxE2eadaxobSWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H3OUiYcLl8jriCATjA/w8IIJfUWiqr4dRJYesvLGfI=;
 b=TY4u3qrhmBUXXxIAuFXy1aCUna4nxwCqacw2cbpfIQDPkAA6qx58hK3riMph4e/3JOVjnzsy8ajdRjbFBbO/YjJfNhkIDsZCSTjJD6Chn1gCjOghKe0ivkOMlUG8RdDHiIcf1846x/2a6QtsLyRgwhHgiGVtSDZsBKbJKeYDvTmpDzPBacWvvcExs8RDFUIQIotoRzbr4O2/c1sRxjYzVF8+y+7vc7HpjFKD3FwbXnnkcaUx0YmfQM5MCFEZgrTWkCrYiUCn9XAcWcEHPmKz5Z4xl/MJ7idhOwIxYK/9Br+IvkcgyH0qqopJ+Hkih75Lf3JbJAf7XFLphFf35sZKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H3OUiYcLl8jriCATjA/w8IIJfUWiqr4dRJYesvLGfI=;
 b=I64j2tQgGbJeokfeFBR+e5kb6S4W9zkm++omiBwvs/FwWeBQ9sT476vVOed0Gzo5T/ZJVCWcEhf/wptjv+WljvfLzDfgMUqJ+6QK9Y1zADvRO8lWLqIpWyWaksHJvz6VnCjQIBteB/oNRbVE2A5dBtWIVUEO04iiSLhDCpct3WM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2892.eurprd03.prod.outlook.com (2603:10a6:7:60::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.9; Mon, 11 Jan 2021 06:15:57 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:15:57 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH 09/15] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH 09/15] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHW5cO9yEI6D70rRkiVC0B0L8VULqoedgUAgAOA2wA=
Date:   Mon, 11 Jan 2021 06:15:57 +0000
Message-ID: <c098c546f3051c52fa6d55b42fe3e22423520597.camel@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <e7c5919cc0d95aca09807a828fe3c0018af8828b.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdb4CW0D86dmEOjtuFpTcO2oUZC50MhNQQtfoEQT7G_PFQ@mail.gmail.com>
In-Reply-To: <CACRpkdb4CW0D86dmEOjtuFpTcO2oUZC50MhNQQtfoEQT7G_PFQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: d4e90e24-939b-49b7-5bd4-08d8b5f85c0e
x-ms-traffictypediagnostic: HE1PR03MB2892:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB289200CFE73AF2AA64040FA7ADAB0@HE1PR03MB2892.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1Qx/sEYaHJugHcib1U6JyuJj4FwJTmVFuqOVbZWVCHo5pfZq7uRKzuXw2HfAE8C4O/QhV6ayUXw7h5Y1fEn7sicOD9IPyl2sux77yPqtv86DPqgrjm7cF5J5APWCJs9DHzpYtgksw6NQd1+yfYT/zZt99VP0nDNXzf0Ng4gNeRapV6oZdLLZsDKXd7Vul2bP2osrVyS/V23Ggl7+linlmnPl51OThyRlhGiiHKgOJR4cFABqupGbSpHTmESQl+9tv0A+HR8BRYgbKWQMbpdx/yQNaLBbxKZPz1Ai/zkQpiXZ0x5qg6zvWSHUwfL9OEZqZmQpwzczDx2BJ7R1XS8pSOLzRVt0Wawl04OCj9SVPPnjIs+FbTORx3gThEi+eW9+PJMg+zcQ0g0eIhnvJt/og==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39830400003)(396003)(66946007)(66556008)(54906003)(64756008)(316002)(2906002)(76116006)(3450700001)(186003)(6512007)(66446008)(478600001)(6486002)(6506007)(2616005)(53546011)(86362001)(66476007)(26005)(83380400001)(5660300002)(6916009)(4326008)(71200400001)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TUZXUlk5Wk5rWE8rMWc2OFBGV3JGNkdZVUNxeXk3T1NzY1YySXRaSnp2bjB1?=
 =?utf-8?B?eE1OdkVud09FdVp2d0ZXeHRXTHJTNDdUaFV3bXhNYWtHTVB5U1dqeHVCZlRk?=
 =?utf-8?B?MVV0MHMzQXRiRTN3NitCdlYyTE1qMVR4c3FtRFJCaTU1K2Y3S3pLOHpqZWdk?=
 =?utf-8?B?VTJEbzJJb1h5bm5LeTg1VFowQWhqSlhpRXR4OHAwWXRLcy9yMjhXSlJmZEVZ?=
 =?utf-8?B?UjV6ZTFyWUtJQzRPd2xmSzkzcWt6TnZtWDd5bzduNTIvNjVJdmozV0tjUTJw?=
 =?utf-8?B?clJhMHhDTzVJZ3VrcHVRenNOMFZveXJkSEVIR0ZPUTVwYTRSb0h2ODB3MzJP?=
 =?utf-8?B?bXYxbVZ0TzRQbmVlcSsxM3lBYWdQYlpwY3BWZkc3Q1YxdHFweHdXcjk3RG1C?=
 =?utf-8?B?M2V1VU5wMkF5cVVsYWQxbFJncWhtQmcrTlBtS2lxS3ZadnpJbHhxbTNhcmcy?=
 =?utf-8?B?dm9rZUIyK3ZsVFFQVVB4UmdZLzhERGhTVnJwYzU2M1J6Q29RTkxEWnpSSVU5?=
 =?utf-8?B?MkloL1BOQWZacFdZNThLUysza21qNk12bWlRNThPK3VuQ2s5YmlpN25kazZi?=
 =?utf-8?B?RjE0c0VlOFg3VEtneXMzWk5jVVludFVhZjNySG8wZGVPbWU1cVN1Um1vSkNO?=
 =?utf-8?B?WE9HTzFOcXRnNkYzemZ1bWl4WXQ5cGpkRXBEKytUQktGczJybXBqWWFnanow?=
 =?utf-8?B?V2E3V1pTTjJqSmRvaUpFZWgvRm1GUUhYRlZOUWtYL1gxaHBLbW9JYjltTmpx?=
 =?utf-8?B?K09yYW1HWGNMc3NsV0l3Z1F2L1RhZFJ6WnhVS2VoSElYekd2WkNTeW5OdnZq?=
 =?utf-8?B?dDBndTllNWZ1YWtlU1JyMDJyUklsQTRlUk9XcGpBYnZiakN2UlNtNkxRMFdz?=
 =?utf-8?B?elNxZy9ULzNMcTEwRExuaksrY2RCMllQK3hTU1M1SlJQQWtna1RZcFpMOXRn?=
 =?utf-8?B?bFA4Mmpta2luQm5nckdMU1pJaHVGQ21yc052RWJiTjFlMU5aVlcveTVQYmZn?=
 =?utf-8?B?cXkrOG1jdEdnekpUZ2FIYW1vWHRFM1BXSGJGVFAvTloyNXQzSTc1UHhxYU5j?=
 =?utf-8?B?NGhIaWErT2dkS3ZVeXhhTkY5eUdpUEdyZVRDVDFYYzVVNTRtaHJlc0tyMUJ6?=
 =?utf-8?B?V1UzR2lDZzhCaWJrRmgwS0lzcHQ4MjFxVTh3My8waUZBZEkxNFBzUnZBRGpz?=
 =?utf-8?B?ZUwxa0tLOXg0aVc0OW53RXVMczQ0a0k0TFN0ck9YTDZKSzhpK2xlTWhTamlM?=
 =?utf-8?B?dUNGSWh2UlRLNndRZmp0K3ljdzVvVkZBUmVMYTRBQVNYakxyRFFTc1NsdWE1?=
 =?utf-8?Q?nhQQci173Yfr9zwKAQL4yncAHi98cRD8DK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <796F4BBC8C52AB43B795E6D226739C34@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e90e24-939b-49b7-5bd4-08d8b5f85c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 06:15:57.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMlVHUK3my4soT9pBhEdMC3nHVYUcd07+AlOO9I5c1xjEcYYaN36hDLAlrPsUgyQM2Jo4XXIY4M9R0M2txpSdcND+Vb7eDGYc3RyGF1MGZrMmKnIo2GLEmVADTH5p188
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2892
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNClRoYW5rcyBhIGxvdCBmb3IgcmV2aWV3IQ0KDQpPbiBTYXQsIDIwMjEtMDEt
MDkgYXQgMDE6NDUgKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+IE9uIEZyaSwgSmFuIDgs
IDIwMjEgYXQgMjozOSBQTSBNYXR0aSBWYWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5y
b2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFN1cHBvcnQgR1BPKHMpIGZvdW5kIGZyb20g
Uk9ITSBCRDcxODE1IHBvd2VyIG1hbmFnZW1lbnQgSUMuIFRoZSBJQw0KPiA+IGhhcyB0d28NCj4g
PiBHUE8gcGlucyBidXQgb25seSBvbmUgaXMgcHJvcGVybHkgZG9jdW1lbnRlZCBpbiBkYXRhLXNo
ZWV0LiBUaGUNCj4gPiBkcml2ZXINCj4gPiBleHBvc2VzIGJ5IGRlZmF1bHQgb25seSB0aGUgZG9j
dW1lbnRlZCBHUE8uIFRoZSBzZWNvbmQgR1BPIGlzDQo+ID4gY29ubmVjdGVkIHRvDQo+ID4gRTUg
cGluIGFuZCBpcyBtYXJrZWQgYXMgR05EIGluIGRhdGEtc2hlZXQuIENvbnRyb2wgZm9yIHRoaXMN
Cj4gPiB1bmRvY3VtZW50ZWQNCj4gPiBwaW4gY2FuIGJlIGVuYWJsZWQgdXNpbmcgYSBzcGVjaWFs
IERUIHByb3BlcnR5Lg0KPiA+IA0KPiA+IFRoaXMgZHJpdmVyIGlzIGRlcml2ZWQgZnJvbSB3b3Jr
IGJ5IFBldGVyIFlhbmcgPA0KPiA+IHlhbmdsc2hAZW1iZXN0LXRlY2guY29tPg0KPiA+IGFsdGhv
dWdoIG5vdCBzbyBtdWNoIG9mIG9yaWdpbmFsIGlzIGxlZnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+
DQo+IA0KPiBPdmVyYWxsIHRoaXMgbG9va3MgZ29vZCENCj4gDQo+ID4gKyAgICAgICBkZXBlbmRz
IG9uIE1GRF9ST0hNX0JENzE4MjgNCj4gDQo+IEkgc3VwcG9zZSB0aGlzIG1ha2VzIGkgcG9zc2li
bGUgdG8gbWVyZ2Ugb3V0LW9mLW9yZGVyIHdpdGggdGhlDQo+IGNvcmUgcGF0Y2hlcyBhY3R1YWxs
eS4NCg0KQWN0dWFsbHkgbm90LiBNRkRfUk9ITV9CRDcxODI4IGlzIGV4aXN0aW5nIGNvbmZpZyBh
cyB0aGlzIEJENzE4MTUgdXNlcw0Kc2FtZSBNRkQgZHJpdmVyIHdpdGggQkQ3MTgyOC4gU28gTUZE
IGhlYWRlcnMgc2hvdWxkIGJlIGluIGJlZm9yZQ0KbWVyZ2luZyB0aGUgZGVwZW5kaW5nIHN1Yi1k
ZXZpY2UgZHJpdmVycy4NCg0KPiANCj4gPiArI2RlZmluZSBERUJVRw0KPiANCj4gV2h5PyBEZXZl
bG9wbWVudCBhcnRpZmFjdD8NCg0KT3VjaC4gVGhhbmtzIGZvciBzcG90dGluZyBpdCA6KSBJJ2xs
IGdldCByaWQgb2YgdGhhdC4NCg0KPiA+ICsjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPg0KPiAN
Cj4gWW91IGNlcnRhaW5seSBkbyBub3QgbmVlZCB0aGlzLg0KPiANCj4gPiArI2luY2x1ZGUgPGxp
bnV4L21mZC9yb2htLWJkNzE4MTUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWdl
bmVyaWMuaD4NCj4gDQo+IEkgZ3Vlc3MgcmVnaXN0ZXJzIGNvbWUgZnJvbSB0aGVzZT8gRG8geW91
IG5lZWQgYm90aD8NCj4gQWRkIGEgY29tbWVudCBhYm91dCB3aGF0IHRoZXkgcHJvdmlkZS4NCg0K
T2suIENhbiBkby4gKHJlZ2lzdGVycywgSSB3aWxsIHJlY2hlY2sgaWYgSSBjYW4gZ2V0IHJpZCBv
ZiBpbmNsdWRpbmcNCnRoZSByb2htLWdlbmVyaWMpDQoNCj4gDQo+ID4gKyAgICAgICBnLT5jaGlw
Lm5ncGlvID0gMTsNCj4gPiArICAgICAgIGlmIChnLT5lNV9waW5faXNfZ3BvKQ0KPiA+ICsgICAg
ICAgICAgICAgICBnLT5jaGlwLm5ncGlvID0gMjsNCj4gDQo+IE92ZXJ3cml0aW5nIHZhbHVlLCBo
b3cgbm90IGVsZWdhbnQuDQo+IA0KPiBpZiAoZy0+ZTVfcGluX2lzX2dwbykNCj4gICBnLT5jaGlw
Lm5ncGlvID0gMjsNCj4gZWxzZQ0KPiAgIGctPmNoaXAubmdwaW8gPSAxOw0KDQptYXR0ZXIgb2Yg
dGFzdGUgSSdkIHNheSA6KSBBcyBJIHdvdWxkIHNheSBhYm91dCBmdW5jdGlvbnMgbmFtZWQgbGlr
ZQ0KX2ZvbygpIDspIE5vdCBhIHBvaW4gSSB3b3VsZCBmaWdodCBvdmVyIHRob3VnaCAtIEkgY2Fu
IGNoYW5nZSB0aGlzIDpdDQoNCg0KPiA+ICsgICAgICAgZy0+Y2hpcC5wYXJlbnQgPSBwZGV2LT5k
ZXYucGFyZW50Ow0KPiA+ICsgICAgICAgZy0+Y2hpcC5vZl9ub2RlID0gcGRldi0+ZGV2LnBhcmVu
dC0+b2Zfbm9kZTsNCj4gPiArICAgICAgIGctPnJlZ21hcCA9IGRldl9nZXRfcmVnbWFwKHBkZXYt
PmRldi5wYXJlbnQsIE5VTEwpOw0KPiA+ICsgICAgICAgZy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4g
PiArDQo+ID4gKyAgICAgICByZXQgPSBkZXZtX2dwaW9jaGlwX2FkZF9kYXRhKCZwZGV2LT5kZXYs
ICZnLT5jaGlwLCBnKTsNCj4gPiArICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImNvdWxkIG5vdCByZWdpc3RlciBncGlvY2hpcCwN
Cj4gPiAlZFxuIiwgcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAr
ICAgICAgIH0NCj4gDQo+IEl0J3MgYSBiaXQgY29uZnVzaW5nIGhvdyB5b3UgdXNlIHBkZXYtPmRl
di5wYXJlbnQgZm9yIHNvbWUgc3R1ZmYNCj4gYW5kICZwZGV2LT5kZXYgZm9yIHNvbWUuDQo+IA0K
PiBXaGF0IGFib3V0IGFzc2luZ2luZw0KPiANCj4gc3RydWN0IGRldmljZSAqZGV2ID0gcGRldi0+
ZGV2LnBhcmVudDsNCj4gDQo+IGFuZCB1c2UgZGV2IGZvciBhbGwgdGhlIGNhbGxzLCBpdCBsb29r
cyBsaWtlIGl0J2Qgd29yayBmaW5lLg0KDQpJIHdvdWxkbid0IGJpbmQgdGhlIGxpZmV0aW1lIG9m
IGRldm0gZnVuY3Rpb25zIHRvIHRoZSBwYXJlbnQgZGV2aWNlLiBJDQphbSBub3Qgc3VyZSBpZiBp
dCB3b3VsZCB3b3JrIC0gd2hhdCBoYXBwZW5zIHdlIGJpbmQgbGlmZXRpbWUgb2YgWFggdG8NCnBh
cmVudCBkZXZpY2UgLSBhbmQgbmV4dCBjYWxsIGF0IHByb2JlIGZhaWxzIChmb3IgZXhhbXBsZSB3
aXRoDQpERUZFUlJFRD8pIEkgX2Fzc3VtZV8gdGhlIFhYIGJvdW5kIHRvIHBhcmVudCBpcyBub3Qg
cmVsZWFzZWQ/IChQbGVhc2UsDQpkbyBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmchKQ0KDQpCciwN
CiAgICBNYXR0aSBWYWl0dGluZW4NCg0KDQoNCg==
