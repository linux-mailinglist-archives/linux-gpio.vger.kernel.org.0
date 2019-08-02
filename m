Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7897EE0F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 09:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730173AbfHBHwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 03:52:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44092 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbfHBHwD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 03:52:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id b7so27047576otl.11
        for <linux-gpio@vger.kernel.org>; Fri, 02 Aug 2019 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MY4Kjq3/X7iooEIRZWCRaeFs83GIjOlMhSGl42Pw6T4=;
        b=TkPK45YOrN79YDa2rekcQUqlhRVADmO5qPjcRimLH+Eyo9W+RaxbScpG/VyZ1IG79S
         kvL4Ug5bN2VF4uk7Tjk7c1UgGjQqFq53WPEfXfwhGw2dtwRi+gGrxv1wWODDTuYeis18
         Iojaq2gJqwFOIJfYI4ZJ1W96XS1u6zA9oFi4WNfp9xzF9+BiVFyoR8Ghs/AA2HSdXmD9
         W05mp/NFWA43BGb+u1xazZ1+NmVRzHdWeVvhQjHduNexvL75YIR92LaAU0LI/4P2ZkSm
         kSOWjSEoucUMywI8faX1EWdQ1RDyuUhptfcWZdHjKSQ3PxAoFFjhKNdSQvjgSTiILEEL
         YnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MY4Kjq3/X7iooEIRZWCRaeFs83GIjOlMhSGl42Pw6T4=;
        b=sPnsMxK1dam48pDdRRUmzHqRONYX6XEbPeVeRqdngY6wd+ZC24W2myBGsljXHGMHaZ
         PfBU4dAbA37K2Ildb5QN3rTweDSlUyFHjrt3WAC5/aISkmB+d1s0/xh2laaepyDF7OKI
         k0WkuPTyjXpGWjuXv0qC0aJj7uenhq+VwnrBCjw+pAvDbXB7koQ2rDlvkp3uAedLZJxR
         AHPAYoud+4fA+4Rvglmu4DhjhHL+fye3URltD6uIQm+iAg74w2msmnxdzf6ySAiv37tj
         iiiqI/OWVEtjmeRXzhWdYfhTME4yK1xJUF4ndhuYvQK8lHiWrSzCVHnhrlzlJOBPaV3i
         uk2Q==
X-Gm-Message-State: APjAAAVoSutGPmQv09jb8ghapvchUYeHIc9b77aFLN5zYCcbRAcKFeAb
        hM7vXt3mOLsZP9TknNUUMwbGdqCYxgKfGwK7hTBJgg==
X-Google-Smtp-Source: APXvYqyg2AQVzx5yOkLFlQ2GXZKVIX41QPWyu40K3oT/yFjyK5of/ORxWFlJK45m/Zwre4/ZidAUMq9Z7iDUfCWFgIY=
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr17559545otr.256.1564732322752;
 Fri, 02 Aug 2019 00:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 2 Aug 2019 09:51:51 +0200
Message-ID: <CAMpxmJUL+r7Ne+BDN0pREtow8WvH=w=L7hSUQ7mHiXyyaihVoA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] gpio: pca953x: Switch to use device_get_match_data()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 1 sie 2019 o 19:39 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Instead of open coded variants, switch to direct use of
> device_get_match_data().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 378b206d2dc9..54cf01901320 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -949,19 +949,15 @@ static int pca953x_probe(struct i2c_client *client,
>         if (i2c_id) {
>                 chip->driver_data =3D i2c_id->driver_data;
>         } else {
> -               const struct acpi_device_id *acpi_id;
> -               struct device *dev =3D &client->dev;
> -
> -               chip->driver_data =3D (uintptr_t)of_device_get_match_data=
(dev);
> -               if (!chip->driver_data) {
> -                       acpi_id =3D acpi_match_device(pca953x_acpi_ids, d=
ev);
> -                       if (!acpi_id) {
> -                               ret =3D -ENODEV;
> -                               goto err_exit;
> -                       }
> -
> -                       chip->driver_data =3D acpi_id->driver_data;
> +               const void *match;
> +
> +               match =3D device_get_match_data(&client->dev);
> +               if (!match) {
> +                       ret =3D -ENODEV;
> +                       goto err_exit;
>                 }
> +
> +               chip->driver_data =3D (uintptr_t)match;
>         }
>
>         i2c_set_clientdata(client, chip);
> --
> 2.20.1
>

Excellent work, all four applied.

Bart
