Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5881126D941
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIQKkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIQKjs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 06:39:48 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48507C061756
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:39:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so1505035wrx.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i61APjl9FpHUWCD5kz7OHKcLpHTXAoxGDIDfWxkIIKA=;
        b=TzPoWKJpf/wfLnHIxcrXxgZWuK60ap9//CbBd+TZNU2y8pdavUxikjEt2gi5POaKmE
         sqkFdSnMaVS1uKBMNwFz2LD2WOzuwU1zj8wyFkyUcYMrba7+P5J1c2Fv+B2pA0YKvxEq
         PITadgTrH/zkaB/+nsMN0He+jN7epa8nGmBTppCHFZArS1XrWopPHaOZ+a73fw3w9qPn
         3XYS+1a630QJtEokkLq6ui9qWO+5TNMwL2/5JCPrGShBHnRRp8yqSVLE+jWSTS3LU4CV
         qBTpOaf7Qkp9W9WrfV8ijmWDL8lGRzqW6IiHDacIJmABTVU1gQ89/bti1zIaAMhXKSaT
         im5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i61APjl9FpHUWCD5kz7OHKcLpHTXAoxGDIDfWxkIIKA=;
        b=CQ5bVlRvG2QaIREjRh0/e6kQk9l/MwjlWrAgf9D3je2trx283Cba6IZShItb0eZY7/
         ASqp2AxiqSFovQdetSE3y4nzmUwhUEdnPkeLHnxm31vF51M2levM2QURqmysPGMDfaPs
         mCibprXqPoQk9ierpjWMQLCMglIvPMLrm3vgb69OG0b7nge0UmXwB1Wed0K1oP5UG8HN
         KZ90tOBfru+gZKEpz0K6H2+lhbvgmJL9uUGs9sRjRriCGZpVk9OmDDWEKtScHuSL2r2v
         9ecPZLNjUxPXnc5iSTdo/jMw5f/JW4bq9oXS1pKMjMduYEXWK7iYWKewJBStggzaWQv4
         69sA==
X-Gm-Message-State: AOAM5305BT7iP3sN5kvUxABseI1Jpa2c7TVFkRmNXd+q9e6mUBPnF+Mq
        UWB9z96RS/61M0S4OLrGvQzKKA==
X-Google-Smtp-Source: ABdhPJxDq+/9WZYcvn4wKFY6MtwgqeKWNaxXznfDHBKkyGKGAQpnGiuIZ/ycslis6B1djEELBpVQXA==
X-Received: by 2002:a5d:51c5:: with SMTP id n5mr7428723wrv.265.1600339185727;
        Thu, 17 Sep 2020 03:39:45 -0700 (PDT)
Received: from x1 ([2001:16b8:5c22:e701:5f2:8f03:4748:2bc6])
        by smtp.gmail.com with ESMTPSA id r14sm38384764wrn.56.2020.09.17.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:39:45 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:39:42 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Trent Piepho <tpiepho@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200917103942.GA2477958@x1>
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1>
 <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 03:00:36AM -0700, Trent Piepho wrote:
> On Thu, Sep 17, 2020 at 2:20 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > On Thu, Sep 17, 2020 at 02:03:46AM -0700, Trent Piepho wrote:
> > > On Mon, Sep 14, 2020 at 3:44 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > >
> > > > +
> > > > +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> > > > +
> > > > +       pinctrl-single,pins = <0xdc 0x30 0x07>;
> > > > +
> > > > +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> > > > +See the device example and static board pins example below for more information.
> > >
> > > Pin configuration and mux mode don't mean anything in pinctrl-single.
> > > On another machine, mux mode might not be programmed this way or even
> > > exist.  Or the location of bits would probably be different, and this
> > > would seem to imply the 0x07 would get shifted to the correct location
> > > for where the pin mux setting was on that machine's pinctrl registers.
> > >
> > > It seems like it would be better to explain the values are ORed together.
> >
> > I descirbed it as seoerate values as I did not want to prescribe what
> > the pcs driver would do with those values.  But, yes, it is a just an OR
> > operation, so I could change the language to reflect tat.
> 
> If you don't say what the pinctrl-single driver does with the values,
> how would anyone know how to use it?
> 
> > > What is the purpose of this change anyway?  It seems like in the end
> > > it just does what it did before.  The data is now split into two cells
> > > in the device tree, but why?
> >
> > These changes were a result of desire to seperate pinconf and pinmux.
> > Tony raised the idea in a thread at the end of May [1].
> >
> > Tony wrote:
> > > Only slightly related, but we should really eventually move omaps to use
> > > #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> > > from the mux mode. We already treat them separately with the new
> > > AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> > > use updated #pinctrl-cells. But I think pinctrl-single might need some
> > > changes before we can do that.
> 
> I still don't see what the goal is here.  Support generic pinconf?

My interest is came out of my desire to turn on generic pinconf for AM3358
and I had to fix a bug that was breaking compatible "pinconf,single":
f46fe79ff1b6 ("pinctrl-single: fix pcs_parse_pinconf() return value")

> Also note that while AM33XX_PADCONF() is changed, there is an in tree
> board that doesn't use it, so it's broken now.  I found this change
> when it broke my out of tree board, due to the dtsi change not being
> reflected in my board's pinctrl values.

Thanks, that is a good point that arch/arm/boot/dts/am335x-guardian.dts
needs to be converted from AM33XX_IOPAD to AM33XX_PADCONF.  I'll submit
a patch for that.

Regarding AM33XX_PADCONF() restructuring, the change to have seperate
arguments for direction and mux in AM33XX_PADCONF() predates my
invovlement, so I've CC'd Christina Quast.

    commit f1ff9be7652b716c7eea67c9ca795027d911f148
    Author: Christina Quast <cquast@hanoverdisplays.com>
    Date:   Mon Apr 8 10:01:51 2019 -0700

    ARM: dts: am33xx: Added AM33XX_PADCONF macro
    
    AM33XX_PADCONF takes three instead of two parameters, to make
    future changes to #pinctrl-cells easier.
    
    For old boards which are not mainlined, we left the AM33XX_IOPAD
    macro.
    
    Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
    Reviewed-by: Rob Herring <robh@kernel.org>
    Signed-off-by: Tony Lindgren <tony@atomide.com>

Hopefully, Tony can also chime in.

-Drew
