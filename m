Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7095251C38F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 17:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380542AbiEEPPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 11:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiEEPPq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 11:15:46 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3623A12757
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 08:12:06 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2f863469afbso52206287b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 08:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=apoghpeFFlLJjbI+JkUxZif30mEbTTO0hnERVhJbN3Q=;
        b=viiYLjUnWtneZywN8kxyoG7EqkVDupk+UleFm8eVhNouy268w5jp5yAmOB662BTvSK
         dE0Ioer4x3MLWwLixj6Nlj0CThsRXhoNigU3pGqDAVZICn+WlOwhi5Ci7M6b9lTaN4mu
         tcR5P4pl4nOMBzOCbh1dUAC3jIWXbq27/dimkCEXtZ4prWaKws7TQ63GerLCpmTQAPDI
         6Lkml3yJpZsfDKVzQHVIcLC93keO1WQerZxcW37JddZoDuOh5Y2jrbEQtUV72LJJrO1/
         0XugiztPkXkATS4QtMvABGvtENO+6FpWPuDDXkpC9yj/bj66/cKgaA4Hjj9Ckgt3iCxp
         c/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=apoghpeFFlLJjbI+JkUxZif30mEbTTO0hnERVhJbN3Q=;
        b=i4vHxoqGgM6QK7y0vCDQUtFS55Bh0OtXk9hNwzo2RgW7B3QKCWxPWeNCSDAqc4JcoQ
         6k+KnYit765Bcg/LyJs8qq3ivLQpFbwu5itLgj18fNy9nR/6l7D4ovDwf/njqQDPObhw
         Zvvt4DGF2dApuv+9zQ0Rqb1A5BAnD/J25cTUmRlQlhm2YnlO0A4H6ZZrfQLpAo0A5ABR
         VDYQahjm+a0aY3PmGsoPd/IPI8BHUUU4tmohHqmXPbwqWIeExvXnm1Zidos8A+QwheB+
         LOfs5fkT5hYyBDgvYnSYw4BW7gOfWnd9oxW/q3Jyy/e59Z8edbU0AcS1jJhYakjwLCi1
         Osog==
X-Gm-Message-State: AOAM5324Aibh1BacT9DsNm5IGwQCurdYE0zSV8xJ3X3bIx/0ZEUo4y1d
        aYyhtCwsqEPVE8Na5M7gJkUCqkZ3xGZh19oqi2+s7Q==
X-Google-Smtp-Source: ABdhPJwqyPgR8L7LE6khdxgrPIVH5TCiWOInEzf7tOdB1v+aePHoRW00iTlxrRJkp5hvcQhokJqxZT4OmK0ZKsZsvWA=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr25834850ywe.140.1651763525340; Thu, 05
 May 2022 08:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220418141416.27529-1-asmaa@nvidia.com> <CH2PR12MB3895A1FB2977B725ED92AB57D7C29@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3895A1FB2977B725ED92AB57D7C29@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 17:11:54 +0200
Message-ID: <CACRpkdY1uK=73zpEM5zUyXacm5xaUUFYkuKMxi_q6vwmOPy6tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Add driver for Mellanox BlueField-3 GPIO controller
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Could you please have a look at this patch?

Sure!

> +static void mlxbf3_gpio_set(struct gpio_chip *chip, unsigned int
> +offset, int val) {

Put opening bracket on new line.
Run your code through scripts/checkpatch.pl before submitting.

> +       struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
> +
> +       /* Software can only control GPIO pins defined by ctrl_gpio_mask */
> +       if (!(BIT(offset) & gs->ctrl_gpio_mask))
> +               return;
> +
> +       if (val)
> +               writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_DATA_OUT_SET);
> +       else
> +               writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_DATA_OUT_CLEAR);
> +
> +       /* Make sure all previous writes are done before changing YU_GPIO_FW_CONTROL_SET */
> +       wmb();
> +
> +       /* This needs to be done last to avoid glitches */
> +       writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_CONTROL_SET); }

Bracket on new line. This coding style is very odd.

The hardware is a bit odd too but I see why you can't use GPIO_GENERIC
properly with this FW_CONTROL_SET business :/

> +static int mlxbf3_gpio_direction_input(struct gpio_chip *chip,
> +                                      unsigned int offset)
> +{
> +       struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +
> +       writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_OUTPUT_ENABLE_CLEAR);
> +       writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_CONTROL_CLEAR);
> +
> +       spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +
> +       return 0;
> +}
> +
> +static int mlxbf3_gpio_direction_output(struct gpio_chip *chip,
> +                                       unsigned int offset,
> +                                       int value)
> +{
> +       struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +
> +       writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_OUTPUT_ENABLE_SET);
> +
> +       spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +
> +       return 0;
> +}

Why isn't FW_CONTROL_CLEAR/SET used when making  a line
into an output? Seems unsymmetric? At least put a comment in the
code why this is different from making a line into input.

> +       /* To set the direction to input, just give control to HW by setting
> +        * YU_GPIO_FW_CONTROL_CLEAR.
> +        * If the GPIO is controlled by HW, read its value via read_data_in register.
> +        *
> +        * When the direction = output, the GPIO is controlled by SW and
> +        * datain=dataout. If software modifies the value of the GPIO pin,
> +        * the value can be read from read_data_in without changing the direction.
> +        */
> +       ret = bgpio_init(gc, dev, 4,
> +                       gs->gpio_io + YU_GPIO_READ_DATA_IN,
> +                       NULL,
> +                       NULL,
> +                       NULL,
> +                       NULL,
> +                       0);

Hm. Is it still worth it?

MVH
Linus Walleij
