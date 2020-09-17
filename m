Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB86126D77C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIQJUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 05:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQJUK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 05:20:10 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB12C061788
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 02:20:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so1238134wrp.8
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rs4qIsV+1Nc8/ULSmz6fhje8+3Q5WuQ/ZqN8EKMf44M=;
        b=HneP4Ax9h4G9FuTtlRadvMHfIy7MklfXQgvihGj/s4IkedJjlIcDIIN9OKN+TKPv1Q
         YOHbDkBxijps9TuQt3WI77Trp6FzEmkd34MvgCBmrO8u7YmmMCiiTCU7Pw4wtwO+tq5Y
         XL68N5LVD01YXce3Md5P8IJSX0+xPNbPGcRZx/IkAGd06yRy1L91j4Nn/tUN1oQBd+9X
         MB5TIz2AfCzFVqkRTMHEOoq5gvl3mqc9iRiCI9jU17Jnt6aUBj+V23z+o/lKXomR1VBg
         aysEiRfYQsaZu/Zif0ZW9cJgfORgsrpcDmNKMizSGKbKB5f5jaU9hm0d9jvxb8p/udCk
         l6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rs4qIsV+1Nc8/ULSmz6fhje8+3Q5WuQ/ZqN8EKMf44M=;
        b=VCnSQlFIoazNmwcjv/rs5k4APW1lkCsBd/3Wl8UkN5yvmdAaY6HQeTy+cmb3I/nuTm
         lKZLigTPCeeZ8IyzrY4paVIc5xKWIgjTrw0ABKLvsSDTUOwEw5sCWnfCqsL0wOISQhc7
         3FIhDdb9/yRKHK9c4YKNzYiZ2SPFkuXZFIP/PcTpe1/pf8VA6AyVGFLHIFnFg6D7KgkZ
         ULYe9/ya6kXMy0vE9N2cOoaNOdnkWVQ081grDZA3c6c5aDgH43t3qWEn4yTd/72hY+Bf
         O8eoku3SW3QUBrbyjb0sU4u8yxcSRDgtbpe1TkobxNaFOPIlpN8t5UeLl23QipEU4NoM
         /XVQ==
X-Gm-Message-State: AOAM531WaBBg2KkUcwf7Cf2JzuG8aS92zCUUCMvA36/6NId0eI2HQtqf
        sXrDkf4PI1TY9ur/XjfOdSnsdQ==
X-Google-Smtp-Source: ABdhPJwDBcbUJMmuU1+Ad2eRRDNOJE6+feQz9qegFGUMrQF2ZIMUj7aGlnqVTlh4Dy8cUHkn08Eo4w==
X-Received: by 2002:a5d:5583:: with SMTP id i3mr30071275wrv.119.1600334407681;
        Thu, 17 Sep 2020 02:20:07 -0700 (PDT)
Received: from x1 ([2001:16b8:5c22:e701:5f2:8f03:4748:2bc6])
        by smtp.gmail.com with ESMTPSA id x10sm10543614wmi.37.2020.09.17.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 02:20:06 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:20:04 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Trent Piepho <tpiepho@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200917092004.GA2468349@x1>
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 02:03:46AM -0700, Trent Piepho wrote:
> On Mon, Sep 14, 2020 at 3:44 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > +
> > +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> > +
> > +       pinctrl-single,pins = <0xdc 0x30 0x07>;
> > +
> > +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> > +See the device example and static board pins example below for more information.
> 
> Pin configuration and mux mode don't mean anything in pinctrl-single.
> On another machine, mux mode might not be programmed this way or even
> exist.  Or the location of bits would probably be different, and this
> would seem to imply the 0x07 would get shifted to the correct location
> for where the pin mux setting was on that machine's pinctrl registers.
> 
> It seems like it would be better to explain the values are ORed together.

I descirbed it as seoerate values as I did not want to prescribe what
the pcs driver would do with those values.  But, yes, it is a just an OR
operation, so I could change the language to reflect tat.

> What is the purpose of this change anyway?  It seems like in the end
> it just does what it did before.  The data is now split into two cells
> in the device tree, but why?

These changes were a result of desire to seperate pinconf and pinmux.
Tony raised the idea in a thread at the end of May [1].

Tony wrote:
> Only slightly related, but we should really eventually move omaps to use
> #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> from the mux mode. We already treat them separately with the new
> AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> use updated #pinctrl-cells. But I think pinctrl-single might need some
> changes before we can do that.


thanks,
drew

[1] https://lore.kernel.org/linux-omap/20200527165122.GL37466@atomide.com/
