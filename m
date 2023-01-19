Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECF9673A36
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbjASNaL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjASN34 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:29:56 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A86978AB4;
        Thu, 19 Jan 2023 05:29:53 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id o5so1487298qtr.11;
        Thu, 19 Jan 2023 05:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJsnKAW5czYReP1l0WHmpg7CvVnsgZTaszvE4xXva0o=;
        b=GzIGfo1W1z4JeN1oXmrDXGTVCiyQoUIvf10yo8QiLpVcGOaWbx6EHMEAo3XPZLWBYZ
         H4tK2wc79RvNcEgX2FGDF0eBTpu//ph8InoDGnY7OaJb46MJFGoshLGXDw+9EPJ91JxM
         04GyMT6bzY/C/xrliHh63hw466fTG+d187sA4AMejOBcCJmVQHvOfL8Y76NR52gMSjSy
         k9S9U9UXVZpPCE6dSr8vQyZX6Fjosy+zueiYNf2xnAyk72toIFAqY9zVn/CiImx1OLfS
         BsnPO94tC8hfCDvrOBU9kZ3VhkR3Xr/hZy4zKNRrvOy+frHEGW+s3MtItJHQjRa1L3B+
         t9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJsnKAW5czYReP1l0WHmpg7CvVnsgZTaszvE4xXva0o=;
        b=kTW+78uyL3RYQeU08Q/nk/pkouH4NFjmLqZaI4bh95n3gkyowAOB5ZDD+XYBJO3/WP
         yzhKUZmF76JBNyyXlLva4wgf7ipPcjFN8jeP559WpI44usETpgQ7sWcYkFt7D17IEYot
         10beI2GvvfUSY1V0Q3q5i8O1s/m+dF76ebuwtfPp/B1bkZUC4Dnn1O5aPlV6CPIkpmWs
         o0xw4Y5jo7yiiXyz6nHSww2evlZKZnxF+qtuo4a+88MPGPVpkZEwoqhH6QJ+XZ1F9AWZ
         dG+JZeG5QvPjmHy61m5TKhKtBcmDyMhV57x8k2xc/VdR6fQhRTlwrDQZlw5BulUn+OEL
         yZcg==
X-Gm-Message-State: AFqh2kphp08Ime5QcnzfaJ62SKWIbuo+FsER/faFQH+F1Zn3ZwfnIloh
        OIL3JT/RXQujAua3D0BAxEJ8BWbw5HK51NIerzQ=
X-Google-Smtp-Source: AMrXdXtvPQG47Hfb/jLGp2xpZ7OB4WNLf6RHL4we4AOYzU7NSAW0pYdm+4/bohdWJ8uURRqoBAPYhDLt+Jkmk3n8BoY=
X-Received: by 2002:a05:622a:4115:b0:3b0:736:9de with SMTP id
 cc21-20020a05622a411500b003b0073609demr570217qtb.61.1674134992445; Thu, 19
 Jan 2023 05:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-6-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 15:29:16 +0200
Message-ID: <CAHp75VdO+mBZXeMpexqQNCN0eTBa6a9O=pJz-rgTLSmtNNu4BA@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] [RFC] leds: led-class: Add devicetree support to led_get()
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
> Turn of_led_get() into a more generic __of_led_get() helper function,
> which can lookup LEDs in devicetree by either name or index.
>
> And use this new helper to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
>
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
>
> Note the new led-names property for LED consumers is not added
> to the devicetree documentation because there seems to be no
> documentation for the leds property itself to extend it with this.
> It seems that how LED consumers should be described is not documented
> at all ATM.
>
> This patch is marked as RFC because of both the missing devicetree
> documentation and because there are no devicetree users of
> the generic [devm_]led_get() function for now.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Yeah, it's a pity we have no documentation for the LED properties...

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 6dff57c41e96..22f658c750d1 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -234,19 +234,18 @@ static struct led_classdev *led_module_get(struct device *led_dev)
>         return led_cdev;
>  }
>
> -/**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> - * @index: the index of the LED
> - *
> - * Returns the LED device parsed from the phandle specified in the "leds"
> - * property of a device tree node or a negative error-code on failure.
> - */
> -struct led_classdev *of_led_get(struct device_node *np, int index)
> +static struct led_classdev *__of_led_get(struct device_node *np, int index,
> +                                        const char *name)
>  {
>         struct device *led_dev;
>         struct device_node *led_node;
>
> +       /*
> +        * For named LEDs, first look up the name in the "led-names" property.
> +        * If it cannot be found, then of_parse_phandle() will propagate the error.
> +        */
> +       if (name)
> +               index = of_property_match_string(np, "led-names", name);
>         led_node = of_parse_phandle(np, "leds", index);
>         if (!led_node)
>                 return ERR_PTR(-ENOENT);
> @@ -256,6 +255,19 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
>
>         return led_module_get(led_dev);
>  }
> +
> +/**
> + * of_led_get() - request a LED device via the LED framework
> + * @np: device node to get the LED device from
> + * @index: the index of the LED
> + *
> + * Returns the LED device parsed from the phandle specified in the "leds"
> + * property of a device tree node or a negative error-code on failure.
> + */
> +struct led_classdev *of_led_get(struct device_node *np, int index)
> +{
> +       return __of_led_get(np, index, NULL);
> +}
>  EXPORT_SYMBOL_GPL(of_led_get);
>
>  /**
> @@ -329,9 +341,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>  struct led_classdev *led_get(struct device *dev, char *function)
>  {
>         struct led_lookup_data *lookup;
> +       struct led_classdev *led_cdev;
>         const char *led_name = NULL;
>         struct device *led_dev;
>
> +       if (dev->of_node) {
> +               led_cdev = __of_led_get(dev->of_node, -1, function);
> +               if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +                       return led_cdev;
> +       }
> +
>         mutex_lock(&leds_lookup_lock);
>         list_for_each_entry(lookup, &leds_lookup_list, list) {
>                 if (!strcmp(lookup->consumer_dev_name, dev_name(dev)) &&
> --
> 2.39.0
>


-- 
With Best Regards,
Andy Shevchenko
