Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2754011A836
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfLKJu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:50:27 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41331 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfLKJu1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:50:27 -0500
Received: by mail-qt1-f193.google.com with SMTP id v2so5706003qtv.8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1x3h1uItNOrjQRIFr/sBPy8Wmx/jac78+qQ9qw0xfto=;
        b=X2F2VXrSfNpeAVr+yZs47ZCB3YxH9T4clibzjBFjYQ1bAZBkDES+4oqtl/+TabHWq2
         KEUKFxNtwjvEzaSocgynOksqHDqvq4BRtqyI8Mk+qE69Hsh1uA9dLkfK3ntgpAuH4Sx6
         1KRUxD5XoLztbwO25yKjbtWQFH2yuIG/7uCgQyj48giYdVXBhuUHYLbaCungG0u37ceV
         lGfv6tOC/YTlG5lgIFUIKDIlZfmgbXA/vL/QWIWvZBYP05Uvtg1dGgR+s3eYBzw6MP9d
         U9XPJ2VwwwRm7ZXCOts3+S9WCm+VW2ayFMp9Z4Zx+99mXQTYlal9geMTjGUePCBMyIJP
         K/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1x3h1uItNOrjQRIFr/sBPy8Wmx/jac78+qQ9qw0xfto=;
        b=le9F+mjBTYc0VzK3yt0j4AeEjZcuESRLnhvtyizo+I70tb4bj3ZbG1wp/E750dDew3
         9/WkaO6lqjGhMOaaLFnIhUdWDFYei0qhQISJaxz9eyEk22/YhcCdRAPS6HWmyvBI7wGI
         rEDcOfUSZxPgHWLgokQV1CJjzeZxPlIbeGVZh3uAngRPbhxovyAzpbS1poGKsSiOi5fd
         A26NqwrQEncPyqzyM7lsERYQm4DhMVaAp8Mub9K+Z/jAo2F4v3UH3NUEBlpI+x6mypGX
         FYGHwt2t/Nacd12a1aMrqRoXPhg6IE0ZhufWHNwsuyPEEqiRHQLhtgdXOiEOIpuur3mf
         CQXg==
X-Gm-Message-State: APjAAAWf2oG8sdjLXOL0CEHuuMka54PgO11cFMDTuCIibA+a/vaxVZvP
        JlcXyDE7VtOThyno9m0GmSfLplZ91X7t72s4jkiyHfCA
X-Google-Smtp-Source: APXvYqxq4tRI41G8mUkJ/OdE/m3KhY0n6IONPntsmDj0qCFg41r8Ba6c0NWc/6UXQlOUL4aFmhDjK6ic17Q3I55e/Vg=
X-Received: by 2002:ac8:6784:: with SMTP id b4mr1838901qtp.27.1576057826694;
 Wed, 11 Dec 2019 01:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20191209123545.85309-1-andriy.shevchenko@linux.intel.com> <20191209123545.85309-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191209123545.85309-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:50:15 +0100
Message-ID: <CAMpxmJVoXPO0doTsnSog28+_GqkVWTQnniuw1Z15a_RAFfisdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: pca953x: Remove redundant forward declaration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 gru 2019 o 13:35 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> There is no need to have a forward declaration for pca953x_dt_ids[].
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 9853547e7276..2f8f5eb28ec5 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -855,8 +855,6 @@ static int device_pca957x_init(struct pca953x_chip *c=
hip, u32 invert)
>         return ret;
>  }
>
> -static const struct of_device_id pca953x_dt_ids[];
> -
>  static int pca953x_probe(struct i2c_client *client,
>                          const struct i2c_device_id *i2c_id)
>  {
> --
> 2.24.0
>

Applied for next.

Bart
