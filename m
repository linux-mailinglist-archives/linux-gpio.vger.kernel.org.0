Return-Path: <linux-gpio+bounces-23919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D17B170F7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 14:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 862847B0ACE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 12:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842D62367A3;
	Thu, 31 Jul 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="b3EZfFre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA621FF4E;
	Thu, 31 Jul 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753964315; cv=none; b=TUHR3s5iakInXjpauIHlKCgyldpkleH6w8fVqkrqZDioapgdOqa49Epuvx5OcguDSnQIEp3v4m1zkurdI24OmygOzOGb3GPftrBUXue7Q7QDLTMTrcKxoihRuZJXtUNYP3L9tsJnKSSd+NTf4+8FMnduP+cvhJqMGfIAacnpx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753964315; c=relaxed/simple;
	bh=/CX/2RUDCbJNymubyca94X8VkSeBMIkHqttQZcMwmrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHWgiyJgSQvvckNwgYs0/WFSjev+lxvpV0OIJlgplEqKKqG9xCqgBD90amTqnVnlRl5W59ZLJBeb3S1uvNlSad5k7hFl9vjsDesfMyvT7h1594ZrjcZmkYcRzn/KNtgl7C3oSDwWOH7m8vHdU/OsESjgJWSmQKlaF11DnhiIxTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=b3EZfFre; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g9Y7U/7ppk8ar0axssLp7z8gd0mGPsu1bQlpBfW6e04=; b=b3EZfFretx430nxnoplfKCSoWp
	AqS0ZtdWaIL4Heo98IdCVrm8qeBUzMxo3HPsClly57SSYN8aEBuUvmWriY2yVTHbJpaAenhmMmzrm
	yYqvsQsZm/hd7oxALeo87ZlbnVi8w+4A/65LMV7LSuvuq97vwxk1taBFAEnCnpUNGx8jFp8LWvT4T
	rc86qdViT9kQk3+NzI+DlAB73QKVFNjglSlhNHoKyNfCvHW061tHoXmQTal2yA6IGpzNBv/n29WsA
	B6YRGEDU8SHrkneTS+/PH/cjchjb07rCo4LoCOwgML3TpFcRtryWonaYYmIp58yzw/t2L1Y1xMy20
	BKbkNLLw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52096)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhSEo-0004wD-0f;
	Thu, 31 Jul 2025 13:18:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhSEl-00011Y-1g;
	Thu, 31 Jul 2025 13:18:19 +0100
Date: Thu, 31 Jul 2025 13:18:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jul 30, 2025 at 09:43:02PM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2025 19:58, Russell King (Oracle) wrote:
> > Hi,
> > 
> > First, I'm not sure who is responsible for the max77620-gpio driver
> 
> 77620 is only for nvidia platforms and nvidia was upstreaming it,
> although it shares the RTC driver part with max77686. You should Cc
> nvidia SoC maintainers, maybe Thierry has someone around who could
> investigate it.
> 
> > (it's not in MAINTAINERS) but this bug points towards a problem with
> > one or other of these drivers.
> > 
> > Here is /proc/interrupts which may help debug this:
> > 
> >            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
> >  94:          1          0          0          0          0          0 max77620-
> > top   4 Edge      max77686-rtc
> >  95:          1          0          0          0          0          0 max77686-rtc   1 Edge      rtc-alarm1
> > 
> > While running 6.16-rc7 on the Jetson Xavier NX platform, upon suspend,
> > I receive the following lockdep splat. I've added some instrumentation
> > into irq_set_irq_wake() which appears twice in the calltrace to print
> > the IRQ number and the "on" parameter to locate which interrupts are
> > involved in this splat. This splat is 100% reproducable.
> > 
> > [   46.721367] irq_set_irq_wake: irq=95 on=1
> > [   46.722067] irq_set_irq_wake: irq=94 on=1
> > [   46.722181] ============================================
> > [   46.722578] WARNING: possible recursive locking detected
> > [   46.722852] 6.16.0-rc7-net-next+ #432 Not tainted
> > [   46.722965] --------------------------------------------
> > [   46.723127] rtcwake/3984 is trying to acquire lock:
> > [   46.723235] ffff0000813b2c68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
> > [   46.723452]
> >                but task is already holding lock:
> > [   46.723556] ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
> > [   46.723780]
> >                other info that might help us debug this:
> > [   46.723903]  Possible unsafe locking scenario:
> > 
> > [   46.724015]        CPU0
> > [   46.724067]        ----
> > [   46.724119]   lock(&d->lock);
> > [   46.724212]   lock(&d->lock);
> > [   46.724282]
> >                 *** DEADLOCK ***
> > 
> > [   46.724348]  May be due to missing lock nesting notation
> > 
> > [   46.724492] 6 locks held by rtcwake/3984:
> > [   46.724576]  #0: ffff0000825693f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x184/0x350
> > [   46.724902]  #1: ffff00008fd7fa88 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x104/0x1c8
> > [   46.725258]  #2: ffff000080a64588 (kn->active#87){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x10c/0x1c8
> > [   46.725609]  #3: ffff8000815d4fb8 (system_transition_mutex){+.+.}-{4:4}, at: pm_suspend+0x220/0x300
> > [   46.725897]  #4: ffff00008500a8f8 (&dev->mutex){....}-{4:4}, at: device_suspend+0x1d8/0x630
> > [   46.726173]  #5: ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
> 
> 
> max77686 only disables/enables interrupts in suspend path, but max77620
> is doing also I2C transfers, but above is regmap_irq_lock, not regmap
> lock. Maybe this is not really max77620/77686 related at all? None of
> these do anything weird (or different than last 5 years), so missing
> nesting could be result of changes in other parts...
> 
> 
> > [   46.732435]
> >                stack backtrace:
> > [   46.734019] CPU: 3 UID: 0 PID: 3984 Comm: rtcwake Not tainted 6.16.0-rc7-net-next+ #432 PREEMPT
> > [   46.734029] Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
> > [   46.734033] Call trace:
> > [   46.734036]  show_stack+0x18/0x24 (C)
> > [   46.734070]  dump_stack_lvl+0x90/0xd0
> > [   46.734080]  dump_stack+0x18/0x24
> > [   46.734107]  print_deadlock_bug+0x260/0x350
> > [   46.734114]  __lock_acquire+0xf28/0x2088
> > [   46.734120]  lock_acquire+0x19c/0x33c
> > [   46.734126]  __mutex_lock+0x84/0x530
> > [   46.734135]  mutex_lock_nested+0x24/0x30
> > [   46.734155]  regmap_irq_lock+0x18/0x24
> > [   46.734161]  __irq_get_desc_lock+0x8c/0x9c
> > [   46.734170]  irq_set_irq_wake+0x5c/0x1ac	<== I guess IRQ 94
> 
> ...like changes in irqchip.
> 
> > [   46.734176]  regmap_irq_sync_unlock+0x314/0x4f4
> > [   46.734182]  __irq_put_desc_unlock+0x48/0x4c
> > [   46.734190]  irq_set_irq_wake+0x88/0x1ac	<== I guess IRQ 95
> > [   46.734195]  max77686_rtc_suspend+0x34/0x74
> 
> 
> Because really above part is virtually unchanged since 10 years, except
> my commit d8f090dbeafdcc3d30761aa0062f19d1adf9ef08 (you can try
> reverting it... but it still could be correct/needed and just irqchip
> changed something around locking).

Thanks. I can say that reverting this has no effect on lockdep's splat,
so your change is in the clear.

However, there's also regmap-irq stuff to consider in the backtrace,
and looking at this today, I can't see how regmap-irq can be nested.

drivers/rtc/rtc-max77686.c makes use of regmap-irq since commit
f3937549a975 ("rtc: max77686: move initialisation of rtc regmap, irq
chip locally") in 2016.

drivers/mfd/max77620.c also makes use of regmap-irq since commit
327156c59360 ("mfd: max77620: Add core driver for MAX77620/MAX20024")
also in 2016.

Looking at the regmap-irq code, not much has changed in
regmap_irq_lock() and regmap_irq_sync_unlock(). The same seems true of
the ordering in irq_set_irq_wake(). So, I don't think this is a
regression as such, but a latent bug that either no one has bothered
to report, or no one bothers to test with lockdep enabled anymore.

I think the sequence here is:

irq_set_irq_wake() for IRQ 95 (rtc-alarm1) is called.
 + regmap_irq_lock() is called, which takes d->lock for IRQ 95
 + ... irq_set_irq_wake() does stuff
 ` regmap_irq_sync_unlock() is then called
   + this synchronises the wake state with the parent by calling
   | disable_irq_wake() or enable_irq_wake() as appropriate.
   | This calls irq_set_irq_wake(), causing recursion but on a
   | different IRQ, which also uses regmap-irq.
   | + regmap_irq_lock() is called, which takes d->lock for IRQ 94
   | |    * SPLAT *
   | + ...
   ` d->lock is released

This highlights the problem with "d->lock" - using "d" for a variable
name, while short, doesn't actually tell us what lock it is - is it
the irqdesc lock in kernel/irq ? Is it the regmap_irq_chip_data mutex
called "lock" in regmap_irq? It looks to me like it's the mutex.

So, I'd like to start a campaign against single-letter variables,
especially when it comes to code that takes locks! We should have
something in the kernel coding style which prevents single-letter
variable names when locks are taken!

I can't see that anything has changed in the code with regards to the
locking, so I think this is a bug that's been present ever since these
drivers were introduced, and regmap-irq is deficient in that it causes
the same lockdep lock class to be taken recursively when the IRQ wake
state changes.

From what I can see, irq wake support for regmap-irq was added in
commit a43fd50dc99a5 ("regmap: Implement support for wake IRQs") and
this is the only operation that is propagated to the parent
interupt(s). Thus, the above splat is unlikely to occur unless one
makes use of wake support on a regmap-irq based interrupt whose
parent is also regmap-irq based.

So, adding Mark Brown.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

