Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB8E2C89CB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgK3Qng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgK3Qnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:43:35 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC9DC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:42:55 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id bo9so22935029ejb.13
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Aj9qTViVOHCGvhmmXfPUv/vIUXbZzuXKzMiwCVk9dA=;
        b=vAenNzbhnM5r2BYN76rB5ZO5qCzDR5XUkM+SwTBret68X09UIwXSokyZdy5TT/qU8a
         nk15qM4d6gkNPcoDaaBEfMLXoN0PXLe4IzfL+q66F9gQCtbrWUdacULDr1SjgHCzY8Kk
         ukeK69U8Z0kAEu/0EpOTgAY6f0yne+BC/C4rTjkzxEYN+OVjR8NjdSiaGqhbUeY60ghI
         BY+QJmqrIdNJLpS+fye+x3FM6edHQJcxnM6YVy4IaGEAH19R55p0ZV4gj+B1jpDKkVuP
         oWT5mojQBy3I3WUtW+tO+T2FfHC4yiF/0jkIJL71SpCpN+Y9uWR+Z6Npv3L8XiY/Yzfe
         bhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Aj9qTViVOHCGvhmmXfPUv/vIUXbZzuXKzMiwCVk9dA=;
        b=mlVNFSahCmH3recs78gxMbZFXhDaneVSSmg95YMPGzYHB/j7KB+WaR8W/9u3ljgiTX
         lhGDX2zhulee5xp/LZm1SAjZabcdb2YDkt0UkB8cnJe+RV7Iv/j4ZSa6d7XI+hEWDkCR
         Tr9lWeJkz9Y06w32EEsDeXn/X+58Ps4wH1H4OUYKs7ZFwvfeA5xUl2K6KagewK3tmkvc
         u9hLc0HHcdvNYw6phE7NHyBIejixkveDSOSfOB9U7IouzD0JmiCJEEgrs3gdW1X9DkUX
         ZiFYzHIBY0Noqy5nK3nKMvjOvkL5kkfvK1sRg3mGLqnaExPdSpWFSkiOD1HvCICZLebZ
         cGAg==
X-Gm-Message-State: AOAM531Wg/bko6Fmth7Y0IeFzYP2NxUINzqiyS91DVF3VHGvN7OUgDNj
        7X5s1agZ3bXXid7VQS75A9qHs5NQURyuM9gkZIPfpw==
X-Google-Smtp-Source: ABdhPJwDumtW5xKzKhkng318LHjQls09wlu9rVlgAa9sbGVNCtYOKWz71P3Kn9y3bRhGXKpF6sOvRz3IVGSuUM5RmUA=
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr20845359ejd.363.1606754574134;
 Mon, 30 Nov 2020 08:42:54 -0800 (PST)
MIME-Version: 1.0
References: <1606467002-62964-1-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1606467002-62964-1-git-send-email-luojiaxing@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Nov 2020 17:42:43 +0100
Message-ID: <CAMpxmJUnao=KXTRORF5z2X4BHojDW2UCosHjZi_K9jCtVVtGMQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: fix NULL pointer dereference at dwapb_gpio_suspend()
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sergey.Semin@baikalelectronics.ru,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 9:50 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
> Following Calltrace is found when running echo freeze > /sys/power/state.
>
> [  272.755506] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [  272.755585] Call trace:
> [  272.755587]  dwapb_gpio_suspend+0x18/0x318
> [  272.755588]  pm_generic_suspend+0x2c/0x48
> [  272.755595]  acpi_subsys_suspend+0x60/0x70
> [  272.755599]  dpm_run_callback.isra.18+0x40/0xe0
> [  272.755601]  __device_suspend+0xf4/0x360
>
> The reason is platform_set_drvdata() is deleted, and dwapb_gpio_suspend()
> get *gpio by dev_get_drvdata().
>
> Fixes: feeaefd378ca ("gpio: dwapb: Use resource managed GPIO-chip add data method")
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> ---
>    v1->v2:
>           1. reduce calltrace log
>           2. delete blank line in tag block
> ---
> ---
>  drivers/gpio/gpio-dwapb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c..4275c18 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -724,6 +724,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
>                         return err;
>         }
>
> +       platform_set_drvdata(pdev, gpio);
> +
>         return 0;
>  }
>
> --
> 2.7.4
>

Applied, thanks!

Bartosz
