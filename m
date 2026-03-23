Return-Path: <linux-gpio+bounces-34002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFnVAMEEwWlUPgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:15:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 889732EED1D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 806EE3029260
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71E43859F2;
	Mon, 23 Mar 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="kABur1xZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB323195F5;
	Mon, 23 Mar 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257012; cv=none; b=FsUEoSdvPCCIB7pind2xwmaisx1dcKvpoA4FgrznJUggCXwLKVgogTES7anxAdU52Sbyd8mfJtV4yLZr6okar5Ls/p9wZlwSssNQxLukxGG7uXb9y9sH1DGq/dbZ8gPOMzIBv+BYKO7U/DsGq69zKSPBbcn+KkmfwC/1H+FfOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257012; c=relaxed/simple;
	bh=FPggMhb9eV6CV10c1Jtp79adwp7yMMUlWGYc4nMQ5rA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=euwWEbgMhs9L8dQwn8NhwEXqdO6UOMxnoH0jxtw0Kv2Ip7fAPIJ5LRGQuYinRdwacP8qSjenmSh/agb9mJePPJG1lepL8EFPo86UaIe8ownX0ILZkTkCZoY9dEbaMt14KIeaHYewvoC2K2JK+LPk5UhhHEPMBZTEukkAY8K+buc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=kABur1xZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62N99xe662852590, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774256999; bh=FPggMhb9eV6CV10c1Jtp79adwp7yMMUlWGYc4nMQ5rA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kABur1xZ9jwTR9OK76osxK0Xl1ersyRFaZf7yWfrJDX07iMdDc1DVYVYhTcIMcy6d
	 Hs9qCXrEg6Ggu4Hs2/znSQtTT+DcKlNvXgJGr8IjixIvvIjWtgkH09I8tHYbvkc2is
	 oKvs+7/xVyYXGzIshZjnXZ5oFAoDmILvZnBBMICgrorQgm8Zyh58GnDvKyn0P2Abl7
	 OlOdG/vsCVh3xUXr+Pc5yoQcemejIwXXK+wxXIj3x0Y4yJhvhTHNiDLY9JoCcFdWpL
	 6tkYE3FhX9UYeuurtwzpHJzmFC6XpUGNsEX7EwcbGARByc2OCvd05CNXT7giKsU43t
	 U5VCZ6JSHiwJg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62N99xe662852590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 17:09:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 23 Mar 2026 17:09:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 23 Mar 2026 17:09:58 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Felix Gu <ustc.gu@gmail.com>, Linus Walleij <linusw@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: rtd: Fix error handling for
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH] pinctrl: rtd: Fix error handling for
 devm_platform_ioremap_resource()
Thread-Index: AQHcuIdRe6ZNht1+SU2nBwFZnQfqJ7W71UUw
Date: Mon, 23 Mar 2026 09:09:58 +0000
Message-ID: <800d7dde24ea442aa19cf8484c186079@realtek.com>
References: <20260321-rtd-v1-1-9c2022f73826@gmail.com>
In-Reply-To: <20260321-rtd-v1-1-9c2022f73826@gmail.com>
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
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34002-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.21.1.56:received,172.21.6.41:received];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: 889732EED1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmVsaXggR3UgPHVzdGMu
Z3VAZ21haWwuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMjEsIDIwMjYgMTI6MzQgQU0N
Cj4gVG86IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsgWXUtQ2h1biBMaW4gW+ae
l+elkOWQm10NCj4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiBDYzogbGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEZlbGl4IEd1DQo+
IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBwaW5jdHJsOiBydGQ6IEZp
eCBlcnJvciBoYW5kbGluZyBmb3INCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkN
Cj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4gcmVwbHksIGNsaWNrIGxpbmtzLCBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlKCkgcmV0dXJucyBFUlJfUFRSKCkgb24gZmFpbHVyZSwgbm90IE5VTEwuDQo+
IFRoZSBpbmNvcnJlY3QgTlVMTCBjaGVjayB3b3VsZCBmYWlsIHRvIGRldGVjdCBhY3R1YWwgZXJy
b3JzIGZyb20gdGhlIGlvcmVtYXANCj4gb3BlcmF0aW9uLg0KPiANCj4gRml4IGJ5IHVzaW5nIElT
X0VSUigpIGFuZCBQVFJfRVJSKCkgYXMgZG9jdW1lbnRlZCBmb3IgdGhpcyBBUEkuDQo+IA0KPiBG
aXhlczogYjdmNjk4YjIyYjhiICgicGluY3RybDogcmVhbHRlazogU3dpdGNoIHRvIHVzZSBkZXZt
IGZ1bmN0aW9ucyIpDQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5jIHwgNCAr
Ky0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkLmMN
Cj4gYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5jDQo+IGluZGV4IDYwZGZi
MzliYzk4Ni4uNDI5Yzk0Yjc5YzQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVh
bHRlay9waW5jdHJsLXJ0ZC5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0
cmwtcnRkLmMNCj4gQEAgLTU3NCw4ICs1NzQsOCBAQCBpbnQgcnRkX3BpbmN0cmxfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gY29uc3Qgc3RydWN0IHJ0ZF9waW5jdHJsX2Rl
cw0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+IA0KPiAgICAgICAgIGRhdGEt
PmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+IC0gICAg
ICAgaWYgKCFkYXRhLT5iYXNlKQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
ICsgICAgICAgaWYgKElTX0VSUihkYXRhLT5iYXNlKSkNCj4gKyAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKGRhdGEtPmJhc2UpOw0KPiANCj4gICAgICAgICBkYXRhLT5kZXYgPSAmcGRldi0+
ZGV2Ow0KPiAgICAgICAgIGRhdGEtPmluZm8gPSBkZXNjOw0KPiANCj4gLS0tDQo+IGJhc2UtY29t
bWl0OiBiNWQwODNhM2VkMWUyNzk4Mzk2ZDVlNDkxNDMyZTg4N2RhOGQ0YTA2DQo+IGNoYW5nZS1p
ZDogMjAyNjAzMjEtcnRkLWVmOWJmOWY5Y2VhNw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0K
PiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQoNCkhpIEZlbGl4LA0KDQpUaGFua3MgZm9y
IHRoZSBwYXRjaC4gSG93ZXZlciwgYSBmaXggZm9yIHRoaXMgaGFzIGFscmVhZHkgYmVlbiBhcHBs
aWVkLg0KWzFdOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9saW51c3cvbGludXgtcGluY3RybC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTliYTRlZjY4
NDdiYTUzZGVhOTJlZmNlNDdjOWUwNDRmYmY2ZDZkY2YNCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1
bg0K

