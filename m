Return-Path: <linux-gpio+bounces-23805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A607B11905
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 09:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A545A28D6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 07:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC468291C36;
	Fri, 25 Jul 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IefQfCl1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E4293B53
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753427629; cv=none; b=eQlaSnsmT3LNOA/rohN0yA/yD5d+Tw9f5JssAOzfXPgOp9RJv5MNMk1ky1nSvhiaU+I/RR96GEV0JfTqnl8j90SrmjzQNe2sGsP77foJjC48YV4coVxx/vZ4dLXvuyXwsQRBGB/4fVTNF/XDqhzOKDyzA8E4MfWTaVDeNJTtCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753427629; c=relaxed/simple;
	bh=imITYj2G+YoaFjDER1a1EwVwjIkre387EzPsTjWeJm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJFAWe5rqD8RbIpWOyfRyMZGh3Vj8uKLiN0DlANKP5vITNN8RwQZejC0h+QQV9aU67FkJm/lAid7sTfCMi8D/6stuFquattTw3Qq4EF/Qp2ZOteKLRPQ2cSUbmWMVsXm9BuhXHubk2fu81sUs1VVIgi6ELWhLJI2eoNh+cbTjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IefQfCl1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so18831501fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753427626; x=1754032426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
        b=IefQfCl1f0WmcfHpfBR0B0KcPsR1EGUX3H/2Vv/2WT2I2tFS5NBYCSbGzBK+Dg3FW8
         FXe3khn25WuVD9Lrn9zhse8ZB+sgdyl61oRrnK4GD02I4ZuK8obRulkvpSsKmMcWmLYp
         1U2LsLxDMaAh20bed0UuAhxMZIoWNvux7Wl6gD7j2HqKfGBH/JmhFKKpRjcwZYGlqWBa
         K/bM8jEpNE5vPmtruro2xritSFLN9cHv1IHEmFs+DtS9qJlcTchTf1c5tPhj1tgXvVih
         UhNuafmUbAjujVduZ06UVZRYYXbHqTfxnhfEbnz8h/yuRoihFVDoPcSIyoe27EVtV9V6
         fYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753427626; x=1754032426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
        b=AiCDd9F4JdkO5BV5z8AKyjfvOfiapO1SLci1bXxM2Efi/ftWvf9x4zEAYAV4+RDfFz
         WT7MuhxK6q5YADiY0wvJZj3DSbAQrpVdmz2S5TxL1ylZVput2rVldCrhMzjadFzwEacK
         xnpG+JuOpwf4SHooqpjMpDSmoOOpwK2wAkv2Ezbu1PvbN96Ytp/OjPILxiCerkqKB8Mq
         hdHwxbjULxKa6UL2RPCNia85qckv3oituCXbdk8++f1s19Tflvy1PkBi90lzX/cJlRWQ
         HOQNJNRNxyYF09BZ7t1a3zsuMi1HirwguK3l3CX1mSyw16gPdoOUPftNb6x5LjoIL+ff
         DqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW338B0M/CaS5vnXA7snOlQOKH0g4k2q6/gwmispLQyucYox9XlJB2sIxjfEA4e4z1bKsTjZnClZxqb@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGy3ZVLz+r84xK+bAF5NDgyqVrXw5w/BVsLdexnZSmHtXTHd/
	MlizU6AWo+RVMpto+3oJzWPF9Zmu0Y6aBjCKpSzMnG7CoKJ62F/BAxaNafeISB1orREanwhFzFL
	XZa8iqsnKeFILG7Rf7SXAENCSfkbuLBlYnSf+rB/UeA==
X-Gm-Gg: ASbGncs4zkrDmWbieWJn8DRs3o8iMYdkSUquPr1oGpdnfsk7/Pi2Ckv5a/jpJr1xmBf
	C/t/3ifrEBAlZGQlkqTflu0vC2/hOseAY0p825H3Iql5t3KwVOiC7FjyxWpEmBjAzDKP7CleHcz
	1KqlPHCWOcNiLqXCRgfZ2y2fCAAo0H9LPgvX9Tg4FzXkAacvZD2/J+DdgdmjRLTP/dAF7AciyCb
	8uvxJB8BdUSnKE6oY/QtG/GcboJUm5PnsbfO1Ggtc2J0/CA4Q==
X-Google-Smtp-Source: AGHT+IGZ6IpSoNGJljT1FXr2JWFQwLBJcl/zkngQEk6KemDtXvzc434wLZBIztSCj044zT6GZ+DEkjAHeT2KYoDAfi0=
X-Received: by 2002:a05:6512:4003:b0:553:a4cf:2106 with SMTP id
 2adb3069b0e04-55b5f4ea71bmr197629e87.57.1753427625388; Fri, 25 Jul 2025
 00:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Jul 2025 09:13:34 +0200
X-Gm-Features: Ac12FXxdj3cPCvNBd3Lm4-GvXKqLYsKZr59Agf2YhP9X2Y28_xXRSYG4_XGAoZY
Message-ID: <CAMRc=Mew_F9ngFSNSyPL8ecm9ZgivYkbJg-jYghnWPGuy4pwVA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: stmpe: Allow to compile as a module
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 7:52=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Add the necessary boilerplate to also make this driver modular.
> This follows commit a2b8191ab695a ("pwm: stmpe: Allow to compile as a
> module") which does the same for pwm. Also add OF match table for module
> autoloading.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpio/Kconfig      |  2 +-
>  drivers/gpio/gpio-stmpe.c | 19 +++++++++++--------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 500d839f65ee8..0621832d045fa 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1559,7 +1559,7 @@ config GPIO_SL28CPLD
>           called gpio-sl28cpld.
>
>  config GPIO_STMPE
> -       bool "STMPE GPIOs"
> +       tristate "STMPE GPIOs"
>         depends on MFD_STMPE
>         depends on OF_GPIO
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index 0a270156e0bea..db9f4cd1e8615 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -534,16 +534,19 @@ static int stmpe_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio)=
;
>  }
>
> +static const struct of_device_id stmpe_gpio_of_matches[] =3D {
> +       { .compatible =3D "st,stmpe-gpio", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
> +
>  static struct platform_driver stmpe_gpio_driver =3D {
>         .driver =3D {
> -               .suppress_bind_attrs    =3D true,
> -               .name                   =3D "stmpe-gpio",
> +               .name =3D "stmpe-gpio",
> +               .of_match_table =3D stmpe_gpio_of_matches,
>         },
> -       .probe          =3D stmpe_gpio_probe,
>  };
> +module_platform_driver_probe(stmpe_gpio_driver, stmpe_gpio_probe);
>
> -static int __init stmpe_gpio_init(void)
> -{
> -       return platform_driver_register(&stmpe_gpio_driver);
> -}
> -subsys_initcall(stmpe_gpio_init);

Please don't reorder the registration for built-in mode.

Bart

> +MODULE_DESCRIPTION("STMPE expander GPIO");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

