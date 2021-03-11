Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325C8336980
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 02:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhCKBUK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 20:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhCKBT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 20:19:59 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5C4C061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:19:58 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so8512279pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wlN97WTPrtLsBMydHFkQsvjRJ9vlEhU6c/gLEPBoS/A=;
        b=mIqAAym+Xg6mJErREVlFYuS6s2zdwJYKfCB6PrR+E9u37nYmA59fE0ou+xsNOVPqST
         odbnN0Yj36QFtxVHX17iSOtdyHVxBudZN0rlFKkAl/f7PODPnnJNEyBeDCEeWS2qsvqC
         0oD7mVLtYAe068rVCbnNZ4RDAV8mqGpkbOCy8rly8dO06QKapWEADhozXNeANdy93dQD
         J0NlTsLoZcqIVS5JgugP7cD9QzdxCF8MO9DiGSAIZA/QzQJ/WgTaKyYicvZdE+2k9WiA
         dvZQVBt62UODQMI+Z3qXNCKaUT5MvlHDzd4F2NJeQW/hWv1GhqP9e4pZEbUiwdRHpud3
         Dj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wlN97WTPrtLsBMydHFkQsvjRJ9vlEhU6c/gLEPBoS/A=;
        b=sQK5nge5mYsidwGwTnnd4VM1WfW28osk4rG+yTIRWytnaiLyl02oemP/d+2wjilQAI
         z+dMM+pzp7agfJ7W1T44V3O7wdk4gYACHLMLDrkfa16VPp4SLG9HU45DW/i3/B8RThBH
         Pf9eD8Y5EeBNVeCS1GCCIF2Yd+Dni0inoUqCLqfloXs3lWIsbSD0CAEjmaMXm0+stUrU
         l4awSrAX+Q/bV2D6/x0YIqyMzy9z5e/ljOzPykJ20u+bOdsF0S8TJ/ybYiotOV+dzwpP
         j54FBhtrUU3pojMrYP7YVmA35I/ga/F8tKTEYbKI9cSKuRZ2nBAaqMTF7Bc4RaxrdcuK
         fwgw==
X-Gm-Message-State: AOAM532gsCMs8HZD0qbtoPMAd/wyEpgyeGoEOunxGAPSSPsQUsNNt08V
        FqqAos9pKSvDcYyMufyyVjwT2Q==
X-Google-Smtp-Source: ABdhPJww2k5cDJG/j8WM1Ep0hSY2YrmTfc6AL4DHohUX/ZZK92r9Jec+v63JzCoVwkh0UxYcr8nNNA==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id x4-20020a170902ec84b02900e5bd054a98mr5654982plg.76.1615425598371;
        Wed, 10 Mar 2021 17:19:58 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u2sm529839pjy.14.2021.03.10.17.19.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 17:19:58 -0800 (PST)
Date:   Thu, 11 Mar 2021 09:19:52 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <20210311011951.GT17424@dragon>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
 <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan>
 <20210306080049.GM17424@dragon>
 <YEkOaK+UiLy8kSDu@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEkOaK+UiLy8kSDu@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 12:22:32PM -0600, Bjorn Andersson wrote:
> On Sat 06 Mar 02:00 CST 2021, Shawn Guo wrote:
> 
> > On Fri, Mar 05, 2021 at 07:56:02PM -0600, Bjorn Andersson wrote:
> > > On Fri 05 Mar 19:28 CST 2021, Shawn Guo wrote:
> > > 
> > > > On Fri, Mar 05, 2021 at 03:43:08PM -0600, Bjorn Andersson wrote:
> > > > > On Tue 02 Mar 21:31 CST 2021, Shawn Guo wrote:
> > > > > 
> > > > > > The last cell of 'gpio-ranges' should be number of GPIO pins, and in
> > > > > > case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
> > > > > > than msm_pinctrl_soc_data.ngpio - 1.
> > > > > > 
> > > > > 
> > > > > This is a historical artifact, SDM845 has 150 GPIO pins. In addition to
> > > > > this there's an output-only pin for UFS, which I exposed as an GPIO as
> > > > > well - but it's only supposed to be used as a reset-gpio for the UFS
> > > > > device.
> > > > > 
> > > > > Perhaps that still mandates that gpio-ranges should cover it?
> > > > 
> > > > I think the number in DT gpio-ranges should match msm_pinctrl_soc_data.ngpio.
> > > > Otherwise, kernel will be confused and be running into the issue like
> > > > below in some case.
> > > > 
> > > > > 
> > > > > > This fixes the problem that when the last GPIO pin in the range is
> > > > > > configured with the following call sequence, it always fails with
> > > > > > -EPROBE_DEFER.
> > > > > > 
> > > > > >     pinctrl_gpio_set_config()
> > > > > >         pinctrl_get_device_gpio_range()
> > > > > >             pinctrl_match_gpio_range()
> > > > > 
> > > > > When do we hit this sequence? I didn't think operations on the UFS
> > > > > GP(I)O would ever take this code path?
> > > > 
> > > > It will, if we have UFS driver booting from ACPI and requesting reset
> > > > GPIO.
> > > 
> > > But does the UFS driver somehow request GPIO 190 on SC8180x?
> > > 
> > > I made up the idea that this is a GPIO, there really only is 190 (0-189)
> > > GPIOs on thie SoC.
> > > 
> > > Downstream they use a pinconf node with "output-high"/"output-low" to
> > > toggle the reset pin and I don't find any references in the Flex 5G
> > > DSDT.
> > 
> > Right now, I do not have to request and configure this UFS GPIO for
> > getting UFS work with ACPI kernel.  And the immediate problem we have is
> > that with gpio_chip .set_config patch, devm_gpiod_get_optional() call
> > from UFS driver always gets -EPROBE_DEFER.
> > 
> 
> But we don't have a "reset" GPIO specified in the ACPI node, or you mean
> with the introduction of .set_config DT no longer works?

Yes, DT stops working because of the mismatch between
msm_pinctrl_soc_data.ngpio and gpio-ranges.

Shawn
