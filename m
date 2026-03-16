Return-Path: <linux-gpio+bounces-33460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKIsG0nJt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E540B296C20
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66276305ED07
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A855383C80;
	Mon, 16 Mar 2026 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Rda9qxTi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44423481B1;
	Mon, 16 Mar 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651914; cv=none; b=D1Kg0YjcVZxqTtQDrRM6MkHby/FCRqM9E87/WgJBu9QWwtmREH4uoxH9m1CDhBDpVxKN6OvGjVUeQgCeQaQbTswoLCdvKIHyBqVM8mnE3MmxRJ5BHPVPnw+o6JepwgZimKnjGDoACG5A0cM/VypyK3rdefSU+S6ZWP+MX68jX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651914; c=relaxed/simple;
	bh=sEv7H8wUAD+BrP8ZuaOLnqDLbw8fyN/qFrh0I0eyPFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EIZwJnMeSuBQkNQyGuzkeDDqLcMVx9yP6tB9/kkjizftqT7ijAG3ZuDQdRZypYHVVoyg0pwUlLisC7bLBrdRHD56t0v7++sUZOXJ8qeGkVU2au9NCpxPQpEW2xMJweiAtjL+z59sQlTr6jD1mV6KAYk76Y7b8MtuyvD0zBWrSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Rda9qxTi; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62G92P7X01603540, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773651745; bh=sEv7H8wUAD+BrP8ZuaOLnqDLbw8fyN/qFrh0I0eyPFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Rda9qxTiZq5vTbF9pDXFqoP1NIzYJh4pFSzEzAaSZlZvsh47eA72FQfJTKB+j4wdb
	 jiFFSFwie3K8kYcSgQ4ogKm7ZZrUcCeQViK68nhr86+9RuHgA4A8z3GxYlZuSmu2tH
	 YPSfntY9hFAVzePpI/ZyM4Rzu94gx0I1NTvN5fKja0Maoa1Jg6W+H4Dwo6AJ68ILpi
	 dgFladqqqrzl7Chp066AUndgVTgeLdRU0NBo+d3xEYjiZ7yVgWhZwgKxtM1AltYYaO
	 GpyfXfTS4pu2aTDAFgZNk6dQh6cxcaY+3iaM5w6DtFU9tkOj+QpVPRou+LMCRNfIBO
	 6npqXcp/4MaQA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62G92P7X01603540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 17:02:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 16 Mar 2026 17:02:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 16 Mar 2026 17:02:26 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Conor Dooley <conor@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>,
        =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
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
Subject: RE: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Topic: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Thread-Index: AQHcshOoiOeMTeCCV0q5pdIUUbkMA7WqpPCAgAAAoQCABj094A==
Date: Mon, 16 Mar 2026 09:02:25 +0000
Message-ID: <1c2a4a328a294d4ca536818ec9abb9c9@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
 <20260312-decathlon-unheard-33543f7c9f38@spud>
 <20260312-sizably-gleaming-07c514a1fb70@spud>
In-Reply-To: <20260312-sizably-gleaming-07c514a1fb70@spud>
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
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33460-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:email,realtek.com:mid]
X-Rspamd-Queue-Id: E540B296C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAwNTo0MjozMVBNICswMDAwLCBDb25vciBEb29sZXkg
d3JvdGU6DQo+PiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAwNzozMDozNFBNICswODAwLCBZdS1D
aHVuIExpbiB3cm90ZToNCj4+PiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNv
bT4NCj4+PiANCj4+PiBBZGQgYSBnZW5lcmljIHBpbiBjb25maWd1cmF0aW9uIHByb3BlcnR5ICJp
bnB1dC12b2x0YWdlLW1pY3Jvdm9sdCIgDQo+Pj4gdG8gc3VwcG9ydCBoYXJkd2FyZSBkZXNpZ25z
IHdoZXJlIHRoZSBpbnB1dCBsb2dpYyB0aHJlc2hvbGQgaXMgDQo+Pj4gZGVjb3VwbGVkIGZyb20g
dGhlIHBvd2VyIHN1cHBseSB2b2x0YWdlLg0KPj4+IA0KPj4+IFRoaXMgcHJvcGVydHkgYWxsb3dz
IHRoZSBwaW5jdHJsIGRyaXZlciB0byBjb25maWd1cmUgdGhlIGNvcnJlY3QgDQo+Pj4gaW50ZXJu
YWwgcmVmZXJlbmNlIHZvbHRhZ2UgZm9yIHBpbnMgdGhhdCBuZWVkIHRvIGFjY2VwdCBpbnB1dCAN
Cj4+PiBzaWduYWxzIGF0IGEgZGlmZmVyZW50IHZvbHRhZ2UgbGV2ZWwgdGhhbiB0aGVpciBwb3dl
ciBzdXBwbHkuIEZvciANCj4+PiBleGFtcGxlLCBhIHBpbiBwb3dlcmVkIGJ5IDMuM1YgbWF5IG5l
ZWQgdG8gYWNjZXB0IDEuOFYgbG9naWMgc2lnbmFscy4NCj4+PiANCj4+PiBUaGlzIGRlZmluZXMg
dGhlIHJlZmVyZW5jZSBmb3IgVklIIChJbnB1dCBIaWdoIFZvbHRhZ2UpIGFuZCBWSUwgDQo+Pj4g
KElucHV0IExvdw0KPj4+IFZvbHRhZ2UpIHRocmVzaG9sZHMsIGVuYWJsaW5nIHByb3BlciBzaWdu
YWwgZGV0ZWN0aW9uIGFjcm9zcyANCj4+PiBkaWZmZXJlbnQgdm9sdGFnZSBkb21haW5zLg0KPj4+
IA0KPj4+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0K
Pj4+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNv
bT4NCj4+PiAtLS0NCj4+PiBDaGFuZ2VzIGluIHYzOg0KPj4+IC0gUmViYXNlZCBvbnRvIHRoZSBk
ZXZlbCBicmFuY2ggb2YgdGhlIHBpbmN0cmwgdHJlZS4NCj4+PiAtIEltcHJvdmVkIGNvbW1pdCBt
ZXNzYWdlIGFuZCBkZXNjcmlwdGlvbi4NCj4+PiAtLS0NCj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY2ZnLW5vZGUueWFtbCB8IDUgDQo+Pj4gKysrKysN
Cj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4+IA0KPj4+IGRpZmYgLS1n
aXQgDQo+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5j
Zmctbm9kZS55YW1sIA0KPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcGluY2ZnLW5vZGUueWFtbA0KPj4+IGluZGV4IGZlOTM2YWIwOTEwNC4uZmQ0OWEwZDUz
YmYwIDEwMDY0NA0KPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sDQo+Pj4gQEAgLTE2Miw2ICsxNjIs
MTEgQEAgcHJvcGVydGllczoNCj4+PiAgICAgICAgdGhpcyBhZmZlY3RzIHRoZSBleHBlY3RlZCBk
ZWxheSBpbiBwcyBiZWZvcmUgbGF0Y2hpbmcgYSB2YWx1ZSB0bw0KPj4+ICAgICAgICBhbiBvdXRw
dXQgcGluLg0KPj4+ICANCj4+PiArICBpbnB1dC12b2x0YWdlLW1pY3Jvdm9sdDoNCj4+PiArICAg
IGRlc2NyaXB0aW9uOiBTcGVjaWZpZXMgdGhlIGlucHV0IHZvbHRhZ2UgbGV2ZWwgb2YgdGhlIHBp
biBpbiBtaWNyb3ZvbHRzLg0KPj4+ICsgICAgICBUaGlzIGRlZmluZXMgdGhlIHJlZmVyZW5jZSBm
b3IgIFZJSCAoSW5wdXQgSGlnaCBWb2x0YWdlKSBhbmQgVklMDQo+Pj4gKyAgICAgIChJbnB1dCBM
b3cgVm9sdGFnZSkgdGhyZXNob2xkcyBmb3IgcHJvcGVyIHNpZ25hbCBkZXRlY3Rpb24uDQo+PiAN
Cj4+IFNob3VsZCB0aGlzIGJlIGFkZGVkIGhlcmU6DQo+PiAgIC0gaWY6DQo+PiAgICAgICByZXF1
aXJlZDoNCj4+ICAgICAgICAgLSBpbnB1dC1kaXNhYmxlDQo+PiAgICAgdGhlbjoNCj4+ICAgICAg
IHByb3BlcnRpZXM6DQo+PiAgICAgICAgIGlucHV0LWVuYWJsZTogZmFsc2UNCj4+IA0KPj4gYW5k
IG1hZGUgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggaW5wdXQtZGlzYWJsZT8NCj4NCg0KWWVzLCBJ
IHdpbGwgYWRkIHRoZSByZXN0cmljdCBhcyBmb2xsb3dzOg0KYWxsT2Y6DQogIC0gaWY6DQogICAg
ICByZXF1aXJlZDoNCiAgICAgICAgLSBpbnB1dC1kaXNhYmxlDQogICAgdGhlbjoNCiAgICAgIHBy
b3BlcnRpZXM6DQogICAgICAgIGlucHV0LWVuYWJsZTogZmFsc2UNCiAgICAgICAgaW5wdXQtdm9s
dGFnZS1taWNyb3ZvbHQ6IGZhbHNlDQoNCj4gQWxzbyBsb29raW5nIGF0IHYxLCBzaG91bGQgdGhp
cyBiZSBzb21ldGhpbmcgbGlrZSAiaW5wdXQtdGhyZXNob2xkLXZvbHRhZ2UtbWljcm92b2x0Ij8N
Cj4gImlucHV0LXZvbHRhZ2UtbWljcm92b2x0Ij8gZG9lc24ndCBzZWVtIHNwZWNpZmljIGVub3Vn
aCB0byB0aGUgZGVzY3JpYmVkIHVzZSBjYXNlLg0KPg0KDQpBZ3JlZWQuIEkgd2lsbCByZW5hbWUg
aXQgdG8gImlucHV0LXRocmVzaG9sZC12b2x0YWdlLW1pY3Jvdm9sdCIgaW4gdjQuDQoNCkJlc3Qg
UmVnYXJkcywNCll1LUNodW4NCg0KPiANCj4+PiArDQo+Pj4gIGFsbE9mOg0KPj4+ICAgIC0gaWY6
DQo+Pj4gICAgICAgIHJlcXVpcmVkOg0KPj4+IC0tDQo+Pj4gMi4zNC4xDQo+Pj4NCg==

