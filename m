Return-Path: <linux-gpio+bounces-38633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yZlUBfV0MmoV0QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 12:20:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AC6986BA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 12:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b=Z8INmZOW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38633-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38633-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=realtek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F481308A7FE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29CA3A2544;
	Wed, 17 Jun 2026 10:05:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9673D6CC1;
	Wed, 17 Jun 2026 10:05:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690740; cv=none; b=j69BFkzAP2fNg+2vcxGlFW/aAafvayXPp39QlJ8lVaV3JB+Gdg5mlYHaL2Po6LpOfSfrpwoiqJwmWwmr14yfdoqqx3lcCAmBY/Lw9ZusaknEb4eJkAZfUDDFhNuartK5LywikOHUhBRgBT1YxJvHLWQAAr4tag8kR7odC46TnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690740; c=relaxed/simple;
	bh=moujiGOu9PAJ3ZlhRbXA7SWL1BST4vazsX9fofw7HTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MtNuSLuuIDLjzu4TrDRg7Zu0A/VIhPD3Yd8flBUggX+Vocwr2ktdr3u7KMt4wuBeDE4rzr1o4Aq6Fw68GNMMFniyevCFAxLHOpyj9ezvT7yDj9fbcDJJXyyOQt+bZj3v0T4XYbdkMsyS0SRfKq5wGII7+56V4GVdbx4nVgHJahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Z8INmZOW; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65H9sREk92672371, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781690067; bh=moujiGOu9PAJ3ZlhRbXA7SWL1BST4vazsX9fofw7HTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Z8INmZOWK5z00I2KVZAR9ytDHODlboHrX57M3opOQjVa4KUmNXll1kjvNmuj2qeJ6
	 ZYzulV0QFjZa/i9o5Y5exjKiVHbOoGnDmQRvaexKEZZuQAsXMyoPwVakiNC/BAH+8R
	 KHZOhjQBpOJjmMN6oyPdeB4lC0DnJ9dV4pwhqj70Zsnph9V6Q8bmW9myl/M7R7n6Vb
	 wi/JnDuNzvzCPlPKRrYnGLP6Cvl7wDlyWAC48R6p39ldmITbooIhiiLtK/+UmtNawC
	 4sdVjBjCS47qYNlrLsUXnLvISeUoarVJZrGFX8yGmDNgdonr1dwwc/nkGsgd8pVuhQ
	 EGoqfnUBdzWPg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65H9sREk92672371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jun 2026 17:54:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Jun 2026 17:54:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 17 Jun 2026 17:54:27 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com"
	<afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org"
	<andy@kernel.org>, "dlechner@baylibre.com" <dlechner@baylibre.com>,
	=?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>
Subject: RE: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Topic: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Index: AQHc4cATn1PDC9J2iUegNlC3h35mQ7YJuQgAgBT/RkCADN+cAIAIv5wAgAAIjACADkT7EP//fG0AgACZdFA=
Date: Wed, 17 Jun 2026 09:54:27 +0000
Message-ID: <61c053a5a8e6461f9e6fcd40b6b5064d@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <39de4d4ada5446e7a33e48c43f410439@realtek.com>
 <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
In-Reply-To: <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-38633-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:mwalle@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,realtek.com:dkim,realtek.com:mid,realtek.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 144AC6986BA

SGkgTWljaGFlbCwNCg0KPiBIaSwNCj4NCj4gT24gV2VkIEp1biAxNywgMjAyNiBhdCAxMDozNiBB
TSBDRVNULCBZdS1DaHVuIExpbiBbqkyvp6dnXSB3cm90ZToNCj4+Pj4+PiBXaXRob3V0IGFuIGFj
Y2Vzc29yIGxpa2UgZ3Bpb19yZWdtYXBfZ2V0X2dwaW9jaGlwKCksIHdlIGNhbm5vdCANCj4+Pj4+
PiByZXRyaWV2ZSB0aGUgZ3Bpb19jaGlwIGluc3RhbnRpYXRlZCBpbnNpZGUgZ3Bpby1yZWdtYXAu
YyB0byANCj4+Pj4+PiBmdWxmaWxsIHRoZXNlIHJlcXVpcmVtZW50cyBpbiBvdXINCj4+Pj4+PiBt
YXAoKSBmdW5jdGlvbi4NCj4+Pg0KPj4+IFdoeSBpcyBncGlvY2hpcF9pcnFfcmVxcmVzKCkgY2Fs
bGVkIGluIHRoZSBmaXJzdCBwbGFjZT8gSXNuJ3QgdGhhdCANCj4+PiBvbmx5IGNhbGxlZCBpZiB0
aGUgaXJxIGhhbmRsaW5nIGlzIHNldCB1cCB2aWEgZ2MtPmlycS5jaGlwIGFuZCBub3QgDQo+Pj4g
dmlhDQo+Pj4gZ3Bpb2NoaXBfaXJxY2hpcF9hZGRfZG9tYWluKCkgbGlrZSBpbiBncGlvLXJlZ21h
cD8NCj4+Pg0KPj4NCj4+IFRoZSBwYW5pYyB3YXMgY2F1c2VkIGJ5IG15IGRyaXZlciBpbmNsdWRp
bmcgDQo+PiAnR1BJT0NISVBfSVJRX1JFU09VUkNFX0hFTFBFUlMnLCB3aGljaCBmb3JjZWQgdGhl
IGNhbGwgdG8gJ2dwaW9jaGlwX2lycV9yZXFyZXMoKScgYW5kIGNyYXNoZWQuDQo+DQo+IEJ1dCB3
aHkgZGlkIHlvdSB1c2UgaXQgaWYgeW91ciBpcnEgZG9tYWluIGlzbid0IG1hbmFnZWQgYnkgdGhl
IGdwaW9saWIsIGJ1dCByYXRoZXIgeW91ciBvd24gPmlycSBkb21haW4/IEJlZm9yZSBnb2luZyB3
aXRoIG9wdGlvbiAjMyBJJ2QgZG91YmxlIGNoZWNrIGlmIHRoYXQgaXMgY29ycmVjdCBpbiB5b3Vy
IGRyaXZlci4NCj4NCj4gLW1pY2hhZWwNCg0KRG8geW91IG1lYW4gdGhhdCBhIGN1c3RvbSBJUlEg
ZG9tYWluIHNob3VsZG4ndCBiZSBtaXhlZCB3aXRoIGdwaW9saWIgZmVhdHVyZXMgbGlrZQ0KJ0dQ
SU9DSElQX0lSUV9SRVNPVVJDRV9IRUxQRVJTJz8NCg0KQWRkaXRpb25hbCBpbmZvcm1hdGlvbjog
b3VyIEdQSU8gY29udHJvbGxlciByZWNlaXZlcyAzIHNlcGFyYXRlIGludGVycnVwdCBsaW5lcy4N
CkJlY2F1c2UgdGhlIHN0YW5kYXJkICdyZWdtYXBfaXJxX2NoaXAnIG1lY2hhbmlzbSBpbiAnZ3Bp
by1yZWdtYXAnIGRvZXMgbm90IHN1cHBvcnQNCnRoaXMgbXVsdGktbGluZSBoYXJkd2FyZSBkZXNp
Z24sIHdlIGFyZSBmb3JjZWQgdG8gY3JlYXRlIG91ciBvd24gSVJRIGRvbWFpbiBhbmQgcGFzcw0K
aXQgdmlhICdjb25maWctPmlycV9kb21haW4nLiANCg0KR2l2ZW4gdGhpcyBjb25zdHJhaW50ICh0
aGF0IHdlIG11c3QgdXNlIG91ciBvd24gSVJRIGRvbWFpbiksIGFyZSB5b3Ugc3VnZ2VzdGluZw0K
dGhhdCB3ZSBzaG91bGQgaW1wbGVtZW50IG91ciBvd24gJ2lycV9yZXF1ZXN0X3Jlc291cmNlcycg
YW5kDQonaXJxX3JlbGVhc2VfcmVzb3VyY2VzJyBjYWxsYmFja3MgaW5zdGVhZCBvZiByZWx5aW5n
IG9uDQonR1BJT0NISVBfSVJRX1JFU09VUkNFX0hFTFBFUlMnPw0KDQpCdXQgaWYgdGhhdCBpcyB0
aGUgY2FzZSwgd2Ugd291bGQgbXVjaCBwcmVmZXIgdG8gbGV0IHRoZSBjb3JlIGdwaW9saWIgaGFu
ZGxlDQp0aGVzZSByZXNvdXJjZSBhbmQgc3RhdGUgbWFuYWdlbWVudCB0YXNrcyBmb3IgdXMgKmFz
IHByb3Bvc2VkIGluIG9wdGlvbiAzKSwgcmF0aGVyIA0KdGhhbiBkdXBsaWNhdGluZyB0aGUgZWZm
b3J0IGluIG91ciBkcml2ZXIuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

