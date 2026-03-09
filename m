Return-Path: <linux-gpio+bounces-32810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ65Oe6prmknHgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 12:07:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728F23791B
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 12:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC533091C91
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 11:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B2A3939B7;
	Mon,  9 Mar 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fwxmZ9ha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2631196C;
	Mon,  9 Mar 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054196; cv=none; b=V0o2ldtpuXR6j5MVRIkhnks4xFVEg1H48gCoewElFWG2CIVXgtITe7dvEPD93xqixminrwmyAjyMJLRBUvElf/tFnhiM4U+Dg9LyvScRu9gEqMeWkcYxOBE9ixXhq5mwyBc7GNfNgcIioropl8LQjkaQ1hdCviQEzZjAihSK8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054196; c=relaxed/simple;
	bh=O1QEU3QKEQE6a2+Re4VYj+Jk8g8AHzUb5sI5a0hZZp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bZpM1MVItUnmQfTtNgKcPDa2Gi1cJXeWgVymg+87aVQySvZwrt8LO6833Jnl14TE2RMkSI6kv1ymEEoNSRZ7j1WTyeKEMTx3u105CJBaeCjJk6SlcAQNFUf+ExNUJ4JFRiCabF16z/YdrYX7Re5BZQ26qc0uSp58ymtxRzE0p0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fwxmZ9ha; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 629B0YVZ0399648, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773054034; bh=O1QEU3QKEQE6a2+Re4VYj+Jk8g8AHzUb5sI5a0hZZp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fwxmZ9haWt10UR5oCYBJszlzbq+LtgtbVsWN2OjsdadXJo6fliA2A4J+A9ZZtz8CX
	 JgP2zFJXfsW5f6v40PlYOHBdrBrSjAQX1Oay4Bni3rNiwTZ3tqMt8+p4C+5771xWK4
	 8PmVMSGkX9FvUe/1wITkwxiK/84sp9OcRcHSqWuERSXfVbQKrfFvtc0SuWNM5JkyLX
	 boykeCqc7njPnhSF1Y8yQ2dbSVG0SVQqGKJwHg7OXk1ojTn/BtQcKnl+KBFV8xe2px
	 AgWHYHDVel/ZumN4WJvt5cptTHpRSG2Du728r4fYuWDI36cG3Su5RhOaikoK7FBVEI
	 a0TP2wvxEXehQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 629B0YVZ0399648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 19:00:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 19:00:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 19:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 19:00:29 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "linusw@kernel.org"
	<linusw@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Topic: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Index: AQHcrT45GXc0XObXlE68QVSv60G8LrWigisAgANt3nD//4tdgIAAkCpQ
Date: Mon, 9 Mar 2026 11:00:28 +0000
Message-ID: <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
 <20260307-purring-kind-binturong-1fcb37@quoll>
 <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
 <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
In-Reply-To: <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
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
X-Rspamd-Queue-Id: 5728F23791B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32810-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,realtek.com:dkim,realtek.com:email,realtek.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[realtek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PiBPbiAwOS8wMy8yMDI2IDEwOjE4LCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
Pj4gT24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDM6NTI6MzlQTSArMDgwMCwgWXUtQ2h1biBMaW4g
d3JvdGU6DQo+ID4+PiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4g
Pj4+DQo+ID4+PiBSZW5hbWUgJ3JlYWx0ZWssZHV0eS1jeWNsZScgdG8gJ3JlYWx0ZWsscHVsc2Ut
d2lkdGgtYWRqdXN0Jy4NCj4gPj4+DQo+ID4+PiBUaGUgcHJldmlvdXMgbmFtZSB3YXMgbWlzbGVh
ZGluZyBiZWNhdXNlIHRoaXMgaGFyZHdhcmUgYmxvY2sgaXMgbm90DQo+ID4+PiBhIFBXTSBnZW5l
cmF0b3IuIEl0IGRvZXMgbm90IGdlbmVyYXRlIGEgc2lnbmFsIHdpdGggYSBzcGVjaWZpYw0KPiA+
Pj4gZnJlcXVlbmN5IGFuZCBkdXR5IHJhdGlvLg0KPiA+Pj4NCj4gPj4+IEluc3RlYWQsIGl0IHBy
b3ZpZGVzIGEgZml4ZWQgbmFub3NlY29uZC1sZXZlbCBhZGp1c3RtZW50IHRvIHRoZQ0KPiA+Pj4g
cmlzaW5nLyBmYWxsaW5nIGVkZ2VzIG9mIGFuIGV4aXN0aW5nIHNpZ25hbC4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPj4+
IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1
ZS1waW5jdHJsLnlhbWwgICAgICAgfCA5ICsrKysrKy0tLQ0KPiA+Pj4gIC4uLi9iaW5kaW5ncy9w
aW5jdHJsL3JlYWx0ZWsscnRkMTMxOWQtcGluY3RybC55YW1sICAgICAgIHwgOSArKysrKystLS0N
Cj4gPj4+ICAuLi4vYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwueWFt
bCAgICAgICB8IDkgKysrKysrLS0tDQo+ID4+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQNCj4gPj4+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1
ZS1waW5jdHJsDQo+ID4+PiAueQ0KPiA+Pj4gYW1sDQo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRkMTMxNWUtcGluY3RybA0KPiA+Pj4g
LnkgYW1sIGluZGV4IDkwYmQ0OWQ4N2QyZS4uN2IzODg4YjJjZWE4IDEwMDY0NA0KPiA+Pj4gLS0t
DQo+ID4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0
ZWsscnRkMTMxNWUtcGluY3RybA0KPiA+Pj4gLnkNCj4gPj4+IGFtbA0KPiA+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1ZS1w
aW4NCj4gPj4+ICsrKyBjdA0KPiA+Pj4gKysrIHJsLnlhbWwNCj4gPj4+IEBAIC0xMzMsMTAgKzEz
MywxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gPj4+ICAgICAgICAgIG1pbmltdW06IDANCj4g
Pj4+ICAgICAgICAgIG1heGltdW06IDcNCj4gPj4+DQo+ID4+PiAtICAgICAgcmVhbHRlayxkdXR5
LWN5Y2xlOg0KPiA+Pj4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0Og0KPiA+Pg0K
PiA+PiBObywgdGhhdCdzIEFCSSBicmVhayB3aXRob3V0IGV4cGxhbmF0aW9uLiAibWlzbGVhZGlu
ZyIgaXMgbm90IHRoZQ0KPiA+PiBzdWZmaWNpZW50IGFyZ3VtZW50IGZvciBicmVha2luZyBBQkku
DQo+ID4+IFlvdSBhcmUgc3R1Y2sgd2l0aCB0aGUgQUJJIHlvdSBhZGRlZCBiYWNrIGluIDIwMjMu
DQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywNCj4gPj4gS3J6eXN6dG9mDQo+ID4NCj4gPiBUaGUg
cmVhc29uIEkgcmVuYW1lZCAncmVhbHRlayxkdXR5LWN5Y2xlJyB0bw0KPiA+ICdyZWFsdGVrLHB1
bHNlLXdpZHRoLWFkanVzdCcgaXMgdGhhdCBkdXJpbmcgdGhlIHYxIHJldmlldywgaXQgd2FzDQo+
ID4gcG9pbnRlZCBvdXQgdGhhdCB0aGUgbmFtZSBjYXVzZWQgY29uZnVzaW9uIHdpdGggc3RhbmRh
cmQgUFdNIGJpbmRpbmdzDQo+ID4gWzFdLiBTaW5jZSBJIG5lZWQgdG8gbW9kaWZ5IHRoZSBkcml2
ZXIgbG9naWMgdG8gYWRkcmVzcyB0aGlzLCBJIGludGVuZGVkIHRvDQo+IHVwZGF0ZSB0aGUgYmlu
ZGluZyBzaW11bHRhbmVvdXNseS4NCj4gDQo+IEFnYWluLCBjb25mdXNpb24gaXMgbm90IHJlYXNv
biB0byBicmVhayBBQkkuDQo+IA0KPiA+DQo+ID4gQWx0aG91Z2ggdGhlIGJpbmRpbmcgd2FzIGFk
ZGVkIGluIDIwMjMsIHRoZXJlIGFyZSBjdXJyZW50bHkgbm8gRFRTDQo+ID4gZmlsZXMgaW4gdGhl
IG1haW5saW5lIGtlcm5lbCB0aGF0IHVzZSB0aGUgMTMxNWUsIDEzMTlkLCBvciAxNjE5YiBwaW5j
dHJsDQo+IGRldmljZSBub2Rlcy4NCj4gDQo+IFN0aWxsIEFCSS4NCj4gDQo+ID4gVGhlcmVmb3Jl
LCBjaGFuZ2luZyB0aGlzIHByb3BlcnR5IG5hbWUgd2lsbCBub3QgYnJlYWsgYW55IGV4aXN0aW5n
DQo+ID4gZGV2aWNlIHN1cHBvcnQgaW4gdGhlIG1haW5saW5lIHRyZWUuDQo+IA0KPiBZZWFoLCBi
dXQgd2lsbCBicmVhayBhbGwgb3RoZXIgdXNlcnMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KDQpJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiBJIHdpbGwgZHJvcCB0aGUgcHJv
cGVydHkgcmVuYW1lIGFuZCBrZWVwDQpyZWFsdGVrLGR1dHktY3ljbGUsIGJ1dCBJIHdpbGwgdXBk
YXRlIGl0cyBkZXNjcmlwdGlvbiBpbiB2MyB0byBtYWtlIGl0IGNsZWFyZXIuDQoNCkhpIExpbnVz
LA0KQWx0aG91Z2ggeW91IGFncmVlZCB3aXRoIHRoZSByZW5hbWUgdG8gcmVhbHRlayxwdWxzZS13
aWR0aC1hZGp1c3QgaW4gdjEsIEkNCndpbGwgcmV2ZXJ0IHRvIHRoZSBvcmlnaW5hbCBuYW1lIHJl
YWx0ZWssZHV0eS1jeWNsZSB0byBzdHJpY3RseSByZXNwZWN0IHRoZQ0KRFQgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBydWxlcy4gSSBob3BlIHRoaXMgaXMgZmluZSB3aXRoIHlvdS4NCg0KQmVzdCBy
ZWdhcmRzLA0KWXUtQ2h1bg0K

