Return-Path: <linux-gpio+bounces-16586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D18A44BC0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D93FF3B43F5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F6E206F18;
	Tue, 25 Feb 2025 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJCCk64y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0A15E90;
	Tue, 25 Feb 2025 19:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512763; cv=none; b=VZNVOEE5K5nXodzkrs+i+J6xXlJhgGaflRhwQ2cdh16N8wMBGyHvh1TACJgmh4TGKPvNBm0LwuwvGJ3+B6af2nyyoORa5eOPKpx1fef2wYXqUbWNFwhdzSPr+pIAr2jKeCD2VkX9m5hvdPUfkfRvux8w9f2hNsp6XjWZY3MGSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512763; c=relaxed/simple;
	bh=3zn82jGPjopf3LLg6/Fmo76L2Z7LOsPw/bHR4evx9UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2pCHH/lq5BjJN/DS7EZTWq5wpiZ++vS+zm4Ai1RyqMrg5z4InNQnCJ2J0g2UBx2G1Jyw/1CmkQymWFrFTtfFgBo0PotZrXpE4pY3L56MO9f58y9BfFg9ViuUBo0j4y/qd0TvcRK0PmuIkqqOc3FDZ17mm2dRo/In/y4xDassb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJCCk64y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE1FC4CEDD;
	Tue, 25 Feb 2025 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740512762;
	bh=3zn82jGPjopf3LLg6/Fmo76L2Z7LOsPw/bHR4evx9UY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJCCk64ykHWyO/voBh20RMVpuwN/m+AkBlLK+IRqe2H+njPAdD438nfqILB0Ep3Sa
	 RA4Jd2ZtJwopzpSzoR8VCoIVtST900Aa1UBtXCieelZiFQizaAP2MFdJZjSBMuLk52
	 5bhU3pky4MSCQs+fwBCH5BCmoNAzRX6kEF7PsUsW5ofTYSfcGMbHda/rVsoL06jg7U
	 6gfjs1FdFRMV1qK2/MjChLdq8Y7DqQRcr1ktKVsUlTxW9c94MMz5XBLGgybF657qrH
	 6n40sD45gwS3SmQ6ao5peeNMnaGcVHZ/DBk4Q5HPLIQSrqRL81ZStJvqVzJ+CJzZpC
	 E07TKJMG5cGTg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaeec07b705so1002824766b.2;
        Tue, 25 Feb 2025 11:46:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUts+8tPvQSSCu6yuLKJ/kp7COYQSnVP+kpvA46/f4nWq7q6fAQUjEXnHqaC1dhrP4EUaQ+GXc0wSpW@vger.kernel.org, AJvYcCVGxLMDTgXhKn9TZ658/8C6XGWsRD1nZ0Oj97zzTRCVQmVkUsIEwe7Gm7AnSzmruK4exBA/1XsE+NZ7FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5jd1XKDddBg2ZcyDkAb7Lqr0grbcxZBFEE5JOPRwpTm9nA66
	I0BriFPIVnLsaDifFT70Rf1hUE5m5U4DwJcqEI3ESd4KwkrQyXJtiCt12iOes4bk8T4kPysBLdj
	nY7w+/qFpKV3fPpEPdr21va8M+g==
X-Google-Smtp-Source: AGHT+IHK4t1drMRY1wsfVnmqsofjdhRnfZEXksr5Jxq1Y5dtmi9uC6/aT5L0zo4z7Lz/lFtXu0pggT4ltG6XlL4TCF4=
X-Received: by 2002:a17:907:7f26:b0:aba:5f40:7f2e with SMTP id
 a640c23a62f3a-abc0de0de78mr2109325866b.45.1740512761272; Tue, 25 Feb 2025
 11:46:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org> <20250225-gpio-ranges-fourcell-v3-2-860382ba4713@linaro.org>
In-Reply-To: <20250225-gpio-ranges-fourcell-v3-2-860382ba4713@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2025 13:45:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJEf4AUq-b2FMp8kCT9x0VuocMeZ92nt2QVoEe+m1eUpQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoGeJ1ojM6DcZ7DXKJvxjPuCL0Kw1v1y0oIQO6BvAVaPKRN0Y95VDOZnHo
Message-ID: <CAL_JsqJEf4AUq-b2FMp8kCT9x0VuocMeZ92nt2QVoEe+m1eUpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: of: Handle threecell GPIO chips
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 1:40=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> When describing GPIO controllers in the device tree, the ambition
> of device tree to describe the hardware may require a three-cell
> scheme:
>
> gpios =3D <&gpio instance offset flags>;
>
> This implements support for this scheme in the gpiolib OF core.
>
> Drivers that want to handle multiple gpiochip instances from one
> OF node need to implement a callback similar to this to
> determine if a certain gpio chip is a pointer to the right
> instance (pseudo-code):
>
> struct my_gpio {
>     struct gpio_chip gcs[MAX_CHIPS];
> };
>
> static bool my_of_node_instance_match(struct gpio_chip *gc
>                                       unsigned int instance)
> {
>     struct my_gpio *mg =3D gpiochip_get_data(gc);
>
>     if (instance >=3D MAX_CHIPS)
>         return false;
>     return (gc =3D=3D &mg->gcs[instance]);
> }
>
> probe() {
>     struct my_gpio *mg;
>     struct gpio_chip *gc;
>     int i, ret;
>
>     for (i =3D 0; i++; i < MAX_CHIPS) {
>         gc =3D &mg->gcs[i];
>         /* This tells gpiolib we have several instances per node */
>         gc->of_gpio_n_cells =3D 3;
>         gc->of_node_instance_match =3D my_of_node_instance_match;
>         gc->base =3D -1;
>         ...
>
>         ret =3D devm_gpiochip_add_data(dev, gc, mg);
>         if (ret)
>             return ret;
>     }
> }
>
> Rename the "simple" of_xlate function to "twocell" which is closer
> to what it actually does.
>
> In the device tree bindings, the provide node needs
> to specify #gpio-cells =3D <3>; where the first cell is the instance
> number:
>
> gpios =3D <&gpio instance offset flags>;
>
> Conversely ranges need to have four cells:
>
> gpio-ranges =3D <&pinctrl instance gpio_offset pin_offset count>;
>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Tested-by: Yixun Lan <dlan@gentoo.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c   | 95 +++++++++++++++++++++++++++++++++++++++=
------
>  include/linux/gpio/driver.h | 24 +++++++++++-
>  2 files changed, 107 insertions(+), 12 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

