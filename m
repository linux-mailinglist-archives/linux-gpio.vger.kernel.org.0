Return-Path: <linux-gpio+bounces-36174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EyYBELK+WmFEAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:45:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B264CBB9F
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E58DA30324F4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0848D33A9DA;
	Tue,  5 May 2026 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="KRUPH5Am"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEE2C030E;
	Tue,  5 May 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976845; cv=none; b=lNvRAklS0zcw4jK4MXV8jpiNBZ1l63zrzw1K1zu0ZxIj4W233DRTLl+n932LIzRdT82rydcLviqu0qILrqRGgo/6RDV2+XmtOtmQ2RcNvsyWuJRviRhReHpQznL7fF/jnfZG+rU3j4+udwsvSgJQR/nSJfE1uD7SScEE+2AMtiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976845; c=relaxed/simple;
	bh=nd4ZcYSmdEtBrbYBc5EdvBORdOz6BQRpz7hjMzcloAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJlw3F/je/Yg0QHQlawvYXOVrw+rpOtZenN3ukGycFVlzMaU4q7kpnfpad8yOahnDN071utXRxKEtIH3Pvanp9MkJ0Vil+2rclvpj0UErjA2de9jq25DiKyIyXu+xedZh5qbPWSJ8AmJGu9US7lUheg8oRi0ZCnIF0k5womh+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=KRUPH5Am; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AQbyP61150973, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777976797; bh=nd4ZcYSmdEtBrbYBc5EdvBORdOz6BQRpz7hjMzcloAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KRUPH5AmyvR3Ywi2gVAXXKSJKUY1dbABEKalo9995UmQmFI3BknwOuxt4gqAgVM67
	 09gzw4NaRay1M6Ev6gX10ZGvXQG8xsPoA6W+yVlfnxw1AiKOeGF/HQb896TiJ0hfeK
	 YpUIhHSygWZ9XCh6J/O5MBVfbZP3wTyScU1hSpTlGJxKu0eNVTmnqRZKSY2FjXk4qR
	 o8BZkbgrwzO0kFbNPK61+3MbgqzJ/NOmVqrjieJ2/Arv/mSsnAtJJr9c3F0BvtK9/u
	 4Dr3QEYG/8HRT+N5uzhw/FpSscWM+Ug9oj+QM5IVQCdJxDjY8rl16q69102056mwGU
	 9+rQJ+E78ZQkg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AQbyP61150973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:26:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 5 May 2026 18:26:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Tue, 5 May 2026 18:26:36 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
Subject: RE: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Topic: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Index: AQHcxwLHJ5/eWVH9pU2ZY37QYpQGurXUP0uAgAPMV8CADmSzAIAAqFqAgBBo1aD//5D9AIAIUqFA
Date: Tue, 5 May 2026 10:26:36 +0000
Message-ID: <3f9aa7a00a384511bf12d5b420c98e85@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
 <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
 <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
In-Reply-To: <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
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
X-Rspamd-Queue-Id: 07B264CBB9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36174-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:mid]

PiBIaSwNCj4NCj4gT24gVGh1IEFwciAzMCwgMjAyNiBhdCAxMTo1OCBBTSBDRVNULCBZdS1DaHVu
IExpbiBbqkyvp6dnXSB3cm90ZToNCj4gPj4gPj4gMy4gSGFyZHdhcmUgRGVib3VuY2U6IFdlIGFs
c28gbmVlZCB0byBzdXBwb3J0IGhhcmR3YXJlIGRlYm91bmNlIA0KPiA+PiA+PiBzZXR0aW5ncyBw
ZXIgcGluLCB3aGljaCByZXF1aXJlcyBjdXN0b20gY29uZmlndXJhdGlvbiB2aWEgDQo+ID4+ID4+
IHNldF9jb25maWcgbWFwcGVkIHRvIHRoZXNlIHNwZWNpZmljIHBlci1waW4gcmVnaXN0ZXJzLg0K
PiA+PiA+DQo+ID4+ID4gSnVzdCBhZGQgYSB2ZXJzaW9uIG9mIGFuIG9wdGlvbmFsIC5zZXRfY29u
ZmlnKCkgY2FsbCB0byANCj4gPj4gPiBncGlvLXJlZ21hcC5jIHRvIGhhbmRsZSB0aGlzIHVzaW5n
IC5yZWdfbWFza194bGF0ZSgpIHBlciBhYm92ZSBhbmQgDQo+ID4+ID4gYWRkIGEgbmV3IEdQSU9f
UkVHTUFQX0NPTkZJR19PUCB0byB0aGUgYWJvdmUgZW51bSwgcHJvYmxlbSBzb2x2ZWQuDQo+ID4+
ID4NCj4gPj4gPiBJZiBpdCBzZWVtcyB0b28gaGFyZCBJIGNhbiB3cml0ZSBwYXRjaCAxICYgMiBh
ZGRpbmcgdGhpcyANCj4gPj4gPiBpbmZyYXN0cnVjdHVyZSBidXQgSSBiZXQgeW91IGNhbiBlYXNp
bHkgc2VlIHdoYXQgY2FuIGJlIGRvbmUgd2l0aCANCj4gPj4gPiBncGlvLXJlZ21hcC5jIGhlcmUg
cHJvdmlkZWQgTWljaGFlbCBXIGFwcHJvdmVzIHRoZSBpZGVhLg0KPiA+PiA+DQo+ID4NCj4gPiBP
dXIgLnNldF9jb25maWcgcmVxdWlyZXMgbWFwcGluZyBzcGVjaWZpYyBkZWJvdW5jZSB0aW1lIHZh
bHVlcyB0byANCj4gPiBoYXJkd2FyZS1zcGVjaWZpYyBlbnVtcyBhbmQgYXBwbHlpbmcgYSBXcml0
ZS1FbmFibGUgYml0Lg0KPiA+DQo+ID4gV291bGQgaXQgYmUgYmV0dGVyIHRvIGFsbG93IGRyaXZl
cnMgdG8gYXNzaWduIGEgY3VzdG9tICcuc2V0X2NvbmZpZycgDQo+ID4gY2FsbGJhY2sgZGlyZWN0
bHkgd2l0aGluICdzdHJ1Y3QgZ3Bpb19yZWdtYXBfY29uZmlnJz8NCj4NCj4gWWVhaCwgSSBkb24n
dCB0aGluayB0aGVyZSB3aWxsIGJlIG11Y2ggY29kZSBzaGFyaW5nIG9mIGNvZGUvZnVuY3Rpb25h
bGl0eQ0KPiBmb3IgdGhlIC5zZXRfY29uZmlnIGNhbGxiYWNrLiBBIGN1c3RvbSAuc2V0X2NvbmZp
ZyB3YXMgcHJvcG9zZWQgbWFueSB0aW1lcyBpbiB0aGUgcGFzdC4NCj4gDQoNCldpbGwgYWRkIGEg
bmV3IHBhdGNoIHRvIHN1cHBvcnQgY3VzdG9tIC5zZXRfY29uZmlnLg0KDQo+ID4gQWRkaXRpb25h
bGx5LCBJIGRpZG4ndCBtZW50aW9uIHRoaXMgaW4gbXkgcHJldmlvdXMgZW1haWwuIHdlIGFsc28g
bmVlZCANCj4gPiB0byBpbXBsZW1lbnQgR1BJTyBpbnRlcnJ1cHRzLiBPdXIgaGFyZHdhcmUgZGVz
aWduIGRvZXMgbm90IGZpdCB3ZWxsIA0KPiA+IHdpdGggJ3JlZ21hcF9pcnFfY2hpcCcuIFRoZXJl
Zm9yZSwgSSBhbSBwbGFubmluZyB0byBjcmVhdGUgb3VyIG93biANCj4gPiAnaXJxZG9tYWluJyBh
bmQgJ2lycWNoaXAnIG9wcyB0byBoYW5kbGUgb3VyIGNhc2NhZGVkIGludGVycnVwdHMuDQo+ID4N
Cj4gPiBCZWNhdXNlIG9mIHRoaXMgY3VzdG9tIElSUSBpbXBsZW1lbnRhdGlvbiwgSSB3b3VsZCBu
ZWVkIHRvIHVzZSAncmVhZGwoKS93cml0ZWwoKScNCj4gPiBmb3IgdGhlIElSUSBjYWxsYmFja3Mg
aW4gdGhlIHJ0ZDE2MjUgR1BJTyBkcml2ZXIgaW5zdGVhZCBvZiB0aGUgcmVnbWFwIEFQSXMuDQo+
ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBoYW5kbGUgdGhpcyBncmFj
ZWZ1bGx5IHdoaWxlIA0KPiA+IGtlZXBpbmcgaXQgYWxpZ25lZCB3aXRoIHRoZSByZWdtYXAgaW5m
cmFzdHJ1Y3R1cmU/DQo+DQo+IFdoeSBjYW4ndCB0aGUgTU1JTyByZWdtYXAgYmUgdXNlZCBmb3Ig
dGhhdD8NCj4NCj4gLW1pY2hhZWwNCg0KSSB3YXMgd29ycmllZCBhYm91dCByZWdtYXAgb3Zlcmhl
YWQgaW4gYXRvbWljIGNvbnRleHQsIGJ1dCBNTUlPIHJlZ21hcCBzaG91bGQNCmJlIGZpbmUuIEkn
bGwgY29udmVydCB0aGUgaXJxY2hpcCBjYWxsYmFja3MgdG8gdXNlIHJlZ21hcCBpbiB2My4NCg0K
QmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K

