Return-Path: <linux-gpio+bounces-35863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIM9O0Mo82mwxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:00:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAF4A0656
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D26B130157A7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC263ACA42;
	Thu, 30 Apr 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="NwZJC/mT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18F3A784F;
	Thu, 30 Apr 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543189; cv=none; b=R/+Vc3Wi+DwTf3QWkwnICCi5GD9JACYq4Uyq9b+s+c40Unm4Tpg5swcg/teSCB6VCUcWmhQ9zzHDDmOr9LiBzMSZt7MQabpDac2GBtwvCqoK28dMXQjZrDgH1fFOVaozwQkyVkSGfJHeaVKm+DLIac9wo65u0Sc6C8i2Q00KwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543189; c=relaxed/simple;
	bh=+PGDIxkpcitFk3yLOUpMLWWFaNQfol7INw0g6Bklar0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n1iDChMJeBgeSExEwBDJCXMyUy82LrQwAUAdDvi+sPqdP9GRPiycYPd96vvO8ppIVREV1pyX7dl08RhwRR7QL/PWNaEEHaQN/Zle0LweNfujshC9jyW79aV9YJfGTuEq+XcPHIpyiR+8UVzfXX+qH0En3XUOCSoAv3DS+/LM03Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=NwZJC/mT; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63U9wfSuB1879409, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777543122; bh=+PGDIxkpcitFk3yLOUpMLWWFaNQfol7INw0g6Bklar0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NwZJC/mTMxTRTZUMTBjWN37oEC+vNkdq0deXPNha41fcFgkGRgCngtpJR9uqtGNJR
	 ZnsZ4i5ZGnOII7v3UemrYBPgpbRDS5ReFZgRztOen7+k2y2CzKeJfieZ+JhAw0V+89
	 KR6svOyb5LyuZnSHv/+nFmm6JtW7OGlQ/oY53z0rGQqzP1YBLPPilwtewWchP6RGAX
	 LQ8+3Mr8r++al5olme9f0PmY/vSFVOkmyeTPhq+M7bPx5R9hDk6Yv74Ooi5b5z7cQz
	 Gp+0uocs1Nkzmbvq+9vDXya3//x/jGF72iW+11DF/7lZE/+9WbSdfOvyyQBd/TXh07
	 U6OymJwWbZiFw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 63U9wfSuB1879409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 17:58:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 30 Apr 2026 17:58:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Thu, 30 Apr 2026 17:58:42 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: RE: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Topic: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Index: AQHcxwLHJ5/eWVH9pU2ZY37QYpQGurXUP0uAgAPMV8CADmSzAIAAqFqAgBBo1aA=
Date: Thu, 30 Apr 2026 09:58:42 +0000
Message-ID: <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
In-Reply-To: <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 62CAF4A0656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-35863-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

SGkgTGludXMgYW5kIE1pY2hhZWwsDQoNCj4gSGksDQo+DQo+IE9uIFN1biBBcHIgMTksIDIwMjYg
YXQgMTE6MTkgUE0gQ0VTVCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPiBIaSBZdS1DaHVuLA0K
PiA+DQo+ID4gT24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMTE6MznigK9BTSBZdS1DaHVuIExpbiBb
5p6X56WQ5ZCbXQ0KPiA+IDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4g
Pj4gV2UgZGlkIGxvb2sgaW50byBncGlvLW1taW8gYW5kIGdwaW8tcmVnbWFwLCBidXQgdGhleSBh
cmUgbm90IHF1aXRlIHN1aXRhYmxlIGZvcg0KPiA+PiBvdXIgcGxhdGZvcm0gZHVlIHRvIHRoZSBz
cGVjaWZpYyBoYXJkd2FyZSBkZXNpZ246DQo+ID4+DQo+ID4+IDEuIFBlci1HUElPIERlZGljYXRl
ZCBSZWdpc3RlcnM6IFVubGlrZSB0eXBpY2FsIEdQSU8gY29udHJvbGxlcnMgdGhhdCBwYWNrIDMy
IHBpbnMNCj4gPj4gaW50byBhIHNpbmdsZSAzMi1iaXQgcmVnaXN0ZXIgKDEgYml0IHBlciBwaW4p
LCBvdXIgaGFyZHdhcmUgdXNlcyBhIGRlZGljYXRlZCAzMi1iaXQNCj4gPj4gcmVnaXN0ZXIgZm9y
IGVhY2ggaW5kaXZpZHVhbCBHUElPLiBUaGlzIHNpbmdsZSByZWdpc3RlciBjb250cm9scyB0aGUN
Cj4gPj4gaW5wdXQvb3V0cHV0IHN0YXRlLCBkaXJlY3Rpb24sIGFuZCBpbnRlcnJ1cHQgdHJpZ2dl
ciB0eXBlIGZvciB0aGF0IHNwZWNpZmljIHBpbi4NCj4gPg0KPiA+IElzbid0IHRoYXQgYXR0YWlu
YWJsZSBieToNCj4gPg0KPiA+IC0gc2V0dGluZyAubmdwaW9fcGVyX3JlZyB0byAxIGluIHN0cnVj
dCBncGlvX3JlZ21hcF9jb25maWcNCj4NCj4gV2hpY2ggaXMganVzdCB1c2VkIGJ5IHRoZSBncGlv
X3JlZ21hcF9zaW1wbGVfeGxhdGUoKSBhbnl3YXkuIFNvIGl0DQo+IGRvZXNuJ3QgcmVhbGx5IG1h
dHRlci4gQnV0IHllYWgsIDEgd291bGQgYmUgdGhlIGNvcnJlY3QgdmFsdWUgaGVyZSwNCj4gYXNz
dW1pbmcgdGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBjb25zZWN1dGl2ZS4NCj4NCj4gPiAtIGV4dGVu
ZCAucmVnX21hc2tfeGxhdGUgY2FsbGJhY2sgd2l0aCBhbiBlbnVtIGZvciBlYWNoIG9wZXJhdGlv
bg0KPiA+ICAgKG5lZWQgdG8gY2hhbmdlIGFsbCB1c2VycyBvZiB0aGUgLnJlZ19tYXNrX3hsYXRl
IGNhbGxiYWNrIGJ1dA0KPiA+ICAgd2hvIGNhcmVzLCB0aGV5IGFyZSBub3QgbWFueSk6DQo+ID4N
Cj4gPiBlLmcuDQo+ID4NCj4gPiBlbnVtIGdwaW9fcmVnbWFwX29wZXJhdGlvbiB7DQo+ID4gICAg
IEdQSU9fUkVHTUFQX0dFVF9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfU0VUX09QLA0KPiA+ICAg
ICBHUElPX1JFR01BUF9TRVRfV0lUSF9DTEVBUl9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfR0VU
X0RJUl9PUCwNCj4gPiAgICAgR1BJT19SRUdNQVBfU0VUX0RJUl9PUCwNCj4gPiB9Ow0KPiA+DQo+
ID4gIGludCAoKnJlZ19tYXNrX3hsYXRlKShzdHJ1Y3QgZ3Bpb19yZWdtYXAgKmdwaW8sDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bV9ncGlvX3JlZ21hcF9vcGVyYXRpb24g
b3AsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJhc2Us
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCwg
dW5zaWduZWQgaW50ICpyZWcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50ICptYXNrKTsNCj4gPg0KPiA+IFRoaXMgd2F5IC5yZWdfbWFza194bGF0ZSgpIGNh
biBoaXQgZGlmZmVyZW50IGJpdHMgaW4gdGhlIHJldHVybmVkDQo+ID4gKm1hc2sgZGVwZW5kaW5n
IG9uIG9wZXJhdGlvbiBhbmQgaXQgd2lsbCBiZSBmaW5kIHRvIHBhY2sgYWxsIG9mDQo+ID4gdGhl
IGJpdHMgaW50byBvbmUgMzJiaXQgcmVnaXN0ZXIuDQo+ID4NCj4gPiBBZGRlZCBNaWNoYWVsIFdh
bGxlIHRvIHRoZSB0aGUgdGhyZWFkLCBoZSB3aWxsIGtub3cgaWYgdGhpcyBpcyBhDQo+ID4gZ29v
ZCBpZGVhLg0KPiANCj4gTmljZSBpZGVhLCB0aG91Z2ggdGhlIGluZm9ybWF0aW9uIGlzIHRoZW4g
cmVkdW5kYW50IGluIHRoZSB1c3VhbA0KPiBjYXNlLCBpLmUuIGRyaXZlcnMgd2hpY2ggbmVlZCB0
byB0cmFuc2xhdGUgc3BlY2lmaWMgcmVnaXN0ZXJzDQo+IHdpbGwgZG8gYSAic3dpdGNoIChiYXNl
KSIgYXQgdGhlIG1vbWVudC4gVGhlc2Ugc2hvdWxkIGJlIGNvbnZlcnRlZA0KPiB0byAic3dpdGNo
IChvcCkiIGp1c3QgdG8ga2VlcCBhbGwgdGhlIGRyaXZlcnMgYWxpZ25lZCBhbmQgcHJldmVudA0K
PiBuZXcgZHJpdmVycyBmcm9tIHVzaW5nIHRoZSBvbGQgbWV0aG9kLiBZb3UnZCBuZWVkIHRvIHRv
dWNoIHRoZW0NCj4gYW55d2F5Lg0KPiANCj4gSSB3YXMgYnJpZWZseSB0aGlua2luZyBhYm91dCBt
YWtpbmcgaXQgc29tZXdoYXQgcG9zc2libGUgdG8gZW1iZWQNCj4gdGhlIG9wIGludG8gdGhlIGJh
c2UsIGlmIGl0IHdvdWxkIG90aGVyd2lzZSBiZSBhbGwgdGhlIHNhbWUuIFRoYXQNCj4gd2F5LCB5
b3UgY291bGQgZ3Bpby1yZWdtYXAgYXMgaXMuIEEgc3BlY2lhbCBjYXNlIGxpa2UNCj4gR1BJT19S
RUdNQVBfQUREUl9aRVJPLCB0aGF0IGNvdWxkIGJlIHVzZWQgYnkgdGhlc2Uga2luZCBvZiBkcml2
ZXJzLA0KPiBidXQgdGhhdCBpcyBwcm9iYWJseSB0b28gaGFja3kuDQo+IA0KPiBJJ20gZmluZSB3
aXRoIGVpdGhlciB3YXkuDQo+IA0KPiA+PiAyLiBXcml0ZS1FbmFibGUgKFdSRU4pIE1hc2sgTWVj
aGFuaXNtOiBPdXIgaGFyZHdhcmUgcmVxdWlyZXMgYSBzcGVjaWZpYyBXcml0ZS1FbmFibGUNCj4g
Pj4gbWFzayB0byBiZSB3cml0dGVuIHNpbXVsdGFuZW91c2x5IHdoZW4gdXBkYXRpbmcgdGhlIHJl
Z2lzdGVyIHZhbHVlcy4NCj4gPg0KPiA+IFdoaWNoIGlzIHRvIGp1c3Qgc2V0IGJpdCAzMS4NCj4g
Pg0KPiA+IFdpdGggdGhlIGFib3ZlIHNjaGVtZSB5b3VyIC5yZWdfbWFza194bGF0ZSBjYWxsYmFj
ayBjYW4ganVzdCBzZXQgYml0IDMxDQo+ID4gbm8gbWF0dGVyIHdoYXQgb3BlcmF0aW5nIHlvdSdy
ZSBkb2luZy4gUGllY2Ugb2YgY2FrZS4NCj4gDQo+IEtlZXAgaW4gbWluZCwgdGhhdCB0aGlzIHdp
bGwgbWFrZSByZWFkaW5nIGFuZCB3cml0aW5nIHNvbWV3aGF0DQo+IGRpZmZlcmVudC4gcmVhZGlu
ZyBhc3N1bWVzIHRoZXJlIGlzIG9ubHkgb25lIGJpdCBzZXQgaW4gbWFzaywNCj4gYmVjYXVzZSBv
ZiB0aGUgIiEhKHZhbCAmIG1hc2spIiBvcCwgd2hpY2ggaXMgaGFyZGNvZGVkLiBJJ20gbm90DQo+
IGFnYWluc3QgdXNpbmcgdGhlIHdyaXRlIGxpa2UgdGhhdCB0aG91Z2guDQo+IA0KPiAtbWljaGFl
bA0KPiANCg0KSSB1bmRlcnN0YW5kIHRoZSBwcm9wb3NlZCBhcHByb2FjaCBmb3IgZXh0ZW5kaW5n
ICcucmVnX21hc2tfeGxhdGUnIHdpdGgNCidlbnVtIGdwaW9fcmVnbWFwX29wZXJhdGlvbicsIGFu
ZCBJIGhhdmUgc3RhcnRlZCBpbXBsZW1lbnRpbmcgaXQuDQoNCj4gPj4gMy4gSGFyZHdhcmUgRGVi
b3VuY2U6IFdlIGFsc28gbmVlZCB0byBzdXBwb3J0IGhhcmR3YXJlIGRlYm91bmNlIHNldHRpbmdz
IHBlciBwaW4sDQo+ID4+IHdoaWNoIHJlcXVpcmVzIGN1c3RvbSBjb25maWd1cmF0aW9uIHZpYSBz
ZXRfY29uZmlnIG1hcHBlZCB0byB0aGVzZSBzcGVjaWZpYyBwZXItcGluDQo+ID4+IHJlZ2lzdGVy
cy4NCj4gPg0KPiA+IEp1c3QgYWRkIGEgdmVyc2lvbiBvZiBhbiBvcHRpb25hbCAuc2V0X2NvbmZp
ZygpIGNhbGwgdG8gZ3Bpby1yZWdtYXAuYw0KPiA+IHRvIGhhbmRsZSB0aGlzIHVzaW5nIC5yZWdf
bWFza194bGF0ZSgpIHBlciBhYm92ZSBhbmQgYWRkIGEgbmV3DQo+ID4gR1BJT19SRUdNQVBfQ09O
RklHX09QIHRvIHRoZSBhYm92ZSBlbnVtLCBwcm9ibGVtIHNvbHZlZC4NCj4gPg0KPiA+IElmIGl0
IHNlZW1zIHRvbyBoYXJkIEkgY2FuIHdyaXRlIHBhdGNoIDEgJiAyIGFkZGluZyB0aGlzIGluZnJh
c3RydWN0dXJlDQo+ID4gYnV0IEkgYmV0IHlvdSBjYW4gZWFzaWx5IHNlZSB3aGF0IGNhbiBiZSBk
b25lIHdpdGggZ3Bpby1yZWdtYXAuYw0KPiA+IGhlcmUgcHJvdmlkZWQgTWljaGFlbCBXIGFwcHJv
dmVzIHRoZSBpZGVhLg0KPiA+DQoNCk91ciAuc2V0X2NvbmZpZyByZXF1aXJlcyBtYXBwaW5nIHNw
ZWNpZmljIGRlYm91bmNlIHRpbWUgdmFsdWVzIHRvDQpoYXJkd2FyZS1zcGVjaWZpYyBlbnVtcyBh
bmQgYXBwbHlpbmcgYSBXcml0ZS1FbmFibGUgYml0Lg0KDQpXb3VsZCBpdCBiZSBiZXR0ZXIgdG8g
YWxsb3cgZHJpdmVycyB0byBhc3NpZ24gYSBjdXN0b20gJy5zZXRfY29uZmlnJyBjYWxsYmFjaw0K
ZGlyZWN0bHkgd2l0aGluICdzdHJ1Y3QgZ3Bpb19yZWdtYXBfY29uZmlnJz8NCg0KQWRkaXRpb25h
bGx5LCBJIGRpZG4ndCBtZW50aW9uIHRoaXMgaW4gbXkgcHJldmlvdXMgZW1haWwuIHdlIGFsc28g
bmVlZCB0bw0KaW1wbGVtZW50IEdQSU8gaW50ZXJydXB0cy4gT3VyIGhhcmR3YXJlIGRlc2lnbiBk
b2VzIG5vdCBmaXQgd2VsbCB3aXRoDQoncmVnbWFwX2lycV9jaGlwJy4gVGhlcmVmb3JlLCBJIGFt
IHBsYW5uaW5nIHRvIGNyZWF0ZSBvdXIgb3duICdpcnFkb21haW4nIGFuZA0KJ2lycWNoaXAnIG9w
cyB0byBoYW5kbGUgb3VyIGNhc2NhZGVkIGludGVycnVwdHMuDQoNCkJlY2F1c2Ugb2YgdGhpcyBj
dXN0b20gSVJRIGltcGxlbWVudGF0aW9uLCBJIHdvdWxkIG5lZWQgdG8gdXNlICdyZWFkbCgpL3dy
aXRlbCgpJw0KZm9yIHRoZSBJUlEgY2FsbGJhY2tzIGluIHRoZSBydGQxNjI1IEdQSU8gZHJpdmVy
IGluc3RlYWQgb2YgdGhlIHJlZ21hcCBBUElzLg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
IG9uIGhvdyB0byBoYW5kbGUgdGhpcyBncmFjZWZ1bGx5IHdoaWxlIGtlZXBpbmcgaXQNCmFsaWdu
ZWQgd2l0aCB0aGUgcmVnbWFwIGluZnJhc3RydWN0dXJlPw0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQoNCj4gPiBZb3VycywNCj4gPiBMaW51cyBXYWxsZWlqDQo=

