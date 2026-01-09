Return-Path: <linux-gpio+bounces-30315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93455D083B6
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 885F0309E32A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4719E333431;
	Fri,  9 Jan 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu7+oOeN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04130332EB8
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951048; cv=none; b=A9Byun3O6n4/wF6AIfNkUg4bpkX2nugQM/qdrXTVu9sBwY2/1iBUDjhRDhRWDXSxaI/AeEFlELRXv3g+uMdGIrj95kHE9nyodtkXKU0ePUdKE1v+mysGdK8a+EfITG4izTbHjdcGXX4eO3qrMw0Sc3M8jC5JjaY9L4qFF49L0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951048; c=relaxed/simple;
	bh=6LNdm3fUgjKNrloN/NydUJPrfwSNFkztsLyEogcqh/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyY9/V3r5yn+wJ60L34IAMZ8yUAJe4oSscEkWjrRZxg8DpQNKsF7QliIWznZuu/JDfvrej9j7KEIN4JlHQSHMbk9yD4YUyoxz8TBRvjxRL56QcgCYTVLuxGeR8rAzvuSXevcC6x118Wy5YRzR6EusPL5c7v3XtcCDWXIq/HPrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu7+oOeN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCF5C2BC86
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951047;
	bh=6LNdm3fUgjKNrloN/NydUJPrfwSNFkztsLyEogcqh/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hu7+oOeN1CG6qA4cqOd65h7eTJRVtcKJ3o8a7JrrBjmyiyeyd8g3/uch0eUalhG/d
	 EMWtRORiXIOoxHNQgaHvM6xf5UirHxHmfnPLE34i54UfeYOG8uD+O72ewmJOhQvrOX
	 Fb+82va25549OQTLb7sFjXJ/XnqKbDc8HRPdT94nLHFFMIUfIelVV1nbyR62IEBdWh
	 F7JvWPg5FoncdSX9Xa5XAbsWXyBDqD525oTOU20B3c6Ij+jiwfWqFVbIgJbGJvYG4t
	 YHSiWA4FzOKY/R+qjWIUt/kKXq1X5sjLS6SkjXfvNy/nFnZ4iDiHVqdcShysGAnU/v
	 IlWna3lwVNzVA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fdb90b670so38795697b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMznbJseoDrsfjONP8C8YfrHSxP9AjxE7xYnvokFvh9nskJx7FqZannC2Ha1g3rQf2QFr4z/bIQkCg@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXiiISbMSlJiuWHQKhvGG9GT/I1WWDR1jQXZC6/IjdIGT4bCg
	aPApYqScKk1tR26B91GSA8Cwoye1nTXU6oqhpGe55gN1DAQbGTJqnySlKGhPl3qcnGp55XMgIX0
	yalN7MHj7XT8CGkPs68WKMg4/HbkynIU=
X-Google-Smtp-Source: AGHT+IHW9AloGVPNneim+o5wu5kst869KHt4MS2BcIEWf1BhFWXSHQH3d/MN0P4Js6T3JHk+sgUFV5uMx0nD8b2J3Z0=
X-Received: by 2002:a05:690c:6c08:b0:788:14a2:8bda with SMTP id
 00721157ae682-790b580708bmr83145167b3.38.1767951047030; Fri, 09 Jan 2026
 01:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:30:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
X-Gm-Features: AZwV_QifJwM8PVt6EB8CPnUaPiq8Laa3KkCYXyF0XiD2OsUIzet-cnQ9j7hifFk
Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
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
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

