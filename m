Return-Path: <linux-gpio+bounces-23907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C4B16707
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 21:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 584ED5A6ECD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 19:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC23202F67;
	Wed, 30 Jul 2025 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UINQwgg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB11E7C19;
	Wed, 30 Jul 2025 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753904587; cv=none; b=u06bpficSksIws0J4SPmwzZMIuUf2wldKb4q71Dz+rLnGtMQLq3QiUA6bYxjO8qAbFzqdKI74vIzBHrrTHyX8YkhlnN+/CoG2Ay/saH22+r5pUCPCkUr2To4H8zLxNeYLf/zK3DfxgLna1i+IvYhURZpi4lVtDPthu/sfcfeF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753904587; c=relaxed/simple;
	bh=mBiqnCcZwzp9m9hdznpsjeipa38RLGVR0dI7J56QWk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWh4yDVVPwh8eXmJx5cWDAiWt2nU8ak4vygYCgoCVwZtEA4ouxn7zXWsJVhTxCwwP9Avoue0i4YXoSXFnf/X+/g723l6cf1XudF0/z9ExxL+eb7DO6HZMXUuo0bLcu/wpjdD2w7+fj0bbYLcnbmeJUTBFNqGa79n0XmBG43F9/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UINQwgg7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E38C4CEE3;
	Wed, 30 Jul 2025 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753904586;
	bh=mBiqnCcZwzp9m9hdznpsjeipa38RLGVR0dI7J56QWk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UINQwgg7Bb48/XtWfqnqCIwmV5O4WK+re72ovMlkeyBukCbQ364LNyPE4/bDCh6uP
	 S+Hh6CfmIk3VU3PFPss1lwON+eQRjJss7mHmHXy14DF0cByMUpk41ecOueq3X/yj1k
	 8IWz0CWVqyADmStOZWJRuqswMinXGDnXuDPT1vbXqgxNReVhKD1p63Uid+i2abrpDs
	 ysrmw6MV2DeYa4wwG8KBDev17ssFqTnLIgJNX441CqqzQbBqIJRKXgXXIea1A4NMm5
	 Tz29kbWk+fjxV1XHiPJ3CX0VvvaDZaj9qpuyvB71B4OMyoCSzmh4iG1hs+DkxY7urr
	 ZOO1vqwstiKQg==
Message-ID: <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
Date: Wed, 30 Jul 2025 21:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2025 19:58, Russell King (Oracle) wrote:
> Hi,
> 
> First, I'm not sure who is responsible for the max77620-gpio driver

77620 is only for nvidia platforms and nvidia was upstreaming it,
although it shares the RTC driver part with max77686. You should Cc
nvidia SoC maintainers, maybe Thierry has someone around who could
investigate it.

> (it's not in MAINTAINERS) but this bug points towards a problem with
> one or other of these drivers.
> 
> Here is /proc/interrupts which may help debug this:
> 
>            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
>  94:          1          0          0          0          0          0 max77620-
> top   4 Edge      max77686-rtc
>  95:          1          0          0          0          0          0 max77686-rtc   1 Edge      rtc-alarm1
> 
> While running 6.16-rc7 on the Jetson Xavier NX platform, upon suspend,
> I receive the following lockdep splat. I've added some instrumentation
> into irq_set_irq_wake() which appears twice in the calltrace to print
> the IRQ number and the "on" parameter to locate which interrupts are
> involved in this splat. This splat is 100% reproducable.
> 
> [   46.721367] irq_set_irq_wake: irq=95 on=1
> [   46.722067] irq_set_irq_wake: irq=94 on=1
> [   46.722181] ============================================
> [   46.722578] WARNING: possible recursive locking detected
> [   46.722852] 6.16.0-rc7-net-next+ #432 Not tainted
> [   46.722965] --------------------------------------------
> [   46.723127] rtcwake/3984 is trying to acquire lock:
> [   46.723235] ffff0000813b2c68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
> [   46.723452]
>                but task is already holding lock:
> [   46.723556] ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
> [   46.723780]
>                other info that might help us debug this:
> [   46.723903]  Possible unsafe locking scenario:
> 
> [   46.724015]        CPU0
> [   46.724067]        ----
> [   46.724119]   lock(&d->lock);
> [   46.724212]   lock(&d->lock);
> [   46.724282]
>                 *** DEADLOCK ***
> 
> [   46.724348]  May be due to missing lock nesting notation
> 
> [   46.724492] 6 locks held by rtcwake/3984:
> [   46.724576]  #0: ffff0000825693f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x184/0x350
> [   46.724902]  #1: ffff00008fd7fa88 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x104/0x1c8
> [   46.725258]  #2: ffff000080a64588 (kn->active#87){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x10c/0x1c8
> [   46.725609]  #3: ffff8000815d4fb8 (system_transition_mutex){+.+.}-{4:4}, at: pm_suspend+0x220/0x300
> [   46.725897]  #4: ffff00008500a8f8 (&dev->mutex){....}-{4:4}, at: device_suspend+0x1d8/0x630
> [   46.726173]  #5: ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24


max77686 only disables/enables interrupts in suspend path, but max77620
is doing also I2C transfers, but above is regmap_irq_lock, not regmap
lock. Maybe this is not really max77620/77686 related at all? None of
these do anything weird (or different than last 5 years), so missing
nesting could be result of changes in other parts...


> [   46.732435]
>                stack backtrace:
> [   46.734019] CPU: 3 UID: 0 PID: 3984 Comm: rtcwake Not tainted 6.16.0-rc7-net-next+ #432 PREEMPT
> [   46.734029] Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
> [   46.734033] Call trace:
> [   46.734036]  show_stack+0x18/0x24 (C)
> [   46.734070]  dump_stack_lvl+0x90/0xd0
> [   46.734080]  dump_stack+0x18/0x24
> [   46.734107]  print_deadlock_bug+0x260/0x350
> [   46.734114]  __lock_acquire+0xf28/0x2088
> [   46.734120]  lock_acquire+0x19c/0x33c
> [   46.734126]  __mutex_lock+0x84/0x530
> [   46.734135]  mutex_lock_nested+0x24/0x30
> [   46.734155]  regmap_irq_lock+0x18/0x24
> [   46.734161]  __irq_get_desc_lock+0x8c/0x9c
> [   46.734170]  irq_set_irq_wake+0x5c/0x1ac	<== I guess IRQ 94

...like changes in irqchip.

> [   46.734176]  regmap_irq_sync_unlock+0x314/0x4f4
> [   46.734182]  __irq_put_desc_unlock+0x48/0x4c
> [   46.734190]  irq_set_irq_wake+0x88/0x1ac	<== I guess IRQ 95
> [   46.734195]  max77686_rtc_suspend+0x34/0x74


Because really above part is virtually unchanged since 10 years, except
my commit d8f090dbeafdcc3d30761aa0062f19d1adf9ef08 (you can try
reverting it... but it still could be correct/needed and just irqchip
changed something around locking).

Best regards,
Krzysztof

