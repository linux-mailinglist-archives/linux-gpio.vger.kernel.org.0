Return-Path: <linux-gpio+bounces-12847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33159C511D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982612818CA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 08:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ED320BB21;
	Tue, 12 Nov 2024 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wPfNaZcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE420B7FA
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401301; cv=none; b=KoOfXkD8V9dy54nGdVFF9wYT+8+DUFhoxy//d6Ni87svHYxzvgjILN1gdeHtuDMpvTwujkMLh/wH0fxhI87SgLR4WPR8AdhSm9L1fl4PNPxbRwr9HcNL/9OI/mW2toZdv9ZX9DVck562MkKWcDP9pRnzG6H1pnbRlQ0VVBxdVb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401301; c=relaxed/simple;
	bh=dxnT7wDAFkF35Sr7lpyeXzGCLbal3sDIsD+NOmbHktI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2qF6rJe9lAMEx4DJktvSEhLHpyCNU9ZeB1oCoftzzQhRs6dZ1dHQXSfTX7/zCew3vpppVUSLXT/rx7indf1IRwJeYpHu/CtCqx5D5u+wWTIzGBgvzmeQlvhDYrSCRPFnexlIrMoRgmzaun3hTZb9SwtE6RTkoDLJ7Mq0exDctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wPfNaZcj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so8061488e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 00:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731401297; x=1732006097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS4Z+JVLC+cIyIjSTxJTy/XnT+AgYmNkxO0eQSRVvDQ=;
        b=wPfNaZcjed1kn6+5hqYK1gi7mx+0b5T8B9/ZOS4t1sGSzHxHMoFWvbTSmNAb87FNvj
         2Ns/CVTqRdGGVuJktCN6BYijaPkGQGV8LI6JC0t+7bigMzAQmiX6MsowtxDjtqXKebEu
         cAMSusm0SFyYpvGOJmxi2m5fSTo6AmCdQzrSi6hDgfj8nc8xOlxSWcHK8iWXSKqedAhc
         Ga6sFrZZV5gYRF627z1ByCjJ1LE6sND/Ryaqk38dQD1Cq2zrE1xbD98BRqsuPh3dNIr5
         6vpDG4WBznZX5wY8X078tWJRQLDZiUf/khcInCEKYYtVM8SGiZZzVYPcMD0dkgeD6yWW
         /BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731401297; x=1732006097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS4Z+JVLC+cIyIjSTxJTy/XnT+AgYmNkxO0eQSRVvDQ=;
        b=seKx4Hzphm0IMgzmVA5XPkVtbIIhdVscBNj0jOItrC8ogUVGY/eHtnx0K4N0AreTzl
         QUA4au/F5q5EBq8XydPVOxIwsYg4qjEfrCchKB4SQZlxOs7KSBHy1AY02JuhzNN/UF5a
         5r0yMV/S/24dbJFz7ZeMjmtEXBUIoafj0i2ytxVcgmUExxRzFLAIlcuN6PPxTUAHzZtU
         MoqwkD1UlJRnwRit/0bwrINjf24NT7Rmy2V7ihHaV9tUB4+S2xvhH9DEG4rhExKWe72m
         C0pRdbpfXuZeca53YVSCiwp0bOsYGypNzjZQft9OgUqaZ367Lk+2luXOBbx10+Z6Q/3h
         k32g==
X-Forwarded-Encrypted: i=1; AJvYcCUvkWWxXrreZ4JakTEyCNr7LMkejjRhZ+IMQ1GK2UPduVZRJrnm5okQYHtGmzvXm/tyotitDC/n1Zen@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5/ijD9cSwM/zJctCU8puy2nRBm4AcBsfGEXnqHklzVW+it3m
	PIZdx/DtAgCQVwjixdzVkOh8/6EHdlcwA2LwccQn/YtA448O/Oc9pi+sKb+rGbG7DgYKrxiBPiX
	2PhAmKF2xcyZdiE4GRXWa/jc4osCYoRn0QBTmTQ==
X-Google-Smtp-Source: AGHT+IFwq/t+KDsbuV2QhWwuNI5bupx1wsWOMyqz9EMw/Cb8GOHaigP3+bypOiWYwPdWO9Dvex17+Yq5iUawyDu5Osg=
X-Received: by 2002:a2e:9a0a:0:b0:2fb:3e27:cbef with SMTP id
 38308e7fff4ca-2ff201bc2c9mr64900231fa.23.1731401297361; Tue, 12 Nov 2024
 00:48:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com> <20241112015408.3139996-5-ye.zhang@rock-chips.com>
In-Reply-To: <20241112015408.3139996-5-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 09:48:06 +0100
Message-ID: <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index c090cac694bf..cdfdd5501a1e 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
>  {
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct rockchip_pin_bank *bank =3D gc->private;
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>
> -       return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
> +       rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
> +
> +       return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
>  }
>
>  static void rockchip_irq_relres(struct irq_data *d)
> --
> 2.34.1
>

This looks like a fix to me, do you want it sent for stable? If so,
please add the Fixes tag and put it first in the series.

Bart

