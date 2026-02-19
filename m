Return-Path: <linux-gpio+bounces-31924-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLjpF+qYl2mt2AIAu9opvQ
	(envelope-from <linux-gpio+bounces-31924-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:12:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F6163786
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36648301D33F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C9B330301;
	Thu, 19 Feb 2026 23:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABolqf4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699413254A9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542758; cv=none; b=CzwFsGlNSSwipOfp5hdctIVLhgWux1d6WruvhECpxzChOHXl5tV1lVL30igFlH9jEIWzBT53rcsR0LdEeykMygzeWRPClgVkdatS1l7NUfcaBSnzXIWWoKnDkSsBxzgsESPsfiYR/aK8JJXd6vDITx8mQy7DuFPgETY/X3rfEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542758; c=relaxed/simple;
	bh=nUUuOo6ZxopLvjIIEdBmRg87D1jjyje4PdZz0bjrgJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsV6QR+njOV9jwBGL9UCqB5H7J6wgT+0yKrxDwtwlOi7vuNDfwgWbP70mh5RO5GmwuKeHvMmt8HkAkmvD+dNJ31BbsakHPvKN+u8gRt38xk/eSnpprzi6pjN9n+WrrTDl9XPN3kMAS0p7D+Y1NAZLCW9NYrAHSkerTlTmSWH+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABolqf4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD52C2BCB3
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771542758;
	bh=nUUuOo6ZxopLvjIIEdBmRg87D1jjyje4PdZz0bjrgJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABolqf4aUjZpne4hZV8TotXvrfrZdQbUypdnQOST6bcfHgh/1R/LS76yw2RZdd8C+
	 aBSa+QhZy64NjjGNpyVSIAkheruiA0L5rboDgy85J8DHiedpaVX1+pYYIUhM9DRIp0
	 cEWAlmVkGVRIzWfoFEhqApE20fmSU6e3cDwwnNkuEQ1HUX+p11oltQeUbRuPCdk2CU
	 Tv4RZJBCLR3uGjR5dhCU2/jl8+V6brxKoWGafnwVcsz8pm6lSoBs59//EcyqPaPepE
	 O4nglqhIlPhGFN8s79vwd9MpyFZCVnRjrbz9BpSXOZYknACUw9nWQHrgf5XuKNj/F7
	 GTbB4O8TJ4UPA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797afd2e872so15650117b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 15:12:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXW3ABmU3FurBJB6C2IovDWxoqApUvbyUHKdvat1BFuDk4Vgz9+SzXKJaiqSDHH3M50opB46P8y/kSW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7JmnoBIWTOfmHTIX/0v1zpVMb2UFYMbW830K2MKsLwIBL4CB
	/5F+nyppLGD8hu4Z70MmxehUU6ptBuiEuz235lNfQL+pcVfP4GCspLwO+R+cG0YwExvC0z+QTdR
	QSpqhP6+fEDbuMak/EDgKlCVWAeMyRMo=
X-Received: by 2002:a05:690c:498e:b0:796:2dfb:4af0 with SMTP id
 00721157ae682-797ac4e1933mr158898597b3.10.1771542757367; Thu, 19 Feb 2026
 15:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 00:12:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLmc43G9Ny9pseFw=HqmkaRPJdqMTXyLSa5eQUdoXNCu_Q@mail.gmail.com>
X-Gm-Features: AaiRm51dIVUnrSx9uukc7pK72Gq6A4VMruWXR8EfofV5QNuTsk2vfzGXdc8DdSY
Message-ID: <CAD++jLmc43G9Ny9pseFw=HqmkaRPJdqMTXyLSa5eQUdoXNCu_Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31924-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB2F6163786
X-Rspamd-Action: no action

SGkgRnJhbmssDQoNCk9uIFRodSwgRmViIDE5LCAyMDI2IGF0IDExOjI04oCvUE0gRnJhbmsgTGkg
PEZyYW5rLkxpQG54cC5jb20+IHdyb3RlOg0KDQo+IEFkZCBhIGdlbmVyaWMgcGluY3RybCBiaW5k
aW5nIGZvciBib2FyZC1sZXZlbCBwaW5tdXggY2hpcHMgdGhhdCBhcmUNCj4gY29udHJvbGxlZCB0
aHJvdWdoIHRoZSBtdWx0aXBsZXhlciBzdWJzeXN0ZW0uDQo+DQo+IE9uIHNvbWUgYm9hcmRzLCBl
c3BlY2lhbGx5IGRldmVsb3BtZW50IGJvYXJkcywgZXh0ZXJuYWwgbXV4IGNoaXBzIGFyZSB1c2Vk
DQo+IHRvIHN3aXRjaCBTb0Mgc2lnbmFscyBiZXR3ZWVuIGRpZmZlcmVudCBwZXJpcGhlcmFscyAo
ZS5nLiBNTUMgYW5kIFVBUlQpLg0KPiBUaGUgbXV4IHNlbGVjdCBsaW5lcyBhcmUgb2Z0ZW4gZHJp
dmVuIGJ5IGEgR1BJTyBleHBhbmRlciBvdmVyIEkyQywNCj4gYXMgaWxsdXN0cmF0ZWQgYmVsb3c6
DQo+DQo+ICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSQICAgICAg4pSM4pSA4pSA4pSA
4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCIFNPQyAg4pSCICAgICAg4pSCICAgICDilIIgICAg4pSM
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg4pSC
ICAgICDilILilIDilIDilIDilrrilIIgTU1DICAg4pSCDQo+ICAgICAgICAg4pSCICAgICAg4pSC
ICAgICAg4pSCIE1VWCDilIIgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+ICAgICAg
ICAg4pSCICAgICAg4pSc4pSA4pSA4pSA4pSA4pSA4pa64pSCICAgICDilIIgICAg4pSM4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSQDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg4pSCICAgICDi
lILilIDilIDilIDilrrilIIgVUFSVCAg4pSCDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgICAg
4pSU4pSA4pSA4pSA4pSA4pSA4pSYICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAg
ICAgICAgIOKUgiAgICAgIOKUgiAgICAgICAgIOKWsg0KPiAgICAgICAgIOKUgiAgICAgIOKUgiAg
ICDilIzilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilJANCj4gICAgICAgICDilIIgSTJDICDilJzilIDilIDilIDilrrilIIgR1BJTyBFeHBh
bmRlciAgICAg4pSCDQo+ICAgICAgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgIOKUlOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
mA0KPg0KPiBUcmFkaXRpb25hbGx5LCBncGlvLWhvZyBpcyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUg
b25ib2FyZCBtdXggYXQgYm9vdC4NCj4gSG93ZXZlciwgdGhlIEdQSU8gZXhwYW5kZXIgbWF5IHBy
b2JlIGxhdGVyIHRoYW4gY29uc3VtZXIgZGV2aWNlcyBzdWNoIGFzDQo+IE1NQy4gQXMgYSByZXN1
bHQsIHRoZSBNVVggbWlnaHQgbm90IGJlIGNvbmZpZ3VyZWQgd2hlbiB0aGUgcGVyaXBoZXJhbA0K
PiBkcml2ZXIgcHJvYmVzLCBsZWFkaW5nIHRvIGluaXRpYWxpemF0aW9uIGZhaWx1cmVzIG9yIGRh
dGEgdHJhbnNmZXIgZXJyb3JzLg0KPg0KPiBJbnRyb2R1Y2UgYSBnZW5lcmljIHBpbmN0cmwgYmlu
ZGluZyB0aGF0IG1vZGVscyB0aGUgYm9hcmQtbGV2ZWwgTVVYIGFzIGENCj4gcGluIGNvbnRyb2wg
cHJvdmlkZXIgYW5kIGJ1aWxkcyBwcm9wZXIgZGV2aWNlIGxpbmtzIGJldHdlZW4gdGhlIE1VWCwg
aXRzDQo+IEdQSU8gY29udHJvbGxlciwgYW5kIHBlcmlwaGVyYWwgZGV2aWNlcy4gVGhpcyBlbnN1
cmVzIGNvcnJlY3QgcHJvYmUNCj4gb3JkZXJpbmcgYW5kIHJlbGlhYmxlIG11eCBjb25maWd1cmF0
aW9uLg0KPg0KPiBUaGUgaW1wbGVtZW50YXRpb24gbGV2ZXJhZ2VzIHRoZSBzdGFuZGFyZCBtdWx0
aXBsZXhlciBzdWJzeXN0ZW0sIHdoaWNoDQo+IHByb3ZpZGVzIGJyb2FkIHN1cHBvcnQgZm9yIG9u
Ym9hcmQgbXV4IGNvbnRyb2xsZXJzIGFuZCBhdm9pZHMgdGhlIG5lZWQgZm9yDQo+IHBlci1kcml2
ZXIgY3VzdG9tIE1VWCBoYW5kbGluZw0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJh
bmsuTGlAbnhwLmNvbT4NCg0KSSBraW5kIG9mIGxpa2Ugd2hhdCBJIHNlZSBoZXJlLiA6KQ0KDQpU
aGlzIG1ha2VzIGEgbG90IG9mIHNlbnNlOiBpdCB1c2VzIG11eGVzLCBhbmQgaXQgbXV4ZXMgcGlu
cy4NClNvIHRoYXQgaXMgdGhlIGFwcHJvcHJpYXRlIGRlc2NyaXB0aW9uLCBwaW5tdXhlcyB1c2lu
Zw0KbXV4ZXMgKGluIHR1cm4gY29udHJvbGxlZCBieSBHUElPcykuDQoNCkkganVzdCBuZWVkIHRv
IGhhdmUgYnV5LWluIGZyb20gRFQgYmluZGluZw0KbWFpbnRhaW5lcnMgYW5kIHRoZSBhdXRob3Jz
IG9mIHRoZSBtdXggY29yZSB0aGF0IHRoaXMgaXMgYSBnb29kDQppZGVhLg0KDQpZb3VycywNCkxp
bnVzIFdhbGxlaWoNCg==

