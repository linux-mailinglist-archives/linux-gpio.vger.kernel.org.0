Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39CB2AE993
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 08:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgKKHTw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 02:19:52 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:46683 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgKKHOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 02:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605078883; x=1636614883;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8jFsnilBrgBjW7u2uW8qNzVTukOmo516vZ7zpBR3W7A=;
  b=MRizpEfNjx8jpaKc9B9TIu6HHD1CIGbFDJXrXntA7/unTYlyRT1MDnVa
   LX4t+gWQi8bomXxfQiPghWAPHAsmg6nRXguQOeFM7YP+cQGqIwWi1ZFGN
   10NMtShnc7ZX02MNX84lCFMon0jswsJPGCr6900lmV5j5jgi38poX4Y6k
   lq2XoMHJCu+kqjivY6rXIzzSosk5wOH7FXGO5D3gwOi1KPt/WqowxK+iU
   7xGSbuyJWVRS15UgXIifa/PqxA3OG/vkDFu0O0Q+aaUg6C2/O3SXL6XB2
   HWXlUDqP6hYoHtG5KT2TOwEK3tgFvKgA+UUJBQlw5NRjNOTT34MHM92tQ
   g==;
IronPort-SDR: shW43v/76yCttxwP/z7445YFh7GIm490VfTGvqIfDUbfwTF8vSdhbTQh+LoEAiskFf0THl5sBM
 nbC5Jjc00Ez59a101xwULx0oH71ejuXvoTnok5uLqMQe2kw+IuhizYC/I5r7Tui5199OWwqdHh
 8Hf37YKc8/HSMQ3BdehP1FfsY+xZ1iDOgnrCot70YuUMPWkieAKrdUXa/WsHkYSSi7yPo3IAu3
 iT4wur/w7r5oSCPgPXild46iEREuVUfOBCZog7GcXOVr8TaIxErUSI1fHLLJ+NBz/P6Q9MGOni
 dYs=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="156846992"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 15:14:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFDx4P86xFR84CG6bQhH6bCfudEOzzU5zF/qy1ekzjswXfpMZBEw/A6m3p9iWRLTK9OU0ikZ4csEhsOxhHeoUGIWh0RZ1XBw6mV0OR15VsYc8CcFN/1qBLyt7MvsNyx/6+Cc1KPVAdS4Rr4TNVdn4bMrH0X/0z552k/Sy9XhnaaCLhV45Ye/n1fmoNI0va/z47BhzFeK7lqz6YNY6u5MyYMpwiO4SE2laqRQ6QGJbF2+P4Z4qyy5nc4Raj7RUE/VxrOauiAijtLAjdSYMudPMHPmxgWh+TbGp/Hm5O6/MiE8cHUDnPKheOEtdBNr+23uAh2NTD2rS7U7bGhnlOdi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jFsnilBrgBjW7u2uW8qNzVTukOmo516vZ7zpBR3W7A=;
 b=BqdZVtA7jB/NZQBEjGXZXi32jqiLwQWCD7/Lt8E4d9MsQZMccVrzcNSB8EaO7m+cOYNrLcfT+bFGk6/Ikdcoi8OOog2G88VarHXtUjKN1VTGnzGUGF+EgRztkDCrO5lWzeXzBClsb0YFxZivWAgb5geMrxXTzpRG4+9flv4D4hXTNjK5YFg+1l6yyfmRb0nvbVQXmXjWG7j+HtJcei0h6k5vtT3rw3oWHPx3r4SrgQlvR0sscyAYIXv8xIcvHJE+9I7qZ8ZVa5TTYvwvrNuA2aAX7LrXs4ftR7YbMp420BdlI060ugu9gCotX/5/z8sFQAXetnDgByVAV0JQh7195Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jFsnilBrgBjW7u2uW8qNzVTukOmo516vZ7zpBR3W7A=;
 b=yWbEJmUGd4bSTElJ7jdFpJelOpwFnfP0bWrJWVban5S6YP0R+HAihEhjf2nOSBknIaukhsegbkE1lr/tUmGtwV1B4neoF0Wd9++CNWHOJZu0ffkACUZERco1aVuqMZZkp33OUmjbzid/duvvzXd6qO/K6CAOzOOibNZQN7maubo=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6672.namprd04.prod.outlook.com (2603:10b6:208:1e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 07:14:42 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 07:14:42 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "michael@walle.cc" <michael@walle.cc>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Topic: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Index: AQHWtB8gKEjfkBkVokSF5N6+r8ArFKm691UAgAZ8wICAAAKtAIAAB+EAgAENwgA=
Date:   Wed, 11 Nov 2020 07:14:41 +0000
Message-ID: <302435518ea6264f544554df2c48a757a6838f2b.camel@wdc.com>
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
         <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
         <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
         <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
         <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
         <2ba78a0c9509a65de3155d5e90cc4744@walle.cc>
In-Reply-To: <2ba78a0c9509a65de3155d5e90cc4744@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91559f33-27a2-48a4-2903-08d8861175c0
x-ms-traffictypediagnostic: MN2PR04MB6672:
x-microsoft-antispam-prvs: <MN2PR04MB6672085A21F1ADFAA2436A8CE7E80@MN2PR04MB6672.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wEmQ8U+w5+H1Wbwc5+4worty8Gc4/QSCdtLuLPMUtfjqwE1O0DGJKByV77jyKi0KUV81Fuw7Rbav6gAR8dBZ44FYw9OHMMKZ7OWvTlyjT6vjLz/Rs5RT02r1F2KOgZS/OhgIkLkUW/PFycA1N9N1KXpYsr6Rzi5KlO4ywoUEZk5dO65e+k+AJd2tuH+OKROBYOoK+0+lugpVq4ReFAL1ZhM5Fgbube6GpkHvVp78OpZZCLhM3GP6PEIZJA03RyruHg6ba9rPo6jUDI3U6OWlAT0jnunCeg64SwHN3p5cDU4fZK94v8h1UGASVU/zjytP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(110136005)(54906003)(36756003)(83380400001)(2906002)(316002)(53546011)(6506007)(86362001)(66946007)(91956017)(186003)(76116006)(64756008)(71200400001)(5660300002)(66476007)(4001150100001)(8936002)(8676002)(66556008)(66446008)(2616005)(6512007)(4326008)(478600001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: jB+6mx6auZIs3TXcMeXZk1nG3n+5wTmSIcy2v/+GpjiGR+OHjOfULE8GnY4Sh8/Upwcm5JuLGPqucTs4Yl0NJBAl5H/cKgrm4Vv2QAPzw8czBQXEbDERZv8GCMNv246OgQLxyggcKeyYHdybAINEzy20Be2lbWqjShU9rS/AUUAeKHkQFzWIhf+hWnoJILxk1rd56S00vllwPUlmOdxEuH8UlZmx1m+gO5sagMSOQhFr76C8XP5Ak5GBDSWzvUgcfHKYLmJED6R1OJvJQxTIXERUZCc3SboNF91p7d9eX7iQcpdkwygdgM9AEUrIsamVqRON4sodP4nas2oMHOX1w8E2rvmvu9nWVn3u4RU0HToqJ46MnlIaoLMkMp3uwRtcnbJh8rUeHJrdRMA62I2dnqXn9eanpCYcwTslFBTibtpS5piiQK72oHNOrVwpRr2L6O85koUfL3xxcmCPbQJ7CYKFDNTCPVUnN5YTUN/2l8T2N4peWjtTr+LJuOua4CtwlWQCZ1yQ5As7WVnRpjd72O43sdavK5fH6sv8pBdOL77YkiVE3f44Qx1jHsAKGcZJmpeOZgp+Zy76BLPrD8IG1Njq3BroUdnCFbqlkgyOQ3qcgpV4bck12imMI8/A9O8fletSIAiUQTTHm9N6uTAC2l6+lVLz+9k+K2Y+Ow6TgsBGuXZFP5panzKS6OS2W1lSwTCXmv7MHNk9kiQ+bLMndA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF7F9C2DDE5779418FEA4FC615557243@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91559f33-27a2-48a4-2903-08d8861175c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:14:42.0068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BznC3APs4ahVZNuwilYO8tVqpMzMnVJAQzV/EoxqahMt8FEGm3/DX280GDt2OVy06drGOXsprI+eJVpeTKonyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6672
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTEwIGF0IDE2OjA5ICswMTAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0K
PiBBbSAyMDIwLTExLTEwIDE1OjQwLCBzY2hyaWViIEJhcnRvc3ogR29sYXN6ZXdza2k6DQo+ID4g
T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMzozMSBQTSBMaW51cyBXYWxsZWlqIA0KPiA+IDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBPbiBGcmksIE5vdiA2
LCAyMDIwIGF0IDEyOjI3IFBNIERhbWllbiBMZSBNb2FsIDxEYW1pZW4uTGVNb2FsQHdkYy5jb20+
IA0KPiA+ID4gd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gSXQgbWF5IG5vdCBiZSB0aGUgYmVzdCBp
bnRlcmZhY2UgZm9yIHJlZ3VsYXIgZW5kIHVzZXJzIHRvDQo+ID4gPiA+IG1hbmlwdWxhdGUgZ3Bp
b3MsIGJ1dCBpdCBpcyBkZWZpbml0ZWx5IHN1cGVyIHVzZWZ1bCBmb3IgZGV2ZWxvcGVycyB0byBk
byBxdWljaw0KPiA+ID4gPiB0ZXN0cyBvZiB0aGVpciBzZXR1cC9kcml2ZXJzICh3aGljaCBpcyB3
aGF0IEkgZGlkIGZvciBteSB3b3JrIHdpdGggdGhlIEtlbmRyeXRlDQo+ID4gPiA+IEsyMTAgUklT
Qy1WIFNvQyBzdXBwb3J0KS4NCj4gPiA+IA0KPiA+ID4gSXQgaXMgYSBiaXQgZGlzY291cmFnaW5n
IHRoYXQgUklTQy1WLCB3aGljaCB3YXMgaW52ZW50ZWQgYWZ0ZXIgd2UgDQo+ID4gPiBhbHJlYWR5
DQo+ID4gPiBvYnNvbGV0ZWQgdGhlIHN5c2ZzIEFCSSwgaXMgZGVwbG95aW5nIHRoaXMgZm9yIGRl
dmVsb3BtZW50IGFuZCB0ZXN0Lg0KPiA+ID4gDQo+ID4gPiBXZSBuZWVkIHRvIHRoaW5rIGFib3V0
IGEgc2ltaWxhciBmYWNpbGl0eSBmb3IgdXNlcnMgd2hpY2ggaXMgbGVzcw0KPiA+ID4gZGFtYWdp
bmcgYnV0IGZ1bGZpbHMgdGhlIHNhbWUgbmVlZHMuIEkgdGhpbmsgSSBzYXcgc29tZXRoaW5nIGEg
d2hpbGUNCj4gPiA+IGJhY2sgdGhhdCBsb29rZWQgcHJvbWlzaW5nIGFuZCBhZGRlZCBzb21lIGZ1
bmt5IGZpbGVzIGluIGRlYnVnZnMNCj4gPiA+IGluIGEgaGllcmFyY2hpY2FsIG1hbm5lciBwZXIt
Z3Bpb2NoaXAgaW5zdGVhZC4gVGhhdCBpcyBob3cgZGVidWdmcw0KPiA+ID4gc2hvdWxkIGJlIHVz
ZWQuDQo+ID4gPiANCj4gPiANCj4gPiBCYXNpY2FsbHkgc29tZXRoaW5nIGxpa2Ugd2hhdCBncGlv
LW1vY2t1cCBkb2VzIGZvciBldmVudHM/IFdhcyBpdA0KPiA+IHNvbWV0aGluZyBvdXQtb2YtdHJl
ZSBvciB3YXMgaXQgb24gdGhlIG1haWxpbmcgbGlzdD8NCj4gPiANCj4gPiBBbHNvOiBxdWljayB0
ZXN0cyBoYXZlIHRoZSB0ZW5kZW5jeSB0byBiZWNvbWUgbG9uZy10ZXJtIHNvbHV0aW9ucy4gOikN
Cj4gPiANCj4gPiBJcyBncGlvZ2V0L2dwaW9zZXQgZHVvIGRpZmZpY3VsdC9jdW1iZXJzb21lIHRv
IHVzZT8NCj4gDQo+IE5vLCBidXQNCj4gwqDCoCgxKSB5b3UgaGF2ZSB0byBrbm93IHRoYXQgaXQg
YWN0dWFsbHkgZXhpc3RzLiBUaGlzIG1pZ2h0IGJlIG9idmlvdXMgZm9yDQo+IMKgwqDCoMKgwqDC
oHlvdSwgYnV0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGV2ZXJ5IGVtYmVkZGVkIGRldmVsb3BlciBp
cyBhd2FyZSANCj4gdGhhdA0KPiDCoMKgwqDCoMKgwqB0aGVyZSBpcyBhY3R1YWxseSBhIHRvb2wg
dG8gY29udHJvbCBHUElPcyBmcm9tIHVzZXJzcGFjZS4gU28gYSANCj4gc2ltcGxlDQo+IMKgwqDC
oMKgwqDCoGZpbmQgL3N5cyAtbmFtZSAiKmdwaW8qIiBhbmQgZmlndXJlIG91dCBob3cgdG8gdXNl
IGl0IG1pZ2h0IGJlIGhpcw0KPiDCoMKgwqDCoMKgwqBmaXJzdCBjaG9pY2UuDQo+IMKgwqAoMikg
eW91IGhhdmUgdG8gaGF2ZSBpdCBpbnN0YWxsZWQuIElmIHRoZSByZWZlcmVuY2UgYm9hcmQgZG9l
c24ndCBjb21lDQo+IMKgwqDCoMKgwqDCoHdpdGggaXQgcHJlaW5zdGFsbGVkLCB0aGUgc3lzZnMg
aXMgdXN1YWxseSBlYXNpZXIgdG8gZ2V0IGdvaW5nDQo+IMKgwqDCoMKgwqDCoGJlY2F1c2UgaXRz
IGp1c3QgdGhlcmUuDQoNCllvdSBwZXJmZWN0bHkgZGVzY3JpYmVkIHdoYXQgaGFwcGVuZWQgdG8g
bWUgOikNCg0KPiA+IEl0J3MgYSBzZXJpb3VzDQo+ID4gcXVlc3Rpb24gLSBJIHdyb3RlIGl0IGlu
IGEgd2F5IHRoYXQgd2FzIGFzIHVzZXItZnJpZW5kbHkgYXMgcG9zc2libGUNCj4gPiBidXQgbWF5
YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGFib3V0IHN5c2ZzIHRoYXQgbWFrZXMgdXNlcnMgcHJl
ZmVyIGl0DQo+ID4gb3ZlciBhIGNvbW1hbmQtbGluZSB0b29sLiBUbyBtZSBzeXNmcyB3YXMgYWx3
YXlzIGEgUElUQSB3aXRoIHRoZQ0KPiA+IGdsb2JhbCBudW1iZXJzIGV0Yy4gYnV0IGl0IHN0aWxs
IHNlZW1zIHRvIHN0aWNrIHdpdGggb3RoZXJzLg0KPiANCj4gVGhhdCBpcyBjb3JyZWN0LCBhbmQg
SSBhY3R1YWxseSBmaW5kIGl0IGEgbG90IGVhc2llciB0byB1c2UgdGhhbiANCj4gZmlndXJpbmcN
Cj4gb3V0IHRoZSBzeXNmcyBudW1iZXJpbmcsIGVzcC4gaWYgeW91ciBEVCBjb250YWlucyBncGlv
IGxpbmUgbmFtZXMuIEJ1dA0KPiB0aGVyZSBhcmUgc3RpbGwgb2xkIGhhYml0cyAoYXQgbGVhc3Qg
aW4gb3VyIGNvbXBhbnkpLg0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwN
Cg==
