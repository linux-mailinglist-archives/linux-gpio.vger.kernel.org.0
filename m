Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5DA33469B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 19:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhCJSWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 13:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhCJSWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 13:22:35 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E43FC061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 10:22:35 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id w195so13512306oif.11
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 10:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dRPa+MKHXJoax045qmF2GLp0jz/mQE6D5ZmN+LMnrsE=;
        b=jZrmuBed1foFlgTtPJmKyc7a+CFQse/0jl6E9oSCWFO+UfkNKjcHYohUtuM3a+rVFY
         bjikQkD9fWxl1iTPlaipplcN7xgj7ltC12aKYqPnxzWR5bO2xAp8/DoKpaeL9/Euge/A
         WUEQddkfjuTnKHDIUa8JB2BMbvsb0/D4IxaSGPluAKy5M3e5AoWOGBY/c7pbPAZA9qR/
         GtVFZP6sXUEANKKju6bApguIVDFR9wlunhMPwUFAuVZmuNVAhbfis+fL+aLI81lGTUb5
         9G2GyCmhuiGFHWA6w/3GR5tsRd6YNpFPAiYXJkUMFzj//Wt3qR3E6TtYAv+kR25gxRni
         fwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dRPa+MKHXJoax045qmF2GLp0jz/mQE6D5ZmN+LMnrsE=;
        b=VnSg05PTqp7NXBZttLJAxBNCjKDturAZJhRpPsG3IMQgdSq0U75iDvE71kl8QF3pwx
         yOkXU10Lh6vSmuKewwmQz1Yna2vs26W6JqPtODux484lpVQZHJiMQ+JBiWbE0ryiBt/l
         i5DgxsXfxHT04DyzRJSzvSquzXBxBm4qtVbqvyTp8/p+Dumf98046ZaudnYCsTAXthff
         Yk5Ha4WJsZPO1yHI+W+pYdCs9pblYkWNP0G5T+tMQ4YMCyUewyj/N0Wn7VgysI/gdXtn
         SMsP2cFpAyPYmbm2eg1uIgMUaGTwxbWrpyK1ImyLO6+vsVkNARJZ587difyJxfiNFTrr
         iYuQ==
X-Gm-Message-State: AOAM532K82EOC7cHXsT6vpor8/tXT+NlSZ8Lek8Mp1iXLkumJtKHC+dn
        CuaLxcF2AUpEij7aCZBBHN3hAw==
X-Google-Smtp-Source: ABdhPJzDEwDnms71wcqZ06xpRz9wfUTSjnV7Au3tEFDwobcG35rKOseyZwlWZCyaZqXxlpmCeOq62A==
X-Received: by 2002:a05:6808:d46:: with SMTP id w6mr3339345oik.47.1615400554532;
        Wed, 10 Mar 2021 10:22:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n1sm29739oig.47.2021.03.10.10.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 10:22:33 -0800 (PST)
Date:   Wed, 10 Mar 2021 12:22:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <YEkOaK+UiLy8kSDu@builder.lan>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
 <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan>
 <20210306080049.GM17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210306080049.GM17424@dragon>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 06 Mar 02:00 CST 2021, Shawn Guo wrote:

> On Fri, Mar 05, 2021 at 07:56:02PM -0600, Bjorn Andersson wrote:
> > On Fri 05 Mar 19:28 CST 2021, Shawn Guo wrote:
> > 
> > > On Fri, Mar 05, 2021 at 03:43:08PM -0600, Bjorn Andersson wrote:
> > > > On Tue 02 Mar 21:31 CST 2021, Shawn Guo wrote:
> > > > 
> > > > > The last cell of 'gpio-ranges' should be number of GPIO pins, and in
> > > > > case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
> > > > > than msm_pinctrl_soc_data.ngpio - 1.
> > > > > 
> > > > 
> > > > This is a historical artifact, SDM845 has 150 GPIO pins. In addition to
> > > > this there's an output-only pin for UFS, which I exposed as an GPIO as
> > > > well - but it's only supposed to be used as a reset-gpio for the UFS
> > > > device.
> > > > 
> > > > Perhaps that still mandates that gpio-ranges should cover it?
> > > 
> > > I think the number in DT gpio-ranges should match msm_pinctrl_soc_data.ngpio.
> > > Otherwise, kernel will be confused and be running into the issue like
> > > below in some case.
> > > 
> > > > 
> > > > > This fixes the problem that when the last GPIO pin in the range is
> > > > > configured with the following call sequence, it always fails with
> > > > > -EPROBE_DEFER.
> > > > > 
> > > > >     pinctrl_gpio_set_config()
> > > > >         pinctrl_get_device_gpio_range()
> > > > >             pinctrl_match_gpio_range()
> > > > 
> > > > When do we hit this sequence? I didn't think operations on the UFS
> > > > GP(I)O would ever take this code path?
> > > 
> > > It will, if we have UFS driver booting from ACPI and requesting reset
> > > GPIO.
> > 
> > But does the UFS driver somehow request GPIO 190 on SC8180x?
> > 
> > I made up the idea that this is a GPIO, there really only is 190 (0-189)
> > GPIOs on thie SoC.
> > 
> > Downstream they use a pinconf node with "output-high"/"output-low" to
> > toggle the reset pin and I don't find any references in the Flex 5G
> > DSDT.
> 
> Right now, I do not have to request and configure this UFS GPIO for
> getting UFS work with ACPI kernel.  And the immediate problem we have is
> that with gpio_chip .set_config patch, devm_gpiod_get_optional() call
> from UFS driver always gets -EPROBE_DEFER.
> 

But we don't have a "reset" GPIO specified in the ACPI node, or you mean
with the introduction of .set_config DT no longer works?

Regards,
Bjorn

> > 
> > > And we are hit this sequence with my patch that adds .set_config
> > > for gpio_chip [1].
> > > 
> > 
> > What's calling pinctrl_gpio_set_config() in this case?
> 
>   ufs_qcom_probe
>     ufshcd_pltfrm_init
>       ufshcd_init
>         ufs_qcom_init
>           devm_gpiod_get_optional
>             devm_gpiod_get_index
>               gpiod_get_index
>                 gpiod_configure_flags
>                   gpiod_direction_output
>                     gpiochip_generic_config
> 
> Shawn
