Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993752C1D38
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 06:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgKXFGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 00:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgKXFGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 00:06:21 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772FEC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 21:06:21 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w202so1488277pff.10
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 21:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t84FGtb1zqwFP9+gcpDWOJ23J5kLn0xfIZescE5RdAg=;
        b=Zc2KdqBNxYB8xjxn5tTvXx63XU9sSiwOQ5bx1m4TeNVcPVAfLror94nHTOVzZ+ZNu3
         fQu23QQrFlQfzrwzZTPHHkKsCpc/9FMMJzOh2KNyLB8uhpH1ems/YpRfkjPMh74OhPbw
         242dDi5kxAmJzWCccUwJeYs1NnEPKMyNu7RSKWzTST2C3GE0dNAwKcZow3y0U6KHzjbH
         hUvNKLBcGloaDU9uGqwLoN4kI9oOFnNXrc/WH9mjhLed1OTx/SYChE6zYCsQuOr9aZ+g
         blj08t+eSZdSmPRzKvciu4rboNxc0HqFOjt8nXjU0MOMZVWU5dJXU+HkEtzmhesKxOhk
         pu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t84FGtb1zqwFP9+gcpDWOJ23J5kLn0xfIZescE5RdAg=;
        b=gD3VVzubyGNZX46NSOOhZqyneQZgsAgdfil2ZwCuZfpubc9USeSFy736nJ2DMIkPt5
         Em1qTbac1PZ/RJTqJE0frJoGB89Cko8nLEmahb4UgoxweP8p/1bYA1tVGMBsbJPDFyBT
         CQfunPCFm4KRfW7rXtFakq10ko5LADxQ0p7JxZPOrj/fKIza14uGtERSuVTPWrOTdtkA
         1P6P9Oer004jfHRJpAI0UIAhMg0bP2JfS03HKVwwvv+wtMyxWOQ/juLvXW7FznaznnqU
         NOzNwHzXgNa5pftC8g3mFUjXfRXQU8vWPaP9RE94q8L/aVuuU4MoDLmkBF4tdOqqrnWL
         ob8A==
X-Gm-Message-State: AOAM5303eHox/ZJuTuNFBbyTHrU0zP5QdbqpIjyZ6EAqQNLPEiUNXtLX
        wVYs558N2vrPgRoNYDNTmGm7Oks9/4t4WA==
X-Google-Smtp-Source: ABdhPJz98eS0KOZDEN5ciizxnoNQfjEfuxC2oQL9mIxpr6zyBPi29Dl3a0yZPU/R7DM88WKv9VYqtw==
X-Received: by 2002:a63:ff18:: with SMTP id k24mr2296838pgi.273.1606194381086;
        Mon, 23 Nov 2020 21:06:21 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:1bab:7221:4aae:c48d])
        by smtp.gmail.com with ESMTPSA id e17sm12707727pfm.155.2020.11.23.21.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 21:06:20 -0800 (PST)
Date:   Mon, 23 Nov 2020 21:06:18 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Pawan Gupta <writetopawan@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: core: Fix unused variable build warnings
Message-ID: <20201124050618.GA337876@x1>
References: <d1a71663e96239ced28509980ea484cadc10c80a.1606170299.git.writetopawan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1a71663e96239ced28509980ea484cadc10c80a.1606170299.git.writetopawan@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 02:33:33PM -0800, Pawan Gupta wrote:
> A recent commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs
> file") added build warnings when CONFIG_GPIOLIB=n. Offcourse the kernel
> fails to build when warnings are treated as errors. Below is the error
> message:
> 
>   $ make CFLAGS_KERNEL+=-Werror
> 
>   drivers/pinctrl/core.c: In function ‘pinctrl_pins_show’:
>   drivers/pinctrl/core.c:1607:20: error: unused variable ‘chip’ [-Werror=unused-variable]
>    1607 |  struct gpio_chip *chip;
>         |                    ^~~~
>   drivers/pinctrl/core.c:1606:15: error: unused variable ‘gpio_num’ [-Werror=unused-variable]
>    1606 |  unsigned int gpio_num;
>         |               ^~~~~~~~
>   drivers/pinctrl/core.c:1605:29: error: unused variable ‘range’ [-Werror=unused-variable]
>    1605 |  struct pinctrl_gpio_range *range;
>         |                             ^~~~~
>   cc1: all warnings being treated as errors
> 
> These variables are only used inside #ifdef CONFIG_GPIOLIB, fix the
> build warnings by wrapping the definition inside the config.
> 
> Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> Signed-off-by: Pawan Gupta <writetopawan@gmail.com>
> ---
>  drivers/pinctrl/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..1bb371a5cf8d 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1602,10 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  	struct pinctrl_dev *pctldev = s->private;
>  	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
>  	unsigned i, pin;
> +#ifdef CONFIG_GPIOLIB
>  	struct pinctrl_gpio_range *range;
>  	unsigned int gpio_num;
>  	struct gpio_chip *chip;
> -
> +#endif
>  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
>  
>  	mutex_lock(&pctldev->mutex);
> -- 
> 2.21.3
> 

Thanks for pointing this out.  I don't have any systems where I build
without CONFIG_GPIOLIB so I missed this.

I'm having trouble figuring out a .config that will reproduce this.  I
tried tinyconfig but it compiled clean.

Could you share your .config?

Thank you,
Drew
