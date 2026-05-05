Return-Path: <linux-gpio+bounces-36201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DsIGdTo+WmsFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC374CE032
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5E730DCAD5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5E426EC8;
	Tue,  5 May 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye08dOtX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB75436371
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985433; cv=none; b=XPSZaml+iqNaATYM2yJG0usgJUPWrxI7LVXLDEXt2Z05EjiN6XQPyUsMJK5JyokM883UGlAvant/BySQ0yMAnNZzttnJhuczRUp1m9JT+IzxBAzDFkN+r3oSzDCz5vggVnihphAN/HsfWoZF8SEFbGqIznre4BcE7YWRT9IJ8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985433; c=relaxed/simple;
	bh=kJHxpSQ2RAsx52NGXeVPNpjdG3TF8+xCdq6mPtq3ZlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWF+h0/xUQgQdVsbzgLp6T2EQPUd7WZ1HpBrpMtcA+5PxGNZIMfjlSPQOwMnWA0HoRFU4wxnwmTb11uStWOgtEO1Bc0UwYB2x9LZ6AuRitpm5ZmuVmrHieY0R4nrBKxYvpDGmuZ6EiHs0FHKXClmW/nPXQ2IQNA10jK55i3SClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye08dOtX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AD6C2BCC7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985430;
	bh=kJHxpSQ2RAsx52NGXeVPNpjdG3TF8+xCdq6mPtq3ZlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ye08dOtX5KswflTgRy7PioBdoSHzsNA0RQxedsIJKIPz6V+B8rSm6nxQbmGoY57HM
	 gEkEC0sm93CSINHwSl0nI1nz1Ow05cj7q5bmYMgP0D9vf9TggYlWvLtu6amg/rZS+y
	 c8I8jmtAFKRujwezh0WXKHmuk1MmvTDAxhYDmxcadk1JaFGPpEtErVe63hJuzryrqr
	 LO//AG5UIfxiImG4kzaWeDMSMjPl01UxhVyQj9SZsMdjlAEHtAGj9TjmCJEKYXBBXM
	 e4Tk/Whzf+of6Av/vW8LQ1Heaw7ISyLlq7igxySdZ1dJs96zAP03l/SKWr27U5zOvb
	 VqkrlnmvjVaCQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-392445f11c5so68975431fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9rMVmyn5kwcLcpHGxQMMLYG8w76aMWIFersZim2nvjIyS86NFVieaJdQwoivvUtl5LLgmAYddMvtBl@vger.kernel.org
X-Gm-Message-State: AOJu0YyZHlsUILvGEUi2KR0nP2zvuwHOX3bOfJHAj52tba9EaUOXSbZ0
	PE0j/49kUBfhM0tsQY0pL+H6BsYlx5xzScwpo1tKKweftgqCwDAzMg58D9p7B8DF5hmp7WfpNgO
	o+ML9XQMg6Kahu72YRMXbD9iVxrIU1BM=
X-Received: by 2002:a05:651c:e07:b0:393:a39f:5826 with SMTP id
 38308e7fff4ca-393b2bb72cemr10436711fa.21.1777985429375; Tue, 05 May 2026
 05:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:50:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
X-Gm-Features: AVHnY4KycpDZhMuiBecuVH9tsvrsrZHEaBFUypvKntpPBTYsQnaEicGr2XejHl0
Message-ID: <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: BAC374CE032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36201-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email]

SGkgRnJhbmshDQoNCk9uIFR1ZSwgTWF5IDUsIDIwMjYgYXQgMTo1NeKAr0FNIEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPiB3cm90ZToNCg0KPiBBZGQgYSBnZW5lcmljIHBpbmN0cmwgYmluZGlu
ZyBmb3IgYm9hcmQtbGV2ZWwgcGlubXV4IGNoaXBzIHRoYXQgYXJlDQo+IGNvbnRyb2xsZWQgdGhy
b3VnaCB0aGUgbXVsdGlwbGV4ZXIgc3Vic3lzdGVtLg0KPg0KPiBPbiBzb21lIGJvYXJkcywgZXNw
ZWNpYWxseSBkZXZlbG9wbWVudCBib2FyZHMsIGV4dGVybmFsIG11eCBjaGlwcyBhcmUgdXNlZA0K
PiB0byBzd2l0Y2ggU29DIHNpZ25hbHMgYmV0d2VlbiBkaWZmZXJlbnQgcGVyaXBoZXJhbHMgKGUu
Zy4gTU1DIGFuZCBVQVJUKS4NCj4gVGhlIG11eCBzZWxlY3QgbGluZXMgYXJlIG9mdGVuIGRyaXZl
biBieSBhIEdQSU8gZXhwYW5kZXIgb3ZlciBJMkMsDQo+IGFzIGlsbHVzdHJhdGVkIGJlbG93Og0K
Pg0KPiAgICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgIOKUjOKUgOKUgOKUgOKU
gOKUgOKUkA0KPiAgICAgICAgIOKUgiBTT0MgIOKUgiAgICAgIOKUgiAgICAg4pSCICAgIOKUjOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKUgiAg
ICAg4pSC4pSA4pSA4pSA4pa64pSCIE1NQyAgIOKUgg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAg
ICAgIOKUgiBNVVgg4pSCICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAgICAgICAg
IOKUgiAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKWuuKUgiAgICAg4pSCICAgIOKUjOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKUgiAgICAg4pSC
4pSA4pSA4pSA4pa64pSCIFVBUlQgIOKUgg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAgICAgIOKU
lOKUgOKUgOKUgOKUgOKUgOKUmCAgICDilJTilIDilIDilIDilIDilIDilIDilIDilJgNCj4gICAg
ICAgICDilIIgICAgICDilIIgICAgICAgICDilrINCj4gICAgICAgICDilIIgICAgICDilIIgICAg
4pSM4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSQDQo+ICAgICAgICAg4pSCIEkyQyAg4pSc4pSA4pSA4pSA4pa64pSCIEdQSU8gRXhwYW5k
ZXIgICAgIOKUgg0KPiAgICAgICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAgICDilJTilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgN
Cj4NCj4gVHJhZGl0aW9uYWxseSwgZ3Bpby1ob2cgaXMgdXNlZCB0byBjb25maWd1cmUgdGhlIG9u
Ym9hcmQgbXV4IGF0IGJvb3QuDQo+IEhvd2V2ZXIsIHRoZSBHUElPIGV4cGFuZGVyIG1heSBwcm9i
ZSBsYXRlciB0aGFuIGNvbnN1bWVyIGRldmljZXMgc3VjaCBhcw0KPiBNTUMuIEFzIGEgcmVzdWx0
LCB0aGUgTVVYIG1pZ2h0IG5vdCBiZSBjb25maWd1cmVkIHdoZW4gdGhlIHBlcmlwaGVyYWwNCj4g
ZHJpdmVyIHByb2JlcywgbGVhZGluZyB0byBpbml0aWFsaXphdGlvbiBmYWlsdXJlcyBvciBkYXRh
IHRyYW5zZmVyIGVycm9ycy4NCj4NCj4gSW50cm9kdWNlIGEgZ2VuZXJpYyBwaW5jdHJsIGJpbmRp
bmcgdGhhdCBtb2RlbHMgdGhlIGJvYXJkLWxldmVsIE1VWCBhcyBhDQo+IHBpbiBjb250cm9sIHBy
b3ZpZGVyIGFuZCBidWlsZHMgcHJvcGVyIGRldmljZSBsaW5rcyBiZXR3ZWVuIHRoZSBNVVgsIGl0
cw0KPiBHUElPIGNvbnRyb2xsZXIsIGFuZCBwZXJpcGhlcmFsIGRldmljZXMuIFRoaXMgZW5zdXJl
cyBjb3JyZWN0IHByb2JlDQo+IG9yZGVyaW5nIGFuZCByZWxpYWJsZSBtdXggY29uZmlndXJhdGlv
bi4NCj4NCj4gVGhlIGltcGxlbWVudGF0aW9uIGxldmVyYWdlcyB0aGUgc3RhbmRhcmQgbXVsdGlw
bGV4ZXIgc3Vic3lzdGVtLCB3aGljaA0KPiBwcm92aWRlcyBicm9hZCBzdXBwb3J0IGZvciBvbmJv
YXJkIG11eCBjb250cm9sbGVycyBhbmQgYXZvaWRzIHRoZSBuZWVkIGZvcg0KPiBwZXItZHJpdmVy
IGN1c3RvbSBNVVggaGFuZGxpbmcNCj4NCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5r
LkxpQG54cC5jb20+DQoNCkkgcHV0IHRoZSBwaW5jdHJsIHBhdGNoZXMgb24gYW4gaW1tdXRhYmxl
IGJyYW5jaCBmb3IgdGVzdGluZyBhZ2FpbiwNCmlmIG5vdGhpbmcgZXhwbG9kZXMgSSB3aWxsIHRy
eSB0byBtZXJnZSBpdCBmb3IgbGludXgtbmV4dCBBU0FQIQ0KDQpZb3VycywNCkxpbnVzIFdhbGxl
aWoNCg==

