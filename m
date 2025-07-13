Return-Path: <linux-gpio+bounces-23197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6AB0304C
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 10:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41A0B3BA646
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 08:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF5D264FA9;
	Sun, 13 Jul 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DQsZjoHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364AF23C4F2
	for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396581; cv=none; b=NCI3fh2Vu+aYHYHfVm5bC/Qb8ArhaC4ezySDgq8jAzigmj7321bM6H1qgiztuey45GG0S9jhZa3OjTkR9LiVInDhb5TQiPbIwWC16b08a6ztEKcoPFpiHBi2o7jSEpRBffWh+Y682s2u5Dnqb4rla8CIqpAmlK4NVVURL5T3FT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396581; c=relaxed/simple;
	bh=cV/NDwp/sNmpTSnX+YcZxa/+NKwprOpcCeD5lvtK6q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5Xgtr54uqBe6XWjB/uB7gpq6+bGemYpjt2SC2wg6YduvWLGpwm5C1ukA4oWglOdyEDs+9S/17dWenoQ7VwOIJY3LJHvaB9bWPJe/tMsj/7IhCdQpqozAC8L/eFiAR9Zfm2x2X/jcyumqvbkxvbXoZNutbfPOJzjCr3EO9PqfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DQsZjoHm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b10594812so3377522e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396578; x=1753001378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=DQsZjoHmVwV9MmKt7CfHZxdRcawgETMhaxaLPPte9pzg0WJ2HLeOhB9IVZmBKetjqk
         tomUXCW92R25h77mTh5r4xnEaHZFVwlrEjTa+MWQl1OtBr9d9gIjzA3Fg2iPIDD43n0f
         zXxSDfZXEXAbwoET2it2fvkNRN9z46eBDkVzq2QE20fXzwKBJwNnMw2Wg4hOjBQAe8ZA
         bXVp4ABKuzwBx2UFZhMNo6rx9W6sSwCn/JHagH6KGcM/zLn4Bk3PlFfbl4A+YR6QQrB0
         IaEhLBN+59p6f8QQUF9MTy6qqxDjWTYMwQHUy445FOxg0T16rlvGDFC/XawgyjwLcGp7
         mU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396578; x=1753001378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=rgMqzTeK6cJ1JXKIUK90/lPj+XH2CNP8YkshR2BwTvqBJ6ipbJJHEKAgv8Y8pzInJW
         Pfboz4NmBJ2SUW3LOzfuI3MT77H7aR3L0qHXw5mGb5QkvQdmHR3Fp0tOrdAHVo839GWU
         0+o4ISIxokRQ/lfsru7n+M1ztGgjbhC0H083GZ+mDDML9lvTkmkAKNE7z1YZpd5iVRtp
         +/g7FyVb0mRECNtAOlpiUuP/2EJ1vH4abEtVTmFWSziefU5XmgOtre5ZnL7KdrVO3oDU
         p8WDsBogYeBNQ12agPuY4uszbUBAtEMacKXIAXLYHGq7mfeE4adX4X1O76RHMfuul+/Z
         Cv5w==
X-Forwarded-Encrypted: i=1; AJvYcCV8WqSgqHR3yFXN2VjEeELThIzsYM07WQwEy5XgsgiuQHHQCNermRfj9Yvtin4ZVDQhVNF5ZgOjJ5GY@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYwT0y7k7oQcFFIo+BZ8cuKmpVW0B4drJZcOsgWbcDI9hz92W
	jy+bc5R31G3VrxN6zFwEWkvUOkGyC7h7egxwyN0VyUUcrmZQypx8epFn+OqKT6ijhHuDi8vjeAT
	VQVykQI+oApCtB0hDUhZ75Unq1g0NKTC0qlZcs1VF/w==
X-Gm-Gg: ASbGncuwuvDjxvd346qD/0RjbhVlz9AgrNV5Q3FkcYh7yNNx88Btj17JJ/o4fBhlZrH
	riXmDP5ywsAoVtde3mFvMm9ly94NjUQdfW1hcp5NfE4LR4QgNQaYOqnGgnCpDWvmFigIUj5cDJ4
	V3R1APS/Wt3dXKeZ/kUDbzcvSLhCFWKah/xBq+w7Vl/YpXjS/6w5h/eAJ3xZEhcrYT1LajG6vz3
	zLqA5AsU57Iit+l3jSWExXyBX1bY/FwMs82tx/ibKMlRxKS3g==
X-Google-Smtp-Source: AGHT+IHSVlR3f84ykKc18xLN16yOuI1UBS+R1HGXkNcrI5d6VuncH7GOy5up7ZkTvuUg5ocaceSyWG2pJHHAQMTtfQA=
X-Received: by 2002:a05:6512:6cd:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-55a0463d16fmr3003378e87.50.1752396578149; Sun, 13 Jul 2025
 01:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:49:27 +0200
X-Gm-Features: Ac12FXyhZJT7lfbn0I6DoUYvpi_8wvzLxArloCSn9kbjMpsbWPmC7MSTvAUWCwE
Message-ID: <CAMRc=Mc1UyWgWwUFVGw=1EVJb1u4MQYUKcguiQedmbxTK6pY1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/fsl/qe/gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7=
509dc5eb840f344 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned i=
nt gpio)
>         return !!(ioread32be(&regs->cpdata) & pin_mask);
>  }
>
> -static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> +static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> @@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         iowrite32be(qe_gc->cpdata, &regs->cpdata);
>
>         spin_unlock_irqrestore(&qe_gc->lock, flags);
> +
> +       return 0;
>  }
>
>  static void qe_gpio_set_multiple(struct gpio_chip *gc,
> @@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
>                 gc->direction_input =3D qe_gpio_dir_in;
>                 gc->direction_output =3D qe_gpio_dir_out;
>                 gc->get =3D qe_gpio_get;
> -               gc->set =3D qe_gpio_set;
> +               gc->set_rv =3D qe_gpio_set;
>                 gc->set_multiple =3D qe_gpio_set_multiple;
>
>                 ret =3D of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>
> --
> 2.48.1
>

Christophe: let me reping you here as there's no reason for this
relatively trivial patch to miss the upcoming merge window. Do you
have any objections to me queueing it via the GPIO tree?

Bartosz

