Return-Path: <linux-gpio+bounces-30201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037BCF98E8
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 18:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B512300920C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 17:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2A13431E4;
	Tue,  6 Jan 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BTjU7zXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D6340283;
	Tue,  6 Jan 2026 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719437; cv=none; b=Irj+VI4Y5jTMoFtFCZJqO7M+WQXLndBba0JR4LrfKB90eiBeSjR36Z+xve6EAf4z1oNpbJPUVVFEU0oW8l7KNpglMXMC1IOMQ9NAHONOHjB7Uq45oqcY9FqxmM4XmmP7Bdw+l5hpiUqNq5w3yDFiGcfF+v+RnoVnr73Wc5HjvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719437; c=relaxed/simple;
	bh=ufPTmoqMRkm2QhPzvFsZLoO2NqK0iYTByjSK+BV3oxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+/Ckt8S/SUWSaAETMHUqsG1ssEwGKpFyQwFe5ZBb9YHdXReAUNDUpNSHecdS07qMnAo7pt67jI22taAaYFBxB529QPmmZwuJdX7A1HbobFk5xETMhF0ZHaclup0RqFRqUS8rt2gWaaTi95BlIvMc4FediPC545zCpdhVRBjxWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BTjU7zXV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CK1pjOZHgHUmALyetdFeD/XBzJb0zHryAM/HjnpXBsw=; b=BTjU7zXVaPTBCgdfTupnegVh5x
	spGEnvNDYbg3RYXwMnEjdKlxIBwBgicISdzhcMdGRegCutQ11QolnDgo5/ixuQ4nwV2KWBupqViNM
	OhON3+V7CCPPbSJ163hewlWzGY4ZFXMM7bZJLWwEMKQnHdJ6mNduhOHcUgyJ9MJ940JzGVw7+YJ0N
	SO92W8SEAwKgcYZVs4sJgEhLlvSKup4+B2gfit+1A25r34cxWszyBs10z/cZsTvUXZmEnDcOL0eNr
	GX+83mB7fdnB6/g0wjzRyZu4Zvd+HXFYmAsc4eVIxRHlxJFxcJMkM6g0rH8KqP+zb8VWf+40RVjUH
	BPXR7xww==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdAZT-001Gyr-JH; Tue, 06 Jan 2026 18:10:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Tue, 06 Jan 2026 18:10:15 +0100
Message-ID: <6940171.Sb9uPGUboI@phil>
In-Reply-To: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 6. Januar 2026, 10:00:11 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Bartosz Golaszewski:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>=20
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>=20
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
> kworker/u16:0
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> 6 locks held by kworker/u16:0/12:
>   #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
> at: process_one_work+0x18c/0x604
>   #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1b4/0x604
>   #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x38/0x1b0
>   #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
>   #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
>   #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
> irq event stamp: 81450
> hardirqs last  enabled at (81449): [<ffff8000813acba4>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (81450): [<ffff8000813abfb8>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (79616): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> softirqs last disabled at (79614): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
> 6.19.0-rc4-next-20260105+ #11975 PREEMPT
> Hardware name: Hardkernel ODROID-M1 (DT)
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
>   pinctrl_gpio_direction+0x3c/0xe0
>   pinctrl_gpio_direction_output+0x14/0x20
>   rockchip_gpio_direction_output+0xb8/0x19c
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_direction_output+0x34/0xf8
>   gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_configure_flags+0xbc/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   rockchip_pcie_probe+0x98/0x380
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>=20
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



