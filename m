Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD23F2E24E9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 07:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgLXGr0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 01:47:26 -0500
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:52217
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbgLXGr0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 01:47:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adhII4Vt/1L6qXIapKo3ZVMHq4QpQUYSO+WuLEvdEs1P3OqMPxUca0jN+HaKU9G6ISHudddYpt7u/2Iy0c1gir8cfpmaknyMiwnHslQ8SRre7gBKPn4vrYY98dp1iB2SsDvwulIH1DCLfadh+zJj8noQub0lW5oj1wl1+dYNxpc8NeInlmrCDRKWKzRa237lUhu7mZJZmJm2e90op8n5l1zdtnmQncnaunEuZwc3khMPOEMkPJ9Lc2c/aZPAsc6LKle+fVUwHRz9YvBVXOwr08eWOenlyRHkLXd+okhLt6XyJ6tqqFkEs8SVyC8nwbdS2dqXJ3lKQk38VYC5xmlEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGnM1M/nyDwadV9cANY61s5tbI8UEDO0lhH55EYZn6s=;
 b=dfP21qsu9cZqqzAgUEBdUnAcNA2lkbu2zrFNp/a/s32LYgaRFrlK52EVd1Jlw5jk9RNhJwz8hRVwtzJ5vRNQ2yEIOjdsO13duFhO6i0ujeaugD2FobI5r8pxvajSBJu78TBjHn+TUkGjNJCknhiybbfS20O0Iumkk1CCUBY1XsxrPPQ3l1zjLmOxjxKMoBYAoPre6V9BT2hS9h73VHWej974KydjDh3twBkE7lKb8EBo0NooOBsXXWNU92MwkRqrN+gJm9bpLu5ZTnY0kAFCRwy63MsWO0BDasBb+lYN409XSJd1sAVc1/ZKQBsQq9hqsj62lICntGnNNYWIJsmCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGnM1M/nyDwadV9cANY61s5tbI8UEDO0lhH55EYZn6s=;
 b=MzdV86+06ntAMPQ2kbMKVKSNljlVneQaI/MbNMa8xbAsE6OLlRRG71O3rFjZJXSUvW3kLUWk7xbcs1ympX/bKUnyKxKIqDKP06XtwYHmQrggk0qOWCPYtmWSGrYVNgC5fNbUkAxSEcTkYRy50OgfY60tBZ1KH3TUCh9EwfoY8FE=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSAPR01MB4196.jpnprd01.prod.outlook.com (2603:1096:604:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Thu, 24 Dec
 2020 06:46:36 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7df8:3b7f:f3d7:b560]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7df8:3b7f:f3d7:b560%5]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 06:46:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH v6 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHW2RWSReZXi/5NNEyI3qMKK0VkFqoE0W0AgAD8NZA=
Date:   Thu, 24 Dec 2020 06:46:36 +0000
Message-ID: <OSAPR01MB368360D8A4E3AD1E6F928271D8DD0@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201223153928.GA681741@dell>
In-Reply-To: <20201223153928.GA681741@dell>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b0a7:a6bd:cb4a:efb1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27b2e92f-fdfb-4e9a-4620-08d8a7d7a8dc
x-ms-traffictypediagnostic: OSAPR01MB4196:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB41963DABF7156C9FD7D044ABD8DD0@OSAPR01MB4196.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NTxE9qNjlYXOuocqkYGxMqGP4MHmgDZf8CywAWUG6qfPoWq5FHcyqgisBCAxTUn9QZUeynmdPNwGGBr1nkP0fdMbf9iKFkKIFpyqbHl19FDh6vwZHdFgZBV5gWVU5ByOjJu7urW2ApNYJyA8wAIlZgHZ4qtsAZtmRsLA6fmqKTBn3zIfqynyvzCl1WRcJNOcXnrT2EaUOyNSJepgGhtj+BiQ6uWRuW//deFQpRs3nQ2ipdmJfM5sDxttV3gdWwAfPOY4S/HS2uOFPKGBoQCnfRCCOwYEcSzynfBBKPi8qB/AEdls3RKlcoyxbhBiwQdN9209bw2JN+plzzZ9QSaXAnLDP+k1mY7RMocWI12fASgCo/F3pHJRrEgUAQ1izdozLEFGOnAZAqEY6q42B3TeSMl1gCjY6fqJv8dYYbNgEIXsNqArKwziB+mPVrkCJ4kM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(9686003)(6916009)(52536014)(55016002)(6506007)(8676002)(71200400001)(76116006)(66946007)(54906003)(2906002)(86362001)(186003)(4326008)(8936002)(5660300002)(64756008)(66446008)(66476007)(33656002)(7416002)(7696005)(66556008)(83380400001)(316002)(478600001)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wm1LUDBRY290cDBiS2padHhJWUJIY1hSLzlEZnl5L2RrRVhINTJQUDcyaTYv?=
 =?utf-8?B?ZVZuM0xmVFdVemthVTg2L1FtczdrQXRNQWc0RHpiNHRub1JJOWZ6RkkyQ2dQ?=
 =?utf-8?B?WWhhdk54Tm9UZmxtdk9qeXY3WDdhL3pGazRsOFJLZFlENmRJL3g1T0YydTA5?=
 =?utf-8?B?QmJ6WVJFWGZVbmNNYXREbzNERGZ0YWxBR2dINXFiOVlObVpoTVpaYkEzRUN5?=
 =?utf-8?B?U1pZdUJxcmJOZjEyMkliNDhHZmE0VUtsZW8yNWRWSHNyR3k4R2NYcjhqU3FY?=
 =?utf-8?B?WXVhbFoydDZ4Wk1BZGJjS0tDblc5OUd5TmV3NHFVbmsxWm94Y21PMU1LRk9n?=
 =?utf-8?B?WWszMHJ6RUtPY0FEaXExVU01cDFTdnVoZFZ1QmNQWHJkcUcrTmxLZ2ZrQmZ6?=
 =?utf-8?B?TEtaTHFsN0wwOXpyRHpGNCtnOTRvaVdHRHdlcVdJa0NkcUYvTkVrMU1LZVph?=
 =?utf-8?B?ejlNK0FpSWI3eEVqQXA2dHF3RUhsc0hBaTA3cHFoUk44WWlTNm51S0ZzTURG?=
 =?utf-8?B?WGY2N09TMHdlV0J1bkNKT0lGTmhTNWF4TDkwZ1lqaDg5MURiVTNvUy9FajQ2?=
 =?utf-8?B?Z3p1WlNHc0haS1FPVkRYV29NSi9tSU93R0NBL1o4OXljZHBVZFV1VzNPQ0Mx?=
 =?utf-8?B?SHBlOWd6MDdIdnVGRS9ZelF3aHA1czdvWHlITi9nQkxwOUZ1Zks4SVVyZ1Vk?=
 =?utf-8?B?M0ZxYjgrMUJ4M2JYZHlTcG9vdEZKZzlaZlFkVmVmTENvamlYb3ZoWmdUQnNz?=
 =?utf-8?B?a29oNlFjL0toK0JaZVR1NDRPU3R4ZmdkOEtZY01icFZKbU9qU1l5Y0ZST3g3?=
 =?utf-8?B?UmlVYmMyeHYyNFpJWTE5Qi9hQ3A5b3lTcU15bHE3aTZtQnJkNHRJb1pMRkxF?=
 =?utf-8?B?K0podzFET0JWYnNVQUprQXBBMlYvN1MvRW9mc2VUT3V3MjU2S1hBeUxLaThC?=
 =?utf-8?B?bE85ejN1NmRVSjA3ZHVnQTkxZHFpTURHRGMyS2c5VlAvalgycFBOSzVYUnN5?=
 =?utf-8?B?SDMxekxZeXovV1JibXFnS1ZJRnd6bFlQbEpaUlE3Q0VGbmRwRXV3ZDB6Nzl4?=
 =?utf-8?B?OUlydU9odk04YVc2L1FDUUU3bUFNcXh3Tjc3QUlzKzF1TmNpanVCdkJKWE44?=
 =?utf-8?B?RTgxc1hqVmtqVzNFMFAwb2ZWK0w1eDhybFhqbE42S2FkYkxRMWJRT3hoRmpY?=
 =?utf-8?B?dDdYUnBaaDRZa044YnlQb3ZFa2dpMWVkSE5qOHU3Mzl3aHBBZTUwQStsY1Q5?=
 =?utf-8?B?ZUpYRDMzNVRPcms4NnRFK01SejdoNlRLeWY2elMyUXI0a1A5a0NOdDVKN3BO?=
 =?utf-8?B?KzN0Z1VJLzNBSjlQOXFxQ3owbmtKT0VpRVB5YzZTOXpOdXVuRndmS1Jnd2JH?=
 =?utf-8?Q?UA0KIYfA3nKDANiRQZLBfOuzZ9Dm8Lqo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b2e92f-fdfb-4e9a-4620-08d8a7d7a8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2020 06:46:36.4511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXWJHNda+nyIkFiQUIGj5Gv1bhDrAj1Xa1Ochkp/EtR7fjrWGB5m2wbfAOwcF+875apXHzSMVsO3ymzjgRTkvKRXGR5CIvBWFpHf3570Ab+TCJF/rDGBLW5LlE34pM6q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4196
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGVlLA0KDQo+IEZyb206IExlZSBKb25lcywgU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDI0
LCAyMDIwIDEyOjM5IEFNDQo+IE9uIFdlZCwgMjMgRGVjIDIwMjAsIFlvc2hpaGlybyBTaGltb2Rh
IHdyb3RlOg0KPiA+IEZyb206IEtoaWVtIE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMu
Y29tPg0KPiA+DQo+ID4gU2luY2UgdGhlIGRyaXZlciBzdXBwb3J0cyBCRDk1NzFNV1YgUE1JQyBv
bmx5LCB0aGlzIHBhdGNoIG1ha2VzDQo+ID4gdGhlIGZ1bmN0aW9ucyBhbmQgZGF0YSBzdHJ1Y3R1
cmUgYmVjb21lIG1vcmUgZ2VuZXJpYyBzbyB0aGF0DQo+ID4gaXQgY2FuIHN1cHBvcnQgb3RoZXIg
UE1JQyB2YXJpYW50cyBhcyB3ZWxsLiBBbHNvIHJlbW92ZSBwcmludGluZw0KPiA+IHBhcnQgbmFt
ZSB3aGljaCBMZWUgSm9uZXMgc3VnZ2VzdGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2hp
ZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo+ID4gQ28tZGV2ZWxvcGVk
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2Rh
LnVoQHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZmQv
YmQ5NTcxbXd2LmMgICAgICAgfCA4OSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ID4gIGluY2x1ZGUvbGludXgvbWZkL2JkOTU3MW13di5oIHwgMTggKy0tLS0t
LS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25z
KC0pDQo+IA0KPiBDb3VwbGUgb2Ygc21hbGwgcG9pbnRzLg0KPiANCj4gUmVtYWluZGVyIGxvb2tz
IGdvb2QuDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+IGlu
ZGV4IDQ5ZTk2OGUuLmM5MDVhYjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZmQvYmQ5NTcx
bXd2LmMNCj4gPiArKysgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+IEBAIC0zLDYgKzMs
NyBAQA0KPiA+ICAgKiBST0hNIEJEOTU3MU1XVi1NIE1GRCBkcml2ZXINCj4gPiAgICoNCj4gPiAg
ICogQ29weXJpZ2h0IChDKSAyMDE3IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQGdt
YWlsLmNvbT4NCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIwIFJlbmVzYXMgRWxlY3Ryb25pY3Mg
Q29ycG9yYXRpb24NCj4gPiAgICoNCj4gPiAgICogQmFzZWQgb24gdGhlIFRQUzY1MDg2IGRyaXZl
cg0KPiA+ICAgKi8NCj4gPiBAQCAtMTQsNiArMTUsMTQgQEANCj4gPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvbWZkL2JkOTU3MW13di5oPg0KPiA+DQo+ID4gKy8qIERyaXZlciBkYXRhIHRvIGRpc3Rp
bmd1aXNoIGJkOTU3eCB2YXJpYW50cyAqLw0KPiA+ICtzdHJ1Y3QgYmQ5NTd4X2RkYXRhIHsNCj4g
PiArCWNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY29uZmlnOw0KPiA+ICsJY29u
c3Qgc3RydWN0IHJlZ21hcF9pcnFfY2hpcCAqaXJxX2NoaXA7DQo+IA0KPiA+ICsJY29uc3Qgc3Ry
dWN0IG1mZF9jZWxsICpjZWxsczsNCj4gPiArCWludCBudW1fY2VsbHM7DQo+IA0KPiBBcmUgeW91
IHVzaW5nIHRoZXNlIHBvc3QtcHJvYmU/DQo+IA0KPiBJZiBub3QsIHRoZXkncmUgbm90IGRkYXRh
Lg0KDQpJJ20gbm90IHVzaW5nIGFsbCB0aGVzZSBtZW1iZXJzIHBvc3QtcHJvYmUuDQpTbywgSSds
bCByZW1vdmUgZGRhdGEuDQoNCjxzbmlwPg0KPiA+ICBzdGF0aWMgaW50IGJkOTU3MW13dl9wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiA+IC0JCQkgIGNvbnN0IHN0cnVjdCBpMmNf
ZGV2aWNlX2lkICppZHMpDQo+ID4gKwkJCSAgIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICpp
ZHMpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBiZDk1NzFtd3YgKmJkOw0KPiA+IC0JaW50IHJldDsN
Cj4gPiAtDQo+ID4gLQliZCA9IGRldm1fa3phbGxvYygmY2xpZW50LT5kZXYsIHNpemVvZigqYmQp
LCBHRlBfS0VSTkVMKTsNCj4gPiAtCWlmICghYmQpDQo+ID4gLQkJcmV0dXJuIC1FTk9NRU07DQo+
ID4gLQ0KPiA+IC0JaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgYmQpOw0KPiA+IC0JYmQtPmRl
diA9ICZjbGllbnQtPmRldjsNCj4gPiAtCWJkLT5pcnEgPSBjbGllbnQtPmlycTsNCj4gPiArCWNv
bnN0IHN0cnVjdCBiZDk1N3hfZGRhdGEgKmRkYXRhOw0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2
ID0gJmNsaWVudC0+ZGV2Ow0KPiA+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+ICsJc3Ry
dWN0IHJlZ21hcF9pcnFfY2hpcF9kYXRhICppcnFfZGF0YTsNCj4gPiArCWludCByZXQsIGlycSA9
IGNsaWVudC0+aXJxOw0KPiA+ICsNCj4gPiArCS8qIFJlYWQgdGhlIFBNSUMgcHJvZHVjdCBjb2Rl
ICovDQo+ID4gKwlyZXQgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LCBCRDk1NzFN
V1ZfUFJPRFVDVF9DT0RFKTsNCj4gPiArCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJZGV2X2Vycihk
ZXYsICJGYWlsZWQgdG8gcmVhZCBwcm9kdWN0IGNvZGVcbiIpOw0KPiA+ICsJCXJldHVybiByZXQ7
DQo+ID4gKwl9DQo+IA0KPiBOaXQ6ICdcbicgaGVyZS4NCg0KSSBnb3QgaXQuIEknbGwgYWRkIGEg
YmxhbmsgbGluZSBoZXJlLg0KDQo+ID4gKwlzd2l0Y2ggKHJldCkgew0KPiA+ICsJY2FzZSBCRDk1
NzFNV1ZfUFJPRFVDVF9DT0RFX0JEOTU3MU1XVjoNCj4gPiArCQlkZGF0YSA9ICZiZDk1NzFtd3Zf
ZGRhdGE7DQo+IA0KPiBTaW1wbHkgZGVjbGFyZSAnY29uc3Qgc3RydWN0IG1mZF9jZWxsICpjZWxs
cycgbG9jYWxseSBpbiBwcm9iZSBhbmQNCj4gYXNzaWduIGl0IGhlcmUgaW5zdGVhZC4NCg0KSSBn
b3QgaXQuIEknbGwgYWxzbyBhZGQgImNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBf
Y29uZmlnOyINCmFuZCAiY29uc3Qgc3RydWN0IHJlZ21hcF9pcnFfY2hpcCAqaXJxX2NoaXA7IiBs
b2NhbGx5IGluIHByb2JlLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
