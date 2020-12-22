Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A89A2E07DA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgLVJQG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:16:06 -0500
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:56736
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726140AbgLVJQF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:16:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZe+iYc+5hc1M+a18Wp2k2pYswBzoX6jUv/bTfCV0bcfxafDeA5gE8UXKKt8ybdBpyJD9+39EFg0S8qBim40nQkCJgYU0DuA4SSMOkhBqDIkXkucFLEtLr13YlKHjvrplxsHcxc/K/14PrcsStQiJXE/3Z3szNpajuqHjtjsmiRpz5uco+BIfS9p/4b8/xp74JFeXa892K2IkvFE6vkJWa7jtkPvyWakmXv/MU936l04rE5Ibp0CNVjwPUVSW4+lZc60uK6ge32yHnnT8hoVRFscrsPOIsydnAA3eOFTOJzNLeXStuyujgeF2ZLb7KcSJmfd5hgj1kT5xLcuCSLrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soE0nRDxPesbe2IzCWGn6nDGQ1FM0o+O7w46FL1kZvw=;
 b=geyS+yohrVlSedq8fSTuHsxw8luMW45kFoPYYdNKTmyRzOtI7Tm4atzC6jx1ChSD9+Frzcjn84MComGluGK1Dq4Z5WedpVcwvX2J41OqcNqNOixd8395MoENZhzHz7a3a7mSHBfHCF9Li7Q/AhjT7SCxzYEcd90Yxs7LL0zmO3Brh9Z+CrUKEaywXVf39E4kNcsAxU7ox483EwQIEtwOENF3Pe3fPASuwvZCjXlGM9Wqn4CbAdxKLDljn9BMXGkjy0WKpUiQfPPfuXPzTHscYsLA8Ll+qA7M8jpqylAE3cDS7m0TZAhWPlDBFzjlc09q0rhY5eHOpo5WCxKr4+3TZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soE0nRDxPesbe2IzCWGn6nDGQ1FM0o+O7w46FL1kZvw=;
 b=woK5Xji5v+RvFiCoNMgY/0cWlw6hgXnAegTQSy099PDq2F4IqFFtLb4aE7Ufi2dBOCtSXHH1XhCavj6D5dYKwJ7Vjf4iR46HY+Xkp3RFyHuI1kHqBEyKOLwwFJFG/RO+SdWjCVDV1IRYJnUFs6ZS5fLJxaaA6ohDxS8RNd9LBYw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2762.eurprd03.prod.outlook.com (2603:10a6:3:ef::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Tue, 22 Dec 2020 09:15:14 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:15:14 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW10Sn+Yta0gJHMEKuYgu6KboJiqoC0DsAgAAHJIA=
Date:   Tue, 22 Dec 2020 09:15:14 +0000
Message-ID: <c15b40d02d75a613194a454b4d8a2586639bda93.camel@fi.rohmeurope.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
In-Reply-To: <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c91d1977-05b9-43a5-d0a5-08d8a65a177f
x-ms-traffictypediagnostic: HE1PR0302MB2762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2762D13546F2D23349C37139ADDF0@HE1PR0302MB2762.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npe0L2bZm+03k1JBzWA+HfZlCYNom0kl2AaWZlu/XUKj9kyUqTWIantYtn7rqf+Sg8CYiYClKl8zVfNiY7539gNGv2ny6JjP4UFF5vhySUquz8f0KtX5SQDRpAuNshJZ778txUv9SRZPqzPtFSvLDWaA9Swm0V7HnuKILzUpoEGFvRVMPhG1OzU6AWa8v9JNb86RjcLmNmWfKNZhPQcUsQR831YnhoZcrmUfMB9zsGf52sZztgcwjMGoexqUZLs74NrYkWS/47FnlE1AArer4RTNmwGgtDR3zcmI7JsXBLdZrnWRh4FzQa+lkyOqxFeibZmPfBIRhi/AryVtqLtgrD6JZc5YkOMsl/G3ZKoNGIRvkk278YMVqxf6fX3ZsSSJjQVBRKayJUFp5mdhd2gLWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(3450700001)(26005)(2616005)(86362001)(4001150100001)(8936002)(8676002)(5660300002)(6506007)(110136005)(6486002)(6512007)(64756008)(316002)(4744005)(66446008)(2906002)(7416002)(186003)(53546011)(478600001)(54906003)(4326008)(71200400001)(66946007)(66476007)(76116006)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TjNqbGdOQjNYZUhtU2VEY2w1SFovZzgzMGRvRUs5bU5CQXd1Wk5wUmgwNFNY?=
 =?utf-8?B?a0RhcmNQS2VyV1FueXF2QUtsVm1TWGw4dmhhRm1QVW9RMUorYXlkeGhtMzRn?=
 =?utf-8?B?dGZZSHplWlY0eFZOS3B6OWwvS2g1R3dKZ21LL2xzbTRBQTBhcVNIN3FjdzJI?=
 =?utf-8?B?c2FtVXFkVWQrS0QrSGFFZkROa0VWdkxGVkFDM2dybnc0RVJqMzVLZCtXVmUz?=
 =?utf-8?B?eGdWSjFVeG9pR3F4bnVSSU5yOTVHU3N0VFFRL0h1L05zaGJNWmlHM3huMFQ2?=
 =?utf-8?B?b3ZoU05KTmg2b2tmdUNBUWVxUkFwSlZCQVgyekNWWkI2K1FzZTc2dGJDSDIv?=
 =?utf-8?B?RUI2ZkdScmJNR09rejNHRXAvU2NjOURGVlBHdGtWams2aG1rNVFxUkVxTzFo?=
 =?utf-8?B?NkdoblZWbWNzd0VHZUtsb0RqR0swMjlnSDk3Wk4vVVlvUy9Ld2Y1YzFmVkNm?=
 =?utf-8?B?QmZsS2xyUlduLzluaVk2OG5YUnc0ME5pQmI4V1FBeXpRZmJGSnAyY1VIRFhu?=
 =?utf-8?B?VjdtUFBSYzZjU1hEN0NORnRQRTJWZDVwVnlmaXU0eDgyOFVtL2k0WlhQRFcw?=
 =?utf-8?B?cnRScFV1U0xSMzBkNGR1U0dTZEZ6a2IvQ3p5cGVESFhDeFE5emo4d1p1MnRT?=
 =?utf-8?B?a0VlMnBPclA4NjU0SVNEc2JrekFVeXI1eDZPTEE4SjEyN1p5VFV2QjhzUHk1?=
 =?utf-8?B?ZUs3MWp0TExXYThxbTl4a0xhemNsL0praUdxcUl4Rnpyc0tiRXliNlNlaUtl?=
 =?utf-8?B?TnN3UnlSMXBJTWpyc1UybUhpTWE1a2lEbC91S2QvZ3laVU9iWkpqY1V4Tmk1?=
 =?utf-8?B?SnVpK2VkbUJUQzdldkVGNWFGQitiS1pkQ1phekMyT3VHL0xkc2NNMzhtUFVV?=
 =?utf-8?B?TStySUlrbGtMYUJXSm9CUmc4Z1UwNXp4dEZ1MmlmUlZ4RDdWRXZCTmIyRzZL?=
 =?utf-8?B?c0JZZXI3OVcxakpvY2E2Nk10bFcwOGNkRkJ2bTA2WGNMdlJvKy94c3p6VDY3?=
 =?utf-8?B?MkxjMklMVTl6VXZpTjIzNzlYN1dzcjk5MkUzdmxiRUkwWjRJOWlxNUxTQnJ3?=
 =?utf-8?B?NDVVQmU1SVFKeTJCaVJhcXNKQkhQakNub0VodlZySmtrVHFGVHJtLzlBZ3Nj?=
 =?utf-8?B?MENsTk1scHpQdEJKc1NkdmVtU3RUTC82SU9DZFEzV0l6ZEQ2WnMxK1lmWE0x?=
 =?utf-8?B?akl5K2duN3JaK2t3d29TQ0w1Rkc4SVVpTHlSdGcxWnBJbXVqWXRWYVREYm9Z?=
 =?utf-8?B?RDROWkRTdFptVkdMNEowZXJDR0UvYzRHVlhPVVIvWFN2QmR0a3RNVlRrbTFH?=
 =?utf-8?Q?URuDAReUkqj9ipWpwMdcS9wBrVQI5HdgH5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EE16800B3491A4AA0625002D671132D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d1977-05b9-43a5-d0a5-08d8a65a177f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:15:14.3575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxLpx9oylngm49LCpnVhQ6I0cyXRRQto8yKUljO/YDUkGDQxU7rkI85J7tooDkt1SA/4nYpTAnEry3UDD0boNNROExqTbIejypTplYljf0NyCDXazyz56S/XvuHrOHSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2762
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMTItMjIgYXQgMDk6NDkgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gT24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMzo1NyBBTSBZb3NoaWhpcm8gU2hpbW9k
YQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFVzZSBk
ZXZfcmVnbWFwX2FkZF9pcnFfY2hpcCgpIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEBy
ZW5lc2FzLmNvbT4NCj4gPiBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQpSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52
YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQoNCkkgdGhvdWdodCBJIGRpZCByZXZpZXcgdGhp
cyBlYXJsaWVyLi4uDQoNCkJyLA0KICAgIE1hdHRpIFZhaXR0aW5lbg0K
