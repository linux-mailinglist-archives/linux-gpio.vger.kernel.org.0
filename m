Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F53733A50F
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Mar 2021 14:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhCNNwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Mar 2021 09:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhCNNwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Mar 2021 09:52:12 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D9CC061574;
        Sun, 14 Mar 2021 06:52:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so12978539pjb.0;
        Sun, 14 Mar 2021 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCgIEQ81bN3gdLTd6W5YPoUfE3OhXje1SGJt8c8ddN0=;
        b=aqTSnJoXtxWSyQza6WXHVFLBo9yRlCd7mbDTOtI/p3wmGTFOvS6rozfZNIk+L0PxVY
         l+zzhVe0bDoO05CvLRZ0fMp6PXO4rl3Q52/nHn+RwznQvon4B9VDU1/KMojXl5wQ6Y1Q
         5j6MTBwlJpx6P7dekKFW3DAG/UpKoPJZe90oTWt0zLTHXOzmbzr7Gqb8IDe+DMmbiwQw
         0XYAR9T0iFPQfvEzYcWNGaofy7ww22cSjaf9/VWP11r2LlzeWMlLmzcDMoSgny7UVFOT
         d45DPR3vGJqcZgrFEaXfUszZQ55LR1oWJTaq3H+Q2DXFs6Tag20/k1Vx2/ZmtMi4qeS3
         SCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCgIEQ81bN3gdLTd6W5YPoUfE3OhXje1SGJt8c8ddN0=;
        b=J2UOJJ1ZWtEaeP7HXjFQE45ykiRrQrdSp8GoBLt2FvPpB8P5IadsSWB5Kz5mcEzASk
         P/EQSvus7nx4sqCKor+XBrD4PWA/nxUfKU1H1nlnrja0W6ZJk0/O5FrrQXoWAsxy4r6t
         VSbLxPcFTk3YKjwdYzJ95f2aXsY4DgHTIV+LNvzTZEf/ICM7tVstmLsTKpKD2RpJxfa1
         pDEgaT511L8WleaQHPvjUcEkCFpD75THjXPQh4FUtMwTLE6OYKpgTU64z+lKzw0URl5x
         p9cj4lig26UQPcFEnChuu45007+A38J3B9udJpMTLcP7Ehsx3nIH5h6kJuRJ62R0ktZE
         Penw==
X-Gm-Message-State: AOAM533J2Yck5CqyShN+XgxPml4Pv2eNVYmlqN01sqb4dPbsaOSU1j9d
        w7vPK1NZ7fJbT7pHaAM76PG09NfsxYHimuZ8w/k=
X-Google-Smtp-Source: ABdhPJzVr7K4rkypGimFWj/sP+7C/wSx1N34KxV58PdrKcvUjvvTfG76hPewKzCfookjOr+bd6XfBN8fn7e11i0p4Z8=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr8340601pjb.129.1615729930974;
 Sun, 14 Mar 2021 06:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210312065855.37072-1-ran.wang_1@nxp.com>
In-Reply-To: <20210312065855.37072-1-ran.wang_1@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Mar 2021 15:51:54 +0200
Message-ID: <CAHp75VeZyfVEQ6tDnfm2-vZggg=CnG7idwihvykSgJOvjd_=tA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Add ACPI support
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 8:53 AM Ran Wang <ran.wang_1@nxp.com> wrote:

First of all, please add me to the Cc list for the next version of the patch.

> Current implementation only supports DT, now add ACPI support.
>
> Note that compared to device of 'fsl,qoriq-gpio', LS1028A and

to devices

> LS1088A's GPIO have no extra programming, so simplify related checking.

...

> +#include <linux/acpi.h>

Nope, you rather need property.h and mod_devicetable.h.

...

> +       if (pdev->dev.of_node) {
> +               devtype = of_device_get_match_data(&pdev->dev);
> +       } else {
> +               acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
> +                                               &pdev->dev);
> +               if (acpi_id)
> +                       devtype = (struct mpc8xxx_gpio_devtype *) acpi_id->driver_data;
> +       }

No, please use device_get_match_data() instead of the entire conditional block.


> +       if (pdev->dev.of_node) {
> +               if (of_device_is_compatible(np, "fsl,qoriq-gpio"))
> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +       } else {
> +               if (acpi_match_device(pdev->dev.driver->acpi_match_table,
> +                                       &pdev->dev))
> +                       gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +       }

Yeah, no need to call acpi_match_device() here.
Instead use stuff from OF, like

if (of_device_is_compatible() || !(IS_ERR_OR_NULL(fwnode) ||
is_of_node(fwnode)))
(check the logic)

...

> +#ifdef CONFIG_ACPI

No ugly ifdeffery, please.

> +static const struct acpi_device_id gpio_acpi_ids[] = {
> +       {"NXP0031",},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
> +#endif
> +
>  static struct platform_driver mpc8xxx_plat_driver = {
>         .probe          = mpc8xxx_probe,
>         .remove         = mpc8xxx_remove,
>         .driver         = {
>                 .name = "gpio-mpc8xxx",
>                 .of_match_table = mpc8xxx_gpio_ids,

> +               .acpi_match_table = ACPI_PTR(gpio_acpi_ids),

Drop ACPI_PTR().

>         },
>  };


-- 
With Best Regards,
Andy Shevchenko
