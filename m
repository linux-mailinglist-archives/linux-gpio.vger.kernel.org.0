Return-Path: <linux-gpio+bounces-39936-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jv9cIFn7U2pJggMAu9opvQ
	(envelope-from <linux-gpio+bounces-39936-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 22:38:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B941745DBB
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 22:38:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alliedtelesis.co.nz header.s=mail181024 header.b=SCBgV0ge;
	dmarc=pass (policy=quarantine) header.from=alliedtelesis.co.nz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39936-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39936-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E57300C017
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 20:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BB539FCB1;
	Sun, 12 Jul 2026 20:38:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B23403E0
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 20:38:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888724; cv=none; b=hCk1+SqXHzi3WWIpgsIU5gIRkK9JP3+WGYP1lKYCOIgZxVaaP7lF7uBKboY9l4b0CgfxecMFg7JNYFY+H4yVTIEXTRRQotvopJm3i7dyUgII/1grHuoH7Q2NLCgvdKTJLMSFfSuWbqoASyKnsxMA49miWCgjDIGiKahK6aUdjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888724; c=relaxed/simple;
	bh=mH8ENsJbhpsdfRsQFWxUq55ZnT/oiRXdGazkn0BC5bw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r2UoHc+Pb1PxC2iZcwWWpDN6+H0FIVkv4Oo42DOpd0BpSIyNQJ/ni0+JMDqBLheEndgx+Fk2j96xzRVRvLXl61mfVANKOMUrvKAERKsnRv5MrZ26gcOB7oONNx7yQG077gkIs9vzjc8wHLsitdZHhTj7TDd9PhGigQoSyaCmPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=SCBgV0ge; arc=none smtp.client-ip=202.36.163.20
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D315F2C03CB;
	Mon, 13 Jul 2026 08:38:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1783888713;
	bh=mH8ENsJbhpsdfRsQFWxUq55ZnT/oiRXdGazkn0BC5bw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SCBgV0geay9tygWZsYRirHTDAN0E3jtodLdzW4AD4hb8B6vtmvScl4hPf8jYmyr9F
	 MwCkt4W2VRAWDOB3UJD6Asbw9EZ0v2OGEZHbZf5mvc1Di1pCvB8ODkv9taSFefBXIZ
	 20HsI5HqQnZ6C25Qs1Mk0bVh9kxh83YZxAhMGEPr+7oSMddKO8siyN5XqpIG1bXyVh
	 trP696Y5lM/Hu8deqBwzLMlKpToROjDvFM1NpEMiLUL9UUccywZ/obi8v2tUAoKtuJ
	 BcX8OIk5B+vXIoBLEFPg+p5hr27Y7RyV5/ZZptIS8QhgGZNhhV0dwyY7cHdoFBFFz8
	 OzR6dDVUzbGnw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a53fb490001>; Mon, 13 Jul 2026 08:38:33 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Mon, 13 Jul 2026 08:38:33 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Mon, 13 Jul 2026 08:38:33 +1200
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: "brgl@kernel.org" <brgl@kernel.org>
CC: "ian.ray@gehealthcare.com" <ian.ray@gehealthcare.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap
 lock
Thread-Topic: [PATCH v2] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap
 lock
Thread-Index: AQHdD16fud0rBsd1oUGCSuXevmav7rZkCreAgAWKJYA=
Date: Sun, 12 Jul 2026 20:38:33 +0000
Message-ID: <207a347a265f3e99cade68842872cd62e07b69e6.camel@alliedtelesis.co.nz>
References: <20260709045116.2304246-1-mark.tomlinson@alliedtelesis.co.nz>
	 <CAMRc=MewrdyKNGrFSjJksphdA9_2sNb8cZk39Doionfoj_nS+w@mail.gmail.com>
In-Reply-To: <CAMRc=MewrdyKNGrFSjJksphdA9_2sNb8cZk39Doionfoj_nS+w@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <10E10D31087482418C41D70255D6AC20@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a53fb49 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=3pNRdvVr4ggA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VwQbUJbxAAAA:8 a=UdqOVh4lrO4Zblwa_V8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39936-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:ian.ray@gehealthcare.com,m:linux-gpio@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mark.Tomlinson@alliedtelesis.co.nz,linux-gpio@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alliedtelesis.co.nz:from_mime,alliedtelesis.co.nz:email,alliedtelesis.co.nz:mid,alliedtelesis.co.nz:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mark.Tomlinson@alliedtelesis.co.nz,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B941745DBB

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDA0OjAyIC0wNDAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBUaHUsIDkgSnVsIDIwMjYgMDY6NTE6MTYgKzAyMDAsIE1hcmsgVG9tbGluc29u
DQo+IDxtYXJrLnRvbWxpbnNvbkBhbGxpZWR0ZWxlc2lzLmNvLm56PiBzYWlkOg0KPiA+IExvY2tp
bmcgaXMgZGlzYWJsZWQgaW4gdGhlIHJlZ21hcCBjb25maWcgYXMgdGhpcyBkcml2ZXIgdXNlcyBp
dHMgb3duDQo+ID4gbG9jay4gVGhpcyBtZWFucyB0aGF0IGFsbCBjYWxscyB0byByZWdtYXAgZnVu
Y3Rpb25zIChyZWFkIG9yIHdyaXRlKQ0KPiA+IG11c3QNCj4gPiBob2xkIHRoZSBpMmNfbG9jay4g
VGhlIGZ1bmN0aW9uIHBjYTk1M3hfaXJxX2J1c19zeW5jX3VubG9jaygpIGRpZCBub3QNCj4gPiBk
bw0KPiA+IHRoaXMsIGFuZCBpdCB3YXMgdGhlcmVmb3JlIHBvc3NpYmxlIHRoYXQgbXVsdGlwbGUg
dGhyZWFkcyBjb3VsZCBjYXVzZQ0KPiA+IGFuDQo+ID4gaW5jb3JyZWN0IHJlZ2lzdGVyIHRvIGJl
IHJlYWQvd3JpdHRlbi4NCj4gPiANCj4gPiBBIHByZXZpb3VzIHBhdGNoIHBhcnRseSBmaXhlZCB0
aGlzLCBidXQgb25seSBwcm90ZWN0ZWQgdGhlIHdyaXRlIHRvIHRoZQ0KPiA+IGludGVycnVwdCBt
YXNrIHJlZ2lzdGVyLCBhbmQgbm90IHRoZSByZWFkIGZyb20gdGhlIGRpcmVjdGlvbiByZWdpc3Rl
ci4NCj4gPiANCj4gPiBGaXhlczogYmZjNjQ0NGI1N2RjICgiZ3BpbzogcGNhOTUzeDogZml4IHBj
YTk1M3hfaXJxX2J1c19zeW5jX3VubG9jaw0KPiA+IHJhY2UiKQ0KPiA+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBUb21saW5zb24gPG1hcmsudG9t
bGluc29uQGFsbGllZHRlbGVzaXMuY28ubno+DQo+ID4gLS0tDQo+IA0KPiBQbGVhc2UgYWx3YXlz
IGluY2x1ZGUgdGhlIGVudGlyZSBjaGFuZ2Vsb2cgZm9yIHRoZSBzZXJpZXMsIEkgZG9uJ3Qga25v
dw0KPiB3aGF0DQo+IGNoYW5nZWQgc2luY2UgdjEgKG5vIG5lZWQgdG8gcmVzZW5kLCBqdXN0IGV4
cGxhaW4gaGVyZSkuDQoNCkNoYW5nZXMgZnJvbSB2MSB0byB2MiBhcmU6DQoNCjEpIEFkZGVkIEZp
eGVzOiBhbmQgQ2M6IHRhZ3MNCjIpIENoYW5nZWQgZnVuY3Rpb24gbmFtZSBmcm9tIF9wY2E5NTN4
X2dwaW9fZGlyZWN0aW9uX2lucHV0KCkgdG8NCiAgIHBjYTk1M3hfZ3Bpb19kaXJlY3Rpb25faW5w
dXRfdW5sb2NrZWQoKS4NCjMpIENoYW5nZWQgJ3Vuc2lnbmVkJyB0byAndW5zaWduZWQgaW50JyBp
biB0aGUgY29kZSBhZmZlY3RlZCBieSB0aGlzIHBhdGNoLg0KDQpUaGVyZSBpcyBubyBmdW5jdGlv
bmFsIGNoYW5nZS4NCg0KVGhhbmtzLA0K

