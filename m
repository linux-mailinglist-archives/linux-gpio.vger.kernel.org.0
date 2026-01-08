Return-Path: <linux-gpio+bounces-30266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB4D03560
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 15:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1183C3009D40
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 14:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A84F47DD40;
	Thu,  8 Jan 2026 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB9BTLRk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5E3385AE
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874445; cv=none; b=bHku3Lx3f2LLIpCFra4o43NkMMj8Wh/m2m0p7EWO53jqXPc1dy2KbdM+Mc7UVRwUKZM2dcJXoTHUxQTjkrtd5YBiHYu5Ft/BTCo+ghJxtqYbE8DId8kJ5NEknpUkuzT514jH7LaHUg01RRosluIF4cm6dvArgqcW8u9VKGf5Qlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874445; c=relaxed/simple;
	bh=iwx1szAzl6cEpdnQTryHcZgD/ciN7USE0ZUgs6/uFg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1G15Ilchhwf4phZP9/XRdGpBAFqZ39MkkWYY66xc9mA0RTvzZDWxAfowZlKNYGZG2pLTyfZ/bYAXvN0qU6qIbhyJwy8VmMcylmse3GEuDGiuijKzbWPgQta4uqVUx4nVvnKfb4QUSSzytKk35BrgkJCCMpe1n1osTh8jvGO9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB9BTLRk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so1453666f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 04:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767874435; x=1768479235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoWD4hQ0ag9GMP0DSDSXC2NG6Yvwm8pUXUOCsZZXQkI=;
        b=cB9BTLRkI6ITQ4zM6VrylyfJycXudVUD+kYugwGobuFhuVy1siazYDzLgEoE77Kvkt
         ATeocNNM6yTOXEb31PARPG5ypZ8pk6qC3196dfx7+M2f8JSG4/8hToC7i19MavM7WJyy
         kGq7BWdbkZpY9Y1cM4DpNTtHO0cruwYL0zgWjC3hlkEpnsjm9y2MzbrK+RoLAI/0nKrV
         JvbnHF9NLNIL2iGtKh7haFZCyY11ZexmGGch8nNbCbF3d7xlPuwP6mBObY8F99wGUxXh
         ne5pi87ZkyOBcQAL03Ocuw7sGNbcr4aoWWXOZIjBKzqiZ/sh9y+QxYLL6Jdo1b6XjAmq
         dRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767874435; x=1768479235;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoWD4hQ0ag9GMP0DSDSXC2NG6Yvwm8pUXUOCsZZXQkI=;
        b=P6UpKv8ON1dA4Z7g7QXPSDuU/GZRkar7OyRz3g3k3WgUYps89Iqv7XTxwq61oiSQmj
         OtPhkFZHLoRDyOmNhxVkqL/UZnRZgkTRfJt1Iioy4j77hSVUtD3LBNxuEdw/ast048Xg
         nn+46VBWlgEPyw+gsa9py8pOywGPOGkv7rGu+rsWtVhpH3VS6nCLUdI3DfeP+Gp01cqI
         TIG+Ch2b7+Kk3aPWDw/xGAqZCmBkyZ31z/+m7IhT9JKn1gN8hr/EFjvLUn7Oipwcit6m
         dI7WfnnHJIrifS74Ki30/n/pHyWzXlIN6Bmu5KGZ62XOpZcVE63Es/hdfpTQZuoSH4Ij
         yGOw==
X-Gm-Message-State: AOJu0Yxp3r644rvOX+vuh5P34UcKr/1kJwRzeZuEI7WRf/CK8YXPGtRX
	o5zrgmXYkEaHaBNPjX846WgOzPrdnDlupBRf7Onegh8s+aw7SG7Ym+zd
X-Gm-Gg: AY/fxX5us/fLPd31qQ4/Y/XOZ5CGMszAnYXH9umV5QiHK4TpnwNz6bY4fcCIzXR9iaQ
	JZs3ZFqlYPVJw+s4XQ4BR4RMVgfgk5QNa6q+MuRseQC0N5UlF+4lH7XT+BAzAgSadi1iQN5dHRh
	xubuO/SS8dXZvKN5uFJLzuQFEX4W10zbBzqb7+skqfx9x+Ijo9fS4y2zaEUzxRjjiSBFYojYtzI
	D16sRHsEc3NwfhU7xbDcUuQfA2FXBpftSzZ4Ifc/rkAOHds2UMIkk6qI98N5s4qQ7Pv99bala+O
	z6NFz4cL7MVlDAjsDwQU1L2POnlks6k1Ons6uXQNo7x/z3qmeyTJkh1gm5V8pmwEKk1R92XJ0q3
	XTzBJHNqnV2pVRyhtsYkFlIZU52QvUxPMq50k1XmWa6auJcpbf/w5T7F10DjP+7a8RVOVJOV0L8
	Z7xH76KCDjbxlvs5TuKw==
X-Google-Smtp-Source: AGHT+IHgbmUWFkFB5poTBpkns10gMPuD4BuxnegmsHxoeTvz8qTo8Hmw8XIQVqBdRXpLPAHebYFUPQ==
X-Received: by 2002:a05:6000:2305:b0:431:8bf:f07c with SMTP id ffacd0b85a97d-432c362827bmr7470017f8f.9.1767874435367;
        Thu, 08 Jan 2026 04:13:55 -0800 (PST)
Received: from [192.168.0.100] ([188.27.129.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5feaf8sm16007746f8f.39.2026.01.08.04.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:13:54 -0800 (PST)
Message-ID: <2889f386-65d3-4f89-ac11-aa51e4384ed9@gmail.com>
Date: Thu, 8 Jan 2026 14:13:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:34 AM, Bartosz Golaszewski wrote:
> Here are three more patches fixing issues reported with shared GPIO
> management.
> 

I'm still getting some intermittent failures on today's next (which
contains this series).

This does not seem to happen on every boot, so it might be some race.

[    2.169655] Mem abort info:
[    2.169663]   ESR = 0x0000000096000004
[    2.169670]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.176773] ehci-platform 92040100.usb: irq 64, io mem 0x92040100
[    2.186626]   SET = 0, FnV = 0
[    2.204264] renesas_sdhi_internal_dmac 92090000.mmc: mmc1 base at 
0x0000000092090000, max clock rate 200 MHz
[    2.204308] ehci-platform 92040100.usb: USB 2.0 started, EHCI 1.10
[    2.208714] hub 2-0:1.0: USB hub found
[    2.214345]   EA = 0, S1PTW = 0
[    2.222949] hub 2-0:1.0: 1 port detected
[    2.231502]   FSC = 0x04: level 0 translation fault
[    2.239779] hub 1-0:1.0: USB hub found
[    2.248022] Data abort info:
[    2.256579] hub 1-0:1.0: 1 port detected
[    2.264724]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.487291]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.493148]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.499300] [0000000000000000] user address but active_mm is swapper
[    2.506556] Internal error: Oops: 0000000096000004 [#1]  SMP
[    2.513092] Modules linked in:
[    2.516610] CPU: 3 UID: 0 PID: 48 Comm: kworker/u16:2 Not tainted 
6.19.0-rc4-next-20260108+ #246 PREEMPT
[    2.527564] Hardware name: Renesas RZ/T2H EVK Board based on 
r9a09g077m44 (DT)
[    2.535903] Workqueue: async async_run_entry_fn
[    2.541141] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.549076] pc : gpiod_direction_input_nonotify+0x18/0x22c
[    2.555408] lr : gpiod_configure_flags+0x1c4/0x380
[    2.560835] sp : ffff8000830e38c0
[    2.564530] x29: ffff8000830e38c0 x28: ffff80008243894f x27: 
ffff0001808f6410
[    2.572773] x26: ffff800081e77160 x25: 0000000000000000 x24: 
0000000000000000
[    2.580914] x23: 0000000000000000 x22: ffff800081e77160 x21: 
ffff80008243892f
[    2.589054] x20: 0000000000000000 x19: 0000000000000000 x18: 
000000000000000a
[    2.597101] x17: ffff80007fffffff x16: ffff000180054480 x15: 
0000000000000000
[    2.605345] x14: 0000000000000000 x13: ffff800080ed7600 x12: 
0000000000000000
[    2.613485] x11: 0000000000000000 x10: 00007fff01adbb48 x9 : 
0000000000000005
[    2.621626] x8 : 0101010101010101 x7 : fffffdffc6009b00 x6 : 
051573657480ffff
[    2.629869] x5 : 0000000000000138 x4 : 0000000000000000 x3 : 
0000000000000001
[    2.638113] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
0000000000000000
[    2.646254] Call trace:
[    2.648968]  gpiod_direction_input_nonotify+0x18/0x22c (P)
[    2.655299]  gpiod_configure_flags+0x1c4/0x380
[    2.660428]  gpiod_find_and_request+0x14c/0x524
[    2.665650]  gpiod_get_index+0x58/0x7c
[    2.669874]  devm_gpiod_get_index+0x20/0x90
[    2.674695]  mmc_gpiod_request_ro+0x30/0xb0
[    2.679525]  mmc_of_parse+0x100/0x688
[    2.683749]  tmio_mmc_host_alloc+0x80/0x110
[    2.688571]  renesas_sdhi_probe+0x150/0x760
[    2.693392]  renesas_sdhi_internal_dmac_probe+0x64/0x80
[    2.699357]  platform_probe+0x5c/0xa4
[    2.703581]  really_probe+0xbc/0x2ac
[    2.707703]  __driver_probe_device+0x78/0x118
[    2.712728]  driver_probe_device+0x3c/0x178
[    2.717550]  __device_attach_driver+0xb8/0x140
[    2.722678]  bus_for_each_drv+0x88/0xe8
[    2.727099]  __device_attach_async_helper+0xb0/0xd4
[    2.732526]  async_run_entry_fn+0x34/0xe0
[    2.737048]  process_one_work+0x150/0x290
[    2.741673]  worker_thread+0x18c/0x300
[    2.745915]  kthread+0x118/0x124
[    2.749635]  ret_from_fork+0x10/0x20
[    2.753762] Code: 910003fd a90153f3 aa0003f4 a9025bf5 (f9400013)
[    2.760790] ---[ end trace 0000000000000000 ]---

After running ./scripts/decode_stacktrace.sh

[    2.169655] Mem abort info:
[    2.169663]   ESR = 0x0000000096000004
[    2.169670]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.176773] ehci-platform 92040100.usb: irq 64, io mem 0x92040100
[    2.186626]   SET = 0, FnV = 0
[    2.204264] renesas_sdhi_internal_dmac 92090000.mmc: mmc1 base at 
0x0000000092090000, max clock rate 200 MHz
[    2.204308] ehci-platform 92040100.usb: USB 2.0 started, EHCI 1.10
[    2.208714] hub 2-0:1.0: USB hub found
[    2.214345]   EA = 0, S1PTW = 0
[    2.222949] hub 2-0:1.0: 1 port detected
[    2.231502]   FSC = 0x04: level 0 translation fault
[    2.239779] hub 1-0:1.0: USB hub found
[    2.248022] Data abort info:
[    2.256579] hub 1-0:1.0: 1 port detected
[    2.264724]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.487291]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.493148]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.499300] [0000000000000000] user address but active_mm is swapper
[    2.506556] Internal error: Oops: 0000000096000004 [#1]  SMP
[    2.513092] Modules linked in:
[    2.527564] Hardware name: Renesas RZ/T2H EVK Board based on 
r9a09g077m44 (DT)
[    2.535903] Workqueue: async async_run_entry_fn
[    2.541141] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.549076] pc : gpiod_direction_input_nonotify 
(drivers/gpio/gpiolib.h:231 (discriminator 1) 
drivers/gpio/gpiolib.c:2863 (discriminator 1))
[    2.555408] lr : gpiod_configure_flags (drivers/gpio/gpiolib.c:4956)
[    2.560835] sp : ffff8000830e38c0
[    2.564530] x29: ffff8000830e38c0 x28: ffff80008243894f x27: 
ffff0001808f6410
[    2.572773] x26: ffff800081e77160 x25: 0000000000000000 x24: 
0000000000000000
[    2.580914] x23: 0000000000000000 x22: ffff800081e77160 x21: 
ffff80008243892f
[    2.589054] x20: 0000000000000000 x19: 0000000000000000 x18: 
000000000000000a
[    2.597101] x17: ffff80007fffffff x16: ffff000180054480 x15: 
0000000000000000
[    2.605345] x14: 0000000000000000 x13: ffff800080ed7600 x12: 
0000000000000000
[    2.613485] x11: 0000000000000000 x10: 00007fff01adbb48 x9 : 
0000000000000005
[    2.621626] x8 : 0101010101010101 x7 : fffffdffc6009b00 x6 : 
051573657480ffff
[    2.629869] x5 : 0000000000000138 x4 : 0000000000000000 x3 : 
0000000000000001
[    2.638113] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
0000000000000000
[    2.646254] Call trace:
[    2.648968]  gpiod_direction_input_nonotify 
(drivers/gpio/gpiolib.h:231 (discriminator 1) 
drivers/gpio/gpiolib.c:2863 (discriminator 1)) (P)
[    2.655299]  gpiod_configure_flags (drivers/gpio/gpiolib.c:4956)
[    2.660428]  gpiod_find_and_request (drivers/gpio/gpiolib.c:4774)
[    2.665650]  gpiod_get_index (drivers/gpio/gpiolib.c:4986)
[    2.669874]  devm_gpiod_get_index (drivers/gpio/gpiolib-devres.c:102)
[    2.674695]  mmc_gpiod_request_ro (drivers/mmc/core/slot-gpio.c:255)
[    2.679525]  mmc_of_parse (drivers/mmc/core/host.c:348)
[    2.683749]  tmio_mmc_host_alloc (drivers/mmc/host/tmio_mmc_core.c:1149)
[    2.688571]  renesas_sdhi_probe 
(drivers/mmc/host/renesas_sdhi_core.c:1119)
[    2.693392]  renesas_sdhi_internal_dmac_probe 
(drivers/mmc/host/renesas_sdhi_internal_dmac.c:599)
[    2.699357]  platform_probe (drivers/base/platform.c:1449 
(discriminator 1))
[    2.703581]  really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659)
[    2.707703]  __driver_probe_device (drivers/base/dd.c:801)
[    2.712728]  driver_probe_device (drivers/base/dd.c:831)
[    2.717550]  __device_attach_driver (drivers/base/dd.c:960)
[    2.722678]  bus_for_each_drv (drivers/base/bus.c:500)
[    2.727099]  __device_attach_async_helper 
(include/linux/pm_runtime.h:447 drivers/base/dd.c:991)
[    2.732526]  async_run_entry_fn (kernel/async.c:136 (discriminator 3))
[    2.737048]  process_one_work (kernel/workqueue.c:3290 (discriminator 1))
[    2.741673]  worker_thread (kernel/workqueue.c:3356 (discriminator 2) 
kernel/workqueue.c:3443 (discriminator 2))
[    2.745915]  kthread (kernel/kthread.c:467)
[    2.749635]  ret_from_fork (arch/arm64/kernel/entry.S:861)
[    2.753762] Code: 910003fd a90153f3 aa0003f4 a9025bf5 (f9400013)

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix mutex deadlock
> - Fix lockdep false-positives
> - Add a patch reducing the number of memory allocations
> - Link to v1: https://lore.kernel.org/r/20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (3):
>        gpio: shared: assign the correct firmware node for reset-gpio use-case
>        gpio: shared: fix a race condition
>        gpio: shared: don't allocate the lookup table until we really need it
> 
>   drivers/gpio/gpiolib-shared.c | 34 ++++++++++++++++------------------
>   1 file changed, 16 insertions(+), 18 deletions(-)
> ---
> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25
> 
> Best regards,


