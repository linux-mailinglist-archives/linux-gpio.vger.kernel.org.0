Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC00D673A10
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjASN0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjASN0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:26:03 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC34783;
        Thu, 19 Jan 2023 05:26:01 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id x5so1515363qti.3;
        Thu, 19 Jan 2023 05:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T1WGlGeyNetZjTRTiM/7cfE6svyPDuUmGFWeG5I+voM=;
        b=DXTNNqGq+xf65vWikEFWE5XImXIPuoNGUDShzGQ43dteYnqoiUfKaojVpk9u0htNjK
         D2RpJDyWOefeSCUXMZVk+Jrel/whIwcr86pL1Z/7vNix3qyxzedZaku8IM31cW1pl8dX
         RjfLH6H+evjf6HgQPlf0wFibB2q5nZj55GHXwKDyXVGXY7/vf9V896sEIyeNvrTzw5qP
         nbJaegukLbI7GK1gbEn/REo1Zw99fc54mu/GFsc529SWJteuhSs9cVIhEiU4kQcI0qEH
         p8OoVvIk14J5KLtxo2Uhk3Jy8hzZaq4BXcRRT6dgk+AuMhnQoCZwfcA04luWWDUkGKDf
         LDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1WGlGeyNetZjTRTiM/7cfE6svyPDuUmGFWeG5I+voM=;
        b=Y5CnG1oi0a91b5NEpzyR9/9pN/BNUtRNmpQWujtwdJjOpSWN2xAr+WFjU4CjCbFD4Q
         76xik0G/wGDHz0P+bAK7dknQcJ+zXKm5MYOKAUXu5Rp6y6KxATiDlrkda2huIo41waOo
         kwISbCHEpdTXClmRT5Dl6smAKqev5rsR0UZmrfiJTGew1ScGv8eOR/lt6w82fbt5Mh2A
         evVBIpNIN3cs3pgfy71OjW/jkA4QY7aDce6p4s2U9g7ZYVRHWKsja7o8mlShHYnhMN/g
         CRC+D9I/8uaOqXfynYfMWtJAJ4sYF1i1/1eBwhQvvlI0M5RSZIXAEf+aJd73Cv1Heu5n
         hftg==
X-Gm-Message-State: AFqh2kpGQWItprU5KqplOtlUmzPuYxAwst686uPPqehz3Ken6B5OV3zd
        xArgdgGj9hZXI6rqNxkHUp2V6TWjC15VfwKP0g8=
X-Google-Smtp-Source: AMrXdXs1KFZ1YZRV38FYpYSPnTld1k63n4bEYDq75Gs6nrKyMXW/1qtmjEFh3hDwbV7AqsDju0NV3xLcSyGsYvcUtys=
X-Received: by 2002:a05:622a:4209:b0:3b1:328c:ff11 with SMTP id
 cp9-20020a05622a420900b003b1328cff11mr288833qtb.195.1674134760944; Thu, 19
 Jan 2023 05:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-4-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 15:25:25 +0200
Message-ID: <CAHp75VeoemmSeYjhv5h2Z929X7dAu5yRH333+xPTffv59PAnPQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] leds: led-class: Add __devm_led_get() helper
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
> Add a __devm_led_get() helper which registers a passed in led_classdev
> with devm for unregistration.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> devm_led_get() function.

It's just a move of the existing code...
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
...but I would expect that someone converts this to use
devm_add_action_or_reset().

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 743d97b082dc..4904d140a560 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -274,6 +274,22 @@ static void devm_led_release(struct device *dev, void *res)
>         led_put(*p);
>  }
>
> +static struct led_classdev *__devm_led_get(struct device *dev, struct led_classdev *led)
> +{
> +       struct led_classdev **dr;
> +
> +       dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *), GFP_KERNEL);
> +       if (!dr) {
> +               led_put(led);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       *dr = led;
> +       devres_add(dev, dr);
> +
> +       return led;
> +}
> +
>  /**
>   * devm_of_led_get - Resource-managed request of a LED device
>   * @dev:       LED consumer
> @@ -289,7 +305,6 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>                                                   int index)
>  {
>         struct led_classdev *led;
> -       struct led_classdev **dr;
>
>         if (!dev)
>                 return ERR_PTR(-EINVAL);
> @@ -298,17 +313,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>         if (IS_ERR(led))
>                 return led;
>
> -       dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *),
> -                         GFP_KERNEL);
> -       if (!dr) {
> -               led_put(led);
> -               return ERR_PTR(-ENOMEM);
> -       }
> -
> -       *dr = led;
> -       devres_add(dev, dr);
> -
> -       return led;
> +       return __devm_led_get(dev, led);
>  }
>  EXPORT_SYMBOL_GPL(devm_of_led_get);
>
> --
> 2.39.0
>


-- 
With Best Regards,
Andy Shevchenko
