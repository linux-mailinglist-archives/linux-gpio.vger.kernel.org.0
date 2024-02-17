Return-Path: <linux-gpio+bounces-3430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF62B8591F2
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 20:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D5B41F232FF
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 19:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65B77E573;
	Sat, 17 Feb 2024 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Orb4N8kv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF06DCF5
	for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708196624; cv=none; b=kcn/ukV2uGtuA1xY+t/LjEKhYjFwC2v/iUS8XTVwcx543Sft4PBS8Yli039HzvD5K4y0qvVexmfgsRYx2DGpQWZrhTjbQOouriJSphvxLiTPemr/vzfmeSNts1rOqOBRX5IQWWdG6r2406G6mAXJw065nWYen/CQtldyhDELKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708196624; c=relaxed/simple;
	bh=AAnr2V/wjbiV6YtHuxAn/t5m7pz+CXEDnDMRlKCuoHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8ZExQ2e9fGRV89/H+uuTRJLS6bo2S6bnrELAaz3xQhAz8/14QSZFB0KckxjuZJKbz29phl/y90k4zIHC0Id7zzQNQujXA2cBTp/9RL/jXqUbrniKfVu/wEpmOPbH4+pybkss18cL1/CkkayJ3Plju1iee2vAIbN3WCGDtwIO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Orb4N8kv; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e2e42fb159so1465269a34.2
        for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708196621; x=1708801421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOn+Bsy7l6RfWFmq6vXphAJvxzNZMzFc4+lcGeMdTVQ=;
        b=Orb4N8kvcBriaOhGfc8Qj3JyJ6mqFptkkKdklcYDL+hzlVVBFq6cSYSmWNf2FBWKIG
         JCnKt1y3A4jGwWTp9RXyEzcQXH67XNJRwBL9/fhHgjlkzxSzzzTzecMW9lSrF5VXnSX1
         A4l6CK4+58+uVQpuHHx0TTaEWwQ9tNmANAMNux9cPHjTbIk6+e02MRGJ++17Hx09k3k/
         f8+oY3m+6XT/qq4YZjgni1Oy4QSHGGXMhpWBUUsIs3mfhW4JSiMoleb//CwJcHeLIb+C
         YV6F5tgV4xm1rcM/XpkX6fjtHZ+ygB419RMuUa/B7UsgK7oKN+gWPnrFal+vazrEqah8
         BwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708196621; x=1708801421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOn+Bsy7l6RfWFmq6vXphAJvxzNZMzFc4+lcGeMdTVQ=;
        b=jm47TL6dOFggb42XRcc5/n35YRYLZ0LMBJkxhw3SBJa40aO0f59bn8z7Zp0kPnApw2
         gjaL/xlVqDvPGje7HBaLp6nO1++urQDx8NAOwHFaZGgBO3okb5cEGHJAvwv2KIoaRtB4
         WewOa7gl99w8LBn1dQ0O3QcI0r1+0DrSRhHjuI3xHViDput61gfc6e9OoP/fPT9pvzvY
         PbVZOzT1hAnMQVtqouFpsaS+Srf/5epkjqgerNfUHNNLXtPqNJtCqVfJNyRk+4m3IUbJ
         kpCznz0LJIv6BxG2cay8PtC5AFsqYiZNabxDV3bAVqbTmv5ty+UFwtsWVftil41JKAV4
         gtrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0EMTgPEX7vR4NxemDIJ0ABbfhqauVLvD/Eehm2y+ce5xRZcy92bQmh7fM7V8gL4uMGe7Nj4BKQ6vDmp3LwvYYuD8wgNVLVRgfwQ==
X-Gm-Message-State: AOJu0YxZnm4XKQtmI1f/dyDp43M6rkUvgcfIeBpB0eUYjNv9ZwJ4IBb5
	mMLfElVNrvqUu2prVtJM2m74LXYW1giA2xyGobYgBXvPveUxpTAyB3LjKTkfLAhIQmtvxTDbp55
	bcZWvbTcdFCcQ28PUqcUGv+GN0+soLX7H6WWawg==
X-Google-Smtp-Source: AGHT+IHwg44JWZ/tfyLReDwK9TmmBxLy7cMx4rS+ix8ZOLzSlyYxFk2kOdn+nn1MzvZ/wN+UaSMTtKr9Eo3fzBOoGec=
X-Received: by 2002:a05:6871:d086:b0:21e:390d:8c0a with SMTP id
 mw6-20020a056871d08600b0021e390d8c0amr10082287oac.16.1708196621203; Sat, 17
 Feb 2024 11:03:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216135217.129795-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240216135217.129795-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Feb 2024 20:03:30 +0100
Message-ID: <CAMRc=Mc9vQwtV+Sa0aazq=A=z1FSbwK9rNayHM5Sr5Mt9oNOEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: constify opaque pointer "data" in gpio_device_find()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 2:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The opaque pointer "data" in each match function used by
> gpio_device_find() is a pointer to const, thus the same argument passed
> to gpio_device_find() can adjusted similarly.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c      | 2 +-
>  include/linux/gpio/driver.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0e332b24c7b8..8c9cb324b7a4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1112,7 +1112,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove);
>   * If the function returns non-NULL, the returned reference must be free=
d by
>   * the caller using gpio_device_put().
>   */
> -struct gpio_device *gpio_device_find(void *data,
> +struct gpio_device *gpio_device_find(const void *data,
>                                      int (*match)(struct gpio_chip *gc,
>                                                   const void *data))
>  {
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 51b23211794d..251a610f2234 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -628,7 +628,7 @@ int devm_gpiochip_add_data_with_key(struct device *de=
v, struct gpio_chip *gc,
>                                     void *data, struct lock_class_key *lo=
ck_key,
>                                     struct lock_class_key *request_key);
>
> -struct gpio_device *gpio_device_find(void *data,
> +struct gpio_device *gpio_device_find(const void *data,
>                                 int (*match)(struct gpio_chip *gc, const =
void *data));
>  struct gpio_device *gpio_device_find_by_label(const char *label);
>  struct gpio_device *gpio_device_find_by_fwnode(const struct fwnode_handl=
e *fwnode);
> --
> 2.34.1
>

Applied, thanks!

Bart

