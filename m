Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D983210D29E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 09:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbfK2IuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 03:50:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37650 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfK2IuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 03:50:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so3735985lja.4
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDD/UnUADM3mnwpvsAchbYVhZu3juMpSxL84tbPsIbo=;
        b=KVLHCWMignsuWlcS7LxuvXdykXnJdIoBNiW8JithqBRaN9wcvo1g4UE3oE6h6RdcRN
         jLEvrMDIUWh3WxK9ixpeKqxPjlewzTq0GI6ilyuAFhW2YJf1ZqbkL3ADAUdPwFG875jh
         x9vo6h0wlgAaxokaLK4+dCSaEdEZrMQXocgg3mRKJwRpOm0JsRMmk9AGZyiS5TIAU7qN
         6LRFXkHjDx00GXywgORKLFx4NJ+nqr0y7wGWB2ZGfDi/YrZchGozjMmNsFaqACRsKEPr
         fn6mkQtNRbJfvCBG9q3xKL9NRXLgrzKNGAdC+zFhxaiIniwKZZetUCiZPeUpg5H5cbep
         yDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDD/UnUADM3mnwpvsAchbYVhZu3juMpSxL84tbPsIbo=;
        b=eoMy6Zhs19W+wx0KnrOBLe/6v2pyi/IQX+SLIfAk6NhzmutOiDgq7ypYDn2hSF9IRb
         Z0ki1d/VsQbbwKNb7P3L0G3OjPFYtHeKKf99IgrbGcqlyVmB7wnHYqpinDuDWgqf+xmT
         KUCGfAHa+KfAGOa61wdUuwIOIEGU4VFlJVSz21u2s+MHzW7SHDc0gs5IZUVEHfPPNsXi
         HMTSkS1R8T1vZnYXZpXShaPuhfH8vpX1qxq4AaRgR26pI+C5ZdoZUJrTjWQHoG5crXDV
         h8g0bZ9kILwrjYFveU6Nu5Tj0tczBOb543hDZUw9LnDZsxQ7in4e5EDfZUIJO4SAXfSO
         OXuQ==
X-Gm-Message-State: APjAAAXlVJxcFwzW62AoUxh/lQAr9KlSTy77+leQnQGJ/Bh1Ms+8HY4v
        a9HQU4oCEgDeCYW3YZf/GgXFPCITjOWQx/4F9QUoQw==
X-Google-Smtp-Source: APXvYqxNOTdjq0eH1xPQUrG1i3ed9i46I+BwE5vw5X2SkpBR2UmTqJlh0NKv9bJLxRIPCTk4T6SWpbiyPuLBwslQnQw=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr36852322lji.191.1575017408368;
 Fri, 29 Nov 2019 00:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-3-m.felsch@pengutronix.de> <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
 <20191127151929.GC4879@sirena.org.uk>
In-Reply-To: <20191127151929.GC4879@sirena.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 09:49:56 +0100
Message-ID: <CACRpkdbJbCwo7yALnywscCTZBzO1ZzWY_=c5RoVGqY7Eue3t=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
To:     Mark Brown <broonie@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 4:19 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 27, 2019 at 02:35:33PM +0100, Linus Walleij wrote:
>
> > I can clearly see that regmap's irqchip does not support
> > hierarchical interrupt domains, so we should just make a
> > mental note somewhere that "oh yeah and then one day
> > we should make regmap irqchips play well with hierarchical
> > interrupts".
>
> Why, what do we need to do?  We're just doing all the default stuff,
> it's not something we've opted out of, and the whole point with using
> the frameworks should be that we should get software features like this
> for free :(

I guess it is a bit about moving targets.

The regmap irq thing was covering all reasonable cases until
the hierarchical interrupts were introduced some years ago.

The hallmark of these are that the irq_domain_ops implement
.translate() .alloc() and .free() rather than .map() and .xlate()
as the irqdomain in reqmap-irq currently does.

The problem with hierarchical domains is that the system using
them need to be hierarchical "all the way up" to the overarching
top-level irqchip. Currently only the ARM GIC and the IXP4xx
irq top-level irq controllers supports this, ruling out some
obvious users like all non-ARM systems (for now).

I think the assumption in hierarchical irq is that you have
a few hardware-specific irchips and you know exactly which
irqchip that goes on top of another one, as well as which
hardware irq line is connected to which hardware irq line
on the parent.

Since we know the specific hardware (from a compatible
string or so) we can hardcode the parent-to-child mappings
of interrupt lines in the driver. These mappings are not
in the device tree for example.

Therefore supporting hierarchical and nonhierarchical alike
in a very generic plug-in irqchip like the regmap-irq is a bit
of a challenge as it has to support both hierarchical and
non-hierarchical, because it is not possible to just
convert this to hierarchical callbacks: it has to check what
its parent is doing and adapt, essentially implement both
hierarchical and non-hierarchical at this time.

Also we need to pass mappings between parent and child
somehow. In the gpiolib we did this with a callback to the
GPIO-chip-specific driver. How to do it for something
generic like regmap-irq is an open question.

So it is a bit complex.

(Marc may correct me here.)

Yours,
Linus Walleij
