Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61EE2A97A6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 15:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgKFObd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 09:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgKFObc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 09:31:32 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF66C0613D3
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 06:31:32 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id s25so2215908ejy.6
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jO1JvdLqeiH3264lCYhj7Gy4bF9zHfZntEVAZAvsks=;
        b=lRfYqwlHmkiO4L+mrhKBCy1RCydVF0Kae5XfTywnCxqgNk+I/3qMeYsauHG0w5FBmR
         PdLJSqAmuwKnGakZbKzazDkGs1VlbE+/vqA6HTYIU2k+t1L+FGQI2xpCGRFG22V9K7ty
         2EAtn08MMb4m5QALnbsoSzjHB+I749tCBb0g5c9myKCEaD1RhOh/s4D1Cyr0ji9susAU
         ngJMq1+Coj95GQkB/QOJ9SazWWSEEM6UwZhyO0M2NR+8BQvul9jGWGp2G4CEn8JEjWrx
         V8Vn9S0Vsw1B4aw61v8UbFRxXxxB+KxJYZVmEhNjIRWfULykQgGb40pa9SYL2ojantMJ
         UCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jO1JvdLqeiH3264lCYhj7Gy4bF9zHfZntEVAZAvsks=;
        b=CNERlQrncK03cQ2kD2G8XcE4XqOpHomiGj6yWEWosW/jfQ8VbInCtHBM9g2rux6cv0
         mfzaPt6YF99+x+Ujpbfdku8vQ7gi8RcIkLAP358R3cSbIq7Vd5eOjAFJSOl1Hf43+GD2
         38d50egAUFHYFJlzmtSm08swqEJ/s2JSWZsPasPJxHFG9fy/8qeBo7M1rOHFCa3w+GdH
         Eg/7i/R0uCZGvZY664Y/w+FM/SI7TK58/VrFiq9ZEzCnC4Tt7PbpIXYBs9f1WS9CgGTv
         9xu1sg2cTQNw+Cwdc5xE/yaGYW9Iop+g3MJ1TS7aCvrE3jd3/dv+tJ0V6QPFx9+6/He8
         axhQ==
X-Gm-Message-State: AOAM53051QzP9KWw9BeQkWoPFjESKd0BfS5pyIHKMrws9P7jieF3ZsOT
        v7edQzet/aITPCMYppaOeyFtTiCzW4lVutD8lT19Wg==
X-Google-Smtp-Source: ABdhPJxteyN0q/t8Zh7XAfYNQLAzU6gV+MgbSN1UI1ZQ0Y8oOfjDV9opyYXqFQewhFn2CA8VYBwpcKz7ZTds54vTPiY=
X-Received: by 2002:a17:906:1c83:: with SMTP id g3mr2246116ejh.168.1604673090686;
 Fri, 06 Nov 2020 06:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20201104132624.17168-1-digetx@gmail.com>
In-Reply-To: <20201104132624.17168-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Nov 2020 15:31:20 +0100
Message-ID: <CAMpxmJWwC-gqVERsUzdNH7jA5jC40fzekkFXJvagDmau1-F9QQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: tegra: Add lockdep class
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 2:26 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add lockdep class in order to fix debug warnings that are coming from a
> legit nested use of irq_set_irq_wake() by the Tegra GPIO driver.
>
>  WARNING: possible recursive locking detected
>  ...
>   (irq_set_irq_wake) from (tegra_gpio_irq_set_wake)
>   (tegra_gpio_irq_set_wake) from (irq_set_irq_wake)
>   (irq_set_irq_wake) from (brcmf_sdiod_intr_register [brcmfmac])
>  ...
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Reported-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 86568154cdb3..98fc78739ebf 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -560,6 +560,9 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
>  };
>
> +static struct lock_class_key gpio_lock_class;
> +static struct lock_class_key gpio_request_class;
> +
>  static int tegra_gpio_probe(struct platform_device *pdev)
>  {
>         struct tegra_gpio_info *tgi;
> @@ -661,6 +664,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>                 bank = &tgi->bank_info[GPIO_BANK(gpio)];
>
>                 irq_set_chip_data(irq, bank);
> +               irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
>                 irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
>         }
>
> --
> 2.27.0
>

Patch applied, thanks!

Bartosz
