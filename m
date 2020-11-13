Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCA82B18B4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 11:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgKMKAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 05:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMKAo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 05:00:44 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10ACBC0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 02:00:44 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so9092139wrb.9
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 02:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gfGG55MYx5Em6+fmajJntheaXUGzBYWWUIU2DPCN/2E=;
        b=Nsqotxgqw+nXjVTG6Pll+N6eN4hXM9zJlaTuEdtmKdE3SMZX201tfacPSHyO6osoV+
         YsM025vYYHGLbJuZA7mGm8oWQ+QSVKjw5fD+6h8mmHeyyMAmdvPMqRQxL4RWyU+sT3gv
         dynJRRaXX6vCUiJknEzxPcrza4pjeijhjKxsMkvbiGfTfivRCrYtdG29sCWOZEA8nMSp
         5c5JE9g55K58ux6GGDmy5n+Uma4I1jWlIQYGYDPTuYVSsZUyRGZLUN41aqEUXRiP2RSx
         /Bam2QyCTN81RDg8XHBw0Q4kgQX9q4IA4yh65R+iEto9QDrPx5oG2QO2BcW+MmsoOohU
         khZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gfGG55MYx5Em6+fmajJntheaXUGzBYWWUIU2DPCN/2E=;
        b=gKuPwZBLJ+FE5qOlgpmyJRYkVOKZ/Qh0TcdGodZHuvQjttKSGYRUQRPyUO6tqfaI0g
         G0e8dWHI9jykw0eSh2YmL2krVoolR+rxvugFQi1pK5qrXi+2AV+0hdNCO3opCXJxUuqu
         OnXW67iin+0UAFb/H7f/MjkFbsmzX0nhBQ+/sVt6j0VmUVWcl2DihFCu9LdkMeeVi1WZ
         9lYZ+WZyxOOsI1JGXQVOOL1KPfcYsBxqcS/sxl5TZfm6zusLf6nUTFV/+3GqHiy0W4WI
         bsDv+WaV8uont7t6dU09GPItFF8U51nX7KMtrCzsJ3i6iXXoNgna3R4D25Y1LMPHpwi1
         NVBw==
X-Gm-Message-State: AOAM533fjHqOty/9rtO2AKqn8AdYLh0QW8EQSndZsN+cqeakg5vu3+r1
        KoHuQaFdQ1QYUZsBiokjl3Hs2w==
X-Google-Smtp-Source: ABdhPJxIBxKcZ6fteiaLZ99964aqasLi0g5Me2aMNFGVHS6R79054WT8nqkmlPUNeZcrX/zAsLnHZg==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr2421023wrx.59.1605261642691;
        Fri, 13 Nov 2020 02:00:42 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id y63sm9228465wmg.28.2020.11.13.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 02:00:41 -0800 (PST)
Date:   Fri, 13 Nov 2020 10:00:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201113100040.GA3718728@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20201112093918.GV2063125@dell>
 <20201112100731.GC4556@piout.net>
 <20201112104810.GH1997862@dell>
 <20201113093924.GI4556@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113093924.GI4556@piout.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 13 Nov 2020, Alexandre Belloni wrote:

> On 12/11/2020 10:48:10+0000, Lee Jones wrote:
> > On Thu, 12 Nov 2020, Alexandre Belloni wrote:
> > 
> > > Hi,
> > > 
> > > On 12/11/2020 09:39:18+0000, Lee Jones wrote:
> > > > Both the caller and the supplier's source file should have access to
> > > > the include file containing the prototypes.
> > > > 
> > > > Fixes the following W=1 kernel build warning(s):
> > > > 
> > > >  drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
> > > >  1637 | void at91_pinctrl_gpio_suspend(void)
> > > >  | ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > >  drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
> > > >  1661 | void at91_pinctrl_gpio_resume(void)
> > > >  | ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > 
> > > > Cc: Russell King <linux@armlinux.org.uk>
> > > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > 
> > [...]
> > 
> > > > diff --git a/include/soc/at91/pm.h b/include/soc/at91/pm.h
> > > > new file mode 100644
> > > > index 0000000000000..0fd5093f7f73a
> > > > --- /dev/null
> > > > +++ b/include/soc/at91/pm.h
> > > > @@ -0,0 +1,9 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * atmel platform data
> > > > + */
> > > > +
> > > > +#ifdef CONFIG_PINCTRL_AT91
> > > 
> > > Shouldn't that be a header guard instead of depending on PINCTRL_AT91 ?
> > 
> > I copied the same semantics from the header it was taken from.
> > 
> > Happy to turn it into a proper header file too.
> 
> I guess that would be better. How do you expect this patch to be merged?

I'll fix it.

No expectations.  Whatever's easiest.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
