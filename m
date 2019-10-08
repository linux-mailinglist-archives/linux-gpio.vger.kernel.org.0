Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE967CF289
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 08:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbfJHGPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 02:15:19 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35374 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfJHGPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 02:15:19 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so10200730pfw.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2019 23:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IJPZbTEV9HDZellgSjhi2Dk1XARAVp6fQJrNqwnUEgg=;
        b=LdaGCCLdIRLOLCjmB92mh1lYyrFEZ1v5FmVqC1HjKOaF7sSepw1t+fc8aKV03yAZs9
         xl4y1/1O/mESFBB0LENcK6F8LcznMxxuJGqdBzFjXKAbwDgNz5NEJnyAwM/HKgzbHi2R
         zZ5lN9FIY+rlIKtqATEGIp9tVQTDYdo3J1D9XOcRkz8Syp+fJBT8hyH2ulB09v0HBxj3
         5go8XKWKI3xZA4uX+ZYe/uAeOrAS+vcgUuUaiFyCqe3gfdHnydQDVPHobd4CNK51vmGC
         KeIAIt6pkTiwz2itquL7cWtFbh9O72vgJmc2092vW73QbixiD/ALs4fU8qOOd/wAexwE
         WKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IJPZbTEV9HDZellgSjhi2Dk1XARAVp6fQJrNqwnUEgg=;
        b=Dzn1eZGhAoopXDq6KgUL6+PXtKnXvBQNoOsZsj5/VkcaBb08nXjXn2r32+uGi6ypp6
         CJWRFaclZJqD3Z9S5dMn4oKj6ltHf/Dg4E+Pf1erC3X9IggMtkTIIDujgmlYzk6FU0JK
         zj1wodb3iwD1XEAU5rv6r25E0xNCe1DZ+OL5owDWcjpQDiiDVkNu6HBkw+nbl12l7tlo
         VmGenxlzSca0mSdxfb60f6e9VhlQwJz6UsxKOsRPhR7605YsTnidxkl3HOIo69CKCRSG
         oPc+PnyIxm7QPbzNvSISVqO5LDlZ4Gdr5gpkxeE1+ufMaIFkdvtfZWSKu+LAoONvciYc
         hCAw==
X-Gm-Message-State: APjAAAXorylgptXnr5L/vAo3VDc3C67+v+4Kr2eii9B0E0nJJi+7o+2L
        N3W8xlOq9No20z0R43M8Jms=
X-Google-Smtp-Source: APXvYqzMfljCaC8saDXCAek+JBgmpfXqTqBTsz6EDXDWmbXgefM0u64aXrL2+XVnALeOt+gHmM/QOw==
X-Received: by 2002:a17:90a:f311:: with SMTP id ca17mr3631287pjb.112.1570515318408;
        Mon, 07 Oct 2019 23:15:18 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id ce16sm1051338pjb.29.2019.10.07.23.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 23:15:17 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:15:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, thomas.petazzoni@bootlin.com
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191008061512.GA19956@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921102522.8970-1-drew@pdp7.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 21, 2019 at 12:25:23PM +0200, Drew Fustini wrote:
> Add pull-up/pull-down flags to the gpio line get and
> set ioctl() calls.  Use cases include a push button
> that does not have an external resistor.
> 
> Addition use cases described by Limor Fried (ladyada) of
> Adafruit in this PR for Adafruit_Blinka Python lib:
> https://github.com/adafruit/Adafruit_Blinka/pull/59
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  drivers/gpio/gpiolib.c    | 12 ++++++++++++
>  include/uapi/linux/gpio.h |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d9074191edef..9da1093cc7f5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -427,6 +427,8 @@ struct linehandle_state {
>  	(GPIOHANDLE_REQUEST_INPUT | \
>  	GPIOHANDLE_REQUEST_OUTPUT | \
>  	GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> +	GPIOHANDLE_REQUEST_PULL_UP | \
> +	GPIOHANDLE_REQUEST_PULL_DOWN | \
>  	GPIOHANDLE_REQUEST_OPEN_DRAIN | \
>  	GPIOHANDLE_REQUEST_OPEN_SOURCE)
>  
> @@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
>  		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
>  			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +		if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> +			set_bit(FLAG_PULL_DOWN, &desc->flags);
> +		if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> +			set_bit(FLAG_PULL_UP, &desc->flags);
>  
>  		ret = gpiod_set_transitory(desc, false);
>  		if (ret < 0)
> @@ -1102,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
>  			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
>  					   GPIOLINE_FLAG_IS_OUT);
> +		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> +			lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
> +		if (test_bit(FLAG_PULL_UP, &desc->flags))
> +			lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
>  
>  		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>  			return -EFAULT;
> @@ -2475,6 +2485,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>  		clear_bit(FLAG_REQUESTED, &desc->flags);
>  		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
>  		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +		clear_bit(FLAG_PULL_UP, &desc->flags);
> +		clear_bit(FLAG_PULL_DOWN, &desc->flags);
>  		clear_bit(FLAG_IS_HOGGED, &desc->flags);
>  		ret = true;
>  	}
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 4ebfe0ac6c5b..c2d1f7d908d6 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -33,6 +33,8 @@ struct gpiochip_info {
>  #define GPIOLINE_FLAG_ACTIVE_LOW	(1UL << 2)
>  #define GPIOLINE_FLAG_OPEN_DRAIN	(1UL << 3)
>  #define GPIOLINE_FLAG_OPEN_SOURCE	(1UL << 4)
> +#define GPIOLINE_FLAG_PULL_UP	(1UL << 5)
> +#define GPIOLINE_FLAG_PULL_DOWN	(1UL << 6)
>  
>  /**
>   * struct gpioline_info - Information about a certain GPIO line
> @@ -62,6 +64,8 @@ struct gpioline_info {
>  #define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
>  #define GPIOHANDLE_REQUEST_OPEN_DRAIN	(1UL << 3)
>  #define GPIOHANDLE_REQUEST_OPEN_SOURCE	(1UL << 4)
> +#define GPIOHANDLE_REQUEST_PULL_UP	(1UL << 5)
> +#define GPIOHANDLE_REQUEST_PULL_DOWN	(1UL << 6)
>  
>  /**
>   * struct gpiohandle_request - Information about a GPIO handle request
> -- 
> 2.20.1
> 
Sorry for the late feedback, but I'm still not sure whether this patch
is on track to be applied or not.  I had thought not, at least not yet,
but just in case...

You have added the flags to linehandle_create, but not lineevent_create.
Given that your primary use case is push buttons, isn't the event request
at least as important as the handle request?  Even ignoring your use
case, I'd add them to lineevent_create just to maintain symmetry.

Also, is it valid to set PULL_UP and PULL_DOWN simulaneously?
I would think not, but I could be wrong.
If not then that combination should be rejected with EINVAL.

Cheers,
Kent.
