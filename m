Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A950222423
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgGPNmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgGPNmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:42:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06577C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:42:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so7134510wrm.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JZNBQEsluWYNjW+GWqhOJExdknKZFMDrInNuaDZzuMw=;
        b=pvEOTTT9SsDqGhGFsX85a6EqqFWOuEAC4IqfRFOuM8X5Qu/qz1ZqqaSqw+oN3m1plo
         beYEWWeILRQzeWSOirdtUIu5egMGeIk7pcIFHSPbYIm4GLKwMTGfYouEjJwzs9B0IvuN
         UfBvt9p+l0xyGcKfe/B3uJUrNYKbv0rtIcBTPeEgLhKc+8AqtUdB+yMydhPUap2jotWa
         eCwJah2C3k2ByHIo0oq0sPmsYrn9N2AC46W1bTUA5vwV4+w6j685C1Vodm6LZLMYPtmN
         gxNNReqt/rhZ8nAJz3SgmZSA9X2t3a6MBoD8Z/teJNo+hnWd/Q4sJR3j2sDMs11nVd4E
         ENzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JZNBQEsluWYNjW+GWqhOJExdknKZFMDrInNuaDZzuMw=;
        b=n7ChznjhFAKcp+McbALbtoZgUT8rJ86Qi7BfZfLuopmOoa0bbShw8dy5YwHRlE8tCi
         oaoabAG2cZU38PAos3JgQqqmrl8xx+d8RhLyC59Da/UyvyBQlEjWDCWhjptjkHt+kHZA
         zqBXebV4CKj4u6CSs7qNN0iaMLc/0elzotDr4W99HtrBYdJSyQOhQlkL3fFMuO+Ks1W9
         ZlxobEy6C/VoSyfgMGL72sNFhC4wx7BPNKloKUCODSL5SEWnSiZUY1bC6WCb/C/mLgYz
         6LQ11wnwH44YKPSwdz/bkb+D5USrlbf2Fax5t1FgrNc8UjhxVk+FYj0d+8Z+yFaqt8NG
         ybug==
X-Gm-Message-State: AOAM531NTRYJtQCTE5009urvhGERvWPC31DvHlP1T87bJ5HLrcDfHa6G
        FJHJjfIgzN5LMuhlowP9ijUNCQ==
X-Google-Smtp-Source: ABdhPJzacKtDIlQ/zdNXCA1Ev96bWAsgIQWdTqOqba1GjgVZaFqJgWFMkGMSJt1r7ua1Ob8Yw4bing==
X-Received: by 2002:adf:f842:: with SMTP id d2mr5567144wrq.55.1594906953665;
        Thu, 16 Jul 2020 06:42:33 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id m4sm8355362wmi.48.2020.07.16.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 06:42:33 -0700 (PDT)
Date:   Thu, 16 Jul 2020 14:42:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20200716134231.GP3165313@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20200713200244.GA23553@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713200244.GA23553@piout.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 Jul 2020, Alexandre Belloni wrote:

> Hi,
> 
> On 13/07/2020 15:49:21+0100, Lee Jones wrote:
> > Both the caller and the supplier's source file should have access to
> > the include file containing the prototypes.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
> >  1637 | void at91_pinctrl_gpio_suspend(void)
> >  | ^~~~~~~~~~~~~~~~~~~~~~~~~
> >  drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
> >  1661 | void at91_pinctrl_gpio_resume(void)
> >  | ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/arm/mach-at91/pm.c             | 17 ++++++-----------
> >  drivers/pinctrl/pinctrl-at91.c      |  1 +
> >  include/linux/platform_data/atmel.h |  5 +++++
> >  3 files changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> > index 074bde64064e4..59f2a2d6fbbb8 100644
> > --- a/arch/arm/mach-at91/pm.c
> > +++ b/arch/arm/mach-at91/pm.c
> > @@ -25,17 +25,6 @@
> >  #include "generic.h"
> >  #include "pm.h"
> >  
> > -/*
> > - * FIXME: this is needed to communicate between the pinctrl driver and
> > - * the PM implementation in the machine. Possibly part of the PM
> > - * implementation should be moved down into the pinctrl driver and get
> > - * called as part of the generic suspend/resume path.
> > - */
> > -#ifdef CONFIG_PINCTRL_AT91
> > -extern void at91_pinctrl_gpio_suspend(void);
> > -extern void at91_pinctrl_gpio_resume(void);
> > -#endif
> > -
> >  struct at91_soc_pm {
> >  	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
> >  	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
> > @@ -325,6 +314,12 @@ static void at91_pm_suspend(suspend_state_t state)
> >  static int at91_pm_enter(suspend_state_t state)
> >  {
> >  #ifdef CONFIG_PINCTRL_AT91
> > +	/*
> > +	 * FIXME: this is needed to communicate between the pinctrl driver and
> > +	 * the PM implementation in the machine. Possibly part of the PM
> > +	 * implementation should be moved down into the pinctrl driver and get
> > +	 * called as part of the generic suspend/resume path.
> > +	 */
> >  	at91_pinctrl_gpio_suspend();
> >  #endif
> >  
> > diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> > index 9c52130876597..37997e5ab0538 100644
> > --- a/drivers/pinctrl/pinctrl-at91.c
> > +++ b/drivers/pinctrl/pinctrl-at91.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/pinctrl/pinmux.h>
> >  /* Since we request GPIOs from ourself */
> >  #include <linux/pinctrl/consumer.h>
> > +#include <linux/platform_data/atmel.h>
> >  
> >  #include "pinctrl-at91.h"
> >  #include "core.h"
> > diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
> > index 99e6069c5fd89..666ef482ea8c0 100644
> > --- a/include/linux/platform_data/atmel.h
> > +++ b/include/linux/platform_data/atmel.h
> 
> The plan is to get rid of that file so you should probably find a better
> location.

Suggestions welcome.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
