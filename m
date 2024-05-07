Return-Path: <linux-gpio+bounces-6181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE868BDC94
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 09:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82C61F221BE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 07:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8380D13C3E4;
	Tue,  7 May 2024 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I4jWW7ib"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94613C3E2
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715067789; cv=none; b=qioFOz0FmnCTebHoME9dXSmOogqLiuXkuUu0CswidcJ6XYfYNIqnETzyOns2vM8bvi9FalZyCWnc92FCMAzaRtI5btF242apWHeeFwHzrhAAtumoNOY/KCN07myxwyJ0tQRxaBwJK+fyyC7z7Wka03OxlGVkydUvH1OzBsW1gHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715067789; c=relaxed/simple;
	bh=wARDzFCD9hfGFytJILO0YowwSyMW47/dEWIG1RwZwhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUJxrzwdJ/UksBEmQr+fzuRs+RAuz3C+ssADRDbzrs5JSD0+gKiIH/hEQVOpne+9cNO4sdnDoXRpFK75IHR7ti/t0hkfy6mnUwDmPerBEVFsw9OeGEc7Zt9QNNoL4PV+hNelBseaFu28ITR2MhZRSBa41TlbXebX+nPrEhR9HOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I4jWW7ib; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e242b1df60so33628191fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715067785; x=1715672585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blv84ccNVSxe0erDzVypkmQBfNhmaTRBCl+jKs7q6Tc=;
        b=I4jWW7ibPmkaP2+0ps9RdE9EcDgbewGckVoFcbfGaYVUzLUH3b15OqcnVlswXF0ILu
         UbrS8kNxi/bmL/weRmuCNrikOO9P8X7st3982h/8WpK82saJE4Hyo8O3wki+fkP0Y8pp
         mNNFCvAKiILPEsoKQoj7KRWv3RPNeW5Dzab7IrFg5zDeG17ekXbCugtU82/zl5YutuDG
         msGP9vphJTBEE/wQvwClFyf7m7kNloal1toknAFMdp3CF5yLIy9UkRju1ER7nkY+QdqV
         86TLpG3jKSzwZSEO9Fdq79JRe7hzLhZwQPmpKfr9/THLxIj6FAj1CUoBlgMRNzti1V4u
         zqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715067785; x=1715672585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blv84ccNVSxe0erDzVypkmQBfNhmaTRBCl+jKs7q6Tc=;
        b=mqLBA/VW/i2MMk+OxPVZ0QZY9I3tmpLrUginexIiYo4vobpNNfbwpRG52/HFsO5NiX
         zp88KpFkYbz7QnLVfaSRFdbwiFyMRA3vBKIYewpNGcZCR99ledVzWohE6WqYrq4+TqU1
         qxTYJiu98iUFenK/XbMU+lOvB0iOqV/9cqs9Lv0i5DslGmZAdc596mb5j7emGEcRmqNY
         ms10yHqNYXRukqiMlEjKD9IjFI1ukMKtT2v+Yfa8R7QvlX2iLsSgrnQoXxNCCmvjs2sl
         2AgXiqrdsCAzMfekmld8wz78v9Owl297nv7zVm7tX6yGnok/MxAXHXN0bzffaOfevMEo
         jiUw==
X-Gm-Message-State: AOJu0YweDUZnyrVZGhHHOvvQb2vorR8TxOTbxtNzP+Gn+h7fC0eQLJFB
	TXYjEgx/C5IqfK+KwZYEi/ikr00PY2PfC+gDSNMb0yRRQxJRGxF5N8gYdkJw4Ac7sR1qx4LJ25r
	iJI4fyUZZTUHEBruv8iuXAwfwf1D9yR+sIwgFooS5AECH6vu2
X-Google-Smtp-Source: AGHT+IEx7ScRfYupdno2cnpWbVnYLzeGB21D9Ob3J8vjFJbM7Ui2mvGcwzTSCxtqKX0PunNuG4MiwECcWBZB3Ret5cA=
X-Received: by 2002:a2e:8208:0:b0:2e2:902:e664 with SMTP id
 w8-20020a2e8208000000b002e20902e664mr9305914ljg.45.1715067784966; Tue, 07 May
 2024 00:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZjiVc8DKWkNF7-oL@black.fi.intel.com>
In-Reply-To: <ZjiVc8DKWkNF7-oL@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 May 2024 09:42:53 +0200
Message-ID: <CAMRc=McZ2SSELOpVWyJeQ_W_oB9JaV6ccBPVerreL+rzJYjh+Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.10-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 11:10=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> A set of updates regarding to GPIO ACPI library and a few Intel GPIO driv=
ers.
> The lot has been in LInux Next for a few weeks without reported problems.
> Please, pull for v6.10-rc1.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit ace0ebe5c98d66889f19e0f30e2518d0c58d0e=
04:
>
>   gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +030=
0)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.10-1
>
> for you to fetch changes up to ecc4b1418e2399753af7ef304d01f45e8e942286:
>
>   gpio: Add Intel Granite Rapids-D vGPIO driver (2024-04-25 14:57:28 +030=
0)
>
> ----------------------------------------------------------------
> intel-gpio for v6.10-1
>
> * New driver for vGPIO controller on Intel Granite Rapids-D
> * Update ACPI GPIO library to unify the IRQ code path
> * Better GPIO IRQ line labeling for ACPI
> * Switched Intel SCH driver to use "mapped" I/O accessors
>
> The following is an automated git shortlog grouped by driver:
>
> Add Intel Granite Rapids-D vGPIO driver:
>  - Add Intel Granite Rapids-D vGPIO driver
>
> crystalcove:
>  -  Use -ENOTSUPP consistently
>
> gpiolib:
>  -  acpi: Set label for IRQ only lines
>  -  acpi: Add fwnode name to the GPIO interrupt label
>  -  acpi: Pass con_id instead of property into acpi_dev_gpio_irq_get_by()
>  -  acpi: Move acpi_can_fallback_to_crs() out of __acpi_find_gpio()
>  -  acpi: Simplify error handling in __acpi_find_gpio()
>  -  acpi: Extract __acpi_find_gpio() helper
>  -  acpi: Check for errors first in acpi_find_gpio()
>  -  acpi: Remove never true check in acpi_get_gpiod_by_index()
>
> sch:
>  -  Utilise temporary variable for struct device
>  -  Switch to memory mapped IO accessors
>
> wcove:
>  -  Use -ENOTSUPP consistently
>
> ----------------------------------------------------------------
> Aapo Vienamo (1):
>       gpio: Add Intel Granite Rapids-D vGPIO driver
>
> Andy Shevchenko (10):
>       gpiolib: acpi: Remove never true check in acpi_get_gpiod_by_index()
>       gpiolib: acpi: Check for errors first in acpi_find_gpio()
>       gpio: sch: Switch to memory mapped IO accessors
>       gpio: sch: Utilise temporary variable for struct device
>       gpiolib: acpi: Extract __acpi_find_gpio() helper
>       gpiolib: acpi: Simplify error handling in __acpi_find_gpio()
>       gpiolib: acpi: Move acpi_can_fallback_to_crs() out of __acpi_find_g=
pio()
>       gpiolib: acpi: Pass con_id instead of property into acpi_dev_gpio_i=
rq_get_by()
>       gpiolib: acpi: Add fwnode name to the GPIO interrupt label
>       gpiolib: acpi: Set label for IRQ only lines
>
>  MAINTAINERS                                        |   1 +
>  drivers/gpio/Kconfig                               |  18 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-graniterapids.c                  | 383 +++++++++++++++=
++++++
>  drivers/gpio/gpio-pca953x.c                        |   2 +-
>  drivers/gpio/gpio-sch.c                            |  35 +-
>  drivers/gpio/gpiolib-acpi.c                        |  65 ++--
>  .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c |   2 +-
>  drivers/pinctrl/pinctrl-cy8c95x0.c                 |   2 +-
>  include/linux/acpi.h                               |   8 +-
>  10 files changed, 468 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/gpio/gpio-graniterapids.c
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

