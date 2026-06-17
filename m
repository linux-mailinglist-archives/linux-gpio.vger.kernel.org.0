Return-Path: <linux-gpio+bounces-38626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GR1XO9ldMmp9zAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:42:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFBF697A13
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:42:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b="r/fgIxyB";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38626-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38626-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=realtek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40513121D3A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EB8391E58;
	Wed, 17 Jun 2026 08:37:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5139183A;
	Wed, 17 Jun 2026 08:37:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685478; cv=none; b=avSOUUpNXcpLsGHmvOnzTEwlwd6gMh/dq5w5morUyUeTetb1QS5kiO66O/O5343gsrmTa4mb+3mPOiDov1GlJX8MQLump10VPABqDUa+v0P7HxE7FQADIzjct+rdDC+wOCg69Tda5k4AP5kHjXlMhT41Gp5XFI7COyNOy2mNN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685478; c=relaxed/simple;
	bh=S7KgSF0w5WeKj97VrZtA6w0qDB27y4aGhT/Piue7vF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VJs+GSo1VBJKmXVKWc3IevUtnx6CO9J0uRrfCHCcWsdcScQz8ow1KqUQsISDeQOIWO5PbEHv9y08HbXDQtAnlsIhYAJJKpg1ql69/jr4d+JWGFkGlVE1d+sTjuqlh12pyKnce1UD0H8+ivY8nBIZn2eATyicSxsE57dNwnRSZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=r/fgIxyB; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65H8aZSJ12588325, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781685395; bh=S7KgSF0w5WeKj97VrZtA6w0qDB27y4aGhT/Piue7vF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=r/fgIxyBmBCYQtUuylAGnkUPdUsO9X/Ce5w0UTq6FRmKH3h3Npy6RuPoKzZYrounF
	 2nvZiQVlgSlqULRICxU8KCE7ENHOYtxBWGmGTXrNRZq/fGUYDNzhIczCHW/6Z5O8UE
	 Bq0Xb3ZBg7BWxvWN3trw3b/Xyv4jDIAQuj2lx/UR9gZxsO4EOjQ8HRxTbqxlfiW5OD
	 1UO/q8Xy7DPxMhzffeQPJ6UtKJNjbkrSz/xva5rtkYVk9+voFdq+d4dkbsJ7QtO+5Y
	 XJtEN5qI8Izd2VphsVyMqNkIaT6v+0lvutp+t7l3JeIDpT+UUfYa5/e5rpRFeIbUcW
	 m6gZS0nS1N/jw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65H8aZSJ12588325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jun 2026 16:36:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Jun 2026 16:36:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 17 Jun 2026 16:36:35 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com"
	<afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org"
	<andy@kernel.org>, "dlechner@baylibre.com" <dlechner@baylibre.com>,
	=?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>
Subject: RE: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Topic: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Index: AQHc4cATn1PDC9J2iUegNlC3h35mQ7YJuQgAgBT/RkCADN+cAIAIv5wAgAAIjACADkT7EA==
Date: Wed, 17 Jun 2026 08:36:34 +0000
Message-ID: <39de4d4ada5446e7a33e48c43f410439@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
In-Reply-To: <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
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
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38626-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:mwalle@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[realtek.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,realtek.com:from_mime,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BFBF697A13

SGkgQW5keSwgTWljaGFlbCBhbmQgQmFydG9zeiwNCg0KPiBIaSwNCj4NCj5PbiBNb24gSnVuIDgs
IDIwMjYgYXQgNDoxMCBQTSBDRVNULCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPj4+IE9u
IFdlZCwgMyBKdW4gMjAyNiAwMjozNDo0MCArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIA0KPj4+IDxh
bmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHNhaWQ6DQo+DQo+Pj4gT24gTW9uLCBNYXkgMjUs
IDIwMjYgYXQgMTI6MDQ6MDlQTSArMDAwMCwgWXUtQ2h1biBMaW4gW6pMr6enZ10gd3JvdGU6DQo+
Pj4+ID4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMTE6MzM6MTJBTSArMDgwMCwgWXUtQ2h1biBM
aW4gd3JvdGU6DQo+Pj4+ID4gPiBFeHBvc2UgYW4gYWNjZXNzb3IgZnVuY3Rpb24gdG8gcmV0cmll
dmUgdGhlIGdwaW9fY2hpcCBwb2ludGVyIA0KPj4+PiA+ID4gZnJvbSBhIGdwaW9fcmVnbWFwIGlu
c3RhbmNlLg0KPj4+PiA+ID4NCj4+Pj4gPiA+IFRoaXMgaXMgbmVlZGVkIGJ5IGRyaXZlcnMgdGhh
dCB1c2UgZ3Bpb19yZWdtYXAgYnV0IGFsc28gbWFuYWdlIA0KPj4+PiA+ID4gdGhlaXIgb3duIGly
cV9jaGlwLCB3aGVyZSANCj4+Pj4gPiA+IGdwaW9jaGlwX2VuYWJsZV9pcnEoKS9ncGlvY2hpcF9k
aXNhYmxlX2lycSgpIG11c3QgYmUgY2FsbGVkIHdpdGgNCj4+Pj4gPiA+IHRoZSBncGlvX2NoaXAg
cG9pbnRlci4NCj4+Pj4gPiA+DQo+Pj4+ID4gPiBBZGQgZ3Bpb19yZWdtYXBfZ2V0X2dwaW9jaGlw
KCkgdG8gYWxsb3cgZHJpdmVycyB3aXRoIGNvbXBsZXggDQo+Pj4+ID4gPiBjdXN0b20gSVJRIGlt
cGxlbWVudGF0aW9ucy4NCj4+Pj4gPg0KPj4+PiA+IEhtbS4uLiBDYW4ndCB3ZSByYXRoZXIgYWRk
DQo+Pj4+ID4gZ3Bpb19yZWdtYXBfZW5hYmxlX2lycSgpL2dwaW9fcmVnbWFwX2Rpc2FibGVfaXJx
KCkNCj4+Pj4gPiB0aGF0IHRha2UgcmVnbWFwIG9yIEdQSU8gcmVnbWFwICh3aGF0ZXZlciBzdWl0
cyBiZXR0ZXIgZm9yIHRoZSANCj4+Pj4gPiBwdXJwb3NlKSBhbmQgZG8gdGhlIG1hZ2ljIGluc2lk
ZSBHUElPIHJlZ21hcCBsaWJyYXJ5IGNvZGU/DQo+Pj4NCj4+Pj4gVGhhbmtzIGZvciB0aGUgcmV2
aWV3ISBJIGFwb2xvZ2l6ZSBmb3IgdGhlIG1pc2xlYWRpbmcgY29tbWl0IG1lc3NhZ2UuDQo+Pj4+
IFRoZSByZWFsIHJlYXNvbiBJIG5lZWQgdGhlIHN0cnVjdCBncGlvX2NoaXAgcG9pbnRlciBpcyB0
byBwcm9wZXJseSANCj4+Pj4gc2V0IHVwIGEgY3VzdG9tIElSUSBkb21haW4uIE91ciBTb0MgR1BJ
TyBjb250cm9sbGVyIGlzIHF1aXRlIA0KPj4+PiBjb21wbGV4LiBJdCByb3V0ZXMgZGlmZmVyZW50
IHRyaWdnZXIgdHlwZXMgdG8gbXVsdGlwbGUgcGFyZW50IElSUXMsDQo+Pj4+IHdoaWNoIGRvZXNu
J3QgZml0IHRoZSBnZW5lcmljIHJlZ21hcF9pcnEgZnJhbWV3b3JrLg0KPj4+PiBUaGVyZWZvcmUs
IHdlIGhhdmUgdG8gY3JlYXRlIG91ciBvd24gaXJxX2RvbWFpbiBhbmQgcGFzcyBpdCB0byANCj4+
Pj4gZ3Bpb19yZWdtYXBfY29uZmlnLmlycV9kb21haW4uDQo+Pj4+DQo+Pj4+IFRoZSBjb3JlIHBy
b2JsZW0gb2NjdXJzIGluc2lkZSBvdXIgY3VzdG9tIGlycV9kb21haW5fb3BzLm1hcCgpIGNhbGxi
YWNrOg0KPj4+Pg0KPj4+PiBzdGF0aWMgaW50IHJ0ZDE2MjVfZ3Bpb19pcnFfbWFwKHN0cnVjdCBp
cnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGludCBpcnEsDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaXJxX2h3X251bWJlcl90IGh3aXJxKSB7DQo+Pj4+IAlzdHJ1Y3Qg
cnRkMTYyNV9ncGlvICpkYXRhID0gZG9tYWluLT5ob3N0X2RhdGE7DQo+Pj4+IAlzdHJ1Y3QgZ3Bp
b19jaGlwICpnYyA9IGRhdGEtPmdwaW9fY2hpcDsNCj4+Pj4NCj4+Pj4gCS8qDQo+Pj4+IAkgKiBU
aGUgc2Vjb25kIGFyZ3VtZW50IE1VU1QgYmUgc3RydWN0IGdwaW9fY2hpcCAqLg0KPj4+PiAJICog
SWYgd2UgcGFzcyBvdXIgY3VzdG9tIGRhdGEgc3RydWN0dXJlIGhlcmUsIHRoZSBrZXJuZWwgd2ls
bCBwYW5pYyBsYXRlcg0KPj4+PiAJICogaW4gZ3Bpb2NoaXBfaXJxX3JlcXJlcygpIHdoZW4gaXQg
Y2FsbHMgaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoKQ0KPj4+PiAJICogYW5kIHN0cmljdGx5
IGV4cGVjdHMgaXQgdG8gYmUgYSBncGlvX2NoaXAuDQo+Pj4+IAkgKi8NCj4+Pj4gCWlycV9zZXRf
Y2hpcF9kYXRhKGlycSwgZ2MpOw0KPj4+Pg0KPj4+PiAJaXJxX3NldF9sb2NrZGVwX2NsYXNzKGly
cSwgJnJ0ZDE2MjVfZ3Bpb19pcnFfbG9ja19jbGFzcywNCj4+Pj4gCQkJCSZydGQxNjI1X2dwaW9f
aXJxX3JlcXVlc3RfY2xhc3MpOw0KPj4+Pg0KPj4+PiAJaXJxX3NldF9jaGlwX2FuZF9oYW5kbGVy
KGlycSwgJnJ0ZDE2MjVfaXNvX2dwaW9faXJxX2NoaXAsIGhhbmRsZV9iYWRfaXJxKTsNCj4+Pj4g
CWlycV9zZXRfbm9wcm9iZShpcnEpOw0KPj4+Pg0KPj4+PiAJcmV0dXJuIDA7DQo+Pj4+IH0NCj4+
Pj4NCj4+Pj4gV2l0aG91dCBhbiBhY2Nlc3NvciBsaWtlIGdwaW9fcmVnbWFwX2dldF9ncGlvY2hp
cCgpLCB3ZSBjYW5ub3QgDQo+Pj4+IHJldHJpZXZlIHRoZSBncGlvX2NoaXAgaW5zdGFudGlhdGVk
IGluc2lkZSBncGlvLXJlZ21hcC5jIHRvIGZ1bGZpbGwgDQo+Pj4+IHRoZXNlIHJlcXVpcmVtZW50
cyBpbiBvdXINCj4+Pj4gbWFwKCkgZnVuY3Rpb24uDQo+DQo+IFdoeSBpcyBncGlvY2hpcF9pcnFf
cmVxcmVzKCkgY2FsbGVkIGluIHRoZSBmaXJzdCBwbGFjZT8gSXNuJ3QgdGhhdCBvbmx5DQo+IGNh
bGxlZCBpZiB0aGUgaXJxIGhhbmRsaW5nIGlzIHNldCB1cCB2aWEgZ2MtPmlycS5jaGlwIGFuZCBu
b3QgdmlhIA0KPiBncGlvY2hpcF9pcnFjaGlwX2FkZF9kb21haW4oKSBsaWtlIGluIGdwaW8tcmVn
bWFwPw0KPg0KDQpUaGUgcGFuaWMgd2FzIGNhdXNlZCBieSBteSBkcml2ZXIgaW5jbHVkaW5nICdH
UElPQ0hJUF9JUlFfUkVTT1VSQ0VfSEVMUEVSUycsDQp3aGljaCBmb3JjZWQgdGhlIGNhbGwgdG8g
J2dwaW9jaGlwX2lycV9yZXFyZXMoKScgYW5kIGNyYXNoZWQuDQoNCj4+PiBUaGlzIGlzIGFsbCBn
b29kIGFuZCBuZWVkcyB0byBiZSBkZXBpY3RlZCBpbiB0aGUgY292ZXItbGV0dGVyIGFuZC9vciBj
b21taXQgbWVzc2FnZS4NCg0KWWVzLCBJIHdpbGwgZG8gaXQuDQoNCj4+Pg0KPj4+PiBCZWZvcmUg
SSBzZW5kIGEgdjQsIEkgc2VlIDMgcG9zc2libGUgcGF0aHM6DQo+Pj4+DQo+Pj4+IE9wdGlvbiAx
OiBLZWVwIHRoZSBhY2Nlc3NvciAoQ3VycmVudCB2MyBhcHByb2FjaCkgV2Uga2VlcCANCj4+Pj4g
Z3Bpb19yZWdtYXBfZ2V0X2dwaW9jaGlwKCkgYnV0IEkgd2lsbCBjb21wbGV0ZWx5IHJld3JpdGUg
dGhlIGNvbW1pdCANCj4+Pj4gbWVzc2FnZSB0byBleHBsYWluIHRoZSBjdXN0b20gaXJxX2RvbWFp
bl9vcHMubWFwIGFuZCBsb2NrZGVwIHJlcXVpcmVtZW50cy4NCj4+Pj4NCj4+Pj4gT3B0aW9uIDI6
IExldCBncGlvbGliIGNyZWF0ZSB0aGUgaXJxX2RvbWFpbiB2aWEgZ3Bpb19yZWdtYXBfY29uZmln
IA0KPj4+PiBJbnN0ZWFkIG9mIGNyZWF0aW5nIHRoZSBpcnFfZG9tYWluIGluIG91ciBkcml2ZXIs
IHdlIGFkZCBhbGwgDQo+Pj4+IG5lY2Vzc2FyeSBJUlEgZmllbGRzIChpcnFfY2hpcCwgaXJxX2hh
bmRsZXIsIGlycV9wYXJlbnRzLCBldGMuKSBpbnRvIA0KPj4+PiBzdHJ1Y3QgZ3Bpb19yZWdtYXBf
Y29uZmlnLiBUaGVuIGdwaW8tcmVnbWFwLmMgcG9wdWxhdGVzIHRoZSANCj4+Pj4gZ3Bpb19pcnFf
Y2hpcCBzdHJ1Y3R1cmUgYmVmb3JlIGNhbGxpbmcgZ3Bpb2NoaXBfYWRkX2RhdGEoKS4gVGhpcyAN
Cj4+Pj4gcHJldmVudHMgYW4gZWFybHkgcmV0dXJuIGFuZCBhbGxvd3MgdGhlIGNvcmUgZ3Bpb2xp
Yg0KPj4+PiAoZ3Bpb2NoaXBfYWRkX2lycWNoaXAoKSkgdG8gYXV0b21hdGljYWxseSBjcmVhdGUg
dGhlIGlycV9kb21haW4gZm9yIHVzLg0KPj4+PiBEcmF3YmFjazogVGhpcyBhZGRzIGEgbG90IG9m
IGZpZWxkcyB0byBncGlvX3JlZ21hcF9jb25maWcgYW5kIG1pZ2h0IA0KPj4+PiB2aW9sYXRlIHRo
ZSBvcmlnaW5hbCBkZXNpZ24gcGhpbG9zb3BoeSBvZiBncGlvLXJlZ21hcC5jIChjb21taXQgDQo+
Pj4+IGViZTM2MzE5N2U1MiksIHdoaWNoIGV4cGxpY2l0bHkgc3RhdGVzIHRoYXQgaXQgZG9lcyBu
b3QgaW1wbGVtZW50IA0KPj4+PiBpdHMgb3duIElSUSBjaGlwIGFuZCBkZWxlZ2F0ZXMgaXQgdG8g
dGhlIHBhcmVudCBkcml2ZXIuDQo+Pj4+DQo+Pj4+IE9wdGlvbiAzOiBEcm9wIGdwaW8tcmVnbWFw
IGVudGlyZWx5IChSZXZlcnQgdG8gdjIgYXBwcm9hY2gpIA0KPj4+PiBDdXJyZW50bHksIGFsbCBk
cml2ZXJzIHVzaW5nIGdwaW8tcmVnbWFwIChtb3N0bHkgc2ltcGxlIENQTERzIGFuZCANCj4+Pj4g
ZXh0ZXJuYWwgSS9PIGNhcmRzKSB1c2UgcmVnbWFwLWlycSB0byBnZXQgdGhlaXIgZG9tYWluLiBT
aW5jZSBvdXIgDQo+Pj4+IFNvQyBoYXMgYSBjb21wbGV4IElSUSByb3V0aW5nIHNjaGVtZSB3aXRo
IG11bHRpcGxlIHBhcmVudHMsIG1heWJlIA0KPj4+PiBncGlvLXJlZ21hcCBpcyBzaW1wbHkgbm90
IHRoZSByaWdodCB0b29sIGZvciB0aGlzIGhhcmR3YXJlLCBhbmQgd2UNCj4+Pj4gc2hvdWxkIGp1
c3QgaW1wbGVtZW50IGEgc3RhbmRhcmQgR1BJTyBkcml2ZXIgZGlyZWN0bHkgdXNpbmcgZ3Bpb2xp
Yi4NCj4+Pj4NCj4+Pj4gV2hpY2ggYXBwcm9hY2ggd291bGQgeW91IHByZWZlciB1cHN0cmVhbT8N
Cj4+Pg0KPj4+IFRoaXMgcXVlc3Rpb24gdG8gQmFydCwgTGludXMsIGFuZCBwb2lzc2libHkgZ3Bp
by1yZWdtYXAgc3Rha2Vob2xkZXJzLiANCj4+PiBJJ20gbm90IHN1cmUgdGhhdCBteSBwZXJzb25h
bCBvcGluaW9uIHdpbGwgYmUgdGhlIGJlc3QgZml0IGhlcmUuDQo+Pj4NCj4+DQo+PiBNeSBwcmVm
ZXJlbmNlIHdvdWxkIGJlIGZvciAjMiBidXQgSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBjb3VsZCBy
aXNrIA0KPj4gZ2V0dGluZyBzdHVjayBpbiBlbmRsZXNzIGJpa2VzaGVkZGluZyBzbyBJJ20gZmlu
ZSB3aXRoIGdvaW5nICMzIHdpdGggDQo+PiBwb3RlbnRpYWwgZm9yIGZ1dHVyZSByZWZhY3Rvcmlu
ZyBpZiB3ZSBoYXZlIG1vcmUgc2ltaWxhciB1c2Vycy4NCj4NCj4gWWVhaCwgSSdkIGxpa2UgdG8g
a2VlcCB0aGF0IHN0dWZmIG91dCBvZiBncGlvLXJlZ21hcC4gQnV0IEknbSBvbiB0aGUgc2FtZSBi
b2F0DQo+IHJlZ2FyZGluZyB0aGUgcmVmYWN0b3JpbmcgaWYgd2UgaGF2ZSBtb3JlIGRhdGEgYW5k
IHBvdGVudGlhbCB1c2Vycy4NCj4NCj4gLW1pY2hhZWwNCg0KR290IGl0LiBJIHdpbGwgZ28gd2l0
aCBPcHRpb24gIzMgaW4gdGhlIHVwY29taW5nIHY0IHBhdGNoLg0KDQpUaGVyZWZvcmUsIEkgd2ls
bCBkcm9wIHRoZSBwYXRjaGVzIDIsIDMgYW5kIDQgZnJvbSB0aGlzIHNlcmllcywgYW5kIGFkZHJl
c3MNCkFuZHkncyBmZWVkYmFjayBvbiBwYXRjaCA2Lg0KDQpCZXN0LXJlZ2FyZHMsDQpZdSBDaHVu
DQo=

