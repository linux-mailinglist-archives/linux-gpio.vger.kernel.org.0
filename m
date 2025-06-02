Return-Path: <linux-gpio+bounces-20876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FAACABE9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 11:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE42B7A19A7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387B61E32D5;
	Mon,  2 Jun 2025 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NnyhKqcG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2E1E5B99
	for <linux-gpio@vger.kernel.org>; Mon,  2 Jun 2025 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857728; cv=none; b=dEzv0cnXOdXdTNRjacUzjyepo6QJNeQ+YG1hjye5+2LjNn1kewTiApEyLEXN/7ooQBmVi1Hot2vyhrNGakZX9vrBH+0oV/TjsAJ1Euw/I15Bd+4mVzeDkFUSjVeb6sPWIaQqHNkLEEiMQA4TYeSznV5pDhbK3eoLe0qqZGOWMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857728; c=relaxed/simple;
	bh=ZqAe0XxBRYxYACmyGo/2UtIEvjApYGwR2wXetHXMxwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT91SeNdja+m9jM0H/mde+PxuQMaw7JggCHXultdihJhQ0R+et/RVieb0vzb6y8pyfbNcH8RhoZ7wQ3FaxWbpq4WQSFkg8lVQZdTMHNULl4lqKN8buOQhD1kRWW2exgFtQYa8yY/dKVoODjpZClt5ys9mt73QPadI7P3QTV96sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NnyhKqcG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532f6d184eso5310897e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jun 2025 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748857724; x=1749462524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpFde9Lqa/a3If18OyyVampcrtgmxniT0nRXi/1rUjE=;
        b=NnyhKqcGdgqJiuzWDZuWt0uXApqdK3tuwbusZBdhwyJpJknXlsQSQLLB4vSNQJlLJy
         i1LgyR6I8guGipeYZKzux8SPqevjx/cLktdmqXPbyTOi+f0SqzLvlLQMmiGsO1rA1WJa
         f6gtWXeqFdh9bkvirtPiGaeDaG5oi/qyTQbcJlzZwnVQBs8wSyjlzgPrqsoDFNy1WZej
         z71KFOQ2FWCzy50PhnNjyMFe2Q18FAXOXBQefA0mMdIGTcq20AL0wNhAhoFp7HkOoV0V
         llRKsZpfWTVzHKYAslL9aOlT39OIeD9sbMnea6biDm8rVTrC0g6QAkRQ7sKbWj4g29k8
         qhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857724; x=1749462524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpFde9Lqa/a3If18OyyVampcrtgmxniT0nRXi/1rUjE=;
        b=Vt135dpS/DHxrgOcg+0n3rPAjqk3X7emLFwGDjfRHJxZUsFVyYWQttehqYPjR4j82Q
         T7E5mjpkSRr0kmOp8NdhK94+UMFMCa8NrkBC2RE1gt30bPgv+ANwx/pfkJEDBehD7ZN3
         TSf1vB2I5DloXqA1/8/432m/LV0wKW5i/EFyS2NSgIDGnTxQe88O8B3M0t3FLYYAhJVr
         0DDXBxgGKr+qJ7E+e5FYVOdZ072v6q5wUPOiO2cuLdDmiGgAqnVUUwub8uS0mCt3tI+5
         1R84D77gaZ5SwV9MH666+bFI0I+S6hFizowm0OXKsTkLWRVa6QFj/gAX0AWNZqTuR4Zx
         Wi3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhubEgRMZsaEm5XT5tJyFMEvfBOsxMiEgfju6kLH2SsI4uBzQGNgAzUiT12i0fhlycuvWlAvQU6eY2@vger.kernel.org
X-Gm-Message-State: AOJu0YzAz1k82sSUc6fnXz0dGeIbIQU6giilobIFel+ye+PJZCVcAw0P
	C5nofJK9c+IB6R+ggiR2jVxV4m4NmFXMqv9n8y/eU1rDq+v9BhAsbBAjxR8wS/MfHYgKRMFAktV
	Xd2t3jXOd3oKNvj4qDCaYOC0OW4zXgN9X3PImUzoACQ==
X-Gm-Gg: ASbGncuU4cTurnQv/sEcZe29qZ8tk2dw/ir6JgGDSAFdc+8rXOVobI4IuSmEOIXZwFJ
	UsWGY3zqzfB5X9C1GKv9GDsvOsd+1KGgdqjPfgAAZG85x3ETjRSSRaOtGsdS03TIoeitcFzUwtT
	NNXX/a6txe9wz2Ycz4ZHxYAT2JPOGPpWlY+LbhhWJHQtAAbWiIOIADXGSHP4DSiQgb
X-Google-Smtp-Source: AGHT+IHu6LRM/rAlao7v5WhiyZHb32X4y+4RMYsF+bArPMNjiiqB+mqgfQKEsN6bAuhhQzHwTmuEp3BH5GI+EqJoEdU=
X-Received: by 2002:a05:6512:3d28:b0:553:2c58:f967 with SMTP id
 2adb3069b0e04-5533b93b8f9mr3820418e87.56.1748857724100; Mon, 02 Jun 2025
 02:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
In-Reply-To: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 11:48:33 +0200
X-Gm-Features: AX0GCFtddofCDjgZ5DIeg4B0vNuU-cCbYFWXjGMtM5hdIOhc8iwC4AUoKRGZuts
Message-ID: <CAMRc=Mdwa=DuubA6P+EnjUAQE8XupYsbo=3LuH-jYEBttREGqg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: webgeek1234@gmail.com, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 12:22=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The driver works fine as a module, so allowing building as such. This
> drops the driver specific init in favor of the module macro which does
> the same, plus handling exit.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Drop module alias and add module device table
> - Link to v1: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v1-1-d6=
b1a3776ef5@gmail.com
> ---
>  drivers/gpio/Kconfig       |  2 +-
>  drivers/gpio/gpio-palmas.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..be5d823516d0e2bff4b4231da=
c6a82bf10887118 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1464,7 +1464,7 @@ config GPIO_MAX77650
>           These chips have a single pin that can be configured as GPIO.
>
>  config GPIO_PALMAS
> -       bool "TI PALMAS series PMICs GPIO"
> +       tristate "TI PALMAS series PMICs GPIO"
>         depends on MFD_PALMAS
>         help
>           Select this option to enable GPIO driver for the TI PALMAS
> diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
> index 28dba7048509a3ef9c7972c1be53ea30adddabb0..eaef29f59292de5281f31e196=
961d90974e65b75 100644
> --- a/drivers/gpio/gpio-palmas.c
> +++ b/drivers/gpio/gpio-palmas.c
> @@ -140,6 +140,7 @@ static const struct of_device_id of_palmas_gpio_match=
[] =3D {
>         { .compatible =3D "ti,tps80036-gpio", .data =3D &tps80036_dev_dat=
a,},
>         { },
>  };
> +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
>
>  static int palmas_gpio_probe(struct platform_device *pdev)
>  {
> @@ -191,9 +192,8 @@ static struct platform_driver palmas_gpio_driver =3D =
{
>         .driver.of_match_table =3D of_palmas_gpio_match,
>         .probe          =3D palmas_gpio_probe,
>  };
> +module_platform_driver(palmas_gpio_driver);
>
> -static int __init palmas_gpio_init(void)
> -{
> -       return platform_driver_register(&palmas_gpio_driver);
> -}
> -subsys_initcall(palmas_gpio_init);

This being put into an earlier initcall than device_initcall() makes
me think, someone had a reason for it and this change can break this.
I'm Cc'ing the original author who seems to still be active in the
kernel.

Laxman: can you verify that this can be safely moved to module_initcall()?

Bartosz

> +MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_LICENSE("GPL");
>
> ---
> base-commit: b36ddb9210e6812eb1c86ad46b66cc46aa193487
> change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

