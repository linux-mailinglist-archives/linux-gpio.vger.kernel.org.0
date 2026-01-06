Return-Path: <linux-gpio+bounces-30182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA1CF7606
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7061D30424AB
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ECD30ACE8;
	Tue,  6 Jan 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Xjcgm1uZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367C1BBBE5
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689872; cv=none; b=RoP/a1X6keKuVR7/a45xJtTUjQBsmxFUkidyGcL+3cb7GTwRxBsgY0DKbXTkJfbG3eXg5SBG1T5OrWWKJAvkxh6C8qNxXxs3mbWZtQ01oSajb4eA7/Fp2Su/49WkZHMlI9PIs+bOfj6M0mRYqhuSvZq4Y0/e/ZV4mt9mziDYOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689872; c=relaxed/simple;
	bh=cbSUjLlW/Y4BDt71FGIS9VUfKEh99zsDpKuBMFMzi68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax5x+ceQmHOsXiysnz7J9+25Lovy+51YuGw6KurSYraUra4Xf/yRe8c8DqqmwMecEN4MQ6RKFo2fNeZv2ovP+CCfMvWUnaSOReeIYbZia9vFgP0a4VUB2r1kMzTc1/1Km51plAH61t8TzK8in5KeZtw0E3xugsFiqnn9+jksvSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Xjcgm1uZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bb2f093aso7748505ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767689870; x=1768294670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=Xjcgm1uZgXzzLepefzsxKhNruNq0GSxTkkfx46kQBYgkMoJEOrPdcDtFOWHN5dw0ka
         ozfZ7zJJsvP9Su/SYeBw2jRnep51dqBKkJcXia3sWZlXq+lYHUpaF4TNJ8ErZO7HGRDZ
         00E+RNVzi27Etxt1PUyx8OLtqKl/RyQ5RgTKf84GNDvdqlrWwN4YlvlpIScUFjNRQx88
         UayEVQkqOZeyOmZTCeSl9Mee0YnCWgUiaem85TYp4El/OwLtvxZPZaS6LOA0OFNg/w9S
         IvtgC3fHtqtREtyguXrqudS8O11/F+fFIBo75YreYMHP3sl7hYkxgWXshnBSRc9jjSTe
         AFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689870; x=1768294670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=OCyeBhSgu7/PzMPKno+xRxWA54EnsFAzQ7Ge4J1GzHPLZUNrIxxuRqc8oNt8+1DrTp
         GMQUM2gxZgTRlj0h4GSN5JMRGrSxnP7O/5sphV+ZEHopztDyQu8hcvVAKQMGZ/60zBoY
         DhUlVgiV5x0zjYVrrSBe5Z//ovLgNFlkOtfzJs3NPlU8n1sfAsNcPemOdmM/IbMMB3Te
         NFGRw87mlQb0VF5Tud1f4Ooil9qN20AyFHmEa5Db728faMkVLaiukXRiCeRgso6j3DjY
         0I+RG97wvcLsb/zQxg6lB2mAJfFxY/9qciL7LD8YYuNWjLWN7gQQyrjDdy5/s2+lflCS
         lSMw==
X-Forwarded-Encrypted: i=1; AJvYcCW6VsBQb+qmser/v3pAPc39yJ6BYZVzTbgSXD4GiJA041GttIfE/CtCM6C7bFgVO5bfKGoZKNqAAoiA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TrNciIK08JIuffBqCQX0OqnzaHCzK5PBjbrhvzr5vzJZdCc1
	9ZBxamzKlr33WQ7CxRGw1xe8dh2wWnjGVdeL3eazojt7sZ0Zh07FZBm5qPHBWjD0E80yVtqPZHM
	o/s/VIX72ZjEgovrJbAIXl8GyRdKQ8HI=
X-Gm-Gg: AY/fxX6fNqYSaantA6a9jIgm8l5CjsOh/TIrF2W047P/6BWXEmi78B+QnG7lg3G4n7b
	oxGxk2T29ch4D3VTa9RsTys74v1kdodPvI4NscHcFsYgDdIKeIgP5xZ6WcVhaJXLPH3kfrHEkuy
	2lQAd7Hg3OC7AZQfAQj+N6lLwsoe7/656O8yOCcp31tHcj0ESm96dK8/bYz5+bvtJLIlPZ35kDg
	CKhYQ7m3Vx3Gt6+jwmTC7t9mO0TUEmmbS0IbvpeeAdQtCLHglBvj/uubwNuojtVKj5W77UqGv2e
	fTc5/Vzo1y6vtuQaVsPihgN7rXM=
X-Google-Smtp-Source: AGHT+IHqqVT35RqtKhqDVDeUn1JSuMEyVNYWSpbNfyaLVeAjnwJc+ZCsnwel1Ct5vYHiZKJmXURlUF7dYeogNEgy608=
X-Received: by 2002:a17:903:1aab:b0:2a0:89b8:4686 with SMTP id
 d9443c01a7336-2a3e2d1987bmr23189115ad.46.1767689870271; Tue, 06 Jan 2026
 00:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 09:57:39 +0100
X-Gm-Features: AQt7F2ogEhOYqvAtPAq6OIcx9b6m5SyZMl6Xih8xD56bOOTG1yFuzVoJm_ASy1o
Message-ID: <CAFBinCDfV-f98c+3EXWVqFkBidsm_OZmfBZOqh7F5wWR4w88tA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

