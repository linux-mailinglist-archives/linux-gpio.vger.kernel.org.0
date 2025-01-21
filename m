Return-Path: <linux-gpio+bounces-14978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940FA1806B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 15:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36E2188200F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E520E1F3FEC;
	Tue, 21 Jan 2025 14:50:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4161F3FE0;
	Tue, 21 Jan 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471015; cv=none; b=UAU30rMogfoHhzkT0KLP+cIWf4OuhPoM+zz6y5MRH8dzUgfo8LqIZC2bIChcQdpCVCze80+xyggEA1Tx2sBhbAgRIxhvjMwX14sco8krz5bzbVAjTiI9XJfXWx2l5g9VruObvnSYkTKdYUtvTRx8l+axRMCGxaf7VsmiIzGoLYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471015; c=relaxed/simple;
	bh=bxb1+xM4frrWND8Hdkqz51jKPnsQCJfbRT1slNdKK/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqSpDwshhT22MHgasrQEGxnIRU4VB3o1SBLCzhhZBuxeegQZkSuCEl6VWzes0CRvIUlcJ+xsVVtr2fW2QJu+46CqEp2K+ApVnK44aa48qiJeqjnE9vcrJomhX9JCdwWENlon7RKNBpsox3mp1Ej+b2u9euyd+05CFhYq65wk758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5174d53437eso3271357e0c.2;
        Tue, 21 Jan 2025 06:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737471012; x=1738075812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmrncH7xyBBmhsuiu3vJdcpYQW1BPeC/gvGfgsMWPHo=;
        b=beYag4KkBczmmz66m7RTceP3moVb9f9tyiE1xBBCGrrRC+/bc3km+Dz/3MoGCxFC/3
         usGTzRojjyghzf9C9mjU1EhnNa+qRjWwSXZxDpezAzCJXObT8Gtl1X8g23UtiRZVPpzN
         FG7zohxixQouONZCMPVJtIQdAT+y/SdLEMmcybwEqfM9sp5KIx2S8wgxd/3UgfGrUHtu
         ObhKp8jfDPP46ErCmFJ6lTkwMKcGV91Phy5nAN2VdwBy61q9kCvGA4puB3LyjGjF2mab
         87Sa9CKo9XrHMR4pLMY6rGxOI8Ok4XnnSQfiYN538vUeuTnX01QM1cppKAhBPHnmdqWl
         VpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQzCbRAA/Elw2igHuGIin6tv20e0WnL1sDpikbunq8M1E/brsSNBHDcuidz9kWwnB3PF8lHOZkfWdLYYXSAG/74YQ=@vger.kernel.org, AJvYcCXY3Lq1C/09FtbMsHcZJIBOHVeV4bGyUWymAx3ozFO3Dql97aikop0bLoL5ST5RnoFZdpynrLBDtVzq@vger.kernel.org
X-Gm-Message-State: AOJu0YwM44uOZLEi/FrcbBIkXFB1A4MGvHlGjZPV7/H2wwjlr94QIybf
	fvDCReyu1VNOxR6WfIiQX80QpG3qan+WjYW+VGWFgmNmgnunwT6wnTHfdaSn
X-Gm-Gg: ASbGncuX89eBoRT4BvNTuxvFF/BOhur9bPHXZJszfrhGWUOJNA1u2Q/omfRS/F+OUBe
	XC4irJyVHiB9w6uqhcXWqUwoF7j+2Gek4cn8Y+NZoTsdqcVd/wwPM64Gn8lI8geFXG68NT2f0QS
	LCwQ1752/ylD8zwdRxwT9dKKT4m/fNMg/jkMMaQ1ByVvsVXsDQw8yg665cja48C/jnG97B+8bOr
	E60p2JEVMufwT2Vee8kZ0KqfmzvPbSJLuj7rBKh8Fp7f2muFIRYV9lSPVNYfDEaypZ4BPtaH/Ig
	/iR0KJTi0T4Fy3pWGBSfOYna1oE4TLEz
X-Google-Smtp-Source: AGHT+IGGsjPzALNGGYFa7e4s3JgR37I3OGrHpH7djd77AQrwLfEBrs1IFLGgAJpXYETnQcMDmEMkBQ==
X-Received: by 2002:a05:6122:8c3:b0:518:89d9:dd99 with SMTP id 71dfb90a1353d-51d5a126876mr14279184e0c.3.1737471011664;
        Tue, 21 Jan 2025 06:50:11 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf571bc18sm1759915e0c.48.2025.01.21.06.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:50:11 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afeccfeda2so3109489137.1;
        Tue, 21 Jan 2025 06:50:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJhiUfpC7qNRUPzWoYFy82/IKEYCYb/nsYVDkxfhTPqLKLL/13+RmLnxDi1lRtvyLBHHLPnixGfE3AJrTlm/HF3AA=@vger.kernel.org, AJvYcCWVBC8yznVCnW2VWpjD7r1+ikuKFiXVODgjvP1G8A5e/fzNKqyd6+pS4Fq0QDHRCRByJwTZBeY2DNx3@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:4b6:1a64:1c95 with SMTP id
 ada2fe7eead31-4b690cf1487mr13629581137.22.1737471011118; Tue, 21 Jan 2025
 06:50:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 15:49:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>
X-Gm-Features: AbW1kvbs4WGeZKPNPU4w1RTC_GiNqNfBnwHY313Bt4wAqmDxAavoybENCxCX__M
Message-ID: <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Jan 21, 2025 at 2:59=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Use raw_spinlock in order to fix spurious messages about invalid context
> when spinlock debugging is enabled. The lock is only used to serialize
> register access.
>
>     [    4.239592] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     [    4.239595] [ BUG: Invalid wait context ]

[...]

>     [    4.426274]  lock_acquire+0x1c4/0x33c
>     [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
>     [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
>     [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!
This indeed gets rid of the annoying messages on various R-Car boards.
Unfortunately  I now start seeing other scary messages during resume
from s2idle/s2ram.

On marzen (R-Car H1):

        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
        [ BUG: Invalid wait context ]
        6.13.0-marzen-08235-gb3d2b6c82b8c #193 Not tainted
        -----------------------------
        swapper/0/0 is trying to lock:
        c2d3c994 (&dev->event_lock){..-.}-{3:3}, at: input_event+0x38/0x60
        other info that might help us debug this:
        context-{2:2}
        no locks held by swapper/0/0.
        stack backtrace:
        CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.13.0-marzen-08235-gb3d2b6c82b8c #193
        Hardware name: Generic R8A7779 (Flattened Device Tree)
        Call trace:
         unwind_backtrace from show_stack+0x10/0x14
         show_stack from dump_stack_lvl+0x7c/0xb0
         dump_stack_lvl from __lock_acquire+0x38c/0x1698
         __lock_acquire from lock_acquire+0x29c/0x338
         lock_acquire from _raw_spin_lock_irqsave+0x50/0x64
         _raw_spin_lock_irqsave from input_event+0x38/0x60
         input_event from gpio_keys_irq_timer+0x30/0x50
         gpio_keys_irq_timer from __hrtimer_run_queues+0x208/0x370
         __hrtimer_run_queues from hrtimer_interrupt+0xbc/0x1f8
         hrtimer_interrupt from twd_handler+0x30/0x3c
         twd_handler from handle_percpu_devid_irq+0x58/0xfc
         handle_percpu_devid_irq from handle_irq_desc+0x68/0x80
         handle_irq_desc from gic_handle_irq+0x74/0x84
         gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
         generic_handle_arch_irq from __irq_svc+0x8c/0xb8
        Exception stack(0xc0e01f30 to 0xc0e01f78)
        1f20:                                     ffffffff 00000001
2b229000 00000001
        1f40: c0e0be40 c0173ae0 c0e09090 c0e0be40 c0e09054 c0e09090
ffffffff 00000000
        1f60: 00000000 c0e01f80 c08d13b8 c08d13c0 200f0013 ffffffff
         __irq_svc from cpu_idle_poll+0xc4/0x130
         cpu_idle_poll from do_idle+0xb0/0x288
         do_idle from cpu_startup_entry+0x28/0x2c
         cpu_startup_entry from rest_init+0x150/0x178
         rest_init from start_kernel+0x544/0x5d8

On Salvator-X(S) (R-Car Gen3) and Gray/White Hawk (R-Car Gen4):

        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
        WARNING: suspicious RCU usage
        6.13.0-rcar3-08235-gb3d2b6c82b8c #174 Tainted: G        W
        -----------------------------
        drivers/net/phy/phy_device.c:1970 suspicious
rcu_dereference_protected() usage!

        other info that might help us debug this:

        rcu_scheduler_active =3D 2, debug_locks =3D 1
        5 locks held by s2idle/1070:
         #0: ffffff84c6c173f0 (sb_writers#5){.+.+}-{0:0}, at:
file_start_write.isra.0+0x24/0x30
         #1: ffffff84cdbf3888 (&of->mutex#2){+.+.}-{4:4}, at:
kernfs_fop_write_iter+0xf8/0x180
         #2: ffffff84c1007168 (kn->active#64){.+.+}-{0:0}, at:
kernfs_fop_write_iter+0x100/0x180
         #3: ffffffc0812d51e8 (system_transition_mutex){+.+.}-{4:4},
at: pm_suspend+0x84/0x248
         #4: ffffff84c211a8f8 (&dev->mutex){....}-{4:4}, at:
device_resume+0xb4/0x1c4

        stack backtrace:
        CPU: 1 UID: 0 PID: 1070 Comm: s2idle Tainted: G        W
   6.13.0-rcar3-08235-gb3d2b6c82b8c #174
        Tainted: [W]=3DWARN
        Hardware name: Renesas Salvator-X 2nd version board based on
r8a77951 (DT)
        Call trace:
         show_stack+0x14/0x1c (C)
         dump_stack_lvl+0x78/0xa8
         dump_stack+0x14/0x1c
         lockdep_rcu_suspicious+0x138/0x184
         phy_detach+0xc0/0x188
         phy_disconnect+0x44/0x50
         ravb_close+0x7c/0x1b8
         ravb_resume+0xb0/0x130
         dpm_run_callback+0x5c/0xc8
         device_resume+0xf0/0x1c4
         dpm_resume+0x150/0x168
         dpm_resume_end+0x14/0x28
         suspend_devices_and_enter+0x150/0x59c
         pm_suspend+0x214/0x248
         state_store+0xa8/0xe8
         kobj_attr_store+0x14/0x24
         sysfs_kf_write+0x48/0x60
         kernfs_fop_write_iter+0x138/0x180
         vfs_write+0x148/0x1b4
         ksys_write+0x78/0xe0
         __arm64_sys_write+0x14/0x1c
         invoke_syscall+0x68/0xf0
         el0_svc_common.constprop.0+0xb0/0xcc
         do_el0_svc+0x18/0x20
         el0_svc+0x38/0x90
         el0t_64_sync_handler+0x80/0x130
         el0t_64_sync+0x158/0x15c

Probably they were just masked by the other issue before?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

