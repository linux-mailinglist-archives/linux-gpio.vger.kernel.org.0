Return-Path: <linux-gpio+bounces-26921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC66BC77B4
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 08:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4958119E2B15
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31EB296BB3;
	Thu,  9 Oct 2025 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVbt1zqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00E25FA2C
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759989819; cv=none; b=hkionFAnyZ8GqnX0X+5QaAfpRAJnr3HRaNFneiNtN+LpNhLAfFcr75S2fNQ3MKHv02LmNt77tYiZxxBnOh3q4bv7aEPL5t+s53a+ISDMcRNUJYj6eOuF8UNY6bInDX3frfRDyRwDuiL4QWCXZV4uhv3N850CnEdg/siPGMnbous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759989819; c=relaxed/simple;
	bh=MO1SDeQA9t1DkNg2aixIg76CzdGOr64AKdY70lbrvoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7CVnG3Zwee2ft2gMhjJtXFTpKCtfcbqDabate6AyfvuEsePLH1ZwuwSY1g5quo08XydBvGQyuVXZHXIl93EFtoFnQJ5o7auF3mJWUcUwOD9rApCotmwHVmTVZ2uY4Y7Qoo4S6kJNV32bSh7HN3jnWBVnLL7gbe7Hy5+cPe/E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVbt1zqE; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-36527ac0750so4388451fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759989814; x=1760594614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCL+z+W9XFOkD374E5iJXvaS65d++XBiHfJ4fB0e9ug=;
        b=wVbt1zqEqrFTExcPRQUUgdia6fKRyPXVv4qnXFV/TVQ0aw+mt2mrnQLIBkxL9TUZLm
         31MOCZZIQrfSbvZGGKp0VP+pwMbNZrrWaT9aKRS2rxvI/ZGhOB4qdgJUIcTgT++0uihM
         TLBhzRZXeY9FKMYJduLlX7VXX6c0DMYFME97Um3dYCkzovUsHqx3OnVur2Bu8b72s/Ui
         LI2f1U5esHQa55gal+zs7tG34Rf9MxuL23BTjGb0F350zuiE7lPybM5qK7z/GarHjfdH
         VfGgrdtgwg0gyCfPIrpPQ5esBozUUw/m+dJAU36lo6a+b6BrESXWRlIKVPf5FEYxm4b3
         hprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759989814; x=1760594614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCL+z+W9XFOkD374E5iJXvaS65d++XBiHfJ4fB0e9ug=;
        b=xTyJ9+PjhPP2pV38qSqRzVHSso7klWDJ+44GpoWWY/iJm5SvrtMR+jgKddeo9GlTQa
         EkVpbYQRRv/+6UgquVe/giWfe8ds1kv/vk8EqsjXvH+Dm1n5egVrcFA8GaAF5W3QTNIs
         bmMGBZRzwHdBpi3TaDWhigMiv5t4fILyzuHxNjwg1lZcqZyxBI3x9iPWr/RdUDGstyuu
         E6S5u1oGjJDCGoeZs6cQiXn6PPc6izZTInGhU9SPv01UwtxUQdpV5SjVf74wteqdmYMU
         84Ug9BT+nTQWHKyOC2x9ffSX//o9nhMlDwBMBKWAGpC7uYY6zz3AVT6LHIhNWKODCCui
         ariQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIlB5yfHl7/UbImvQz/uCWvIPgAyAcEbXy2WeOHG4HSxX/8GyGhcZTPSA0f3Vhq7QFx1BOVMrCAvcb@vger.kernel.org
X-Gm-Message-State: AOJu0YynpQKBKYMCSF4jys8GD7ZhpMjfYD2LR3xJl9QwkVIeIXwtgqtO
	TW1Y0lsyI9zgHEn4pP24dB+Y13cYps+GgurcBsNzBX9ZT7mxP0KyBThURWbdnkSu6vsCfGLa4SQ
	04HQuXUpvDO0k/4urE1yhaDPT/GdUB1wqRIIg3eNbtg==
X-Gm-Gg: ASbGnctBwvizm8s9SIp36DDXEBKsS8Nrznzkn00U2vu5uMRxEDnFYOVNzQiLrt0bGXQ
	PKM6h7JLhF54rpoSdO2ZXKnCKG5F/ARvmWdtnfOx7hk1uv69U+yXme6G/T03o2vP29yQ//BswEZ
	wN8EdHWQdmXx4t3zmP4vncsq8vJkE0N7bgNcahc+15APLRGOo2Hs0evxaYXSwEu3NLUAzojesh7
	ZVwJV2IwPQwUdCUoTek0ZJuxS3q38742zAC+A7f0rEKKA==
X-Google-Smtp-Source: AGHT+IEZNfWeF+b5dDJpmeQ9pgKxktrF0BB+BUcoJ8owg5gpVJldbNcnyiTvgwBoTKGPhDfTehGzOVi3suhz2fLA8Xk=
X-Received: by 2002:a2e:bc8c:0:b0:36b:9ecc:cb36 with SMTP id
 38308e7fff4ca-37609e4d28amr18386291fa.23.1759989814463; Wed, 08 Oct 2025
 23:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008104309.794273-1-flavra@baylibre.com>
In-Reply-To: <20251008104309.794273-1-flavra@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Oct 2025 08:03:23 +0200
X-Gm-Features: AS18NWD_o6hLF8XWxXYwfE1hyuq9u4NNivtpBLU3fjyrNwqbetS_Su7z682Jp1I
Message-ID: <CACRpkdYDMRZMb+bDUgK5yiKU1Toy=S_ebo2_4WRasHxCqv+4xw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
To: Francesco Lavra <flavra@baylibre.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Maria Garcia <mariagarcia7293@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Potin Lai <potin.lai.pt@gmail.com>, 
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>, Fabio Estevam <festevam@denx.de>, 
	Ian Ray <ian.ray@gehealthcare.com>, Martyn Welch <martyn.welch@collabora.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

thanks for your patch!

On Wed, Oct 8, 2025 at 12:43=E2=80=AFPM Francesco Lavra <flavra@baylibre.co=
m> wrote:


> The latched input feature of the pca953x GPIO controller is useful
> when an input is configured to trigger interrupts on rising or
> falling edges, because it allows retrieving which edge type caused
> a given interrupt even if the pin state changes again before the
> interrupt handler has a chance to run. But for level-triggered
> interrupts, reading the latched input state can cause an active
> interrupt condition to be missed, e.g. if an active-low signal (for
> which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
> an interrupt when switching to the inactive state, but then becomes
> active again before the interrupt handler has a chance to run: in
> this case, if the interrupt handler reads the latched input state,
> it will wrongly assume that the interrupt is not pending.
> Fix the above issue by enabling the latch only on edge-triggered
> inputs, instead of all interrupt-enabled inputs.
>
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index e80a96f39788..e87ef2c3ff82 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -761,10 +761,13 @@ static void pca953x_irq_bus_sync_unlock(struct irq_=
data *d)
>         int level;
>
>         if (chip->driver_data & PCA_PCAL) {
> +               DECLARE_BITMAP(latched_inputs, MAX_LINE);
>                 guard(mutex)(&chip->i2c_lock);
>
> -               /* Enable latch on interrupt-enabled inputs */
> -               pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mas=
k);
> +               /* Enable latch on edge-triggered interrupt-enabled input=
s */
> +               bitmap_or(latched_inputs, chip->irq_trig_fall, chip->irq_=
trig_raise, gc->ngpio);
> +               bitmap_and(latched_inputs, latched_inputs, chip->irq_mask=
, gc->ngpio);
> +               pca953x_write_regs(chip, PCAL953X_IN_LATCH, latched_input=
s);

This driver is used by a *lot* of systems and people.

It is maybe the most used GPIO driver in the kernel.

So I added a lot of affected developers to the To: line of
the mail so we can get a wider review and testing.

Yours,
Linus Walleij

