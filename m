Return-Path: <linux-gpio+bounces-16547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A60A43B26
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21DF618861DB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 10:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1C826560F;
	Tue, 25 Feb 2025 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A1HOp6NQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA6264A93
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478653; cv=none; b=QbY9IVoJe+WYDkUHwT/fHNOqF/zIjVSwocf3PkQWhrTnL8Ae7AwJMh0tXKVd02FQ6WiXq84UjS0dVAMFFlKKlmR72J9L0we3ohPeoYlmJyG+7en1EcG+oKaU7W6jfc5XSBMLXMnN7W3KgO7d43zWq0AOQFBY3NIX7b4B+B+SLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478653; c=relaxed/simple;
	bh=9JypA27TehyhNnLMd3tV3HE5FM8av4C0pGBzyhWj3Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIdQ8ETqUEPsOO4HKo7bR1NGUQDIImeq/gpM/M7DnB4xFghEUuRxijJ0Ql2QCplbrY4tbyIoImWw9cnsy0wXm4LcCHWAbB7vNLrhlQShlldEhEpKZkiN+LNyAWCGRJXYGBLsEbKPEKUXKLRovqGAJ6CrOp26EB/KrmqTvFjN70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A1HOp6NQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-547bcef2f96so5553840e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740478650; x=1741083450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb5lvNI9nwqdyQVV7wQxTO9RAGSEzcwIqQE1a3fzBug=;
        b=A1HOp6NQ+tQj93p1u36H3TU4w9ef9Q/3OLNb5TGiYInItxIvgxqPoc9hkuoJKNB11x
         YJdXxdvs61CQuHTaeLG3xqL8jnzIKy259mkDq6D7Qu7XnUT6kVZLPlcZeq+A/nIV6q2K
         8gxRw+D91IOZQqEgrc1B9tKHmV5PlGzcQjXUYEYLBVuYGvt9Hi9+aY4mBTxQhQDoTsKA
         +Nl2qTIVvyr5RSZCIGzkKzrT7X/VclMFqWTxGzAKd+xKICc6YNpHPXxZQG60RHPEfzr6
         3CvwpCN5mVWBYaN+jsvHCuKpXUZknNkJT1GLOf8wUCggcWS+gkqz7dW/fiqgwcdQk7mK
         P+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478650; x=1741083450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb5lvNI9nwqdyQVV7wQxTO9RAGSEzcwIqQE1a3fzBug=;
        b=AasxpNdPiIZaSBRlJ//Tz7DLeAV2Bf3RZiKA/ytzc/c0Ia+bIScVve4hIcMTowPNjD
         jQB23+mHa39MSNgbLCwvVxRMQUuQATMNGe63PqlE8bAzCEL8kcrwfxSgtVQody78okyJ
         OtVsZfvdJ8oYuj2gsO7iXG17lE/2YXFwhqP1fw0Tb++EIZRz8kaW3x8Sdw4sipJE3PsI
         I1nZ93L3e/qFubyAwlVNup5JAyvy4N2O0c651FMGxC8yf/NJuA/UTH/PJlB0cAura0+7
         3E4IRD+bhtsaeDVPF427xeLGiFTPSde5WghJkJztib2AF9QR5ImTVvkjbbwI/TSXP638
         ldnw==
X-Forwarded-Encrypted: i=1; AJvYcCWaDZDGQrZVtrMK4WWfuoXje6ooMSYj9sm+yHE2INgxFU/Ju8vff7K9OGR3B/PyKCSkVs4PAc4SPVLB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5ul+hHOwjV6MdHfNB+bjRvbEYb7f76NwQQWBLrKXkK9/Eig7
	Og0YIowFclmzNNktpVo/MLvsgNbkV5cKep7Q0fqwn86wrbAROPfefHHMANHAWQLORZpOo8UMuRM
	flGRrvbcqXHC3uMpjAR/7HJvJ+NvdrNPmlkwMmg==
X-Gm-Gg: ASbGncskEQWifid36vffz416fpOuIvMkx2oQxwZYsZI4++p47AGqHMDUWyiatpwL65h
	OCJcR3RaU//Syo4iQhTfqT5v9iu+JAhRCrQupLu/TzFlEhO4Y0y9ri25eRyzWVYBABiDMZOH0j7
	lItEMH93FKHA4KO5O04LmY65DHozzEtDvNg5ljSQk=
X-Google-Smtp-Source: AGHT+IEheppCIyXYaxYOWXs1/bL0/h9t1952vKaw34xpYwqr0ZLKg9S/QpZ4hnyzJH/e/VkT/KXsOV5RjoNaApF1Jd8=
X-Received: by 2002:a05:6512:1287:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-54838ee814emr6667486e87.13.1740478649507; Tue, 25 Feb 2025
 02:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <CGME20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b@eucas1p1.samsung.com>
 <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org> <81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com>
In-Reply-To: <81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 11:17:17 +0100
X-Gm-Features: AWEUYZlYypd3A5YHTrHSDTFJ9nRYjY4TB9qxaCaH6D0BokD21DTmBozwMQ2yA0o
Message-ID: <CAMRc=Me5X72YW6Ypky0n6FdXxkin_bnW=0jroAJfgHjrETPAkw@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpiolib: sanitize the return value of gpio_chip::get_direction()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:13=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 10.02.2025 11:52, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As per the API contract, the get_direction() callback can only
> > return 0, 1 or a negative error number. Add a wrapper around the callba=
ck
> > calls that filters out anything else.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This patch landed in today's linux-next as commit e623c4303ed11
> ("gpiolib: sanitize the return value of gpio_chip::get_direction()"). It
> introduced a lockdep warning from the gpiochip_get_direction() function.
> IMHO it looks that gpiochip_add_data_with_key() lacks proper srcu
> locking/annotation for the newly created gpio chip. Here is the log:
>
> gpio gpiochip1: Static allocation of GPIO base is deprecated, use
> dynamic allocation.
> ------------[ cut here ]------------
> WARNING: CPU: 2 PID: 35 at drivers/gpio/gpiolib.c:349
> gpiochip_get_direction+0x48/0x66
> Modules linked in: cdns_usb_common roles cdns3_starfive
> snd_soc_simple_card snd_soc_simple_card_utils phy_jh7110_dphy_rx
> clk_starfive_jh7110_vout pcie_starfive(+) clk_starfive_jh7110_isp
> jh7110_trng sfctemp dwmac_starfive stmmac_platform
> spi_cadence_quadspi(+) clk_starfive_jh7110_stg stmmac
> clk_starfive_jh7110_aon jh7110_pwmdac pcs_xpcs phy_jh7110_usb spi_pl022
> phy_jh7110_pcie snd_soc_spdif_tx i2c_dev drm
> drm_panel_orientation_quirks backlight dm_mod configfs ip_tables x_tables
> CPU: 2 UID: 0 PID: 35 Comm: kworker/u18:0 Tainted: G W
> 6.14.0-rc4-next-20250225 #1054
> Tainted: [W]=3DWARN
> Hardware name: StarFive VisionFive 2 v1.2A (DT)
> Workqueue: events_unbound deferred_probe_work_func
> epc : gpiochip_get_direction+0x48/0x66
>   ra : gpiochip_get_direction+0x46/0x66
> ...
> [<ffffffff805fc72c>] gpiochip_get_direction+0x48/0x66
> [<ffffffff80603a14>] gpiochip_add_data_with_key+0x74a/0xde2
> [<ffffffff806044e6>] devm_gpiochip_add_data_with_key+0x1e/0x5a
> [<ffffffff805f8738>] jh7110_pinctrl_probe+0x298/0x3aa
> [<ffffffff80731116>] platform_probe+0x4e/0x92
> [<ffffffff8000c366>] really_probe+0x10a/0x2de
> [<ffffffff8000c5e4>] __driver_probe_device.part.0+0xaa/0xe0
> [<ffffffff8072ee34>] driver_probe_device+0x78/0xc4
> [<ffffffff8072eee6>] __device_attach_driver+0x66/0xc6
> [<ffffffff8072d0b0>] bus_for_each_drv+0x5c/0xb0
> [<ffffffff8072f33e>] __device_attach+0x84/0x13c
> [<ffffffff8072f55e>] device_initial_probe+0xe/0x16
> [<ffffffff8072e002>] bus_probe_device+0x88/0x8a
> [<ffffffff8072e516>] deferred_probe_work_func+0xd4/0xee
> [<ffffffff80047b7e>] process_one_work+0x1d0/0x57a
> [<ffffffff8004854e>] worker_thread+0x166/0x2cc
> [<ffffffff80051568>] kthread+0xdc/0x1b4
> [<ffffffff80bcb942>] ret_from_fork+0xe/0x18
> irq event stamp: 17857
> hardirqs last  enabled at (17857): [<ffffffff80bca986>]
> _raw_spin_unlock_irqrestore+0x4c/0x4e
> hardirqs last disabled at (17856): [<ffffffff80bca73c>]
> _raw_spin_lock_irqsave+0x5e/0x64
> softirqs last  enabled at (17322): [<ffffffff80adff1a>]
> inet6_fill_ifla6_attrs+0x3d0/0x420
> softirqs last disabled at (17320): [<ffffffff80adfefe>]
> inet6_fill_ifla6_attrs+0x3b4/0x420
> ---[ end trace 0000000000000000 ]---
>

Thanks for the report. We don't need to hold the SRCU when registering
the chip. I'm now thinking I should revert using
gpiochip_get_direction() in gpiochip_add_data_with_key() to directly
calling the get_direction() callback and not checking its return
value.

Bartosz

