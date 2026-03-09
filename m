Return-Path: <linux-gpio+bounces-32801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HCMBc2Qrmk7GQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:20:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A133F2360CA
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B80302EE9F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAAD37757B;
	Mon,  9 Mar 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="eyzmddQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492BF24DCF9;
	Mon,  9 Mar 2026 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047905; cv=none; b=Nq93sIXbxhzucUir71rc1+uU0xAEMTKH8CCyJLRt/degq45TIEzxbvGxZe5rgZbPWds/Y7r+shLixK5XGHcQtczeeaI59l/KtvaR/yqlGzbm+f/e7tGIl96rD3MpcVWuPij3mvwjP3fY+O5RXuF+hLgCavKuex3Rj31FyHM52pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047905; c=relaxed/simple;
	bh=BLKn0D3+caEG0fRfWnqbTBNVYksxlzArBkfJ/TX4iJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bK5BNKlOXHZAmABfl7OMq2I1A+qDycNX18CiZeXHJCftYP39TCBaVWRJdI+UtTYQZ1k3/qkKZIQZ/aFqYHyNyajCB8zaizwOi5lT3Yn971GQwVZpsSpEtSP6E9UWX5UkNmKk9pTHWEzSYhKWwB6CdJyU66/rRsSp1DxwuiBV1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=eyzmddQ1; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6299I3TV0266110, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773047883; bh=BLKn0D3+caEG0fRfWnqbTBNVYksxlzArBkfJ/TX4iJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=eyzmddQ1fCKznvjwToIpJ9OOcW0YqfvI1KGwxaui6GYNcM0PvdWOfIhguLEgB3RDx
	 2G5qjQBH2TTKpUzKm9aPaoMxI/D3ueoe3R5D1YtWdfSJ1PAm4S2gXixAHMUouK0Wcp
	 izuTq2IJNJs43DizFPMrJCrJyAJTjoHOkh3dyqlFbNaQ93j7/+D5PFqHYgL3fovH0o
	 9D3id/M6jF+A8XhcXinJ8dL4P6m5r6sdF+8TYrnrwgou65+KzkJYUDh6D5HdlBlsHh
	 VeaoE50WedvQMXXsHLpUQrmpNgfbDVy5VqTTtcI8hSaxrJlP0yUFUyzQNfC75BSXSU
	 YYTtwpp6YXrfw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6299I3TV0266110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:18:03 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:18:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:18:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 17:18:03 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
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
Thread-Index: AQHcrT45GXc0XObXlE68QVSv60G8LrWigisAgANt3nA=
Date: Mon, 9 Mar 2026 09:18:03 +0000
Message-ID: <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
 <20260307-purring-kind-binturong-1fcb37@quoll>
In-Reply-To: <20260307-purring-kind-binturong-1fcb37@quoll>
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
X-Rspamd-Queue-Id: A133F2360CA
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32801-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwMzo1MjozOVBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPg0K
PiA+IFJlbmFtZSAncmVhbHRlayxkdXR5LWN5Y2xlJyB0byAncmVhbHRlayxwdWxzZS13aWR0aC1h
ZGp1c3QnLg0KPiA+DQo+ID4gVGhlIHByZXZpb3VzIG5hbWUgd2FzIG1pc2xlYWRpbmcgYmVjYXVz
ZSB0aGlzIGhhcmR3YXJlIGJsb2NrIGlzIG5vdCBhDQo+ID4gUFdNIGdlbmVyYXRvci4gSXQgZG9l
cyBub3QgZ2VuZXJhdGUgYSBzaWduYWwgd2l0aCBhIHNwZWNpZmljIGZyZXF1ZW5jeQ0KPiA+IGFu
ZCBkdXR5IHJhdGlvLg0KPiA+DQo+ID4gSW5zdGVhZCwgaXQgcHJvdmlkZXMgYSBmaXhlZCBuYW5v
c2Vjb25kLWxldmVsIGFkanVzdG1lbnQgdG8gdGhlDQo+ID4gcmlzaW5nLyBmYWxsaW5nIGVkZ2Vz
IG9mIGFuIGV4aXN0aW5nIHNpZ25hbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENo
YW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBM
aW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4g
TGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdz
L3BpbmN0cmwvcmVhbHRlayxydGQxMzE1ZS1waW5jdHJsLnlhbWwgICAgICAgfCA5ICsrKysrKy0t
LQ0KPiA+ICAuLi4vYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTlkLXBpbmN0cmwueWFt
bCAgICAgICB8IDkgKysrKysrLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWss
cnRkMTYxOWItcGluY3RybC55YW1sICAgICAgIHwgOSArKysrKystLS0NCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVh
bHRlayxydGQxMzE1ZS1waW5jdHJsLnkNCj4gPiBhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRkMTMxNWUtcGluY3RybC55DQo+ID4g
YW1sIGluZGV4IDkwYmQ0OWQ4N2QyZS4uN2IzODg4YjJjZWE4IDEwMDY0NA0KPiA+IC0tLQ0KPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQx
MzE1ZS1waW5jdHJsLnkNCj4gPiBhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEzMTVlLXBpbmN0DQo+ID4gKysrIHJsLnlh
bWwNCj4gPiBAQCAtMTMzLDEwICsxMzMsMTMgQEAgcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gICAg
ICAgICAgbWluaW11bTogMA0KPiA+ICAgICAgICAgIG1heGltdW06IDcNCj4gPg0KPiA+IC0gICAg
ICByZWFsdGVrLGR1dHktY3ljbGU6DQo+ID4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRq
dXN0Og0KPiANCj4gTm8sIHRoYXQncyBBQkkgYnJlYWsgd2l0aG91dCBleHBsYW5hdGlvbi4gIm1p
c2xlYWRpbmciIGlzIG5vdCB0aGUgc3VmZmljaWVudA0KPiBhcmd1bWVudCBmb3IgYnJlYWtpbmcg
QUJJLg0KPiBZb3UgYXJlIHN0dWNrIHdpdGggdGhlIEFCSSB5b3UgYWRkZWQgYmFjayBpbiAyMDIz
Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KVGhlIHJlYXNvbiBJIHJlbmFt
ZWQgJ3JlYWx0ZWssZHV0eS1jeWNsZScgdG8gJ3JlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0JyBp
cyB0aGF0DQpkdXJpbmcgdGhlIHYxIHJldmlldywgaXQgd2FzIHBvaW50ZWQgb3V0IHRoYXQgdGhl
IG5hbWUgY2F1c2VkIGNvbmZ1c2lvbiB3aXRoDQpzdGFuZGFyZCBQV00gYmluZGluZ3MgWzFdLiBT
aW5jZSBJIG5lZWQgdG8gbW9kaWZ5IHRoZSBkcml2ZXIgbG9naWMgdG8gYWRkcmVzcw0KdGhpcywg
SSBpbnRlbmRlZCB0byB1cGRhdGUgdGhlIGJpbmRpbmcgc2ltdWx0YW5lb3VzbHkuDQoNCkFsdGhv
dWdoIHRoZSBiaW5kaW5nIHdhcyBhZGRlZCBpbiAyMDIzLCB0aGVyZSBhcmUgY3VycmVudGx5IG5v
IERUUyBmaWxlcyBpbiB0aGUNCm1haW5saW5lIGtlcm5lbCB0aGF0IHVzZSB0aGUgMTMxNWUsIDEz
MTlkLCBvciAxNjE5YiBwaW5jdHJsIGRldmljZSBub2Rlcy4NClRoZXJlZm9yZSwgY2hhbmdpbmcg
dGhpcyBwcm9wZXJ0eSBuYW1lIHdpbGwgbm90IGJyZWFrIGFueSBleGlzdGluZyBkZXZpY2Ugc3Vw
cG9ydA0KaW4gdGhlIG1haW5saW5lIHRyZWUuDQoNCkFzIGZvciB0aGUgcGF0Y2ggc3RydWN0dXJl
LCBJIHNlcGFyYXRlZCB0aGUgYmluZGluZyBhbmQgZHJpdmVyIGNoYW5nZXMgc29sZWx5DQpiZWNh
dXNlIGNoZWNrcGF0Y2gucGwgd2FybmVkOg0KIldBUk5JTkc6IERUIGJpbmRpbmcgZG9jcyBhbmQg
aW5jbHVkZXMgc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2guIg0KDQpHaXZlbiB0aGF0IHRoZXJl
IGFyZSBubyBhY3R1YWwgdXNlcnMgb2YgdGhpcyBwcm9wZXJ0eSBpbiB0aGUgY3VycmVudCBtYWlu
bGluZSBEVFMsDQp3b3VsZCBpdCBiZSBhY2NlcHRhYmxlIHRvIHByb2NlZWQgd2l0aCB0aGlzIHJl
bmFtZT8NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9kNWJlMzU3YzE0Yjg0MTU1
YWRmYThhOWYwMGE2NGQ4M0ByZWFsdGVrLmNvbS8NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0K

