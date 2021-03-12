Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0300338AF1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 12:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbhCLLEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 06:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbhCLLEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 06:04:10 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289C7C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 03:04:04 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j3so7355406edp.11
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dt1Jconi7vhAXPLDEe/e1ikNWrargx4HIeN2mZt6shg=;
        b=U02CQYuzNT/l5o6a/iFgp2H4ACVS/b+TN/O0uL1cd4UBtIp0WQ0EsAGvtC2ZOcUugh
         ghcDh9kMZI2Idg4P6slc6OQvJaLTNzQmtWIyU/9fBKVEwn4mUt5xNMgHY7Awtxb7Wddn
         HKNyHcsJQztT51BYpOcHVwRPdD2LRMgXGHMoJBjfie+7nzL0O2vbGAWhw8ynfh8yUz00
         pGdPxQ+4oyrrN2DSjaQVjUhCT9xAu9O0xyukBv8DGf821bH+1eEYIUuYGHYtJxZgfazZ
         BqNgLEyi08RvJnAh/Ufwpiz1HXOe5Kji0/X/DuBw2NJNaHWWGYf+JDVFSeyO9UqTWbAR
         F/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt1Jconi7vhAXPLDEe/e1ikNWrargx4HIeN2mZt6shg=;
        b=TDuLrgyekqhy7JhzigaRQIwY0wRTdjqmklcWOaGqsezMai1XR0/iHtCKlqpi7ePWPX
         7fOEnvAaV+3zTKTpmhfDKVPi6PJcDJrhsapLP7LVZYIk2BZtfjF2rjT2kkBemFxCBjxL
         n9mW0EnuIjGzIM9kjP/3mcXG5vClsBNnpmboKoJKZ8G7IvFoDnJwPyEubLFW9TzQHmJu
         Vh3+KtvYZ0zXO1F8ET5c0H7j4lBlgq/NymTg5B22OuoMjWWw7LiWuRHyhfSlvORlPJ1T
         Ux27ecG+tho7jTsxKjWOAmbU7uadUmER+LCns9gdU1oY+eekM6Zar/pjGg9UhTrdcRlN
         zYkQ==
X-Gm-Message-State: AOAM532PX8TnLboa+GZAAiHeoIwYGI2juSOp4JMfCQBhnm7O3lGqRCKn
        35f7t+gOFTz/ahpNoNutGk9PHtrFZpgHZppxdGbL8g==
X-Google-Smtp-Source: ABdhPJwyuDg0uPHrInwoHv+S7M2QS7kHn756G9nstinMUDgFBc+SLZLj6r4DwwZrkMRYbyl3B+drWHkN49y6k5RYcn0=
X-Received: by 2002:aa7:d813:: with SMTP id v19mr802661edq.213.1615547042864;
 Fri, 12 Mar 2021 03:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20210312080423.278094-1-weiyongjun1@huawei.com>
In-Reply-To: <20210312080423.278094-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Mar 2021 12:03:52 +0100
Message-ID: <CAMpxmJXxdTSoWYwRR2o2XwRh4aToPBEsE+C5hNaFvGiYAjkHNw@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: Fix error return code in gpiolib_dev_init()
To:     "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 8:55 AM 'Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpiolib.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index cee4333f8ac7..18086262dd48 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4242,7 +4242,8 @@ static int __init gpiolib_dev_init(void)
>                 return ret;
>         }
>
> -       if (driver_register(&gpio_stub_drv) < 0) {
> +       ret = driver_register(&gpio_stub_drv);
> +       if (ret < 0) {
>                 pr_err("gpiolib: could not register GPIO stub driver\n");
>                 bus_unregister(&gpio_bus_type);
>                 return ret;
>

Applied to fixes, thanks!

Bartosz
