Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEED02251F6
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jul 2020 15:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgGSN2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jul 2020 09:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSN2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jul 2020 09:28:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDD4C0619D4
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 06:28:33 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a6so15339987wrm.4
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2020 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lAL171R7FWvnItt0pyTGhPJVrw/3gmfccUaVuzdFF1w=;
        b=qq2X6pJovyuShPg22rh7bgNxH7KFHAhIe6SsjzPlmIvww3vrw3tmdIA/MuozQjgBSr
         dBBNX5g7JTX21gjkS+qKKFqm4Qsfz1Ap3AGqVR2MmlvxryPsjLVT4V7mxhNX07NXob5I
         F+/UHulx1mVvvVgFf2CTBZL06oTj4QPSubUgtRwYOVvoCd8+imFYcILnRg6Isuen1oTj
         0rLOUPbemknvOwdgdwhYjiPJKoa3ZXJ+4zsOpRxdPWtcDJsBk9PV2UwS3BtuPoG9DrVW
         6h2w061ygzf/gydHGu4E3v+Plyc2itr2C2am18LBCQkYCOfeAOQok1o/ozcyGO8xjbXd
         3PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lAL171R7FWvnItt0pyTGhPJVrw/3gmfccUaVuzdFF1w=;
        b=UfEnGM0T6RkLHUk2yXCzYHrB88W2rVoOB16tydn4NS6yKuLkn6zYfwEDhsZ4QOSIMV
         TqKzXNUfG+2IwmWY8mlcfmL0h5JyAxqZq4nnuUlaWiZgEjOjtAg5AaFH6zkjCvRKOuUe
         HOF1cNytENT336npOylDURVBr1ZeBX0YETED3V43SLJodsVB0mqY2Q+uIEV5+/7F9Xj8
         O6Bj7oVfNB1xnzeVA6OLvUxfhaok5btyrapDtOK5Tk5W9COBCqjOSXU+wC36BfqL68ss
         O8KAv3DWRKPJBHsmrGphqDnLFj4bXyeCbpqTW3zDGwIdG5nt24P77oRIMwzICr6VE3Mm
         bx3g==
X-Gm-Message-State: AOAM530eDBoSKyFi631kuNr9hM+Fg5PKc7PZAGIxQvAmmyJNwEI2d4ur
        dlFPcBn29Y4OXfMpI5AVumWqZw==
X-Google-Smtp-Source: ABdhPJxvKQGmztR8Ra15sC4eQ7wSJuWpUlXPah+4JvFLaUmu6Qz3ilRXBrNkNqt6ZsPZj1rikbf/bw==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr3396771wrn.389.1595165311846;
        Sun, 19 Jul 2020 06:28:31 -0700 (PDT)
Received: from x1 (188.29.165.134.threembb.co.uk. [188.29.165.134])
        by smtp.gmail.com with ESMTPSA id l18sm27068013wrm.52.2020.07.19.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 06:28:31 -0700 (PDT)
Date:   Sun, 19 Jul 2020 15:28:26 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] pinctrl: core: print gpio in pins debugfs file
Message-ID: <20200719132826.GA1883492@x1>
References: <20200719132200.1878265-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719132200.1878265-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 19, 2020 at 03:22:01PM +0200, Drew Fustini wrote:
> If there is a gpio range mapping for the pin, then print out the gpio
> number for the pin in the debugfs 'pins' file.
> 
> Here is an example output on the BeagleBone Black from:
> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
> 
> pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
> pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
> pin 105 (PIN105) GPIO-115 44e109a4 00000027 pinctrl-single
> pin 106 (PIN106) GPIO-116 44e109a8 00000027 pinctrl-single
> pin 107 (PIN107) GPIO-117 44e109ac 00000027 pinctrl-single
> pin 108 (PIN108) GPIO-19 44e109b0 00000027 pinctrl-single
> pin 109 (PIN109) GPIO-20 44e109b4 00000027 pinctrl-single
> pin 110 (PIN110) NA 44e109b8 00000030 pinctrl-single
> pin 111 (PIN111) NA 44e109bc 00000028 pinctrl-single
> pin 112 (PIN112) NA 44e109c0 00000030 pinctrl-single
> pin 113 (PIN113) NA 44e109c4 00000028 pinctrl-single
> pin 114 (PIN114) NA 44e109c8 00000028 pinctrl-single
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> v2 changes:
> - print 'NA' if pin does not have a GPIO number
> - change gpio_num from unsigned to unsigned int per checkpatch
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 821242bb4b16..8478025926a2 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1601,6 +1601,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  	struct pinctrl_dev *pctldev = s->private;
>  	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
>  	unsigned i, pin;
> +	struct pinctrl_gpio_range *range;
> +	unsigned int gpio_num;
>  
>  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
>  
> @@ -1618,6 +1620,18 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  
>  		seq_printf(s, "pin %d (%s) ", pin, desc->name);
>  
> +		gpio_num = 0;
> +		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
> +			if ((pin >= range->pin_base) &&
> +			    (pin < (range->pin_base + range->npins)))
> +				gpio_num = range->base + (pin - range->pin_base);
> +		}
> +
> +		if (gpio_num > 0)
> +			seq_printf(s, "GPIO-%u ", gpio_num);
> +		else
> +			seq_puts(s, "NA ");
> +
>  		/* Driver-specific info per pin */
>  		if (ops->pin_dbg_show)
>  			ops->pin_dbg_show(pctldev, s, pin);
> -- 
> 2.25.1
> 

Linus - would it better if I printed the gpio chip and line number
instead of the GPIO number?

If so, any advice on how to best convert the gpio number to the gpio
descriptor inside pinctrl_pins_show()?

Thanks,
Drew
