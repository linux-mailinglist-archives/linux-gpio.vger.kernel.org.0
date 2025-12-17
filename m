Return-Path: <linux-gpio+bounces-29661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6CCC5F66
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 05:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9EA530119DD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 04:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099CC2D4B68;
	Wed, 17 Dec 2025 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oNZkn66d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA429BDAB
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765945703; cv=none; b=ng3yF/otVLuJYtcM9oN6bRTSbkthL/twvm4mWTY265mXSc4JR3T376LpREaU5JJ6OhhZ/dkMNp86Luft/FKWm8SUmhqrhk7hOyVIhFRusyQvJKebFamUUr5T+lX4FeXHvsL2z08UTScjIiJORV3t+eFWupv6uecertZhtImQ4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765945703; c=relaxed/simple;
	bh=A1rvxwqNcczbfDxGrW7fYWBd4rykqdw6NntlmEoyf5k=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=a9wLNsHDvgeFWL/3CfIkQ3rgLXfdTzH2yJ1Zcum1fJwfh/TWx0IiPcdRbt3oQrB8FaWGzZBrtY39y0YS4Jpz34K+y7wenPrkcwS1aoIXZqKDTh9piUF7B0PcWJJ0fDI3t7hnve56FiYA9j3RoXrAUsRw02LCzrVX16Dv6rV+Iag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oNZkn66d; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251217042818epoutp02382f333b0491c2f288fdee4d2b05c961~B5kGGMHW21434914349epoutp02Z
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:28:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251217042818epoutp02382f333b0491c2f288fdee4d2b05c961~B5kGGMHW21434914349epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765945698;
	bh=/MLdaOBVFsd/izW/TfLsuG1WooZaOmcXkxRbIL5DuhU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oNZkn66d2du3qczkRk5avXr6T2yY4+VNv1oidNdrPcgup1tnBmYmFwusmIifqmP02
	 +Pma9uQ+9T0iBeGFbYgzM71UpfY1eqEO7+1xRJob3ZkO0wdNdIms0EQOz6v5P7n7D+
	 4EO7k5vWtLE0hwOXIPArI10EWr7ka4e4wDw6fsjs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217042817epcas5p4d5b2133483b819fec15422a08f151ccb~B5kFYj5AG0716707167epcas5p4V;
	Wed, 17 Dec 2025 04:28:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dWLQ81B5Kz6B9m7; Wed, 17 Dec
	2025 04:28:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217042815epcas5p422dc94c78156fe4dd27a55bf5a3d77e2~B5kD0_GeO0716707167epcas5p4T;
	Wed, 17 Dec 2025 04:28:15 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217042811epsmtip2748351ac61ebf74c6fb34be3fb116b2a~B5j-nm8bu0203802038epsmtip2P;
	Wed, 17 Dec 2025 04:28:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-2-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros
 under EXYNOS9_* and pass bank_type explicitly
Date: Wed, 17 Dec 2025 09:58:08 +0530
Message-ID: <12a301dc6f0d$8fea7ec0$afbf7c40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQDpeEtOAnYPzUS105ikcA==
Content-Language: en-us
X-CMS-MailID: 20251217042815epcas5p422dc94c78156fe4dd27a55bf5a3d77e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093026epcas2p28ddfd32305695df996841fd73b231b6b
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093026epcas2p28ddfd32305695df996841fd73b231b6b@epcas2p2.samsung.com>
	<20251202093613.852109-2-youngmin.nam@samsung.com>

Hello Youngmin,

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam@samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org; peter.griffin@linaro.org;
> semen.protsenko@linaro.org; ivo.ivanov.ivanov1@gmail.com
> Cc: ryu.real@samsung.com; d7271.choe@samsung.com;
> shin.son@samsung.com; jaewon02.kim@samsung.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Youngmin Nam
> <youngmin.nam@samsung.com>
> Subject: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros under
> EXYNOS9_* and pass bank_type explicitly
> 
> Modern Exynos platforms have several near-duplicate pin-bank macro
> families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
> tables verbose and harder to share across SoCs that differ only by
> bank_type (alive/off) layout.
> 
> This patch unifies them into one EXYNOS9_* macro family and makes the
> bank_type an explicit argument. The common 850-era bank types are also
> renamed to 'exynos9_bank_type_{alive,off}' to reflect their reuse on
> later Exynos 9xxx-generation parts.
> 
> Naming rationale:
> - Use of the EXYNOS9_* prefix indicates that these macros target
>   current Exynos generations sharing the same register layout and
>   EINT wiring model. Compared to SoC-specific prefixes
>   (EXYNOS850_*, EXYNOS8895_*),
>   EXYNOS9_* is clearer and more future-proof for modern parts.
> 
> Key changes:
> - Introduce:
>   - 'EXYNOS9_PIN_BANK_EINTN(bank_type, pins, reg, id)'
>   - 'EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)'
>   - 'EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)'
> - Rename:
>   - 'exynos850_bank_type_alive'-> 'exynos9_bank_type_alive'
>   - 'exynos850_bank_type_off'  -> 'exynos9_bank_type_off'
> - Convert pin-bank tables for:
>   - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
>     AutoV9, AutoV920, FSD
> - Update GS101/EXYNOSV920 helpers to reference 'exynos9_bank_type_*'
>   instead of the old exynos850 names.
> - Standardize on EXYNOS9_* macros while keeping SoC-specific
>   '*_bank_type_*' when layouts differ (e.g., 7870/8895).
> 
> No functional change intended.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
Thanks for consolidating this.
Feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Also tested on SADK based on Exynosautov920, GPIO EINT works fine. 

Tested-by: Alim Akhtar <alim.akhtar@samsung.com>



