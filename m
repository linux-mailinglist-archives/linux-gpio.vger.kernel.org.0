Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B08132037
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 08:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgAGHKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 02:10:10 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:40329 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgAGHKK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 02:10:10 -0500
Received: by mail-yw1-f65.google.com with SMTP id i126so23024656ywe.7;
        Mon, 06 Jan 2020 23:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ey0lnzHzmQLwVLdwq6/tWTcwxcnW6GyoYXTGE3x4Qjk=;
        b=X1ISIrzs4WaVMH2bPRjK2I9ifP9NY3VIPpdDmeYOA4KYErkRpzGKv7QWGKs2AE0Hmt
         gzIz+qIAf0g7spCrQhrMzl7+yWq0ndUsTKUjgFsB84ZQxbCiteEAsb0hpWBkAJ508ITb
         G6JFWOGK2Bcdu6mOf1nG+fWh+Q1p9x2NezxEKWhG53oZk59GLhVwRmZC4KaOUzwjKrF6
         BK3WdUhI9pLbpJLMJjOK8d3QIdotRnd/W2nnxtFDdxGA9xAaBbp6ZAi4F0uQH68nQnWE
         vrn8VM2AulKpK4wOa32KH6rFQiE7SoqwMZADrzWIMdRqVgEloUkKGOsXTNDR5cH1AV0i
         ZOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ey0lnzHzmQLwVLdwq6/tWTcwxcnW6GyoYXTGE3x4Qjk=;
        b=TV5kXNYxJWfTAO5oeJIIcXifObMeCC9RiY4WwoIoKCW8QKz+As+hHEGwDkdBIqW6UH
         yidlsJPyyXoG4qvquxMV4unQAu0uTWR3R8guHY4FRl/X4HocLx622WP77OSMwctgsD4i
         Xnt5IYJcU/8bYZi6C6tSqKCrhJJPfs3TSHERW+opSRv1BhLbxHFpug+9fCikyZEuF2CR
         Iimkpx/VOjUfb9S7oehsW53fVkSG//kfjzAE4hSFwu10VCyOP8Uvfk5JcgGmlIUiNzVR
         ghIRsq1Sm3ga0nKwOk8kYd09gstzrJvOZALmp9OdEw387fSEuZ5IcXQg5zxxurHw5luu
         kvWg==
X-Gm-Message-State: APjAAAWozX6F35r2APbK6TQYiHEW1JHBJZCVTEE7UFW8zvjLwd/ilnZN
        lytunH/f/nnSGGLDn6Squ7w=
X-Google-Smtp-Source: APXvYqwYWWuHUFGCjaJ3Dp8C9Sh7NMVk8XWwJ7Q7W+dW5zCjo61qdP+bwW32G5MBa8TAV8HVhy1Wcw==
X-Received: by 2002:a0d:cb48:: with SMTP id n69mr77694778ywd.48.1578381008693;
        Mon, 06 Jan 2020 23:10:08 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id n3sm29593945ywd.35.2020.01.06.23.10.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 23:10:08 -0800 (PST)
Subject: Re: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
From:   Frank Rowand <frowand.list@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <20191230133852.5890-3-geert+renesas@glider.be>
 <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
Message-ID: <70d24070-4f6d-8fc8-1214-1bd800cb5246@gmail.com>
Date:   Tue, 7 Jan 2020 01:10:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/6/20 5:34 PM, Frank Rowand wrote:
> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
>> As GPIO hogs are configured at GPIO controller initialization time,
>> adding/removing GPIO hogs in DT overlays does not work.
>>
>> Add support for GPIO hogs described in DT overlays by registering an OF
>> reconfiguration notifier, to handle the addition and removal of GPIO hog
>> subnodes to/from a GPIO controller device node.
>>
>> Note that when a GPIO hog device node is being removed, its "gpios"
>> properties is no longer available, so we have to keep track of which
>> node a hog belongs to, which is done by adding a pointer to the hog's
>> device node to struct gpio_desc.
> 
> If I have read the patches and the existing overlay source correctly,
> then some observations:
> 
> - A gpio hog node added in an overlay will be properly processed.
> 
> - A gpio hog node already existing in the live devicetree, but with a
>   non-active status will be properly processed if the status of the
>   gpio hog node is changed to "ok" in the overlay.
> 
> - If a gpio hog node already exists in the live devicetree with an
>   active status, then any updated or added properties in that gpio
>   hog node in the overlay will have no effect.
> 
>   There is a scenario where the updated property would have an effect:
>   apply a second overlay that sets the status to inactive, then apply
>   a third overlay that sets the status back to active.  This is a
>   rather contrived example and I think it should be documented as
>   not supported and the result undefined.

I went back and double checked the related code.  For gpio hog nodes
that are in a non-overlay, the status property is checked because
of_gpiochip_scan_gpios() uses for_each_available_child_of_node()
to search for gpio hog nodes, and for_each_available_child_of_node()
checks the status property.  But in the case of a gpio hog node
added by an overlay, of_gpio_notify() does not check the status
property in the gpio hog node.  The check for the status property
should be added to of_gpio_notify().

-Frank

> 
> It would be good to document this explicitly.
> 
> 
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/gpio/gpiolib-of.c | 84 +++++++++++++++++++++++++++++++++++++++
>>  drivers/gpio/gpiolib-of.h |  2 +
>>  drivers/gpio/gpiolib.c    | 14 +++++--
>>  drivers/gpio/gpiolib.h    |  3 ++
>>  4 files changed, 100 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index dfae797846bb746b..89a6138ac0a4b506 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -649,6 +649,10 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
>>  		ret = gpiod_hog(desc, name, lflags, dflags);
>>  		if (ret < 0)
>>  			return ret;
>> +
>> +#ifdef CONFIG_OF_DYNAMIC
>> +		desc->hog = hog;
>> +#endif
>>  	}
>>  
>>  	return 0;
>> @@ -676,11 +680,91 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
>>  			of_node_put(np);
>>  			return ret;
>>  		}
>> +
>> +		of_node_set_flag(np, OF_POPULATED);
>>  	}
>>  
>>  	return 0;
>>  }
>>  
>> +#ifdef CONFIG_OF_DYNAMIC
>> +/**
>> + * of_gpiochip_remove_hog - Remove all hogs in a hog device node
>> + * @chip:	gpio chip to act on
>> + * @hog:	device node describing the hogs
>> + */
>> +static void of_gpiochip_remove_hog(struct gpio_chip *chip,
>> +				   struct device_node *hog)
>> +{
>> +	struct gpio_desc *descs = chip->gpiodev->descs;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < chip->ngpio; i++) {
>> +		if (test_bit(FLAG_IS_HOGGED, &descs[i].flags) &&
>> +		    descs[i].hog == hog)
>> +			gpiochip_free_own_desc(&descs[i]);
>> +	}
>> +}
>> +
>> +static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
>> +{
>> +	return chip->gpiodev->dev.of_node == data;
>> +}
>> +
>> +static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
>> +{
>> +	return gpiochip_find(np, of_gpiochip_match_node);
>> +}
>> +
>> +static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
>> +			  void *arg)
>> +{
>> +	struct of_reconfig_data *rd = arg;
>> +	struct gpio_chip *chip;
>> +	int ret;
>> +
>> +	switch (of_reconfig_get_state_change(action, arg)) {
>> +	case OF_RECONFIG_CHANGE_ADD:
>> +		if (!of_property_read_bool(rd->dn, "gpio-hog"))
>> +			return NOTIFY_OK;	/* not for us */
>> +
>> +		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
>> +			return NOTIFY_OK;
> 
> I don't think OF_POPULATED could be already set.  It seems to be a
> bug if it is.
> 
> 
>> +
>> +		chip = of_find_gpiochip_by_node(rd->dn->parent);
>> +		if (chip == NULL)
>> +			return NOTIFY_OK;	/* not for us */
> 
> If I understand correctly, "not for us" is a misleading comment.
> The notification is for the node rd->dn->parent, but the device
> does not exist, so we can't do the hogging at the moment.  (If the
> device is created later, then the gpio hog child node will exist,
> and the init will "do the right thing" with the hog node -- so
> not a problem.)
> 
>  
>> +
>> +		ret = of_gpiochip_add_hog(chip, rd->dn);
>> +		if (ret < 0) {
>> +			pr_err("%s: failed to add hogs for %pOF\n", __func__,
>> +			       rd->dn);
>> +			of_node_clear_flag(rd->dn, OF_POPULATED);
>> +			return notifier_from_errno(ret);
>> +		}
>> +		break;
>> +
>> +	case OF_RECONFIG_CHANGE_REMOVE:
>> +		if (!of_node_check_flag(rd->dn, OF_POPULATED))
>> +			return NOTIFY_OK;	/* already depopulated */
> 
> I don't think OF_POPULATED could be already cleared.  It seems to be a
> bug if it is.
> 
>> +
>> +		chip = of_find_gpiochip_by_node(rd->dn->parent);
>> +		if (chip == NULL)
>> +			return NOTIFY_OK;	/* not for us */
> 
> Again, a misleading comment.
> 
>> +
>> +		of_gpiochip_remove_hog(chip, rd->dn);
>> +		of_node_clear_flag(rd->dn, OF_POPULATED);
>> +		break;
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +struct notifier_block gpio_of_notifier = {
>> +	.notifier_call = of_gpio_notify,
>> +};
>> +#endif /* CONFIG_OF_DYNAMIC */
>> +
>>  /**
>>   * of_gpio_simple_xlate - translate gpiospec to the GPIO number and flags
>>   * @gc:		pointer to the gpio_chip structure
>> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
>> index 9768831b1fe2f25b..ed26664f153782fc 100644
>> --- a/drivers/gpio/gpiolib-of.h
>> +++ b/drivers/gpio/gpiolib-of.h
>> @@ -35,4 +35,6 @@ static inline bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
>>  }
>>  #endif /* CONFIG_OF_GPIO */
>>  
>> +extern struct notifier_block gpio_of_notifier;
>> +
>>  #endif /* GPIOLIB_OF_H */
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index bff5ac774d870b67..ef12cfcaf0962c1c 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2952,6 +2952,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>>  		clear_bit(FLAG_PULL_DOWN, &desc->flags);
>>  		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
>>  		clear_bit(FLAG_IS_HOGGED, &desc->flags);
>> +#ifdef CONFIG_OF_DYNAMIC
>> +		desc->hog = NULL;
>> +#endif
>>  		ret = true;
>>  	}
>>  
>> @@ -5145,10 +5148,15 @@ static int __init gpiolib_dev_init(void)
>>  	if (ret < 0) {
>>  		pr_err("gpiolib: failed to allocate char dev region\n");
>>  		bus_unregister(&gpio_bus_type);
>> -	} else {
>> -		gpiolib_initialized = true;
>> -		gpiochip_setup_devs();
>> +		return ret;
>>  	}
>> +
>> +	gpiolib_initialized = true;
>> +	gpiochip_setup_devs();
>> +
>> +	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
>> +		WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
>> +
>>  	return ret;
>>  }
>>  core_initcall(gpiolib_dev_init);
>> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
>> index a4a759920faa48ab..7af9931e8572304a 100644
>> --- a/drivers/gpio/gpiolib.h
>> +++ b/drivers/gpio/gpiolib.h
>> @@ -118,6 +118,9 @@ struct gpio_desc {
>>  	const char		*label;
>>  	/* Name of the GPIO */
>>  	const char		*name;
>> +#ifdef CONFIG_OF_DYNAMIC
>> +	struct device_node	*hog;
>> +#endif
>>  };
>>  
>>  int gpiod_request(struct gpio_desc *desc, const char *label);
>>
> 
> 

