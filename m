Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659A5227C5F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 12:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgGUKC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 06:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgGUKC0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 06:02:26 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594ACC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 03:02:26 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 22so2215290wmg.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LXWJCowc0TREvbjAFrJcW6WDmYauV/HzFHklqSleKGI=;
        b=NyGM2ib39t5HdWX/yZihc94g5vIwvO6FMUuuklnBtkF7GkEfI/bvyr1ZgtohONXZ2U
         g3YczbF+uKpG+6issqxVrQSswIZ5cnCSyuiN07Wh8HGAnq47ZpfBV1RzZvznLdfTuyPX
         U1vQAbyfoBaW9j3gsqHIVRa1yqVpuv6G+4iYqCg2VMoPE48lNAVlaJU9jrVIb10g1i1+
         nOEm//h4RO6Bk6LBOnZ5cKxij2p1mfs83XWXe/C/zpRHdalQ4TwXwAq8oM2cw2igI0vy
         WPuNedAFTYK2hErY11998GWKxbLuSZERkiGYr3O6eMnBUo7d+uGPLOlmTMyIPPDy/mnH
         kOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LXWJCowc0TREvbjAFrJcW6WDmYauV/HzFHklqSleKGI=;
        b=ZejMwcCN6lSKjXemfY+Iwdq/VwGDxgUJ5fbW1vUo9aH5db4EwUUlZLCk1TxiD8RTwY
         6lKN8qaxPMwJs13JXMM0G357nEFMOdHE1b+XfbAgOc4S7j1uRrkEYZm58Mn39mp9d6ox
         Y4le2pFHJN5B+WLBhmicuDGlmZtvEiOcI+8eE17RvRN4Y0yLfE2J90vGByXQJavCfydm
         hvQrUPpsXvmsAXx1i2w1VEMStJ0dSq35CvCVvtZ2egunT/TwFvDdGpi7D/mmRZZ7VR8I
         3DBWV+deloCGgKuGWS3HgZdF1+2LEs8u571zPwRGGmXMZfn8np77FL9+AdZvVs17n7vk
         4/HQ==
X-Gm-Message-State: AOAM532depfUq3y+g0dn2nJ817vuqgClpchqH+Slt9FUkXqS3Yt8tXfo
        WhvJPy0I7gy3swV93S+M7pxhlA==
X-Google-Smtp-Source: ABdhPJwycFYkseyCKVGffVD6STOTbPVKmTSoGXNyjoKWWuia0Y5D5FEXPKUrP5pRzdfA0DNPCxMsEw==
X-Received: by 2002:a1c:4086:: with SMTP id n128mr3474979wma.118.1595325744941;
        Tue, 21 Jul 2020 03:02:24 -0700 (PDT)
Received: from x1 (103.red-88-29-77.staticip.rima-tde.net. [88.29.77.103])
        by smtp.gmail.com with ESMTPSA id o9sm36880324wrs.1.2020.07.21.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 03:02:23 -0700 (PDT)
Date:   Tue, 21 Jul 2020 12:02:21 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v3] gpio: omap: handle pin config bias flags
Message-ID: <20200721100221.GA1982085@x1>
References: <20200717194043.1774643-1-drew@beagleboard.org>
 <f27995fd-5885-9dbf-c42e-73dbe69fcfab@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f27995fd-5885-9dbf-c42e-73dbe69fcfab@embeddedor.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 05:38:51PM -0500, Gustavo A. R. Silva wrote:
> Hi Drew,
> 
> Somehow I ran into this patch in Linus' tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=for-next&id=75dec56710dfafd37daa95e756c5d1840932ba90
> 
> Please, see some comments below...
> 
> On 7/17/20 14:40, Drew Fustini wrote:
> > Modify omap_gpio_set_config() to handle pin config bias flags by calling
> > gpiochip_generic_config().
> > 
> > The pin group for the gpio line must have the corresponding pinconf
> > properties:
> > 
> > PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> > PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> > 
> > This is necessary for pcs_pinconf_set() to find the requested bias
> > parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> > 
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Link: https://lore.kernel.org/r/20200715213738.1640030-1-drew@beagleboard.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpio/gpio-omap.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > v3 changes:
> > - adjust the braces to match the correct coding style
> > - note: I originally re-submitted this as v2 by accident when it should
> >   have been v3. Sorry for the noise.
> > 
> > v2 changes:
> > - simplify handling of -ENOTSUPP return value per Grygorii's suggestion
> > 
> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> > index b8e2ecc3eade..0ccb31de0b67 100644
> > --- a/drivers/gpio/gpio-omap.c
> > +++ b/drivers/gpio/gpio-omap.c
> > @@ -896,12 +896,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
> >  				unsigned long config)
> >  {
> >  	u32 debounce;
> > +	int ret = -ENOTSUPP;
> > +
> > +	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> > +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> > +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
> > +		ret = gpiochip_generic_config(chip, offset, config);
> > +	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
> > +		debounce = pinconf_to_config_argument(config);
> > +		ret = omap_gpio_debounce(chip, offset, debounce);
> > +	}
> >  
> > -	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
> > -		return -ENOTSUPP;
> > -
> > -	debounce = pinconf_to_config_argument(config);
> > -	return omap_gpio_debounce(chip, offset, debounce);
> > +	return ret;
> >  }
> >  
> >  static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> > 
> 
> Maybe next time you could consider coding something like this, instead:
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 8dd86b9fae53..7fbe0c9e1fc1 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -899,16 +899,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
>         u32 debounce;
>         int ret = -ENOTSUPP;
> 
> -       if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> -           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> -           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
> -       {
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
>                 ret = gpiochip_generic_config(chip, offset, config);
> -       }
> -       else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
> -       {
> +               break;
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
>                 debounce = pinconf_to_config_argument(config);
>                 ret = omap_gpio_debounce(chip, offset, debounce);
> +               break;
> +       default:
> +               break;
>         }
> 
>         return ret;
> 
> It looks a bit more readable and cleaner. :)
> 
> Thanks
> --
> Gustavo

Gustavo - thanks very much for the feedback.  I appreciate getting these
insights into best practices.

Linus - should I submit a patch?

I'm not sure if it is better to limit churn, or make sure the code is
structured as best is possible.

Thanks,
Drew
