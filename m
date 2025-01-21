Return-Path: <linux-gpio+bounces-14980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE089A180A5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 16:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A123A3692
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 15:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AD01F37D2;
	Tue, 21 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G8XdpPQf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAB23A9
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471801; cv=none; b=Lzmkmi9qD7st880fC9zDByJdWibGJTJ8zP8KoRG6HL1JvqyRa44ZGqB4bYhCZd5C0aujm9tsL5N0/uQwgoSsxasI2iyqSuuaTkAi23FbDE+wu9rKIAfmUB87aT9wPz/T/VrSf+UQcmnsQ/e4H097ShFb9mr2tZZh7L8E7sPYJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471801; c=relaxed/simple;
	bh=jq604ob8w0dOHVNTJTCxArRMVehbfcG/0AIXj2Sa1ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NP++0vdXe8dAqGN9f1KTs8EHpfGsas9d0eF/+TPH2I/3417IcbBoHX0zXbR9QZntuMK40NA4Qw5LtmizxzFg/Igi29W4fqC1KqSkVun+LpUyXmtAK9lqMj1T/F+iys6Xk7YKN7CiXrlOZQZz9jqeYO13dcOdk7I8mwlwUZVnVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G8XdpPQf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso36897705e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737471796; x=1738076596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFlhz2lSAKRMPZ/TI3hUo0bW5koddfJFMBMqXjwUu8A=;
        b=G8XdpPQftpLkaIVjcxpGJVNr479Ln7KG450H4yjskY5NacN5YT9Eo5d3uMkauCcOIL
         6xtMdt11XAvgKIWhSRtARVLr8y/7NbKTQn7SWOd2cSl05qsfcnG7/oq73V9wAapjfO3U
         hyX3mK82aviw4gXW2liRfvTxRWi4LuHMUxpnHOidNfTyAIN6abu6O2w1EdZiCVWD7fjp
         fAwa3Txa+ba0ZTneJQbJMiAkel5/sTwXkvdxMTpAHsFzUx7AJSdjJPG0dqacFi1Kf+X2
         w9v2NVqpmWQ4clIRSRBztDo+8scV4jAexfH9S3D7RK1uf5oS2StoXLPM5Mz6vvtPejp3
         dccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471796; x=1738076596;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFlhz2lSAKRMPZ/TI3hUo0bW5koddfJFMBMqXjwUu8A=;
        b=wkiVUT8ILUUA+VPkhBRR03bMgh8lo3OZRKpiXZHQV8sWeYmprb2nWm+xO3VXk8DNmZ
         r/U8jr+qS7mvWKEOk/Ea13sQ5mlWsH7aVzVEftLuS27Wd/JJ4TNtG5qdUQHoEQYejztv
         zT3VEE79RPOYaLhM6WID2p2gWwC22BefsPwUvFtqUivt73t+UwOYiuKw8WTBmDnQUDP8
         5xtusny3henijJqdsuaQuvyDsS/RZySTYSm5Xvri92VMwjNy/X8OaAar4P+mTJzXxREC
         r1me/wnjTwzDa76BKOdGnOeDQ5VBHZSDqGxK0TjTQ8Tn5/mSnuQ+wEETFz+nGPMK2K3X
         YyyA==
X-Forwarded-Encrypted: i=1; AJvYcCVF06npWwZ2uydmoAIvPW43CpbS7LDpNrVDwEIe3GbPg5KmHk+3YP+mredamyns4Dx0GMmaudVv6BCf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPiSC9OCqMBk5Tdjwcl2QYMy08hzUh97yxEx92qQcoW5OiC/0c
	XmBsXVo9cbhXR/Nu0/YbK3jkxHNkq55t2gWjXf+iYYpyYBrlir7lILNVc9q0550=
X-Gm-Gg: ASbGncubvu2N0Tw2tr/8RMSun/bzpQLJKwGTe2t5pSVdZNW59NxnzinXFx2etKc8e8u
	ObJXqPJtDtvgb7QEfI6CvBNPAyx+kn+My1zTfxzfrdYaZbj33ACiAXbxiBnRcgMSgVaYPx2FSqr
	Bc86dBlZ9rwp2Gcs7XIoZcQdHYnDonPW+zq92zzNy8rViayGyprQotYzleplkM4GJZIbmp6NmgG
	YfZQ3spDluG6cBRQ3RsD8JvO3wQ7dkdQturTbsKtdS+4yrUPXGs+8f7FMh8IaiGpg8tJ14T94Kb
	kA==
X-Google-Smtp-Source: AGHT+IHnIpZq/0QI3Ep30tuy9eEFfAPVyRTp6BAktN0XZ875SjzNZzTRXQuvtD/o9NGAFj8pOz9C6A==
X-Received: by 2002:a05:600c:348c:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-438918f61acmr151452355e9.11.1737471795839;
        Tue, 21 Jan 2025 07:03:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c475csm244586775e9.20.2025.01.21.07.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:03:15 -0800 (PST)
Message-ID: <193dcebd-3e25-4833-bbca-2023496e1ed5@tuxon.dev>
Date: Tue, 21 Jan 2025 17:03:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert, Niklas,

On 21.01.2025 16:49, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Jan 21, 2025 at 2:59 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> Use raw_spinlock in order to fix spurious messages about invalid context
>> when spinlock debugging is enabled. The lock is only used to serialize
>> register access.
>>
>>     [    4.239592] =============================
>>     [    4.239595] [ BUG: Invalid wait context ]
> 
> [...]
> 
>>     [    4.426274]  lock_acquire+0x1c4/0x33c
>>     [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
>>     [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
>>     [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8
> 
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> This indeed gets rid of the annoying messages on various R-Car boards.
> Unfortunately  I now start seeing other scary messages during resume
> from s2idle/s2ram.
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

The ravb issue is under discussion here:
https://lore.kernel.org/all/20250120141926.1290763-1-kory.maincent@bootlin.com

Thank you,
Claudiu

> 
> Probably they were just masked by the other issue before?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


