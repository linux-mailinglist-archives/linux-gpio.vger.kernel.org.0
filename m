Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11D62C3532
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 01:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgKYAFh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 19:05:37 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:61154 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgKYAFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 19:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606262735; x=1637798735;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qPeyYulOhOKvQrJI/hHgOK0nSrAG0XGDeyZ/267tC+g=;
  b=MWFCMkPJ9Tes7of4KCyS4FOSiE+KukAZlltvoOEG6Tp2uhTS/TJdfwvu
   SzuYkd2n25WK6zBa4gUD7GANLrqmkfltHtTfm94WWs94QK2Xv9AOvJ0NK
   S1aC+e96XtIeiyo5AMWMsbn75eTCIyhS0wr3kKxEzm62haOkquln9dUsa
   fyZftAdG4ASYn+2VIUtig8QMfUyojemXhV5xbehhbNt8uhE+Z/ylnyj9I
   TvYmnuACcwREc/UsBIrzNyfPYrhtEjhqP4CFe2ev+Vueu6SIpFG+pPmIa
   P0niVPonm40OpOiI69gda531oS7Co6DwCjC4otY2Ors3lmSp12THEkAjn
   A==;
IronPort-SDR: 7Q7UMpoQBgKZM+lmzV/ApKHTRA+/4tIgGukNU57mp64jmGbXDQXXvvp8kQahzGd2UTt2AONOfV
 4tgkERh7WqFkYq+gxtSkgaiZmbIwNWDTiGdYjqRHQDnBiHpx2ejAZ5gbeb5bFj5POdvAuczsPT
 L09k5OWHNWUuu3wy7Vk/lQgHYQjhgPAreREW8hfxp4VR5esQzPhF3v451lp9Itm9PxGnkklV4p
 8A3RQi287HlvqjofBz0KCrJ/9R9L3G6wOcBfe7X8MLTnjiOefc+ICyTMX/Z4qNFw7117mI6fia
 1AU=
X-IronPort-AV: E=Sophos;i="5.78,367,1599494400"; 
   d="scan'208";a="153334124"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
  by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 08:05:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABvl/shBKOM0nydNQAxrSwExdeesprNjPuz776ZoGSFV49X0pMZ/MlY7mEqSXMawXQBz1WU8ETGwM0NXlGBovdsjB3T3pdzMP3Cza0bT8HmAEtN591mOUKywINq0Pru/9PoTCLZVf51uCC4f4vuySANZHqThmjf9oL4LZa0Eb7cvpjZyelxL5douH41kOcdgBlSPjPHU0zt6Tr5Sni4kwzlO7Q5g0MK+j6u6vCHSd7P5KWjYHfgss+CFZcnMMvaxHARRKSB4TT1EG0UYLxIhOboG71lgNo/7E3IHgw+chMYdiUMB+vexUhlmI36BWyrDg4WpSG2n1otjt+cjOFJ4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPeyYulOhOKvQrJI/hHgOK0nSrAG0XGDeyZ/267tC+g=;
 b=X3PBu7BjaosKyot93j5ThtECwFupCEBP5BpyBPnXyWpMOQYlDc2x0T41XfruXBISBw291lY838uGCnf7HoQ4Co6n6v5CayMke9PY98HzMuE1/hgfPSTeTGPLxp/PEmhQCg0XuKr/6tWY90KpH29/zAyMPsHMmsJhjPgfFeAITl0qaZk+ykjb8wssiUGVlZ+B3RuQa+NO3i1wWtAxm7mGN6E7l3JmVbvYyVGZpCNtT9ao9kSM/XgCvLVLag+h7No6xwX8DOFH8lIzV1U4vJ8JAxa26wccXLOTR7/DHzyGYtvJj7ME1Up4Wux+kE2wULt0XDc7lWaKW3ovpK2lgtxqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPeyYulOhOKvQrJI/hHgOK0nSrAG0XGDeyZ/267tC+g=;
 b=H5JqIL4a/CAEFfjV9oG147tzFJTiAVvE+vsX2Z3LlZrpplMw90lgDKjXAtfYU4OIKCUfi/vP/V5vXBh3qX9xOcr0nd5q/sKgSYHkeGvCiRyHsiJSueIxUTu3nbKYpG37oiqc1oIKJNCZCLo11joZ9d230ve/MFyyV7mO3vgiRNk=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6556.namprd04.prod.outlook.com (2603:10b6:610:6b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 00:05:32 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 00:05:31 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v2 21/21] riscv: Add Canaan Kendryte K210 SD card
 defconfig
Thread-Topic: [PATCH v2 21/21] riscv: Add Canaan Kendryte K210 SD card
 defconfig
Thread-Index: AQHWwhukQP9Bao2VdE+0IzXV6Ta0SqnXoV4AgABXyQA=
Date:   Wed, 25 Nov 2020 00:05:31 +0000
Message-ID: <b9b85a79dd343226983855825b7bdc555265d76d.camel@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
         <20201124043728.199852-22-damien.lemoal@wdc.com>
         <CAMuHMdWZX4_Y+4OdEQPJwqHd68OA4p0uw7KQfjVwgHgk0Q=brA@mail.gmail.com>
In-Reply-To: <CAMuHMdWZX4_Y+4OdEQPJwqHd68OA4p0uw7KQfjVwgHgk0Q=brA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2345aa19-fda1-4852-e16b-08d890d5d344
x-ms-traffictypediagnostic: CH2PR04MB6556:
x-microsoft-antispam-prvs: <CH2PR04MB655613053291B65910FBECA2E7FA0@CH2PR04MB6556.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0jLMTcWd9m/QNggcCEvQPjzqC5dgOLx5s4svYfihxDZ3H216krlbpQktMvSVEp3ovpGOHzpZB5NW4AlPMc7kgfX1fCGm/dO4PP/UXlIfXpPwitJj+ONibhf1VcEJO49uD/4JydPxvWiLZjjPFXru9rGLbkPCV+5g9YJQkO/mGUUuAaF2GrQy8c8KJcrVLY3zWCGrHqNPhUSpBNQ/M0WanU0A/JDDYofSUP0Uk9R6RygfBHiiC7bPmBCPbZsEBbnGU1Q2wpaZw0U4mgne555n8wWfd3VU5B5l0f9tgJnxxXEoUgnzLTJg5yB17J7bvOwuTZFQUWXTK1Wy8BWXfA5WA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(83380400001)(186003)(53546011)(6486002)(6506007)(66446008)(7416002)(5660300002)(4326008)(2616005)(2906002)(8936002)(4001150100001)(36756003)(71200400001)(86362001)(6512007)(6916009)(478600001)(91956017)(64756008)(54906003)(76116006)(66946007)(316002)(8676002)(66476007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ODNVZVdrcVBWSDdmRUlqY3lDOVJ2d2pVdWlhd0M4VkIzYzd1OEhVRFdlcGdz?=
 =?utf-8?B?YlRCekNxdWxYZEt0V0dHT2hwWGMvcnRFaGlxcXhwTk4yRUJIbjVQaTNMa2ZT?=
 =?utf-8?B?OTRuT3BQbjdENzlFcW85MVZWelVRRDhIMGtaUDNwQmxoZmNnOVAzeXYvT0Zr?=
 =?utf-8?B?ZXJOdDNjaEM0VnFZQXhLTzZ4MUVzT1VwV0UxT2ZRWmFrL0VLeHRLejZmTThP?=
 =?utf-8?B?bkZlVHJzeVdWKzBLUXNoaWJwYnp0a091ZkJMTEhkQXpIQ0c5LzZyLy9Sdzli?=
 =?utf-8?B?RVBhU3JBVE5ZSExTeGlrYllJc2Z3MXUxak81Um9JK0dDVXBDSHVWTXlRNDNK?=
 =?utf-8?B?TU51YlNjaExlTjNSaTRIZ1NkWU5YU3pDTEZ3NGFJaDE0dlNvNnF2Ky91UzJC?=
 =?utf-8?B?NnZGNlNpU3pib0FrT0wvc2NiK0pmR05QLzN6eXZrNG1OMEFQeUVlTDkvVW5W?=
 =?utf-8?B?STZMMDFVMVhoOTlyUmR3WE5nbWVLUi94aGVGdXdZN2xrM01tMjJsRUFsUWlU?=
 =?utf-8?B?R1U2ODk4SmY5UXM3elNEWW1TNWtKSGlGWGhxT2IwNTA3QjczeEtQK01pcWZv?=
 =?utf-8?B?czZwZFRXTmVoTzg5YU1YdUd4eVBiTUZ5aUFDdXQvdHd0eW1Jb0UrVFlyeGhD?=
 =?utf-8?B?UklLNFQwaGQxRy84R2VTalEra3lzZ2krUHRLZ2F6ZFZlc3Y1alpwSTdQUDNw?=
 =?utf-8?B?ODExMDVMMkpVZnlBOFJyd0NYS014c3MxQ05zUGxxaTA2c01qWXlwZ2c1d0Nm?=
 =?utf-8?B?NWxqU0l3TXpiYVgzc0Y2a1hMeGF4SXl1a0o3b2NudXlmc2t1cEJKMWl2Wnpp?=
 =?utf-8?B?QmpjcUJkL3R5aDViT3U5UGZXZWIyU0trUlJ6cVNObGNKNHBYNmVBb3ZXaEs2?=
 =?utf-8?B?cnJBSUJlWk5GVnpMbFlTMzlQTkVRRCs2cUVWNmR2Yk9iejFvQVl3dFdtUDlj?=
 =?utf-8?B?NU5Za2NFV3phVjFYODJnWitIV1lHL0JFOEo2MHRpZGgxbFdPYjd2SnUyeHBD?=
 =?utf-8?B?THpkcVhRc2hUcVRxcXBTQWNpdVhYS09yM1JBVno0dCtSaUpqdDd1cmw3S1NM?=
 =?utf-8?B?S3BMSXRnUGdjMURLaFZieHVlbzlaMGdMbTdpclNTNWQ3aGRKby9JR3VhaTdn?=
 =?utf-8?B?UE04VU1yZGpubnppeDlYUGNOaVBpY211WGp3bDZ3MXYzbk5kdmZQWTh3N0V0?=
 =?utf-8?B?VllDTGNuaUJaNzFLSzBNWlR5NWlZTXZlNlJWbUFBNkRDSlBMU3ZqWXV6QXJX?=
 =?utf-8?B?TW8weHhVWmZiTmt3THJFUU9DVDBhcGQ2NGdjaWVFdnVvZThweFB6MWh2N3l6?=
 =?utf-8?B?SzhQNkk3L3NYSThtblB6dVVLdFVwYUo3Y3h0OFVsVGlGNzcxQ05zTkxCWTJm?=
 =?utf-8?B?eTVuV0JpMUFVUy9ISmlyakUyNlZqM3RXcGMrVXllRnBuYS8wMXVkMFdZR0tq?=
 =?utf-8?Q?pJR9PJhS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F8BA3CDF62425428625334D25489934@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2345aa19-fda1-4852-e16b-08d890d5d344
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 00:05:31.8860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xhi8a4YdPkpXU9YWLpqsZNhxUGawYRRKTAD8acTNZ9DIASNhp21Y1x8R7fZx4jB+coVgYK2JEuOJMs5p5KFqVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6556
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTI0IGF0IDE5OjUxICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIERhbWllbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDI0LCAyMDIwIGF0IDU6MzkgQU0g
RGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+ID4gVGhlIG5v
bW11X2syMTBfZGVmY29uZmlnIGRlZmF1bHQgY29uZmlndXJhdGlvbiBhbGxvd3MgYm9vdGluZyBh
IEsyMTANCj4gPiBTb0MgYmFzZWQgYm9hcmQgdXNpbmcgYW4gZW1iZWRkZWQgaW50cmFtZnMgY3Bp
byBmaWxlLiBNb2RpZnlpbmcgdGhpcw0KPiA+IGNvbmZpZ3VyYXRpb24gdG8gZW5hYmxlIHN1cHBv
cnQgZm9yIHRoZSBib2FyZCBTRCBjYXJkIGlzIG5vdA0KPiA+IHRyaXZpYWwgZm9yIGFsbCB1c2Vy
cy4gVG8gaGVscCBiZWdpbm5lcnMgZ2V0dGluZyBzdGFydGVkIHdpdGggdGhpcw0KPiA+IGJvYXJk
LCBhZGQgdGhlIG5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyBkZWZhdWx0IGNvbmZpZ3VyYXRp
b24gZmlsZQ0KPiA+IHRvIHNldCBhbGwgY29uZmlndXJhdGlvbiBvcHRpb25zIG5lY2Vzc2FyeSB0
byB1c2UgdGhlIGJvYXJkIG1tYy1zcGkNCj4gPiBzZCBjYXJkIGZvciB0aGUgcm9vdCBmaWxlIHN5
c3RlbS4gVGhpcyBjb25maWd1cmF0aW9uIGFkZHMgc3VwcG9ydCBmb3INCj4gPiB0aGUgYmxvY2sg
bGF5ZXIsIHRoZSBtbWMtc3BpIGRyaXZlciBhbmQgbW9kaWZpZXMgdGhlIGJvb3Qgb3B0aW9ucyB0
bw0KPiA+IHNwZWNpZnkgdGhlIHJvb3RmcyBkZXZpY2UgYXMgbW1jYmxrMHAxIChmaXJzdCBwYXJ0
aXRpb24gb2YgdGhlIHNkIGNhcmQNCj4gPiBibG9jayBkZXZpY2UpLiBUaGUgZXh0MiBmaWxlIHN5
c3RlbSBpcyBzZWxlY3RlZCBieSBkZWZhdWx0IHRvIGVuY291cmFnZQ0KPiA+IGl0cyB1c2UgYXMg
dGhhdCByZXN1bHRzIGluIG9ubHkgYWJvdXQgNEtCIGFkZGVkIHRvIHRoZSBrZXJuZWwgaW1hZ2UN
Cj4gPiBzaXplLiBUaGUgZGVmYXVsdCBkZXZpY2UgdHJlZSBjb21waWxlZCBpbiBpcyB1bmNoYW5n
ZWQgYW5kIG11c3QgYmUNCj4gPiByZXBsYWNlZCBieSB0aGUgdXNlciB3aXRoIHRoZSBkZXZpY2Ug
dHJlZSBzdWl0YWJsZSBmb3IgdGhlIGJvYXJkIGJlaW5nDQo+ID4gdXNlZCAoazIxMF9tYWl4X2Jp
dCwgazIxMF9tYWl4X2RvY2ssIGsyMTBfbWFpeF9nbywgazIxMF9tYWl4ZHVpbm8gb3INCj4gPiBr
MjEwX2tkMjMzKS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFt
aWVuLmxlbW9hbEB3ZGMuY29tPg0KPiANCj4gV2hpbGUgZXh0MiBpcyBkZWZpbml0ZWx5IGNoZWFw
ZXIgdGhhbiBleHQ0ICh0aGUgbGF0dGVyIHRha2VzIGFsbW9zdCArMjAwDQo+IEtpQiwgdWdoKSwg
ZXh0MiBkb2VzIG5vdCBoYXZlIGpvdXJuYWxpbmcuDQoNClllcy4gV2l0aCBleHQ0LCBrZXJuZWwg
c2l6ZSBqdW1wcyBmcm9tIDEuNzggTUIgdG8gb3ZlciAyLjAwIE1CIChydjY0IGdjYyA5LjMpLg0K
RXZlbiB2ZmF0IGlzIG1vcmUgZXhwZW5zaXZlIHRoYW4gZXh0MiBpbiB0ZXJtcyBvZiBrZXJuZWwg
c2l6ZS4NCg0KPiBIZW5jZSB5b3VyIHJvb3QgZmlsZSBzeXN0ZW0gd2lsbCBiZSB1bmNsZWFuIGFs
bCB0aGUgdGltZSwgdW5sZXNzIHlvdSBhbHdheXMNCj4gbWFuYWdlIHRvIHVubW91bnQgaXQgYmVm
b3JlIHJlYm9vdC4gIEFuZCB5b3VyIGRlZmF1bHQgYnVpbGRyb290DQo+IGRvZXMgbm90IGhhdmUg
ZTJmc2NrLg0KDQpZZXMuIEkgd2FzIHVzaW5nIGVtYmVkZGVkIHJvb3RmcyBjcGlvIGZpbGUgdW50
aWwgSSBnb3QgdGhlIFNEIGNhcmQgd29ya2luZyB3aXRoDQpTZWFuJ3MgaGVscCwgc28gSSB3YXMg
bm90IGFkZGluZyBlMmZzY2sgdG8gc2F2ZSBzcGFjZS4gSSB3aWxsIGFkZCBpdC4NCkFzIGZvciB0
aGUgZnMgYmVpbmcgYWx3YXlzIHVuY2xlYW4gb24gbW91bnQsIEkga25vdywgdGhpcyBpcyBub3Qg
c3VwZXIgbmljZS4gSQ0KdGhpbmsgdGhhdCBhZGRpbmcgcm9vdGZsYWdzPW5vYXRpbWUgdG8gdGhl
IGJvb3QgcGFyYW1zIHdpbGwgaGVscCBpbiBhdm9pZGluZw0KdGhlIEZTIHRvIGJyZWFrLCBidXQg
dGhhdCBpcyBhIGxpdHRsZSB3ZWFrLiBGb3IgdXNlIGNhc2VzIHdoZXJlIHRoZSBTRCBjYXJkIGlz
DQp1c2VkIG9ubHkgZm9yIHJlYWRpbmcgYXBwbGljYXRpb25zL3NoZWxsIGNvbW1hbmRzLCBtb3Vu
dGluZyBybyBzaG91bGQgYmUgdGhlDQpmaXJzdCBjaG9pY2UsIHdoaWNoIG1heSBiZSBhIG1vcmUg
c2Vuc2libGUgZGVmYXVsdCBmb3IgdGhlIGRlZmNvbmZpZy4gSSB3aWxsDQp1cGRhdGUgdGhlIGRl
ZmNvbmZpZyB3aXRoIHRoYXQuDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgR2VlcnQNCj4gDQoN
Ci0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rlcm4gRGlnaXRhbA0K
