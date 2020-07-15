Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F79221707
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 23:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgGOVcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 17:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgGOVcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 17:32:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02ABC08C5DB
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2020 14:32:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w3so7668444wmi.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2020 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xBQDfVfj7jVd5q1Z7DUJytLJRXAUVyPchfWSKcEiidM=;
        b=wKKvAWhbIOGuT1WASkV4LvqzLA0Zv0x2m8Nwk6wRJkg4gE7pNdCYPt+AdS90IlQaIM
         Nzcl2lwkD3LoPZ8bF5ALatUnatULp2Bn5/CUNG7X+VLqrUxtADV6a747KGhm6+NoH1QZ
         ft5ET3hyn81yG5M+gDoweEZClfAQ1h+HWI3gJh2l9k6HyFR4HjtWKKhbXcZrNZC8+GXO
         29VbKG8+4257sY2bj7atKlJXyHsyoaPkCxFyhXsjoeQ2wegGaPLj9LFe0GtBdC/BRjU1
         9MmtkPGAyn3L9YrWf+cUdr+oTfbeUlaHjNw4HPhm0nnyEx2r+BWUKa2VKvf9Cdgf9Ry0
         Bolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xBQDfVfj7jVd5q1Z7DUJytLJRXAUVyPchfWSKcEiidM=;
        b=ochgOWAv61xJAlwTlCnicBQ2Zm5yds7M941j39quUQ4X8kunRPTIwMIZ8J+cj9zU2I
         kSZvfoL6dfkVC2u/GV8DZPVpPPH3GuWoYkEFYL7Z9CzZRA7u1EKN48QPJ7UwGoG/YvM5
         gtyygkrGP0zWbcM5iSq1JkXAZ7XWuddxyI4pAn/osBqA1IM0i81BvP3QJFMkQUq1vZWg
         DZVgWnvvuFv3BLP7rxJrLBK4S5EU6YajT5/1QkE6C/CPAB32zRJ0PwSIJ2b5T7hPXt/M
         le89//ZyhErGdygR8xIEh7VyagpzfY3pqrJaTq+cWyARXGW5nqhi4jF9c8mIFbvQ36WP
         OxMw==
X-Gm-Message-State: AOAM531lVtqppMwm44v7UcVHrEDOGDycV19P2P2KLri/R5VyPGenaEdb
        kzfdRz+PktPHlPiQWI2oxM0oow==
X-Google-Smtp-Source: ABdhPJzXxMM86KFYQzvo2fHgX1DfzzmFi79lPdbOcM5GbNb7mdCXrWM7MkQPBJxQPlDJMPLB8DU8sQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr1545579wmd.156.1594848728233;
        Wed, 15 Jul 2020 14:32:08 -0700 (PDT)
Received: from x1 (63.red-95-125-106.dynamicip.rima-tde.net. [95.125.106.63])
        by smtp.gmail.com with ESMTPSA id 1sm4912324wmf.0.2020.07.15.14.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 14:32:07 -0700 (PDT)
Date:   Wed, 15 Jul 2020 23:32:03 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: handle pin config bias flags
Message-ID: <20200715213203.GA1639870@x1>
References: <20200709223401.780051-1-drew@beagleboard.org>
 <1a0180f3-7693-672a-8070-7032854bb73c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0180f3-7693-672a-8070-7032854bb73c@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 01:09:12PM +0300, Grygorii Strashko wrote:
> 
> 
> On 10/07/2020 01:34, Drew Fustini wrote:
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
> > ---
> >   drivers/gpio/gpio-omap.c | 21 +++++++++++++++++----
> >   1 file changed, 17 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> > index b8e2ecc3eade..a471a152f318 100644
> > --- a/drivers/gpio/gpio-omap.c
> > +++ b/drivers/gpio/gpio-omap.c
> > @@ -896,12 +896,25 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
> >   				unsigned long config)
> >   {
> >   	u32 debounce;
> > +	int ret;
> 
> ret =  -ENOTSUPP;
> 
> > -	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
> > -		return -ENOTSUPP;
> > +	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> > +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> > +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
> > +	{
> > +		ret = gpiochip_generic_config(chip, offset, config);
> > +	}
> > +	else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
> > +	{
> > +		debounce = pinconf_to_config_argument(config);
> > +		ret = omap_gpio_debounce(chip, offset, debounce);
> > +	}
> > +	else
> > +	{
> > +		ret = -ENOTSUPP;
> > +	}
> 
> drop above "else"?
> 
> > -	debounce = pinconf_to_config_argument(config);
> > -	return omap_gpio_debounce(chip, offset, debounce);
> > +	return ret;
> >   }
> >   static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> > 
> 
> Minor comment, Otherwise:
> Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> -- 
> Best regards,
> grygorii

Thanks for reviewing.  I'll post a new version with the return value
improvement per your suggestion.

-Drew
