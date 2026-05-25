Return-Path: <linux-gpio+bounces-37454-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIoWKUA7FGqKLAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37454-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:06:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448A5CA486
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C9103014C1E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919FF3812EE;
	Mon, 25 May 2026 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="q95kiARJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380237FF79;
	Mon, 25 May 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710758; cv=none; b=ULspQOvQFPdx6vuJLAFrrnEUveqGrq6zA6BdBEvBODoHRcXV8TUKmZXos1DsDOp717OYFjaD8xISUxNJE97hxm/D8+Pc/cygQpVIyq+MWuLPTyvneQxHLexLyddX4s3GzB7W3wV0AXhgqjWLh4BZhBR4g9Vy30PCn3TzgV/q05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710758; c=relaxed/simple;
	bh=g4jmA0wLNFMtdhk9mLrw27kuJW8fGrwTz+qbHHzP8Sk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HwyP201RFqAJ5ET2Z6bRyR9usgygzovIAg3tp1mge70MVl9eS3ToKJP+88K1/0zTcMUznfCFmVb/U4B8c+5/8J31biuf0cPYViGuDs82+NxruepL5rsMfXDmnvKI/3Gr5PKKycYk6oIQYfTRVEA3G0ullZfA2I/vZFvOo7dMWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=q95kiARJ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PC4B0i81046319, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1779710651; bh=g4jmA0wLNFMtdhk9mLrw27kuJW8fGrwTz+qbHHzP8Sk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=q95kiARJ+v0+InSwyPn20dEQHdjJkN17xVQDcWImGXyilZzaupYlkJFhkFbVB+UEg
	 QM6huuYWVqGf3JNscnpyIk1k+m5Es2WiFJg0x/tGYORw8lwSTwJJIDqeH/vzynq0q8
	 JoQuDL0o/jnoarnAZl9RgPYlsLyXwyjlKWYUrCj0+lCiwnXSoicYQMetFkAeXCRv6B
	 i+G3zGNb8epmeH63VnImxynVyYGAT93KAEtQxN3ZpSW3m/vRJngwUAkJrRNjsryLt3
	 7JKsOWmjCY/gMe1/ra6uPDi7iGc1x4JGeSB1PAvFv+Ivcn0lXOAidwu/vbopPnLyh+
	 yOK2G60wbiFvA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PC4B0i81046319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 May 2026 20:04:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:04:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:04:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 25 May 2026 20:04:10 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, "linusw@kernel.org"
	<linusw@kernel.org>, "mwalle@kernel.org" <mwalle@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
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
	<james.tai@realtek.com>, "brgl@kernel.org" <brgl@kernel.org>
Subject: RE: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Topic: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Index: AQHc4cATn1PDC9J2iUegNlC3h35mQ7YJuQgAgBT/RkA=
Date: Mon, 25 May 2026 12:04:09 +0000
Message-ID: <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
In-Reply-To: <agMM9soiqpG-TRSb@ashevche-desk.local>
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
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37454-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,irq_domain_ops.map:url,realtek.com:mid,realtek.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realtek.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.420];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0448A5CA486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBPbiBUdWUsIE1heSAxMiwgMjAyNiBhdCAxMTozMzoxMkFNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBFeHBvc2UgYW4gYWNjZXNzb3IgZnVuY3Rpb24gdG8gcmV0cmlldmUgdGhlIGdw
aW9fY2hpcCBwb2ludGVyIGZyb20gYQ0KPiA+IGdwaW9fcmVnbWFwIGluc3RhbmNlLg0KPiA+DQo+
ID4gVGhpcyBpcyBuZWVkZWQgYnkgZHJpdmVycyB0aGF0IHVzZSBncGlvX3JlZ21hcCBidXQgYWxz
byBtYW5hZ2UgdGhlaXINCj4gPiBvd24gaXJxX2NoaXAsIHdoZXJlIGdwaW9jaGlwX2VuYWJsZV9p
cnEoKS9ncGlvY2hpcF9kaXNhYmxlX2lycSgpIG11c3QNCj4gPiBiZSBjYWxsZWQgd2l0aCB0aGUg
Z3Bpb19jaGlwIHBvaW50ZXIuDQo+ID4NCj4gPiBBZGQgZ3Bpb19yZWdtYXBfZ2V0X2dwaW9jaGlw
KCkgdG8gYWxsb3cgZHJpdmVycyB3aXRoIGNvbXBsZXggY3VzdG9tDQo+ID4gSVJRIGltcGxlbWVu
dGF0aW9ucy4NCj4gDQo+IEhtbS4uLiBDYW4ndCB3ZSByYXRoZXIgYWRkDQo+IGdwaW9fcmVnbWFw
X2VuYWJsZV9pcnEoKS9ncGlvX3JlZ21hcF9kaXNhYmxlX2lycSgpDQo+IHRoYXQgdGFrZSByZWdt
YXAgb3IgR1BJTyByZWdtYXAgKHdoYXRldmVyIHN1aXRzIGJldHRlciBmb3IgdGhlIHB1cnBvc2Up
IGFuZA0KPiBkbyB0aGUgbWFnaWMgaW5zaWRlIEdQSU8gcmVnbWFwIGxpYnJhcnkgY29kZT8NCj4g
DQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0K
DQpUaGFua3MgZm9yIHRoZSByZXZpZXchIEkgYXBvbG9naXplIGZvciB0aGUgbWlzbGVhZGluZyBj
b21taXQgbWVzc2FnZS4NClRoZSByZWFsIHJlYXNvbiBJIG5lZWQgdGhlIHN0cnVjdCBncGlvX2No
aXAgcG9pbnRlciBpcyB0byBwcm9wZXJseSBzZXQgdXAgYSBjdXN0b20NCklSUSBkb21haW4uIE91
ciBTb0MgR1BJTyBjb250cm9sbGVyIGlzIHF1aXRlIGNvbXBsZXguIEl0IHJvdXRlcyBkaWZmZXJl
bnQgdHJpZ2dlcg0KdHlwZXMgdG8gbXVsdGlwbGUgcGFyZW50IElSUXMsIHdoaWNoIGRvZXNuJ3Qg
Zml0IHRoZSBnZW5lcmljIHJlZ21hcF9pcnEgZnJhbWV3b3JrLg0KVGhlcmVmb3JlLCB3ZSBoYXZl
IHRvIGNyZWF0ZSBvdXIgb3duIGlycV9kb21haW4gYW5kIHBhc3MgaXQgdG8NCmdwaW9fcmVnbWFw
X2NvbmZpZy5pcnFfZG9tYWluLg0KDQpUaGUgY29yZSBwcm9ibGVtIG9jY3VycyBpbnNpZGUgb3Vy
IGN1c3RvbSBpcnFfZG9tYWluX29wcy5tYXAoKSBjYWxsYmFjazoNCg0Kc3RhdGljIGludCBydGQx
NjI1X2dwaW9faXJxX21hcChzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25lZCBpbnQg
aXJxLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfaHdfbnVtYmVyX3QgaHdp
cnEpDQp7DQoJc3RydWN0IHJ0ZDE2MjVfZ3BpbyAqZGF0YSA9IGRvbWFpbi0+aG9zdF9kYXRhOw0K
CXN0cnVjdCBncGlvX2NoaXAgKmdjID0gZGF0YS0+Z3Bpb19jaGlwOw0KDQoJLyogDQoJICogVGhl
IHNlY29uZCBhcmd1bWVudCBNVVNUIGJlIHN0cnVjdCBncGlvX2NoaXAgKi4NCgkgKiBJZiB3ZSBw
YXNzIG91ciBjdXN0b20gZGF0YSBzdHJ1Y3R1cmUgaGVyZSwgdGhlIGtlcm5lbCB3aWxsIHBhbmlj
IGxhdGVyIA0KCSAqIGluIGdwaW9jaGlwX2lycV9yZXFyZXMoKSB3aGVuIGl0IGNhbGxzIGlycV9k
YXRhX2dldF9pcnFfY2hpcF9kYXRhKCkNCgkgKiBhbmQgc3RyaWN0bHkgZXhwZWN0cyBpdCB0byBi
ZSBhIGdwaW9fY2hpcC4NCgkgKi8NCglpcnFfc2V0X2NoaXBfZGF0YShpcnEsIGdjKTsNCg0KCWly
cV9zZXRfbG9ja2RlcF9jbGFzcyhpcnEsICZydGQxNjI1X2dwaW9faXJxX2xvY2tfY2xhc3MsDQoJ
CQkJJnJ0ZDE2MjVfZ3Bpb19pcnFfcmVxdWVzdF9jbGFzcyk7DQoNCglpcnFfc2V0X2NoaXBfYW5k
X2hhbmRsZXIoaXJxLCAmcnRkMTYyNV9pc29fZ3Bpb19pcnFfY2hpcCwgaGFuZGxlX2JhZF9pcnEp
Ow0KCWlycV9zZXRfbm9wcm9iZShpcnEpOw0KDQoJcmV0dXJuIDA7DQp9DQoNCldpdGhvdXQgYW4g
YWNjZXNzb3IgbGlrZSBncGlvX3JlZ21hcF9nZXRfZ3Bpb2NoaXAoKSwgd2UgY2Fubm90IHJldHJp
ZXZlIHRoZQ0KZ3Bpb19jaGlwIGluc3RhbnRpYXRlZCBpbnNpZGUgZ3Bpby1yZWdtYXAuYyB0byBm
dWxmaWxsIHRoZXNlIHJlcXVpcmVtZW50cyBpbiBvdXINCm1hcCgpIGZ1bmN0aW9uLg0KDQpCZWZv
cmUgSSBzZW5kIGEgdjQsIEkgc2VlIDMgcG9zc2libGUgcGF0aHM6DQoNCk9wdGlvbiAxOiBLZWVw
IHRoZSBhY2Nlc3NvciAoQ3VycmVudCB2MyBhcHByb2FjaCkNCldlIGtlZXAgZ3Bpb19yZWdtYXBf
Z2V0X2dwaW9jaGlwKCkgYnV0IEkgd2lsbCBjb21wbGV0ZWx5IHJld3JpdGUgdGhlIGNvbW1pdCBt
ZXNzYWdlDQp0byBleHBsYWluIHRoZSBjdXN0b20gaXJxX2RvbWFpbl9vcHMubWFwIGFuZCBsb2Nr
ZGVwIHJlcXVpcmVtZW50cy4NCg0KT3B0aW9uIDI6IExldCBncGlvbGliIGNyZWF0ZSB0aGUgaXJx
X2RvbWFpbiB2aWEgZ3Bpb19yZWdtYXBfY29uZmlnDQpJbnN0ZWFkIG9mIGNyZWF0aW5nIHRoZSBp
cnFfZG9tYWluIGluIG91ciBkcml2ZXIsIHdlIGFkZCBhbGwgbmVjZXNzYXJ5IElSUSBmaWVsZHMN
CihpcnFfY2hpcCwgaXJxX2hhbmRsZXIsIGlycV9wYXJlbnRzLCBldGMuKSBpbnRvIHN0cnVjdCBn
cGlvX3JlZ21hcF9jb25maWcuIFRoZW4NCmdwaW8tcmVnbWFwLmMgcG9wdWxhdGVzIHRoZSBncGlv
X2lycV9jaGlwIHN0cnVjdHVyZSBiZWZvcmUgY2FsbGluZyANCmdwaW9jaGlwX2FkZF9kYXRhKCku
IFRoaXMgcHJldmVudHMgYW4gZWFybHkgcmV0dXJuIGFuZCBhbGxvd3MgdGhlIGNvcmUgZ3Bpb2xp
Yg0KKGdwaW9jaGlwX2FkZF9pcnFjaGlwKCkpIHRvIGF1dG9tYXRpY2FsbHkgY3JlYXRlIHRoZSBp
cnFfZG9tYWluIGZvciB1cy4NCkRyYXdiYWNrOiBUaGlzIGFkZHMgYSBsb3Qgb2YgZmllbGRzIHRv
IGdwaW9fcmVnbWFwX2NvbmZpZyBhbmQgbWlnaHQgdmlvbGF0ZSB0aGUNCm9yaWdpbmFsIGRlc2ln
biBwaGlsb3NvcGh5IG9mIGdwaW8tcmVnbWFwLmMgKGNvbW1pdCBlYmUzNjMxOTdlNTIpLCB3aGlj
aCBleHBsaWNpdGx5DQpzdGF0ZXMgdGhhdCBpdCBkb2VzIG5vdCBpbXBsZW1lbnQgaXRzIG93biBJ
UlEgY2hpcCBhbmQgZGVsZWdhdGVzIGl0IHRvIHRoZSBwYXJlbnQNCmRyaXZlci4NCg0KT3B0aW9u
IDM6IERyb3AgZ3Bpby1yZWdtYXAgZW50aXJlbHkgKFJldmVydCB0byB2MiBhcHByb2FjaCkNCkN1
cnJlbnRseSwgYWxsIGRyaXZlcnMgdXNpbmcgZ3Bpby1yZWdtYXAgKG1vc3RseSBzaW1wbGUgQ1BM
RHMgYW5kIGV4dGVybmFsIEkvTyBjYXJkcykNCnVzZSByZWdtYXAtaXJxIHRvIGdldCB0aGVpciBk
b21haW4uIFNpbmNlIG91ciBTb0MgaGFzIGEgY29tcGxleCBJUlEgcm91dGluZyBzY2hlbWUNCndp
dGggbXVsdGlwbGUgcGFyZW50cywgbWF5YmUgZ3Bpby1yZWdtYXAgaXMgc2ltcGx5IG5vdCB0aGUg
cmlnaHQgdG9vbCBmb3IgdGhpcw0KaGFyZHdhcmUsIGFuZCB3ZSBzaG91bGQganVzdCBpbXBsZW1l
bnQgYSBzdGFuZGFyZCBHUElPIGRyaXZlciBkaXJlY3RseSB1c2luZyBncGlvbGliLg0KDQpXaGlj
aCBhcHByb2FjaCB3b3VsZCB5b3UgcHJlZmVyIHVwc3RyZWFtPw0KDQpCZXN0IHJlZ2FyZHMsDQpZ
dS1DaHVuDQo=

