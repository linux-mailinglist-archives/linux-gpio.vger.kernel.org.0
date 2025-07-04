Return-Path: <linux-gpio+bounces-22792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4AAF8BEF
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DD45681EE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C632BDC2E;
	Fri,  4 Jul 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nznebFvT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C162BD038
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617633; cv=none; b=tXfsS8q+tAKQYfkJ8qFTs7RJJQqTPqWbKwg4HJi4A5DZwt3sYFDd9hSNxPW4brT0v0DmcTYjFuvGTqQ05ecjbggPOlKcv5B8nXBKfo40lq1SqVrjlo8QAi48TCr9eH0xxDccaB1uoDvA+hP3P7DDJoLsl6zH+UgRzFjRPz/UOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617633; c=relaxed/simple;
	bh=KyQG4/PtXk1I0N8JEou8JyB93SVP5PTQ2ACI4AMtZdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8eYijMnZ9RB5mxgOdKYMSC/QLoieIR0Rth7VFrFYNWU0+kXSvtk59sepUObrwrlUMGs94ECTAxqCs2yhsndVNPoVa4cpQMdEbnFVLLIHcbFx+5SbCqfWF0H7nVdNX3ECMG1/oeyQipy9QEaZD5G2bS8MRfClmPcZqWk3jVsasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nznebFvT; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b43846e8cso6322811fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751617630; x=1752222430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MAVLF41QmphRvqRBx4yeoftDy/YqQapTAiNPyaFzl8=;
        b=nznebFvTA22RTOMZvHFZzsd7rNJKGAKZIFJb0n2qrjV34Xjzn2Tjtq4LMWqtwv6pfI
         BBvozIQhxce9sKDdqvPLkgI437YypMrKbYxUaPhDCGyMxyaewXZVUdcd8tbZAzqkaZKI
         C9MpDcFi3eHy2Np0yeeHIjt6tAMfMlxLWtZBX+W5Tb9oUME6YalO8Cl+2UyszUMSIiFw
         wRZZX1r9aE1yQWHR402+iA8SWD/D9AQbVL+0YKmjFPRuBFYuFcWIwQbNqQquci+gAqTX
         Vt8+sKkvotYx0QXeIr8Os86DxhRQQcIQ7q9sUkE9LOijaViykqUJQdUVoVvu9kUIGP0F
         dlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617630; x=1752222430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MAVLF41QmphRvqRBx4yeoftDy/YqQapTAiNPyaFzl8=;
        b=trnVOYnd6hxgGqhzD4oR5Ag5FLkHrnKv8s1fg4aX45UwVZRoP/o4XyISc4JB4O9YUD
         7TKmDyZXg/EL4C4/osiZzTO9HeK1M6n89w/i+HMBYp0+lsb5mz1NWku8Uzu2VZph652p
         +uYXMQPEh8BLhmm+cFvpbDu4h1LQVLy/8WMYY+9Fg4fg5vLSR/o3YKfoMil4ZgmVVVR0
         Ei6GLIpgoeAib3SRWEbhoRkR0IqKnjxNkVv/Jx/5dlqkXm45ZXBtOQ8m2cZa/sAFVfkD
         LhWMCmb2TMPfRFr5Yeqp5GQS3Yyt3iUQhuKRn52jrKQBVfo9gJ6OMUSiCGYc3BKP82ko
         9RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1pkJIV+Z0zw/gLNpokov8cWG0auCScOpm8SRnltea+Gctyc3m9C2tywqumEQOI6V0mR/dc9C7sKf4@vger.kernel.org
X-Gm-Message-State: AOJu0YwHS+Lc3LOER3WWUQBB3SZBplzZowVA8R53ltJ/57jzy2JGLulp
	HUKVvqLna+pe3UJPlzvtn1B96AdJq7O480zGRwv5Z9NPIcCecbK4v6t6O7WDzahIv8MpHQlTw+U
	nvx3zSpH3c2z1AVp+Hl0hTSe2JzyFITY7G8ZNFW9pkD9F78UdW6hzLno=
X-Gm-Gg: ASbGncszXkrHoATP6iHUEfOuTtHfGR2797v/E8qlrkmKz/ENVM8taCCtFAEuNvO2L6o
	uEpakaITnXfz32SQR81JpEciofyLD8UNh07SAqtJEsB3/Ln74Gb83XA11llf91BoCTAJMgERF2Q
	Zj9Fbdim2zR5EpEEZR2+PKrY028L+B4YFS2dy0a18jI/Fak/6OKSBQYBWqEwTaA6IFuV3bhWYPj
	w==
X-Google-Smtp-Source: AGHT+IFs9a89t3WB+Sx+Cdpp8ljm2QeBOISKgp49Ml1f7/SqzSNJCWirzIGOCGoUWJUDcONIPDY/mAc44F8rbBRpRLE=
X-Received: by 2002:a2e:8a84:0:b0:32b:50c5:2593 with SMTP id
 38308e7fff4ca-32e5f59c739mr2995621fa.18.1751617630354; Fri, 04 Jul 2025
 01:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703191829.2952986-1-hugo@hugovil.com>
In-Reply-To: <20250703191829.2952986-1-hugo@hugovil.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Jul 2025 10:26:58 +0200
X-Gm-Features: Ac12FXyuss_6x_4e0DROEyXhPHF7MGwZ75tlcuNi7uvqnc0xqRBj_OAhsSL1laQ
Message-ID: <CAMRc=MdP5BMVF0p5W9qSRZuPKBa0YCTxB-gLQWT_r0hBp+8ksA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix efficiency regression when using gpio_chip_get_multiple()
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 9:18=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com> w=
rote:
>
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> commit 74abd086d2ee ("gpiolib: sanitize the return value of
> gpio_chip::get_multiple()") altered the value returned by
> gc->get_multiple() in case it is positive (> 0), but failed to
> return for other cases (<=3D 0).
>
> This may result in the "if (gc->get)" block being executed and thus
> negates the performance gain that is normally obtained by using
> gc->get_multiple().
>
> Fix by returning the result of gc->get_multiple() if it is <=3D 0.
>
> Also move the "ret" variable to the scope where it is used, which as an
> added bonus fixes an indentation error introduced by the aforementioned
> commit.

Thanks, I queued it for fixes. I typically keep local variables at the
top of the function (just a personal readability preference) but since
this function already has scope-local variables, let's do it. What is
the indentation error you're mentioning exactly?

Bart

>
> Fixes: 74abd086d2ee ("gpiolib: sanitize the return value of gpio_chip::ge=
t_multiple()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/gpio/gpiolib.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fdafa0df1b43..3a3eca5b4c40 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3297,14 +3297,15 @@ static int gpiod_get_raw_value_commit(const struc=
t gpio_desc *desc)
>  static int gpio_chip_get_multiple(struct gpio_chip *gc,
>                                   unsigned long *mask, unsigned long *bit=
s)
>  {
> -       int ret;
> -
>         lockdep_assert_held(&gc->gpiodev->srcu);
>
>         if (gc->get_multiple) {
> +               int ret;
> +
>                 ret =3D gc->get_multiple(gc, mask, bits);
>                 if (ret > 0)
>                         return -EBADE;
> +               return ret;
>         }
>
>         if (gc->get) {
>
> base-commit: b4911fb0b060899e4eebca0151eb56deb86921ec
> --
> 2.39.5
>

