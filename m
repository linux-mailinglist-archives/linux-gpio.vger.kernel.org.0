Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA66262BB4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgIIJYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgIIJYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:24:09 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986C3C061573;
        Wed,  9 Sep 2020 02:24:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b124so1602672pfg.13;
        Wed, 09 Sep 2020 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s7fosms2xCPd69twYs+ZS2L97rb2qJfbB0MnEWzeVVk=;
        b=cK1sw1kYcFj7HKWLh3isxH8RjB43lvVQovhxFJDMvwazwe/0VFbXl/+XFXHQh6I0UL
         uj4+LJSMip7qxMm/JdrG3FD/pxEPBM/NJXv878BgV5ppxZ6l6DJrbcjq+RI4jlg0fUAa
         ngtv7p9akXVqsfsJlaUBgpDLf8hZPZDEHP63lqDPvO4eIOf8qKGdh2HRJx41N6fmASN6
         6OBddsqBh3fAhkZgalH2V80sWcdex8xmHmHOFhzqtp9N8KC4kf+v2wrZnexKZ4UB9wVw
         COsteR/ryi9C7L4Kze3GZNWN9EUX72KfyUyPsdhA4SQYUeLBgLOeQjhKRedWQHbhmrq9
         hQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s7fosms2xCPd69twYs+ZS2L97rb2qJfbB0MnEWzeVVk=;
        b=fYYf937zv1ytlFLZBcYXf2nXlz9nF0aVk5AGv35a76BB2+qdyz5Of8VTWSvp1cOFby
         7c4uUzTLrnIjDPtP4QurvmLfP1HIcQJoGf7D7LAdJewCxUZ22iBTvXqjHkNqvu8P6U6A
         SE7+apMa/Llj5zC1QbriRUlSq//bY1LNxdQKprM3O0SvX6L/zF8H5tDgJP4nojXVYD5i
         IBk2rmazbjhSlr5wubsGH73UIkRA9gpoQREC0gelpM/kswLPSabk2i14zk1mfwSK1Ahc
         CUCmZlbb2y1Qx+RSbBRR9xBouk8r4GF7CA3hHA93QChjHqOm+5J5A10vDoK7gSn09MdJ
         C2Cw==
X-Gm-Message-State: AOAM533Y7ACAPOU8fa929rgQZP5RL9o7mZvGXyWvhAbiEPKsBbCVRQ+R
        m9tWBcbAsC5up/KLxsgfuS5E6k3Yluo=
X-Google-Smtp-Source: ABdhPJyLlBbGS0whYC2Dvu2l61YEBTRdaPWj+I4NOehqCjoCrKvCR32/yTHxG1Jc1mUXeRSkkKx7gA==
X-Received: by 2002:a62:52c8:0:b029:13e:d13d:a10b with SMTP id g191-20020a6252c80000b029013ed13da10bmr66172pfb.39.1599643446940;
        Wed, 09 Sep 2020 02:24:06 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2102471pfj.100.2020.09.09.02.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:24:06 -0700 (PDT)
Date:   Wed, 9 Sep 2020 17:24:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200909092401.GA1431678@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <20200905133549.24606-8-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905133549.24606-8-warthog618@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> 
> The struct linereq implementation is based on the v1 struct linehandle
> implementation.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> 

[snip]

>  		if (copy_from_user(&offset, ip, sizeof(offset)))
>  			return -EFAULT;
> @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
>  		 MAJOR(devt), gdev->id);
>  
>  	return 0;
> +	/*
> +	 * array sizes must ensure 64-bit alignment and not create holes in
> +	 * the struct packing.
> +	 */
> +	BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> +	BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> +
> +	/*
> +	 * check that uAPI structs are 64-bit aligned for 32/64-bit
> +	 * compatibility
> +	 */
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> +	BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
>  }
>  

A couple of things here - these should all be !IS_ALIGNED.
And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
after the return.

How would you like that fixed - v8 or a patch once v7 is in?

Cheers,
Kent.
