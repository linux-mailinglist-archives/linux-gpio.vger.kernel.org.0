Return-Path: <linux-gpio+bounces-1978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAC8229D1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 09:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554EC1F23D4C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E498E182B6;
	Wed,  3 Jan 2024 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUUtY0F8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CF182A4
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5e7f0bf46a2so83976927b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704272187; x=1704876987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tzXmJg9q/TEPH8vMAiIdPpmy3D/WZd5MqG19qzYtfJg=;
        b=gUUtY0F80nle3WnUSmjK0lRyc0DCWVzNa78QBJjq2iugGLdOfMgd5wNHfDhBlmUXiK
         QsxuAgyyGbPf8DCA2HI/YqcDaZN7IH5z+OBJHLSlEZff7+TcwChe+t8yNaAXB/J/xDgz
         WrXYWDwf/EI7SyT2AirPQTVO8jz6QEetgIrcQW9K0eIAigvwguzAyKJQ7/H8QdNc4uoB
         5fYu9BCv5lu1lKm2BXTtKPlrd1T4DPVEwbEviIQafSGy2Vh/52vzym5IzMzgfYBWK+MM
         CTElDmuy11hWeTNjIE0eiSsfMCFi1sZqhGHtjdcg/1BZsLAgTQQY6OxRMZhgxa2fda/N
         zoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704272187; x=1704876987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzXmJg9q/TEPH8vMAiIdPpmy3D/WZd5MqG19qzYtfJg=;
        b=BVR3MSdbwgO6A+zuSivDO7153a10GIbMGDFj/jgzZIslHz5j9rcHxqC6TM8YJXSAL2
         Jsk1jwO1SSxzTo/JSVaZIotuBwHZzDH2+KJk7haa4bo3+JUewgc5iZupsDnRjK9MQrAO
         RMfe5tNYEtRkOSG23FCkWdMjk2o+zdDo2kYdSGFKLiZ0DgWtkKx8haRwW5lnhepN5nAl
         a+jVvUrQpLzbZrDED5XH5A9F9dDIFaIbx7e1ISpxmTo+W+Jrp/KD9DthoFC4RS0+JQgb
         UDF97YPOGyWwSfY/ID96RfyXWDZIqtSjYmJ7mzHka00FLSxarl8U0XbQOmBbNYhq7K2A
         2K7Q==
X-Gm-Message-State: AOJu0YxOHBUbZLAT6l6Peq77qZl/xORKoNYtHT7DCTTzU2N4S5hPgGXI
	nLYPq+JY9t8CkMfIlrhYvx5eI4GU8ingUb/DEuDyix8KS2feAw==
X-Google-Smtp-Source: AGHT+IF4WrM7sBfrk0tR3OteyYEXhhRrWcCjLgeYlF7JPOuAqw8QBcUyT7zrFXSwMTQm7ulzLcp1XD7xSNsgLRXA8Rk=
X-Received: by 2002:a05:690c:2a46:b0:5ee:6403:8931 with SMTP id
 ej6-20020a05690c2a4600b005ee64038931mr5109646ywb.55.1704272187368; Wed, 03
 Jan 2024 00:56:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103085058.3771653-1-nichen@iscas.ac.cn>
In-Reply-To: <20240103085058.3771653-1-nichen@iscas.ac.cn>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 3 Jan 2024 09:56:16 +0100
Message-ID: <CACMJSetTdEOVc5S2tCNzXy3CFmNq+Dh-tB07Kfgw7C3EfEbBSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Return pinctrl_gpio_direction_output to
 transfer the error
To: Chen Ni <nichen@iscas.ac.cn>
Cc: patrice.chotard@foss.st.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jan 2024 at 09:47, Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Return pinctrl_gpio_direction_output() in order to transfer the error
> if it fails.
>
> Fixes: b679d6c06b2b ("treewide: rename pinctrl_gpio_direction_output_new()")

It doesn't technically fix this commit as the return value was never
propagated here in the first place.

Anyway:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bart

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/pinctrl/pinctrl-st.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 1485573b523c..5d9abd6547d0 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -723,9 +723,8 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
>         struct st_gpio_bank *bank = gpiochip_get_data(chip);
>
>         __st_gpio_set(bank, offset, value);
> -       pinctrl_gpio_direction_output(chip, offset);
>
> -       return 0;
> +       return pinctrl_gpio_direction_output(chip, offset);
>  }
>
>  static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
> --
> 2.25.1
>

