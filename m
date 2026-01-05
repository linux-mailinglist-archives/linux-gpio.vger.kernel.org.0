Return-Path: <linux-gpio+bounces-30161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E24CF4E5E
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7490320523B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 16:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809F831326A;
	Mon,  5 Jan 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Brn+i5tH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07B287259
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631694; cv=none; b=ikBFuJmipKXxyjugfRfg1kS8Mlt4A/QUxmMiLJoY0CJt0fcWZNoXfNXVXKRQ1Uz9maKrfVo/Rh7XUSeONftvfKoNgFiaYBO/LaXHPmvozFmsrhK78ruSbrxpzm3CS4+uYs/OZUhpiZNgywIuRhFv/pcNzsuHq2Nl4e++z8q4KwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631694; c=relaxed/simple;
	bh=00B3axppR27wiO0sEmy25Bju4rZEFJsCtdknEmkMcqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=oGqxkk5KOXU0AhKskcY+EMuMjaBQZudo7q4mslUbSjZSpUvl5MNMMkSBF8WD8EZoETwaw7DTXdTVKkjk/6kCPW0hPkIu3dZgfXQvZn51mP8oPcgdOWGIUV4oVOjN/T7Olj4GMXZPzOwGwY5t7vUkUV4RX0ZB4GJ7h+vLJavlbuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Brn+i5tH; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260105164808euoutp015c8b88f663ae3462f855197ea6f1f756~H46fBHj6C2921529215euoutp01n
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 16:48:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260105164808euoutp015c8b88f663ae3462f855197ea6f1f756~H46fBHj6C2921529215euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767631688;
	bh=jSnN4etEU9ctrlAJwthlAE6WDlc298mU9eZSFoH+8lQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Brn+i5tHDx7Q4ENqSVCW1heUuhKLE4FbI5h9Cw4O8kaF1E9gruSxu3Wp58HI4Lzfy
	 gtlTmHwx0bx3fvekZ6aJ3Hyg5hn0FH+XCCVydstNxenHuHfCwm9iRcMM1Y/O9P2zHh
	 YuImYKlpFPkAXKCUweYRB/az3uBcT8KMkBCwHKbo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260105164808eucas1p16a28149327acaa04c6fbeeb1d244d2e5~H46ev3xmy2995529955eucas1p1V;
	Mon,  5 Jan 2026 16:48:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260105164807eusmtip17dc9cdc284feddae2cdf42ba2700b38c~H46d3Neuo1786817868eusmtip1P;
	Mon,  5 Jan 2026 16:48:07 +0000 (GMT)
Message-ID: <9ce71b14-b058-4192-9562-99856a89af1d@samsung.com>
Date: Mon, 5 Jan 2026 17:48:05 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/2] gpio: shared: another set of small fixes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105164808eucas1p16a28149327acaa04c6fbeeb1d244d2e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f
X-EPHeader: CA
X-CMS-RootMailID: 20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f
References: <CGME20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f@eucas1p1.samsung.com>
	<20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>

On 05.01.2026 16:52, Bartosz Golaszewski wrote:
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>        gpio: shared: assign the correct firmware node for reset-gpio use-case
>        gpio: shared: fix a race condition
>
>   drivers/gpio/gpiolib-shared.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> ---
> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25

Those patches indeed fixes some timing issues with the commit 
49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between 
reset-gpio and gpiolib"), but they also reveals another one. I've 
initially thought that this is a false positive and needs only a proper 
lockdep annotation, but some boards hang just after similar lockdep splat:

============================================
WARNING: possible recursive locking detected
6.19.0-rc4-next-20260105+ #11974 Not tainted
--------------------------------------------
(udev-worker)/192 is trying to acquire lock:
ffff000004c15098 (&ref->lock){+.+.}-{4:4}, at: 
gpio_shared_dev_is_reset_gpio+0xcc/0x234

but task is already holding lock:
ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at: 
gpio_shared_add_proxy_lookup+0x98/0x228

other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&ref->lock);
   lock(&ref->lock);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

3 locks held by (udev-worker)/192:
  #0: ffff00000b3ad8e8 (&dev->mutex){....}-{4:4}, at: 
__driver_attach+0x90/0x1ac
  #1: ffff8000830f2600 (gpio_devices_srcu){.+.+}-{0:0}, at: 
gpiod_find_and_request+0x0/0x574
  #2: ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at: 
gpio_shared_add_proxy_lookup+0x98/0x228

stack backtrace:
CPU: 3 UID: 0 PID: 192 Comm: (udev-worker) Not tainted 
6.19.0-rc4-next-20260105+ #11974 PREEMPT
Hardware name: Raspberry Pi 3 Model B (DT)
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  print_deadlock_bug+0x260/0x350
  __lock_acquire+0x11b0/0x2254
  lock_acquire+0x1c8/0x354
  __mutex_lock+0xa8/0x894
  mutex_lock_nested+0x24/0x30
  gpio_shared_dev_is_reset_gpio+0xcc/0x234
  gpio_shared_add_proxy_lookup+0x1a0/0x228
  gpiod_find_and_request+0x200/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get+0x18/0x24
  reset_gpio_probe+0x4c/0x14c [reset_gpio]
  auxiliary_bus_probe+0x44/0x90
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x60/0x128
  __auxiliary_driver_register+0x68/0xe4
  reset_gpio_driver_init+0x28/0x1000 [reset_gpio]
  do_one_initcall+0x64/0x308
  do_init_module+0x58/0x23c
  load_module+0x1b48/0x1dc4
  init_module_from_file+0xd4/0xec
  idempotent_init_module+0x188/0x280
  __arm64_sys_finit_module+0x68/0xac
  invoke_syscall+0x48/0x10c
  el0_svc_common.constprop.0+0xc8/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x50/0x2e8
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


