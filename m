Return-Path: <linux-gpio+bounces-30172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724ACCF5145
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0DA13029C12
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A567D346A18;
	Mon,  5 Jan 2026 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GiM/WJV4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF96346768
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635463; cv=none; b=FIjxQVRaPdaGbS9G+aBtN017vJ/EOS3SaWaync6ntJKGC2mbDUD+0yUp/ZZ7OqHu/WDrllSGNo68ZZiwKPyauYXk8Qm9XjjLveWXUfk5mRkAxmGRijvUgu8MRikbJltzPO51d9qBh5siQftJnqUEdlXTa1sLzgW+1yDnzXGAtc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635463; c=relaxed/simple;
	bh=9p1fiHwOGBf+CAAbiRfNz3uGPtd19UyeeyZrPnVWdbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZMUEaw/WQA4imn3wAOltaZU7qPsQ5YPCntIPup7ysFJnAVTud9LLvokkj8wVosNvHEJWsLNRlPrn2eY+J4Dpi6rp3WsWLDr6SY5B6Zg9h9/xvyMi32yKUtP+BlEuJbcF9te85JeSAouOT4Fr8MVGwW7V13Yx2ZmEDLm6kqRDkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GiM/WJV4; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260105175058euoutp01e7c00fe0a0f7545f9bf27ba63cbaa267~H5xVyEXiq3175131751euoutp01C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260105175058euoutp01e7c00fe0a0f7545f9bf27ba63cbaa267~H5xVyEXiq3175131751euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767635458;
	bh=UIl6SHJhWkfN0/1FLxWUZ38nXwKxplUrKF/eFOo1uVI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GiM/WJV48jrskVobEyKgi0zMxPnakTZILgr9xs5nLcJUMteqWX+UA4H5dn+8tQBfG
	 eEjBFYSdZHxP7pXQLzHJadNpHOS1agFolQJbMwygokqAGAwGse0W4jjI5xCvrsJ2u5
	 x9zG/eMfACdNYs9467DjD7I5LUrKcj9SYhQYX+LY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6~H5xVeVD8s2877028770eucas1p2i;
	Mon,  5 Jan 2026 17:50:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175055eusmtip2bd9960cd4f35babf9088305da14604af~H5xTTw38e1923619236eusmtip2N;
	Mon,  5 Jan 2026 17:50:55 +0000 (GMT)
Message-ID: <d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com>
Date: Mon, 5 Jan 2026 18:50:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
	Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
X-EPHeader: CA
X-CMS-RootMailID: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
	<CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
	<CGME20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42@eucas1p1.samsung.com>
	<CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>

On 05.01.2026 18:38, Bartosz Golaszewski wrote:
> On Mon, 5 Jan 2026 18:28:23 +0100, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> said:
>> Hi Bartosz,
>>
>> On Mon, Jan 5, 2026 at 4:05 PM Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> [...]
>>>    mutex_lock_nested+0x24/0x30
>>>    pinctrl_get_device_gpio_range+0x44/0x128
>>>    pinctrl_gpio_set_config+0x40/0xdc
>>>    gpiochip_generic_config+0x28/0x3c
>>>    gpio_do_set_config+0xa8/0x194
>> $ git grep gpiochip_generic_config drivers/pinctrl/meson/
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
>>   = gpiochip_generic_config,
>> drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =
>> gpiochip_generic_config;
>>
>> pinctrl-amlogic-a4.c still has:
>>    .can_sleep = false,
>>
>> Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
>> was the intention to fix "all" Amlogic pin controllers in this patch
>> (which would mean that the change to pinctrl-amlogic-a4.c is missing)?
>>
>>
> Yeah, I missed it. I will send a follow-up tomorrow.

I found that drivers/pinctrl/pinctrl-rockchip.c suffers for the same 
issue, although I don't see where this ".can_sleep" flag has to be added:

BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name: 
kworker/u16:0
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
6 locks held by kworker/u16:0/12:
  #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0}, 
at: process_one_work+0x18c/0x604
  #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at: 
process_one_work+0x1b4/0x604
  #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at: 
__device_attach+0x38/0x1b0
  #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at: 
gpiod_direction_output_raw_commit+0x0/0x360
  #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at: 
gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
  #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at: 
gpiod_direction_output_raw_commit+0x0/0x360
irq event stamp: 81450
hardirqs last  enabled at (81449): [<ffff8000813acba4>] 
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (81450): [<ffff8000813abfb8>] 
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (79616): [<ffff8000811455fc>] 
__alloc_skb+0x17c/0x1e8
softirqs last disabled at (79614): [<ffff8000811455fc>] 
__alloc_skb+0x17c/0x1e8
CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted 
6.19.0-rc4-next-20260105+ #11975 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_direction+0x3c/0xe0
  pinctrl_gpio_direction_output+0x14/0x20
  rockchip_gpio_direction_output+0xb8/0x19c
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_direction_output+0x34/0xf8
  gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_configure_flags+0xbc/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  rockchip_pcie_probe+0x98/0x380
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


