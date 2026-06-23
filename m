Return-Path: <linux-gpio+bounces-38841-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeNvNtpjOmou7wcAu9opvQ
	(envelope-from <linux-gpio+bounces-38841-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 12:45:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C76B65D7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 12:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=O8bBb+LK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38841-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38841-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18A00307B0A3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304BC3D092E;
	Tue, 23 Jun 2026 10:44:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE93CFF6A
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 10:44:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211452; cv=none; b=p5LF5AHSpv64ebYf+pigoKwb/ASuG05TeZD122uBrvuosfSAGC77m19UgypqqqKxyTtpivySVPYnPgA+a39oubY23P3NlrIrYu6b1nQYcBu5//kHip28tw5k1xaT4Bnzq+ZQ43mqHWzCjs2Pipw9Ys+5OxVYLh5KVCVoCx/NprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211452; c=relaxed/simple;
	bh=q425o3ZOVGkqH42YjwrhP9FimssVNj4/5jXO26HkfYk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=V3L5BwtozQJyFzy/ZXosM+VqsM+dvR3yu08FoaSEHlH+QEaR3lNRVUaN8yDsvlVZj18KUabERTAA8TQ744PmDArZikogHa0DSSz7dxhMCZ6ixFUZbEreRewxWITE+2bul2GJt11BE+b/FGUiVC/Ig14VaXsbCb/RW0mNzuqb/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O8bBb+LK; arc=none smtp.client-ip=203.254.224.33
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260623104407epoutp03183bb6e251a07782823be41c381fdb02~7r957oB2l3165931659epoutp03i
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 10:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260623104407epoutp03183bb6e251a07782823be41c381fdb02~7r957oB2l3165931659epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782211447;
	bh=q425o3ZOVGkqH42YjwrhP9FimssVNj4/5jXO26HkfYk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=O8bBb+LKaINuOMoKEIDtdhOY6taPAnaffwW3J+TqQLfAhQa1OrP8r/bfAb5d0YDdI
	 fNsamdyXJcOgDzuHCRKZ/LdYg27sooi+EE/RymMzrT1ec/DCurmIL7JSI2sC4eMJSU
	 pJdmoVk9LpYMwgth6dS4C5Cm3nPykEqTKWMu5D1Q=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260623104407epcas5p2d20f73182001a4cfcc57458ebcc83f5c~7r95jgrCJ2474024740epcas5p2E;
	Tue, 23 Jun 2026 10:44:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gl1s21nNVz3hhT4; Tue, 23 Jun
	2026 10:44:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260623104405epcas5p302102767e75793af0a9e5ed200f20d37~7r94HmiO30450004500epcas5p3D;
	Tue, 23 Jun 2026 10:44:05 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260623104404epsmtip1dcc11df089a4d0df0054da0d26a8efe4~7r92q68982855328553epsmtip1n;
	Tue, 23 Jun 2026 10:44:04 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <peter.griffin@linaro.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>
Subject: RE: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
Date: Tue, 23 Jun 2026 16:14:02 +0530
Message-ID: <073601dd02fd$366f05d0$a34d1170$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGT6tp2RZIxrt3emHnypoZ6+CNYOwKaRXyAAp5zvu0CT5skxLah4aPQ
Content-Language: en-us
X-CMS-MailID: 20260623104405epcas5p302102767e75793af0a9e5ed200f20d37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>
	<20260615085252.1964423-3-alim.akhtar@samsung.com>
	<20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38841-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E8C76B65D7

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, June 17, 2026 3:50 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v2 2/5=5D dt-binding: pinctrl: samsung: Add exynos8=
855-
> pinctrl compatible
>=20
> On Mon, Jun 15, 2026 at 02:22:49PM +0530, Alim Akhtar wrote:
> > Document pin controller support on Exynos8855 SoC.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
>=20
> No wakeup-eint?
>=20
Yes, in next version, will update samsung,pinctrl-wakeup-interrupt.yaml wit=
h wakeup-eint entry
Thanks



