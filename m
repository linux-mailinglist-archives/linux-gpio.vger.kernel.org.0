Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6CC673A01
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjASNXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjASNW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:22:58 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B6483;
        Thu, 19 Jan 2023 05:22:57 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id i28so1143857qkl.6;
        Thu, 19 Jan 2023 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zcoTD5PovkPmANlTTS5Qwy054d3hEYvEjKQjgv7cQyE=;
        b=cjZQi7839ux3elJyARINBaqQL1O/K9GLO2JAtNK9aE7iZhCDMvtgPMzqvbzlVxTU1O
         1PubOgDz4F2H9UX6a/g0dz03U79dlvm5ormAhAp0cFmChA4I3+Tx048IbhBFKeHzaXsL
         1kkwgK/ltvWePXFFoF9Hgp5hhDevv73loZfRKbpGAwxSC/qvkZL1pHUSgm38LV+3BYFK
         tjokvPJGQoD8B/djiZK9V3bGB7QgSRFKuw+TxhLPbm0BQbjUqSV21Fuvz1y0lL/MNL81
         k9xpyicj67Nll6VijVIcPBTV2JuPE/ZA1nII2ejxQbkOFdg3HiqUx4WGO0VWN9dWnBRj
         Q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcoTD5PovkPmANlTTS5Qwy054d3hEYvEjKQjgv7cQyE=;
        b=q0DahdkWNlJhJ34FM6a6ZAKY5kKcDUdtx0EZW8jWX0nWzMRPlxQzOlNbhxkY79HMoY
         xsKbodETQjL3CflmIKrWyj3D6MUeDCaPHDOmCq0UDHpBJ+DhRjEMIJeBoedlPyD351jb
         eXuf9L1DywjNhsWVVb1erW/4XfefWenme0FqjYkqk3sErMbO0JpcNQ0HccFxWRPtns9a
         MvwMfySm9E0LIBS8r0XTrJcKVOANaLhhyXuPuneFuf1ULvHj8xMrbEXiHTh7wAmu/nXV
         wSXi53OxYwEO2VmnkliH1jFN0iNvuu5U91gfsJYzgE4G/b1MM1T5cR51jYYErny5201j
         eCzQ==
X-Gm-Message-State: AFqh2krgmiHw5rZBmCbXNFGQ5zuYcpH3/7AKbdSwyzvxRae4fAQmpmjw
        CJSo/UjLCJhmdfFrz6HJdXdf6HR5soTaFWbcJ3k=
X-Google-Smtp-Source: AMrXdXtXo/2kr7KcnvjVXhPwFpQ6aN3MS8XwRO2m4qvTK+6XUV7ngWRfTWLNGe344BUiLS9B28ccG8G/FtRlDkX60Xs=
X-Received: by 2002:a05:620a:36f4:b0:702:34dc:25a8 with SMTP id
 cz52-20020a05620a36f400b0070234dc25a8mr506965qkb.748.1674134576651; Thu, 19
 Jan 2023 05:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-3-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 15:22:20 +0200
Message-ID: <CAHp75Vd0gS6EPD5WBnL_dEpTmoALTXYm7rGtk4UAU8xZJeHFfQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] leds: led-class: Add led_module_get() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Split out part of of_led_get() into a generic led_module_get() helper
> function.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> led_get() function.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Rename helper from __led_get() to led_module_get()
> ---
>  drivers/leds/led-class.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 7391d2cf1370..743d97b082dc 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -215,6 +215,23 @@ static int led_resume(struct device *dev)
>
>  static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>
> +static struct led_classdev *led_module_get(struct device *led_dev)
> +{
> +       struct led_classdev *led_cdev;
> +
> +       if (!led_dev)
> +               return ERR_PTR(-EPROBE_DEFER);
> +
> +       led_cdev = dev_get_drvdata(led_dev);
> +
> +       if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
> +               put_device(led_cdev->dev);
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       return led_cdev;
> +}
> +
>  /**
>   * of_led_get() - request a LED device via the LED framework
>   * @np: device node to get the LED device from
> @@ -226,7 +243,6 @@ static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>  struct led_classdev *of_led_get(struct device_node *np, int index)
>  {
>         struct device *led_dev;
> -       struct led_classdev *led_cdev;
>         struct device_node *led_node;
>
>         led_node = of_parse_phandle(np, "leds", index);
> @@ -236,17 +252,7 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
>         led_dev = class_find_device_by_of_node(leds_class, led_node);
>         of_node_put(led_node);
>
> -       if (!led_dev)
> -               return ERR_PTR(-EPROBE_DEFER);
> -
> -       led_cdev = dev_get_drvdata(led_dev);
> -
> -       if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
> -               put_device(led_cdev->dev);
> -               return ERR_PTR(-ENODEV);
> -       }
> -
> -       return led_cdev;
> +       return led_module_get(led_dev);
>  }
>  EXPORT_SYMBOL_GPL(of_led_get);
>
> --
> 2.39.0
>


-- 
With Best Regards,
Andy Shevchenko
