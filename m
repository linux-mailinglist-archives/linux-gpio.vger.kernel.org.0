Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AA43B934A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 16:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhGAO1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 10:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbhGAO1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 10:27:11 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF536C061762;
        Thu,  1 Jul 2021 07:24:40 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id in17-20020a17090b4391b0290170ba0ec7fcso6732887pjb.4;
        Thu, 01 Jul 2021 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mW1av2xdS1y2jG3ZVCe9a+vSXQ1T1E+gfBtuwxq5unk=;
        b=nvfJR6qQdw1paCfrrtoYPSZdPb8p2EjkJxnL4srGXcI6juBkHU6iUXG5h458hRWEIv
         21lfzIuboj+UfJaHB2XKPmSay/KTTdCgHXKogF8/ChqCJw4YEt3JfcsyivGs+CGaLePz
         Gcj6NsTpOHJBZmHFMWtOymA8Wa7MSvn+8aG/8Eq6NXKxbjljMXGp4df0bcCRmYX3fO4K
         zV5x9ax1Wq0JoEbPOjxIkjCbxOivNEd727bhdiY6qXpHH/G0WrhL8A/4LpsTSUXuPfsz
         18KFP2ABfTLduVpF2HPj5eiEhqVjWAvo14BcciV6S4kPqzd1pKC+jKhqDcfWL8IfTzul
         Lfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mW1av2xdS1y2jG3ZVCe9a+vSXQ1T1E+gfBtuwxq5unk=;
        b=HvZR/OpuDGMwGeH3hHSFAQQhp4lVKzdLvWk7wC1gXQH2yu5lYbk/ZVO7cp8WbBoxSB
         +ADPVzocQWhH3fogetl8fVgT1wMVDGLy2z/2HvkhX/U59d/F4lFQDvNxQ4m3f2aJ0xzX
         gIKRJY0eN0zcAzTzcGfBGX4f0GcJ0VEKzqKDeOBKVlga0uMpZdvSe6L3xrz4CV3YnOQT
         rdamfHiFTQVpRQVvpZ2yq7KDk6TwHHJHrtxnRB9vJqFDkbzDzKNZQ2tk1BephzeP390W
         o4CdFF38ORaV7aFc1yStAmy8oWhZd+2YD/Dr0LZRuU7h2f57tNQReSojM2HhCGcxdam7
         9nQQ==
X-Gm-Message-State: AOAM533hhhOxSXF4cLeCFbX1nUEFHGHXZL/3LBlX8xSDO1bqSYmvpVKh
        ctBTxFDT67wGBIfkMSqEJCM=
X-Google-Smtp-Source: ABdhPJwN8TK5iwZB8PkGLcVbcZBrAQy2hxo1r4BcZKhVigrizTzGD6K+OZwq5uWYe/dzjVShDlT/qg==
X-Received: by 2002:a17:90a:3ccf:: with SMTP id k15mr28417657pjd.226.1625149480366;
        Thu, 01 Jul 2021 07:24:40 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id t3sm204251pfl.44.2021.07.01.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:24:39 -0700 (PDT)
Date:   Thu, 1 Jul 2021 22:24:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <20210701142433.GC34285@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625235532.19575-9-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 04:55:29PM -0700, Dipen Patel wrote:
> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, it retrieves timestamp in nano seconds by
> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
> it disables this functionality by calling gpiod_hw_timestamp_control.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
>  include/uapi/linux/gpio.h   |  1 +
>  2 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 1631727bf0da..9f98c727e937 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -518,6 +518,7 @@ struct linereq {
>  	 GPIO_V2_LINE_DRIVE_FLAGS | \
>  	 GPIO_V2_LINE_EDGE_FLAGS | \
>  	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> +	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
>  	 GPIO_V2_LINE_BIAS_FLAGS)
>  
>  static void linereq_put_event(struct linereq *lr,
> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
>  
>  static u64 line_event_timestamp(struct line *line)
>  {
> +	bool block;
> +
>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>  		return ktime_get_real_ns();
>  
> +	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
> +		if (irq_count())
> +			block = false;
> +		else
> +			block = true;
> +
> +		return gpiod_get_hw_timestamp(line->desc, block);
> +	}
> +

Use in_task() instead of block?

>  	return ktime_get_ns();
>  }
>  
> @@ -828,6 +840,7 @@ static int edge_detector_setup(struct line *line,
>  		return ret;
>  
>  	line->irq = irq;
> +
>  	return 0;
>  }
>  

Remove gratuitous whitespace changes.
If you dislike the formatting then suggest it in a separate patch.

> @@ -891,7 +904,6 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  	/* Return an error if an unknown flag is set */
>  	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
>  		return -EINVAL;
> -
>  	/*
>  	 * Do not allow both INPUT and OUTPUT flags to be set as they are
>  	 * contradictory.
> @@ -900,6 +912,14 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
>  		return -EINVAL;
>  

Same here.

> +	/*
> +	 * Do not mix with any other clocks if hardware assisted timestamp is
> +	 * asked.
> +	 */
> +	if ((flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME) &&
> +	    (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE))
> +		return -EINVAL;
> +

The comment is very hw timestamp centric. It should just be something
along the lines of "only allow one event clock source".

>  	/* Edge detection requires explicit input. */
>  	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
>  	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
> @@ -992,6 +1012,8 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
>  
>  	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
>  		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
> +	assign_bit(FLAG_EVENT_CLOCK_HARDWARE, flagsp,
> +		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE);
>  }
>  
>  static long linereq_get_values(struct linereq *lr, void __user *ip)
> @@ -1139,6 +1161,18 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>  			int val = gpio_v2_line_config_output_value(lc, i);
>  
>  			edge_detector_stop(&lr->lines[i]);
> +
> +			/*
> +			 * Assuming line was input before and hardware
> +			 * assisted timestamp only timestamps the input
> +			 * lines.
> +			 */
> +			if (gpiod_is_hw_timestamp_enabled(desc)) {
> +				ret = gpiod_hw_timestamp_control(desc, false);
> +				if (ret)
> +					return ret;
> +			}
> +

So if you fail to disable the hw timestamp then you fail the set_config?
Does that make sense?
It should be impossible to fail, as per the preceding edge_detector_stop(),
or any failure in this context is irrelevant and so can be ignored.

>  			ret = gpiod_direction_output(desc, val);
>  			if (ret)
>  				return ret;
> @@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>  					polarity_change);
>  			if (ret)
>  				return ret;
> +
> +			/* Check if new config sets hardware assisted clock */
> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> +				ret = gpiod_hw_timestamp_control(desc, true);
> +				if (ret)
> +					return ret;
> +			}
>  		}
>  

The error code here can come from the pinctrl timestamp_control(), so it
should be sanitised before being returned to userspace.

>  		blocking_notifier_call_chain(&desc->gdev->notifier,
> @@ -1281,8 +1322,12 @@ static void linereq_free(struct linereq *lr)
>  
>  	for (i = 0; i < lr->num_lines; i++) {
>  		edge_detector_stop(&lr->lines[i]);
> -		if (lr->lines[i].desc)
> +		if (lr->lines[i].desc) {
> +			if (gpiod_is_hw_timestamp_enabled(lr->lines[i].desc))
> +				gpiod_hw_timestamp_control(lr->lines[i].desc,
> +							   false);
>  			gpiod_free(lr->lines[i].desc);
> +		}

Potential race on gpiod_is_hw_timestamp_enabled() and the call to
gpiod_hw_timestamp_control()?
Why not put the gpiod_is_hw_timestamp_enabled() check inside
gpiod_hw_timestamp_control()?

And the gpiod_hw_timestamp_control() call should be moved inside
gpiod_free(), or more correctly gpiod_free_commit().
i.e. whenever you free the gpio you release any associated hw timestamp.

>  	}
>  	kfifo_free(&lr->events);
>  	kfree(lr->label);
> @@ -1409,6 +1454,15 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  					flags & GPIO_V2_LINE_EDGE_FLAGS);
>  			if (ret)
>  				goto out_free_linereq;
> +
> +			/*
> +			 * Check if hardware assisted timestamp is requested
> +			 */
> +			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
> +				ret = gpiod_hw_timestamp_control(desc, true);
> +				if (ret)
> +					goto out_free_linereq;
> +			}
>  		}
>  

Comment can fit on one line, and probably isn't even necessary - the
code is clear enough.

>  		blocking_notifier_call_chain(&desc->gdev->notifier,
> @@ -1956,8 +2010,15 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
>  		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
>  
> +	/*
> +	 * Practically it is possible that user will want both the real time
> +	 * and hardware timestamps on GPIO events, for now however lets just
> +	 * work with either clocks
> +	 */
>  	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
>  		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
> +	else if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &desc->flags))
> +		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
>

If there is any need or intent to support multiple clock sources then
avoid creeping API changes and add it now.
Either way, drop the comment.

>  	debounce_period_us = READ_ONCE(desc->debounce_period_us);
>  	if (debounce_period_us) {
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index eaaea3d8e6b4..d360545b4c21 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
>  	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
>  	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
>  	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
> +	GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE	= _BITULL(12),
>  };
>  
>  /**
> -- 
> 2.17.1
> 

Cheers,
Kent.
