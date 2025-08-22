Return-Path: <linux-gpio+bounces-24790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94062B316AB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 13:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3285A4568
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 11:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5FF2EA73E;
	Fri, 22 Aug 2025 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d74udDNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6F2DCF47
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863311; cv=none; b=jPyHgkpRsewfJTny9qrdKjdAN9R498uPZSNVoUGsT2sHjPaI71Cld8LaOyv23pu37Fi+UC2K5ESNNEblq76TMvuyrEA5tkZw1evamL1WluItpnbXz19K4NW7qC+qrLZG9kN7J7QfvyyGBRsjvOfnzK+qPCglq9LUbhL4oY5xO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863311; c=relaxed/simple;
	bh=JsmbBh9zOMLHqHK84o+JX7ZaGFFwKJOvdPNpFTm5Ock=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=XjGcjjUJPY3VAoM2+0OtKxspi6yTK7BsnSAymFzMwxP9bpgweaJovqj/72238bUYrC9fr+E8Mqv6F56kQDC/pU0V+jhUhoaTTKk0IMnvXM4qlOJsM2BhZWqys9YPNA9vQe4kqvS3ymxBEKgkwhesrjsT3zcr6+jdKkiuVPurK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d74udDNd; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250822114827epoutp016f47554bb1038d8bb2a22f9d983613ce~eFGAaQFpM1168711687epoutp01a
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 11:48:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250822114827epoutp016f47554bb1038d8bb2a22f9d983613ce~eFGAaQFpM1168711687epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755863307;
	bh=ujFd4Giejy/I8yLtIBnVKvcKVCgcw/eNDX6Exvhq7UA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d74udDNdRLlEbqqumXK4rJgpifPriLPXzz9b0W+Aas1YiC5aN5I3DGXbT8IjmiMzL
	 qHLFdlv5mr9p9wCaIkmTO7YvYUH5KI9gWiGQltIY3HJSofgO3gWufJC200A20nG460
	 shvObn4sAShELbef1IenGujP9Pf+zN1+8DEdG5Qk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822114826epcas5p3a9642723b496f7b1b96daf8adfdf6de2~eFF-roZFA0540505405epcas5p3v;
	Fri, 22 Aug 2025 11:48:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c7dk12S6Mz2SSKX; Fri, 22 Aug
	2025 11:48:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250822114824epcas5p2aa289a9a1e75e075c3ccc31f4f2ccb12~eFF9IW-Rj0864208642epcas5p2Q;
	Fri, 22 Aug 2025 11:48:24 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822114819epsmtip1c9b4c65341b860acb88b9ac5f2783f81~eFF4r4n5q2807728077epsmtip1l;
	Fri, 22 Aug 2025 11:48:19 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <pankaj.dubey@samsung.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <3a936b3b-0599-4b0a-83a8-52b899c24125@kernel.org>
Subject: RE: [PATCH v2 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Date: Fri, 22 Aug 2025 17:18:18 +0530
Message-ID: <000001dc135a$aa6b10c0$ff413240$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKGrjAaAh8NcQIA49H5zwGbeAXBtNq/wGA=
Content-Language: en-in
X-CMS-MailID: 20250822114824epcas5p2aa289a9a1e75e075c3ccc31f4f2ccb12
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f@epcas5p4.samsung.com>
	<20250821123310.94089-9-ravi.patel@samsung.com>
	<3a936b3b-0599-4b0a-83a8-52b899c24125@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 22 August 2025 12:09
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org;
> arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com;
> inbaraj.e@samsung.com; swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com;
> hypmean.kim@samsung.com; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v2 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> > From: SungMin Park <smn1196@coasia.com>
> >
> > Add initial device tree support for Axis ARTPEC-8 SoC.
> >
> > This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> >
> > Signed-off-by: SungMin Park <smn1196@coasia.com>
> > Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ...
> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> 
> No CPU mask?

Thanks for review and pointing out.

Yes. You are right.
I will add GIC_CPU_MASK_SIMPLE(4) in next version as this uses GICv2 (gic-400) not GICv3.

This may be carried out from other exynos/fsd platforms

I found below 2 related links.
https://lkml.org/lkml/2025/6/13/1073
https://lkml.org/lkml/2023/11/28/403

Thanks,
Ravi

> 
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +};
> 
> 
> Best regards,
> Krzysztof


