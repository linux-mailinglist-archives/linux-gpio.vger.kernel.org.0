Return-Path: <linux-gpio+bounces-34992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGMKONTH2GlQiAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:50:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E63D536A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEA24305FD86
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C003C33D6DD;
	Fri, 10 Apr 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MaHrQpcP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1B329365;
	Fri, 10 Apr 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814150; cv=none; b=skU/1Mvaw73Vmj/T6YXYwZVkXDM6ATNDdzeTgwJvejLa1NQZVrJne65KQgieDpbtCuVpcRzJEcO02xKDJYDGwEQxcTd8phDr05nT4r65Ugn6prLZnwo308r2Sbq7SPE19Ne6wOMtxqO1naxXkbnr0L6sIa5VoaqT55mPSGwRM+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814150; c=relaxed/simple;
	bh=7gzBtVJjeD1hDezHdgdhXKaFhiBwbSLacPSztQDBiTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SJfc1yJsLQ5DwcZbQFDZcbFtvyYwpNDOgoZlFUisAaVM2wspSxEL5LHb279S9baWQxQ7ymmL0vL9/V4V4ys8RScD0vehYWLVlL4H7/+lBbrdwVUospovraMEC1qEIdbgnurq/qlmaPteLx9BSgdsNUCEkwlw1n6oU1SM9mBpxRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MaHrQpcP; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A9dpN832780663, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775813991; bh=7gzBtVJjeD1hDezHdgdhXKaFhiBwbSLacPSztQDBiTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=MaHrQpcP7R0Dxglo5Ptn/aRDyF7TRXA1F/jpgaVvs2UeWGlTRsnUJUoQPmsrgC1qV
	 iHMYJwAssYGZtlaWYwBK1aEh+IyCsD6SMibsF7jRcGqj38GbUbfVvj8qpgRKiaAPTq
	 ZBpcRM+DoCBy/M6p1Fd4kmDj2/MaSHziTQ4MOoJCdcw++qQq7c+YPA9eySvdr1i/z3
	 QyQdofinuRLqjF+olKKmmtHrBOfFOBtc1nwcA3IcAuOQy1uWQHrexGBvAVGbWMqJ6s
	 BIiA9n1OiDqBuMdnrH/dKt47BD3c2vdXOggFWpyMX2YlnDU9djnne9Xml+xDsw1ZQn
	 hsb9XmubPgrJg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A9dpN832780663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 17:39:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 17:39:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 17:39:51 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: RE: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Topic: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Index: AQHcxwLHJ5/eWVH9pU2ZY37QYpQGurXUP0uAgAPMV8A=
Date: Fri, 10 Apr 2026 09:39:51 +0000
Message-ID: <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
In-Reply-To: <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
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
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34992-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[realtek.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: 790E63D536A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQmFydCwNCg0KPiBPbiBXZWQsIDggQXByIDIwMjYgMDQ6NTI6NDIgKzAyMDAsIFl1LUNodW4g
TGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gc2FpZDoNCj4gPiBGcm9tOiBUenV5aSBD
aGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUg
R1BJTyBjb250cm9sbGVyIGZvdW5kIG9uIFJlYWx0ZWsgREhDIFJURDE2MjUgU29Dcy4NCj4gPg0K
PiA+IFVubGlrZSB0aGUgZXhpc3RpbmcgUmVhbHRlayBHUElPIGRyaXZlciAoZHJpdmVycy9ncGlv
L2dwaW8tcnRkLmMpLA0KPiA+IHdoaWNoIG1hbmFnZXMgcGlucyB2aWEgc2hhcmVkIGJhbmsgcmVn
aXN0ZXJzLCB0aGUgUlREMTYyNSBpbnRyb2R1Y2VzIGENCj4gPiBwZXItcGluIHJlZ2lzdGVyIGFy
Y2hpdGVjdHVyZS4gRWFjaCBHUElPIGxpbmUgbm93IGhhcyBpdHMgb3duDQo+ID4gZGVkaWNhdGVk
IDMyLWJpdCBjb250cm9sIHJlZ2lzdGVyIHRvIG1hbmFnZSBjb25maWd1cmF0aW9uDQo+ID4gaW5k
ZXBlbmRlbnRseSwgaW5jbHVkaW5nIGRpcmVjdGlvbiwgb3V0cHV0IHZhbHVlLCBpbnB1dCB2YWx1
ZSwNCj4gPiBpbnRlcnJ1cHQgZW5hYmxlLCBhbmQgZGVib3VuY2UuIFRoZXJlZm9yZSwgdGhpcyBk
aXN0aW5jdCBoYXJkd2FyZQ0KPiA+IGRlc2lnbiByZXF1aXJlcyBhIHNlcGFyYXRlIGRyaXZlci4N
Cj4gPg0KPiA+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+
ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIFJlbW92ZSAiZGVmYXVsdCB5Ii4NCj4g
PiAtIEFkZCBiYXNlX29mZnNldCBtZW1iZXIgdG8gc3RydWN0IHJ0ZDE2MjVfZ3Bpb19pbmZvIHRv
IGhhbmRsZSBtZXJnZWQNCj4gcmVnaW9ucy4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncGlvL0tj
b25maWcgICAgICAgIHwgIDExICsNCj4gPiAgZHJpdmVycy9ncGlvL01ha2VmaWxlICAgICAgIHwg
ICAxICsNCj4gPiAgZHJpdmVycy9ncGlvL2dwaW8tcnRkMTYyNS5jIHwgNTg0DQo+ID4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNTk2
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Bpby9ncGlv
LXJ0ZDE2MjUuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnIGIv
ZHJpdmVycy9ncGlvL0tjb25maWcgaW5kZXgNCj4gPiA1ZWUxMWE4ODk4NjcuLjI4MTU0OWFkNzJh
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3Bpby9LY29uZmlnDQo+ID4gQEAgLTYzOCw2ICs2MzgsMTcgQEAgY29uZmlnIEdQSU9fUlRE
DQo+ID4gICAgICAgICBTYXkgeWVzIGhlcmUgdG8gc3VwcG9ydCBHUElPIGZ1bmN0aW9uYWxpdHkg
YW5kIEdQSU8gaW50ZXJydXB0IG9uDQo+ID4gICAgICAgICBSZWFsdGVrIERIQyBTb0NzLg0KPiA+
DQo+ID4gK2NvbmZpZyBHUElPX1JURDE2MjUNCj4gPiArICAgICB0cmlzdGF0ZSAiUmVhbHRlayBE
SEMgUlREMTYyNSBHUElPIHN1cHBvcnQiDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBBUkNIX1JFQUxU
RUsgfHwgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUA0KPiA+
ICsgICAgIGhlbHANCj4gPiArICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3Ig
dGhlIEdQSU8gY29udHJvbGxlciBvbiBSZWFsdGVrDQo+ID4gKyAgICAgICBESEMgKERpZ2l0YWwg
SG9tZSBDZW50ZXIpIFJURDE2MjUgU29DLg0KPiA+ICsNCj4gPiArICAgICAgIFNheSB5ZXMgaGVy
ZSB0byBzdXBwb3J0IGJvdGggYmFzaWMgR1BJTyBsaW5lIGZ1bmN0aW9uYWxpdHkNCj4gPiArICAg
ICAgIGFuZCBHUElPIGludGVycnVwdCBoYW5kbGluZyBjYXBhYmlsaXRpZXMgZm9yIHRoaXMgcGxh
dGZvcm0uDQo+ID4gKw0KPiA+ICBjb25maWcgR1BJT19TQU1BNUQyX1BJT0JVDQo+ID4gICAgICAg
dHJpc3RhdGUgIlNBTUE1RDIgUElPQlUgR1BJTyBzdXBwb3J0Ig0KPiA+ICAgICAgIGRlcGVuZHMg
b24gTUZEX1NZU0NPTg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vTWFrZWZpbGUgYi9k
cml2ZXJzL2dwaW8vTWFrZWZpbGUgaW5kZXgNCj4gPiBjMDVmN2Q3OTVjNDMuLmM5NWJhMjE4ZDUz
YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vTWFrZWZpbGUNCj4gPiArKysgYi9kcml2
ZXJzL2dwaW8vTWFrZWZpbGUNCj4gPiBAQCAtMTU5LDYgKzE1OSw3IEBAIG9iai0kKENPTkZJR19H
UElPX1JFQUxURUtfT1RUTykNCj4gKz0gZ3Bpby1yZWFsdGVrLW90dG8ubw0KPiA+ICBvYmotJChD
T05GSUdfR1BJT19SRUcpICAgICAgICAgICAgICAgICAgICAgICArPSBncGlvLXJlZy5vDQo+ID4g
IG9iai0kKENPTkZJR19HUElPX1JPQ0tDSElQKSAgKz0gZ3Bpby1yb2NrY2hpcC5vDQo+ID4gIG9i
ai0kKENPTkZJR19HUElPX1JURCkgICAgICAgICAgICAgICAgICAgICAgICs9IGdwaW8tcnRkLm8N
Cj4gPiArb2JqLSQoQ09ORklHX0dQSU9fUlREMTYyNSkgICAgICAgICAgICs9IGdwaW8tcnRkMTYy
NS5vDQo+ID4gIG9iai0kKENPTkZJR19BUkNIX1NBMTEwMCkgICAgICAgICAgICArPSBncGlvLXNh
MTEwMC5vDQo+ID4gIG9iai0kKENPTkZJR19HUElPX1NBTUE1RDJfUElPQlUpICAgICArPSBncGlv
LXNhbWE1ZDItcGlvYnUubw0KPiA+ICBvYmotJChDT05GSUdfR1BJT19TQ0gzMTFYKSAgICAgICAg
ICAgKz0gZ3Bpby1zY2gzMTF4Lm8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8t
cnRkMTYyNS5jIGIvZHJpdmVycy9ncGlvL2dwaW8tcnRkMTYyNS5jDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi5iY2MxYmJiMTE1ZmENCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tcnRkMTYyNS5jDQo+ID4gQEAgLTAsMCAr
MSw1ODQgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXINCj4gPiArLyoNCj4gPiArICogUmVhbHRlayBESEMgUlREMTYyNSBncGlvIGRyaXZlcg0KPiA+
ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgUmVhbHRlayBTZW1pY29uZHVjdG9yIENv
cnAuDQo+IA0KPiBObyBtb2RpZmljYXRpb25zIHNpbmNlIDIwMjM/DQo+IA0KDQpXaWxsIGluY2x1
ZGUgMjAyNi4NCg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVs
ZC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9ncGlvL2RyaXZlci5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9pcnFjaGlwLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pcnFjaGlw
L2NoYWluZWRfaXJxLmg+ICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+ICNp
bmNsdWRlDQo+ID4gKzxsaW51eC9wcm9wZXJ0eS5oPiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2su
aD4gI2luY2x1ZGUNCj4gPiArPGxpbnV4L3R5cGVzLmg+DQo+ID4gKw0KPiA+ICsjZGVmaW5lIFJU
RDE2MjVfR1BJT19ESVIgQklUKDApDQo+ID4gKyNkZWZpbmUgUlREMTYyNV9HUElPX09VVCBCSVQo
MikNCj4gPiArI2RlZmluZSBSVEQxNjI1X0dQSU9fSU4gQklUKDQpDQo+ID4gKyNkZWZpbmUgUlRE
MTYyNV9HUElPX0VER0VfSU5UX0RQIEJJVCg2KSAjZGVmaW5lDQo+ID4gK1JURDE2MjVfR1BJT19F
REdFX0lOVF9FTiBCSVQoOCkgI2RlZmluZQ0KPiBSVEQxNjI1X0dQSU9fTEVWRUxfSU5UX0VODQo+
ID4gK0JJVCgxNikgI2RlZmluZSBSVEQxNjI1X0dQSU9fTEVWRUxfSU5UX0RQIEJJVCgxOCkgI2Rl
ZmluZQ0KPiA+ICtSVEQxNjI1X0dQSU9fREVCT1VOQ0UgR0VOTUFTSygzMCwgMjgpICNkZWZpbmUN
Cj4gPiArUlREMTYyNV9HUElPX0RFQk9VTkNFX1dSRU4gQklUKDMxKQ0KPiA+ICsNCj4gPiArI2Rl
ZmluZSBSVEQxNjI1X0dQSU9fV1JFTih4KSAoKHgpIDw8IDEpDQo+ID4gKw0KPiA+ICsvKiBXcml0
ZS1lbmFibGUgbWFza3MgZm9yIGFsbCBHUElPIGNvbmZpZ3MgYW5kIHJlc2VydmVkIGhhcmR3YXJl
IGJpdHMNCj4gPiArKi8gI2RlZmluZSBSVEQxNjI1X0lTT19HUElPX1dSRU5fQUxMIDB4ODAwMGFh
OGEgI2RlZmluZQ0KPiA+ICtSVEQxNjI1X0lTT01fR1BJT19XUkVOX0FMTCAweDgwMGFhYThhDQo+
ID4gKw0KPiA+ICsjZGVmaW5lIFJURDE2MjVfR1BJT19ERUJPVU5DRV8xVVMgMA0KPiA+ICsjZGVm
aW5lIFJURDE2MjVfR1BJT19ERUJPVU5DRV8xMFVTIDENCj4gPiArI2RlZmluZSBSVEQxNjI1X0dQ
SU9fREVCT1VOQ0VfMTAwVVMgMiAjZGVmaW5lDQo+ID4gK1JURDE2MjVfR1BJT19ERUJPVU5DRV8x
TVMgMyAjZGVmaW5lDQo+IFJURDE2MjVfR1BJT19ERUJPVU5DRV8xME1TIDQNCj4gPiArI2RlZmlu
ZSBSVEQxNjI1X0dQSU9fREVCT1VOQ0VfMjBNUyA1ICNkZWZpbmUNCj4gPiArUlREMTYyNV9HUElP
X0RFQk9VTkNFXzMwTVMgNiAjZGVmaW5lDQo+IFJURDE2MjVfR1BJT19ERUJPVU5DRV81ME1TIDcN
Cj4gPiArDQo+ID4gKyNkZWZpbmUgR1BJT19DT05UUk9MKGdwaW8pICgoZ3BpbykgKiA0KQ0KPiA+
ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBydGQxNjI1X2dwaW9faW5mbyAtIFNwZWNpZmlj
IEdQSU8gcmVnaXN0ZXIgaW5mb3JtYXRpb24NCj4gPiArICogQG51bV9ncGlvczogVGhlIG51bWJl
ciBvZiBHUElPcw0KPiA+ICsgKiBAaXJxX3R5cGVfc3VwcG9ydDogU3VwcG9ydGVkIElSUSB0eXBl
cw0KPiA+ICsgKiBAZ3BhX29mZnNldDogT2Zmc2V0IGZvciBHUElPIGFzc2VydCBpbnRlcnJ1cHQg
c3RhdHVzIHJlZ2lzdGVycw0KPiA+ICsgKiBAZ3BkYV9vZmZzZXQ6IE9mZnNldCBmb3IgR1BJTyBk
ZWFzc2VydCBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVycw0KPiA+ICsgKiBAbGV2ZWxfb2Zmc2V0
OiBPZmZzZXQgb2YgbGV2ZWwgaW50ZXJydXB0IHN0YXR1cyByZWdpc3Rlcg0KPiA+ICsgKiBAd3Jp
dGVfZW5fYWxsOiBXcml0ZS1lbmFibGUgbWFzayBmb3IgYWxsIGNvbmZpZ3VyYWJsZSBiaXRzICAq
Lw0KPiA+ICtzdHJ1Y3QgcnRkMTYyNV9ncGlvX2luZm8gew0KPiA+ICsgICAgIHVuc2lnbmVkIGlu
dCAgICBudW1fZ3Bpb3M7DQo+ID4gKyAgICAgdW5zaWduZWQgaW50ICAgIGlycV90eXBlX3N1cHBv
cnQ7DQo+ID4gKyAgICAgdW5zaWduZWQgaW50ICAgIGJhc2Vfb2Zmc2V0Ow0KPiA+ICsgICAgIHVu
c2lnbmVkIGludCAgICBncGFfb2Zmc2V0Ow0KPiA+ICsgICAgIHVuc2lnbmVkIGludCAgICBncGRh
X29mZnNldDsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgICAgbGV2ZWxfb2Zmc2V0Ow0KPiA+ICsg
ICAgIHVuc2lnbmVkIGludCAgICB3cml0ZV9lbl9hbGw7DQo+ID4gK307DQo+IA0KPiBQbGVhc2Ug
cmVtb3ZlIHRoZSB0YWJzIGluIHRoZSBhYm92ZSBzdHJ1Y3QuDQo+IA0KDQpBY2suDQoNCj4gPiAr
DQo+ID4gK3N0cnVjdCBydGQxNjI1X2dwaW8gew0KPiA+ICsgICAgIHN0cnVjdCBncGlvX2NoaXAg
ICAgICAgICAgICAgICAgZ3Bpb19jaGlwOw0KPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBydGQxNjI1
X2dwaW9faW5mbyAgKmluZm87DQo+ID4gKyAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgICAg
ICAgICAqYmFzZTsNCj4gPiArICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAgICAgICAgICpp
cnFfYmFzZTsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgICAgICAgICAgIGlycXNb
M107DQo+ID4gKyAgICAgcmF3X3NwaW5sb2NrX3QgICAgICAgICAgICAgICAgICBsb2NrOw0KPiA+
ICsgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgICAgICAgICAgKnNhdmVfcmVnczsNCj4gPiAr
fTsNCj4gDQo+IEknZCBhbHNvIHBlcnNvbmFsbHkgcmVtb3ZlIHRoZXNlIHRhYnMgaGVyZSBidXQg
d29uJ3QgZGllIG9uIHRoYXQgaGlsbC4NCj4gDQoNCkFjay4NCg0KPiA+ICsNCj4gPiArc3RhdGlj
IHVuc2lnbmVkIGludCBydGQxNjI1X2dwaW9fZ3BhX29mZnNldChzdHJ1Y3QgcnRkMTYyNV9ncGlv
DQo+ID4gKypkYXRhLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KSB7DQo+ID4gKyAgICAgcmV0dXJuIGRh
dGEtPmluZm8tPmdwYV9vZmZzZXQgKyAoKG9mZnNldCAvIDMyKSAqIDQpOyB9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdW5zaWduZWQgaW50IHJ0ZDE2MjVfZ3Bpb19ncGRhX29mZnNldChzdHJ1Y3QgcnRk
MTYyNV9ncGlvDQo+ID4gKypkYXRhLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KSB7DQo+ID4gKyAgICAg
cmV0dXJuIGRhdGEtPmluZm8tPmdwZGFfb2Zmc2V0ICsgKChvZmZzZXQgLyAzMikgKiA0KTsgfQ0K
PiA+ICsNCj4gPiArc3RhdGljIHVuc2lnbmVkIGludCBydGQxNjI1X2dwaW9fbGV2ZWxfb2Zmc2V0
KHN0cnVjdCBydGQxNjI1X2dwaW8NCj4gPiArKmRhdGEsIHVuc2lnbmVkIGludCBvZmZzZXQpIHsN
Cj4gPiArICAgICByZXR1cm4gZGF0YS0+aW5mby0+bGV2ZWxfb2Zmc2V0ICsgKChvZmZzZXQgLyAz
MikgKiA0KTsgfQ0KPiANCj4gTG9va2luZyBhdCB0aGVzZSwgSSdtIHVuZGVyIHRoZSBpbXByZXNz
aW9uIHRoYXQgdGhpcyBkcml2ZXIgY291bGQgcXVpdGUgZWFzaWx5IGJlDQo+IGNvbnZlcnRlZCB0
byB1c2luZyBncGlvLW1taW8gb3IgZXZlbiBncGlvLXJlZ21hcCB3aXRoIGFuIE1NSU8gcmVnbWFw
LA0KPiBoYXZlIHlvdSBsb29rZWQgaW50byBpdCBieSBhbnkgY2hhbmNlPw0KPiANCj4gQmFydA0K
DQoNCldlIGRpZCBsb29rIGludG8gZ3Bpby1tbWlvIGFuZCBncGlvLXJlZ21hcCwgYnV0IHRoZXkg
YXJlIG5vdCBxdWl0ZSBzdWl0YWJsZSBmb3INCm91ciBwbGF0Zm9ybSBkdWUgdG8gdGhlIHNwZWNp
ZmljIGhhcmR3YXJlIGRlc2lnbjoNCg0KMS4gUGVyLUdQSU8gRGVkaWNhdGVkIFJlZ2lzdGVyczog
VW5saWtlIHR5cGljYWwgR1BJTyBjb250cm9sbGVycyB0aGF0IHBhY2sgMzIgcGlucw0KaW50byBh
IHNpbmdsZSAzMi1iaXQgcmVnaXN0ZXIgKDEgYml0IHBlciBwaW4pLCBvdXIgaGFyZHdhcmUgdXNl
cyBhIGRlZGljYXRlZCAzMi1iaXQNCnJlZ2lzdGVyIGZvciBlYWNoIGluZGl2aWR1YWwgR1BJTy4g
VGhpcyBzaW5nbGUgcmVnaXN0ZXIgY29udHJvbHMgdGhlDQppbnB1dC9vdXRwdXQgc3RhdGUsIGRp
cmVjdGlvbiwgYW5kIGludGVycnVwdCB0cmlnZ2VyIHR5cGUgZm9yIHRoYXQgc3BlY2lmaWMgcGlu
Lg0KDQoyLiBXcml0ZS1FbmFibGUgKFdSRU4pIE1hc2sgTWVjaGFuaXNtOiBPdXIgaGFyZHdhcmUg
cmVxdWlyZXMgYSBzcGVjaWZpYyBXcml0ZS1FbmFibGUNCm1hc2sgdG8gYmUgd3JpdHRlbiBzaW11
bHRhbmVvdXNseSB3aGVuIHVwZGF0aW5nIHRoZSByZWdpc3RlciB2YWx1ZXMuDQoNCjMuIEhhcmR3
YXJlIERlYm91bmNlOiBXZSBhbHNvIG5lZWQgdG8gc3VwcG9ydCBoYXJkd2FyZSBkZWJvdW5jZSBz
ZXR0aW5ncyBwZXIgcGluLA0Kd2hpY2ggcmVxdWlyZXMgY3VzdG9tIGNvbmZpZ3VyYXRpb24gdmlh
IHNldF9jb25maWcgbWFwcGVkIHRvIHRoZXNlIHNwZWNpZmljIHBlci1waW4NCnJlZ2lzdGVycy4N
Cg0KQmVjYXVzZSBvZiB0aGVzZSBoYXJkd2FyZSBjb25zdHJhaW50cywgbWFudWFsbHkgaW1wbGVt
ZW50aW5nIHRoZSBncGlvX2NoaXAgY2FsbGJhY2tzDQpzZWVtcyB0byBiZSB0aGUgbW9zdCBzdHJh
aWdodGZvcndhcmQNCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K

