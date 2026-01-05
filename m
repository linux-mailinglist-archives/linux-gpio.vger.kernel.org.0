Return-Path: <linux-gpio+bounces-30173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D68CF535C
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 19:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6953530C9B85
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 18:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8D93254B5;
	Mon,  5 Jan 2026 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gfCIieX/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A732570D
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636970; cv=none; b=dQb5xWf5B69yF2FtSBYPl3d3VqxeiWR3EfVXtfZBOtvXAo3B1l7aKic8XyDMWTrK+wBh7WBx8VG6k4fBSPiwOYFjjtKSmhTesMPFqZZS/exZLGltfFmoJ3zVapq32uJWEXjqrljVb9lhAypkn0ubGUZxOyWLxT+v25Y5uyBtJys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636970; c=relaxed/simple;
	bh=A7gNXNFB8xRtDfZr1V3EN/I8adhlhmCKGYrl7EFiLoI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=X3sohXtUtznyroq2jMVlCxvlqRvuKAYhSLpWp0qUUfiMnWzmwwJEaTE9NMW2YPZGdR8QUx2x3zuiUFkw8/YfgItScf1bN7AdQv2ohy5qQfnRlhykFsff06YlTn6uJmUQFuvhWOyNi+3XxsEAI7He1kInEiqRfIID3Y/M3w+kdso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gfCIieX/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260105181604euoutp02deaee51038e1acf2145a5f97fe19a54f~H6HRHyZIJ2944329443euoutp02x
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 18:16:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260105181604euoutp02deaee51038e1acf2145a5f97fe19a54f~H6HRHyZIJ2944329443euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767636964;
	bh=CZpNhKgKBUJeeJlb2Oj06Qm6plDvlhoN1tV/Sntfu10=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=gfCIieX/XAsyYCo75g4mZmzjGDpxvJBlfMKZx8sp1OERx3qDFULmGlANtdm4Jmlki
	 82NHg+pIzyibAf+uJcHKy/ybh+0ph4T+tFzLgG12hKwjdk57rA9hxX2ZFLKGs8F9sy
	 TuDpbwBP9lfhc+d7KDRvc2ozr0oFILwk7jme4SKw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260105181604eucas1p2c0c3f917560e8deda5dfa5b7cd09ac89~H6HQ8FGc61567315673eucas1p2U;
	Mon,  5 Jan 2026 18:16:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260105181603eusmtip1c8f3f9a01d1f78ce46a688dc2d0392da~H6HPvItmA0426604266eusmtip1f;
	Mon,  5 Jan 2026 18:16:02 +0000 (GMT)
Message-ID: <eac0d2aa-fcc0-4aa4-a266-89957dcf7b70@samsung.com>
Date: Mon, 5 Jan 2026 19:16:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
In-Reply-To: <3cb799ed-6760-481b-991d-5d90a23b9128@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105181604eucas1p2c0c3f917560e8deda5dfa5b7cd09ac89
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
	<3cb799ed-6760-481b-991d-5d90a23b9128@samsung.com>

On 05.01.2026 18:26, Marek Szyprowski wrote:
> On 05.01.2026 13:28, Bartosz Golaszewski wrote:
>> On Mon, Jan 5, 2026 at 12:50 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 22.12.2025 11:01, Bartosz Golaszewski wrote:
>>>> We currently support sharing GPIOs between multiple devices whose 
>>>> drivers
>>>> use either the GPIOLIB API *OR* the reset control API but not both at
>>>> the same time.
>>>>
>>>> There's an unlikely corner-case where a reset-gpios pin can be 
>>>> shared by
>>>> one driver using the GPIOLIB API and a second using the reset API. 
>>>> This
>>>> will currently not work as the reset-gpio consumers are not 
>>>> described in
>>>> firmware at the time of scanning so the shared GPIO just chooses 
>>>> one of
>>>> the proxies created for the consumers when the reset-gpio driver 
>>>> performs
>>>> the lookup. This can of course conflict in the case described above.
>>>>
>>>> In order to fix it: if we deal with the "reset-gpios" pin that's 
>>>> shared
>>>> acconding to the firmware node setup, create a proxy for each 
>>>> described
>>>> consumer as well as another one for the potential reset-gpio 
>>>> device. To
>>>> that end: rework the matching to take this into account.
>>>>
>>>> Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner 
>>>> case")
>>>> Signed-off-by: Bartosz Golaszewski 
>>>> <bartosz.golaszewski@oss.qualcomm.com>
>>> This patch landed in linux-next as commit 49416483a953 ("gpio: shared:
>>> allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my
>>> tests I found that it breaks booting and triggers warnings on some 
>>> of my
>>> test boards. Reverting it on top of next-20260105 fixes those issues.
>>> Let me know if I can help debugging this issue.
>>>
>>>
>>> Here are relevant logs from my 3 test systems:
>>>
>> Thanks for the report.
>>
>> Nice combo, it looks like these are three separate bugs...
>>
>>> 1. Samsung TM2e - arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>>>
>>> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached 
>>> s6e3hf2
>>> device (lanes:4 bpp:24 mode-flags:0x6e0)
>>> Unable to handle kernel NULL pointer dereference at virtual address
>> Could you use faddr2line to point me to the exact offending line? This
>> would speed up the debugging.
>
> I need some time to get that output, but this issue is caused by a 
> devm_gpiod_get_optional() call for a gpio that is not defined for that 
> board.
>
I think that everything is in the call stack:

Call trace:
  gpiod_direction_input_nonotify+0x20/0x39c (P)
  gpiod_configure_flags+0x23c/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  samsung_dsim_host_attach+0x1c8/0x284
  mipi_dsi_attach+0x30/0x54
  s6e3ha2_probe+0x148/0x200 [panel_samsung_s6e3ha2]

...


The issue is in gpiod_direction_input_nonotify+0x20/0x39c:

$ grep gpiod_direction_input_nonotify System.map
ffff800080810360 T gpiod_direction_input_nonotify

$ aarch64-linux-gnu-addr2line -f -e vmlinux ffff800080810380
class_gpio_chip_guard_constructor
/home/m.szyprowski/dev/kernel/linux-next/drivers/gpio/gpiolib.h:231

IMHO it looks that gpiod_configure_flags() is called for NULL gpio_chip.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


