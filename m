Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77761337A1B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 17:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCKQyG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 11:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhCKQxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 11:53:52 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4537BC061760
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 08:53:52 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x28so2094809otr.6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 08:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XSmqDyqk6mwQknjVMDCtXIq5BqYGoCAKmXrLczbo/Z0=;
        b=oLTCFnpiKHmOXrrJ1Nf8wzVX9GKpnaWvKdn2KUbi1E/8IHkoORaUmKlDmyVREm3ll9
         f34UuLYGsKwoXYIDjwO07xxUltoTmwAIFu8L6ZlIB6s/GrvLYRy5OwKXcpy47PftEcpF
         KQ9lmzhDLnebS7pgFoDlwdgbhCJVCy4roVO1r34g1i9hI4qlOi1zwBQfiRA87yLGKxC7
         bM3zAIjgbLHjKTNvCwtOGwjs03CF05GDc4m+WF3VBiD+1Q+8fYU2QynutynPP9DIKXwZ
         1sisNPZLH5PRzon/LfUbl1y+tKLk2D4X138Wmx18ZICkRhsx3JrEwTWtcrAhu40SMiYs
         Om/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XSmqDyqk6mwQknjVMDCtXIq5BqYGoCAKmXrLczbo/Z0=;
        b=A2EI8IFVDQ53+qmxL5nPewQWyCfk0fyIXFK9Oo/SDu9haOXw+n1/+ESyR8kHs9VhE/
         0H3UX89WPzZCD8YOIQdR08RiZ9en7GgvCdxGXzTP6dRpSaWWMecimI5gHSPQM0sEkZwV
         GRqkMUzRbXZ6vMB/V6kL/PcT2lFglMAccbINF0agrZ0856T+VsGjqhvxJnlQPsnyjIRS
         3idMFDc/ParnBLVu+Ph2ylj/hy9iK5O9we048sc/CvP4Av6y93SzFALgWhyA7oF5rSY5
         EqAJXEDfoPwjXnB/Vc1d7+4nmfW7bbbAIocIYzY7hQfg5KWoAxPnWdmQFhhACjKkH6oz
         auvw==
X-Gm-Message-State: AOAM531K/r5q2mb2vlqfc5aFGmpea+eaO/kKbIJYtSeRdSjjCrEKuCCU
        MhTxQXGunRH6ttZLL8IatbZ3LQ==
X-Google-Smtp-Source: ABdhPJywd1cpirDSLzKY6QGbJqG6i3tKZTk10GED3Z89ge2/jZ73vXVbQqZW52lCbEPmgbIYOe4VaQ==
X-Received: by 2002:a05:6830:11a:: with SMTP id i26mr7823001otp.91.1615481631654;
        Thu, 11 Mar 2021 08:53:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r16sm604358oij.13.2021.03.11.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:53:50 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:53:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <YEpLHSRKt651B6FP@builder.lan>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
 <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan>
 <20210306080049.GM17424@dragon>
 <YEkOaK+UiLy8kSDu@builder.lan>
 <20210311011951.GT17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311011951.GT17424@dragon>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 10 Mar 19:19 CST 2021, Shawn Guo wrote:

> On Wed, Mar 10, 2021 at 12:22:32PM -0600, Bjorn Andersson wrote:
> > On Sat 06 Mar 02:00 CST 2021, Shawn Guo wrote:
> > 
> > > On Fri, Mar 05, 2021 at 07:56:02PM -0600, Bjorn Andersson wrote:
> > > > On Fri 05 Mar 19:28 CST 2021, Shawn Guo wrote:
> > > > 
> > > > > On Fri, Mar 05, 2021 at 03:43:08PM -0600, Bjorn Andersson wrote:
> > > > > > On Tue 02 Mar 21:31 CST 2021, Shawn Guo wrote:
> > > > > > 
> > > > > > > The last cell of 'gpio-ranges' should be number of GPIO pins, and in
> > > > > > > case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
> > > > > > > than msm_pinctrl_soc_data.ngpio - 1.
> > > > > > > 
> > > > > > 
> > > > > > This is a historical artifact, SDM845 has 150 GPIO pins. In addition to
> > > > > > this there's an output-only pin for UFS, which I exposed as an GPIO as
> > > > > > well - but it's only supposed to be used as a reset-gpio for the UFS
> > > > > > device.
> > > > > > 
> > > > > > Perhaps that still mandates that gpio-ranges should cover it?
> > > > > 
> > > > > I think the number in DT gpio-ranges should match msm_pinctrl_soc_data.ngpio.
> > > > > Otherwise, kernel will be confused and be running into the issue like
> > > > > below in some case.
> > > > > 
> > > > > > 
> > > > > > > This fixes the problem that when the last GPIO pin in the range is
> > > > > > > configured with the following call sequence, it always fails with
> > > > > > > -EPROBE_DEFER.
> > > > > > > 
> > > > > > >     pinctrl_gpio_set_config()
> > > > > > >         pinctrl_get_device_gpio_range()
> > > > > > >             pinctrl_match_gpio_range()
> > > > > > 
> > > > > > When do we hit this sequence? I didn't think operations on the UFS
> > > > > > GP(I)O would ever take this code path?
> > > > > 
> > > > > It will, if we have UFS driver booting from ACPI and requesting reset
> > > > > GPIO.
> > > > 
> > > > But does the UFS driver somehow request GPIO 190 on SC8180x?
> > > > 
> > > > I made up the idea that this is a GPIO, there really only is 190 (0-189)
> > > > GPIOs on thie SoC.
> > > > 
> > > > Downstream they use a pinconf node with "output-high"/"output-low" to
> > > > toggle the reset pin and I don't find any references in the Flex 5G
> > > > DSDT.
> > > 
> > > Right now, I do not have to request and configure this UFS GPIO for
> > > getting UFS work with ACPI kernel.  And the immediate problem we have is
> > > that with gpio_chip .set_config patch, devm_gpiod_get_optional() call
> > > from UFS driver always gets -EPROBE_DEFER.
> > > 
> > 
> > But we don't have a "reset" GPIO specified in the ACPI node, or you mean
> > with the introduction of .set_config DT no longer works?
> 
> Yes, DT stops working because of the mismatch between
> msm_pinctrl_soc_data.ngpio and gpio-ranges.
> 

So what you're saying is that when Linus merged the .set_config patch
yesterday he broke storage on every single Qualcomm device?

Regards,
Bjorn
