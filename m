Return-Path: <linux-gpio+bounces-16302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F04A3DB31
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BF4F189C405
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BD91F8922;
	Thu, 20 Feb 2025 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2KU9Q+mF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757E1F8676
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057650; cv=none; b=pEie5kiMM/G2cd/bTxu4Ld0zX8onukV/+bRZ5bXT0CizLRCSzPTSsVsEyDVFP9HsSTkdouxYSinTsX9opK6iMlr5N319VlYRSDprqxfFeSpLR1Us0yJVCwS7F1hpmYSqDFwhghXDLaUqPlUETQGoHcxSSdlePBsrR5pxEzcWgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057650; c=relaxed/simple;
	bh=6fZMCA9aOaCmUGfLC6ePf8dOM/mlXjQAuIm701fRQSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zeg7WQ8TMgDK9CCcvYa6YeuEr/e9ggYhbx0EdyecaoPgTJ07jSC6hT7MHxcP25dij4gDGHoYZ9YpFrdLuTvFzcqyRiWVrwYOfnB479grKmG4wngMtoFEMiRhwEcTeFPV8DMzh7KOn6uzzjCUUTkuTjjXpiqzSxzJaNUI/9ncq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2KU9Q+mF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a6bso9158021fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740057646; x=1740662446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9gfnrwEcsc3B+OhnBf4llWg9LYJEF0Gi8abOqkWDME=;
        b=2KU9Q+mF1u5RxBFqhiSbJYJ3QlHD1k+liZRL6YfodEgvwjern98SoFPsM2yJ2og6co
         g2OBKbWSRbMxNmLdZy90PAeHboQhy7SMl1M62ODaWNhTDiLY817K+fPbMTpxkizyGnGC
         tDq/+6H4PuWwJHHguyKnnswr9obJaJMG4ufHA0vD+LcmJeKq4UxHuIzHm5yAMGTPGnwe
         tiUVyUJKLq6KqrKpwRlYOCWclOZWU2ykAY3Hw4R55irV48ojM4jOHdSbuOfT00NWsXld
         bZBQisapwnKXJh2o1NcOIDjX8sTxl2fDea1NwX/zqxqFPrgwphXPY3LS1Wbi5NWJI3lI
         COmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057646; x=1740662446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9gfnrwEcsc3B+OhnBf4llWg9LYJEF0Gi8abOqkWDME=;
        b=MvxwW0CosWG7WRUj8/JxkR3apZ8Ktx7+Mb3it/9EbflAt1aAeK0bRuitIpEb12rwyg
         rESpTp6KHG2Klj0PNlQGg2FQ/yCo1XguH4eptzI1oMR4+0Sh4AC7f6FSRdUh3dKcUvFv
         B4/U8aCotLEfDm29DJLU3BXq0T1QtqMlKgljcDzgr7JHEjLcjLekPRPmtWaJEhiFLx7W
         dvGGpMfHcS/umMKZx4E9Ds4vwPO8Oe+SvkHfMCJH+ObjJX7N4lOSFD43lJy7LH83uzUj
         svWAkABlUKXvM9ZIHMH51VMxiQl4UWg3qVwtgOs0dApPXjiSvJxrX5IavHo6m9LVHGoQ
         9o+w==
X-Forwarded-Encrypted: i=1; AJvYcCVX9OPl4Zt0o5KJ9Fn12mkwiByba7V0yfW1Vq0f2VsmKEhNeNqsWbZVbA84ajCQXH638CmQ4mrNT+2l@vger.kernel.org
X-Gm-Message-State: AOJu0YxWE4HRzPeJq1G0MQQd7ffZYUnkpEdC5UGeJs8H2iTm9G7Fh2/8
	87ADpq/lSJhezIvE6bSPBdcZ5zMf3WKGZuJH0YozhJznYlU4uRc83blQyEiSRK0Oo7kjaA3bFLx
	zqW3NsTbW5JdLpJaymawflGA8dZ9q+veOGnsPztHwVYcZ3qPKbJE=
X-Gm-Gg: ASbGncutwkUtuMT1MltXxYGpAWKF0IZeRvfftmUQMMUiNPNGvKGDbUnLqx2Bc1SigRJ
	DsgWEVSu7m0vy1pfsreyn08YPLMyP73BaTr7Xe5HXCqIUp6eA9EWbQIsh1b7Dd6gBTrqjgK0fDw
	F8m0o+KI6UaduIvV5sMAuBfzW522Q=
X-Google-Smtp-Source: AGHT+IFEIS4/ME3oDsWsGwJajDs1xfmNXc6nXNg/IrJF+sMVx4BssM06X90VPnH8MB49gtSoFXwuJyNa398yQTqZ8o8=
X-Received: by 2002:a2e:380f:0:b0:302:497a:9e5b with SMTP id
 38308e7fff4ca-30927a2cd94mr59656331fa.2.1740057646496; Thu, 20 Feb 2025
 05:20:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de> <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
In-Reply-To: <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 14:20:35 +0100
X-Gm-Features: AWEUYZlymfSucIw4j_zdhgZRq8kn25SIdhxYsprdKjRx2D6NlUzPc8TKOmwgyrM
Message-ID: <CAMRc=MfvbxbUv9PhxttB6LxkpRT=YEo10wfv2j_2rCeaNCJfrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most) PCA967x
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 10:57=E2=80=AFAM Quentin Schulz <foss+kernel@0leil.=
net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
> that is used to reset the I2C GPIO expander.
>
> One needs to hold this pin low for at least 4us and the reset should be
> finished after about 100us according to the datasheet[1]. Once the reset
> is done, the "registers and I2C-bus state machine will be held in their
> default state until the RESET input is once again HIGH.".
>
> Because the logic is reset, the latch values eventually provided in the
> Device Tree via lines-initial-states property are inapplicable so they
> are simply ignored if a reset GPIO is provided.
>
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..94077208e24ae99a1e8762e78=
3f0eabc580fa520 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2007 David Brownell
>   */
>
> +#include <linux/delay.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> @@ -272,12 +273,11 @@ static const struct irq_chip pcf857x_irq_chip =3D {
>
>  static int pcf857x_probe(struct i2c_client *client)
>  {
> +       struct gpio_desc *rstn_gpio;
>         struct pcf857x *gpio;
> -       unsigned int n_latch =3D 0;
> +       unsigned int n_latch;
>         int status;
>
> -       device_property_read_u32(&client->dev, "lines-initial-states", &n=
_latch);
> -
>         /* Allocate, initialize, and register this gpio_chip. */
>         gpio =3D devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -297,6 +297,29 @@ static int pcf857x_probe(struct i2c_client *client)
>         gpio->chip.direction_output     =3D pcf857x_output;
>         gpio->chip.ngpio                =3D (uintptr_t)i2c_get_match_data=
(client);
>
> +       rstn_gpio =3D devm_gpiod_get_optional(&client->dev, "reset", GPIO=
D_OUT_HIGH);
> +       if (IS_ERR(rstn_gpio)) {
> +               return dev_err_probe(&client->dev, PTR_ERR(rstn_gpio),
> +                                    "failed to get reset GPIO\n");
> +       }
> +
> +       if (rstn_gpio) {
> +               /* Reset already held with devm_gpiod_get_optional with G=
PIOD_OUT_HIGH */
> +               usleep_range(4, 8); /* tw(rst) > 4us */
> +               gpiod_set_value(rstn_gpio, 0);

Should probably be gpiod_set_value_cansleep().

Bartosz

