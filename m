Return-Path: <linux-gpio+bounces-34555-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPSUIUYAzWlNZQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34555-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 13:23:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AF37953E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 13:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3E0830E9842
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4683CEB89;
	Wed,  1 Apr 2026 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vErFAfVZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393803C7DE5;
	Wed,  1 Apr 2026 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042002; cv=none; b=T5IV8tzMsjlhvSshEM31HMDtHtEIehTrk8RuPcIMCci6qq3d8lkUzRG8qbN50Wbi+xrhV/myEgOSixfWla5smYvHtki+kt3j6lstN6dMj4a0QOYgrxiumMXFj0o5Wg2SVsRxKQAaJhj5jFo25+UTv7DEUvqg6IGSL2WvAmrBF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042002; c=relaxed/simple;
	bh=Du2sSK+w7A138RXer2hE9EYVOnPw5AIHeHoZShzeyJM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EFxFpPzyJrRTXUbmeIT2lqI8x6xbfXEzSaUJaeo6r1VPVl6zG1zcBpsAM65l+kct7ngzMULBRVh6SA+CkMMvmzcHWHi56nq5XjutwFe4QIM+Xw7460sxc3sGcXSsq4EmVUz/+D+V0pHrjL9BYCvibMf4C5OiRiX7inSIYhllwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vErFAfVZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 631BAZGi8972599, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775041835; bh=Du2sSK+w7A138RXer2hE9EYVOnPw5AIHeHoZShzeyJM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vErFAfVZmCZ5liiHF0W5Cl3eXZdN4kpbEX9IS93k0RpGOUUpR0jW0bswmr9cDs8ar
	 59NeCMBYWcbooGZrpBUhwc2Ltd6F80ib8WZHJ4Ql09sFSVQx1lj/SSvm8v4sgbhRQr
	 fp/9mH5QUb9qeBeVGP5/s5bZ4vbDUEj1Gyd7mEBIdjWHHw2H1GtjcFaWQWqY/eiRfB
	 HLZQXjHwWNtQR5gS7L05SQEJF57GRbbm4XyxtB3tdkrE78VVFxEaG3iIq8U5fkw+B/
	 QlyGTIwqLrLW5J5vTHw5ObvFrECcJaT2kEBw1wg0PLtZ9llXPtT+9NBfCISYsWz8Nq
	 DtLR7vwe2hdaw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 631BAZGi8972599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Apr 2026 19:10:35 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 1 Apr 2026 19:10:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6]) by
 RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6%4]) with mapi id
 15.02.1748.010; Wed, 1 Apr 2026 19:10:33 +0800
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
Subject: RE: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Thread-Topic: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Thread-Index: AQHcwREmgkCVEmuK9kquFtQiZIu6y7XJTzgAgAC+jFA=
Date: Wed, 1 Apr 2026 11:10:33 +0000
Message-ID: <8a4f558fdc6649be8c6239403e706621@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-2-eleanor.lin@realtek.com>
 <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
In-Reply-To: <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34555-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.1.92.32:email]
X-Rspamd-Queue-Id: F03AF37953E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBPbiBUdWUsIE1hciAzMSwgMjAyNiBhdCAwNzozODozM1BNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogR1BJTyBjb250cm9sbGVyIHJlZ2lzdGVycw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBHUElPIGludGVycnVwdCByZWdpc3RlcnMNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJbnRlcnJ1cHQgbnVtYmVy
IG9mIHRoZSBhc3NlcnQgR1BJTyBpbnRlcnJ1cHQsIHdoaWNoDQo+IGlzDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHRyaWdnZXJlZCB3aGVuIHRoZXJlIGlzIGEgcmlzaW5nIGVkZ2UuDQo+ID4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEludGVycnVwdCBudW1iZXIgb2YgdGhlIGRlYXNzZXJ0IEdQ
SU8gaW50ZXJydXB0LA0KPiB3aGljaCBpcw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB0cmln
Z2VyZWQgd2hlbiB0aGVyZSBpcyBhIGZhbGxpbmcgZWRnZS4NCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogSW50ZXJydXB0IG51bWJlciBvZiB0aGUgbGV2ZWwtc2Vuc2l0aXZlIEdQSU8gaW50ZXJy
dXB0LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB0cmlnZ2VyZWQgYnkgYSBjb25maWd1cmVk
IGxvZ2ljIGxldmVsLg0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQ0K
PiA+ICsNCj4gPiArICAiI2ludGVycnVwdC1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMg0KPiA+
ICsNCj4gPiArICBncGlvLXJhbmdlczogdHJ1ZQ0KPiA+ICsNCj4gPiArICBncGlvLWNvbnRyb2xs
ZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgIiNncGlvLWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAy
DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJl
Zw0KPiA+ICsgIC0gZ3Bpby1yYW5nZXMNCj4gPiArICAtIGdwaW8tY29udHJvbGxlcg0KPiA+ICsg
IC0gIiNncGlvLWNlbGxzIg0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGdwaW9AODkxMjAg
ew0KPiA+ICsgICAgICBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc29tLWdwaW8iOw0K
PiA+ICsgICAgICByZWcgPSA8MHg4OTEyMCAweDEwPiwNCj4gDQo+IDB4MTAgZmVlbHMgdmVyeSBz
aG9ydCByYW5nZS4NCj4gDQo+ID4gKyAgICAgICAgICAgIDwweDg5MTAwIDB4MjA+Ow0KPiANCj4g
QW5kIHRoaXMgbWVhbnMgaXQncyBjb250aW51b3VzLiBBcmUgeW91IHN1cmUgdGhlc2UgYXJlIHR3
byBzZXBhcmF0ZSBhZGRyZXNzDQo+IHNwYWNlcz8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQoNCkFncmVlZCwgdGhleSBhcmUgY29udGludW91cy4gSSB3aWxsIG1lcmdlIHRoZW0g
aW50byBhIHNpbmdsZSByZWdpb24gaW4gdjIuDQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg==

