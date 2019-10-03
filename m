Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A53CADBA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 20:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731241AbfJCR7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 13:59:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41086 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731234AbfJCR7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 13:59:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id r2so2522734lfn.8
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7n4NvKPpvqFXigh24b8twI7kqYMuMZj67/WZMAs3RxU=;
        b=Bc59P60swsi5ASH0o5bE7smNybp94litM+wgTLMSxSgPd5K15x8U0/hr2VKJ878+XV
         MilBKq3+odr5y0VWyRb/XBMSYwoWETfuVy++Sb96L0dcUzajIqLC5+SXyKPItpcVOtXU
         V7waP48q3moqUtP7yay9xfqnifEMYp3y20JQb1IuXZaL4WUJKFKTLytYE3YeoH89QWxP
         5KQJHxLrUgz4EX/l2eWDswh0AMuDLckAI8e9h3Jncr7VY+HuitMt7/ovb5Ur4zSXniny
         YVJD7JbJVeqvTGutlM4TDZS/9trFAQwaAFZkGcd4lRdH041X6MblRVccYT7deFr+PZtS
         zkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7n4NvKPpvqFXigh24b8twI7kqYMuMZj67/WZMAs3RxU=;
        b=NqMNu3iRxRy/YDucRkmPk5bgdMvfKN7f8xHjE6BvFjeONSkQY735os/YG/WHamudfW
         /ULvoaH7B2r/chwyhaqhoFFZWiod9GmHDW6plUkcgk3UeRaH4dmrufuDjMsBTHq7/FkC
         3iZaG8Ps4OfH5tlsR1ooGPcxdwt/8ukL3UGOGaE3vDU8TDJQruCdF3zse2VQvlCpWN6d
         e4gCnfyZgmeutL5pb2iGddvVVQ7VG2bilqQKUVZQ/0GlzigNjC9JbKvPti65dcUCs6Sj
         e+cJvKNebvcwTv6p2nC24VGhYUl6eInBcSwQayIuyXMEr/ZJGNCSqri2cBQx4J9taI5T
         Zu+A==
X-Gm-Message-State: APjAAAUKOgeOyI+KbJSw0XN/OxQ3H96a6o4twWw0kDG7uu30KE18GZrl
        l/Q918lT3Bgi6kb4FaDkG5GFJQ==
X-Google-Smtp-Source: APXvYqyH+AcaXNZ6JODwQr/ES+A9IWCabDZeg8LQhr5NHAvWxm1esJUv+eY/UinGqTGd7ZU/FVL5uQ==
X-Received: by 2002:ac2:48ba:: with SMTP id u26mr6538208lfg.164.1570125537473;
        Thu, 03 Oct 2019 10:58:57 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id t22sm588754lfg.91.2019.10.03.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 10:58:56 -0700 (PDT)
Date:   Thu, 3 Oct 2019 19:58:55 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Do not use platform_get_irq() to count
 interrupts
Message-ID: <20191003175855.GB1322@bigcity.dyn.berto.se>
References: <20191001180547.734-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191001180547.734-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-10-01 20:05:47 +0200, Geert Uytterhoeven wrote:
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
> 
>     sh-pfc e6060000.pin-controller: IRQ index 0 not found
> 
> Fix this by using the platform_irq_count() helper instead.
> 
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice change.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> This is a fix for v5.4-rc1.
> ---
>  drivers/pinctrl/sh-pfc/core.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index b8640ad41bef26be..ce983247c9e28bfe 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -29,12 +29,12 @@
>  static int sh_pfc_map_resources(struct sh_pfc *pfc,
>  				struct platform_device *pdev)
>  {
> -	unsigned int num_windows, num_irqs;
>  	struct sh_pfc_window *windows;
>  	unsigned int *irqs = NULL;
> +	unsigned int num_windows;
>  	struct resource *res;
>  	unsigned int i;
> -	int irq;
> +	int num_irqs;
>  
>  	/* Count the MEM and IRQ resources. */
>  	for (num_windows = 0;; num_windows++) {
> @@ -42,17 +42,13 @@ static int sh_pfc_map_resources(struct sh_pfc *pfc,
>  		if (!res)
>  			break;
>  	}
> -	for (num_irqs = 0;; num_irqs++) {
> -		irq = platform_get_irq(pdev, num_irqs);
> -		if (irq == -EPROBE_DEFER)
> -			return irq;
> -		if (irq < 0)
> -			break;
> -	}
> -
>  	if (num_windows == 0)
>  		return -EINVAL;
>  
> +	num_irqs = platform_irq_count(pdev);
> +	if (num_irqs < 0)
> +		return num_irqs;
> +
>  	/* Allocate memory windows and IRQs arrays. */
>  	windows = devm_kcalloc(pfc->dev, num_windows, sizeof(*windows),
>  			       GFP_KERNEL);
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
