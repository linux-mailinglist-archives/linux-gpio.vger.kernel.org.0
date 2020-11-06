Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF522A9538
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 12:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKFL1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 06:27:25 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:64469 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFL1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 06:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1604662042; x=1636198042;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mXksMvXBeRfp6143uOqf+vqSruHhGbv8IX2dbWkpJQo=;
  b=cynhmuk2cPE+EP1T3FLhe9uUwQF4pZcSjKtZkEwIDoIpSLusmI83fsRd
   3dbr/DBDI+fcf5fkw+QvtdkzFDKl8bxz86bjFBKu50uK8Ck9AdyJdesqO
   QYsh2vvviddOvYbMv8USO7DT7q6klzeTd5Xqpdw8Qq4cD4teQW+IVqfAe
   11MhvVKFU60ZtmWpKSUEb/0JzLvZgKlBbTDaFcoz3YfJWhYb4jtrHNLMH
   8bB+BQMNQCeIK0VyTcG4pmgIK/ICXYIC47mw4K+ZZfkaOMVdE8sQfI8Xb
   J7m6XvBoD6rfVDRF+ocKPsxjvKqfncl2rkj4wZMoQlLEKuqBKBg2uhOQn
   Q==;
IronPort-SDR: D5X5pEW6Xrhkw55980qjjIxwaC9gGl+u5fPELG2oXNMxJuCn+NQgH7NoJz+0aa/Shn/M4Y1GD1
 BNgTe2DVDbYMggd9P5YYohRruHxpGwxDJncDXW+LFHbIKPLZZzKxl9eAba0nVxix0q4O7lr9O1
 OwAFXKhM71YZcBJ3YhD5eNktHaymWBhjPFfYToMkvsu6w1VdYPup37+wPmExi+bRScKMdsyhgY
 Vqz12w0ZY5UmKNFrHu2h/r4CkaGKDlvqaSzs3AhUO5WFk4W0Y3JiB4nByAqGNrtJXz49WA4Hje
 CDk=
X-IronPort-AV: E=Sophos;i="5.77,456,1596470400"; 
   d="scan'208";a="156506937"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
  by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2020 19:27:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P38k6uSUsMjLW5SaXxzgQN2eI7JqP3grbn3LsLsN9qCSX9HGNeVCteggNAOVjsZ6xzik/LqyjwpYreonap7EOLBu7oi2k0ZCdu5mojQNSaa0T8syzxyg5ayWjoTJcLfeRQeMXDyqG+N7NwuDXO8ayZsSGdXhBdCwuR47dMGtZBnyOvvf+5+D15uWalmMbq9C3ChsEWwSU7Jajw1bVqLodPyELaHJE3pzw7FgF7RlpEpsr0RNrpINHz7nhMABAx5WtUoz7OgvBgml5q8585aH3IwTvag6oYCgItH4KMyyBPCmosK6k+Enlq85qvT57idMjtkntQBsENw4gAsk19qLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXksMvXBeRfp6143uOqf+vqSruHhGbv8IX2dbWkpJQo=;
 b=MCRelqqZAS1jklcstzxIPl359HF8dSkXtwGfLNXDULhQjZTp1Lxabgbbqs1SHUcY6tykM6TQwJMW7QGXrd+cdT/k9M7yNgtLsz4FskHfT1xS25LiNk8iEiJiVt/iz7yl6Dyo0S8UTQaVcfp8h/m0RZLwHniTzglfUa54Udfl8eTxcXr6ei3y+CmW18OUpdn4F/R63Aa0L2inm2eSVU0AfzFW/B7bt+uumWLazlRnDMsHbC/zqqfRdIevlFdRm18brJV30pw63vP5emsvzXSYPJzRRZ80+CrHdJYUVCp2x1Wh751hyZeiDuwtGJ17xB4NMhFklkgnVWU9E5PCMLbsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXksMvXBeRfp6143uOqf+vqSruHhGbv8IX2dbWkpJQo=;
 b=Vwz2HVITrV42WeKp17bqlTTCs3voxEqgN1+/VSGMWSR2dxynzvKRnK/qsUaVrTYqGWqBmS3+JWHujcIv1IH4kJQ3FFLKQEBD2UwncUbsQhpVVLT8D7MBkKLLUnqae646UjGwEUzdpoZZ0nALa46DxASOmTYFSwl6Wouzwovzp4M=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6515.namprd04.prod.outlook.com (2603:10b6:208:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 11:27:21 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:27:21 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Topic: [PATCH] gpio: Do not trigger WARN() with sysfs gpio
 export/unexport
Thread-Index: AQHWtB8gKEjfkBkVokSF5N6+r8ArFKm691UA
Date:   Fri, 6 Nov 2020 11:27:21 +0000
Message-ID: <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com>
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
         <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 276398b4-3488-48a3-2bc1-08d88246ed3e
x-ms-traffictypediagnostic: BL0PR04MB6515:
x-microsoft-antispam-prvs: <BL0PR04MB6515D24AE938D5FE7C0945D0E7ED0@BL0PR04MB6515.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICdJW3brH9tByeSG9YRMoCZ37vMlhr9KkPKMX46BVKb2/r1QZO1aRuD2pXkV0vLTzmMv4sttihG9ulSDhaMLc2GlotS80fvcdr9PdT5/vXHa1puGLKSrKmyDSKQZV5OoxQuXVg4pnyBiWCfH5DTkLGivvjZyPUSLOkP0vidyeWgqOa4I9fZqqTL2TNTwg/ln2gpR2YJt2SWrzwfdnLktB45u2ebqr6V9PnYoW7cO4iG0YikZh5HLowwNPHVtR0kGkokRym9s+mkWzATJtrJBGv50WkqlFXpyFKd1agSSFeZstrAlAtFCnTSU2nhfEJXyvoo+kSKUWwHNjutTq/8QNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(316002)(4326008)(54906003)(83380400001)(53546011)(2616005)(6486002)(36756003)(2906002)(6512007)(8676002)(66476007)(64756008)(76116006)(66556008)(6916009)(66946007)(186003)(86362001)(8936002)(71200400001)(6506007)(66446008)(5660300002)(91956017)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: nLcYjd0lUgv/sxZuH4LQqLQkI+lKnM5zv+9DEwss2z/p1UPAhWLrMMz5eF32c8pKUyyisqMK/OW9sVH591rEMLA72OALzTMeIlpzRix9BZOrF1P6oXk2MkvLtK8CPokQ2BczPN7RO/rZu+eVJlsapvoZxvrxjdOJEGPrI/f53yF8ilajvlksOGCIkW1mJVW0+eLEGlf6LfrJiayi9OOhdcz5Cp1nh0Jul345ee4Yxj8qRKNwpxfkwNO0OowY1ZQTepmzllJdLNTjuT3YPjCAPXQCSGYXG0RLNhn65wvJB75wL8+xO1cClaZ712tVUM855dcpVcqpgYbvZRd4IBZumVZiHkGxSJYptzjj1r3b47EW5OB6bTHwZSntsZXRu5ESJrXiyWr6Uv6Rib2Sfwbi5m7XeaqW97U6Ip1ZqHSma620YZHcqe5Ab+YBAsbw8196SCiuHn33Bb67PYDPt4JX4WVeqzuohApgtQhIyRuIEZkGXlDmJCaJMyjwlwVdvfpxvYA6VRHlM349vCt5MpFpxCckOCVXs02Ar/pOwXD/M1K3uTs8EL+YHZE+pxbdSNPbt7eRP/JnwN5/+DiZk9p+21mSOjFi82154UvWLF7vhKvpywRrhStR0nq08AYMYlYfMYnrBLTfEqFV08PtL/+K0Dd0PH8Z5Wtu6T28b4XE7YMuAtduz1NdvW5vmmoiasobeygmJpUV6VG8Wu86Cqj3VA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D40148A91901D742BA83A2EBA08A04E3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276398b4-3488-48a3-2bc1-08d88246ed3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 11:27:21.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rf27g18Kp77ztmfluhAmRvTrc894IUVJM0rIF72vdX03EVET+65j/Puy6draixvYnhUPax8s7CsK2y+Bqy3eSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6515
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDIwLTExLTA2IGF0IDEwOjI3ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBXZWQsIE5vdiA0LCAyMDIwIGF0IDEyOjUzIFBNIERhbWllbiBMZSBNb2FsIDxk
YW1pZW4ubGVtb2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IElmIGEgdXNlciB0cmllcyB0
byBleHBvcnQgb3IgdW5leHBvcnQgYW4gaW52YWxpZCBncGlvIChlLmcuIGdwaW8gbnVtYmVyDQo+
ID4gPiA9IEFSQ0hfTlJfR1BJT1MpLCBncGlvX3RvX2Rlc2MoKSB3aWxsIHRyaWdnZXIgYSByZWdp
c3RlciBkdW1wIHRocm91Z2ggYQ0KPiA+IFdBUk4oKSBjYWxsLiBBdm9pZCB0aGlzIHJhdGhlciBz
Y2FyeSBlcnJvciBtZXNzYWdlIGJ5IGZpcnN0IGNoZWNraW5nIHRoZQ0KPiA+IHZhbGlkaXR5IG9m
IHRoZSBncGlvIG51bWJlciBiZWZvcmUgY2FsbGluZyBncGlvX3RvX2Rlc2MoKSBpbg0KPiA+IGV4
cG9ydF9zdG9yZSgpIGFuZCB1bmV4cG9ydF9zdG9yZSgpLiBUaGUgdXNlciBnZXRzIGEgbm9ybWFs
IGVycm9yDQo+ID4gbWVzc2FnZSB0byBzaWduYWwgaGlzL2hlciBlcnJvciB3aXRob3V0IGFueSBw
b3NzaWJsZSBjb25mdXNpb24gd2l0aCBhDQo+ID4ga2VybmVsIGJ1Zy4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgZHJpdmVycy9ncGlvL2dwaW9saWItc3lzZnMuYyB8IDExICsrKysrKystLS0tDQo+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1zeXNmcy5jIGIvZHJpdmVy
cy9ncGlvL2dwaW9saWItc3lzZnMuYw0KPiA+IGluZGV4IDcyOGY2YzY4NzE4Mi4uYjZmZDBkODI3
NTdhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLXN5c2ZzLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1zeXNmcy5jDQo+ID4gQEAgLTMsNiArMyw3IEBADQo+
ID4gwqAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9kZXZp
Y2UuaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9zeXNmcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvZ3Bpby5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gPiDC
oCNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPg0KPiA+IEBAIC00NTYsMTQgKzQ1NywxNSBAQCBzdGF0aWMgc3NpemVfdCBleHBv
cnRfc3RvcmUoc3RydWN0IGNsYXNzICpjbGFzcywNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29uc3QgY2hhciAqYnVm
LCBzaXplX3QgbGVuKQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBsb25nICAgICAgICAg
ICAgICAgICAgICBncGlvOw0KPiA+IC0gICAgICAgc3RydWN0IGdwaW9fZGVzYyAgICAgICAgKmRl
c2M7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZ3Bpb19kZXNjICAgICAgICAqZGVzYyA9IE5VTEw7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoGludCAgICAgICAgICAgICAgICAgICAgIHN0YXR1czsNCj4gPiAN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0ga3N0cnRvbChidWYsIDAsICZncGlvKTsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKHN0YXR1cyA8IDApDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIGRvbmU7DQo+ID4gDQo+ID4gLSAgICAgICBkZXNjID0gZ3Bpb190
b19kZXNjKGdwaW8pOw0KPiA+ICsgICAgICAgaWYgKGdwaW9faXNfdmFsaWQoZ3BpbykpDQo+ID4g
KyAgICAgICAgICAgICAgIGRlc2MgPSBncGlvX3RvX2Rlc2MoZ3Bpbyk7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoC8qIHJlamVjdCBpbnZhbGlkIEdQSU9zICovDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
ICghZGVzYykgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJfd2Fybigi
JXM6IGludmFsaWQgR1BJTyAlbGRcbiIsIF9fZnVuY19fLCBncGlvKTsNCj4gPiBAQCAtNTAzLDE0
ICs1MDUsMTUgQEAgc3RhdGljIHNzaXplX3QgdW5leHBvcnRfc3RvcmUoc3RydWN0IGNsYXNzICpj
bGFzcywNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQ0KPiA+IMKgew0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBsb25nICAgICAgICAgICAgICAgICAgICBncGlvOw0KPiA+IC0g
ICAgICAgc3RydWN0IGdwaW9fZGVzYyAgICAgICAgKmRlc2M7DQo+ID4gKyAgICAgICBzdHJ1Y3Qg
Z3Bpb19kZXNjICAgICAgICAqZGVzYyA9IE5VTEw7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGludCAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1czsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Rh
dHVzID0ga3N0cnRvbChidWYsIDAsICZncGlvKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHN0
YXR1cyA8IDApDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGRvbmU7
DQo+ID4gDQo+ID4gLSAgICAgICBkZXNjID0gZ3Bpb190b19kZXNjKGdwaW8pOw0KPiA+ICsgICAg
ICAgaWYgKGdwaW9faXNfdmFsaWQoZ3BpbykpDQo+ID4gKyAgICAgICAgICAgICAgIGRlc2MgPSBn
cGlvX3RvX2Rlc2MoZ3Bpbyk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIHJlamVjdCBib2d1cyBj
b21tYW5kcyAoZ3Bpb191bmV4cG9ydCBpZ25vcmVzIHRoZW0pICovDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGlmICghZGVzYykgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJf
d2FybigiJXM6IGludmFsaWQgR1BJTyAlbGRcbiIsIF9fZnVuY19fLCBncGlvKTsNCj4gPiAtLQ0K
PiA+IDIuMjguMA0KPiA+IA0KPiANCj4gSG93IGFib3V0IHdlIGNoYW5nZSB0aGF0IHRvIGFuIHVu
Y29uZGl0aW9uYWwgV0FSTigpIGV2ZXJ5dGltZSB0aGUgdXNlcg0KPiB0cmllcyB0byBleHBvcnQg
YSBHUElPIG92ZXIgc3lzZnMgc28gdGhhdCBwZW9wbGUgc3dpdGNoIG92ZXIgdG8gdGhlDQo+IGNo
YXJhY3RlciBkZXZpY2U/DQo+IA0KPiBJJ20gam9raW5nIGEgYml0IGJ1dCBJIHRoaW5rIGl0J3Mg
dGltZSB0byBzdGFydCBkaXNjb3VyYWdpbmcgcGVvcGxlDQo+IGZyb20gdXNpbmcgc3lzZnMgYW5k
IGEgd2FybmluZyBtYXkgYmUgYSBnb29kIHN0YXJ0Lg0KDQpJIGFtIGFsbCBmb3IgYSBnb29kIHBy
X3dhcm4oKSB0byB0ZWxsIHRoZSB1c2VyICJ5b3Ugc2NyZXdlZCB1cCIuIEFkZGluZyBhbm90aGVy
DQp3YXJuaW5nIGFsb25nIHRoZSBsaW5lcyBvZiBwcl93YXJuKCJQbGVhc2UgcHJlZmVyIHVzaW5n
IC9kZXYvZ3Bpb1hYIGluc3RlYWQgb2YNCnN5c2ZzXG4iKSBpcyBwcm9iYWJseSBhbiBvcHRpb24g
dG9vLg0KDQpCdXQgYSBXQVJOX09OKCkgd2l0aCBpdHMgcmVnaXN0ZXIgJiBzdGFjayBkdW1wIGlz
IHRvbyBtdWNoIGluIG15IG9waW5pb24uIFdoZW4NCkkgaGl0IHRoYXQsIEkgdGhvdWdodCAiQ3Iu
cCwgYW5vdGhlciBidWcuLi4iIGFuZCAzMHMgaW52ZXN0aWdhdGlvbiBtYWRlIG1lDQpyZWFsaXpl
IHRoYXQgSSBkaWQgYW4gImVjaG8gNTEyID4gL3N5cy9jbGFzcy9ncGlvL2V4cG9ydCIgdG8gZXhw
b3J0IGdwaW8gIzcgb2YNCm15IGJvYXJkIGNvbnRyb2xsZXIgd2hpY2ggaGFzIGEgYmFzZSBvZiA1
MDQuIFRoZSB0eXBpY2FsIG9mZi1ieS1vbmUgYnJhaW4gYnVnDQo6KQ0KDQpIZW5jZSB0aGUgcGF0
Y2ggSSBzZW50LiBJdCBrZWVwcyB0aGUgcHJfd2FybiBmb3IgdXNlciBtaXN0YWtlcyBsaWtlIEkg
ZGlkLCBBTkQNCmtlZXBzIHRoZSBtb3JlIHNlcmlvdXMgV0FSTl9PTigpIGZvciBpbnRlcm5hbCBi
YWQgdXNhZ2Ugb2YgZ3BpbyBudW1iZXJzLg0KDQpBcyBmb3IgdGhlIHN5c2ZzIGludGVyZmFjZSwg
SSB3b3VsZCBhcmd1ZSB0aGF0IGl0IGlzIGFscmVhZHkgb3B0aW9uYWwgdGhyb3VnaA0KQ09ORklH
X0dQSU9fU1lTRlMuIEl0IG1heSBub3QgYmUgdGhlIGJlc3QgaW50ZXJmYWNlIGZvciByZWd1bGFy
IGVuZCB1c2VycyB0bw0KbWFuaXB1bGF0ZSBncGlvcywgYnV0IGl0IGlzIGRlZmluaXRlbHkgc3Vw
ZXIgdXNlZnVsIGZvciBkZXZlbG9wZXJzIHRvIGRvIHF1aWNrDQp0ZXN0cyBvZiB0aGVpciBzZXR1
cC9kcml2ZXJzICh3aGljaCBpcyB3aGF0IEkgZGlkIGZvciBteSB3b3JrIHdpdGggdGhlIEtlbmRy
eXRlDQpLMjEwIFJJU0MtViBTb0Mgc3VwcG9ydCkuIFdlIG1heSB3YW50IHRvIGVuZm9yY2UgYSBw
b2xpY3kgb2YgaGF2aW5nIGFyY2gNCmRlZmNvbmZpZ3Mgbm90IGVuYWJsaW5nIHRoaXMgb3B0aW9u
IGJ5IGRlZmF1bHQsIGFuZCByZWNvbW1lbmQgdGhhdCBkaXN0cm9zDQpkaXNhYmxlIGl0IGlmIG5l
ZWRlZCB0b28uIEJ1dCBzdWNoIGRpc2N1c3Npb24gaXMgSSB0aGluayBiZXlvbmQgdGhlIHBvaW50
IG9mDQp0aGlzIHBhdGNoLg0KDQo+IA0KPiBCYXJ0b3N6DQoNCi0tIA0KRGFtaWVuIExlIE1vYWwN
Cldlc3Rlcm4gRGlnaXRhbA0K
