Return-Path: <linux-gpio+bounces-4981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AF894E16
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 10:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4C31F23676
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95C04778E;
	Tue,  2 Apr 2024 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G202nPmq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C24C601
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048340; cv=none; b=E0azP5hIwqTP3HcgWmXC/7LopGIeG60QBQbGVIPjbqVWOR245tM2dlLiZWCHoJ2QwjWgbkTOq14arCpu62amvs+DNUquioPM5JFpE119kiTIU/d55BDN0JOf6FwaZVl00ZNrEYyzfz/CQ/Vlgb53fx4rtrWN7SlvZ7hZBdmzbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048340; c=relaxed/simple;
	bh=HNm6Lh879crSqV0ZGzaJmrt3ssAvgX20Rq/oXJRJF9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta2kf/arxFNJEq/qOk894Yja/UhJrB3QCf/PQ8t8iqjv7oG4LmDheL17AwlYkXVc22ZAv3RnYEXXB4Mn/kxn9czif4X0QE9TjjVZdt99ykIJbjOoxvEYJJWxsojzEpCvu8t1LVNWCxyeiUjtrirBQTpt7sLYcpodBkA3qkDcduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G202nPmq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so51122281fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712048337; x=1712653137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EQziKXdKEAMdx/dPCGDP7jmLVDHvzi4KCtf8hrHXHs=;
        b=G202nPmq3BLahFpIpsyBtxc0Pe2+9I2BcQONef2a3bgNkiBlgjsCZJ2cZkpstvoeLS
         528rrTC6yUBa/gd8930W/PWBbGH3ps0xN0Lvn3ta6QLfjTmKdDK51rLvjT+mBqQdBjGF
         axw+CumeE7Bhkud2qcXP6aU7SgnRKr4zqco/7mmGteybc8mofF74j7eCy4MlEjN/ssQV
         HOmdB+2zY3P/viMU3n8kalzI131B+tibh+JZi7COXR/3Nn8U4/bXyw6uGNG/xSy16Srw
         UUckBu+4ufvwMKgOqOa1lCR2tEtMI9YiaVRYblXRiT5m1RFvZ+KR7im58F6JdYdce+Ys
         nUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048337; x=1712653137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EQziKXdKEAMdx/dPCGDP7jmLVDHvzi4KCtf8hrHXHs=;
        b=LRagONeQMfLyuWpjuw7tm0fZ6UK7pUbxzmXPe6DfDLGXPz7Qj8On1EX2/igU2JK0eo
         FWV1HY67n9BCkVJOjspn+3LZYe+PEEqdWMZzlcOzk0pyTT9of1CBoOCn+C8+B5uZQ0ow
         xuY1H7lnghP6xxhY/4e1tt7vFYVvrgzb/+f5kb0wAQPA2ubMnnE2np96kWBsgb3Em+qE
         fK8e0sHpc+RY8trKg9OssB/oc+qp9QLf6vHPSwqrxRXDAVgDqRDiU7J1GPXQ+jQ3qxaQ
         FR3xNa0gra4sM1q0nwfVuuIxwMzK7fmSC8r+/8wSE3eY1h0rXhHF4IVPY4pqfQoOX283
         FeWw==
X-Forwarded-Encrypted: i=1; AJvYcCVdpl/15e/lQVRJ43D5r+MmTmocNnvp/ZccupOji5k7I8VdRTmdlRcojjzfuGQV2r2+03Ut7CMaCZrKZyXFAj4JKkwWsEXQQOTkjg==
X-Gm-Message-State: AOJu0YzPOrm1lOJieES3N5/8vnMcQM2tXmkFZOHA4MT0WoFiZ7QQkAQ1
	CrAJLv2z4wtRFDEcfs2pr5NbEiXxh234G9vl6t3/FlySo24HYtRquJs+abaPf1pscucp/89FYMz
	gYMNS7B8ASmtLbphp1MXZJvZ0VHQ/e9xFPiRCXA==
X-Google-Smtp-Source: AGHT+IHgVoVAQjY0SVm1Am+geVCD8kGxkvgjD4vTaFUHh5+1OWnpBP+5APV4hCgBud/LOc79OuLkSI2vz2dPlk4j4wE=
X-Received: by 2002:a2e:8699:0:b0:2d4:6815:fc6f with SMTP id
 l25-20020a2e8699000000b002d46815fc6fmr7057550lji.30.1712048337278; Tue, 02
 Apr 2024 01:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401030052.2887845-1-tzungbi@kernel.org> <20240401030052.2887845-3-tzungbi@kernel.org>
In-Reply-To: <20240401030052.2887845-3-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:58:46 +0200
Message-ID: <CAMRc=Md+v=zWGa=pYUzKkBMipJj_NgYW08XTfvdCFyErOVdvYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: cros-ec: provide ID table for avoiding
 fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org, 
	hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	chrome-platform@lists.linux.dev, pmalani@chromium.org, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, krzk@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 5:01=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> - No code changes.
> - Add R-b tags.
>
>  drivers/gpio/gpio-cros-ec.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
> index 842e1c060414..0c09bb54dc0c 100644
> --- a/drivers/gpio/gpio-cros-ec.c
> +++ b/drivers/gpio/gpio-cros-ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -197,11 +198,18 @@ static int cros_ec_gpio_probe(struct platform_devic=
e *pdev)
>         return devm_gpiochip_add_data(dev, gc, cros_ec);
>  }
>
> +static const struct platform_device_id cros_ec_gpio_id[] =3D {
> +       { "cros-ec-gpio", 0 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
> +
>  static struct platform_driver cros_ec_gpio_driver =3D {
>         .probe =3D cros_ec_gpio_probe,
>         .driver =3D {
>                 .name =3D "cros-ec-gpio",
>         },
> +       .id_table =3D cros_ec_gpio_id,
>  };
>  module_platform_driver(cros_ec_gpio_driver);
>
> --
> 2.44.0.478.gd926399ef9-goog
>

Applied, thanks!

Bart

