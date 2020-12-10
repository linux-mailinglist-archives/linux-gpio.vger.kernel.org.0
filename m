Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8207F2D5AAB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 13:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgLJMhl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 07:37:41 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2481 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLJMhk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 07:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607603859; x=1639139859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KcEgHwqpNJ6mcZywPNRmiX9gPhpTm/5iGpRS8+Rw64w=;
  b=m0sWdU+b0u4anOUjamoPRauVaaKFo84QHSCnZAEIjZWC5RbVlXGNv4oW
   v2HPbw2iRR9xjBr8bRRU2umej555sJep/S49sabTWE0eC0Dh8qHGbLxsF
   Uzsmm0/eyXpLcv3BD1QBrYyxMmqaVBKbDdT5OWw5AMNiXLSXjgDAqGY6F
   Vricc6Lq36Wly5csrUn0LmAOrb8+anVPJX7pWTTMF8YYLlyS9kqusstIx
   6JsmH7jCJJe1NHDkcfBZ+WOIsUiW/c1bYB4y8Lw6jRmbCBnZts0+UtdC+
   xjrEP9NPP4zGZkKPXEBMh0C6vMB3qhbEx7s5tsHRarBcsOKdWsmXd/kwh
   A==;
IronPort-SDR: Jva4OHMzOAjqfmWreMHrBxtQX9XQAb/LxfGjQID7VH+1FQdl3eKJXjrfGJbLznM7aBjXec1uOR
 KtVTw5RjtVPy/n3TFiD/90wgNc4ahGukuS4a7bolpg3/oPGv5Pn0A1ks/Xz4hu+DQMyS+JUpWU
 R+D4wFZeeFE3DELvGCsKbQhqN2YsJeDtdRh1G+K8X60Ioo4GJcmnrVFUTlUdI2ynDhNPJ7iEAC
 TKkySVmY6634SJCYzD9+/AucdLZJFJaqE5DKZDzuMn6kWFVuaW5V48XeHaz7qapMjnnJUc7F3S
 4uY=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="154841550"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 20:36:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvhJk21m4X/yQpB2uFpMygtN9iYhDpfyyTSqQDHo/9acFrLb7x5kdcQLmgo44UQQYDYpK5XI0tu3SK94dKcfhQlaoADdDuApZQxLh/ICCTFCsT6GH8tggAUpZcQ91RYvZFTy3h27yvrKZKabXsaRdFhphziQm2w73EFv1dS2HsYRFJoocbcoMU6CD6TnxBpPibTMxMttV7CfRrYg6F7v0FVQNkzLWNo4z7v1gsLgf/+1WwUAB42wd2+02kQ+/ib88vkHKpV1LH59/B1cllV7MwVI2225FvOIAWRre0AMceOVGxmQVUVDKP4Ea9BO8hHDprA1i2LtRq0/o7KSoG1xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcEgHwqpNJ6mcZywPNRmiX9gPhpTm/5iGpRS8+Rw64w=;
 b=oDI3fbtq0jtHx/Oj6EOyGK4zqRmRxnD1rKBqNl7Ofl0LnzTG9KG1sgHHGINKLg8z1WEebo51jtwRTLGt3GlNJZOGKtEDnh6o/Tgi1u7qfKKdYX9QgYIwDsjEigjoTG0KfY+azF8ah08v9TJ+07Lp2bNMOaQtx1U9uRai160g/yLTu5eTNz4c03NKta9CVsInZTuRHpMLy2bvEBAITJmwJibishSgFwSoqcV51ovpd4cObEu6Tce13HwwrWuJXPSD4NBRwj788kxmIljnkljzuTUeoupgRfwRcNSWEQ0gur3mHfoE6IBh/HYfDxxBQymktv/YKg7vwkY3LwyTe14Yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcEgHwqpNJ6mcZywPNRmiX9gPhpTm/5iGpRS8+Rw64w=;
 b=kBZW5RJXuz1FhmQbcgHwg2g1FWyrWDRweule301Nx7XfGRm4Mp3z3xR69PrvyUn+854xLMuqF2yZmJ13LcZbDCX5WpnrfeZHh16TeqkYCud466b2YSZtICYJ6rKikNOO0hillar+isn/HiRQ4na/diRk0peml6a8VlIcl+tNr68=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6823.namprd04.prod.outlook.com (2603:10b6:610:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 12:36:31 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 12:36:31 +0000
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
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Index: AQHWzqYvKtn7lzf0bUaGE16+bO2s46nwGoKAgAAqW4A=
Date:   Thu, 10 Dec 2020 12:36:30 +0000
Message-ID: <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
         <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 016b52b0-251e-4a44-e44d-08d89d0838c6
x-ms-traffictypediagnostic: CH2PR04MB6823:
x-microsoft-antispam-prvs: <CH2PR04MB6823C76524D67DACBEBC6F71E7CB0@CH2PR04MB6823.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hE/9FSrZ4A+48ZzcG1MBT+UikR8U7CJJejKBALdgfeui9Q3cQxAYLgZ38YUEs8QfSh5VuWjzcIsHSoVi56Uszmx863dBv/a+/qQE3qI/aGJefbg+ccZ5kUHgvt72Pe9qmoESM/mQ4VpLFaDMr4NBl+wWl3kbZbmGwg0mgldT2k2q+8PTj5zUaaNPrX5MyAR/HGlI3T3In2iqMORAq0aIr+oq9QP99RNfjTkaERHVbbcjbUHaoR1gPd2K1MPa7CFxv5OG+uayvN7cyGmiePdH50LB3SUBWf2/4ZHa48kBDqMxtkz3E2AC6WZtE55hhTsufnIdaWqgrK2IeJQVj3msHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(2906002)(6916009)(6512007)(6506007)(186003)(54906003)(2616005)(83380400001)(91956017)(76116006)(53546011)(6486002)(508600001)(66446008)(66476007)(66946007)(66556008)(64756008)(8676002)(36756003)(71200400001)(86362001)(7416002)(4326008)(4001150100001)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjFsQzJudWR2bjNkQ3o0Tmk2eERrL2tYY1FpcHBnc1hkR2hpZCtEZWxCazVw?=
 =?utf-8?B?SXZTS3dDUkpYMklyYkJzSEl2Ni9rZjNoQlp0UmhwV3g0MVlnc1p4L216OTg5?=
 =?utf-8?B?UkN0QzJTN050ZFdueCtxYlBlNHErYUVMZG93aTd6ZVpweFR6eC91czJhdWc1?=
 =?utf-8?B?OEVncEczR1NMMGtCVklVcThydmo0SGhpMUo1SlVxQzlpb045ajRKd3N6VHpo?=
 =?utf-8?B?VUZmSnhVMlk5dDhIZDBJR0JNNVdvQW1rUkozb1VMQm9YWndvSTh3NHd1bnYw?=
 =?utf-8?B?WkROQTltMHhyeXdld2JiTTNEUERwQkVjd0dremVONkFZNkpWTjVXUlpzcHFE?=
 =?utf-8?B?aElaUENRRWtKNHIrTkFhRGpuQk15U3hvZ0dzWFBRb21rbWd1ellzSWR0dVlZ?=
 =?utf-8?B?d1dnUGQ0KytmTEREMzIyanZHUDY1SVh3anh6aHQvd3RqbVJnRnkvYkc2enhx?=
 =?utf-8?B?WTZJbGxROWlqa1NVUXprYjRBb01qVmJuNlA1bHBQWHM4ZWpydTdJUk5taEVn?=
 =?utf-8?B?ajBia2tvcG9vM1lGc0dsUS9TVTBSRlhaZ1JPVmEzVVVld3RGS3Fla0lYR1g2?=
 =?utf-8?B?NDk5SDcwakNPb01Ua0JIQTh3ZGxIWW9sNy9vQ3o2ZG1TVkNiUnN0cWg5b01p?=
 =?utf-8?B?T29kalJ1MlduWWFyanM0VjhxZk9qY2l1MTgzTWVvcDhhaFA1b3ZUTnB0QzNO?=
 =?utf-8?B?TXU1MGpaK0swS1VMR1FOSkFFU1Z4aWRIZW01cURTUGN5V3grczZHQ3Zad3JX?=
 =?utf-8?B?WkRnZExTbDR6QmEwbXlCMDNkanJuUXlpQmxtSWdqK3IzSjlnNFEyWVVzVEgr?=
 =?utf-8?B?bnRjcXBRNGFSaEsyM2FqdVhhcFFyTXUxbm1VbVYrQlhGanoxTXA5YTN5amVY?=
 =?utf-8?B?bGJ2c0oxVWZQa01zRFFtVGhma3dhYVZrQzVEaTBSZjJUditsYStvSXNTNTh3?=
 =?utf-8?B?d0VYTlNPbDRTc0RGK25nYUs5QlpJS0c2ZzNiNDZ6Vk9sMlRETTkvOWFkdG93?=
 =?utf-8?B?TDZKNFU0VVcvMTdFZzU4WHo4dDg0U2QwOGxmc3g0V0p0VUMzQTNYcnRtQi95?=
 =?utf-8?B?Y2NucXMzUitFaXNGNkx2TGh4Rjk4enB2OEpDRUF3bFNwMXhkQ1NBTHBGbkt3?=
 =?utf-8?B?cU9IOWI3d0NUTHh3UTA2S2ovTG1jR3hLZkllNzNOUktwZkc2Zy9FRE5uZ1Ns?=
 =?utf-8?B?eXhKUmF6RUZYejdlZEZhUmRMS2lEeWN4ZkVjUHVOSlhFem5sc0RUamYwalg1?=
 =?utf-8?B?dFpnVHJZNUY3SDAyVG9iRDcrM2xvNzdZL0lqNWlSYTUrY205Y1FGcUhoTmdr?=
 =?utf-8?B?ZzBubGtvT090cDJJZTFXQXFpWTBvU3p3aUhUd0hKaUR1azVDT1BtVmFhMCtQ?=
 =?utf-8?B?Slo3UDlydnFsZERURUFFbTFmY0lwQWNTek5WZWdTekhvM3BnTXBQajIweElF?=
 =?utf-8?Q?cKRPF1e+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E498C932070DFF47BA0A5681877ACBE2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016b52b0-251e-4a44-e44d-08d89d0838c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 12:36:31.0086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tlcstwbh6cJJ2OOsXvO83kPBAgSkzI57hhG44cmy9ftyWEIns5yLUOsrJ7X2/cbVa8HLcd/fN+UB3gt1+plUUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6823
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDExOjA0ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIERhbWllbiwNCj4gDQo+IE9uIFRodSwgRGVjIDEwLCAyMDIwIGF0IDQ6NDEgQU0g
RGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+ID4gQ2hhbmdl
cyBmcm9tIHY2Og0KPiA+ICogQW5ub3RhdGUgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB2YXJpYWJs
ZXMgd2l0aCBfX3JlZmRhdGEgdG8gYXZvaWQNCj4gPiDCoMKgc2VjdGlvbiBtaXNtYXRjaCBjb21w
aWxhdGlvbiBlcnJvcnMNCj4gDQo+IEJsaW5kbHkgZm9sbG93aW5nIHRoZSBhZHZpY2UgZnJvbSBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4gaXMNCj4gbm90IGFsd2F5cyBhIGdvb2Qg
aWRlYToNCj4gDQo+IMKgwqDCoMKgVGhlIHZhcmlhYmxlIGsyMTBfcnN0X2RyaXZlciByZWZlcmVu
Y2VzDQo+IMKgwqDCoMKgdGhlIGZ1bmN0aW9uIF9faW5pdCBzZXRfcmVzZXRfZGV2aWNlcygpDQo+
IMKgwqDCoMKgSWYgdGhlIHJlZmVyZW5jZSBpcyB2YWxpZCB0aGVuIGFubm90YXRlIHRoZQ0KPiDC
oMKgwqDCoHZhcmlhYmxlIHdpdGggb3IgX19yZWZkYXRhIChzZWUgbGludXgvaW5pdC5oKSBvciBu
YW1lIHRoZSB2YXJpYWJsZToNCj4gDQo+IElmIHlvdXIgZHJpdmVyJ3MgcHJvYmUgZnVuY3Rpb24g
aXMgYW5ub3RhdGVkIHdpdGggX19pbml0LCB5b3UgY2Fubm90DQo+IGhhdmUgYSBwb2ludGVyIHRv
IGl0IGluIHRoZSBkcml2ZXIgc3RydWN0dXJlLCBhcyBhbnkgYmluZGluZyBkb25lIGFmdGVyDQo+
IHRoZSBmcmVlaW5nIG9mIGluaXRtZW0gd2lsbCBjYXVzZSBhIGNyYXNoLiAgQWRkaW5nIHRoZSBf
X3JlZmRhdGEgbWVyZWx5DQo+IHN1cHByZXNzZXMgdGhlIHdhcm5pbmcsIGFuZCB3b24ndCBhdm9p
ZCB0aGUgY3Jhc2guDQoNCkhtbS4uLiBJIG11c3QgYmUgbWlzdW5kZXJzdGFuZGluZyBzb21ldGhp
bmcgaGVyZS4gZnJlZV9pbml0bWVtKCkgaXMgY2FsbGVkIGZyb20NCmtlcm5lbF9pbml0KCkgcmln
aHQgYmVmb3JlIHN0YXJ0aW5nIHRoZSB1c2VyIGluaXQgcHJvY2Vzcy4gVGhhdCBpcyBsYXRlIGVu
b3VnaA0KdGhhdCBhbGwgZHJpdmVycyBhcmUgYWxyZWFkeSBwcm9iZWQgYW5kIGluaXRpYWxpemVk
LiBBdCBsZWFzdCB0aGF0IGlzIHdoYXQgSQ0KdGhvdWdodCwgZXNwZWNpYWxseSBjb25zaWRlcmlu
ZyB0aGF0IG5vbmUgb2YgdGhlIGsyMTAgZHJpdmVycyBjYW4gYmUgbW9kdWxlcw0KYW5kIGFyZSBh
bGwgYnVpbHRpbi4gV2hhdCBhbSBJIG1pc3NpbmcgaGVyZSA/IA0KDQo+IFRoZXJlIGFyZSB0d28g
c29sdXRpb25zIGZvciB0aGlzOg0KPiDCoMKgMS4gUmVtb3ZlIHRoZSAucHJvYmUgcG9pbnRlciwg
YW5kIHVzZSBwbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBpbnN0ZWFkDQo+IMKgwqDCoMKgwqBvZiBw
bGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoKS4NCj4gwqDCoMKgwqDCoFRoaXMgZ3VhcmFudGVlcyB0
aGUgcHJvYmUgbWV0aG9kIHdpbGwgYmUgY2FsbGVkIG9ubHkgb25jZSwgYmVmb3JlDQo+IMKgwqDC
oMKgwqBpbml0bWVtIGlzIGZyZWVkLCBidXQgZG9lcyBtZWFuIHRoYXQgcHJvYmUgZGVmZXJyYWwg
Y2Fubm90IHdvcmsuDQo+IMKgwqAyLiBEcm9wIHRoZSBfX2luaXQgYW5ub3RhdGlvbi4NCj4gwqDC
oMKgwqDCoFRoaXMgbWVhbnMgdGhlIHByb2JlIG1ldGhvZCBjYW4gYmUgY2FsbGVkIGFueXRpbWUs
IGFuZCBzdXBwb3J0cw0KPiDCoMKgwqDCoMKgYm90aCBwcm9iZSBkZWZlcnJhbCBhbmQgZHJpdmVy
IHVuYmluZC9yZWJpbmQgY3ljbGVzLg0KPiANCj4gR2l2ZW4gdGhlIGxpbWl0ZWQgYW1vdW50IG9m
IFJBTSBvbiBrMjEwLCBJIHRoaW5rIG9wdGlvbiAxIGlzIHByZWZlcnJlZCwNCj4gYnV0IG1heSBy
ZXF1aXJlIGNhcmVmdWwgdHVuaW5nIG9mIHRoZSBpbml0aWFsaXphdGlvbiBvcmRlciB1c2luZw0K
PiAqX2luaXRjYWxsKigpLCB0byBtYWtlIHN1cmUgcHJvYmUgZGVmZXJyYWwgd29uJ3QgZXZlciBi
ZSBuZWVkZWQuDQoNCkkgcmVhbGx5IHdvdWxkIHByZWZlciB0byBhdm9pZCB0aGUgKl9pbml0Y2Fs
bCgpIGRhbmNlLiBUaGF0IGlzIG5vdCBwcmV0dHkuDQpTaW1wbHkgcmVtb3ZpbmcgdGhlIF9faW5p
dCBhbm5vdGF0aW9uLCBJIHNlZSA3NjYgcGFnZXMgZnJlZSB3aXRoICJjYXQNCi9wcm9jL3Ztc3Rh
dCIgcmlnaHQgYWZ0ZXIgYm9vdCwgYW5kIHRoZSBzYW1lIG51bWJlciB3aXRoIF9faW5pdCB0b28u
Li4gU28gaXQNCmRvZXMgbm90IGxvb2sgbGlrZSB0aGUgaW1wYWN0IGlzIHNpZ25pZmljYW50LiBU
aGUgYmlnZ2VzdCBwcm9iZSBmdW5jdGlvbiBpcyBmb3INCnRoZSBjbG9jayBkcml2ZXIgYW5kIHRo
aXMgb25lIHNlZW1zIGZpbmUgd2l0aCBfX2luaXQgc2luY2UgaXQgdXNlcw0KQ0xLX09GX0RFQ0xB
UkUoKS4gSSBkbyBoYXZlIGEgZG91YnQgYWJvdXQgdGhpcyBub3cgdGhvdWdoLiBMb29raW5nIGF0
IG90aGVyDQpkcml2ZXJzLCBhbGwgc2VlbSB0byBoYXZlIHRoZSBfX2luaXQgYW5ub3RhdGlvbiBm
b3IgdGhlaXIgY2xvY2sgZHJpdmVyIGluaXQNCmZ1bmN0aW9uLg0KDQpTbyBJIHRoaW5rIEkgd2ls
bCBnbyB3aXRoIG9wdGlvbiAyLiBJdCBpcyBzaW1wbGVyIGFuZCBzYWZlci4gV2UgY2FuIGFsd2F5
cw0KcmV2aXNpdCBhbmQgb3B0aW1pemUgbGF0ZXIuIEkgd291bGQgcHJlZmVyIHRoaXMgc2VyaWVz
IHRvIGxhbmQgZmlyc3QgOikNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHZWVydA0KPiANCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLS0gTGludXMgVG9ydmFsZHMN
Cg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=
