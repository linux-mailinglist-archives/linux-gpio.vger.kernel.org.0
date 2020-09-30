Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81D727E3DB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgI3Ie7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3Ie6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:34:58 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C5DC061755;
        Wed, 30 Sep 2020 01:34:58 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so902611edq.6;
        Wed, 30 Sep 2020 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J0A+wqhRYgYCS0PBoBxbU4Mhm6bbCMk9g/qDtg26dvE=;
        b=szsuUEDK9DUP8DEfkyRIQibRkQMbrrbmkyh5OgqdFE+K/xB1soFZmeW9Uii6Zgjuin
         4A7fFow6BeBDUOgTW0hmCDGcuUQc1bFzRBi7GkGdAYmry8kaM/eSOJJZW3y9rpX+CJLd
         Mb6BMn3er5VfCJTYWUZogQUp0hUxCYVGWDrWqsyqxZlXd4gxywIEtuuCIeLY0kKsguIn
         lM+MxZKDXbkQEcCbuAUHGo9TfeWZRj4CmDIO+kRvb9t4uhk2JvnR7bypTqIg4haOa3dp
         ZYukyM9WUGrHvkDsX35lC/kFm9ecWv15qB2W4nIhIJGKCxPogUCaYKL0eotp5KkHT4zu
         R3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0A+wqhRYgYCS0PBoBxbU4Mhm6bbCMk9g/qDtg26dvE=;
        b=SUJRhOqm95yo0Ppn87QqraQVaSWO8Dx1x343shauCQ0VKvLPCFJ3x6WUzoxbOm9zK3
         4/slUiVQ2rX38Owy9VNKSqqrxmokJ8JXpyUWTLRJZO0De86NDwtJECdEUXaSuQbY8d9r
         uu1LwX4c8m957MUMlFjd/oCMXi0+w6o6DQJ1v7nn8qohjZosI/+acgr7+kiILs5r9jZm
         meZqsdtiErLGLIIHalIq6bMkrkc5fRyJH9ojYHsw5HtH7ECeWcG3b8lHMUrQ6B8FzMlI
         LIube6LWolCbVmJg6SufD800rh66PFR2NIlb4kxQhwKw+ZIGtWxTSXyJb60+B9yD3xsM
         98eA==
X-Gm-Message-State: AOAM532AmO9ArCG4MviiZCBEcEE6LYT+msN6HbbjUxmwGmu/2HHttplW
        MY+Zpq+csYcPK5Xd4bPuOv9zRb5pnCJMLAsNjI8=
X-Google-Smtp-Source: ABdhPJyMdwL5ojipLR4+SXubUXmx/4sAzFh5PDj236VvaaUOBtjhksNDpE3gDJPtfFduDMWQUkMpiPO2SGNTKYd5kxs=
X-Received: by 2002:a05:6402:503:: with SMTP id m3mr1524604edv.45.1601454897204;
 Wed, 30 Sep 2020 01:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1> <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com> <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com> <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com> <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
 <20200930051521.GN9471@atomide.com>
In-Reply-To: <20200930051521.GN9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 30 Sep 2020 01:34:46 -0700
Message-ID: <CA+7tXig=3hbFXfmYMC5Hd1Zc2n-6uGXbMePPw_Cr4bOsyt7QQA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 10:15 PM Tony Lindgren <tony@atomide.com> wrote:
> * Trent Piepho <tpiepho@gmail.com> [200929 20:16]:
> > On Thu, Sep 24, 2020 at 12:04 AM Tony Lindgren <tony@atomide.com> wrote:
> > > Certainly different compatible strings can be used as needed.
> > > But pinctrl-single is not going to be am335x specific though :)
> > > We have quite a few SoCs using it:
> >
> > So what doesn't make sense to me, is to put something am335x specific
> > like two cells for conf and mux, into a generic driver like pinctrl
> > single.
>
> Treating conf and mux separately is not am335x specific. Linux treats
> them separately because the conf options typically can be described
> in a generic way while the mux is just signal routing.

There's already a generic pinconf feature for pinctrl-single.  It
seems like this could be used with am335x now without any changes,
e.g. by adding "pinctrl-single,drive-strength" to define the bits that
control drive strength.  It doesn't require added cells to use this.
Pin mux and configuration fields all have masks defined.

Example, add this:
#define PULL_MASK (PULL_UP|PULL_DISABLE)
pinctrl-single,bias-pullup = <PULL_DISABLE PULL_UP PULL_DISABLE PULL_MASK>;
pinctrl-single,bias-pulldown = <PULL_DISABLE 0 PULL_DISABLE PULL_MASK>;

If I read the driver right (the bindings doc is far from clear), then
I think that configures the pin with pad pull up/down disabled and
allows the generic pinconf system to enable the pullup or pulldown.
Combining the definition of the fields with the value to initialize it
in the same property doesn't make that much sense to me.

> With interrupts the IRQ_TYPE flags are generic and separate from the
> hardware specific cells. If we wanted to, we could have something
> similar for pinctrl framework.

pinctrl-cells is really pretty different from gpio-cells and
interrupt-cells.  The latter two are used in handles that allow an
external node to reference something in the node that defines the gpio
or interrupt cells.  The generic flags are used by an *unrelated
driver* to tell an platform specific interrupt controller driver it
should configure an edge triggered interrupt.  It makes it easier to
use the binding in the unrelated driver that needs an interrupt since
the flags are always the same.  But mainly it works because the gpio
and interrupt framework in the kernel already support these concepts,
so the flags can get passed as is to existing kernel functions.

But pinctrl-single,pins is only used inside pinctrl-single itself.
There's no handle anywhere like:
yoyodyne,reset = <&am335x_pinmux AM335X_PIN_FOO MUX_MODE7
GENERIC_PULLUP_ENABLED_FLAG>;
I don't see how one could get made either, since there's already a
pinctrl system and it just doesn't work that way.

The closest thing would be the generic pin config type bindings, which
go in the pinctrl driver's nodes, and look like this:
&am335x_pinmux {
    pinctrl_yoyo_reset: yoyogrp {
        pins = "foo";
        function = "gpio";
        bias-pull-up;
    };
};

That would work on some other boards.  To use pinctrl-single, you'd
need to have a binding that mapped pin and function names to numbers
(why couldn't the pincfg binding use numbers!) and the bits/mask for
pull up.  Which could be done.  But at that point pinctrl-single,pins
is replaced, it wouldn't even get used, so adding more cells to it
hasn't done anything for you.

> > Consider also that any future changes to the pinctrl-single bindings
> > would need to be backward compatible with a device tree binary where
> > two cells get combined.  So if the bindings being added here aren't
> > done, then adding them now creates an unnecessary additional version
> > to deal with for backward compatibility.
>
> I don't see issues with backward compabilty. If we specify that the
> controller uses #pinctrl-cells = <2>, and some additional property
> for specifying generic conf flags, we'd have a similar generic binding
> to the interrupt binding.

Is "some additional property for specifying generic conf flags"
different from the existing pinctrl-single,bias-pullup, etc.
properties?  Because splitting the data cell into two parts doesn't
make any difference to those.
