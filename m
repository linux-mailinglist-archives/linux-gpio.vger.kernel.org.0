Return-Path: <linux-gpio+bounces-39306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bx+ODHbwRGqK3goAu9opvQ
	(envelope-from <linux-gpio+bounces-39306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:48:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CE6EC5BA
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:48:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b=fptQfysD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39306-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39306-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=realtek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 264233022973
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 10:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D270426ECF;
	Wed,  1 Jul 2026 10:42:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91F426EAE;
	Wed,  1 Jul 2026 10:42:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902547; cv=none; b=XpJRj/vsyHoud5n7fAs86KhUfwOaTUiOBdfAi60JbCG6++jfXXpmgGIngwLVtUQJhqwq9VtBgG8sFn2T1SQ++xPZm7CFGfavpstBGokC62GQud9Cn/ZqQPrPRaIb92BoQFMVm/XxP6xVdAGdkNE3TU7EXP95mQxHqkb13e9TE/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902547; c=relaxed/simple;
	bh=zY2o5dWEAvddugmQW/vs6ACDRe9NBEJocX+1e1hRgcw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsD+eMeUVrT0SbPCxLeDdo+gHBQR4SO5QzIeVyi8ilJnX1WPmFqsPwhgmDC3MaRYYbIyQdenoRz+Ym9l6JA6moCxb0YG+hTJeTJ6m33wgpfBwg4Nco+mRJZSkfGuVLIAzPPgQHQoQSCZpumvQjLMmg/HMhnR9pNhi8DluQkWdHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fptQfysD; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 661AVSAL01060427, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782901888; bh=zY2o5dWEAvddugmQW/vs6ACDRe9NBEJocX+1e1hRgcw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fptQfysDkOaqFFxM3SYMPybfkJ4BveTUE/3J/VPXssmowtbicMhcPH4AeImK6gKAE
	 srgAU5pBFXxxkkAgf749/dEpJDU+Nb3oxq/9sqpQTzWW4M0zTjzi6R+EMRunMrEpl/
	 PaXLYedqPmiRl7MfIBNObrkdgSClVOhqLqBgDwH27yR7+cU5WbwUKGrrQbr8h5ogBO
	 8g98+bXalDNJU6UJ/wHLZDouVVUUKXcuRMB8iOWQLq6/916OYAhKh5nOvO3nlW67eg
	 URtqpJSk375FtZv8I6CqaXD2euQ/bUkK/BsV70Jt8JqHaIfCUaTtMCxRRVdL1SvwP7
	 bKN2vhpXgaFAg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 661AVSAL01060427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Jul 2026 18:31:28 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Jul 2026 18:31:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 1 Jul 2026 18:31:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 1 Jul 2026 18:31:28 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Linus Walleij <linusw@kernel.org>
CC: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>, "andriy.shevchenko@intel.com"
	<andriy.shevchenko@intel.com>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Thread-Topic: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Thread-Index: AQHdAijOAwCaZwN04Eyh2gkxEUiUVrZWmzIAgAHmnoA=
Date: Wed, 1 Jul 2026 10:31:28 +0000
Message-ID: <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com>
 <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
In-Reply-To: <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39306-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,realtek.com:dkim,realtek.com:email,realtek.com:mid,realtek.com:from_mime];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[realtek.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A6CE6EC5BA

SGkgTGludXMsDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+IE9uIE1vbiwgSnVuIDIyLCAyMDI2IGF0IDEwOjMz4oCvQU0gWXUtQ2h1biBMaW4gPGVs
ZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogVHp1eWkgQ2hh
bmcgPHR5Y2hhbmdAcmVhbHRlay5jb20+DQo+ID4NCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJp
bmRpbmdzIGZvciB0aGUgUmVhbHRlayBESEMgKERpZ2l0YWwgSG9tZSBDZW50ZXIpDQo+ID4gUlRE
MTYyNSBHUElPIGNvbnRyb2xsZXJzLg0KPiA+DQo+ID4gVGhlIFJURDE2MjUgR1BJTyBjb250cm9s
bGVyIGZlYXR1cmVzIGEgcGVyLXBpbiByZWdpc3RlciBhcmNoaXRlY3R1cmUNCj4gPiB0aGF0IGRp
ZmZlcnMgc2lnbmlmaWNhbnRseSBmcm9tIHByZXZpb3VzIGdlbmVyYXRpb25zLiBJdCB1dGlsaXpl
cw0KPiA+IHNlcGFyYXRlIHJlZ2lzdGVyIGJsb2NrcyBmb3IgR1BJTyBjb25maWd1cmF0aW9uIGFu
ZCBpbnRlcnJ1cHQgY29udHJvbC4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpDQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ICguLi4p
DQo+IA0KPiA+ICsgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gKw0KPiA+ICsgICIj
aW50ZXJydXB0LWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAyDQo+ID4gKw0KPiA+ICsgIGdwaW8t
cmFuZ2VzOiB0cnVlDQo+ID4gKw0KPiA+ICsgIGdwaW8tY29udHJvbGxlcjogdHJ1ZQ0KPiA+ICsN
Cj4gPiArICAiI2dwaW8tY2VsbHMiOg0KPiA+ICsgICAgY29uc3Q6IDINCj4gDQo+IEFmdGVyIGxv
b2tpbmcgYXQgdGhlIGRyaXZlciBJIG11c3QgY2hhbGxlbmdlIHRoaXMgYmluZGluZy4NCj4gDQo+
IFlvdXIgZHJpdmVyIGlzIGZ1bGwgb2YgKG9mZnNldCAlIDMyKSBhbmQgZXZlbiAob2Zmc2V0ICUg
MzIpICo0IHRvIGp1c3Qgd29yayBhcm91bmQNCj4gdGhlIGZhY3QgdGhhdCB0aGUgaGFyZHdhcmUg
aW5oZXJlbnRseSBoYXMgMzItcGluIGJhbmtzLg0KPiANCj4gSW5zdGVhZCBvZiB1c2luZyB0d29j
ZWxsIEdQSU8gYW5kIGlycXMsIGp1c3QgdXNlIHRocmVlY2VsbCwgaW50ZXJydXB0LWNlbGxzIGFu
ZA0KPiBncGlvLWNlbGxzIDMuDQo+IA0KPiBGaXJzdCBjZWxsIGlzIGJhbmssIHNlY29uZCBjZWxs
IGlzIG9mZnNldCBpbnNpZGUgZWFjaCBiYW5rLg0KPiANCj4gRm9yIExpbnV4IHNwZWNpZmljYWxs
eSB0aGVyZSBhcmUgaGVscGVycyBmb3IgZGVhbGluZyB3aXRoIHRoaXMgaW4gZ3Bpb2xpYiwgYW5k
DQo+IGZ1cnRoZXIgeW91IHdpbGwgYmUgYWJsZSB0byB1c2UgdGhlIEdQSU9fR0VORVJJQyBsaWJy
YXJ5LCB3aGlsZSB0aGlzIGlzIGJlc2lkZQ0KPiB0aGUgcG9pbnQgZm9yIHRoZSBiaW5kaW5nIGl0
c2VsZi4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNClRvIGNsYXJpZnkgdGhlIGhh
cmR3YXJlIGRlc2lnbjogdGhpcyBTb0MgZG9lcyBub3QgdXNlIGEgYmFua2VkIEdQSU8NCmFyY2hp
dGVjdHVyZS4NCg0KRWFjaCBHUElPIHBpbiBoYXMgaXRzIG93biBkZWRpY2F0ZWQgMzItYml0IGNv
bnRyb2wgcmVnaXN0ZXIgdGhhdCBoYW5kbGVzDQpib3RoIEdQSU8gY29uZmlndXJhdGlvbiBhbmQg
aW50ZXJydXB0IHNldHRpbmdzIChlLmcuLCBlZGdlL2xldmVsIGVuYWJsZSkuDQpUaGUgb25seSBl
eGNlcHRpb24gaXMgdGhlIGludGVycnVwdCBzdGF0dXMgcmVnaXN0ZXIsIHdoaWNoIGlzIGdyb3Vw
ZWQgaW50bw0KMzItYml0IHdvcmRzLg0KDQpTaW5jZSBwaHlzaWNhbCBHUElPIGJhbmtzIGRvIG5v
dCBleGlzdCwgdXNpbmcgYSAzLWNlbGwgPGJhbmsgb2Zmc2V0IGZsYWdzPg0KZm9ybWF0IHdvdWxk
IG1pc3JlcHJlc2VudCB0aGUgaGFyZHdhcmUuIFRoZXJlZm9yZSwNCmtlZXBpbmcgI2dwaW8tY2Vs
bHMgPSA8Mj4gYW5kICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj4gaXMgdGhlIG1vc3QgYWNjdXJhdGUN
CnJlZmxlY3Rpb24gb2YgdGhlIGFjdHVhbCBzaWxpY29uLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQo=

