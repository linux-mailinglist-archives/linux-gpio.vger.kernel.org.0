Return-Path: <linux-gpio+bounces-32808-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OORWHmWVrmnqGQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32808-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:39:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8272364E9
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F031B3027351
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B572637AA8E;
	Mon,  9 Mar 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="SCYm3aNx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056B3368B9;
	Mon,  9 Mar 2026 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049064; cv=none; b=tUQUXm/oARlScJO7pl4vpRFKMF9Gz7WJ9suKcod249gU07c4fyzK/54ytSFg+LGnGTmyfRsuPppyNrm1TBP2ULO3p+aaiZCvcqeEkVQxcpgzFdZ7x9gIFLcXMhmyp6VfyJXFP2tFTZSzcvQLl1id0H5LapMqcjTBc/SKX5ccUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049064; c=relaxed/simple;
	bh=ZphVZ4RqXhL4eWRHFvl9+gGhhsng+ktPL/YDsjZRbj8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PzD37cquA8uC/0GHFeNGnxpBJJHlybnZWEAVRSwIH1Kt1/1jiHkPmqye2AkkdT4EtYzsWdDlgOcg5zM0TnyFRq6vxbZwHVxdcn81k1Ej/LNMU+UJ22c55JZuvUqB5N72x/gegxhyrEDXFuelUx5qw2wEw+FidRvUECP8CmE1pkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=SCYm3aNx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6299ZFVL0292231, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773048915; bh=ZphVZ4RqXhL4eWRHFvl9+gGhhsng+ktPL/YDsjZRbj8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SCYm3aNxq/2Z1X2JAMSMvAAiGK0DTOY6Nom2bSDpJds4XhrChx7/ADq4ebN0lYldn
	 5e21q1zfCCom4uK69emU578OQpf9mPLhGFqcTENPYXfWi99oNKn3CK0DcAyK53aqrG
	 QuxXMBz7NYDjnCfHr36Ik1zJSr/Yrs4BGjKwyS9cl26UHrqkLvinDBHJW9b9FDADRR
	 UlANON0ZBZrn2ZBarzSA2ZV/lhyM4FA/ODdD2Ed+oDhX6EjOw42ne70e997RAudCom
	 4KSQQDRP4+6P5Twy0OZkDpVZ6N0A8feFvNM29QeOJ8w9EMvMRl26//npPLJKBcA1Pw
	 AwOXzZviu6wSQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6299ZFVL0292231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:35:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:35:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:35:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 17:35:16 +0800
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
Subject: RE: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Thread-Topic: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Thread-Index: AQHcrT46QKJ7ZZAXa0eNtBxS5QqEirWihswAgANuBLA=
Date: Mon, 9 Mar 2026 09:35:15 +0000
Message-ID: <b112ca036212456ba80fd7bb2a035834@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-12-eleanor.lin@realtek.com>
 <20260307-large-wondrous-coot-4f4ee7@quoll>
In-Reply-To: <20260307-large-wondrous-coot-4f4ee7@quoll>
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
X-Rspamd-Queue-Id: CF8272364E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32808-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,4e000:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwMzo1Mjo0MVBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiArICAgICAgaW5wdXQtdm9sdGFnZS1taWNyb3ZvbHQ6DQo+ID4gKyAgICAgICAg
ZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgIFNlbGVjdCB0aGUgaW5wdXQgcmVjZWl2ZXIg
dm9sdGFnZSBkb21haW4gZm9yIHRoZSBwaW4uDQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVu
dHMgYXJlOg0KPiA+ICsgICAgICAgICAgLSAxODAwMDAwOiAxLjhWIGlucHV0IGxvZ2ljIGxldmVs
DQo+ID4gKyAgICAgICAgICAtIDMzMDAwMDA6IDMuM1YgaW5wdXQgbG9naWMgbGV2ZWwNCj4gPiAr
ICAgICAgICBlbnVtOiBbMTgwMDAwMCwgMzMwMDAwMF0NCj4gPiArDQo+ID4gKyAgICAgIGRyaXZl
LXB1c2gtcHVsbDogdHJ1ZQ0KPiA+ICsNCj4gPiArICAgICAgcG93ZXItc291cmNlOg0KPiA+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJl
IGRlc2NyaWJlZCBhcyBiZWxvdzoNCj4gPiArICAgICAgICAgIDA6IHBvd2VyIHN1cHBseSBvZiAx
LjhWDQo+ID4gKyAgICAgICAgICAxOiBwb3dlciBzdXBwbHkgb2YgMy4zVg0KPiA+ICsgICAgICAg
IGVudW06IFswLCAxXQ0KPiANCj4gSXNuJ3QgdGhpcyBkdXBsaWNhdGluZyBpbnB1dC12b2x0YWdl
LW1pY3Jvdm9sdD8gV2hlcmUgZG8geW91IHVzZSBpdCBpbiB0aGUNCj4gZHJpdmVyPw0KPiANCg0K
Tm8sIHRoaXMgaXMgbm90IGEgZHVwbGljYXRpb24uIHBvd2VyLXNvdXJjZSBpcyB1c2VkIHRvIGNv
bmZpZ3VyZSB0aGUgb3V0cHV0IHZvbHRhZ2UsDQp3aGVyZWFzIGlucHV0LXZvbHRhZ2UtbWljcm92
b2x0IGNvbnRyb2xzIHRoZSBpbnB1dCBsb2dpYyB0aHJlc2hvbGRzLg0KDQpCb3RoIGFyZSBoYW5k
bGVkIGluIHJ0ZF9wY29uZl9wYXJzZV9jb25mKCksIHdoaWNoIGlzIGNhbGxlZCBieSBydGRfcGlu
X2NvbmZpZ19zZXQoKS4NCg0KPiA+ICsNCj4gPiArICAgICAgc2xldy1yYXRlOg0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRl
c2NyaWJlZCBhcyBiZWxvdzoNCj4gPiArICAgICAgICAgICAgMDogfjFucyBmYWxsaW5nIHRpbWUN
Cj4gPiArICAgICAgICAgICAgMTogfjEwbnMgZmFsbGluZyB0aW1lDQo+ID4gKyAgICAgICAgICAg
IDI6IH4yMG5zIGZhbGxpbmcgdGltZQ0KPiA+ICsgICAgICAgICAgICAzOiB+MzBucyBmYWxsaW5n
IHRpbWUNCj4gPiArICAgICAgICBlbnVtOiBbMCwgMSwgMiwgM10NCj4gDQo+IElmIHlvdSBoYXZl
IHNwZWNpZmljIHZhbHVlcywgd2h5IG5vdCB1c2luZyAxLzEwLzIwLzMwPw0KPiANCg0KSSB3aWxs
IHVzZSBzcGVjaWZpYyB2YWx1ZXMgaW4gdjMuDQoNCj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtcDoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAg
ICAgICAgU29tZSBvZiBwaW5zIGNhbiBiZSBkcml2ZW4gdXNpbmcgdGhlIFAtTU9TIGFuZCBOLU1P
Uw0KPiB0cmFuc2lzdG9yIHRvDQo+ID4gKyAgICAgICAgICBhY2hpZXZlIGZpbmVyIGFkanVzdG1l
bnRzLiBUaGUgYmxvY2stZGlhZ3JhbSByZXByZXNlbnRhdGlvbiBpcw0KPiBhcw0KPiA+ICsgICAg
ICAgICAgZm9sbG93czoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIFZERA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgIHx8
LS0rDQo+ID4gKyAgICAgICAgICAgICAgICstLS0tLW98fCAgICAgUC1NT1MtRkVUDQo+ID4gKyAg
ICAgICAgICAgICAgIHwgICAgICB8fC0tKw0KPiA+ICsgICAgICAgICAgSU4gLS0rICAgICAgICAg
ICstLS0tLSBvdXQNCj4gPiArICAgICAgICAgICAgICAgfCAgICAgIHx8LS0rDQo+ID4gKyAgICAg
ICAgICAgICAgICstLS0tLS18fCAgICAgTi1NT1MtRkVUDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICB8fC0tKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgIEdORA0KPiA+ICsgICAgICAgICAgVGhlIGRyaXZpbmcgc3RyZW5n
dGggb2YgdGhlIFAtTU9TL04tTU9TIHRyYW5zaXN0b3JzIGltcGFjdHMNCj4gdGhlDQo+ID4gKyAg
ICAgICAgICB3YXZlZm9ybSdzIHJpc2UvZmFsbCB0aW1lcy4gR3JlYXRlciBkcml2aW5nIHN0cmVu
Z3RoIHJlc3VsdHMgaW4NCj4gPiArICAgICAgICAgIHNob3J0ZXIgcmlzZS9mYWxsIHRpbWVzLiBF
YWNoIFAtTU9TIGFuZCBOLU1PUyB0cmFuc2lzdG9yDQo+IG9mZmVycw0KPiA+ICsgICAgICAgICAg
OCBjb25maWd1cmFibGUgbGV2ZWxzICgwIHRvIDcpLCB3aXRoIGhpZ2hlciB2YWx1ZXMgaW5kaWNh
dGluZw0KPiA+ICsgICAgICAgICAgZ3JlYXRlciBkcml2aW5nIHN0cmVuZ3RoLCBjb250cmlidXRp
bmcgdG8gYWNoaWV2aW5nIHRoZSBkZXNpcmVkDQo+ID4gKyAgICAgICAgICBzcGVlZC4NCj4gPiAr
DQo+ID4gKyAgICAgICAgICBUaGUgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1wIGlzIHVzZWQgdG8g
Y29udHJvbCB0aGUgZHJpdmluZw0KPiBzdHJlbmd0aA0KPiA+ICsgICAgICAgICAgb2YgdGhlIFAt
TU9TIG91dHB1dC4NCj4gPiArDQo+ID4gKyAgICAgICAgICBUaGlzIHZhbHVlIGlzIG5vdCBhIHNp
bXBsZSBjb3VudCBvZiB0cmFuc2lzdG9ycy4gSW5zdGVhZCwgaXQNCj4gPiArICAgICAgICAgIHJl
cHJlc2VudHMgYSB3ZWlnaHRlZCBjb25maWd1cmF0aW9uLiBUaGVyZSBpcyBhIGJhc2UgZHJpdmlu
Zw0KPiA+ICsgICAgICAgICAgY2FwYWJpbGl0eSAoZXZlbiBhdCB2YWx1ZSAwKSwgYW5kIGVhY2gg
Yml0IGFkZHMgYSBkaWZmZXJlbnQNCj4gd2VpZ2h0IHRvDQo+ID4gKyAgICAgICAgICB0aGUgdG90
YWwgc3RyZW5ndGguIFRoZSByZXN1bHRpbmcgY3VycmVudCBpcyBub24tbGluZWFyIGFuZCB2YXJp
ZXMNCj4gPiArICAgICAgICAgIHNpZ25pZmljYW50bHkgYmFzZWQgb24gdGhlIElPIHZvbHRhZ2Ug
KDEuOFYgdnMgMy4zVikgYW5kIHRoZQ0KPiBzcGVjaWZpYw0KPiA+ICsgICAgICAgICAgcGFkIGdy
b3VwLg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMg0KPiA+ICsgICAgICAgIG1pbmltdW06IDANCj4gPiArICAgICAgICBtYXhpbXVtOiA3
DQo+ID4gKw0KPiA+ICsgICAgICByZWFsdGVrLGRyaXZlLXN0cmVuZ3RoLW46DQo+ID4gKyAgICAg
ICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgIFNpbWlsYXIgdG8gdGhlIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtcCwgdGhlDQo+IHJlYWx0ZWssZHJpdmUtc3RyZW5ndGgtbg0KPiA+ICsg
ICAgICAgICAgaXMgdXNlZCB0byBjb250cm9sIHRoZSBkcml2aW5nIHN0cmVuZ3RoIG9mIHRoZSBO
LU1PUyBvdXRwdXQuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0eSB1c2VzIHRo
ZSBzYW1lIHdlaWdodGVkIGNvbmZpZ3VyYXRpb24gbG9naWMNCj4gd2hlcmUgdmFsdWVzDQo+ID4g
KyAgICAgICAgICAwLTcgcmVwcmVzZW50IG5vbi1saW5lYXIgc3RyZW5ndGggYWRqdXN0bWVudHMg
cmF0aGVyIHRoYW4gYQ0KPiB0cmFuc2lzdG9yDQo+ID4gKyAgICAgICAgICBjb3VudC4NCj4gPiAr
DQo+ID4gKyAgICAgICAgICBIaWdoZXIgdmFsdWVzIGluZGljYXRlIGdyZWF0ZXIgZHJpdmluZyBz
dHJlbmd0aCwgcmVzdWx0aW5nIGluDQo+IHNob3J0ZXINCj4gPiArICAgICAgICAgIGZhbGwgdGlt
ZXMuDQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyDQo+ID4gKyAgICAgICAgbWluaW11bTogMA0KPiA+ICsgICAgICAgIG1heGltdW06IDcN
Cj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0Og0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBBbiBpbnRlZ2VyIGRlc2NyaWJpbmcg
dGhlIGxldmVsIHRvIGFkanVzdCB0aGUgb3V0cHV0IHB1bHNlIHdpZHRoLA0KPiBpdA0KPiA+ICsg
ICAgICAgICAgcHJvdmlkZXMgYSBmaXhlZCBuYW5vc2Vjb25kLWxldmVsIGFkanVzdG1lbnQgdG8g
dGhlDQo+IHJpc2luZy9mYWxsaW5nDQo+ID4gKyAgICAgICAgICBlZGdlcyBvZiBhbiBleGlzdGlu
ZyBzaWduYWwuIEl0IGlzIHVzZWQgZm9yIFNpZ25hbCBJbnRlZ3JpdHkgdHVuaW5nDQo+ID4gKyAg
ICAgICAgICAoYWRkaW5nL3N1YnRyYWN0aW5nIGRlbGF5IHRvIGZpbmUtdHVuZSB0aGUgaGlnaC9s
b3cgZHVyYXRpb24pLA0KPiByYXRoZXINCj4gPiArICAgICAgICAgIHRoYW4gZ2VuZXJhdGluZyBh
IHNwZWNpZmljIFBXTSBmcmVxdWVuY3kuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVmFsaWQgYXJn
dW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6DQo+ID4gKyAgICAgICAgICAwOiAwbnMNCj4g
PiArICAgICAgICAgIDI6ICsgMC4yNW5zDQo+ID4gKyAgICAgICAgICAzOiArIDAuNW5zDQo+ID4g
KyAgICAgICAgICA0OiAtMC4yNW5zDQo+ID4gKyAgICAgICAgICA1OiAtMC41bnMNCj4gPiArICAg
ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiAr
ICAgICAgICBlbnVtOiBbMCwgMiwgMywgNCwgNV0NCj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWss
aGlnaC12aWwtbWljcm92b2x0Og0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
ICAgICAgICBUaGUgdGhyZXNob2xkIHZhbHVlIGZvciB0aGUgaW5wdXQgcmVjZWl2ZXIncyBMT1cg
cmVjb2duaXRpb24NCj4gKFZJTCkuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0
eSBpcyB1c2VkIHRvIGFkZHJlc3Mgc3BlY2lmaWMgSERNSSBJMkMgY29tcGF0aWJpbGl0eQ0KPiA+
ICsgICAgICAgICAgaXNzdWVzIHdoZXJlIHNvbWUgc2lua3MgKFRWcykgaGF2ZSB3ZWFrIHB1bGwt
ZG93biBjYXBhYmlsaXRpZXMNCj4gYW5kDQo+ID4gKyAgICAgICAgICBmYWlsIHRvIHB1bGwgdGhl
IGJ1cyB2b2x0YWdlIGJlbG93IHRoZSBzdGFuZGFyZCBWSUwgdGhyZXNob2xkDQo+ID4gKyAgICAg
ICAgICAofjAuN1YpLg0KPiA+ICsNCj4gPiArICAgICAgICAgIFNldHRpbmcgdGhpcyBwcm9wZXJ0
eSB0byAxMTAwMDAwICgxLjFWKSBlbmFibGVzIGEgc3BlY2lhbGl6ZWQNCj4gaW5wdXQNCj4gPiAr
ICAgICAgICAgIHJlY2VpdmVyIG1vZGUgdGhhdCByYWlzZXMgdGhlIGVmZmVjdGl2ZSBWSUwgdGhy
ZXNob2xkIHRvIGltcHJvdmUNCj4gPiArICAgICAgICAgIGRldGVjdGlvbi4NCj4gPiArICAgICAg
ICBlbnVtOiBbMTEwMDAwMF0NCj4gPiArDQo+ID4gKyAgICByZXF1aXJlZDoNCj4gPiArICAgICAg
LSBwaW5zDQo+ID4gKw0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4g
Kw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+
ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxl
czoNCj4gPiArICAtIHwNCj4gPiArICAgIHBpbmN0cmxANGUwMDAgew0KPiA+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWlzby1waW5jdHJsIjsNCj4gPiArICAgICAgICBy
ZWcgPSA8MHg0ZTAwMCAweDEzMD47DQo+ID4gKw0KPiA+ICsgICAgICAgIGVtbWMtaHMyMDAtcGlu
cyB7DQo+ID4gKyAgICAgICAgICAgIHBpbnMgPSAiZW1tY19jbGsiLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgImVtbWNfY21kIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICJlbW1jX2RhdGFf
MCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzEiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgImVtbWNfZGF0YV8yIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICJlbW1j
X2RhdGFfMyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzQiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV81IiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICJlbW1jX2RhdGFfNiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzciOw0K
PiA+ICsgICAgICAgICAgICBmdW5jdGlvbiA9ICJlbW1jIjsNCj4gPiArICAgICAgICAgICAgcmVh
bHRlayxkcml2ZS1zdHJlbmd0aC1wID0gPDB4Mj47DQo+ID4gKyAgICAgICAgICAgIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtbiA9IDwweDI+Ow0KPiANCj4gVGhlc2UgYXJlIG5vdCBoZXgsIGJ1dCBz
aW1wbGUgZGVjaW1hbHMNCj4gDQoNCkkgd2lsbCBjaGFuZ2UgdGhlbSB0byA8Mj4uDQoNCkJlc3Qg
UmVnYXJkcywNCll1LUNodW4NCg0KPiA+ICsgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
IGkyYy0wLXBpbnMgew0KPiA+ICsgICAgICAgICAgICBwaW5zID0gImdwaW9fMTIiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgImdwaW9fMTMiOw0KPiA+ICsgICAgICAgICAgICBmdW5jdGlvbiA9
ICJpMmMwIjsNCj4gPiArICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGggPSA8ND47DQo+ID4gKyAg
ICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K

