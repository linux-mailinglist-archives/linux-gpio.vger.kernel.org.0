Return-Path: <linux-gpio+bounces-38618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t71zIpgzMmrBwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:41:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB098696A1F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=MPW4AKOM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38618-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38618-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D517B303ACFD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 05:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25913A168B;
	Wed, 17 Jun 2026 05:41:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC4396D28
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 05:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674900; cv=none; b=sZomM/23Rz6HeirZCJXgnhDJlGnPWW+I8iPkWAVBVcwVoPPH70xsJaJynjHk0exe9oJDmV7YG8br5QuVY04BJlvcW5iNf/kSw0ZvEQcFAQdUa6rCYOKvbrrOiXV80Y+nGhxp2oMTSOoMuUHCBTgTRib4ZwH172vr2gk4lVuQPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674900; c=relaxed/simple;
	bh=ZSuCL5t5XX8Xmpvwcd5FMwBZU0diNhqm+X1107ZiLxk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tQj7++ZUzP7Jmj22xGVIVnHlMS7C/mtrS4TF0APSRnjtRzS02ukdiqO7Gn92waGVi4WZ+2ZRw5ranfUKVxwpOi6aqLMrHI4YuwBzS7trflW9NPm2y87wLVQDu644AO3qGq3PEeT43vJ2+gWePmSuUzDT2BGFc4Cb2JVNK+syC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MPW4AKOM; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260617054135epoutp0423adf7a8eadc5895fbbfdd4402ac3269~5x_C9BngF0759107591epoutp04i
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 05:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260617054135epoutp0423adf7a8eadc5895fbbfdd4402ac3269~5x_C9BngF0759107591epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781674895;
	bh=XEb09tuegWQKJOgPPfrzmIOTwZci+/S7ntkCWNIVpyM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=MPW4AKOM+FdBkZo8+RF6/AXQF8/Krdb9nW/pu5vyZBhhT3rlENdPgm6m/YaapUfHq
	 hz8VUvWI0ctG9c51ka09ZYkwgIfhrSoDlZ40Ude60TjrODuZ11Y4EJG0Ut0W/OTlb4
	 Ai0+t84amo2F0WwpWfsaRAMNnfUKLjrKXyLIB4XE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260617054135epcas5p1ce66eee29b95261bceba63afdea6d944~5x_Cpbc-p0264202642epcas5p1n;
	Wed, 17 Jun 2026 05:41:35 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ggCQj5Gkwz2SSKb; Wed, 17 Jun
	2026 05:41:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260617054133epcas5p11f49326a4feacbc8ebe1ae5d2ebf7274~5x_AilJk23211332113epcas5p1E;
	Wed, 17 Jun 2026 05:41:33 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260617054131epsmtip1c9d3604895987387c5bb18bbaf4a12f9~5x9-Iko_R1134811348epsmtip18;
	Wed, 17 Jun 2026 05:41:31 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>
Subject: RE: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Wed, 17 Jun 2026 11:11:30 +0530
Message-ID: <008e01dcfe1b$f4409ec0$dcc1dc40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMGoMk1ThMrnj1axtfzUgH2Sg21+wGT6tp2AllkeGABYkkJwbPEeMvA
Content-Language: en-us
X-CMS-MailID: 20260617054133epcas5p11f49326a4feacbc8ebe1ae5d2ebf7274
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc
References: <CGME20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc@epcas5p1.samsung.com>
	<20260615085252.1964423-1-alim.akhtar@samsung.com>
	<20260615085252.1964423-5-alim.akhtar@samsung.com>
	<CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38618-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peter.griffin@linaro.org,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: EB098696A1F

Hi Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, June 15, 2026 8:07 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: krzk@kernel.org; robh@kernel.org; conor+dt@kernel.org;
> linusw@kernel.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; hajun.sung@samsung.com
> Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
> Samsung Exynos8855 smdk
> 
> Hi Alim,
> 
> On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com>
> wrote:
> >
> > Add initial devicetree support for Samsung smdk board using
> > Exynos8855 SoC.
> 
> I think it would be worthwhile adding a more verbose description of the
> Exynos8855 SoC in the commit message e.g. a brief list of the major IPs on
> the SoC.
> 
Sure will add more details here 
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> [..]
> > diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > new file mode 100644
> > index 000000000000..f5132bcaa47c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung Exynos8855 SMDK board device tree source
> > + *
> > + * Copyright (C) 2026 Samsung Electronics Co., Ltd.
> > + *
> > + * Device tree source file for WinLink's E850-96 board which is based
> > +on
> > + * Samsung Exynos8855 SoC.
> 
> E850-96 isn't based on the Exynos8855 SoC. I guess it's leftover from a
> copy/paste.
> 
Ah! My bad, will remove these, Thanks

> regards,
> 
> Peter 
> 
> 


