Return-Path: <linux-gpio+bounces-32263-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDGCCM5doWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32263-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:03:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 544311B4DF8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8671A301CFAF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D3E3859E2;
	Fri, 27 Feb 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4qi1EZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A850B36F437
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182965; cv=none; b=gokel8mDWXo4TpsdKLSedyMwa055MoocL1IEqETb24egsus5SW2SltXy+tAnvA2QnL3JPENJtkUgN2s27LhBYJ0WdAFi5IMCcHiD1ZwCt+5yunstZIjuU09FnHWQ9JAudnf5jlq6s9Ly+C8bFYWClZYSm12Dki9d38hgpgzkcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182965; c=relaxed/simple;
	bh=iCg2Zxvo6acA2Yw2ZIYWtwivAjVjBS6a9BEhToze71Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHn2vBQXDW8X0he/BpCRkN23yuZpuIDLBm8CcG1LBV1VNNoNbdDW7T5xgUjMhugCMViSq3JXtHQz0T7uGgd73ncmCQwXNeKe9frXwhUMZEkJ7c/n8Mepz04NiwnuRRgKxM7xNnkRFfiWFj8WPUJPtG6/8p4AIfm6xeDEU1kcr9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4qi1EZf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671C1C2BCB1
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772182965;
	bh=iCg2Zxvo6acA2Yw2ZIYWtwivAjVjBS6a9BEhToze71Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k4qi1EZfRw2heqQivANaFL/LcTxGSYUAL8eWKO4G9HW4qJSVHMEryLEU1uC3nbHNP
	 dr70uzD3S/CL9agrWWYWZ/8NFND6InWIm/yglWWLPfSKcxVM7zZr2z57vs11kFQE0T
	 WdunP7/XZrWvda/guiWKsYE+tXtScAY0ZfoP2Yu+N/6Up+3QuoBC1Lzaow0B7bn3Sa
	 BkS6o+Esa0DruWvzvXa4sdzl2Z7yrTQbvk+BZV1baXrNFlCIIuHvHQlYYNay6M5b6C
	 1e9/ymLJXDQN8F+AduEpqIsKmOfNBjJPtfwabkA5asOseA5AIJraB2+QTIW6vF2b+R
	 +ik24v2kk5M9Q==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79628fb5c05so13904067b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGIIu4+SrpigtH0RuyVJYyOLfMyXkpXb+f6VqqMYP0OjzwmCRfTtK58C7mHOgMAFKDwKduEeU64QhI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6A+qyhAE5PPh2VufU4KhNS4GV6SDiawfoVuqUHle6jCd6/ACT
	kYm5BDLIyihDEF50lmPABPXliUwnGfEtu+vXhjO4CdLf3yI4FFSyGCdRf6/Nt7LrZHVYdSnCQhf
	huZxkmGjlcP2ZefOzgCOqm7nlrS2L3LY=
X-Received: by 2002:a05:690c:60c5:b0:796:3c39:eb96 with SMTP id
 00721157ae682-79885467a49mr18074887b3.13.1772182964670; Fri, 27 Feb 2026
 01:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com> <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:02:33 +0100
X-Gmail-Original-Message-ID: <CAD++jL=DXqRaqaiQ6d9U5pZMy5E16quma3_C_yQUw2jStmSO6Q@mail.gmail.com>
X-Gm-Features: AaiRm51E612-p9CExYKxT8Z14vh3Cki1CVedgmDy7Sz7aZn6k_WzumQSUtTh2J4
Message-ID: <CAD++jL=DXqRaqaiQ6d9U5pZMy5E16quma3_C_yQUw2jStmSO6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32263-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
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
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 544311B4DF8
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMTI6NTXigK9BTSBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4gd3JvdGU6DQoNCj4gQWRkIGEgZ2VuZXJpYyBwaW5jdHJsIGJpbmRpbmcgZm9yIGJvYXJk
LWxldmVsIHBpbm11eCBjaGlwcyB0aGF0IGFyZQ0KPiBjb250cm9sbGVkIHRocm91Z2ggdGhlIG11
bHRpcGxleGVyIHN1YnN5c3RlbS4NCj4NCj4gT24gc29tZSBib2FyZHMsIGVzcGVjaWFsbHkgZGV2
ZWxvcG1lbnQgYm9hcmRzLCBleHRlcm5hbCBtdXggY2hpcHMgYXJlIHVzZWQNCj4gdG8gc3dpdGNo
IFNvQyBzaWduYWxzIGJldHdlZW4gZGlmZmVyZW50IHBlcmlwaGVyYWxzIChlLmcuIE1NQyBhbmQg
VUFSVCkuDQo+IFRoZSBtdXggc2VsZWN0IGxpbmVzIGFyZSBvZnRlbiBkcml2ZW4gYnkgYSBHUElP
IGV4cGFuZGVyIG92ZXIgSTJDLA0KPiBhcyBpbGx1c3RyYXRlZCBiZWxvdzoNCj4NCj4gICAgICAg
ICDilIzilIDilIDilIDilIDilIDilIDilJAgICAgICDilIzilIDilIDilIDilIDilIDilJANCj4g
ICAgICAgICDilIIgU09DICDilIIgICAgICDilIIgICAgIOKUgiAgICDilIzilIDilIDilIDilIDi
lIDilIDilIDilJANCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgICAgIOKUguKUgOKU
gOKUgOKWuuKUgiBNTUMgICDilIINCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgTVVY
IOKUgiAgICDilJTilIDilIDilIDilIDilIDilIDilIDilJgNCj4gICAgICAgICDilIIgICAgICDi
lJzilIDilIDilIDilIDilIDilrrilIIgICAgIOKUgiAgICDilIzilIDilIDilIDilIDilIDilIDi
lIDilJANCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilIIgICAgIOKUguKUgOKUgOKUgOKW
uuKUgiBVQVJUICDilIINCj4gICAgICAgICDilIIgICAgICDilIIgICAgICDilJTilIDilIDilIDi
lIDilIDilJggICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+ICAgICAgICAg4pSCICAg
ICAg4pSCICAgICAgICAg4payDQo+ICAgICAgICAg4pSCICAgICAg4pSCICAgIOKUjOKUgOKUgOKU
gOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAg
ICAgICAgIOKUgiBJMkMgIOKUnOKUgOKUgOKUgOKWuuKUgiBHUElPIEV4cGFuZGVyICAgICDilIIN
Cj4gICAgICAgICDilJTilIDilIDilIDilIDilIDilIDilJggICAg4pSU4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+DQo+IFRyYWRp
dGlvbmFsbHksIGdwaW8taG9nIGlzIHVzZWQgdG8gY29uZmlndXJlIHRoZSBvbmJvYXJkIG11eCBh
dCBib290Lg0KPiBIb3dldmVyLCB0aGUgR1BJTyBleHBhbmRlciBtYXkgcHJvYmUgbGF0ZXIgdGhh
biBjb25zdW1lciBkZXZpY2VzIHN1Y2ggYXMNCj4gTU1DLiBBcyBhIHJlc3VsdCwgdGhlIE1VWCBt
aWdodCBub3QgYmUgY29uZmlndXJlZCB3aGVuIHRoZSBwZXJpcGhlcmFsDQo+IGRyaXZlciBwcm9i
ZXMsIGxlYWRpbmcgdG8gaW5pdGlhbGl6YXRpb24gZmFpbHVyZXMgb3IgZGF0YSB0cmFuc2ZlciBl
cnJvcnMuDQo+DQo+IEludHJvZHVjZSBhIGdlbmVyaWMgcGluY3RybCBiaW5kaW5nIHRoYXQgbW9k
ZWxzIHRoZSBib2FyZC1sZXZlbCBNVVggYXMgYQ0KPiBwaW4gY29udHJvbCBwcm92aWRlciBhbmQg
YnVpbGRzIHByb3BlciBkZXZpY2UgbGlua3MgYmV0d2VlbiB0aGUgTVVYLCBpdHMNCj4gR1BJTyBj
b250cm9sbGVyLCBhbmQgcGVyaXBoZXJhbCBkZXZpY2VzLiBUaGlzIGVuc3VyZXMgY29ycmVjdCBw
cm9iZQ0KPiBvcmRlcmluZyBhbmQgcmVsaWFibGUgbXV4IGNvbmZpZ3VyYXRpb24uDQo+DQo+IFRo
ZSBpbXBsZW1lbnRhdGlvbiBsZXZlcmFnZXMgdGhlIHN0YW5kYXJkIG11bHRpcGxleGVyIHN1YnN5
c3RlbSwgd2hpY2gNCj4gcHJvdmlkZXMgYnJvYWQgc3VwcG9ydCBmb3Igb25ib2FyZCBtdXggY29u
dHJvbGxlcnMgYW5kIGF2b2lkcyB0aGUgbmVlZCBmb3INCj4gcGVyLWRyaXZlciBjdXN0b20gTVVY
IGhhbmRsaW5nLg0KPg0KPiBBbGxvdyBwaW5jdHJsLSogcGF0dGVybiBhcyBub2RlIG5hbWUgYmVj
YXVzZSB0aGlzIHBpbmN0cmwgZGV2aWNlIGhhdmUgbm90DQo+IHJlZyBwcm9wZXJ0eS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQoNCkkgdGhpbmsgdGhp
cyBpcyBzbWFydCBhbmQgZWxlZ2FudC4NClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz4NCg0KWW91cnMsDQpMaW51cyBXYWxsZWlqDQo=

