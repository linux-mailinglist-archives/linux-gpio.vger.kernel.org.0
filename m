Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C199F4336BE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 15:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhJSNQG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 09:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbhJSNQG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 09:16:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1BCC06161C;
        Tue, 19 Oct 2021 06:13:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w19so12722714edd.2;
        Tue, 19 Oct 2021 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yb5AYlFBZpmOcMRPANWbIoCRCA80wADgh4x7iAW1ExU=;
        b=H0zGly0sCkacvlKcxqqWAJ4IY4FSkznN2vKL1ODg8xYFhSUhN15I8y7637JR93fvhV
         zoWDzKhPk9HxNtj3XG9NRzVM/oBxD+tK+d8ptg7nlcvCstOPufCxvJAjzRcDQvx2XUBV
         xiiSufc+SOdXorgmUOKj+RVUGhPyaWF2GDlX4+q5fyfLjTm5iDqWH43jdEJbrV4dPj/z
         wG7NpiXYOc6IT5nA+t4A3d+mYB6DloDmyXw21PLOi3EZuBLUi2A0JBQc6hanaGYBUvXi
         oTIPxlEb6Ng/oe9bISOlYuWnAFT32WZHtt+uCMioDRUp4y6tGOc0AoPvNC+c48J5Z+7n
         8Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yb5AYlFBZpmOcMRPANWbIoCRCA80wADgh4x7iAW1ExU=;
        b=V0Rq1ZZLlm26QcQReqMm27RhXYrnfLiSRnbk5nFXyFoo9xskclVBw1riZzlwxiHjtj
         Hz8o83mMkL17IgRoxziDGJ8iqqXzDgcioKk0JOyh5Vq5bey5xQHNWQ4HsR60XyF+Q+Em
         O/hLMV6XH3pUmAQrWJ3UTvmFwR0dSs1dPHYFPm0zWGv57M7E4y0ni3B50UVIM75x1g0F
         VUu3Cmxiko9iuRm60fc0/NVinNvgoraKeJNKFW5hfA9WvwhnUGpg9u8orSFVk/FYjEkQ
         YfqUHphfPmm0Fl6o8qr7ZiVDHISwWh5uyYOgTQvOT+JjDILSwkGOVo6rJtsc8vJBShDA
         FD+g==
X-Gm-Message-State: AOAM530BnPIRb444gCQi85iGb1tP1u252ERNH/VW9A1Ni0vmQ/s9wV4N
        sqhsmuO6VPO60/bk1GrdP7XTk8NiCgCqSnd9FbY=
X-Google-Smtp-Source: ABdhPJzpUjCirAMo9LRcvIUqEhu7nS182O8i9NHU3B0apVjOzlvvl++HVxgQGWYCXow969iY47xNrnxdD2OuKLxsBEg=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr35432917ejb.356.1634649229512;
 Tue, 19 Oct 2021 06:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20211019125731.4327-1-maukka@ext.kapsi.fi> <20211019125731.4327-3-maukka@ext.kapsi.fi>
In-Reply-To: <20211019125731.4327-3-maukka@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Oct 2021 16:12:57 +0300
Message-ID: <CAHp75VeOZY+YHfFsnTNdYfan=dxZx9ZEoCr8PAgOewAZX4khsQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 4:00 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
> Adds support for building cascades of GPIO lines. That is, it allows
> setups when there is one upstream line and multiple cascaded lines, out
> of which one can be chosen at a time. The status of the upstream line
> can be conveyed to the selected cascaded line or, vice versa, the status
> of the cascaded line can be conveyed to the upstream line.
>
> A multiplexer is being used to select, which cascaded GPIO line is being
> used at any given time.
>
> At the moment only input direction is supported. In future it should be
> possible to add support for output direction, too.

Thanks for an update! My comments below.

...

> +config GPIO_CASCADE
> +       tristate "General GPIO cascade"
> +       select MULTIPLEXER
> +       help
> +         Say yes here to enable support for generic GPIO cascade.
> +
> +         This allows building one-to-many cascades of GPIO lines using
> +         different types of multiplexers readily available. At the
> +         moment only input lines are supported.

Care to mention what will be the module name in the case of being
built as a module?
(Hint: there are plenty of existing examples in the kernel)

...

> +#include <linux/module.h>

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>

I would move this group...

> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mux/consumer.h>
> +

...to be somewhere here to explicitly show that this is the GPIO
subsystem related driver.

...

> +       mc = devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(mc))

> +               return dev_err_probe(dev,
> +                                    PTR_ERR(mc),
> +                                    "unable to get mux-control\n");

Why not one line?

...

> +       upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
> +       if (IS_ERR(upstream)) {
> +               dev_err(dev, "unable to claim upstream GPIO line\n");
> +               return -ENODEV;

Why shadowing error code? What happens if it's deferred?
Hint: use dev_err_probe() here as well.

> +       }

...

> +       err = devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
> +       if (err) {
> +               dev_err(dev, "unable to add gpio chip\n");
> +               return err;
> +       }
> +
> +       platform_set_drvdata(pdev, cas);
> +       return 0;

I would rather do

       platform_set_drvdata(pdev, cas);

       return devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);

-- 
With Best Regards,
Andy Shevchenko
