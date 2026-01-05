Return-Path: <linux-gpio+bounces-30145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4031CF38CD
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 13:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86C873003486
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 12:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD66433BBBA;
	Mon,  5 Jan 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1zG3mNW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F5733BBB1
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616150; cv=none; b=N1s9JoSAXViC7XYU3jHV9FETBuLqf4lpw/RF9gTgY6Oomc4Autsdab+zkTQGenVUK00MkOypZO5pyeFRcCR/fcmPllAkvso6j6BkfvUylAynbkuqt/rNQsmPKtgUFnQW9Aq5zg2EqZMx52MpPVDFfRBgAYWNoomic9dPx6EOcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616150; c=relaxed/simple;
	bh=nxmHYWwtN3uLmIIytU1tUfALtqCUsTVc6kcMeVqTOaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrJQnGKzFxv7912Ovjhay0zIG6+52cp9FqRuF6WRhFlOu9aYFLfKlUWx+FYq86JN4iYtJfJktgLTdO343w9JU2+vOnIQ0MSThkvuAAL5UgCe12u5ccTt03rEB1gkQ1bPE17pV2z2DV9FcF2D+HB2+qy2EOvj6bmqbpxeTD2q10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1zG3mNW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E35C2BC87
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767616148;
	bh=nxmHYWwtN3uLmIIytU1tUfALtqCUsTVc6kcMeVqTOaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S1zG3mNW6v2KnxsHHHcG+9eNS5Duh+CbT7wZAF10ab+D4BdAuee/VqCWfh7LgJoUB
	 tCSqmNCHwAIS2QWIpxmYQBMKo1zluRQo4ofLsgUlOtcVH+Tgg+ejVDlede6/d/lmIu
	 AWoZ4xgKl5VTYS5+ht5s9ICoavRq/J8b3Qn9CAUtioqnCrQBhxgTU8jE01GwzUFlz0
	 VNpEP3LzYW6K53AyFSzz/aqxYmyCjh/oUw2QWbzbTt+kL4Qdz1bOagAgPOUXmkFGUX
	 B7Wt72NdkUfe+GKcMq9FGT8ijq0MhAPu6Gfk+a19//h12X37JCNIOhMWY7baQ2Jv7t
	 yOiW4TGxc9RHw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b96cbd875so115172791fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 04:29:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVBLWOeYTxd2DKZoRMMuOON6Zr07qcEavayUGk/Np8vCfFE5+isw3gYHhPvY/NaVEQ4gbjo3ugaVYa@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIthVnVp1n7xYFQiZrFOdU0D8DC29t8hmFsqwGu5TcJA0VQLt
	uzCFl79x2b7buHG+PejknQP1YZaCef4BHJ132DHfv4fokyj7Rci/RBJQsPPIaetxIxO8CVOMmRC
	SJvOmAHlo5ot34gtEbovdPH0VG0q2/SCMm26NHdJfAQ==
X-Google-Smtp-Source: AGHT+IEUwp+kACB8FpxV4D7zcrYhcFxmEG4t5/7kOQJNW7BDXzhc/i9Vz2slc/3DZ3L71c6VQN0FFrnIKLuUsFcY1AU=
X-Received: by 2002:a05:651c:549:b0:37f:cac3:c27f with SMTP id
 38308e7fff4ca-381216552efmr152802911fa.33.1767616146559; Mon, 05 Jan 2026
 04:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com> <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
In-Reply-To: <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 5 Jan 2026 13:28:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc7dqqpNTb9WSLD7ZZr9dmUTO_rvujJi3LhhjVncjE-8w@mail.gmail.com>
X-Gm-Features: AQt7F2rECuxSzphJBz1znm6-WbhtWgo6XmK_P8nlbaid2AbU0v3TH7rIruOC_F8
Message-ID: <CAMRc=Mc7dqqpNTb9WSLD7ZZr9dmUTO_rvujJi3LhhjVncjE-8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 12:50=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 22.12.2025 11:01, Bartosz Golaszewski wrote:
> > We currently support sharing GPIOs between multiple devices whose drive=
rs
> > use either the GPIOLIB API *OR* the reset control API but not both at
> > the same time.
> >
> > There's an unlikely corner-case where a reset-gpios pin can be shared b=
y
> > one driver using the GPIOLIB API and a second using the reset API. This
> > will currently not work as the reset-gpio consumers are not described i=
n
> > firmware at the time of scanning so the shared GPIO just chooses one of
> > the proxies created for the consumers when the reset-gpio driver perfor=
ms
> > the lookup. This can of course conflict in the case described above.
> >
> > In order to fix it: if we deal with the "reset-gpios" pin that's shared
> > acconding to the firmware node setup, create a proxy for each described
> > consumer as well as another one for the potential reset-gpio device. To
> > that end: rework the matching to take this into account.
> >
> > Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case"=
)
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> This patch landed in linux-next as commit 49416483a953 ("gpio: shared:
> allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my
> tests I found that it breaks booting and triggers warnings on some of my
> test boards. Reverting it on top of next-20260105 fixes those issues.
> Let me know if I can help debugging this issue.
>
>
> Here are relevant logs from my 3 test systems:
>

Thanks for the report.

Nice combo, it looks like these are three separate bugs...

>
> 1. Samsung TM2e - arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>
> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2
> device (lanes:4 bpp:24 mode-flags:0x6e0)
> Unable to handle kernel NULL pointer dereference at virtual address

Could you use faddr2line to point me to the exact offending line? This
would speed up the debugging.

> 0000000000000000
> Mem abort info:
> ...
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in: brcmfmac(+) panel_samsung_s6e3ha2(+) brcmutil
> backlight sha256 snd_soc_hdmi_codec cfg80211 phy_exynos5_usbdrd
> snd_soc_tm2_wm5110 s5p_mfc typec snd_soc_wm5110 hci_uart btqca
> s3fwrn5_i2c snd_soc_wm_adsp btbcm s3fwrn5 cs_dsp snd_soc_i2s nci
> bluetooth snd_soc_arizona arizona_micsupp s5p_jpeg exynos_gsc
> arizona_ldo1 nfc v4l2_mem2mem snd_soc_max98504 snd_soc_idma
> snd_soc_s3c_dma videobuf2_dma_contig max77693_haptic snd_soc_core
> ntc_thermistor ir_spi snd_compress videobuf2_memops ecdh_generic
> panfrost snd_pcm_dmaengine ecc videobuf2_v4l2 drm_shmem_helper videodev
> rfkill snd_pcm pwrseq_core gpu_sched gpio_shared_proxy videobuf2_common
> mc snd_timer snd soundcore ipv6 libsha1
> CPU: 5 UID: 0 PID: 241 Comm: systemd-udevd Not tainted 6.19.0-rc1+
> #16358 PREEMPT
> Hardware name: Samsung TM2E board (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : gpiod_direction_input_nonotify+0x20/0x39c
> lr : gpiod_configure_flags+0x23c/0x480
> ...
> Call trace:
>   gpiod_direction_input_nonotify+0x20/0x39c (P)
>   gpiod_configure_flags+0x23c/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   samsung_dsim_host_attach+0x1c8/0x284
>   mipi_dsi_attach+0x30/0x54
>   s6e3ha2_probe+0x148/0x200 [panel_samsung_s6e3ha2]
>   mipi_dsi_drv_probe+0x20/0x2c
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __driver_attach+0x9c/0x1ac
>   bus_for_each_dev+0x74/0xd0
>   driver_attach+0x24/0x30
>   bus_add_driver+0xe4/0x208
>   driver_register+0x60/0x128
>   mipi_dsi_driver_register_full+0x5c/0x68
>   s6e3ha2_driver_init+0x20/0x1000 [panel_samsung_s6e3ha2]
>   do_one_initcall+0x64/0x308
>   do_init_module+0x58/0x23c
>   load_module+0x1b48/0x1dc4
>   init_module_from_file+0xd4/0xec
>   idempotent_init_module+0x188/0x280
>   __arm64_sys_finit_module+0x68/0xac
>   invoke_syscall+0x48/0x10c
>   el0_svc_common.constprop.0+0xc8/0xe8
>   do_el0_svc+0x20/0x2c
>   el0_svc+0x50/0x2e8
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x198/0x19c
> Code: a90153f3 aa0003f3 a9025bf5 a90363f7 (f9400014)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops: Fatal exception
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x20c000,1061e001,00008000,0400421b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---
>
>
> 2. Raspberrry Pi 3B+ - arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
>

Could you please enable CONFIG_DEBUG_GPIO and post the entire kernel
log somewhere? Looks like there's invalid logic with creating the
proxies somewhere.

> reset_gpio reset.gpio.0: cannot find GPIO chip gpiolib_shared.proxy.4,
> deferring
> ------------[ cut here ]------------
> WARNING: drivers/gpio/gpiolib-shared.c:493 at
> gpio_shared_add_proxy_lookup+0x15c/0x224, CPU#1: kworker/u16:1/40
> Modules linked in: ecc reset_gpio snd gpio_shared_proxy(+)
> raspberrypi_cpufreq(+) raspberrypi_hwmon rfkill soundcore pwrseq_core
> bcm2835_thermal pwm_bcm2835 vchiq i2c_bcm2835 fuse dm_mod ipv6 libsha1
> CPU: 1 UID: 0 PID: 40 Comm: kworker/u16:1 Not tainted
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Hardware name: Raspberry Pi 3 Model B (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : gpio_shared_add_proxy_lookup+0x15c/0x224
> lr : gpio_shared_add_proxy_lookup+0x138/0x224
> ...
> Call trace:
>   gpio_shared_add_proxy_lookup+0x15c/0x224 (P)
>   gpiod_find_and_request+0x200/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get+0x18/0x24
>   reset_gpio_probe+0x4c/0x14c [reset_gpio]
>   auxiliary_bus_probe+0x44/0x90
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>   device_initial_probe+0x50/0x54
>   bus_probe_device+0x38/0xa8
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x208/0x604
>   worker_thread+0x244/0x388
>   kthread+0x140/0x14c
>   ret_from_fork+0x10/0x20
> irq event stamp: 82552
> hardirqs last  enabled at (82551): [<ffff8000813a1d60>]
> __schedule+0xc08/0x1204
> hardirqs last disabled at (82552): [<ffff800081397194>] el1_brk64+0x20/0x=
60
> softirqs last  enabled at (81674): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (81665): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
>
>
> 3. Khadas VIM3 -
> arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
>
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591

Can you post the output of gpiodetect and gpioinfo? I believe this to
be a buggy GPIO driver which says the controller can't sleep but it
then uses sleeping pinctrl interfaces. We had a similar bug uncovered
by this series with qualcomm boards.

> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
> kworker/u25:3
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 46379
> hardirqs last  enabled at (46379): [<ffff8000813acb24>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (46378): [<ffff8000813abf38>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (46330): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (46295): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Tainted: [C]=3DCRAP
> Hardware name: Khadas VIM3 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_set_config+0x40/0xdc
>   gpiochip_generic_config+0x28/0x3c
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_config+0x34/0xfc
>   gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_transitory+0x4c/0xf0
>   gpiod_configure_flags+0xa4/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get+0x18/0x24
>   mmc_pwrseq_emmc_probe+0x40/0xb8
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>

Thanks in advance for the help!

Bart

