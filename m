Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B3438C739
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 14:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhEUM5X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 08:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhEUM5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 08:57:06 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F64C06138C
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:55:41 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 191so21427651ybn.7
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wbCrc5u5unxWh09jlQjXKgEZzrmBEWTEQIs3qBVVg/w=;
        b=OGkdAPRxmGroUrRGSScHWMXSEY0m8Gc6Bm4xfwHzmlbMFBdUpa85udXcQn+C/vvIpk
         Ic2vB0gjKQzfuXV4Vbd717a2UEWKf97qt1ZfNzdPM8ElBoEPvRTnjqm0wFlotKjxT4So
         WfAjqiPMnNxaRwMcnXMYfSmhPJcssnyOY5Uze0wmhtZUuHVkygV6f/e1/CzeH4d/Wc6O
         AsvfFO1D+9FrZkxiwkTtP/Jb9fOXNTeclk+oChS96MvTqg1LBruaqdBt8pcH+QO2+J2G
         pbTwaFLgJPRhRvrlwy/c6Wp8KCm9vVVl6CdqBo5sCM41JFpZ6btIGJ6xsQBS2ruXGyZN
         vsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wbCrc5u5unxWh09jlQjXKgEZzrmBEWTEQIs3qBVVg/w=;
        b=iGy+wXuwXnrclW5BTN52lODS3wB5B45MDT+vmOaPwxWaUoINKioOMKbC+qJnDbbiPK
         gQyp0VLVHiZStSfJFggfyE1AuaTN4zsOBxn8rPENWpHJjhanUXZHszwCahm+FzyYPkP7
         PzQK4MYbpG6JJuqIoY0WYQM3YdJjUKqgBxwtRWe690/Q2QWsUs+n4mCVq7uyZzxgtFET
         PhTvVY12bz3bMuljjaBWUaRweNQMrA4xVT1rl3eEVdZ5QjZgtiHAQ6clMvoOto1VodP4
         xYS4Mo6B+GkyKCkBBehzPsfnoIa0cHXdyND5ludYZzDGkl4E731ran/xM5noR0gWqmDb
         bb1g==
X-Gm-Message-State: AOAM533we6NpA46j6lFoKydBXgJIL3A+qwdyUfCRoXUkzx7jgphsrGbw
        A1R/fhi/zLL6oShEftItc3w5mCprLu5rEbeypfcbOdhpWuFlhQ==
X-Google-Smtp-Source: ABdhPJzW6ZACmt60jgqE+MNDAf9gbbKdjI7PSG2kigpk2ddNt/q4y+4wde7IffUoAjQflZq7w7PwUBCNZsXNJhUszco=
X-Received: by 2002:a25:287:: with SMTP id 129mr14715521ybc.312.1621601740978;
 Fri, 21 May 2021 05:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210518120917.30336-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210518120917.30336-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 14:55:30 +0200
Message-ID: <CAMpxmJUZdvaBsWZHwDg0DzOqVVR7_Bwgoyh9w0wN61dAVYa-yQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Use sysfs_emit() in "show" functions
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 2:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The sysfs_emit() function was introduced to make it less ambiguous
> which function is preferred when writing to the output buffer in
> a "show" callback [1].
>
> Convert the GPIO library sysfs interface from sprintf() to sysfs_emit()
> accordingly, as the latter is aware of the PAGE_SIZE buffer and correctly
> returns the number of bytes written into the buffer.
>
> No functional change intended.
>
> [1] Documentation/filesystems/sysfs.rst
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 7c5afd999210..d836aba91d3c 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -66,9 +66,7 @@ static ssize_t direction_show(struct device *dev,
>         mutex_lock(&data->mutex);
>
>         gpiod_get_direction(desc);
> -       status = sprintf(buf, "%s\n",
> -                       test_bit(FLAG_IS_OUT, &desc->flags)
> -                               ? "out" : "in");
> +       status = sysfs_emit(buf, "%s\n", test_bit(FLAG_IS_OUT, &desc->flags) ? "out" : "in");
>
>         mutex_unlock(&data->mutex);
>
> @@ -109,13 +107,9 @@ static ssize_t value_show(struct device *dev,
>         mutex_lock(&data->mutex);
>
>         status = gpiod_get_value_cansleep(desc);
> -       if (status < 0)
> -               goto err;
> +       if (status >= 0)
> +               status = sysfs_emit(buf, "%zd\n", status);
>
> -       buf[0] = '0' + status;
> -       buf[1] = '\n';
> -       status = 2;
> -err:
>         mutex_unlock(&data->mutex);
>
>         return status;
> @@ -249,11 +243,11 @@ static ssize_t edge_show(struct device *dev,
>         mutex_lock(&data->mutex);
>
>         for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
> -               if (data->irq_flags == trigger_types[i].flags) {
> -                       status = sprintf(buf, "%s\n", trigger_types[i].name);
> +               if (data->irq_flags == trigger_types[i].flags)
>                         break;
> -               }
>         }
> +       if (i < ARRAY_SIZE(trigger_types))
> +               status = sysfs_emit(buf, "%s\n", trigger_types[i].name);
>
>         mutex_unlock(&data->mutex);
>
> @@ -333,8 +327,7 @@ static ssize_t active_low_show(struct device *dev,
>
>         mutex_lock(&data->mutex);
>
> -       status = sprintf(buf, "%d\n",
> -                               !!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
> +       status = sysfs_emit(buf, "%d\n", !!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
>
>         mutex_unlock(&data->mutex);
>
> @@ -412,7 +405,7 @@ static ssize_t base_show(struct device *dev,
>  {
>         const struct gpio_chip  *chip = dev_get_drvdata(dev);
>
> -       return sprintf(buf, "%d\n", chip->base);
> +       return sysfs_emit(buf, "%d\n", chip->base);
>  }
>  static DEVICE_ATTR_RO(base);
>
> @@ -421,7 +414,7 @@ static ssize_t label_show(struct device *dev,
>  {
>         const struct gpio_chip  *chip = dev_get_drvdata(dev);
>
> -       return sprintf(buf, "%s\n", chip->label ? : "");
> +       return sysfs_emit(buf, "%s\n", chip->label ?: "");
>  }
>  static DEVICE_ATTR_RO(label);
>
> @@ -430,7 +423,7 @@ static ssize_t ngpio_show(struct device *dev,
>  {
>         const struct gpio_chip  *chip = dev_get_drvdata(dev);
>
> -       return sprintf(buf, "%u\n", chip->ngpio);
> +       return sysfs_emit(buf, "%u\n", chip->ngpio);
>  }
>  static DEVICE_ATTR_RO(ngpio);
>
> --
> 2.30.2
>

Applied, thanks!

Bartosz
