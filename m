Return-Path: <linux-gpio+bounces-3245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F42085394A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 19:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F310B29A38
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 18:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9E860B86;
	Tue, 13 Feb 2024 17:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFpUcjw9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80043604DD
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847057; cv=none; b=ewaYWuM59ECZ0JX/iZyHi99X2hgmgUHN/Z0HkW7kfGAIX/s+3Fz68kAuJ48PWodxtV0sGDIFgWm2W/RSaHqfHJ/nRZQJDsK35UXJXoQnKYtomfLn8w52Xn4CKXfPG28cXW92y+CBjUMgLcsOEnCuTDCPbM2/+DsfUN7haYQuCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847057; c=relaxed/simple;
	bh=vGsPH/6NepigkHWNcE1Gp/jZaGblgkAQJ/VePx7mqOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWTkguapDyb7JmiBadnEUiowv8W5ev+aCXsi2Lg9iRI14161/Mo6JDtDGhJ7cSrhDZgrpaXzf3CM4QYo1Jyn46XB0E4sYQgGRnoUAGwhg382osjRedtOaF2l3tXyhaX+ZaYujLTMEFFkYC5Fhr1AhURlB5HyPdYL5rP1vni5RiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFpUcjw9; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc75c5e3151so1056792276.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 09:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847054; x=1708451854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThFEwmSsic89kjVyr0919FUZo6LtjSuhDb8efYOkiGI=;
        b=BFpUcjw9EZMmAMaQ2bsTun7bOnEVMJRwCHAZ56Nq23BqXa/cq+ZiknNpfs2CVPWUgC
         zqd3CNLT2tlGuDHlYAetKIHcyQlPWbFCFAUCpMr0NtVPH1Av7QNX7QEl6AD+NbZNNy0D
         8HjHA47CrLAQoznlmHTNh8S2aTbTGtOhGvtA0IFejHKwYGMjTEMSbYG2t4adDjrx64n7
         GI3wcAFM0L1r8TKgIIm7TB2GVAlROo3RFT+1z8PICwUIjweLm4av35HMsQcCEiCkZVcq
         SMh6/gajowAlID7p3cj/JFnfRKXLfFn/65MtF09Lc2DnEkNBa8Cp/uwCmP60kJ2MS6wO
         VInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847054; x=1708451854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThFEwmSsic89kjVyr0919FUZo6LtjSuhDb8efYOkiGI=;
        b=ThpEdwe4iwdFSqBH23kpa9KNj07HJcjXncxzFr8SBoOk9xRassGdQHXLx9cee+9qD2
         2XLI2MXaDy99ducOf/dJn2hTi4dtllcjDgNgXlvLK0daSzKxS/BNd+kaWHgpgxJqnVmb
         IFesbdkFm1sdbkL6TTTcNFVvzsk7lEn656dnXBJ0Rd9N7ipKu6VaXpeDIxuxk2ccsz/d
         kN2VB1YPuHVQQHEPg9eXSpnyoP5+Kw/tVb0vVvA97+QCxC6VWjFzr6UzYlAGnd/j8trH
         kATo/9hPkwcdGz+hNKbyQx+rx8o/G3pzjE9swUGL0Vbm2JFZBiFq9aq94q8QRo/RWghs
         2R1w==
X-Forwarded-Encrypted: i=1; AJvYcCVl3dEUz3AdE16pqLvsAxoNlDr1vPjoLBO5b6dH9W665aCvMvVHkHh+63NUjfOdG5o90iKx01fDCvTZ/OFcb0afyd/O/5EqtnDs1Q==
X-Gm-Message-State: AOJu0Yzz0tZNMST67AJrdKEJ2jHNe/H9PYda/smLYTDdY8UDAN+r6Emd
	dIl0fIz5HMpOX6dsH24tftjTg57EGABSQ+B3KFffJ5l6NjPs3ArdJmLhwvPhTHxh6iwJeBsglm1
	Oks+l/I4OKKaKXd5obK9sBqqrBfdfgCP6GNjPYA==
X-Google-Smtp-Source: AGHT+IFRRPRaR8chVvPorzyjWv+0RJ/A9PgRqWUgzNW1aKca1HP9qDR/iO3FDMZxa24LIqZrVhfY5xeJjXYhOT7SiAk=
X-Received: by 2002:a25:ec0c:0:b0:dc6:cd76:5ddf with SMTP id
 j12-20020a25ec0c000000b00dc6cd765ddfmr8977451ybh.39.1707847054395; Tue, 13
 Feb 2024 09:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-3-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-3-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 18:57:22 +0100
Message-ID: <CACRpkdaxW+2q9=CPpkJZK7tWh5T7smnvqoEhEGezV9TvOw9wqQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

thanks for your patch!

Overall it looks good I have a few nitpicks

On Sat, Feb 10, 2024 at 8:09=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:

> The ChromeOS embedded controller (EC) supports setting the state of
> GPIOs when the system is unlocked, and getting the state of GPIOs in all
> cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> expander. Add a driver to get and set the GPIOs on the EC through the
> host command interface.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: <linux-gpio@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
(...)

> +config GPIO_CROS_EC
> +       tristate "ChromeOS EC GPIO support"
> +       depends on CROS_EC
> +       help
> +         GPIO driver for exposing GPIOs on the ChromeOS Embedded
> +         Controller.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio-cros-ec.

Classified as "MFD Expander" but I honestly don't know anything better.

> +#include <linux/bitops.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>

Do you need init.h?
I guess maybe... I thought module would be enough for this.

> +static int cros_ec_gpio_request(struct gpio_chip *chip, unsigned gpio_pi=
n)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               return 0;
> +
> +       return -EINVAL;
> +}

If this check is needed, it should be in gpiolib I think?

> +#ifdef CONFIG_OF

This ifdef should not be needed these days.

> +static const struct of_device_id cros_ec_gpio_of_match[] =3D {
> +       { .compatible =3D "google,cros-ec-gpio" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ec_gpio_of_match);
> +#endif
> +
> +static struct platform_driver cros_ec_gpio_driver =3D {
> +       .probe =3D cros_ec_gpio_probe,
> +       .driver =3D {
> +               .name =3D "cros-ec-gpio",
> +               .of_match_table =3D of_match_ptr(cros_ec_gpio_of_match),

Nor the of_match_ptr() business.

With these fixed/addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

