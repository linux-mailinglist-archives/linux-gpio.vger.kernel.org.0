Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8F62E0834
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLVJkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:40:08 -0500
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:58605
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgLVJkH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:40:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHUIOu1XO05AHrLa+MpCsS4MP5wMcxqN6luaICToRi+FiGB4C/Lb4PhmtIqWlmd/P6gUvH0FzwRZfV1UenA/fDZcBsxMcLhgeMX1+e4fIFbQV+hmYyle6GBhS0JjOv3BzClI91+UMJnn55DvLxsSVQydgZ08vgAlT19mZL09dUZtZvy35Yc0JXWYd0HLUVbaJj8MntKEwb3JqOLc5MyIcv2pFPEASXhu7aNfraabUd5xwu0Qji7mz08YDtqDCVV5CjmjaxO51cVA7L8m/XKTE0Vg3BTi68QRZPncCaVEkXdET91TAlowuOQtt7PdQKQryR/inS6sEt3As/Cg4PxxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8oDNy0M1Fd/FU9RJg22/vxvDwx3CMsymZ24KwFkfIQ=;
 b=kPlFoQmBpA7JKWcwKVvjpU2uHx32BJZ/j0Y3gNJ2GSI81uiJDXV8CKX2mnhdmtvhz4NrcDO4bvjhXAlwLQV7u70k+TSC0HXlj7UdxYLbzWMrLlfucRpmiB41y9l/vQLVTUFj6KOr3xNrsfu3iQNUXtOvieaq5NQLgOzGdCF9+ACkynlUJfuXSNsZz32ISsPLCDaKt/z8gmbQz/L8zuJg6AmCtSumRKCg86aCZ3lwXO7PleuE7A0ihqE3aC7TgPm1Z1vJVc21dZjtYclC4ypsPEDhTnTbatasAa7cIE+QK+UnqfF3vxMmvrX2SiUOIQ4o4FwiF8xbe+PEqRawrVW9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8oDNy0M1Fd/FU9RJg22/vxvDwx3CMsymZ24KwFkfIQ=;
 b=o2GLc7aZ3G1GNxGALnF5pvsDR/bPLWL9fsIEG2iztfiQChXpzEAd1EivGts161q5iYNJ64RdUBEGUTxKj4k3Zs9XWfHuY2PKHGc2kDMm/rxqtD6ffdDMEpzKGoYL8Gnbjk9qa/KU9/dgSPNItHfe0kfHpbWzS22tj/kDLK80FFY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2473.eurprd03.prod.outlook.com (2603:10a6:3:68::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Tue, 22 Dec 2020 09:39:16 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:39:16 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW10Sn+Yta0gJHMEKuYgu6KboJiqoC0DsAgAAHJICAAALOAIAAA94A
Date:   Tue, 22 Dec 2020 09:39:16 +0000
Message-ID: <c36aa3f2569a977e56c845322a21f61c33c312bb.camel@fi.rohmeurope.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
         <c15b40d02d75a613194a454b4d8a2586639bda93.camel@fi.rohmeurope.com>
         <TY2PR01MB3692B09ECBAD4FFDB885E530D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692B09ECBAD4FFDB885E530D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d8d81024-68a3-4191-e49e-08d8a65d7331
x-ms-traffictypediagnostic: HE1PR0301MB2473:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB24733C219F0AA2A9E27FC41AADDF0@HE1PR0301MB2473.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+4ZrhEj3lnaywoSKBP4IZb/SmirFknFds6cIvV5iaXVj2JZU/AxwoeugO9T1W0yatySylzhxIoqMdDmb6/HrQs9SDn+Iasc3Xx7qOTMWMQBlTRMtMu+pz3GZAtJU5VQ1IP+0t/77nAiALirVIYeyP4IAXdllrR45FqSmqyGuWQsyGHR7V83pFPv9r91HC/1/Z/nlnDuVZ6fTWtv8scr6fQXRrMgePRQ48aNnTesTCOsA34xwV1Q1AWWFbOgzs+tZyqimSnyr1mA67TgJjgknCbgN14SXUzUV0GY9K+qU80ZjPiSgLPU9/wQUf4fmYNo0DfepSc7KWLsTFy0wxIfR6eYIxjrg9Anp388eLOg6rnNKqvjalMMgYjkvqhtoL9AM2OKZm9Eml9q6gw8PYK4jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(4744005)(26005)(53546011)(6506007)(186003)(3450700001)(71200400001)(4326008)(54906003)(86362001)(6512007)(110136005)(66556008)(76116006)(66476007)(66446008)(5660300002)(2906002)(4001150100001)(64756008)(8936002)(7416002)(498600001)(66946007)(2616005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cmFmTWdWMFRsaHE4RFJRdk9OQWlVeFFQVzhVdmNuNXMwdFdVaXE2U3VJLy9M?=
 =?utf-8?B?UC9OTGQxTkJTWGJXcHdnNndUYlZoOXRSYnRIYmtuUTJVNGVVaW4xQmVOUXVu?=
 =?utf-8?B?ZzNXU1NSQUQ3dmdQOFkzR21xUGNnQjhDWlBjL0pjSGRwZmRqQ3RVZTRVbWh4?=
 =?utf-8?B?OXp5b2cvV0VwUFQwZlhCbFFLQjl2T3R6NWNSZDEvY2FoQ0tGc1JwZXRkeEVq?=
 =?utf-8?B?eVVXaWRjM2hIOTJqcTdHSUd6b2VlNy92SjdhNlJvS1lCdWE2VFloZmp2eGkr?=
 =?utf-8?B?MVVHdG4zNHBrZVJqeHNiakx5U1BKWklSUlJYU3FuRzcrK3VEajMrWE1pOVBQ?=
 =?utf-8?B?VlIvbDh4ZEs4QWgxNlVSZVd5SmhJWEpVdjBSWUI2NFlQaW1nZm9qd3hncVpK?=
 =?utf-8?B?QzFJd1FHTDVMSm04NklEanBXNjFxQ0JtZjhmbzdLb1BPQVBLSmkrNGhVdTd0?=
 =?utf-8?B?ODg0aVFUUDlUd21JNFVGU3d2M3E0cnU1a2JWaWVPYm1CSm5QYTRVVjlYVVFE?=
 =?utf-8?B?dWFuL3RyRkZ2NWxxbTViMElZdkZ0c0hVclJGQTlSNDVCQ3A3NE1QaExBV21k?=
 =?utf-8?B?SVBqQlEwZEdNMklYMGNqR3BwcVBlL0lvNGNyZzBJNmRNYysvYy9IbnlWZFlP?=
 =?utf-8?B?dklKb0Z1S29hQmxWbmZWcWhiNEFzK3dCazBYSTFsZEtERHU1UmoxVVFKVmFH?=
 =?utf-8?B?cUZwMHlGTWNWcWRBR1kzNnhrQUtoQVRSWU9rSEFjQm5tUFVBL3MydnpJajJ2?=
 =?utf-8?B?d1dvTlYzcjBzVFlYbUxIcEJCUzlmaC9hU2dlRjdBdUFCWGRjWVJIcThQVVVY?=
 =?utf-8?B?UVVuL2VtL1BkWUpoNmlpNUdYaSswZG1XUC9HUFh4ZjZHWU43OVNIOFFqMGl6?=
 =?utf-8?B?WjgxUDlzUjRCdHFCSGFuL3FxcHRFemQwcFpVWDF6VFNyQi81RFFLM3RnY1dE?=
 =?utf-8?B?N1BkU3B0cnQwdFpoTUwyQzVUNGxMY3E4MFNEL29EVUdqREpNZUtOdHkzdWo4?=
 =?utf-8?B?WG1jcEdsa08rSW5VZFlLdVh6S0dxVDQyaXpGRTduWG5DbVF2WUR0RVNwVFJw?=
 =?utf-8?B?cmtpM1JBNURDOTdWTFJtS0xTemFzL2Zva2lUOW5haG9yUXBJcjUrclljSllD?=
 =?utf-8?B?bTZBUXViT1ZWRHVDVUJlZWxJSnlKSUNwTmt4NjVYUUhlU0RHSUlvY09sZklV?=
 =?utf-8?B?UWoxdVZrOFFEbzZiY2Z3Z3l2U0dCYk9paitSWXFXR1VkL2hJTkxWaHNWd3Zw?=
 =?utf-8?B?WGlxOFUzYkZaclBQTGVCWWZWeTVONDVLMHlPdzI5dDM2OVF0YlcwK2N0YitX?=
 =?utf-8?Q?o/t+X6z2/NdwC6iy6X1y85bfw8hwBL8WoC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3C0201E95D1CB4AA8D961880D54C4C8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d81024-68a3-4191-e49e-08d8a65d7331
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:39:16.6175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWjRmdPkpHSxWyIixPyB4xJADuRJ8ElI7LmRjCZHdU1mv5OoiYD5X/VCbCSG3UJY4Z6yniwNZ3ooL03dMTpm58Nf5Hzo+SmEwrb8yJKDoPJwZKuk76Lje3huJ0f9TpDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2473
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMTItMjIgYXQgMDk6MjUgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBIaSBNYXR0aS1zYW4sDQo+IA0KPiA+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNl
bnQ6IFR1ZXNkYXksIERlY2VtYmVyIDIyLCAyMDIwIDY6MTUgUE0NCj4gPiANCj4gPiBPbiBUdWUs
IDIwMjAtMTItMjIgYXQgMDk6NDkgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4g
PiA+IE9uIE1vbiwgRGVjIDIxLCAyMDIwIGF0IDM6NTcgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+IFVz
ZSBkZXZfcmVnbWFwX2FkZF9pcnFfY2hpcCgpIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLg0KPiA+ID4g
PiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPA0KPiA+ID4gPiB5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gQWNrZWQtZm9yLU1GRC1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4NCj4gPiA+IA0KPiA+ID4gUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4g
UmV2aWV3ZWQtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJv
cGUuY29tPg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCj4gDQo+ID4gSSB0aG91
Z2h0IEkgZGlkIHJldmlldyB0aGlzIGVhcmxpZXIuLi4NCj4gDQo+IFlvdSdyZSBjb3JyZWN0LiBJ
J20gc29ycnksIEkgY29tcGxldGVseSBvdmVybG9va2VkIHlvdXIgUmV2aWV3ZWQtYnkNCj4gdGFn
IGluIHByZXZpb3VzLg0KDQpJdCBoYXBwZW5zIDopIEJ1dCBvZiB5b3UgcmUtc3BpbiB0aGUgc2Vy
aWVzLCBwbGVhc2UgcmV2aXNlIHRoZSB0YWdzIGZvcg0KcGF0Y2hlcy4gSSB0aGluayBJIGRpZCBy
ZXZpZXcgYWxtb3N0IGFsbCBvZiB0aGVtIChleGNlcHQgdGhlIFNQRFgtDQpwYXRjaGVzIGFzIEkg
YW0gbm90IGNvbXBldGVudCBvbiBsaWNlbnNlcy4uLikNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBZb3NoaWhpcm8gU2hpbW9kYQ0KPiANCg0K
