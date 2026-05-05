Return-Path: <linux-gpio+bounces-36173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGQVAPbK+Wn3EAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:48:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD14CBCAB
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28F1430ACA24
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E2B3370E4;
	Tue,  5 May 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="mkgJVHrB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA52D8DC3;
	Tue,  5 May 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976845; cv=none; b=GxVF4zLU2EYrpoqle8UER6sZnm57Ch7mFdc4ihUq2WhQasi8gpDqpDFe0z+1nYCdaGyJhwJ1kCJCGt3OrusNlJbzRKeVBIOVGvWNNLu05k69zBTQdm/krTd1bvDqJZWDsaOz6unntZ/K1znNzFCRD4MGZ2R/X5o9fUksNQnhMGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976845; c=relaxed/simple;
	bh=buKsSZ+7jW/UO5tcyoJnJM3jwIHms8+0rSELJYgMv38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JaDSKTRn/mInuBRrOs9+OqCV/PgyThAOWxoDSU0DDK5DVF09VnzfOyNEAi+WHGw3gUBwNrwFa6noKpBwvXqeSxo7hOOotTE825/CPoNx/jND7x4dAendMVFNC0HcoiFi1AP5TEdRJ38/idJr6/OVYsFHcqNwYLOqnByj2CDghR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=mkgJVHrB; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AR5zP41151053, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777976825; bh=buKsSZ+7jW/UO5tcyoJnJM3jwIHms8+0rSELJYgMv38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mkgJVHrBo+1ysTT19p5CNIRkHdmTfy4xkcVllc0UBYxsZk5VZ6e1QDEVhS/ZY34TE
	 mp0x7Fa0NE37JJSph6OBQkGTWwv4JA+KhCptWaVLtNRibGQoqSlWvJ8kcwkCXQXf7J
	 1+/wcZCLL1Bp1c0f55SHvnXdc5ML0tIDUO8TSncswePjN6ubADK/PAzaOji84ClvKM
	 uxIfczzcfC04FP1R0ag385VV3Zk3T0RlJM9X1mn+W66bGu+frmw6E59aN0dYGG6pB4
	 VAxZtmxMQF6WOI6DFHzCeH2Br37GVb5Z/XzRjKLSr+tSypF80nP0ELf+Sw99Z6bCV3
	 yjaVo1JaVd1Lg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AR5zP41151053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:27:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:27:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:27:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Tue, 5 May 2026 18:27:04 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "linusw@kernel.org"
	<linusw@kernel.org>,
        "brgl@kernel.org" <brgl@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Thread-Topic: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Thread-Index: AQHc2JPPhFmKb15Oy0q6ziQ+KMIRSbX28IkAgAhPSpA=
Date: Tue, 5 May 2026 10:27:04 +0000
Message-ID: <9f28aa58bb8c441ca7b4a0e75c2947cf@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-2-eleanor.lin@realtek.com>
 <6ff75de9-6d5f-4d4a-bb19-1c06d0aa8d3a@kernel.org>
 <e1829cf5-c277-4e34-8bcf-addc27bfd69c@kernel.org>
In-Reply-To: <e1829cf5-c277-4e34-8bcf-addc27bfd69c@kernel.org>
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
X-Rspamd-Queue-Id: 68AD14CBCAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36173-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[realtek.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

PiBPbiAzMC8wNC8yMDI2IDEzOjIzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9u
IDA4LzA0LzIwMjYgMDQ6NTIsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+PiBSZW1vdmUgdGhlIGRl
ZmF1bHQgeSB0byBhdm9pZCBibG9hdGluZyB0aGUgYnVpbGQgZm9yIG5vbi1SZWFsdGVrDQo+ID4+
IHBsYXRmb3JtcyB3aGVuIENPTVBJTEVfVEVTVCBpcyBlbmFibGUgb24gb3RoZXIgcGxhdGZvcm1z
Lg0KPiA+Pg0KPiA+DQo+ID4gV2h5IGlzbid0IHRoaXMgZHJpdmVyIGltcG9ydGFudCBmb3IgUmVh
bHRlayBTb0M/IFRoaXMgc2hvdWxkIGJlDQo+ID4gZXhwbGFpbmVkLCBvdGhlcndpc2UgcHJvcGVy
IGZpeCBpcyBkZWZhdWx0IGZvciBBUkNIX1JFQUxURUsuDQo+IA0KPiBBbmQgeW91IHdlcmUga2lu
ZCBvZiBhc2tlZCBmb3IgaXQgYXQgdjEuLi4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNCkkgd2FzIGFzc3VtaW5nIG91ciBkZWZjb25maWcgYWxyZWFkeSBlbmFibGVzIHRoaXMg
ZHJpdmVyIGFzIGJ1aWx0LWluLCBzbw0Kc2ltcGx5IGRyb3BwaW5nICJkZWZhdWx0IHkiIHNlZW1l
ZCBzdWZmaWNpZW50Lg0KDQpJIHdpbGwgY2hhbmdlIGl0ICdkZWZhdWx0IEFSQ0hfUkVBTFRFSycu
DQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg==

