Return-Path: <linux-gpio+bounces-6677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 912878D061B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E846B28B93
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACE516E86F;
	Mon, 27 May 2024 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NfNVC+FZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51320168C2E
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821385; cv=none; b=mjHAWsQPKSf9dbKbssAA8/JxpoF9tMlOTLoR0T6w77nPzIFo9drHSxV5KlXbFA+1V40rzVcATpLUoTBXagYroYCKxarDvmVKyXign0NCGCdD1SMRixK+wEyXbbTe+HASIwJCVoz/OnyAECGRhAlc8Jl34OXtHe2eEMa3QRrz5EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821385; c=relaxed/simple;
	bh=fc/uxhHDXm84M3D2c5Iq6LLxGzTCjb70qlqhCxwJ2qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mow0oQI9VZE0WMt1AajZZWwbnfH8GfYKCvvkUXy9hQw+qh9Xvg4ApGc05p3qQnZfYJgB7Bckidyylmkf+JvL/PqSoq3EQWMKsgjkzjVKCDMD8BFG12y/Wp+NBlqK3oadt8E5YFBNV+UcrlZQzgTlMEErE5NSLNcxZU+GaPYmh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NfNVC+FZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e964acff1aso33734121fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821382; x=1717426182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg2MB52lHo3rAL36XsBKver+ioxYN/8YtGYwXUC5DuI=;
        b=NfNVC+FZyWud1GfNTCx9/GY16r2/ae/16nsWEiX6KLrwsN3GGdN632YDixQ74d5M4g
         gYw8Ss9i0rp4M99y46SCJYGnAnOEkZppQnWgCq3B5AnSHTOnzWaBJdBnLwWB/DluG1p1
         AAEWG2L14YQVDpvhDbpOkUk5pQ7ofSageaLdlPmUfbVMSHbBTKokq0S1Gc+ZfGOjMd8T
         MrhQ/6HTaLW65x10l6Ybb3W2vWiIc4C7a/CXYber6O4f9Cdq19FoVahSHB9V0iBwQm4e
         sj9KMsBDAFxhjh/tNa6En2+DMvMPKL4klsR4/6zKgMjzTJ5Quuch6yz8YPw0oN9a9uC8
         3Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821382; x=1717426182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg2MB52lHo3rAL36XsBKver+ioxYN/8YtGYwXUC5DuI=;
        b=Iz07bC53ov6x44l9+JLlztEG9fQdcy6ExKGUgByY/RJ726tr0HbDle1xDerBsEJqCL
         a9Olv/pKyUS0WooQ55rK5zI2qAATG85ra7JE25+BxFbbSDVpdFG85+9RLkeLJBP+k9n6
         GpMf5cCkrix0bwuz052JLHRmear5BWUtw56zzbV50OXcBTP4OixhNF85lBZR6P3OPheR
         VBuIg1vqiN34ze/WwVJ8bSq57N9LN2hsURYNLhuqT0ClMTx1E64ZTvXn+xT6dLZZPkg7
         /QISCw88zn+TSaTvfx44evJvkuzulVubPCT4SczOkaCk7RJCOmNxv8uHotg4ECNs22oJ
         /Khw==
X-Forwarded-Encrypted: i=1; AJvYcCW/SGkowCtD1KcpGBhHNjWseuzbl4OVP/irXEnuMR+IZN7g4BawA3l6+nn05XPknz46FvwOJCRmzIxgwRuxdUSyy9cuMgprZyLZwg==
X-Gm-Message-State: AOJu0YyhHLMcKC9J7lzCzIjeC3QgNMZ8nFZ6kz5VAs00TuFzmCDe7et+
	d6H/wUzsClIRvT8/JtWaDCsoAy/cEd343zTJm2ZBZamzxGyBqhMZEpN5/Udh5NxIXomXnWljgtB
	k8j9D8kByqGhoFnwgMFwg7a7gyI8WjhSo1cnmpA==
X-Google-Smtp-Source: AGHT+IFKkP8nzOgR0zKG6YNm+x1e+OAEIUK14Lm/bCi5EfHeBTR8QctSGLB9f75TwyqyIBr6Xr8CVJKTRpbOvcalGgo=
X-Received: by 2002:a2e:9591:0:b0:2e9:4b33:dd04 with SMTP id
 38308e7fff4ca-2e95b0bce53mr57808231fa.1.1716821382395; Mon, 27 May 2024
 07:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510160534.2424281-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240510160534.2424281-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 16:49:31 +0200
Message-ID: <CAMRc=McF==kj0EPw_zMmqn5fxYenOVDaZo4XZ0_SiREaagS-rg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Show more info for interrupt only lines
 in debugfs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Show more info for interrupt only lines in debugfs. It's useful
> to monitor the lines that have been never requested as GPIOs,
> but IRQs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> For the reference. May be applied together with
> 20240508144741.1270912-1-andriy.shevchenko@linux.intel.com
> as a precursor.
>
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1f1673552767..4cd7e05f3e5b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4801,11 +4801,11 @@ static void gpiolib_dbg_show(struct seq_file *s, =
struct gpio_device *gdev)
>
>         for_each_gpio_desc(gc, desc) {
>                 guard(srcu)(&desc->srcu);
> -               if (test_bit(FLAG_REQUESTED, &desc->flags)) {
> +               is_irq =3D test_bit(FLAG_USED_AS_IRQ, &desc->flags);
> +               if (is_irq || test_bit(FLAG_REQUESTED, &desc->flags)) {
>                         gpiod_get_direction(desc);
>                         is_out =3D test_bit(FLAG_IS_OUT, &desc->flags);
>                         value =3D gpio_chip_get_value(gc, desc);
> -                       is_irq =3D test_bit(FLAG_USED_AS_IRQ, &desc->flag=
s);
>                         active_low =3D test_bit(FLAG_ACTIVE_LOW, &desc->f=
lags);
>                         seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s =
%s %s%s\n",
>                                    gpio, desc->name ?: "", gpiod_get_labe=
l(desc),
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

This now conflicts with current next, please rebase and resend.

Bart

