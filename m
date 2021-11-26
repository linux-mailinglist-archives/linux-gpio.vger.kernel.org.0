Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF5A45E40E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357444AbhKZBg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357355AbhKZBe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:34:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EABC06174A;
        Thu, 25 Nov 2021 17:31:16 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so8830512pjb.2;
        Thu, 25 Nov 2021 17:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nsTL5M+cmXcz3U0HrdBs+GIs/KhMTiOhjBpoBqJ8cT0=;
        b=ScvzL/uqJiKWZ57bLJ5QCfLsP8MmEIuFijLSXLebcOaAO7CQls3iX2RUqBB8/bFtfc
         hY/dE/s1oNQ9HbWPRH6h31cR9ofbaSA8pHTAGFoqrd7xH042oSWVtBRTvEoNkDreC3tE
         9+6l82g12QTV4tBSb9mMnwAQBKsipxhSdyCcUWul19bpMarkH06eHZKEpb9wqgmQOmm1
         H8ODl30ay+bAX+34cO9BgBDITumFI58Xp+AP7Cp+u7zLFYTpdhLYKKwnmTpJLRRccWKI
         BS5U8sbqQX56t2UNUjHxJ4rTB9Oj1oGZd0phJZHAtoiOPI39UqtMcY8jHYK0ZIAKoG0u
         Uxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nsTL5M+cmXcz3U0HrdBs+GIs/KhMTiOhjBpoBqJ8cT0=;
        b=T7iu2NE0VIl3oBlrfDSkkGC+ZS+mwkfhJpS8NQ5krzuMr/1Uc4YJjtLPMCyvqg3lT7
         waWZ/G6ibXLVdrczvuTN342YA0rXLiHBrLkb/l2Q6t7k6vjlbVTEzZlKYlntZI44o2xL
         SHM9vMMJpQ2RdvsaZ4TmNFBjw8wo0//+BccBGqQdDbqQ+Q4xZV3gPUlTHz4/m9XHVVIJ
         eudjpfS1YhRub2Qpf7mgB2wr8VWPdAoBxOq6IoS/q1Csae1pj2QDA8/Zk+m32kFAq4/7
         8+GZZ01npQNLoJFbEqBkotuYV0hW6ZaWI0i0vcLheX4WxtJaT9tB1BRk7k5yICPXlEGQ
         geOg==
X-Gm-Message-State: AOAM532mlQZnQMXbikK3qK7HX2MrTQpTTnCAEoBA3qPiFtkps4oj/9gG
        w+0aH69+BJbcef6qpNF7Z6ofZJxAONZ4uA==
X-Google-Smtp-Source: ABdhPJx6I766biPDB5qwjkWtuJth44mcm6AuVsfKbW7CUbLtDPonFJ7rhr27XGtzJgPIy0ksfJwExg==
X-Received: by 2002:a17:90b:4f86:: with SMTP id qe6mr12064762pjb.198.1637890275988;
        Thu, 25 Nov 2021 17:31:15 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id a22sm4382585pfh.111.2021.11.25.17.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 17:31:15 -0800 (PST)
Date:   Fri, 26 Nov 2021 09:31:09 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC v3 06/12] gpiolib: Add HTE support
Message-ID: <20211126013109.GB10380@sol>
References: <20211123193039.25154-1-dipenp@nvidia.com>
 <20211123193039.25154-7-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123193039.25154-7-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 11:30:33AM -0800, Dipen Patel wrote:
> Some GPIO chip can provide hardware timestamp support on its GPIO lines
> , in order to support that additional API needs to be added which
> can talk to both GPIO chip and HTE (hardware timestamping engine)
> subsystem. This patch introduces APIs which gpio consumer can use
> to request hardware assisted timestamping. Below is the list of the APIs
> that are added in gpiolib subsystem.
> 
> - gpiod_req_hw_timestamp_ns - Request HTE on specified GPIO line.
> - gpiod_rel_hw_timestamp_ns - Release HTE functionality on GPIO line.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Changes in v2:
> - removed get timestamp and is timestamp enabled APIs
> 
>  drivers/gpio/gpiolib.c        | 73 +++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.h        | 12 ++++++
>  include/linux/gpio/consumer.h | 19 ++++++++-
>  include/linux/gpio/driver.h   | 14 +++++++
>  4 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..46cba75c80e8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1976,6 +1976,10 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>  			gc->free(gc, gpio_chip_hwgpio(desc));
>  			spin_lock_irqsave(&gpio_lock, flags);
>  		}
> +		spin_unlock_irqrestore(&gpio_lock, flags);
> +		gpiod_rel_hw_timestamp_ns(desc);
> +		spin_lock_irqsave(&gpio_lock, flags);
> +
>  		kfree_const(desc->label);
>  		desc_set_label(desc, NULL);
>  		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
> @@ -2388,6 +2392,75 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
>  
> +/**
> + * gpiod_req_hw_timestamp_ns - Enable the hardware assisted timestamp in
> + * nano second.
> + *

s/nano second/nanoseconds/g

> + * @desc: GPIO to enable
> + * @cb:	Callback, will be called when HTE pushes timestamp data.
> + * @tcb: Threaeded callback, it gets called from kernel thread context and when

s/Threaeded/Threaded/

> + * cb returns with HTE_RUN_THREADED_CB return value.
> + * @data: Client data, will be sent back with tcb and cb.
> + *
> + * Certain GPIO chip can rely on hardware assisted timestamp engines which can

Either drop the 'assisted' and refer to them as "hardware timestamping
engines" throughout, or rename your subsystem 'hate'?
Either way, be consistent.

> + * record timestamp at the occurance of the configured events
> + * i.e. rising/falling on specified GPIO lines. This is helper API to enable hw
> + * assisted timestamp in nano second.
> + *

Not sure this comment block adds anything.

> + * Return 0 in case of success, else an error code.
> + */
> +int gpiod_req_hw_timestamp_ns(struct gpio_desc *desc, hte_ts_cb_t cb,
> +			      hte_ts_threaded_cb_t tcb, void *data)
> +{
> +	struct gpio_chip *gc;
> +	int ret = 0;
> +
> +	VALIDATE_DESC(desc);
> +	gc = desc->gdev->chip;
> +
> +	if (!gc->req_hw_timestamp) {
> +		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
> +		return -ENOTSUPP;
> +	}
> +
> +	ret = gc->req_hw_timestamp(gc, gpio_chip_hwgpio(desc), cb, tcb,
> +				   &desc->hdesc, data);
> +	if (ret)
> +		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_req_hw_timestamp_ns);
> +
> +/**
> + * gpiod_rel_hw_timestamp_ns - Release and disable the hardware assisted
> + * timestamp.
> + *

Are gpiod_req_hw_timestamp_ns() and gpiod_rel_hw_timestamp_ns()
request/release or enable/disable?
You are using both descriptions in the documentation.
request/release implies resource allocation, while enable/disable does
not.  Which is it?

> + * @desc: GPIO to disable
> + *
> + * Return 0 in case of success, else an error code.
> + */
> +int gpiod_rel_hw_timestamp_ns(struct gpio_desc *desc)

Cheers,
Kent.

