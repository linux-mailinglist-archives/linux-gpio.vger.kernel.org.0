Return-Path: <linux-gpio+bounces-13183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253F9D5011
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 16:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC193B25209
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F355C13C807;
	Thu, 21 Nov 2024 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q7p0WCZH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8EA7080D
	for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732204114; cv=none; b=gxuvLhpm/TR2w48E2cLNRAfuXSQhYQNVEceYvxE/n3fPaRPFeaWNqkB5JEBhYVPMycF5YLeLciJejVPzgp13Ddcetg1SuAxdiF/vSFyOm0qc5/Pa276m/hX9mFIneGEZMGVCuKn4LJQyk37vz9f6dR2cs4tKLXIGNeNY95/Ezgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732204114; c=relaxed/simple;
	bh=8NFwVbeSbIu4xuIL/+vn6mzdssua9mKA0pw8CxsYgrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nq4HTggtml93g8m/hiedkvdlQNq6FAYeN+RXY0O2B4JgR71htiJXOV9k2y4evu/kmbc5fHGznhNqwxWHJQpeWiIgN41SwwzEliHvvFoDvmgoUfpn5mmY6GYsUFmmqyW6OqfPuO2uAoEEnLnOHWAzR8TXl/U+bsqk/FIpMfx9MRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q7p0WCZH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so10552331fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 07:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732204111; x=1732808911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/fhuOHTRRX8STr/F3eYtDuHLZMSXIOyEsTCLQHBch0=;
        b=Q7p0WCZHQdZU6/KsbJuhLtUGHYs9W+eIOB18SxBRjyDccK+bNugbcQtfbDbomKPwfT
         bojNLzTdvSaW++yKwlzW21j81gqK5YjEVNFLjpRheNKnrOqy8oodLn7j/CTAS6LZpggW
         EahY8ad4Xn27h3YGp8j/+qrvRGYLrNttk2KWawbKOcRgZtINqDxIe6ZStu5WjFRER98+
         7XzJplFFyhlUHLGDo9J0UZNRlGH9SqadlljFXTXglO/lNKcd/FllKLnZgF59CFdLMz5h
         UlwMK0weVK7Ye0TmnKgcaRBr+10cwPIxJTEzy+xvnxFmm3GzLMejveQl1o2OJ/+6tVyq
         uZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732204111; x=1732808911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/fhuOHTRRX8STr/F3eYtDuHLZMSXIOyEsTCLQHBch0=;
        b=mYLTl2lth6g8dQOGfE6K2zz6hwhayy5UBe44P3xED3lAHcRBuRfxtZIXx8MQdRlyu1
         oI5dVvbd0pHkAo3GFNhHAEhEoNTh5B0OLXUp9exoVjSgolm41X7Z/oAwXAgePgDDgxNf
         iTlnCHsGLcf8R7QP6PsvL7kyNw//FtAFt32T9POeXRmHZ1TEWW1uKauHbLX4I1OBkO8B
         zgiOTbheBPGb7PTI90yS9FdrHFTXy8Lzk1n7ML25Lr89k+VIoAko+Kew3VZDujIJfObu
         jd98VlAouD7agn0MRfUM6szwf+i/Jh3+50iv3yuipq+j9c3LtdPaBn4Bse2oNSWD+DwA
         sirQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoPY1t02UT/KP9fGkXRWNwGu0jxxQVB1zS0O7iaB/uqVX/MkQspF63Ih/nHvIj34g7nYGOuw+9VSty@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78QMD5dCbDYAyqCG83jPN8dTsHCliZTY0kykGvyHvpTKvxoXG
	UR0DWCmBQCdP2lJOjA1VInLjx+m0zIPtqIcdzEzx/m8CaJsABUPnf4SpbFPcXwfWIRNQK9J+TR5
	NMaWGY+TFhva5i3riY4WWFx7uF9dnzHxPoOJS5Q==
X-Gm-Gg: ASbGnctRjO1Dcpol0lWHd783TY+eFKJVOvWOLaMKWHxi1e8FSRftpJskn6gQ1KtAGUC
	t7z3Njd/7L88rv9TGHIrTTB+HxjyId7l5Od7PqTjBc9gm6xWbLP6gOdSg0zh19w==
X-Google-Smtp-Source: AGHT+IF75pNvGuAMuobLXcs8bP8ekOwdEpxBPncCEjd34YEVOCl2sVnSjJwi89Y6maf0VEbLr9RMuf/EN/VgtXWldTA=
X-Received: by 2002:a2e:a9a4:0:b0:2ff:59e6:b9af with SMTP id
 38308e7fff4ca-2ff8dd08555mr47569501fa.33.1732204110665; Thu, 21 Nov 2024
 07:48:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121145515.3087855-1-catalin.popescu@leica-geosystems.com>
In-Reply-To: <20241121145515.3087855-1-catalin.popescu@leica-geosystems.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Nov 2024 16:48:19 +0100
Message-ID: <CAMRc=MdRPe1PRAQ1vwsMXynR02PRDqbxNeQHg1fXBiBxe-s8vw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: fix warning about static allocation of GPIO base
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com, 
	m.felsch@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 3:55=E2=80=AFPM Catalin Popescu
<catalin.popescu@leica-geosystems.com> wrote:
>
> Static allocation of GPIO base is deprecated, let gpiolib perform the
> dynamic allocation. This is done by initializing base to a negative
> value before the registration of the gpio controller.
>
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>  drivers/gpio/gpio-mxc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4cb455b2bdee..a7418a4814d6 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         port->gc.request =3D mxc_gpio_request;
>         port->gc.free =3D mxc_gpio_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
> -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
> -                                            pdev->id * 32;
> +       port->gc.base =3D -1;
>
>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
>
> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.34.1
>

Sorry, no can do[1]. :(

Bart

https://lore.kernel.org/all/f891bb06-4fc6-7b4b-464d-50235c1cff48@pengutroni=
x.de/

