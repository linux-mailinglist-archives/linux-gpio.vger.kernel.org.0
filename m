Return-Path: <linux-gpio+bounces-35079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sElqFL+83GmWVwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:51:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C43EA0E7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 11:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61728301373C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 09:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D793B38A7;
	Mon, 13 Apr 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="VQD7aqt2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748713B3888;
	Mon, 13 Apr 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073916; cv=none; b=L5FPVZumzaFMc024IofPKqzeBW5uazEII6tLRpYPYwbRsPeZLD42bcnNOMUy4W2KgwEHLchRadpr8SAwnZmOAVXveMEcpXW0oqR6S70n6mhLMVYTw8TmGEmd703/N6GTEhNyjvax/Rx+Ud+UnaHJoGdorHu5mvSdPGz/XY3jOws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073916; c=relaxed/simple;
	bh=OfaFHGW4BHXsCEKDLY2bYmYjd4tuxeBTjzOITav+K40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A9j3uEzkuRBv/EdMPNkYt5XdDTDFkVZUpKwC/r+4E29cteW5Rw+Qr+JRqqgLVwospplqckOcGH/yXrY3uP+xdezwVdpS0LdaK3NA6rh+45gcF9fdAa1LYp8I9pUSAIIFT+c+rX3E45AhtbVwSFZgmawHnBMZewvJQ5liEeT8P5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=VQD7aqt2; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63D9nA5s94021616, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776073751; bh=OfaFHGW4BHXsCEKDLY2bYmYjd4tuxeBTjzOITav+K40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VQD7aqt2XR9PJpPEIceqZ9cd1oxayPD/Gb6aeMAjLrQ2LwAr2Gf+M7FPIFXHrYMjL
	 /HgzlcDmTmtuIGxqe2qwHHTXUvGrAj/NYwQSb/E5xujCyEWacoIX0BDyiWawLyeqzh
	 xbszBRnBU7j0NCWKpWqV2/xVR7OFy80JjhTFMZbCsUdZZVoDzlrVCmI8rgMVPzKrBn
	 M9hCEjmQQd+5Ud7tMXPb2urUKV9/kNmQXeaouig7SR55y2t474QLiEYsR8l/bOj502
	 /Ota3JPsTe/NpMRYHrMSUVfvZ+iLT6AUqAv8puOhLwvgAiZl4oL72aag48tE8xgyUp
	 ELmNRui+C+PBw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63D9nA5s94021616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 17:49:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 17:49:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Mon, 13 Apr 2026 17:49:11 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij
	<linusw@kernel.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 1/4] pinctrl: realtek: Enable compile testing
Thread-Topic: [PATCH 1/4] pinctrl: realtek: Enable compile testing
Thread-Index: AQHcyOqp9cEi81by0U+J7Mg1UrX8w7XcwsLg
Date: Mon, 13 Apr 2026 09:49:11 +0000
Message-ID: <eda54aea98ba4ad58ba8fca0951dd714@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35079-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B19C43EA0E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBFbmFibGUgY29tcGlsZSB0ZXN0aW5nIGZvciBSZWFsdGVrIHBpbiBjb250cm9sbGVyIGRyaXZl
cnMgZm9yIGluY3JlYXNlZCBidWlsZA0KPiBhbmQgc3RhdGljIGNoZWNrZXJzIGNvdmVyYWdlLiAg
UElOQ1RSTF9SVEQgdXNlcw0KPiBwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXAoKSwgdGh1
cyBuZWVkcyBPRi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Bp
bmN0cmwvTWFrZWZpbGUgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvcGluY3RybC9yZWFsdGVr
L0tjb25maWcgfCAxMiArKysrKystLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3Ry
bC9NYWtlZmlsZSBiL2RyaXZlcnMvcGluY3RybC9NYWtlZmlsZSBpbmRleA0KPiA5ZDMzZmEyOGEw
OTYuLmIwNTRjZmI5OTM0OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL01ha2VmaWxl
DQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9NYWtlZmlsZQ0KPiBAQCAtODIsNyArODIsNyBAQCBv
YmoteSAgICAgICAgICAgICAgICAgICAgICAgICArPSBudXZvdG9uLw0KPiAgb2JqLXkgICAgICAg
ICAgICAgICAgICAgICAgICAgICs9IG54cC8NCj4gIG9iai0kKENPTkZJR19QSU5DVFJMX1BYQSkg
ICAgICArPSBweGEvDQo+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gcWNvbS8N
Cj4gLW9iai0kKENPTkZJR19BUkNIX1JFQUxURUspICAgICAgKz0gcmVhbHRlay8NCj4gK29iai0k
KENPTkZJR19QSU5DVFJMX1JURCkgICAgICArPSByZWFsdGVrLw0KPiAgb2JqLSQoQ09ORklHX1BJ
TkNUUkxfUkVORVNBUykgICs9IHJlbmVzYXMvDQo+ICBvYmotJChDT05GSUdfUElOQ1RSTF9TQU1T
VU5HKSAgKz0gc2Ftc3VuZy8NCj4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBz
b3BoZ28vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9LY29uZmlnIGIv
ZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvS2NvbmZpZw0KPiBpbmRleCAwNTRlODVkYjk5ZTcuLmEx
NTZjNGVmNTU2ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvS2NvbmZp
Zw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9LY29uZmlnDQo+IEBAIC0yLDggKzIs
OCBAQA0KPiANCj4gIGNvbmZpZyBQSU5DVFJMX1JURA0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFs
dGVrIERIQyBjb3JlIHBpbiBjb250cm9sbGVyIGRyaXZlciINCj4gLSAgICAgICBkZXBlbmRzIG9u
IEFSQ0hfUkVBTFRFSw0KPiAtICAgICAgIGRlZmF1bHQgeQ0KPiArICAgICAgIGRlcGVuZHMgb24g
QVJDSF9SRUFMVEVLIHx8IChDT01QSUxFX1RFU1QgJiYgT0YpDQo+ICsgICAgICAgZGVmYXVsdCBB
UkNIX1JFQUxURUsNCj4gICAgICAgICBzZWxlY3QgUElOTVVYDQo+ICAgICAgICAgc2VsZWN0IEdF
TkVSSUNfUElOQ09ORg0KPiAgICAgICAgIHNlbGVjdCBSRUdNQVBfTU1JTw0KPiBAQCAtMTEsMjIg
KzExLDIyIEBAIGNvbmZpZyBQSU5DVFJMX1JURA0KPiAgY29uZmlnIFBJTkNUUkxfUlREMTYxOUIN
Cj4gICAgICAgICB0cmlzdGF0ZSAiUmVhbHRlayBESEMgMTYxOUIgcGluIGNvbnRyb2xsZXIgZHJp
dmVyIg0KPiAgICAgICAgIGRlcGVuZHMgb24gUElOQ1RSTF9SVEQNCj4gLSAgICAgICBkZWZhdWx0
IHkNCj4gKyAgICAgICBkZWZhdWx0IEFSQ0hfUkVBTFRFSw0KPiANCj4gIGNvbmZpZyBQSU5DVFJM
X1JURDEzMTlEDQo+ICAgICAgICAgdHJpc3RhdGUgIlJlYWx0ZWsgREhDIDEzMTlEIHBpbiBjb250
cm9sbGVyIGRyaXZlciINCj4gICAgICAgICBkZXBlbmRzIG9uIFBJTkNUUkxfUlREDQo+IC0gICAg
ICAgZGVmYXVsdCB5DQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1JFQUxURUsNCj4gDQo+ICBjb25m
aWcgUElOQ1RSTF9SVEQxMzE1RQ0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFsdGVrIERIQyAxMzE1
RSBwaW4gY29udHJvbGxlciBkcml2ZXIiDQo+ICAgICAgICAgZGVwZW5kcyBvbiBQSU5DVFJMX1JU
RA0KPiAtICAgICAgIGRlZmF1bHQgeQ0KPiArICAgICAgIGRlZmF1bHQgQVJDSF9SRUFMVEVLDQo+
IA0KPiAgY29uZmlnIFBJTkNUUkxfUlREMTYyNQ0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFsdGVr
IERIQyAxNjI1IHBpbiBjb250cm9sbGVyIGRyaXZlciINCj4gICAgICAgICBkZXBlbmRzIG9uIFBJ
TkNUUkxfUlREDQo+IC0gICAgICAgZGVmYXVsdCB5DQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1JF
QUxURUsNCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBUaGlzIGRyaXZlciBlbmFibGVzIHN1
cHBvcnQgZm9yIHRoZSBwaW4gY29udHJvbGxlciBvbiB0aGUgUmVhbHRlaw0KPiAgICAgICAgICAg
UlREMTYyNSBTb0NzLg0KPiANCj4gLS0NCj4gMi41MS4wDQoNClJldmlld2VkLWJ5OiBZdS1DaHVu
IExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo=

