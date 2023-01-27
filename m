Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429C567E275
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 12:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbjA0LAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 06:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjA0LAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 06:00:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F091C40E5;
        Fri, 27 Jan 2023 02:59:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8592361B04;
        Fri, 27 Jan 2023 10:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D55C43442;
        Fri, 27 Jan 2023 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817190;
        bh=/gHWqkY7YRT7jthNZnaDPMsPI2uZxEdBfVoNrDOdKZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZwzB721qVdzr0UDO8Axjrp5yh6NW2gApFj9DeDSSoZxEK5wXhYhUOeyHhlpXtVcam
         bVvdOFHPokzCdEkbxTqh/WDAsp/OyEWpbQaKjEfcMhV+IiCVUkFfz0HIyJ4O722vHz
         NPEM9k2rZCE19lW0o0wOHlE3G+eO/NWdEfa6OhlOfT1TXcwEKuVTvhItnv154q28J6
         qJQvSPO5+wMNbg9/hXjv3/MJrtybRrIFDJA3CP6uu4H/TuUkhxvVYxv4U52S63Dh1F
         kJ7WYvcwS5ZNmO1SUs9C2v+liis2Sg3i5Ct2IfThIFDhnddX+mJdmYvhcWBH+P8EcD
         OIcwOKMeWuEjA==
Date:   Fri, 27 Jan 2023 10:59:43 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 05/11] [RFC] leds: led-class: Add devicetree support
 to led_get()
Message-ID: <Y9Oun95Yv85qiktU@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-6-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Jan 2023, Hans de Goede wrote:

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
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 0c4b8d8d2b4f..2f3af6e30208 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -234,19 +234,18 @@ static struct led_classdev *led_module_get(struct device *led_dev)
>  	return led_cdev;
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
> +					 const char *name)
>  {
>  	struct device *led_dev;
>  	struct device_node *led_node;
>  
> +	/*
> +	 * For named LEDs, first look up the name in the "led-names" property.
> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 */
> +	if (name)
> +		index = of_property_match_string(np, "led-names", name);
>  	led_node = of_parse_phandle(np, "leds", index);
>  	if (!led_node)
>  		return ERR_PTR(-ENOENT);
> @@ -256,6 +255,19 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
>  
>  	return led_module_get(led_dev);
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
> +	return __of_led_get(np, index, NULL);
> +}
>  EXPORT_SYMBOL_GPL(of_led_get);
>  
>  /**
> @@ -329,9 +341,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>  struct led_classdev *led_get(struct device *dev, char *con_id)
>  {
>  	struct led_lookup_data *lookup;
> +	struct led_classdev *led_cdev;
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> +	if (dev->of_node) {
> +		led_cdev = __of_led_get(dev->of_node, -1, con_id);
> +		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +			return led_cdev;
> +	}
> +
>  	mutex_lock(&leds_lookup_lock);
>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> -- 
> 2.39.0
> 

-- 
Lee Jones [李琼斯]
