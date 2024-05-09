Return-Path: <linux-gpio+bounces-6280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AB8C1036
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 15:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F313E1F233B2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1025C152780;
	Thu,  9 May 2024 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iAw0mF/W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4E131196
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260519; cv=none; b=cT9LVLYBgoEz2HWU5UR6gj4YXbY8Lx9HxYF0LJ4h98twPP9ooNZ2jmkRlIQcnhW3CdDjB15/P0WvoubEXntbyZAw7UB2p/nWi7D/5gRt9ug0sDkK4UomX6zqsNIpUGcVKO9sVvVUY5HLCzxqI9/2wvKxuJuPaz+O3aIscD9qhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260519; c=relaxed/simple;
	bh=deh38sl8gtPxn5Ef8ATAgdFhTcZnpAgavzQqq3q3E7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jitwx0FAB0BfhfWRiqxetA8LfS+Z8zj9QDLfklAcoH1wt4EI4rvlTt+zTq3sQG4AMyKL3exJsKe2JOiRWhn+kcn1FQ0QsZk1cS0QKRpKlUklTnsrlGuLpXDuxvapzk3nm+5Vtw3cJkDJ5H1OISAgR91rHDTmTeH4/cE+JjK6CGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iAw0mF/W; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f1e8eaee5so1783180e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2024 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715260516; x=1715865316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGnRyk7jK+vlhEgh2IyZijiUZVvO/Bb03W2xW+oA0os=;
        b=iAw0mF/WqQHUelwEcjjHZLZ2+NSMxyjrGg9+H+3jZF4sY6CIf5L6YAhrF1icGFezh4
         Ke+8pWXYJFj3wFovwoUQs0juNx+moqU7kcaBIK4Ey/bOsARtYGLWZmbaH0bhMjmuZzPe
         /h1rRkoWOIlxmN4FQZH8Ldj3Xgv4R52+nEyncPURX+JJbwAc842i3c6k+QF6HXjvzyjZ
         IqlkqM5xgviWIMoWctqE/Yh1JjJBeqgNGj5rFr6lijwmt8NRR9xcnAt3bQEX7Fdi94un
         LUL1ydFQg5+6hFnFt7Unjr9JBk2zBYBl863iO1fwOQyBCdeL3K7LOgQeQwEv7z9pmFMA
         p7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715260516; x=1715865316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGnRyk7jK+vlhEgh2IyZijiUZVvO/Bb03W2xW+oA0os=;
        b=H0P3IjkR4dfsuksKJaZ+qJvRkd19LATZQVsyNR6oxnQD+Pw68+eoJKECpR9fxN4tDq
         KtylTDFmgnozO5SnNDOZKjMktnRGyt1L7gH+8cVwW+DYszFeNlG8YfFycLbU+Wzkqhs4
         woJ8r8I6qiEHYCsQOASBa1FRmf1/U2QOVL3TWqJWBHfhFofNnM6DwkLIK5DMyuMAJmx4
         U7knDmRe74XC+NXrk/aM3VMnIoN3yM+lA77WeUzef5jOmPNMXk07j7VPSQLz8hEKM/jn
         FR5JXeLknZurDEHsl/xjFKVT+IE5tLJF+FDm7OtQIGMuYo5s+//DBI8e+NbuzTJ+uLGD
         h2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU3u7ZEwR6s5GOST4/eI76gXv5Hx6TY6l7yDu0V8KaQvklipIiwaEjxHmcNXTl8Fq7XUVZ8xQ+4UdUGhxQmvBwwV9u/WoWrmthhkg==
X-Gm-Message-State: AOJu0YyF5mzGO1COxi7B80MPn8jcgHltEYJMdQYFFYIOCGY7/MwjR/96
	G8u/wRrFPIJeksURGU6kAX0inpNVqscDgI5jfMjvm9E7c7rErtzWaf8MWfUkOUJbSwhdfWGkwc5
	jT7V/Dv1B8rvpYHtqkloZxqQ6OVn9tZaKEGZD+9yxMiWeNf+4dAI=
X-Google-Smtp-Source: AGHT+IHGsomW13aexyYBeJs+GxD/cRNTvYPZExOid3a4NkRXbhRaRPTDyXT5jlunZpKq5+6sovEgOO7BFNHXLt/UYVo=
X-Received: by 2002:ac2:4e97:0:b0:51f:3e41:efd8 with SMTP id
 2adb3069b0e04-521e0f52ae9mr778052e87.1.1715260516566; Thu, 09 May 2024
 06:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 May 2024 15:15:05 +0200
Message-ID: <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 4:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> If line has been locked as IRQ without requesting,
> still check its label and return it, if not NULL.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index db536ec9734d..1f1673552767 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -105,16 +105,16 @@ const char *gpiod_get_label(struct gpio_desc *desc)
>         unsigned long flags;
>
>         flags =3D READ_ONCE(desc->flags);
> -       if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
> -           !test_bit(FLAG_REQUESTED, &flags))
> -               return "interrupt";
> -
> -       if (!test_bit(FLAG_REQUESTED, &flags))
> -               return NULL;
>
>         label =3D srcu_dereference_check(desc->label, &desc->srcu,
>                                        srcu_read_lock_held(&desc->srcu));
>
> +       if (test_bit(FLAG_USED_AS_IRQ, &flags))
> +               return label->str ?: "interrupt";
> +
> +       if (!test_bit(FLAG_REQUESTED, &flags))
> +               return NULL;
> +
>         return label->str;
>  }
>
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

What good would it be if gpiochip_dup_line_label() returns NULL for
unrequested lines anyway?

Bart

