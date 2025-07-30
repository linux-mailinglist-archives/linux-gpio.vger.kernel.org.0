Return-Path: <linux-gpio+bounces-23906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D9B165E6
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 20:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D50097A5835
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66012DCF64;
	Wed, 30 Jul 2025 17:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="YwzOuVb0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AD2DFA3B;
	Wed, 30 Jul 2025 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898338; cv=none; b=UxpYLcxiEpgx/9BN0jSrlYvfBwchyVOp8oH9q839Nvjoknw3u3Z6E8kkdlo9bA4tOXxopC2gyfHzT3/GYvQkOs9bPTRO7cxWNP6BpDlvv1gEabKG4lf1BJnkoOwFj8W+EHgJ9n0XIXNiWUx7RUUYgGeFCkg+4revJncNPr6nI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898338; c=relaxed/simple;
	bh=1z01hDrYcbCykjKiOhVkzW+P9dAanyMq+uZ6G9CYXn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nfzyLK96KlRE3HWrHCorXfZOWdbzGKFd4ZemH8k0Jexpr/ZZ4iPDkMjttcTnduJZyeKt42lUX9X4VBIGi5+RNOnXTBajYfN2wAxlh63bkvk3gf0nj9VyGLFDLdNMsSqdC9BWCTXc0Jw+eMLYhtqKaEL4zWfs1gr4tCca7+F3Hsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=YwzOuVb0; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x7p6midhMNwbygvyh2YEDpiYkN3RvHG/JmpTAexz3Zc=; b=YwzOuVb0pWvtZP7+ld9hU4WupS
	MzcSfnu1Rxvhmh/hAhXnxl+yyOiQV0tbotlnVABCLwz6J1cljRqtdAiVNdXSeU6hh3ieDfLP5la+M
	K6LcWOnt9EwiRgTB2WH4wWIwG4B7HSs901SJMqkLM+mIGeAoqr0irdvcGjF/T52mYSM3imCEoTZRd
	l68eHVg22DorBOH2KeTd2Y4d2mWskK18u6Cm/Mv4bG3WPMuP6kt3HNFq/MymE96ry5jFIV5HX27of
	xd4/3KLfV+4HE59NvbJ/fI14xxIreqL1kYyxS+n8L0k1DQZWo7m6R+2k9rAUzgM7eKGM4ZbYfOq0G
	A5cOgHog==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41528)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhB4j-0003om-0a;
	Wed, 30 Jul 2025 18:58:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhB4f-0000BQ-25;
	Wed, 30 Jul 2025 18:58:45 +0100
Date: Wed, 30 Jul 2025 18:58:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

First, I'm not sure who is responsible for the max77620-gpio driver
(it's not in MAINTAINERS) but this bug points towards a problem with
one or other of these drivers.

Here is /proc/interrupts which may help debug this:

           CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
 94:          1          0          0          0          0          0 max77620-
top   4 Edge      max77686-rtc
 95:          1          0          0          0          0          0 max77686-rtc   1 Edge      rtc-alarm1

While running 6.16-rc7 on the Jetson Xavier NX platform, upon suspend,
I receive the following lockdep splat. I've added some instrumentation
into irq_set_irq_wake() which appears twice in the calltrace to print
the IRQ number and the "on" parameter to locate which interrupts are
involved in this splat. This splat is 100% reproducable.

[   46.721367] irq_set_irq_wake: irq=95 on=1
[   46.722067] irq_set_irq_wake: irq=94 on=1
[   46.722181] ============================================
[   46.722578] WARNING: possible recursive locking detected
[   46.722852] 6.16.0-rc7-net-next+ #432 Not tainted
[   46.722965] --------------------------------------------
[   46.723127] rtcwake/3984 is trying to acquire lock:
[   46.723235] ffff0000813b2c68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
[   46.723452]
               but task is already holding lock:
[   46.723556] ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
[   46.723780]
               other info that might help us debug this:
[   46.723903]  Possible unsafe locking scenario:

[   46.724015]        CPU0
[   46.724067]        ----
[   46.724119]   lock(&d->lock);
[   46.724212]   lock(&d->lock);
[   46.724282]
                *** DEADLOCK ***

[   46.724348]  May be due to missing lock nesting notation

[   46.724492] 6 locks held by rtcwake/3984:
[   46.724576]  #0: ffff0000825693f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x184/0x350
[   46.724902]  #1: ffff00008fd7fa88 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x104/0x1c8
[   46.725258]  #2: ffff000080a64588 (kn->active#87){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x10c/0x1c8
[   46.725609]  #3: ffff8000815d4fb8 (system_transition_mutex){+.+.}-{4:4}, at: pm_suspend+0x220/0x300
[   46.725897]  #4: ffff00008500a8f8 (&dev->mutex){....}-{4:4}, at: device_suspend+0x1d8/0x630
[   46.726173]  #5: ffff00008504dc68 (&d->lock){+.+.}-{4:4}, at: regmap_irq_lock+0x18/0x24
[   46.732435]
               stack backtrace:
[   46.734019] CPU: 3 UID: 0 PID: 3984 Comm: rtcwake Not tainted 6.16.0-rc7-net-next+ #432 PREEMPT
[   46.734029] Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
[   46.734033] Call trace:
[   46.734036]  show_stack+0x18/0x24 (C)
[   46.734070]  dump_stack_lvl+0x90/0xd0
[   46.734080]  dump_stack+0x18/0x24
[   46.734107]  print_deadlock_bug+0x260/0x350
[   46.734114]  __lock_acquire+0xf28/0x2088
[   46.734120]  lock_acquire+0x19c/0x33c
[   46.734126]  __mutex_lock+0x84/0x530
[   46.734135]  mutex_lock_nested+0x24/0x30
[   46.734155]  regmap_irq_lock+0x18/0x24
[   46.734161]  __irq_get_desc_lock+0x8c/0x9c
[   46.734170]  irq_set_irq_wake+0x5c/0x1ac	<== I guess IRQ 94
[   46.734176]  regmap_irq_sync_unlock+0x314/0x4f4
[   46.734182]  __irq_put_desc_unlock+0x48/0x4c
[   46.734190]  irq_set_irq_wake+0x88/0x1ac	<== I guess IRQ 95
[   46.734195]  max77686_rtc_suspend+0x34/0x74
[   46.734206]  platform_pm_suspend+0x2c/0x6c
[   46.734214]  dpm_run_callback+0xa4/0x218
[   46.734221]  device_suspend+0x200/0x630
[   46.734227]  dpm_suspend+0x17c/0x2d0
[   46.734233]  dpm_suspend_start+0x74/0x7c
[   46.734240]  suspend_devices_and_enter+0x104/0x618
[   46.734247]  pm_suspend+0x1b4/0x300
[   46.734254]  state_store+0x8c/0x110
[   46.734261]  kobj_attr_store+0x18/0x2c
[   46.734268]  sysfs_kf_write+0x50/0x7c
[   46.734275]  kernfs_fop_write_iter+0x134/0x1c8
[   46.734282]  vfs_write+0x24c/0x350
[   46.734289]  ksys_write+0x58/0xec
[   46.734295]  __arm64_sys_write+0x1c/0x28
[   46.734302]  invoke_syscall.constprop.0+0x50/0xe4
[   46.734311]  do_el0_svc+0x40/0xc8
[   46.734318]  el0_svc+0x44/0x148
[   46.734327]  el0t_64_sync_handler+0xc8/0xcc
[   46.734333]  el0t_64_sync+0x19c/0x1a0

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

