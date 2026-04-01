Return-Path: <linux-gpio+bounces-34556-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOjFEk0DzWmSZQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34556-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 13:36:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401A37994E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 13:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17AE730D3CB0
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 11:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEA33F8DEE;
	Wed,  1 Apr 2026 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="d99bD+lh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38523F8819;
	Wed,  1 Apr 2026 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042562; cv=none; b=bZgQxqI+Bl5JsAUXjn7bR79OzR/zKdIQJadu1hQbMrF0Vx5LmWmMlRaKsEJRiu4W0xOm/TO1gBhwsqVJVTVfSm3scfbJsKg0gTMeOVZsPBrsPiClnTDuT2emskek6hefLbrOlbJzci0Nd6DNDHjk1J0LKFlEP/8YRbBY+EeTIlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042562; c=relaxed/simple;
	bh=TKKyVgRbT8ZQmFZ5cHYxfFQ/zLfhlVOIzYDKTTzTLLA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V1jM6D1Ak8hiaetssfaNcBNo5QBHOzONmTby8vYn/FSuRBBFUTvpLoCZ+4Hlu0RFp8X147hPWlWFr5xPht85hVHn8aaxkugrCy/Ig1frJOqZWE1s1GZeADjbClJQPoq9A//bRRCCnYE8bF7nmW7qx+6luTJ2dIin5cUhwHn0ch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=d99bD+lh; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 631BMPTu8982246, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775042545; bh=TKKyVgRbT8ZQmFZ5cHYxfFQ/zLfhlVOIzYDKTTzTLLA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=d99bD+lhhtv0hG4fWeVAMmk0di6uFDri3ryIAcrY+vIGRf1Q9jIwYG2VBBkua+kQ9
	 7Ii96fB8cge6Ymiy0t3be+4K7+C/KaVzhl9XU9MxQntTTXn6n0LlzNQTFswFNvyrB5
	 GHAlTICPsmYnAdhEvNOPDYuPH0/SN0a0IaRVUETKbrZrkc9ltSaFWv1MdwSUpyNmca
	 eweSGN+J0nKUKXkS72DvPr7oKNEDrR9RE/5Lu1BxJVMNDLVErDQKl2CR5Z8wtijzt9
	 Kqc3RhhZYZbMC0ztkLSb4pJrO1p10kSAqLptnZhwNjnoT/jM0DtTnVyejCp6kb/b9k
	 DKzlY+rJEIP4g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 631BMPTu8982246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Apr 2026 19:22:25 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 1 Apr 2026 19:22:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Apr 2026 19:21:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6]) by
 RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6%4]) with mapi id
 15.02.1748.010; Wed, 1 Apr 2026 19:21:01 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "brgl@kernel.org"
	<brgl@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Thread-Topic: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Thread-Index: AQHcwQz9j/2I4l8xeUaIBgUHywOH77XJT8wAgAC+dwA=
Date: Wed, 1 Apr 2026 11:21:01 +0000
Message-ID: <fbf40f58d38a451883d064f258ec9ce4@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-3-eleanor.lin@realtek.com>
 <20260401-liberal-nondescript-muskrat-0ebe93@quoll>
In-Reply-To: <20260401-liberal-nondescript-muskrat-0ebe93@quoll>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34556-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.92.32:email,realtek.com:dkim,realtek.com:email,realtek.com:mid,0.2.59.24:email,0.0.121.124:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.30.120:email,4f200:email,4e000:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[realtek.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4401A37994E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBPbiBUdWUsIE1hciAzMSwgMjAyNiBhdCAwNzozODozNFBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBBZGQgdGhlIEdQSU8gbm9kZSBmb3IgdGhlIFJlYWx0ZWsgUlREMTYyNSBTb0Mu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9rZW50LmR0
c2kgICAgfCA0Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9yZWFsdGVrL3J0ZDE1MDEuZHRzaSB8ICA4ICsrKysrDQo+ID4gYXJjaC9hcm02NC9i
b290L2R0cy9yZWFsdGVrL3J0ZDE4NjEuZHRzaSB8ICA4ICsrKysrDQo+ID4gYXJjaC9hcm02NC9i
b290L2R0cy9yZWFsdGVrL3J0ZDE5MjAuZHRzaSB8ICA4ICsrKysrDQo+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgNjcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+IA0KPiBXaHkgdGhlIERUUyBpcyBpbiB0aGUg
bWlkZGxlPyBEcml2ZXJzIGNhbm5vdCBkZXBlbmQgb24gaXQuIFBsZWFzZSByZWFkDQo+IHN1Ym1p
dHRpbmcgcGF0Y2hlcyAoYm90aCBkb2N1bWVudHMpLg0KPiANCg0KSSB3aWxsIG1vdmUgRFRTIHRv
IHRoZSBlbmQgaW4gdjIuDQoNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZWFsdGVrL2tlbnQuZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL2tlbnQu
ZHRzaQ0KPiA+IGluZGV4IDhkNDI5M2NkNGMwMy4uNzQ2OTMyYzI2NzI0IDEwMDY0NA0KPiA+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9rZW50LmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsva2VudC5kdHNpDQo+ID4gQEAgLTE1MSw2ICsxNTEsMzkg
QEAgdWFydDA6IHNlcmlhbEA3ODAwIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdwaW86IGdwaW9AMzExMDAgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWlz
by1ncGlvIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgzMTEw
MCAweDM5OD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MzEw
MDAgMHgxMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tY29udHJv
bGxlcjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLXJhbmdlcyA9IDwm
aXNvbV9waW5jdHJsIDAgMCAyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmdmU0X3BpbmN0cmwgMiAwIDY+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpc29fcGluY3RybCA4IDAgND4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlNF9waW5jdHJsIDEy
IDYgMj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
Jm1haW4yX3BpbmN0cmwgMTQgMA0KPiAyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmdmU0X3BpbmN0cmwgMTYgOCA0PiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmbWFpbjJfcGluY3RybCAyMCAyDQo+
IDM+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2
ZTRfcGluY3RybCAyMyAxMg0KPiAzPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmaXNvX3BpbmN0cmwgMjYgNCAyPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmaXNvbV9waW5jdHJsIDI4IDINCj4gMj4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlNF9w
aW5jdHJsIDMwIDE1DQo+IDY+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZtYWluMl9waW5jdHJsIDM2IDUNCj4gNj4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlNF9waW5jdHJsIDQyIDIxDQo+IDM+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpc29f
cGluY3RybCA0NSA2IDY+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPCZ2ZTRfcGluY3RybCA1MSAyNA0KPiAxPiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmaXNvX3BpbmN0cmwgNTIgMTINCj4gMT4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlNF9waW5j
dHJsIDUzIDI1DQo+IDExPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmbWFpbjJfcGluY3RybCA2NA0KPiAxMSAyOD4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlNF9waW5jdHJsIDkyIDM2DQo+IDI+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZpc29f
cGluY3RybCA5NCAxMw0KPiAxOT4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8Jmlzb19waW5jdHJsIDEyOCAzMg0KPiA0PiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmU0X3BpbmN0cmwgMTMyIDM4DQo+
IDEzPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
aXNvX3BpbmN0cmwgMTQ1IDM2DQo+IDE5PiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmdmU0X3BpbmN0cmwgMTY0IDUxDQo+IDI+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+IA0KPiBXaHkgaXMg
aXQgZGlzYWJsZWQ/IFdoYXQgaXMgbWlzc2luZyBpbiB0aGUgU29DPyBXaGljaCByZXNvdXJjZXMg
YXJlIG1pc3Npbmc/DQo+IA0KDQpOb3RoaW5nIGlzIG1pc3NpbmcsIHNvIEkgd2lsbCByZW1vdmUg
c3RhdHVzID0gImRpc2FibGVkIi4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+
ICsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgaXNvX3BpbmN0cmw6IHBpbmN0cmxANGUwMDAg
ew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPQ0KPiAicmVh
bHRlayxydGQxNjI1LWlzby1waW5jdHJsIjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHg0ZTAwMCAweDFhND47IEBAIC0xNjEsNg0KPiArMTk0LDE2DQo+ID4gQEAg
bWFpbjJfcGluY3RybDogcGluY3RybEA0ZjIwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4NGYyMDAgMHg1MD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
IH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgaXNvX21fZ3BpbzogZ3Bpb0A4OTEy
MCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9DQo+ICJy
ZWFsdGVrLHJ0ZDE2MjUtaXNvbS1ncGlvIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHg4OTEyMCAweDEwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8MHg4OTEwMCAweDIwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBncGlvLWNvbnRyb2xsZXI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z3Bpby1yYW5nZXMgPSA8Jmlzb21fcGluY3RybCAwIDAgND47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgfTsNCj4gPiArDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlzb21fcGluY3RybDogcGlu
Y3RybEAxNDYyMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPQ0KPiAicmVhbHRlayxydGQxNjI1LWlzb20tcGluY3RybCI7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MTQ2MjAwIDB4MzQ+OyBkaWZmIC0tZ2l0DQo+ID4g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTUwMS5kdHNpDQo+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTUwMS5kdHNpDQo+ID4gaW5kZXggNjVmN2VkZTNkZjcz
Li5hZTI0NmEwMWYxMjYgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZWFs
dGVrL3J0ZDE1MDEuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9y
dGQxNTAxLmR0c2kNCj4gPiBAQCAtMTAsMyArMTAsMTEgQEANCj4gPiAgJnVhcnQwIHsNCj4gPiAg
ICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gIH07DQo+ID4gKw0KPiA+ICsmZ3BpbyB7DQo+IA0K
PiBXaHkgYXJlbid0IHlvdSBmb2xsb3dpbmcgRFRTIGNvZGluZyBzdHlsZT8gV2hhdCBzdHlsZSBp
cyBhcHBsaWNhYmxlIGZvcg0KPiBSZWFsdGVrPw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0KSSBzaG91bGQgc29ydCB0aGVtIGluIGFscGhhYmV0aWNhbCBvcmRlci4gQnV0IGFm
dGVyIHJlbW92aW5nIHRoZSBzdGF0dXMgcHJvcGVydHksDQp0aGUgYm9hcmQtbGV2ZWwgbm9kZSB3
aWxsIGJlIHJlbW92ZWQgZW50aXJlbHkuDQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg0K

