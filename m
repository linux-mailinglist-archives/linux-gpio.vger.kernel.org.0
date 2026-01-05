Return-Path: <linux-gpio+bounces-30168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2859CF5023
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 684D330DBDC0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9949F33C1A2;
	Mon,  5 Jan 2026 17:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YTqplzI7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2F221F13
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633977; cv=none; b=MUfJ9aP7+isMrdpvpOBdHxyXBq3Y5PQYx2+RNU+OClR84gziu+dmNs7Tz78YrH96ldayQE4LO33v2O4AvpdlEb7UgrgKV425SAgKWO2Pz021+RMSJWeULjrft7+y3oy2Azow13OWtrFFCBCxjGz8Dn39COfpSI4bne+Ze+f7vcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633977; c=relaxed/simple;
	bh=CVpW5/Zd9lYOzQZDUV5oXk9ELhtlaEwa9p16fIJQxaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=VCxkxJmxjTvQ6Nb1jYeMPpK3x0b6PHXiXgE/kjwJMWTYs9I11XiSio3k7pEGVemmb4G4N8zgUhjxJOxX36ejjFJOdA+KbdFnfFR0QbYvY40hvHEC5WmZ9pviMO+W++7v+E8yhZR+ayphzpFoDXCx071auIBn6KY6ca47fioRwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YTqplzI7; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260105172610euoutp019a825a2f590ae8946f144a18e74c297c~H5bsA7HhP0698406984euoutp01M
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:26:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260105172610euoutp019a825a2f590ae8946f144a18e74c297c~H5bsA7HhP0698406984euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767633970;
	bh=HOjgqd3iH9VSaEyXmTlVr38S71qCvBeaplEY9gEOh+s=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YTqplzI7NEdneVn1JNM5Ld2bXzHUxzturbJpsNJr71x1L6PAaK6Qu32pZQD3C0/i/
	 NPeCriGQ+tBNHjNIvvQyW2rBZ6UWAtCyVFYoDJCszUB2X0ysZtapG163sgAgntR9IY
	 ECbQm4iMcisknEn/fA3nvMBBnfn7c5knTJM+K1JI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260105172609eucas1p15f537acd3c8b5693fd859caa4bb3ebeb~H5brneMDU0899108991eucas1p1n;
	Mon,  5 Jan 2026 17:26:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260105172608eusmtip14f6aa4938548bf91f924900b03d95e92~H5bqLuayW0890808908eusmtip1P;
	Mon,  5 Jan 2026 17:26:07 +0000 (GMT)
Message-ID: <3cb799ed-6760-481b-991d-5d90a23b9128@samsung.com>
Date: Mon, 5 Jan 2026 18:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=Mc7dqqpNTb9WSLD7ZZr9dmUTO_rvujJi3LhhjVncjE-8w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105172609eucas1p15f537acd3c8b5693fd859caa4bb3ebeb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105115023eucas1p1af1f8e80041f94843beb664966894fb9
X-EPHeader: CA
X-CMS-RootMailID: 20260105115023eucas1p1af1f8e80041f94843beb664966894fb9
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
	<CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
	<20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
	<00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
	<CAMRc=Mc7dqqpNTb9WSLD7ZZr9dmUTO_rvujJi3LhhjVncjE-8w@mail.gmail.com>

On 05.01.2026 13:28, Bartosz Golaszewski wrote:
> On Mon, Jan 5, 2026 at 12:50 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 22.12.2025 11:01, Bartosz Golaszewski wrote:
>>> We currently support sharing GPIOs between multiple devices whose drivers
>>> use either the GPIOLIB API *OR* the reset control API but not both at
>>> the same time.
>>>
>>> There's an unlikely corner-case where a reset-gpios pin can be shared by
>>> one driver using the GPIOLIB API and a second using the reset API. This
>>> will currently not work as the reset-gpio consumers are not described in
>>> firmware at the time of scanning so the shared GPIO just chooses one of
>>> the proxies created for the consumers when the reset-gpio driver performs
>>> the lookup. This can of course conflict in the case described above.
>>>
>>> In order to fix it: if we deal with the "reset-gpios" pin that's shared
>>> acconding to the firmware node setup, create a proxy for each described
>>> consumer as well as another one for the potential reset-gpio device. To
>>> that end: rework the matching to take this into account.
>>>
>>> Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case")
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> This patch landed in linux-next as commit 49416483a953 ("gpio: shared:
>> allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my
>> tests I found that it breaks booting and triggers warnings on some of my
>> test boards. Reverting it on top of next-20260105 fixes those issues.
>> Let me know if I can help debugging this issue.
>>
>>
>> Here are relevant logs from my 3 test systems:
>>
> Thanks for the report.
>
> Nice combo, it looks like these are three separate bugs...
>
>> 1. Samsung TM2e - arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>>
>> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2
>> device (lanes:4 bpp:24 mode-flags:0x6e0)
>> Unable to handle kernel NULL pointer dereference at virtual address
> Could you use faddr2line to point me to the exact offending line? This
> would speed up the debugging.

I need some time to get that output, but this issue is caused by a 
devm_gpiod_get_optional() call for a gpio that is not defined for that 
board.

> > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


