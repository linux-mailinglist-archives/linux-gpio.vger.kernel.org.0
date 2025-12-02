Return-Path: <linux-gpio+bounces-29204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E759C9A110
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 06:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C165C3A3BAE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 05:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E9E2C21FE;
	Tue,  2 Dec 2025 05:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gppVUMq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D31FFC59
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652909; cv=none; b=ryghrhu6RaOTI52596/KcVndDXP1NWgbxHaLsc6L/jS6G5kzFbQUNS1oJ1vsBdAlKj3i3RSe3XcB4QgQh72huDTnOIjq6v1WhxzQbLLd1CpxWdyUZNV5xjUIhWbUwmIh7ss4DjXPyQCVgdeFwYIJrHmeCuUP+RvgNeDWVtxq+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652909; c=relaxed/simple;
	bh=puPRBqfCwpkFrXRcvuKAI2IXeXIzK3aPWzgcKBEElNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=MfPL/eIRhveG869+0Z5tPWZi88BCJBaYkiFG/5jLuaXvEGixojGAlUGrpKihdI2j3oBLHPaIofevU4XJztgqM2kvpxS3li9U9tOwSSaAyx+LKKwShqOyI+2z649elqpLePu8mA+2VGBjICRzUwTIem6swFTi246lEGzqw7ZuZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gppVUMq5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251202052138epoutp04ff3fafa46fea213a96780cae6028cb70~9TnZCjQj41939619396epoutp040
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 05:21:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251202052138epoutp04ff3fafa46fea213a96780cae6028cb70~9TnZCjQj41939619396epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764652898;
	bh=MsxMW42tTUpfnSb+cVvM82f1VIEKFMAb7RjjXdyt9xU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gppVUMq57c+S/xWolSAlmQLYUDlP4hXOyPCaGHgS5XRlH3W4jCNktCHtZTXz3MsGJ
	 6QrxyCUUIIgkXEyEtcmtclViZLvP36uefQVeQmADJAVpCa9qyjXzSnuFrVapx3gDSS
	 6qNxATHwe7n/DpXXljqtGbEgkF0FwFQtg+pvIRlQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251202052138epcas2p3e38604e1d7f5c556ec20f19148c1ecf4~9TnYjfbkQ0215102151epcas2p3E;
	Tue,  2 Dec 2025 05:21:38 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dL8Jd6fNPz6B9m5; Tue,  2 Dec
	2025 05:21:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251202052137epcas2p181c2b2b3e6c1c477673750337d7ab70b~9TnXWeEWg0818908189epcas2p1e;
	Tue,  2 Dec 2025 05:21:37 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202052136epsmtip10727e8111a2561b0232e20cbd590c61a~9TnXRf8OC1847518475epsmtip1g;
	Tue,  2 Dec 2025 05:21:36 +0000 (GMT)
Message-ID: <833ba1e9-bf5e-41f1-a319-06521d598e5c@samsung.com>
Date: Tue, 2 Dec 2025 14:23:25 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 0/5] pinctrl: samsung: exynos9 cleanups and fixes
To: Peter Griffin <peter.griffin@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CADrjBPrPpgy93At1bBanBoka14eyRbAArep5zuvbGWcOEnOuRQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251202052137epcas2p181c2b2b3e6c1c477673750337d7ab70b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073601epcas2p2c72bdd8689a69b35b988894653300c75
References: <CGME20251117073601epcas2p2c72bdd8689a69b35b988894653300c75@epcas2p2.samsung.com>
	<20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CADrjBPrPpgy93At1bBanBoka14eyRbAArep5zuvbGWcOEnOuRQ@mail.gmail.com>

On 11/25/25 02:42, Peter Griffin wrote:
> Hi Youngmin,
> 
> On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> Several SoCs carried near-duplicate pin bank macro families, making
>> tables verbose and hard to share when only the bank type (alive/off)
>> differs.
>>
>> GS101 had its own helpers even though the newer EXYNOS9_* helpers cover
>> the same semantics, including per-bank filter control (FLTCON) offsets.
>>
>> Some pin-bank tables didn't match the SoC TRMs (bank type, EINT class,
>> or bank names), and FLTCON wasn't always at a contiguous offset from
>> EINT.
>>
>> This series does
>> - Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
>> - Fix table errors on Exynos2200/7885/8890/8895 per TRM.
>> - Add explicit per-bank FLTCON offsets and update affected tables.
>> - Drop GS101-specific macros in favor of EXYNOS9_*.
>> - Rename gs101_pinctrl_{suspend,resume} ->
>>   exynos9_pinctrl_{suspend,resume}.
>>
>> This series was based on the pinctrl/samsung tree [1].
>>
>> I tested on Exynos850 through boot and verified the pin values as
>> follows:
> 
> One thing I just noticed is exynos850_pin_ctrl isn't actually setting
> the .suspend and .resume callbacks so some of this code won't be
> executed there (specifically saving/restoring the fltcon register). If
> you're using e850 platform to test this series, you likely want to set
> 
> .suspend = exynos9_pinctrl_suspend,
> .resume = exynos9_pinctrl_resume,
> 
> in exynos850_pin_ctrl for the alive bank
> 
> You can then #define DEBUG in drivers/pinctrl/samsung/pinctrl-exynos.c
> 
> Recompile, and do
> 
> echo platform > /sys/power/pm_test
> echo mem > /sys/power/state
> 
> and you should see all the debug from the newly enabled exynos9
> suspend/resume callbacks
> 
> [  871.104840][  T741] gph2: save     con 0x00000000
> [  871.104932][  T741] gph2: save fltcon0 0x00000000
> [  871.105022][  T741] gph2: save fltcon1 0x00000000
> [  871.105109][  T741] gph2: save    mask 0x0000003f
> <snip>
> 
> Prior to adding fltcon_offset and the gs101 (now exynos9) specific
> suspend/resume callbacks this would generate a SError on gs101
> 
> Thanks,
> 
> Peter

Hi Peter,

Thanks for the review and testing.
Your tips on suspend/resume for Exynos850 and the GS101 details are very helpful.
After this series is merged, I will add the exynos9_pinctrl_suspend and _resume hooks for Exynos850 and run the tests you suggested.

Thanks,
Youngmin
 

