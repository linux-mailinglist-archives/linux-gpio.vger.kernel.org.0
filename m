Return-Path: <linux-gpio+bounces-4592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2A887D95
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 17:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD3C1C20AB4
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD13D18EB1;
	Sun, 24 Mar 2024 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="DOfkkvfZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender3-op-o19.zoho.com (sender3-op-o19.zoho.com [136.143.184.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CF10A19;
	Sun, 24 Mar 2024 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711297536; cv=pass; b=Hm6CvQ6/2d8ChXK2MBBKH+GtAm/RDPrSVl3NJtCkUHduLrkwtEAwC3fP1YDUr67o8rHFB9pmFF+EQl02GWhIlGK4mUTWOGzPFXGhorSkl1mL9Pk/By2XSjdsRIMZlVNITHIS1ho4W+gSDJFsRUflpZuvaRWdilaeM3WdyzeXbsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711297536; c=relaxed/simple;
	bh=JeMB2NWZTbT997a5kgxOUOlQLWpG0/Qw7g2LM67SmJY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hD6TtUH9DNtXL2x4NxCyEFRE/csJ+8x6xE7EnEcStoTe1NtuVJNMycYCjf28gJAIruzH6y83cxPBufkHx5QSnmWTJYlcJM7ymMJiryTzQvct8Ux6rTHcqbBOzEWw7N80aHx8d4Vx9LKzHXeOzk7T6qMjS3sUzAGBZ2AAyb+C5Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=DOfkkvfZ; arc=pass smtp.client-ip=136.143.184.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1711297504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WsGBankEzAJlt740jSHVX6kXaBHEAlMU8jmpFeJts6BCkhqSsk/6j3E33x9ZxDTpSFd/j+2Rp34fv6CLt+earZOa9bcqDXoDPZN3rHPA5eaI4DTlBsqSAyiSih8UvGfsljhE4Zug064WKHP14dVv4Hw+HsttnMmpPEBni3IJiK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1711297504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JeMB2NWZTbT997a5kgxOUOlQLWpG0/Qw7g2LM67SmJY=; 
	b=ZlnH9kfz57WD34dQwQpEZIE4FHGxneWCEqRiOk4Vh53PljdVm6V6GQC4oi3aJ96leXwJq6XxybNh9r9M+JkGOo5JEigS8KI2YyrjhxH9/WuELUSzyenlhyo6gB0BV/THpv5rC1sjH43+2DeKESK3L0xf/yfTdIFRDS5OdNeP7nc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1711297504;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=JeMB2NWZTbT997a5kgxOUOlQLWpG0/Qw7g2LM67SmJY=;
	b=DOfkkvfZ1lozJ7ATq3fX8vljQSfjSb+poi+EfBKM36Pg22JmGcmquaSv2K2SJSlK
	R+c2tCicorLUGP9ikfEamwjCcnupQ6gHmJWMEfwIghbA70UPd6PNSz67bEOGokewdX4
	UPzILHFgcryyoojlmIMNYorB/HfDLN/MHtxPlE8xyXVCaorRcRzsU3YweufWF/TreEg
	yuPbH/USF8ulj3nNG7g6wL59BihE8CPnSFb2bmlWzQrZeORbIlhpVveVz0PvVhOqzfL
	VicB2sHHWR9P/3k8hLn4wzYqv/DySne7kT4vEVbwqfB3Sdml0IHeARxj8FkxHeWUG4J
	rji3inhG8w==
Received: from edelgard.fodlan.icenowy.me (112.94.101.6 [112.94.101.6]) by mx.zohomail.com
	with SMTPS id 1711297502111650.7104887702016; Sun, 24 Mar 2024 09:25:02 -0700 (PDT)
Message-ID: <53963127c181a76f97ca34b721d11158b45d7f65.camel@icenowy.me>
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and
 k230-evb dts
From: Icenowy Zheng <uwu@icenowy.me>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 25 Mar 2024 00:24:57 +0800
In-Reply-To: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
	 <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

5ZyoIDIwMjQtMDMtMjPmmJ/mnJ/lha3nmoQgMjA6MTIgKzA4MDDvvIxZYW5neXUgQ2hlbuWGmemB
k++8mgo+IEFkZCBpbml0aWFsIGR0cyBmb3IgQ2FuTVYtSzIzMCBhbmQgSzIzMC1FVkIgcG93ZXJl
ZCBieSBDYW5hYW4KPiBLZW5kcnl0ZQo+IEsyMzAgU29DIFsxXS4KPiAKPiBTb21lIGtleSBjb25z
aWRlcmF0aW9uOgo+IAo+IC0gT25seSBwbGFjZSBCaWdDb3JlIHdoaWNoIGlzIDEuNkdIeiBSVjY0
R0NCVgo+IAo+IFRoZSBleGlzdGVuY2Ugb2YgY2FjaGUgY29oZXJlbmNlIGJldHdlZW4gdGhlIHR3
byBjb3JlcyByZW1haW5zCj4gdW5rbm93bgo+IHNpbmNlIHRoZXkgaGF2ZSBkZWRpY2F0ZWQgTDIg
Y2FjaGVzLiBBbmQgdGhlIGZhY3RvcnkgU0RLIHVzZXMgaXQgZm9yCj4gb3RoZXIgT1MgYnkgZGVm
YXVsdC4gSSBkb24ndCBrbm93IHdoZXRoZXIgdGhlIHR3byBDUFVzIG9uIEsyMzAgU29DCj4gY2Fu
IGJlIHVzZWQgaW4gb25lIHN5c3RlbS4gU28gb25seSBwbGFjZSBCaWdDb3JlIGhlcmUuCj4gCj4g
TWVhbndoaWxlLCBhbHRob3VnaCBkb2NzIGZyb20gQ2FuYWFuIHNhaWQgMS42R0h6IENvcmUgd2l0
aCBWZWN0b3IgaXMKPiBDUFUxLCB0aGUgQ1NSLk1IQVJUSUQgb2YgdGhpcyBjb3JlIGlzIDAuCj4g
Cj4gLSBTdXBwb3J0IGZvciAiemJhIiAiemJiIiAiemJjIiAiemJzIiBhcmUgdGVzdGVkIGJ5IGhh
bmQKPiAKPiBUaGUgdXNlciBtYW51YWwgb2YgQzkwOCBmcm9tIFQtSGVhZCBkb2VzIG5vdCBkb2N1
bWVudCBpdAo+IHNwZWNpZmljYWxseS4KPiBJdCBqdXN0IHNhaWQgaXQgc3VwcG9ydHMgQiBleHRl
bnNpb24gVjEuMC4gWzJdCj4gCj4gSSBoYXZlIHRlc3RlZCBpdCBieSB1c2luZyB0aGlzIFszXSB3
aGljaCBhdHRlbXB0cyB0byBleGVjdXRlCj4gImFkZC51dyIsCj4gImFuZG4iLCAiY2xtdWxyIiwg
ImJjbHIiIGFuZCB0aGV5IGRvZXNuJ3QgdHJhcHMgb24gSzIzMC4gQnV0IG9uCj4gSkg3MTEwLAo+
ICJjbG11bHIiIGFuZCAiYmNsciIgd2lsbCB0cmFwLgo+IAo+IC0gU3VwcG9ydCBmb3IgInppY2Jv
bSIgaXMgdGVzdGVkIGJ5IGhhbmQKPiAKPiBIYXZlIHRlc3RlZCB3aXRoIHNvbWUgb3V0LW9mLXRy
ZWUgZHJpdmVycyBmcm9tIFs0XSB0aGF0IG5lZWQgRE1BIGFuZAo+IHRoZXkKPiBkbyBub3QgY29t
ZSB0byB0aGUgZHRzIGN1cnJlbnRseS4KPiAKPiAtIENhY2hlIHBhcmFtZXRlcnMgYXJlIGluZmVy
cmVkIGZyb20gVC1IZWFkIGRvY3MgWzJdIGFuZCBDYW5hYW4gZG9jcwo+IFsxXQo+IAo+IEwxaTog
MzJLQiwgVklQVCA0LVdheSBzZXQtYXNzb2NpYXRpdmUsIDY0QiBDYWNoZWxpbmUKPiBMMWQ6IDMy
S0IsIFZJUFQgNC1XYXkgc2V0LWFzc29jaWF0aXZlLCA2NEIgQ2FjaGVsaW5lCj4gTDI6IDI1NktC
LCBQSVBUIDE2LXdheSBzZXQtYXNzb2NpYXRpdmUsIDY0QiBDYWNoZWxpbmUKPiAKPiBUaGUgbnVt
YmVycyBvZiBjYWNoZSBzZXRzIGFyZSBjYWxjdWxhdGVkIGZyb20gdGhlc2UgcGFyYW1ldGVycy4K
PiAKPiAtIE1NVSBvbmx5IHN1cHBvcnRzIFN2MzkKPiAKPiBUaGUgVC1IZWFkIGRvY3MgWzJdIHNh
eSB0aGUgQzkwOCBjb3JlIGNhbiBiZSBjb25maWd1cmVkIHRvIHN1cHBvcnQKPiBTdjQ4IGFuZAo+
IFN2Mzkgb3Igb25seSBTdjM5LiBPbiBLMjMwLCBJIHRyaWVkIHRvIHdyaXRlICJyaXNjdixzdjQ4
IiBvbiBtbXUtdHlwZQo+IGluCj4gZHRzIGFuZCBib290IHRoZSBtYWlubGluZSBrZXJuZWwuIEhv
d2V2ZXIsIGl0IGZhaWxlZCBkdXJpbmcgdGhlCj4ga2VybmVsCj4gcHJvYmUgYW5kIGZlbGwgYmFj
ayB0byBTdjM5LiBJIGFsc28gdGVzdGVkIGl0IG9uIE0tTW9kZSBzb2Z0d2FyZSwKPiB3cml0aW5n
Cj4gU3Y0OCB0byBzYXRwLm1vZGUgd2lsbCBub3QgdHJhcCBidXQgd2lsbCBsZWF2ZSB0aGUgQ1NS
IHVuY2hhbmdlZC4KPiBXaGlsZQo+IHdyaXRpbmcgU3YzOSwgaXQgd2lsbCB0YWtlIGVmZmVjdC4g
SXQgc2hvd3MgdGhhdCB0aGlzIENQVSBkb2VzIG5vdAo+IHN1cHBvcnQKPiBTdjQ4Lgo+IAo+IC0g
U3ZwYm10IGFuZCBULUhlYWQgTUFFRSBib3RoIHN1cHBvcnRlZAo+IAo+IFQtSGVhZCBDOTA4IGRv
ZXMgc3VwcG9ydCBib3RoIFN2cGJtdCBhbmQgVC1IZWFkIE1BRUUgZm9yIHBhZ2UtYmFzZWQKPiBt
ZW1vcnkKPiBhdHRyaWJ1dGVzIGFuZCBpcyBjb250cm9sbGVkIGJ5IEJJVCgyMSkgb24gQ1NSLk1Y
U1RBVFVTLiBUaGUgU3ZwYm10Cj4gaXMgdXNlZAo+IGhlcmUgZm9yIG1haW5saW5lIGtlcm5lbCBz
dXBwb3J0IGZvciBLMjMwLiBJZiB0aGUga2VybmVsIHdhbnRzIHRvIHVzZQo+IFN2cGJtdCwgdGhl
IE0tTW9kZSBzb2Z0d2FyZSBzaG91bGQgdW5zZXQgQklUKDIxKSBvZiBDU1IuTVhTVEFUVVMKPiBi
ZWZvcmUKPiBlbnRlcmluZyB0aGUgUy1Nb2RlIGtlcm5lbC4gT3RoZXJ3aXNlLCB0aGUga2VybmVs
IHdpbGwgbm90IGJvb3QsIGFzIDAKPiBvbgo+IFQtSGVhZCBNQUVFIGlzIE5vbkNhY2hhYmxlIE1l
bW9yeS4gT25jZSB0aGUga2VybmVsIHN3aXRjaGVzIGZyb20gYmFyZQo+IG1ldGFsCj4gdG8gU3Yz
OSwgSXQgd2lsbCBsb3NlIGRpcnR5IGNhY2hlIGxpbmUgbW9kaWZpY2F0aW9ucyB0aGF0IGhhdmVu
J3QKPiBiZWVuCj4gd3JpdHRlbiBiYWNrIHRvIHRoZSBtZW1vcnkuCj4gCj4gWzFdCj4gaHR0cHM6
Ly9kZXZlbG9wZXIuY2FuYWFuLWNyZWF0aXZlLmNvbS9rMjMwL2Rldi96aC8wMF9oYXJkd2FyZS9L
MjMwX2RhdGFzaGVldC5odG1sI2NoYXB0ZXItMS1pbnRyb2R1Y3Rpb24KPiBbMl0KPiBodHRwczov
L29jYy1pbnRsLXByb2Qub3NzLWFwLXNvdXRoZWFzdC0xLmFsaXl1bmNzLmNvbS9yZXNvdXJjZS8v
MTY5OTI2ODM2OTM0Ny9YdWFuVGllLUM5MDgtVXNlck1hbnVhbC5wZGYKPiBbM10gaHR0cHM6Ly9n
aXRodWIuY29tL2N5eXNlbGYvcnZiX3Rlc3QKPiBbNF0gaHR0cHM6Ly9naXRodWIuY29tL2N5eXNl
bGYvbGludXgvdHJlZS9rMjMwLW1haW5saW5lCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENo
ZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFh
bi9NYWtlZmlsZcKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMv
Y2FuYWFuL2syMzAtY2FubXYuZHRzIHzCoCAyNCArKysrCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2NhbmFhbi9rMjMwLWV2Yi5kdHPCoMKgIHzCoCAyNCArKysrCj4gwqBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2NhbmFhbi9rMjMwLmR0c2nCoMKgwqDCoMKgIHwgMTQwCj4gKysrKysrKysrKysrKysrKysr
KysrKwo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKQo+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAtY2FubXYuZHRzCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIzMC1ldmIuZHRz
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIzMC5k
dHNpCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL01ha2VmaWxl
Cj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9NYWtlZmlsZQo+IGluZGV4IDk4N2QxZjBj
NDFmMC4uN2Q1NGVhNWM2ZjNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2Fu
YWFuL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vTWFrZWZpbGUK
PiBAQCAtMSw2ICsxLDggQEAKPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
PiDCoGR0Yi0kKENPTkZJR19BUkNIX0NBTkFBTikgKz0gY2FuYWFuX2tkMjMzLmR0Ygo+IMKgZHRi
LSQoQ09ORklHX0FSQ0hfQ0FOQUFOKSArPSBrMjEwX2dlbmVyaWMuZHRiCj4gK2R0Yi0kKENPTkZJ
R19BUkNIX0NBTkFBTikgKz0gazIzMC1jYW5tdi5kdGIKPiArZHRiLSQoQ09ORklHX0FSQ0hfQ0FO
QUFOKSArPSBrMjMwLWV2Yi5kdGIKCkJUVyBkaWQgeW91IHRlc3Qgb24gSzIzMCBFVkI/IEkgdGhp
bmsgb25seSBDYW5NViBpcyBjdXJyZW50bHkgcHVibGljbHkKYXZhaWxhYmxlLgoKSWYgSzIzMCBF
VkIgc3VwcG9ydCBpcyBub3QgdGVzdGVkLCBJIHN1Z2dlc3Qgbm90IGFkZGluZyBpdC4KCj4gwqBk
dGItJChDT05GSUdfQVJDSF9DQU5BQU4pICs9IHNpcGVlZF9tYWl4X2JpdC5kdGIKPiDCoGR0Yi0k
KENPTkZJR19BUkNIX0NBTkFBTikgKz0gc2lwZWVkX21haXhfZG9jay5kdGIKPiDCoGR0Yi0kKENP
TkZJR19BUkNIX0NBTkFBTikgKz0gc2lwZWVkX21haXhfZ28uZHRiCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAtY2FubXYuZHRzCj4gYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL2NhbmFhbi9rMjMwLWNhbm12LmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi45NTY1OTE1Y2VhZDYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIzMC1jYW5tdi5kdHMKPiBAQCAtMCwwICsxLDI0IEBA
Cj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIE1JVAo+ICsvKgo+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjQgWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4gKyAq
Lwo+ICsKPiArI2luY2x1ZGUgImsyMzAuZHRzaSIKPiArCj4gKy8gewo+ICvCoMKgwqDCoMKgwqDC
oG1vZGVsID0gIkNhbmFhbiBDYW5NVi1LMjMwIjsKPiArwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxl
ID0gImNhbmFhbixjYW5tdi1rMjMwIiwgImNhbmFhbixrZW5kcnl0ZS1rMjMwIjsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgY2hvc2VuIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Rk
b3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgZGRyOiBtZW1vcnlAMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlZyA9IDwweDAgMHgwIDB4MCAweDIwMDAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqB9
Owo+ICt9Owo+ICsKPiArJnVhcnQwIHsKPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2theSI7
Cj4gK307Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAtZXZi
LmR0cwo+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIzMC1ldmIuZHRzCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY4OThiOGU2MjM2OAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjMwLWV2Yi5kdHMK
PiBAQCAtMCwwICsxLDI0IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
IE9SIE1JVAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgWWFuZ3l1IENoZW4gPGN5eUBj
eXlzZWxmLm5hbWU+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgImsyMzAuZHRzaSIKPiArCj4gKy8g
ewo+ICvCoMKgwqDCoMKgwqDCoG1vZGVsID0gIktlbmRyeXRlIEsyMzAgRVZCIjsKPiArwqDCoMKg
wqDCoMKgwqBjb21wYXRpYmxlID0gImNhbmFhbixrMjMwLXVzaXAtbHAzLWV2YiIsICJjYW5hYW4s
a2VuZHJ5dGUtCj4gazIzMCI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGNob3NlbiB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgi
Owo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGRkcjogbWVtb3J5QDAg
ewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfdHlwZSA9ICJtZW1vcnki
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MHgwIDB4MCAweDAgMHgy
MDAwMDAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArfTsKPiArCj4gKyZ1YXJ0MCB7Cj4gK8Kg
wqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjMwLmR0c2kKPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2Fu
YWFuL2syMzAuZHRzaQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li43ZGE0OTQ5ODk0NWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9jYW5hYW4vazIzMC5kdHNpCj4gQEAgLTAsMCArMSwxNDAgQEAKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAy
NCBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gKwo+ICsvZHRzLXYxLzsK
PiArLyB7Cj4gK8KgwqDCoMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gK8KgwqDCoMKg
wqDCoMKgI3NpemUtY2VsbHMgPSA8Mj47Cj4gK8KgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJj
YW5hYW4sa2VuZHJ5dGUtazIzMCI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGFsaWFzZXMgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXJpYWwwID0gJnVhcnQwOwo+ICvCoMKgwqDC
oMKgwqDCoH07Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGNwdXMgewo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgI3NpemUtY2VsbHMgPSA8MD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHRpbWViYXNlLWZyZXF1ZW5jeSA9IDwyNzAwMDAwMD47Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjcHVAMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInRoZWFkLGM5MDgiLCAicmlzY3YiOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2aWNlX3R5
cGUgPSAiY3B1IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJlZyA9IDwwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJpc2N2LGlzYSA9Cj4gInJ2NjRpbWFmZGN2X3piYV96YmJfemJjX3pic196aWNib21f
c3ZwYm10IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwg
ImYiLAo+ICJkIiwgImMiLCAidiIsICJ6YmEiLCAiemJiIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJ6YmMiLCAiemJzIiwKPiAiemljYm9tIiwgInppY250ciIsICJ6aWNz
ciIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiemlmZW5jZWkiLCAiemlo
cG0iLAo+ICJzdnBibXQiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmlzY3YsY2JvbS1ibG9jay1zaXplID0gPDY0PjsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGQtY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkLWNhY2hl
LXNldHMgPSA8MTI4PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGQtY2FjaGUtc2l6ZSA9IDwzMjc2OD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1zZXRzID0g
PDEyOD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
LWNhY2hlLXNpemUgPSA8MzI3Njg+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGU+Owo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbW11LXR5cGUgPSAicmlzY3Ys
c3YzOSI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9
ICJyaXNjdixjcHUtaW50YyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
I2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsMl9jYWNoZTogbDItY2FjaGUgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJjYWNoZSI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhY2hlLWxldmVsID0gPDI+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FjaGUtc2l6ZSA9IDwyNjIxNDQ+Owo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FjaGUtc2V0
cyA9IDwyNTY+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY2FjaGUtdW5pZmllZDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiAr
wqDCoMKgwqDCoMKgwqB9Owo+ICsKPiArwqDCoMKgwqDCoMKgwqBhcGJfY2xrOiBhcGItY2xrLWNs
b2NrIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJmaXhl
ZC1jbG9jayI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrLWZyZXF1ZW5j
eSA9IDw1MDAwMDAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrLW91
dHB1dC1uYW1lcyA9ICJhcGJfY2xrIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
I2Nsb2NrLWNlbGxzID0gPDA+Owo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoHNvYyB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAi
c2ltcGxlLWJ1cyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVwdC1w
YXJlbnQgPSA8JnBsaWM+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjYWRkcmVz
cy1jZWxscyA9IDwyPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI3NpemUtY2Vs
bHMgPSA8Mj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYS1ub25jb2hlcmVu
dDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmFuZ2VzOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGxpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZjAwMDAw
MDAwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNv
bXBhdGlibGUgPSAiY2FuYWFuLGsyMzAtcGxpYyIgLCJ0aGVhZCxjOTAwLQo+IHBsaWMiOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4ZiAw
eDAwMDAwMDAwIDB4MCAweDA0MDAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50YyAxMT4s
Cj4gPCZjcHUwX2ludGMgOT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCNhZGRyZXNzLWNlbGxzID0gPDA+Owo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2ludGVycnVwdC1jZWxscyA9
IDwyPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJp
c2N2LG5kZXYgPSA8MjA4PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsaW50OiB0aW1lckBmMDQwMDAwMDAg
ewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0
aWJsZSA9ICJjYW5hYW4sazIzMC1jbGludCIsCj4gInRoZWFkLGM5MDAtY2xpbnQiOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4ZiAweDA0
MDAwMDAwIDB4MCAweDAwMDEwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50YyAzPiwKPiA8
JmNwdTBfaW50YyA3PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhcnQwOiBzZXJpYWxAOTE0MDAwMDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHg5MTQwMDAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYXBi
X2Nsaz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlcnJ1cHRzID0gPDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLXNoaWZ0ID0gPDI+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhcnQxOiBzZXJpYWxAOTE0MDEwMDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHg5MTQwMTAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYXBi
X2Nsaz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlcnJ1cHRzID0gPDE3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLXNoaWZ0ID0gPDI+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhcnQyOiBzZXJpYWxAOTE0MDIwMDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHg5MTQwMjAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYXBi
X2Nsaz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlcnJ1cHRzID0gPDE4IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLXNoaWZ0ID0gPDI+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhcnQzOiBzZXJpYWxAOTE0MDMwMDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHg5MTQwMzAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYXBi
X2Nsaz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlcnJ1cHRzID0gPDE5IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLXNoaWZ0ID0gPDI+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVhcnQ0OiBzZXJpYWxAOTE0MDQwMDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHg5MTQwNDAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYXBi
X2Nsaz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlcnJ1cHRzID0gPDIwIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnLXNoaWZ0ID0gPDI+
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVz
ID0gImRpc2FibGVkIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDC
oMKgwqDCoMKgwqB9Owo+ICt9OwoK


