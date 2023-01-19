Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5401F6739DE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjASNWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjASNVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:21:51 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBF183;
        Thu, 19 Jan 2023 05:21:49 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id x7so1459254qtv.13;
        Thu, 19 Jan 2023 05:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2YXU2FJo+t/nPqAWwtxUT6+gPscBXDImBHIMu0OQoE=;
        b=mZ1wsengVANkOpLmveEJz/cZ/OeeZqyyGrfyOojZoGAMu1KFEhdcSfXX91CJxKUUN3
         9RKbeafQCjnksI1Hq5+YqajMUTthJJIcGvZfCxF7Nx77igqbWTMMfvYap/Og1VTHgMT7
         NXxmqgd/MapFLBWzM7mRoSAT450SCn3/ZgC8rHN5NUDf3cN0z2eOmpmfdN6lQ1te/C5I
         CTnnlLtGUa8GqW1VDTtd2uf+1jLC/E2iHMtgspbwDc4A9YxPg0nqvKVjbM+5MmtGvDOe
         ApTeEer/LKLao15XbWpQKYw1gmB6+QO5kZqQHYWIZW8uCTOGcYqZPMghbSvLD9aiNWQw
         flpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2YXU2FJo+t/nPqAWwtxUT6+gPscBXDImBHIMu0OQoE=;
        b=sgqv+tdO9xINtatnbMOt3n9f8ILuhlFwbjVUouhqG5ndS+sUF0InlpOIyH5WcquCiT
         IrL55hYS/VrUsYF9f+hC31DOsq66/BJ9iiCaOixrZoxRsq73xirkpt2wVHP4G+7zNZ2R
         JXjfl6mX6rGQjWfhcZGE0rLYC5u0xNyg/9xfbUJaVlmLi+EDpVqLZXjku0sUjohayAmk
         Ou2UULkB3gEiLizq6ux3sO35qEsBqG0k4cGu81WxOSPpPHjVVtlnamlfzmEEfgBuOSfh
         oz3eCHuSQOMJtcbme+PlmjjjhFD9xbtOEcmOcgLoPoKAl9k1y8oWI31Sfo/EEqxf0CP1
         0IAg==
X-Gm-Message-State: AFqh2kqICXE6uP2AwMYyGnLTe96OJpl9dnGRCriEoyRju1/qRgJc5m66
        3ONWgHVvjM/HW5yGJxnQEiwHZ/cu0tXD1Fr8J4M=
X-Google-Smtp-Source: AMrXdXt0K5GhdCCtT122Dc/CITFbyoRnhv2Lafu/DlF77tVGiHkxbuQDut8cAmeznttld4vXHOVNpmvTniAz1BscjIE=
X-Received: by 2002:a05:622a:4115:b0:3b0:736:9de with SMTP id
 cc21-20020a05622a411500b003b0073609demr568846qtb.61.1674134508725; Thu, 19
 Jan 2023 05:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-2-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 15:21:12 +0200
Message-ID: <CAHp75Ve1WtkyvLDHmrmJT8erqZn2B1m0ak=PSiy5cWWF-11HKg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] leds: led-class: Add missing put_device() to led_put()
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
> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
>
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
>
> And also add a put_device() in the error-exit case of try_module_get()
> failing.

This sounds to me like a bugfix. Why not the Fixes tag?
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 6a8ea94834fa..7391d2cf1370 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -241,8 +241,10 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
>
>         led_cdev = dev_get_drvdata(led_dev);
>
> -       if (!try_module_get(led_cdev->dev->parent->driver->owner))
> +       if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
> +               put_device(led_cdev->dev);
>                 return ERR_PTR(-ENODEV);
> +       }
>
>         return led_cdev;
>  }
> @@ -255,6 +257,7 @@ EXPORT_SYMBOL_GPL(of_led_get);
>  void led_put(struct led_classdev *led_cdev)
>  {
>         module_put(led_cdev->dev->parent->driver->owner);
> +       put_device(led_cdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(led_put);
>
> --
> 2.39.0
>


-- 
With Best Regards,
Andy Shevchenko
