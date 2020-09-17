Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100A926D83F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgIQKAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIQKAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 06:00:48 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E556C06174A;
        Thu, 17 Sep 2020 03:00:48 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g4so1940487edk.0;
        Thu, 17 Sep 2020 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mog08lfqfxZzqsQp+fqJ0msYK0VIdpvG6vqtJbveMak=;
        b=SlBMAFa/OpI0zd49+YKJFEQ0ZK3dD9P4CbN595u9woZwVueEgYYMkJniC503Wcr2PC
         eZg2NUWHVACE+RzvlTyayY/zXL3b81IuTsRdqg/CjdCLVPh8G6Ejz0Ly+xIWWwLonzOd
         LBGMxG0DUEDHR3ujW/6eK+DyHp8uYFb7umfRHqn/Gj7gP0l6HLE7IcwoZoIRnEVPlK+Y
         0OB38ajIkvuXNXZjbBE6Mg/H8t6eOlCVToAcfAkg7h14Vw2TONtVyklrmbrnTy/CGWhB
         eeO+HwJBDKHmEb270FdDh5Qr8K8QgpcCtXmFs31Djh21bKeiqlcenixj/OK3eyFwRV5v
         96Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mog08lfqfxZzqsQp+fqJ0msYK0VIdpvG6vqtJbveMak=;
        b=Uya7H+tp5sodYjymRkMOHtwmWc8CaU0r0gIaFidQmeQpDKBSjLgl3S65XP8jXTk1KU
         DJxME3RTTOH57tPPIxKepZ6mqv5h502ICi+67Ar/RDEjwaapGaMOFCSsZ0mLbSlgxIVT
         5sC/v32IseZHoZ8a4HWSLF5Chl/fOvIfM8fmr2rnA9jImsXhwpKDVhyjysJ7Ih14az+I
         TD8wkLB2MbXITr524jc21ASJk+8xz5dLriOW0wpGVtlo0vqayz80F8ATkNasvLOzrLfE
         /8flzIMmCW5iTJ8y+kpJLCu7ARqmc+2jnOF3ABCCdXOttz3VWgQEBszx8/oPnSPkQtgT
         UPqQ==
X-Gm-Message-State: AOAM530O+a3kv0icHeE37kHWH2X5x+2DE29CFXOLM7EfHwDDPqwb1DkO
        71OP2YzprUN/ZQ7OHsYvIFW9NUanS8iRk6e4J9luSw7euB3T8g==
X-Google-Smtp-Source: ABdhPJyoXk0WoHOaaTu86WVRwuhzB9IwesJGlfmWyPQl7ZCPRCnONgv/KQ2/fx4Hv9opaQcE91DGnzo8sfhHvoE4NQE=
X-Received: by 2002:aa7:d458:: with SMTP id q24mr32711156edr.23.1600336847136;
 Thu, 17 Sep 2020 03:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com> <20200917092004.GA2468349@x1>
In-Reply-To: <20200917092004.GA2468349@x1>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Thu, 17 Sep 2020 03:00:36 -0700
Message-ID: <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 2:20 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> On Thu, Sep 17, 2020 at 02:03:46AM -0700, Trent Piepho wrote:
> > On Mon, Sep 14, 2020 at 3:44 AM Drew Fustini <drew@beagleboard.org> wrote:
> > >
> > > +
> > > +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> > > +
> > > +       pinctrl-single,pins = <0xdc 0x30 0x07>;
> > > +
> > > +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> > > +See the device example and static board pins example below for more information.
> >
> > Pin configuration and mux mode don't mean anything in pinctrl-single.
> > On another machine, mux mode might not be programmed this way or even
> > exist.  Or the location of bits would probably be different, and this
> > would seem to imply the 0x07 would get shifted to the correct location
> > for where the pin mux setting was on that machine's pinctrl registers.
> >
> > It seems like it would be better to explain the values are ORed together.
>
> I descirbed it as seoerate values as I did not want to prescribe what
> the pcs driver would do with those values.  But, yes, it is a just an OR
> operation, so I could change the language to reflect tat.

If you don't say what the pinctrl-single driver does with the values,
how would anyone know how to use it?

> > What is the purpose of this change anyway?  It seems like in the end
> > it just does what it did before.  The data is now split into two cells
> > in the device tree, but why?
>
> These changes were a result of desire to seperate pinconf and pinmux.
> Tony raised the idea in a thread at the end of May [1].
>
> Tony wrote:
> > Only slightly related, but we should really eventually move omaps to use
> > #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> > from the mux mode. We already treat them separately with the new
> > AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> > use updated #pinctrl-cells. But I think pinctrl-single might need some
> > changes before we can do that.

I still don't see what the goal is here.  Support generic pinconf?

Also note that while AM33XX_PADCONF() is changed, there is an in tree
board that doesn't use it, so it's broken now.  I found this change
when it broke my out of tree board, due to the dtsi change not being
reflected in my board's pinctrl values.
