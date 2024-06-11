Return-Path: <linux-gpio+bounces-7365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5D903FCA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 17:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F44D1F22375
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 15:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56A91BF53;
	Tue, 11 Jun 2024 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHWSfFmn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8C4BA5E
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118768; cv=none; b=YvgmoO0+oKG/T9CKcR87XwjH6VtSTqFxsWfuo6Xi0fMN96bbdc1uTGZMwsMnLRqL5B/qhRZzmBdeWq5xnaU7F5jIsK18dwMQ+MWZ/BIxFDAukwlwmzFpCKzhw9CalHKPZv3+gUwbjMLNkSV5Ssw/jpnUnsqVF5X9+1Xw2/u/uj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118768; c=relaxed/simple;
	bh=nOa8BNz6DducqsOmAp5/99ziE7C4mt8wGFrRK5bE5yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOojPeF0/Nb2LUS5/vP0GuSXdMDXylrUiEgOtN73UNodryqD4onHkde/ahYg7v2eF7cq4onICFduMFVJvFRcKs5Eh/9YnttuITdfVT5H20Kk4SCj7IQl/Si8Pf/RBmCcGsdedMxEeYT2vhMV3BE0CuDS8hDlG42rvXZmI0r2Dcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHWSfFmn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso4867092e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718118764; x=1718723564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8qxHIV9+ZnLwV7Ghc4p7Wis3EeLCO/4WS1Wx1eZEgg=;
        b=JHWSfFmnRGIMg4uQca4RR+wRHz63X4JKgz8DGwLCuBkK4Z9OXdRrfzffcMdoCSEz1w
         FvKG4Gg/wKwC9Fa+RyyAI6wQqQfm0wbYGA/EYyAcQTJjTqRj4LtQUH0dCji0cy126AzC
         bFeAovdzf29N2T2U/Ao+19VCWG10EofYnMEEZuGy66zKspIFkiu03xg9lRy0k8YC5Agd
         rLek/HBaeqlpuuIHsn7kXzYtP0mG/mNTaWoueCRzCIaNcPAnogFDADLwDFvSu83WSuXo
         d/ql8DyJVH+pypZmknN2fWxigzgBmWzMOkddm2tYgQbNQlayvrD3sc60ZnRHu0YXFKCR
         fnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718118764; x=1718723564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8qxHIV9+ZnLwV7Ghc4p7Wis3EeLCO/4WS1Wx1eZEgg=;
        b=EKhFszaoww5rpnnTpSSLjA0L6zlOZLBjCv998qKeWr32MoknqWIqfUNwGSJwG8vHLF
         NgOO+TTNuQ7Ec+fLJP+oBjKE1eQxoXlGh9HF8zATyktGJ2xobwSLyOBBB3Q2svY1aLSE
         MjQUTUHwizVwrRIxk9gWDU1WtOHsa/O+WDi6IKXlGjN7+PEZXLFM0nnywAgjj0k+U7tH
         Po3dvOVegpogiqxZP7EQaVu9Qp7/qRnYXFZw/JBuTt/Bu/yGiEmnSZawTWL/C/S+4isY
         xs7HDGscEmD2jCW6Mnxtd3WKkffCdrSMaHNxKT2GgnGcprgi98DiM2Ykz4Rl6SGn5vro
         x7sA==
X-Forwarded-Encrypted: i=1; AJvYcCWqYSdxIm8ii6lmxP1+RdekR6OatwMKj7agiUmJMUmxlKqLtEVKdrl491i0E1b9vQT8IzimnI0+BRJzM+n0Tg2mZwM8stZk+0XhIw==
X-Gm-Message-State: AOJu0YyDTUGikK7vjdHBVdtQu+jhU5M8Uh05N76nEY2XWgrJRnTrOlIl
	T6KCQDKMQ66hmFadzVnY1agYlYyqo32RdnvBBWLtdwzqqiMbXG5Pmcxq/hUFT+BnDn66rqDJKtb
	nNHHYnSZPKXmzfM7EStBKMG4ic+pSBFmn
X-Google-Smtp-Source: AGHT+IE9k+BevraHZ/RHaT7MUt+WLTImx5EL8WezHG6hOzQ87CNg9egBTtBWZFkLA49rWguSS0hkRDb+8Bba5/3Ug1c=
X-Received: by 2002:ac2:498d:0:b0:52b:c2b9:d988 with SMTP id
 2adb3069b0e04-52bc2b9da42mr8447034e87.40.1718118764241; Tue, 11 Jun 2024
 08:12:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611143800.4115-1-asmaa@nvidia.com>
In-Reply-To: <20240611143800.4115-1-asmaa@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2024 18:12:07 +0300
Message-ID: <CAHp75VeZ9-aeeJexAx23GVkjJgmrXSygpMzkt1VZVdfn=0j43Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mlxbf3: Support shutdown() function
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, 
	linux-gpio@vger.kernel.org, David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 5:38=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> During Linux graceful reboot, the GPIO interrupts are not disabled.
> Since the drivers are not removed during graceful reboot,
> the logic to call mlxbf3_gpio_irq_disable() is not triggered.
> Interrupts that remain enabled can cause issues on subsequent boots.
>
> For example, the mlxbf-gige driver contains PHY logic to bring up the lin=
k.
> If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
> will use a GPIO interrupt to bring up the link.
> Otherwise, it will use polling.
> The next time Linux boots and loads the drivers in this order, we encount=
er the issue:
> - mlxbf-gige loads first. The gige driver uses polling while the GPIO10 i=
nterrupt
>   is still enabled from previous boot so if the interrupt triggers, there=
 is nothing
>   to clear it.
> - gpio-mlxbf3 loads.
> - i2c-mlxbf loads. The interrupt doesn't trigger for I2C because it is sh=
ared with the gpio

GPIO

>   interrupt line which was not cleared.

> The solution is to add a shutdown function to the gpio driver to clear an=
d disable

GPIO

> all interrupts. Also clear the interrupt after disabling it in mlxbf3_gpi=
o_irq_disable().

...

> +#define MLXBF_GPIO_CLR_ALL_INTS           0xFFFFFFFF

GENMASK()

...

> +static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
> +{
> +       struct mlxbf3_gpio_context *gs =3D dev_get_drvdata(&pdev->dev);

platform_get_drvdata()

> +       /* Disable and clear all interrupts */
> +       writel(0, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
> +       writel(MLXBF_GPIO_CLR_ALL_INTS, gs->gpio_cause_io + MLXBF_GPIO_CA=
USE_OR_CLRCAUSE);
> +}

--=20
With Best Regards,
Andy Shevchenko

