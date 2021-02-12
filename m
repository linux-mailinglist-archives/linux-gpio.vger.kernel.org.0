Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1CF3198E2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 04:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhBLDl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 22:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhBLDl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 22:41:56 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A51CC061574
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:41:15 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id my11so5557008pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tTDYVeOuBaVSBqqaT4l7JPSDFmYOyLMrk9qMZM2itYY=;
        b=s2pCs64quzfkQ0UzIlFQ3tXiXmlesXUnb2HxWDzyStRVgnJbsKJFAYX18+EqZWQw3y
         iQ2sAn2GL91aJPxkLGeOdG8TKjkLqmG1tAl45LXhD2PJ+by5TeOt/xex3yAhh09mvNFV
         kP/BazcmjwvDXdZuFUD+vbUoJTTjWHVysU1UY9FoO5tZl6zaKZbytjWIQcrZcmdd20+Y
         PhZ+77mivgtDj8XessP9xD3qmS612VTZShYmiUDxQRS0S2E6z6eldHoa9eLpoZMJLI46
         Pwtp3rRNW2ERUYGFnUd4qADm2OfzgEH892VJb8Q07nauuXg9fFnU5vdJGO7rd7kidPe2
         uLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tTDYVeOuBaVSBqqaT4l7JPSDFmYOyLMrk9qMZM2itYY=;
        b=Z9vMZ7eSCbboIXaVPWc+WfLWxS8DcIhqoj/7Tt+MzrLmClUrCZo2FrxPcIqtaGbnlT
         wKbcyOtgAd2n3P6ZfJO+xoFITtrcKTshcYqI2FRn8c9FlT60MfyZf4+w7hsGckJZtKfI
         NJYgqsrFY+oCUmEfrWRFUeNzH1dtJyPKEzJ6LRB+/jRHz/k7dm+rPWy30ZPh+AbupGxx
         ubFD4768wxJkTpQ7X9R9HmqPpdgwHZeNmlYM1AWOTilCEksUIAptDnt/EG5jnQ9WdTTa
         YvXtfQkfxmc/ieFTog0q35FVBcl3wNVWs9ZKUpry5SgnMM+nluwPy1AKXd/MwYWnScHn
         ugXA==
X-Gm-Message-State: AOAM530PnsGbBBdNuzr6mSMSMVUj7Ob7smuE+bWVQiYFTscfGMZN3K0H
        Gd6rawo5BC32VGAfFJsKDvpSxA==
X-Google-Smtp-Source: ABdhPJztCGfUYqiBJuAyL0+GWkuCDJfGNGoYDkQYyIFKWV+zzc4x+OVszM4wgqHmgNHAvIGm6e8feg==
X-Received: by 2002:a17:903:3109:b029:e2:86d3:bec with SMTP id w9-20020a1709033109b02900e286d30becmr1030600plc.49.1613101274692;
        Thu, 11 Feb 2021 19:41:14 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:3a7f:bbfb:1664:2a63])
        by smtp.gmail.com with ESMTPSA id a5sm7136604pgh.15.2021.02.11.19.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 19:41:13 -0800 (PST)
Date:   Thu, 11 Feb 2021 19:41:11 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210212034111.GD347396@x1>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
 <20210211120051.GN20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211120051.GN20820@kadam>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 03:00:51PM +0300, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > Add "pinmux-select" to debugfs which will activate a function and group
> > when "<function-name group-name>" are written to the file. The write
> > operation pinmux_select() handles this by checking that the names map to
> > valid selectors and then calling ops->set_mux().
> > 
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> > 
> > function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> > function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> > function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> > function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> > function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> > function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> > 
> > To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
> > 
> > echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
> > 
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >  drivers/pinctrl/pinmux.c | 107 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> > index c651b2db0925..23fa32f0a067 100644
> > --- a/drivers/pinctrl/pinmux.c
> > +++ b/drivers/pinctrl/pinmux.c
> > @@ -673,6 +673,111 @@ void pinmux_show_setting(struct seq_file *s,
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
> >  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
> >  
> > +#define PINMUX_MAX_NAME 64
> > +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> > +				   size_t len, loff_t *ppos)
> > +{
> > +	struct seq_file *sfile = file->private_data;
> > +	struct pinctrl_dev *pctldev = sfile->private;
> > +	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> > +	const char *const *groups;
> > +	char *buf, *fname, *gname;
> > +	unsigned int num_groups;
> > +	int fsel, gsel, ret;
> > +
> > +	if (len > (PINMUX_MAX_NAME * 2)) {
> > +		dev_err(pctldev->dev, "write too big for buffer");
> > +		return -EINVAL;
> > +	}
> > +
> > +	buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	fname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> > +	if (!fname) {
> > +		ret = -ENOMEM;
> > +		goto free_buf;
> > +	}
> > +
> > +	gname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> > +	if (!buf) {
> > +		ret = -ENOMEM;
> > +		goto free_fname;
> > +	}
> > +
> > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > +	if (ret < 0) {
> > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > +		goto free_gname;
> > +	}
> > +	buf[len-1] = '\0';
> > +
> > +	ret = sscanf(buf, "%s %s", fname, gname);
> > +	if (ret != 2) {
> > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > +		goto free_gname;
> > +	}
> > +
> > +	fsel = pinmux_func_name_to_selector(pctldev, fname);
> > +	if (fsel < 0) {
> > +		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
> > +		ret = -EINVAL;
> > +		goto free_gname;
> > +	}
> > +
> > +	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
> > +	if (ret) {
> > +		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
> > +		goto free_gname;
> > +
> > +	}
> > +
> > +	ret = match_string(groups, num_groups, gname);
> > +	if (ret < 0) {
> > +		dev_err(pctldev->dev, "invalid group %s", gname);
> > +		goto free_gname;
> > +	}
> > +
> > +	ret = pinctrl_get_group_selector(pctldev, gname);
> > +	if (ret < 0) {
> > +		dev_err(pctldev->dev, "failed to get group selectorL %s", gname);
> > +		goto free_gname;
> > +	}
> > +	gsel = ret;
> > +
> > +	ret = pmxops->set_mux(pctldev, fsel, gsel);
> > +	if (ret) {
> > +		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
> > +		goto free_gname;
> > +	}
> > +
> > +	return len;
> > +
> > +free_gname:
> > +	devm_kfree(pctldev->dev, gname);
> > +free_fname:
> > +	devm_kfree(pctldev->dev, fname);
> > +free_buf:
> > +	devm_kfree(pctldev->dev, buf);
> 
> Ugh...  I honestly thought Smatch was supposed to print a warning when
> you used devm_kfree() on kzalloc()ed memory, but I guess the warning is
> only the other way around.
> 
> Smatch does complain about it as a leak because it was expecting a
> regular free.
> 
> drivers/pinctrl/pinmux.c:330 pinmux_func_name_to_selector() warn: potential NULL parameter dereference 'fname'
> drivers/pinctrl/pinmux.c:764 pinmux_select() warn: possible memory leak of 'gname'
> drivers/pinctrl/pinmux.c:764 pinmux_select() warn: sscanf doesn't return error codes
> drivers/pinctrl/pinmux.c:764 pinmux_select() warn: returning success when sscanf failed

Thank you pointing this out.  I should have switched back to normal free
now that I no longer using a device managed buffer.

> 
> And what about the success path?  Shouldn't we free these on the success
> path as well?

Good point.  That is my fault.  I will update it so that it correctly
free's buffer no matter what happens in the function.


thanks,
drew
