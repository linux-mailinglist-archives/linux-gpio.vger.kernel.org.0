Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD183774B4
	for <lists+linux-gpio@lfdr.de>; Sun,  9 May 2021 02:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhEIA26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 20:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhEIA25 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 20:28:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1025AC06175F
        for <linux-gpio@vger.kernel.org>; Sat,  8 May 2021 17:27:53 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b7so16311042ljr.4
        for <linux-gpio@vger.kernel.org>; Sat, 08 May 2021 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sOG7GoczpFfze5AyMT4RluOASRTehzGf0LNWttOKk5c=;
        b=fd/VQghyl1il11WcKIahjTpti38ABPOV+dWJY++N6qi+RgRaK1GW8Sk7C+ltz/7Xga
         z0doL14X6Ldz+/jney8rR8LcRGt+D2mcXm9tdfOGM6mOugc45rNXotg+pcpI6ZU/Tuex
         uG4xC2vISLas1g8vYAfDvc/8Vwhd6Rdc/JSw5APFXzlTg+j3aXEKzb2YGGeHPcTbK+Zz
         qaDpZ7G34rsLW5ylHIuAe5pKPqjvDpmVNXKM8lnDzNkxYjZWOua/S1Cml+oCCo6j343y
         cKeiz60axq1J9KfnYqCtYJfJxfVXxyJ1JA0Pl6fAzDQdiOBkEMgO3cW4jlJ4Mn16HamA
         RMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sOG7GoczpFfze5AyMT4RluOASRTehzGf0LNWttOKk5c=;
        b=JlglUQhhrby+x8azFcoaSjFQMzuKx6maBidMs3AMQIwyVPqTE/vfgByTGUoBT8W951
         OQdQR8qM0yHuCF+t251kHvQRwLzJNQWs6QDjgTv0SY1ewMhS4EVfce+Zp7tC9B1Qp7dJ
         qbMK5wvsGkuD4BiHH0hbCePZkZC4Bt4mNtoIfI1WD4/EIgDq0/wJl34v21fkpYovLM2D
         n9gPlv60YIACfzsesSV2g4eJNY5JUh+O4A4Efwhbj0UxkbjzTjD9SWBZV4LtjdDUIJ4M
         qQlcrJnmYIyMCY16244AgE8Xo7dygrvc6O6UzsbcGwbZuMN5c4Bx9zLnq4Wp1DD2U7r/
         W+qQ==
X-Gm-Message-State: AOAM532EcbfVTGqw4b4eamQG1uB3UyT03IHQNirOxLkJBE8hEIHpCiZ1
        /WNaw2lnBFzPJc1Cd9Ba2LhsV3gSqZ/7vcKt/i4biw==
X-Google-Smtp-Source: ABdhPJytxvCNL0+i08ru81BLLE5rAKxOEzAlmjHrXOhOGfZ4saKKLNoNxxgTYNohihYYlBVogll59unffk6oK9h0E/k=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr5939134lji.273.1620520071392;
 Sat, 08 May 2021 17:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
 <CACRpkdbUNs_FFv9RteWKUrxBdRuiXU2Fkt-oY4=Phke4gNBoaQ@mail.gmail.com> <c1bd678c5dc81db8@bloch.sibelius.xs4all.nl>
In-Reply-To: <c1bd678c5dc81db8@bloch.sibelius.xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 May 2021 02:27:40 +0200
Message-ID: <CACRpkdb=0EQN=CJqfjKS-iuAiKCvU38fw5krzEY5LvhNpyFd3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     kettenis@openbsd.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        sven@svenpeter.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 9, 2021 at 1:02 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> [Me]
> > On Sat, May 8, 2021 at 4:20 PM Mark Kettenis <kettenis@openbsd.org> wrote:

> My U-Boot driver is here:

Thanks! Looks nice.

> > > +description: |
> > > +  The Apple GPIO controller is a simple combined pin and GPIO controller
> >
> > spelling
>
> Not sure I'm seeing a spelling mistake here.  Do you want a comma
> inserted somewhere?

Your original mail says "conroller" but the helpful google mail
editor autocorrected the mistake when I hit enter after it.

> > So is this an entirely Apple thing now, and not based on some Samsung
> > block from S3C like what we have seen before?
>
> As far as I can tell, yes.  This Apple controller has a single
> register per pin that controls the muxing and gpio functions, whereas
> the S3C controller seems to have 4 registers per pin.

Fair enough.

> > What I am really wondering is if these interrupts are hierarchical,
> > i.e. that they match 1-to-1 to a GPIO line.
>
> They don't match 1-1.  The GPIOs can be assigned to one of
> (apparently) 7 interrupt groups.

Aha so it is a 1-to-1..* thing. How delicate.

>  I haven't looked to closely at this
> yet since U-Boot doesn't need/use the interrupt capability.  But I
> suspect that pins don't have to be assigned to a interrupt group and
> that explains why there are only 7 interrupt groups as the 8th state
> is reserved for "unasigned".  The number of pins per controller
> varies, but one of them has 212 pins.

Wow.

> Multiple pins can be assigned to the same interrupt group as far as I
> can tell.  So in that case the driver will have to look at status
> bits.

OK then this is not hierarchical.

> > Marc Zyngier can probably tell the story of why it is handled
> > like this,
>
> Ok, hopefully Marc can say something sensible here, but I'd say the
> interrupts on this hardware are cascaded.

Yes looks like so, it will be an interesting interrupt driver when
you get to that.

I have only the question in my second mail (just sent) but in any
case you are not doing anything out of the ordinary (it looks very
similar to the STM32) so I'm pleased with this binding.

I wanna give the DT reviewers some time to look at it as well
but I imagine we can soon merge this.

Yours.
Linus Walleij
