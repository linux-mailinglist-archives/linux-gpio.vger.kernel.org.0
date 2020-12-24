Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164282E2570
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 09:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgLXIY1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 03:24:27 -0500
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:28006
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726609AbgLXIY1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 03:24:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2LoFNyM5T8w0kjB4yW4kCC1Qw/lEMqKg7yasz9vbuhJ3Pw0Z+y3RMGjEE/Q9C+8PUTKjaiDi1o3yW6f5hwFSV99aAHRfrMmZWlOrEGLXLguS7AN6DHIB5uG/J/QxOXvxvXkZc2Nb/F5HTDKw/OwQePj+JEVKAU4PVTj8kSL6druEUCsnwLsCQIKJl/dw/VrQ+OViNDN6G4bW3yNzmGmVxe3gLxRAhz/9stdgLQKKjkpHxqIdxgHi8X5YhxBdo2HqT6il79wvp5uD07PT5+Haizb/4drpKTVcsSqRuElDg8c6KP5Zh7ZQNQc4IivoNf0aQTNNy3HwXr0AaBjgnSI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukfak/K5GDXCIxAhuwnCVXV1lY8OLi+oKVWhe8WsCrs=;
 b=Req4MbnzDtqWlXbwO6EHc7b3epRxp2Nk/oKDDfcmrQcSpljSugxVrhcK8xog1mH0dhWQi6UViaoaVRrc5vjhSxBQgy0S8hXIQr7dyQMxpzYrdcOpcqpLl7WCQ3jHzB812GQUWYBin4coKhwJOxONPouIIlgwWj/hEasd8flB306VueueYTcC/hYzUXarNTsZpddJCBnkEEc+zeDHoRtasvijIekcRL7VGsTBOBSpH8hKKk7PxplGEo18LNE7suOAn9Djn/83JGg4cU9qEElLmrKFtMYHVYbl3rjIloXHuR/WEfk0MsCWg9Q4SrPzAUDf3boRiG4pEhW3VyoBlVs3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukfak/K5GDXCIxAhuwnCVXV1lY8OLi+oKVWhe8WsCrs=;
 b=C82fLjpxD/zzEH3mKmowM9zr4Xh7EDEppELo6yUURNWHTX5jgMkrWrg94E/eoJyIj4VU6EH0yUOpfWxt9W4k+NQJdLvwLM5PY1FCY8qWh7HbLU1DqQN/HZqssWB6nq4cDypynIAFsfNV1esQV4DNnIjNhfG7HbbDPWpWnoZ3zJs=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OS3PR01MB5798.jpnprd01.prod.outlook.com (2603:1096:604:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 08:23:37 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7df8:3b7f:f3d7:b560]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7df8:3b7f:f3d7:b560%5]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 08:23:37 +0000
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
Thread-Index: AQHW2RWSReZXi/5NNEyI3qMKK0VkFqoE0W0AgAD8NZCAAA6cAIAADPfw
Date:   Thu, 24 Dec 2020 08:23:37 +0000
Message-ID: <OSAPR01MB36837CEA1F92382007F3A5F6D8DD0@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201223153928.GA681741@dell>
 <OSAPR01MB368360D8A4E3AD1E6F928271D8DD0@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <20201224073426.GD681741@dell>
In-Reply-To: <20201224073426.GD681741@dell>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b0a7:a6bd:cb4a:efb1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3334e1b-ffc2-441b-0b4e-08d8a7e53661
x-ms-traffictypediagnostic: OS3PR01MB5798:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB5798F50CA28223B267DA26A9D8DD0@OS3PR01MB5798.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lM/d8sRkKp0xKe/Gyo9xRr98WfiBKlQNUr2rhrADZUmpaxP6t9FYMHZrPQQvsfac4YH+kuu4OqR7o0C3bD+ILM0gIzxFGaY3Rz7AhqDERJL//3xcyLVJDwaYjCCAc2wqpQf9EeVnqp6b6OFsna3Wbdy8bk/eccwgegPWAsjuipHta4wPlrGQXUBtEmqvJJsOpyY8qQAUW5WqY82jfMYvcEQpXlX4hg/3BySZ2thRD+nyHyggpDMKCtUoc4uRWMQvJFSDJ2fs7iaZscCPrNGBZOcigASk3/YSGZnFTbEr/DyaYvz3T6Iz1FA7Rq6WNS88Z0zQXei42TSjlbGiu5oc9HMCwlMucq0eywaKp/ljQCTqp5q/4xZDlQI2WuOzOJCH6DTO8iQscGFS820Vdc+/J2D1xrPGfRip/wXpPdjfmlR9Uq09otfFkFyvSJMGWBmS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(64756008)(66476007)(7416002)(4744005)(5660300002)(66446008)(86362001)(4326008)(2906002)(66946007)(478600001)(71200400001)(76116006)(33656002)(6506007)(66556008)(8676002)(316002)(54906003)(6916009)(9686003)(186003)(7696005)(52536014)(55016002)(8936002)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WU1EWUU1T0NXMFdpSGx6OGxQTm5RY3dpSXQ1T0VTd2ZrQXZPd1QwU3BiZWRW?=
 =?utf-8?B?azZKYStYd2VoRjVQNWt4YkhSVSt4bGx2ZzhsTldtSm1sVUlheFlrTWcxaHVT?=
 =?utf-8?B?NUZSZFF0QnhiYU9keHlDOVJtWWpQVll2TFRXZTgrL2xxeFRraWpNNjNvZUww?=
 =?utf-8?B?R3YvYnl6NGlTOTlmWEdoUkZ1MjFlM2hNTktjZmNZaE4vYk56aVdyc0NHMUNN?=
 =?utf-8?B?c3hkS1gyNlV3NUNFMG9QMng1OGhpb0hQU0xlaXBveTVGSnA2aVBEbFIxWlZ6?=
 =?utf-8?B?YzNoSHlrVk9razlrdmZOQjFlcktqVEdDTDV6R2ZIQXpvSEQ3a3IrSFJ4bXR4?=
 =?utf-8?B?bmdVK05adC9zQlk1YjNzbE4zckRkaDkyVmVpeU5SaENvNUpPMGkram1tdmhZ?=
 =?utf-8?B?YXpmc0g2MTFJRnJmZWZWK1NkYTZlVFJhWjBRL1MxeXRQMmFaZkREQ3NhV0RK?=
 =?utf-8?B?cVRQVXFKUjhvNCtsYkZmeGFXS05TSlNwWWQvWTBEQXd3cGVCNmZuOHczTytI?=
 =?utf-8?B?QVo0T3kvMHVQUHhkQVJla2ZtcDJ0Q3VqcEQvRmZMVUZxUHJYVGJNUVIrUm85?=
 =?utf-8?B?U1A4YWs1UThPMElpTUFyRUp1TFdkRjhKZWdVY1g4V2VEU1VtZThVK0JZWGkx?=
 =?utf-8?B?by9WMkprbTNBWk5wVXVOZHptMUxTbUVNMTlrdDNaREErUGozaXBtZTFuZkRm?=
 =?utf-8?B?TmcyZnh3ZXRXU1JUWDVFMmhnLy9RTVhIYWgvbGd4aHhVV1IrQzJoMVZIU3Na?=
 =?utf-8?B?bjFvcThUMlQ4eW4yU1phRGxjd1BGL255RW53cGxUTDlxZkppeS8vREN4RHJL?=
 =?utf-8?B?MmVmNFk0aE5OZWE1UHRZclhUMWdwVWNuWUhhcm9PZXQ3MlB3MVNSOEpUTGJZ?=
 =?utf-8?B?RUFXVTdkc1puL1lpTnZmdlRTQit6Q09xVkw5RnhWOTdHU1A1RUlhOXQ3N0Fz?=
 =?utf-8?B?dnphbXFIb0dhL0RHa1EzTGZGL0V3aGZnT1phbXRhTTRzZE53bzNhblNZSDlu?=
 =?utf-8?B?YWNkd2dDemdkQ0FIQWZQM3liYllKRDNXdCtoRjNkanNBTkJDKysyQys2bm1l?=
 =?utf-8?B?eTlzL01GMGkxWThQVjExN2lxZXd6YlhaaUhGd3ZjQjUxb3Y2M3paRlNsa3F2?=
 =?utf-8?B?Nmg2UGtGeEIrQXNRU2x4djJTanZuR1JDSmt0TnJJdWQydzBjWnBONitIRFhE?=
 =?utf-8?B?b1F3NGl1b2k1cTVEWVQwaFVPYjZzYXRrUFRCazVRY1BVUXZuREpzVUNZL0tI?=
 =?utf-8?B?MDg0Ulo1SXRaZGhVZU9wQ1lPRExoWWErZVRuR1UzakVTZzA4WkUxMnlqbU5O?=
 =?utf-8?B?bU1tSUowN1dBVVc4SHZzSDU1K3VyRTdRNU5TYnRLcklDTXlnc1BOQmNsaFh5?=
 =?utf-8?Q?1TiCnqxo215rkzaySNNylfTbxyI8g2Tg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3334e1b-ffc2-441b-0b4e-08d8a7e53661
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2020 08:23:37.1306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yhZ4amX5QIXnEDUQ3MhSrus91TZScKB6zHW75n/x2lnklkE1AuNJQ3vIDZSBSlZnBPpCOKas9YNoUpWBxCDZ1+MEm/VOudnn2WcTdQO89vFQk7riUsLFDaeegXNGqS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGVlLA0KDQo+IEZyb206IExlZSBKb25lcywgU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDI0
LCAyMDIwIDQ6MzQgUE0NCj4gPiBIaSBMZWUsDQo+ID4NCj4gPiA+IEZyb206IExlZSBKb25lcywg
U2VudDogVGh1cnNkYXksIERlY2VtYmVyIDI0LCAyMDIwIDEyOjM5IEFNDQo+ID4gPiBPbiBXZWQs
IDIzIERlYyAyMDIwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiA+ID4gRnJvbTogS2hp
ZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo8c25pcD4NCj4gPiA+ID4g
Kwlzd2l0Y2ggKHJldCkgew0KPiA+ID4gPiArCWNhc2UgQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERV9C
RDk1NzFNV1Y6DQo+ID4gPiA+ICsJCWRkYXRhID0gJmJkOTU3MW13dl9kZGF0YTsNCj4gPiA+DQo+
ID4gPiBTaW1wbHkgZGVjbGFyZSAnY29uc3Qgc3RydWN0IG1mZF9jZWxsICpjZWxscycgbG9jYWxs
eSBpbiBwcm9iZSBhbmQNCj4gPiA+IGFzc2lnbiBpdCBoZXJlIGluc3RlYWQuDQo+ID4NCj4gPiBJ
IGdvdCBpdC4gSSdsbCBhbHNvIGFkZCAiY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKnJlZ21h
cF9jb25maWc7Ig0KPiA+IGFuZCAiY29uc3Qgc3RydWN0IHJlZ21hcF9pcnFfY2hpcCAqaXJxX2No
aXA7IiBsb2NhbGx5IGluIHByb2JlLg0KPiANCj4gSWYgeW91IG9ubHkgdXNlIHRoZW0gdGhlcmUs
IHRoZW4geWVzLCB0aGF0J3MgY29ycmVjdC4NCg0KVGhhbmsgeW91IGZvciB0aGUgcmVwbHkuIFll
cywgSSBvbmx5IHVzZSB0aGVtIHRoZXJlLg0KU28sIEkgaGF2ZSBzdWJtaXR0ZWQgdjcgcGF0Y2hl
cyB3aGljaCBoYXZlIHN1Y2ggaW1wbGVtZW50YXRpb24uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
