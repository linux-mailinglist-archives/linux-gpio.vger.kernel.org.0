Return-Path: <linux-gpio+bounces-2241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90482DD0B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 17:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1C01F23969
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 16:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA240179A6;
	Mon, 15 Jan 2024 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ma753VL3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AF179A8
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-467a7a376d5so1593001137.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705334956; x=1705939756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHY6qSj60WLKcwOkNkwdEjKhlWRAtMT+Hv8/fRLKmUk=;
        b=Ma753VL3o48fIdN96fUvbTFU4+8eHr9IAbzLYKdYXZ0HsBTaD0vuDm9PikJWMxrkts
         6PDcV2lsd5HFiyy/RJs/QHOQzuZEHRmsozzaysOVPnwDydcUZlivSHgTPkZSCmT90wtE
         SDlwrOLRRbG2MT474LEi7SxSOY6Sl7DnSuS/kQlWxVWzobNKARpW3Il7i4MJqU/39GsQ
         /D6z+CVFOp4OmAn8F+G9mDh7o54HdzE61nlHsb060EbYLmIbqfqOumCSxu70CYGTQLEq
         01GA4+960CGGChesHTTRLIXZ59ZeRkMyu/usuzTGjjXIBGE9T8iiHoQZvZAOGHRYzBhn
         lk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334956; x=1705939756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHY6qSj60WLKcwOkNkwdEjKhlWRAtMT+Hv8/fRLKmUk=;
        b=ILyQ7g7rsqU+ZVLNjH4cG1mVPRkj0/OYBy/TxcuIqYKq8vKj+w41p8KpfAUcci0ZyD
         H6Frr6sYoip2KqftYGI5uyZvgee6FcT0FDaQGxj8atr4vyDJ7SLyP/S7jGPwFAMMP04s
         3C/g8L8QnUq2uQ23W3T1rsqHe0Op/0Rlmzfkon63qQE8Tqn6EDzNJ8AfqstJXJe+QyfP
         0IvCrLD0FQIiepJb7GosqDJ8Gn1pim3dA5QdHoW2lmFjEmNuajJjh18nnyQghu9BKYP2
         w963ShfNYdYa0N3aEGjW4WileSH0MRpd44ixhCMnV64eDGd7FuZM3drZ8O8DTmBz+a88
         Dw/Q==
X-Gm-Message-State: AOJu0YzYEOt9+1YwFih/PyqOydRMhMcFJw2aExjCUd3yPj/3nIVuYc74
	lZIhc+IFcZDtzvLhmzsSlirW8wUyFpLtIlCirtIHF0LM6GAt9g==
X-Google-Smtp-Source: AGHT+IFQvjnXCNJLhqIPod12wVvi73l2PL23s89HxNuLLaSegF+lEQg1m9bfivhn1r9Vz1MnklHCIYytxMlvHloRebE=
X-Received: by 2002:a05:6122:1c8c:b0:4b7:23f0:d2f8 with SMTP id
 eu12-20020a0561221c8c00b004b723f0d2f8mr2385738vkb.21.1705334955793; Mon, 15
 Jan 2024 08:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f481d5bff884c16606cbe577e707e1c1c0e6ccb2.1705330861.git.lukas@wunner.de>
In-Reply-To: <f481d5bff884c16606cbe577e707e1c1c0e6ccb2.1705330861.git.lukas@wunner.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 17:09:05 +0100
Message-ID: <CAMRc=MczKMSY48y3xC-0rah0sOP_OP1Ln1qu_QCCen504q5Xog@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix scope-based gpio_device refcounting
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 4:05=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> Commit 9e4555d1e54a ("gpiolib: add support for scope-based management to
> gpio_device") sought to add scope-based gpio_device refcounting, but
> erroneously forgot a negation of IS_ERR_OR_NULL().
>

Ah good catch, thanks!

> As a result, gpio_device_put() is not called if the gpio_device pointer
> is valid (meaning the ref is leaked), but only called if the pointer is
> NULL or an ERR_PTR().
>
> While at it drop a superfluous trailing semicolon.
>

While not strictly needed here - I think it's better for readability
to have a semicolon following every statement. Any reasons for why
dropping it is better?

Bart

> Fixes: 9e4555d1e54a ("gpiolib: add support for scope-based management to =
gpio_device")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  include/linux/gpio/driver.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 0aed62f..f2878b3 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -614,7 +614,7 @@ struct gpio_device *gpio_device_find(void *data,
>  void gpio_device_put(struct gpio_device *gdev);
>
>  DEFINE_FREE(gpio_device_put, struct gpio_device *,
> -           if (IS_ERR_OR_NULL(_T)) gpio_device_put(_T));
> +           if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))
>
>  struct device *gpio_device_to_device(struct gpio_device *gdev);
>
> --
> 2.40.1
>

