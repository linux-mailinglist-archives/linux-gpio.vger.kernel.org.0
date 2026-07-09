Return-Path: <linux-gpio+bounces-39757-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3AzQGgvZT2qJpAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39757-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:23:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2D733CD1
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:23:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b=Yer6LXi1;
	dmarc=pass (policy=none) header.from=realtek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39757-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39757-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F11A3026CB1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00E943E4B9;
	Thu,  9 Jul 2026 17:22:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70042189F;
	Thu,  9 Jul 2026 17:22:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617766; cv=none; b=LdwcKI1WyDCvE/vOvdYL5XUH2sT+f5HGQClukZ1fFBvpH0jZk+WlcuZuuaHeVdyfg8ZHmqK9MfTsp2s6xdFeOtxvSdJnncyKEh0GPsbckPagF1oSgbu4JArwt6Kydy1WMwYFfL9jK4+TmH1frizRamjg5hP4C45fJ2XWygUcqnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617766; c=relaxed/simple;
	bh=PoUzza0XpGHJkzRol4/U6IB0G2HaXRU2VJNWN1R1uNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bbLP4BmzcRFoF20+g0JQNqyQGSq5dsssh9fnjoccYr+zFEqf9qK9qeDOUHuPvSXPtELKb1xnReM5/BmAufAl8mzT5pacTDxymOKllD9wW82j+G+HBZ6lt1be+WaDD8l14VYQjndMEyHjdr309k6WiBW4W6VBWclNsFoKzg31bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Yer6LXi1; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 669HL9vO43224228, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783617669; bh=PoUzza0XpGHJkzRol4/U6IB0G2HaXRU2VJNWN1R1uNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Yer6LXi1XyBFkO1fXVgnqmJyaFzCjdjhmS7+Bv/VtMiuLwDL8CR8YECy7N9mZWpT7
	 A5n6G2MNLhi6+M77AXUwg2k0Ue7ijM8P2xts24PCQ8ByUmvyAVCJMPd6BH7J7I9JZd
	 ATYVtcvo47EYdO/4Wfug6SrAgdNNrQkEOHShd/aY8coFLl3LzwdcVdAUOvJp3vgAum
	 T+Y/cIJPSG7sNzAwqbueNT0W7IbyQRpCRZKX9Wb6SGlh//Tv0cc+jBlPr1jJpdIGbk
	 SbU0QgZpRFvsjPNlbJj5Yj1QrTqpxS48oa3+QIWxh1ijwQldaeTptB5MyvV+qsBQrP
	 Vwl8MUmA1r2yQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 669HL9vO43224228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jul 2026 01:21:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 10 Jul 2026 01:21:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 10 Jul 2026 01:21:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 10 Jul 2026 01:21:09 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Jonathan Cameron <jic23@kernel.org>, "linusw@kernel.org"
	<linusw@kernel.org>
CC: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"wbg@kernel.org" <wbg@kernel.org>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "mwalle@kernel.org" <mwalle@kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
	"andy@kernel.org" <andy@kernel.org>, "dlechner@baylibre.com"
	<dlechner@baylibre.com>, =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
	<tychang@realtek.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Topic: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Index: AQHc4cATPP5CAXxOA0S9aBj6QrzqgrYJ8C6AgFvXxWA=
Date: Thu, 9 Jul 2026 17:21:09 +0000
Message-ID: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
	<20260512033317.1602537-4-eleanor.lin@realtek.com>
 <20260512153745.3ec68675@jic23-huawei>
In-Reply-To: <20260512153745.3ec68675@jic23-huawei>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39757-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:mwalle@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:linus.walleij@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,realtek.com:from_mime,realtek.com:email,realtek.com:mid,realtek.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EB2D733CD1

SGkgSm9uYXRoYW4gYW5kIExpbnVzLA0KDQpJdCdzIGJlZW4gYSB3aGlsZSBzaW5jZSB0aGlzIHRo
cmVhZCwgc29ycnkgZm9yIHRoZSBkZWxheS4NCkkgYWJhbmRvbmVkIHRoZSB2NC92NSBhcHByb2Fj
aGVzIGFuZCBkZWNpZGVkIHRvIGdvIGJhY2sgdG8gdGhlIHYzIGRlc2lnbiwNCnNvIEkgYW0gcmV0
dXJuaW5nIGhlcmUgdG8gZml4IHRoZSBwcm9ibGVtcyB5b3UgcG9pbnRlZCBvdXQgYmFjayB0aGVu
Lg0KDQo+IE9uIFR1ZSwgMTIgTWF5IDIwMjYgMTE6MzM6MTMgKzA4MDANCj4gWXUtQ2h1biBMaW4g
PGVsZWFub3IubGluQHJlYWx0ZWsuY29tPiB3cm90ZToNCj4gDQo+ID4gRXh0ZW5kIHRoZSByZWdf
bWFza194bGF0ZSBjYWxsYmFjayB3aXRoIGFuIG9wZXJhdGlvbiB0eXBlIHBhcmFtZXRlcg0KPiA+
IChncGlvX3JlZ21hcF9vcGVyYXRpb24pIHRvIGFsbG93IGRyaXZlcnMgdG8gcmV0dXJuIGRpZmZl
cmVudA0KPiA+IHJlZ2lzdGVyL21hc2sgY29tYmluYXRpb25zIGZvciBkaWZmZXJlbnQgR1BJTyBv
cGVyYXRpb25zLg0KPiA+DQo+ID4gQWxzbyBhZGQgd3JpdGUtZW5hYmxlIG1lY2hhbmlzbSBmb3Ig
aGFyZHdhcmUgdGhhdCByZXF1aXJlcyBzZXR0aW5nIGENCj4gPiB3cml0ZS1lbmFibGUgYml0IGJl
Zm9yZSBtb2RpZnlpbmcgR1BJTyBjb250cm9sIHJlZ2lzdGVycy4NCj4gPg0KPiA+IENvbnNlcXVl
bnRseSwgdXBkYXRlIGFsbCBleGlzdGluZyBkcml2ZXJzIHV0aWxpemluZyB0aGUgZ3Bpby1yZWdt
YXANCj4gPiBmcmFtZXdvcmsgKGFjcm9zcyBkcml2ZXJzL2dwaW8sIGRyaXZlcnMvaWlvLCBhbmQg
ZHJpdmVycy9waW5jdHJsKSB0bw0KPiA+IGFjY29tbW9kYXRlIHRoZSBuZXcgcmVnX21hc2tfeGxh
dGUgZnVuY3Rpb24gc2lnbmF0dXJlLg0KPiANCj4gV2hhdCBpcyB0aGUgcmVhc29uaW5nIGJlaGlu
ZCBzZXR0aW5nICptYXNrID0gMCBmb3IgdW5zdXBwb3J0ZWQgb3BlcmF0aW9ucz8NCj4gSWYgaXQg
aXMgYSBzcGVjaWFsIHZhbHVlIHdoeSBub3QganVzdCByZXR1cm4gYW4gZXJyb3IgY29kZSB0byBp
bmRpY2F0ZSBub3QNCj4gc3VwcG9ydGVkPyAgVGhpcyBzZWVtcyB0byBjb21lIGZyb20gdGhlIGFz
c3VtcHRpb24gdGhhdCB5b3Ugd2lsbCB3YW50IHRvIHwNCj4gdGhhdCB3aXRoIG1hc2tzIGZvciBh
bm90aGVyIG9wZXJhdGlvbi4NCj4gDQo+IEknbSBjb21pbmcgaW50byB0aGlzIGxhdGUgYnV0IHRv
IG1lIHRoZXJlIGxvb2sgdG8gYmUgYSBidW5jaCBvZiB1bmRvY3VtZW50ZWQNCj4gYXNzdW1wdGlv
bnMuIFdoeSBkbyB0aGUgb3BlcmF0aW9ucyBoYXZlIHRvIHNoYXJlIGEgcmVnaXN0ZXIgZm9yIGV4
YW1wbGU/DQo+IA0KPiBQZXJoYXBzIGFuIGludGVyZmFjZSB3aGVyZSB5b3UgcHJvdmlkZSBhIHNp
bmdsZSBvcGVyYXRpb24gZm9yIHdyaXRlX2VuYWJsZQ0KPiBhbmQgd2hhdGV2ZXIgZWxzZSBhbmQg
aGVuY2UgdCBoZXJlIGlzIG9ubHkgb25lICdyZWcnIHdvdWxkIHdvcmsgYmV0dGVyPw0KPiANCj4g
Pg0KPiA+IFN1Z2dlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVr
LmNvbT4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLXJlZ21hcC5jIGIv
ZHJpdmVycy9ncGlvL2dwaW8tcmVnbWFwLmMNCj4gPiBpbmRleCBkZWI5ZWViYjU4ZGUuLmM3NmVl
ZjIwZTQxMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1yZWdtYXAuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXJlZ21hcC5jDQoNCiguLi4pDQoNCj4gPg0KPiA+IEBA
IC0xODUsNyArMjE4LDcgQEAgc3RhdGljIGludCBncGlvX3JlZ21hcF9zZXRfZGlyZWN0aW9uKHN0
cnVjdA0KPiBncGlvX2NoaXAgKmNoaXAsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBib29sIG91dHB1dCkNCj4gPiB7DQo+ID4gICAg
ICAgc3RydWN0IGdwaW9fcmVnbWFwICpncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQo+
ID4gLSAgICAgdW5zaWduZWQgaW50IGJhc2UsIHZhbCwgcmVnLCBtYXNrOw0KPiA+ICsgICAgIHVu
c2lnbmVkIGludCBiYXNlLCB2YWwsIHJlZywgbWFzaywgd3Jlbl9tYXNrOw0KPiA+ICAgICAgIGlu
dCBpbnZlcnQsIHJldDsNCj4gPg0KPiA+ICAgICAgIGlmIChncGlvLT5yZWdfZGlyX291dF9iYXNl
KSB7DQo+ID4gQEAgLTE5OCw3ICsyMzEsMTIgQEAgc3RhdGljIGludCBncGlvX3JlZ21hcF9zZXRf
ZGlyZWN0aW9uKHN0cnVjdA0KPiBncGlvX2NoaXAgKmNoaXAsDQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT1RTVVBQOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0gICAgIHJldCA9IGdwaW8t
PnJlZ19tYXNrX3hsYXRlKGdwaW8sIGJhc2UsIG9mZnNldCwgJnJlZywgJm1hc2spOw0KPiA+ICsg
ICAgIHJldCA9IGdwaW8tPnJlZ19tYXNrX3hsYXRlKGdwaW8sIEdQSU9fUkVHTUFQX1NFVF9ESVJf
T1AsIGJhc2UsDQo+IG9mZnNldCwgJnJlZywgJm1hc2spOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICByZXQgPSBncGlv
LT5yZWdfbWFza194bGF0ZShncGlvLCBHUElPX1JFR01BUF9TRVRfRElSX1dSRU5fT1AsDQo+IGJh
c2UsIG9mZnNldCwgJnJlZywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
d3Jlbl9tYXNrKTsNCj4gDQo+IFdoYXQgY29uc3RyYWlucyB0aGVzZSB0d28gdG8gcHJvdmlkZSB0
aGUgc2FtZSB2YWx1ZSBiYWNrIGZvciByZWc/DQo+IFRvIG1lIGl0IHNlZW1zIGxpa2UgdGhlIHdy
aXRlIGVuYWJsZSBtaWdodCB3ZWxsIGJlIGluIGEgZGlmZmVyZW50IHJlZ2lzdGVyLg0KPiANCj4g
PiAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPg0KPiA+
IEBAIC0yMDcsNyArMjQ1LDcgQEAgc3RhdGljIGludCBncGlvX3JlZ21hcF9zZXRfZGlyZWN0aW9u
KHN0cnVjdA0KPiBncGlvX2NoaXAgKmNoaXAsDQo+ID4gICAgICAgZWxzZQ0KPiA+ICAgICAgICAg
ICAgICAgdmFsID0gb3V0cHV0ID8gbWFzayA6IDA7DQo+ID4NCj4gPiAtICAgICByZXR1cm4gcmVn
bWFwX3VwZGF0ZV9iaXRzKGdwaW8tPnJlZ21hcCwgcmVnLCBtYXNrLCB2YWwpOw0KPiA+ICsgICAg
IHJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZ3Bpby0+cmVnbWFwLCByZWcsIG1hc2sgfCB3cmVu
X21hc2ssDQo+ID4gKyB2YWwgfCB3cmVuX21hc2spOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGlj
IGludCBncGlvX3JlZ21hcF9kaXJlY3Rpb25faW5wdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwN
Cg0KTXkgaW5pdGlhbCBkZXNpZ24gaW5kZWVkIGFzc3VtZWQgdGhhdCB0aGUgV1JFTiBtYXNrIGFu
ZCBEYXRhIG1hc2sgcmVzaWRlIGluDQp0aGUgc2FtZSByZWdpc3Rlci4NCiANClJlZ2FyZGluZyBX
UkVOIHN1cHBvcnQsIGVzcGVjaWFsbHkgaWYgV1JFTiBhbmQgRGF0YSB1c2Ugc2VwYXJhdGUgcmVn
aXN0ZXJzLCBJDQpjYW1lIHVwIHdpdGggdGhyZWUgaWRlYXMuIFdoaWNoIGRpcmVjdGlvbiBkbyB5
b3UgcHJlZmVyPw0KIA0KQXBwcm9hY2ggMTogUHJvdmlkZSBDdXN0b20gQ2FsbGJhY2tzIGluIGNv
bmZpZyAoTGV0IGNvbnN1bWVyIGRyaXZlciBoYW5kbGUgaXQpDQpXZSBjYW4gYWRkICcuc2V0JyBh
bmQgJy5zZXRfZGlyZWN0aW9uJyBmdW5jdGlvbiBwb2ludGVycyBpbg0KJ3N0cnVjdCBncGlvX3Jl
Z21hcF9jb25maWcnLiBJZiBhIGRyaXZlciByZXF1aXJlcyBXUkVOLCBpdCBjYW4gaW1wbGVtZW50
IHRoZXNlDQpjYWxsYmFja3MgaXRzZWxmLg0KIA0Kc3RhdGljIHZvaWQgZ3Bpb19yZWdtYXBfc2V0
KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQsIGludCB2YWwpDQp7
DQogICAgICAgIHN0cnVjdCBncGlvX3JlZ21hcCAqZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGNo
aXApOw0KIA0KICAgICAgICAvKiBJZiB0aGUgZHJpdmVyIHByb3ZpZGVzIGEgY3VzdG9tIHNldCAo
dG8gaGFuZGxlIFdSRU4pLCBkZWxlZ2F0ZSB0byBpdCAqLw0KICAgICAgICBpZiAoZ3Bpby0+c2V0
KSB7DQogICAgICAgICAgICAgICAgZ3Bpby0+c2V0KGNoaXAsIG9mZnNldCwgdmFsKTsNCiAgICAg
ICAgICAgICAgICByZXR1cm47DQogICAgICAgIH0NCiAgICAgICAgLyogLi4uIGV4aXN0aW5nIGdl
bmVyaWMgcmVnbWFwIGxvZ2ljIC4uLiAqLw0KfQ0KDQpQcm9zOiBDbGVhbiBjb3JlLCBubyBuZWVk
IHRvIHRvdWNoIGV4aXN0aW5nIGRyaXZlcnMnIHhsYXRlIHNpZ25hdHVyZS4gVGhlIGNvbnN1bWVy
DQpkcml2ZXIgaGFuZGxlcyBpdHMgb3duIGxvY2tpbmcgZm9yIGRpZmZlcmVudCByZWdpc3RlcnMu
DQpDb25zOiBJdCBmZWVscyBhIGJpdCBzdHJhbmdlIGFuZCBpbmNvbnNpc3RlbnQgdG8gZXhwb3Nl
IG9ubHkgJy5zZXQnIGFuZA0KJy5zZXRfZGlyZWN0aW9uJyBvdmVycmlkZXMgd2hpbGUga2VlcGlu
ZyBvdGhlciBvcGVyYXRpb25zIGVudGlyZWx5IGFic3RyYWN0ZWQuDQogDQpBcHByb2FjaCAyOiBI
YW5kbGUgc2VwYXJhdGUgV1JFTiByZWdpc3RlciBpbiB0aGUgY29yZSAod2l0aCBsb2NraW5nIGNv
bmNlcm5zKQ0KV2Uga2VlcCB0aGUgJ1hYX1dSRU5fT1AnIGluICd4bGF0ZScuIElmIHNvbWVvbmUg
bmVlZHMgV1JFTiBhbmQgJ3dyZW5fcmVnICE9IHJlZycsDQp3ZSB3cml0ZSB0byBib3RoLg0KIA0K
c3RhdGljIGludCBncGlvX3JlZ21hcF9zZXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWdu
ZWQgaW50IG9mZnNldCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCB2YWwpDQp7DQog
ICAgICAgIC8qIHNraXAgKi8NCiAgICAgICAgcmV0ID0gZ3Bpby0+cmVnX21hc2tfeGxhdGUoZ3Bp
bywgR1BJT19SRUdNQVBfU0VUX1dSRU5fT1AsIGJhc2UsIG9mZnNldCwgJndyZW5fcmVnLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3Jlbl9tYXNrKTsNCiAgICAgICAgaWYg
KHJldCA9PSAtRU5PVFNVUFApDQogICAgICAgICAgICAgICAgaGFzX3dyZW4gPSBmYWxzZTsNCiAg
ICAgICAgZWxzZSBpZiAocmV0KQ0KICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQogDQogICAg
ICAgIHJldCA9IGdwaW8tPnJlZ19tYXNrX3hsYXRlKGdwaW8sIEdQSU9fUkVHTUFQX1NFVF9PUCwg
YmFzZSwgb2Zmc2V0LCAmcmVnLCAmbWFzayk7DQogDQogICAgICAgIGlmIChoYXNfd3JlbiAmJiBy
ZWcgPT0gd3Jlbl9yZWcpIHsNCiAgICAgICAgICAgICAgICBtYXNrIHw9IHdyZW5fbWFzazsNCiAg
ICAgICAgICAgICAgICBtYXNrX3ZhbCB8PSB3cmVuX21hc2s7DQogICAgICAgICAgICAgICAgaGFz
X3dyZW4gPSBmYWxzZTsNCiAgICAgICAgfQ0KIA0KICAgICAgICBpZiAoaGFzX3dyZW4pDQogICAg
ICAgICAgICAgICAgcmV0ID0gcmVnbWFwX3NldF9iaXRzKGdwaW8tPnJlZ21hcCwgd3Jlbl9yZWcs
IHdyZW5fbWFzayk7IA0KDQogICAgICAgIC8qIGlnbm9yZSBpbnB1dCB2YWx1ZXMgd2hpY2ggc2hh
ZG93IHRoZSBvbGQgb3V0cHV0IHZhbHVlICovDQogICAgICAgIGlmIChncGlvLT5yZWdfZGF0X2Jh
c2UgPT0gZ3Bpby0+cmVnX3NldF9iYXNlKQ0KICAgICAgICAgICAgICAgIHJldCA9IHJlZ21hcF93
cml0ZV9iaXRzKGdwaW8tPnJlZ21hcCwgcmVnLCBtYXNrLCBtYXNrX3ZhbCk7DQogICAgICAgIGVs
c2UNCiAgICAgICAgICAgICAgICByZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZ3Bpby0+cmVnbWFw
LCByZWcsIG1hc2ssIG1hc2tfdmFsKTsNCiANCiAgICAgICAgcmV0dXJuIHJldDsNCn0NCiANClBy
b3M6IEtlZXBzIGFsbCBXUkVOIGxvZ2ljIHVuaWZpZWQgaW5zaWRlIHRoZSBjb3JlIGZyYW1ld29y
ay4NCkNvbnM6IEludHJvZHVjZXMgYSBsb2NraW5nIGlzc3VlLiB3cml0aW5nIHRvICd3cmVuX3Jl
ZycgYW5kIHRoZW4gJ3JlZycgcmVxdWlyZXMgYW4NCmV4dGVybmFsIGxvY2sgdG8gYmUgYXRvbWlj
LCB3aGljaCBzZWVtcyB0byBkZWZlYXQgdGhlIHB1cnBvc2Ugb2YgcmVseWluZyBvbiByZWdtYXAn
cw0KaW50ZXJuYWwgbG9jay4gDQoNCkFwcHJvYWNoIDM6IEFzc3VtZSBXUkVOIGFuZCBEYXRhIGFs
d2F5cyBzaGFyZSB0aGUgc2FtZSByZWdpc3Rlcg0KDQpzdGF0aWMgaW50IGdwaW9fcmVnbWFwX3Nl
dChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBpbnQgdmFsKQ0K
ew0KICAgICAgICAvKiAuLi4gKi8NCiAgICAgICAgcmV0ID0gZ3Bpby0+cmVnX21hc2tfeGxhdGUo
Z3BpbywgR1BJT19SRUdNQVBfU0VUX1dSRU5fT1AsIGJhc2UsIG9mZnNldCwgJnJlZywgJndyZW5f
bWFzayk7DQogICAgICAgIGlmIChyZXQgPT0gLUVOT1RTVVBQKQ0KICAgICAgICAgICAgICAgIHdy
ZW5fbWFzayA9IDA7DQogICAgICAgIGVsc2UgaWYgKHJldCkNCiAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Ow0KIA0KICAgICAgICByZXQgPSBncGlvLT5yZWdfbWFza194bGF0ZShncGlvLCBHUElP
X1JFR01BUF9TRVRfT1AsIGJhc2UsIG9mZnNldCwgJnJlZywgJm1hc2spOw0KIA0KICAgICAgICBy
ZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZ3Bpby0+cmVnbWFwLCByZWcsIG1hc2sgfCB3cmVuX21h
c2ssIG1hc2tfdmFsIHwgd3Jlbl9tYXNrKTsNCiAgICAgICAgcmV0dXJuIHJldDsNCn0NCiANClJl
Z2FyZGluZyB0aGlzIGFwcHJvYWNoLCBJIHdvdWxkIGxpa2UgdG8gYXNrIGZyb20geW91ciBleHBl
cmllbmNlOiBJcyBpdA0KYWN0dWFsbHkgY29tbW9uIGZvciBoYXJkd2FyZSBkZXNpZ25zIHRvIHBs
YWNlIFdSRU4gYW5kIERhdGEgYml0cyBpbiBjb21wbGV0ZWx5DQpkaWZmZXJlbnQgcmVnaXN0ZXJz
IGZvciBHUElPIG9wZXJhdGlvbnM/DQoNCklmIHRoZXkgcHJhY3RpY2FsbHkgYWx3YXlzIHNoYXJl
IHRoZSBzYW1lIHJlZ2lzdGVyLCB0aGlzIHNpbXBsZXIgYXBwcm9hY2ggbWlnaHQNCnN1ZmZpY2Uu
DQogDQpCZXN0IFJlZ2FyZHMsDQpZdSBDaHVuIExpbg0K

