Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E9A2AE9A5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 08:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgKKHUz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 02:20:55 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16880 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgKKHUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 02:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605079253; x=1636615253;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/ccA8fGIGb783hErOSSFuQh5QUB+I07Lk7dVaPcxn0M=;
  b=Lgz/K3AlDKQYeGvgevfsHd9gdn/o0EW7VMJQ0FfiO8Q4xZnJgv2HIMnt
   fyb11mxGSvZ3NegYraaRegai1UyGQQnLRpMu6I/lBiCJrf6IJgmbdlRzA
   rYJ2YGPct7GRASwerlpG7bYjqHWEc/kxY3EBXoTJoqdT12j4kxVB9+uhO
   /MKZH4VhvDVhSoo45iNArCjGq+w27cPbcUhyVsgeS+M2ArOaw6K0ERwdn
   tTaQBqGNIMquiiZ3Xse5Gn4XmjIZ61fZru0oU+sd7reGLsHoDs4uVQqLq
   wS283pQBYz9WVEBgNn0/6392zL1qJEeBXYkIcPUddnFvv4IvDNPOZp89r
   w==;
IronPort-SDR: TY1sS70OG2NYXhKZIJdJzHppvfYXgom6zyWIaWTcji1XRp2bqS/iBvsTxAdkDc66jVbvZ/qC9H
 emHV9N9bvRa5ssw80C2MI0RtK37eCz5ImepcinzSAvJiWklbhHChi7LAbQF2e3YyJZtLmiKE1i
 DzK2xIzD7WgZgc6i1utT5IbkHGVE9ng+iSkElZW6TiKK2E88QKiWj2IB7t0mxGv2kZgGvDtr6o
 jdSqf+Om3wrZr2sG8gl2P7Ku5kNeTm5XJjU6L4Z7BkzPiWSluWsQKjgOtxWW0/gIAsOUU2homY
 DOY=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="152461564"
Received: from mail-cys01nam02lp2057.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.57])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 15:20:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHZ0bWkbEc8hCrMN0fC/f5LM6vfcU+LzEgtuqdzkzfWRgqcRS1gCu0a4+cPt0ncNkRwNBkXtkAd9413eJP2QnRWgbvNJH8PYQf1BsiOWnKXPnQHsr9PH0Xv11AUUfNUb5jODhlf+A5WPMXez+gJTFaJgVALFLH41/579oMvYvzmePdB08BmTCjyCtSFZtiNIjg+KG/qFaxxq3ewp+rZ8eXnX7SVLe/Dcjow4UKTyxqRItaWorYtBGn21oyGsXtJi9Ses6rb425s4Qed5pD70FHWWvdMJcGGun1DJVB8PKlKaCdFSQbXCdP+qvSIn5GpWgU/qDJW3J6NgwAlficIlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ccA8fGIGb783hErOSSFuQh5QUB+I07Lk7dVaPcxn0M=;
 b=Je4vkOhp9Evu6Rt96LmKeP9CdHQy7XnEeXDdMbULjUpnnvp4iHN4XJP71AVopKfQlGkPY26qM2uYDlhXIlMJtuwX0IwMYFPId2Uy/f+MIWXV8R/9c1qPMwLzP0HbhR43hbS33wjCctFZ175ngb7SKcVNO3nHzc3lNnVCMUNK9c9lA1hhHPccrpkfQtzYKG7R1jGVejTKlfPLecmS03d6HhNbtwu6BSKKoX09j9CpU8IeFbUrlYrPCos1lmtV/wJ5R2cgHNIv08RmLCu0ldAaEl9ELarvuo2MQ9Mb1oqF7Wzbbkp4TxgHXNanAUt5cX+LiWKgVN3BFLOy7gp1+YBJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ccA8fGIGb783hErOSSFuQh5QUB+I07Lk7dVaPcxn0M=;
 b=PQQ+NLca28s5fT+vz3vs0yx/K4lnmWtcRsD4FFv4X/ZyrMeiIto8ulsASdiuiBduCpKUe3NDH0BNFJXtAlgVnPi0i2pyuVHvFFQSbdMpU4CZ/LaN/EqkuekSRgUfwMvm/vGpX//rfypWwEfvFA3sPSXeLUJoowxJ7x1k5E0r/sI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7007.namprd04.prod.outlook.com (2603:10b6:208:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 07:20:52 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 07:20:52 +0000
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
Thread-Index: AQHWtB8gKEjfkBkVokSF5N6+r8ArFKm691UAgAZ8wICAAAKtAIAAB+EAgAEPfYA=
Date:   Wed, 11 Nov 2020 07:20:52 +0000
Message-ID: <2dc0737490e0f32b4870197df62bd0825d791b5a.camel@wdc.com>
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
x-ms-office365-filtering-correlation-id: eee2c2f4-2070-4022-5131-08d886125274
x-ms-traffictypediagnostic: MN2PR04MB7007:
x-microsoft-antispam-prvs: <MN2PR04MB700747B8F2B2C4FF8930D0C9E7E80@MN2PR04MB7007.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfFuoGAD1a7mC6pbueo0CY54yok5+0ySZxU1uBI37OUkU/czah4WE/XuzYgQSpGqD1m0tkpIOv0lrWc6zWOIjNo9urhcECBKQykFulijCY3XWidYmJs/ZmCOvNDp3noCYvBqdRom1VFZj04rrulvLBI0ETk4ZysYLAD8QPrzaDrmaq51vHS0NKNzkKJ9pzNdr+byZvu+LujwO0aUjGseli9PN7APg2K1tVj2DTyWcCpOiigiqZlR2ghIPCDrBKUavo9ofaqw8a33CnE4eFO0A5KEnn5ZSoNrQjmQvCdibemnO/UO2QRz6gN4oMTOJaR27jfrPl38YK8zj4vOcXMBmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(54906003)(91956017)(66476007)(64756008)(66556008)(110136005)(53546011)(316002)(5660300002)(4326008)(8676002)(2906002)(8936002)(478600001)(6486002)(66446008)(4001150100001)(71200400001)(2616005)(83380400001)(6512007)(6506007)(186003)(86362001)(36756003)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Nagqwx+Oyce6YqIX3RkLTO5v3vHZ93Byaoir2I4+z4TDnU5/d9C+DMk/7WEgAkgboGcq6T/Lrfic+KiBl30pxoR5SLsw40E0miOWJGN7Sutvk45d9xc1pEQS5B1QypYCGX08zvUqPOpaglBScCKjxQuYFSA91M3sj/cUD0hh9kEUqW3vl68e7cBkNDWn3m/BjPgqZkG88YqDMuGwYTSHs1Thb/+64nVNpltKZ+GOVOHkmDQtHfY8dS59UTdYfCzwIaSklbunW7gr2Ay/M+l0fcVSqpwJTmJ2i0XbysExFgnCQ0W+A5Q9TJmxfCRt+9b79KSTCGFRFv0tEgZWGCxQXyswneyXJLnkhoLqmjHhtdEN3yu2v1AXEiqXya/BXfFKEBHKqD9kOgSEcoVTzE1VCx8/XD6FxKxVnnrKbUEYRqRhTnLAsWUJFTvzShN3mMmCW0lNqCWYP2In2/a2E5m+R5nO+JSSfTG7NiFGrCnBeaLvwWF6EP2rrcXV+zQ7yAuhbtVQhHx7KMWbDmiYD1ZvA/6DPHtLjjErw2Pi62cwRhHgDdMU2ZTf6gazQIxnGHmpBB5Xr0yZ4c4N0esUiAKJxiSIh+G2nXpGEwpK3T/7jhr4iNQouXO7MTcgbhHKpyOhcPCywAfy6bKfIwaasPuBkStgKOEJjgkcP/0cJxoqcUJPb0rn2WzRcnYvi01wXb1s0xS9SjwZepBldMMyD7pnKw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E39D487236CD34D8AF9F29C9D72E549@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee2c2f4-2070-4022-5131-08d886125274
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:20:52.3220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwqlcmPo5n2iWII+LxsFLTtlVJNV6TytAiOVk2tsBS69D6GQ995hTD18K1p4lRJELFRQjJkfu6gCTvNG2vHY4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7007
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
IGp1c3QgdGhlcmUuDQoNCkZvcmdvdCB0byBhZGQ6IEkgd2FzIGtuZXcgdG8gdXNpbmcgZ3BpbyBp
biBMaW51eCBzbyBJIHN0YXJ0ZWQgZ29vZ2xpbmcgImhvdyB0byINCmFib3V0IGl0LiBBbmQgYWxs
IHRoZSB0b3AgaGl0cyBJIGdvdCBvbmx5IG1lbnRpb25lZCBzeXNmcy4gSSBhY3R1YWxseSBuZXZl
ciBzYXcNCmFueSByZWZlcmVuY2UgdG8gZ3Bpb3NldC9ncGlvZ2V0LiBUaGF0IGluY2x1ZGVzIHRo
ZSByZWZlcmVuY2VzIHRvIHRoZSBrZXJuZWwNCkRvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZ3Bp
by9zeXNmcy5yc3QsIHdoaWNoIGRvIG1lbnRpb24gdGhhdCBzeXNmcyBpcw0KZGVwcmVjYXRlZCAo
SSBzZWUgdGhhdCBub3cpLCBidXQgc3RpbGwgaGFzIHRoZSBleHBsYW5hdGlvbiB0ZXh0LiBNYXkg
YmUgdGhlDQpleHBsYW5hdGlvbiB0ZXh0IHNob3VsZCBiZSBtb3ZlZCB0byBzb21ldGhpbmcgbGlr
ZSBkb2N1bWVudGF0aW9uL2FkbWluLQ0KZ3VpZGUvb2Jzb2xldGUvLi4uIGFuZCBrZWVwIG9ubHkg
dGhlIHJlZmVyZW5jZSB0byB0aGUgbmV3IHRvb2xzIGFuZCBjaGFyIGRldiA/DQoNCg0KPiA+IEl0
J3MgYSBzZXJpb3VzDQo+ID4gcXVlc3Rpb24gLSBJIHdyb3RlIGl0IGluIGEgd2F5IHRoYXQgd2Fz
IGFzIHVzZXItZnJpZW5kbHkgYXMgcG9zc2libGUNCj4gPiBidXQgbWF5YmUgSSdtIG1pc3Npbmcg
c29tZXRoaW5nIGFib3V0IHN5c2ZzIHRoYXQgbWFrZXMgdXNlcnMgcHJlZmVyIGl0DQo+ID4gb3Zl
ciBhIGNvbW1hbmQtbGluZSB0b29sLiBUbyBtZSBzeXNmcyB3YXMgYWx3YXlzIGEgUElUQSB3aXRo
IHRoZQ0KPiA+IGdsb2JhbCBudW1iZXJzIGV0Yy4gYnV0IGl0IHN0aWxsIHNlZW1zIHRvIHN0aWNr
IHdpdGggb3RoZXJzLg0KPiANCj4gVGhhdCBpcyBjb3JyZWN0LCBhbmQgSSBhY3R1YWxseSBmaW5k
IGl0IGEgbG90IGVhc2llciB0byB1c2UgdGhhbiANCj4gZmlndXJpbmcNCj4gb3V0IHRoZSBzeXNm
cyBudW1iZXJpbmcsIGVzcC4gaWYgeW91ciBEVCBjb250YWlucyBncGlvIGxpbmUgbmFtZXMuIEJ1
dA0KPiB0aGVyZSBhcmUgc3RpbGwgb2xkIGhhYml0cyAoYXQgbGVhc3QgaW4gb3VyIGNvbXBhbnkp
Lg0KPiANCj4gLW1pY2hhZWwNCg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFs
DQo=
