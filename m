Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EFD2C4DED
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 05:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387556AbgKZETN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 23:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387555AbgKZETM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 23:19:12 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50123C0617A7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2020 20:19:11 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so610006pge.6
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2020 20:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Rpn93xyHdtfENnB9aPQg9YqgzSxRxwjIcf8Cx2Aw6ww=;
        b=KzfA6UixuIRy9YpElltDdqwk2yfBpMvK4InTPHVxb2DKTdzm+T/3lMkDfNP090J/US
         aG5r4XgrvAQ4V1USt6D6FcvRATGhVHudbruItrARRWt4jU450scBjIvNcXmXCpTGsj6f
         0XgpTRs6ipDfObLv2CaNcIGeGPHWoql6is/qw6Mkxl2lzxJ4tL6Dhq/H7jMkQmWPj2dX
         SxCVQETd/9zLvcfaUoSrsuPTnJ3r7tyq8NlCAzL/ngYncJ8D+3FUS6ghjzWYLpz2L2i3
         0DxOl98ryJI8wHAAVOPR0+hY4iG9lyb7OCiUQay/fUOsiAbTWPa+yoHDoRtpgjHPmLye
         gS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Rpn93xyHdtfENnB9aPQg9YqgzSxRxwjIcf8Cx2Aw6ww=;
        b=ehPs2xYh7JzovqsfrkBgiuz+xrXY/9RSV04RrWZ4iJM3wC5BYIxEnAqjFjLEbI6Pvs
         5ytMdkJoq1jx+EqljjBYTpdtMdkqmEON4d+JhlHvhMX2l72BjnIeKn90UGbj/eB3DVTH
         CxzgIOlbfQlzYgFbZv8tAjrxGczBU0nMFOY+XqYoARboyLo66GTohDlR2hydOrVs3IrY
         LVmKKxkrrNtEKb49YEhyIvstZ5RgXZCsWRf2+5ZwYItJIFXFem2Xd+W0beEV3/hWG5p5
         awrQDLJk1ijvFCStSCxDIAW847T/N7JH7Ky6liMSn1UEg6swBCyPLhDAjqIWD3V1kd10
         Rnxg==
X-Gm-Message-State: AOAM532IrJ0ZLn53w5/0gGHsjvBzEQVNozbdfI1Ao6uCh0D003dqrInk
        MS1mn0O5UYVu9snRjaxsQW8Jcg==
X-Google-Smtp-Source: ABdhPJwFW97K6R+OFJRII5EMZIBZoUx7TnX2r1rh+kuNeSDWcHFbYBYkyIWy5rzp5848SCALwZ9bKA==
X-Received: by 2002:a17:90a:2c47:: with SMTP id p7mr1428721pjm.48.1606364350732;
        Wed, 25 Nov 2020 20:19:10 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:df19:3df8:ea8b:660d])
        by smtp.gmail.com with ESMTPSA id p14sm4320595pjo.53.2020.11.25.20.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 20:19:10 -0800 (PST)
Date:   Wed, 25 Nov 2020 20:19:08 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Pawan Gupta <writetopawan@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: core: Fix unused variable build warnings
Message-ID: <20201126041908.GA420140@x1>
References: <d1a71663e96239ced28509980ea484cadc10c80a.1606170299.git.writetopawan@gmail.com>
 <20201124050618.GA337876@x1>
 <20201124075129.GA1339@guptapadev.amr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201124075129.GA1339@guptapadev.amr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 11:51:29PM -0800, Pawan Gupta wrote:
> On Mon, Nov 23, 2020 at 09:06:18PM -0800, Drew Fustini wrote:
> > On Mon, Nov 23, 2020 at 02:33:33PM -0800, Pawan Gupta wrote:
> > > A recent commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs
> > > file") added build warnings when CONFIG_GPIOLIB=n. Offcourse the kernel
> > > fails to build when warnings are treated as errors. Below is the error
> > > message:
> > > 
> > >   $ make CFLAGS_KERNEL+=-Werror
> > > 
> > >   drivers/pinctrl/core.c: In function ‘pinctrl_pins_show’:
> > >   drivers/pinctrl/core.c:1607:20: error: unused variable ‘chip’ [-Werror=unused-variable]
> > >    1607 |  struct gpio_chip *chip;
> > >         |                    ^~~~
> > >   drivers/pinctrl/core.c:1606:15: error: unused variable ‘gpio_num’ [-Werror=unused-variable]
> > >    1606 |  unsigned int gpio_num;
> > >         |               ^~~~~~~~
> > >   drivers/pinctrl/core.c:1605:29: error: unused variable ‘range’ [-Werror=unused-variable]
> > >    1605 |  struct pinctrl_gpio_range *range;
> > >         |                             ^~~~~
> > >   cc1: all warnings being treated as errors
> > > 
> > > These variables are only used inside #ifdef CONFIG_GPIOLIB, fix the
> > > build warnings by wrapping the definition inside the config.
> > > 
> > > Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> > > Signed-off-by: Pawan Gupta <writetopawan@gmail.com>
> > > ---
> > >  drivers/pinctrl/core.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> > > index 3663d87f51a0..1bb371a5cf8d 100644
> > > --- a/drivers/pinctrl/core.c
> > > +++ b/drivers/pinctrl/core.c
> > > @@ -1602,10 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
> > >  	struct pinctrl_dev *pctldev = s->private;
> > >  	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
> > >  	unsigned i, pin;
> > > +#ifdef CONFIG_GPIOLIB
> > >  	struct pinctrl_gpio_range *range;
> > >  	unsigned int gpio_num;
> > >  	struct gpio_chip *chip;
> > > -
> > > +#endif
> > >  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
> > >  
> > >  	mutex_lock(&pctldev->mutex);
> > > -- 
> > > 2.21.3
> > > 
> > 
> > Thanks for pointing this out.  I don't have any systems where I build
> > without CONFIG_GPIOLIB so I missed this.
> > 
> > I'm having trouble figuring out a .config that will reproduce this.  I
> > tried tinyconfig but it compiled clean.
> 
> Just setting CONFIG_GPIOLIB=n via menuconfig is not an option?  Have you
> tried x86?

There were other options related to pinctrl both for my ARM board and my
laptop that were forcing GPIOLIB to stay on. 

> 
> > Could you share your .config?
> 
> Attaching the .config that reproduces the build warning.

Thanks.  I was able to reproduce the error with your config.

I applied your patch and it did resolve the error for me.

Reviewed-by: Drew Fustini <drew@beagleboard.org>
