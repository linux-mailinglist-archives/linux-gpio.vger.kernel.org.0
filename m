Return-Path: <linux-gpio+bounces-15011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14130A197AC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 18:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC28188EBA3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 17:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3471C215179;
	Wed, 22 Jan 2025 17:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EJAAplQV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kvr+8hsg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B5215177;
	Wed, 22 Jan 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566833; cv=none; b=nURZuMf/SoiflIMM8H4MyAgKaojXnFGGAQgLNy4SG0nPdN7v0dUFwMtl4JbzLizWPzVupNOnII3/EXaS44YrU+KyBoOdVHs++rda3UUmdOWwOiUhfijPR/i/hF3mLTdFa5+SA0FnDauKKNvgHqZzA6c/nhGTydUypHJnXxI90fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566833; c=relaxed/simple;
	bh=NOPFlF79x7X/71gX4Rc7Ab6n0y04AIzIcAKXjMwyDWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VesYsNPeMwCt5cYU2YDXR1xjhmuHN5YzRH0I0tR7ujEVQ+aXlGOdkLEcaAwcZhHVvrl+NQclgUxEp3QeT3VhSpzNrHVuzaA1SvcE+kKk7FkgtPn1i9c1GAK92qwcsz+t7KkGIaLyoqcO1ReXOZzFTHB36Ec7ZRbLKg+2KH20ZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EJAAplQV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kvr+8hsg; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E1EFB114011A;
	Wed, 22 Jan 2025 12:27:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jan 2025 12:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737566829;
	 x=1737653229; bh=PCGoscJyC8BD5Vvj2xqYUMK0FQ/DP9kmMqY9Szn95GA=; b=
	EJAAplQVFqEIbGD1s/l6JHqGS6igp4lP7GYrzI62CRdCa1m7qNcWa/ja2fcgMi5g
	RteRetHqJlSgI6p3UuEHRckbh0/BDTTUuyFl5Zerghx04j4gRaWyErTiAirlSTT4
	pacg73syBtaeTltFdnBs8u/fE89KoQnT87OI2+dbGs0HPC23rqog/lHRyx8/bthW
	mRiGC+3pTMm3fI08Xfqv157e+rptoELfs0nqhppZKKGfr7hLy9AUmCMqIuSlJ5Lx
	R1obG/e+9M+pvW3oFMm9+4L2nzwzoPKvBbEWY6j+RZi97wiLMKLxg64rHLr0mjY6
	0HAyoHKD91IzFOlk9agz0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737566829; x=
	1737653229; bh=PCGoscJyC8BD5Vvj2xqYUMK0FQ/DP9kmMqY9Szn95GA=; b=k
	vr+8hsgAqYVJq92hLDZUTbhuUwUB/D73HgMtZYeFLSzH6z1SB+mZs7cjom/3zBTt
	wavjUsCp79knjIkj76rsADM9vEU3ypYaFuh+X+y8Y7eLP8ypdEyl6jm9R8u+woOd
	dmAqYrd9ZfXHg+X7aCl9tfxQCDkMtcV61Nn1o+Li9mWZYu6ySRMeU5PWVRJKRi4V
	wRb5PiCEXk2lhU414c7YLJYcI9gtLmOBvVT94gPRkHJrJjLZM4ERnyJoN3rx57EQ
	4KLtRH92C2bm6a+sUJMZbINxqLo6sIvfVketX9fKWsnLr6W79gI5oZYWH525Jko3
	7ZJMmZFvsGJuZ4Y9DhJ1g==
X-ME-Sender: <xms:bSqRZ2IHoWvs8FebCfHzYiFkcSLeQkE39ALCjShN_CCDVglLeq7STQ>
    <xme:bSqRZ-JMgJKvDeqk55W3YKqwuycl3ky3Dh8h8cZaf9p0-Phmeo7H747N-Z-BOzRZe
    Gfg8w-AnkWaa31nA1g>
X-ME-Received: <xmr:bSqRZ2sgbHmOHcr6rBvFaWuRsAW3PPZRjBT7lA4lXHQWL7P-qbp3VU3ATlvgd9AAvg2L_66cx5ZI_uITMozOFbyY3Dahkjmd2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfi
    grlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghv
    rdhplhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bSqRZ7ZbsclSQ2eIf05ut3OC4xrZy_qyBXPGr2BQw7x2-MCx5GspvQ>
    <xmx:bSqRZ9ZU9dSyo85FQPVCRHDiKp-6hO83C0qzTf6uKAgKRNJtkmtntA>
    <xmx:bSqRZ3D_22DfdJ-hAaG_eOUcqOWaMck8zVmpr-GuvTVzh6z4geFs_Q>
    <xmx:bSqRZzb0B_OF3GNWGd7huAF6_6B74lgIg5LFUEDv_-xy5bG_l5Js3g>
    <xmx:bSqRZwzf3Y43JhsUBXvJjCbrfdklHTMhHpEeLRgnl2_TKAZF8kG8xOe5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 12:27:09 -0500 (EST)
Date: Wed, 22 Jan 2025 18:27:07 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
Message-ID: <20250122172707.GH3436806@ragnatech.se>
References: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>

Hi Geert,

On 2025-01-21 15:49:59 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Jan 21, 2025 at 2:59 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Use raw_spinlock in order to fix spurious messages about invalid context
> > when spinlock debugging is enabled. The lock is only used to serialize
> > register access.
> >
> >     [    4.239592] =============================
> >     [    4.239595] [ BUG: Invalid wait context ]
> 
> [...]
> 
> >     [    4.426274]  lock_acquire+0x1c4/0x33c
> >     [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
> >     [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
> >     [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> This indeed gets rid of the annoying messages on various R-Car boards.
> Unfortunately  I now start seeing other scary messages during resume
> from s2idle/s2ram.

I think this might be symtom of issues in those drivers too. As Claudiu 
points out the issue in RAVB was discussed and fixed by patch [1].

With this and patch and [1] applied I no longer see a splat when 
resuming on M3N using WoL.

I still think this patch is correct, but of course the bug on Marzen 
should be fixed, but that is unrelated to this patch. Would you agree?

1.[PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path

> 
> On marzen (R-Car H1):
> 
>         =============================
>         [ BUG: Invalid wait context ]
>         6.13.0-marzen-08235-gb3d2b6c82b8c #193 Not tainted
>         -----------------------------
>         swapper/0/0 is trying to lock:
>         c2d3c994 (&dev->event_lock){..-.}-{3:3}, at: input_event+0x38/0x60
>         other info that might help us debug this:
>         context-{2:2}
>         no locks held by swapper/0/0.
>         stack backtrace:
>         CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.13.0-marzen-08235-gb3d2b6c82b8c #193
>         Hardware name: Generic R8A7779 (Flattened Device Tree)
>         Call trace:
>          unwind_backtrace from show_stack+0x10/0x14
>          show_stack from dump_stack_lvl+0x7c/0xb0
>          dump_stack_lvl from __lock_acquire+0x38c/0x1698
>          __lock_acquire from lock_acquire+0x29c/0x338
>          lock_acquire from _raw_spin_lock_irqsave+0x50/0x64
>          _raw_spin_lock_irqsave from input_event+0x38/0x60
>          input_event from gpio_keys_irq_timer+0x30/0x50
>          gpio_keys_irq_timer from __hrtimer_run_queues+0x208/0x370
>          __hrtimer_run_queues from hrtimer_interrupt+0xbc/0x1f8
>          hrtimer_interrupt from twd_handler+0x30/0x3c
>          twd_handler from handle_percpu_devid_irq+0x58/0xfc
>          handle_percpu_devid_irq from handle_irq_desc+0x68/0x80
>          handle_irq_desc from gic_handle_irq+0x74/0x84
>          gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
>          generic_handle_arch_irq from __irq_svc+0x8c/0xb8
>         Exception stack(0xc0e01f30 to 0xc0e01f78)
>         1f20:                                     ffffffff 00000001
> 2b229000 00000001
>         1f40: c0e0be40 c0173ae0 c0e09090 c0e0be40 c0e09054 c0e09090
> ffffffff 00000000
>         1f60: 00000000 c0e01f80 c08d13b8 c08d13c0 200f0013 ffffffff
>          __irq_svc from cpu_idle_poll+0xc4/0x130
>          cpu_idle_poll from do_idle+0xb0/0x288
>          do_idle from cpu_startup_entry+0x28/0x2c
>          cpu_startup_entry from rest_init+0x150/0x178
>          rest_init from start_kernel+0x544/0x5d8
> 
> On Salvator-X(S) (R-Car Gen3) and Gray/White Hawk (R-Car Gen4):
> 
>         =============================
>         WARNING: suspicious RCU usage
>         6.13.0-rcar3-08235-gb3d2b6c82b8c #174 Tainted: G        W
>         -----------------------------
>         drivers/net/phy/phy_device.c:1970 suspicious
> rcu_dereference_protected() usage!
> 
>         other info that might help us debug this:
> 
>         rcu_scheduler_active = 2, debug_locks = 1
>         5 locks held by s2idle/1070:
>          #0: ffffff84c6c173f0 (sb_writers#5){.+.+}-{0:0}, at:
> file_start_write.isra.0+0x24/0x30
>          #1: ffffff84cdbf3888 (&of->mutex#2){+.+.}-{4:4}, at:
> kernfs_fop_write_iter+0xf8/0x180
>          #2: ffffff84c1007168 (kn->active#64){.+.+}-{0:0}, at:
> kernfs_fop_write_iter+0x100/0x180
>          #3: ffffffc0812d51e8 (system_transition_mutex){+.+.}-{4:4},
> at: pm_suspend+0x84/0x248
>          #4: ffffff84c211a8f8 (&dev->mutex){....}-{4:4}, at:
> device_resume+0xb4/0x1c4
> 
>         stack backtrace:
>         CPU: 1 UID: 0 PID: 1070 Comm: s2idle Tainted: G        W
>    6.13.0-rcar3-08235-gb3d2b6c82b8c #174
>         Tainted: [W]=WARN
>         Hardware name: Renesas Salvator-X 2nd version board based on
> r8a77951 (DT)
>         Call trace:
>          show_stack+0x14/0x1c (C)
>          dump_stack_lvl+0x78/0xa8
>          dump_stack+0x14/0x1c
>          lockdep_rcu_suspicious+0x138/0x184
>          phy_detach+0xc0/0x188
>          phy_disconnect+0x44/0x50
>          ravb_close+0x7c/0x1b8
>          ravb_resume+0xb0/0x130
>          dpm_run_callback+0x5c/0xc8
>          device_resume+0xf0/0x1c4
>          dpm_resume+0x150/0x168
>          dpm_resume_end+0x14/0x28
>          suspend_devices_and_enter+0x150/0x59c
>          pm_suspend+0x214/0x248
>          state_store+0xa8/0xe8
>          kobj_attr_store+0x14/0x24
>          sysfs_kf_write+0x48/0x60
>          kernfs_fop_write_iter+0x138/0x180
>          vfs_write+0x148/0x1b4
>          ksys_write+0x78/0xe0
>          __arm64_sys_write+0x14/0x1c
>          invoke_syscall+0x68/0xf0
>          el0_svc_common.constprop.0+0xb0/0xcc
>          do_el0_svc+0x18/0x20
>          el0_svc+0x38/0x90
>          el0t_64_sync_handler+0x80/0x130
>          el0t_64_sync+0x158/0x15c
> 
> Probably they were just masked by the other issue before?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

