Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7932011206D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 00:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLCXvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 18:51:16 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45214 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfLCXvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 18:51:15 -0500
Received: by mail-oi1-f194.google.com with SMTP id v10so3055881oiv.12;
        Tue, 03 Dec 2019 15:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SkcpN2UUanMKF/rnWNGUcqchY5nFWiPVkRQgTO4Puoo=;
        b=LYTCj5+Gv/23d7Jc1xk8s+tt/Fkonc5301SGWrukes8L/BYCO2JVjzT7o0RF2qc0wa
         NBJC7kTZCcLfTp8T8dVUzA0+QE0SoftVaNDDF3EFhrzDnFaKdFFwjBxNkyYVX+8mBIyY
         v2wdvGmmmXVQeC70LDtFBT1sQlJpcL2ft1+P485WRoMxUOYtu1Dtkrk7vEJdN6W6pESO
         4RJuZZu5/i2xQalYE+RSrwqNH13OFoSolJyjyTGGJrY1/eHCqYm+fdVPX9eH5X7Gmf7T
         WR2t9TJG2f2VmEcYbHQvsgxYenRIMqDmeb0KWE28SFYWgfHnlvSoot+ObEEh7viKtxnv
         DnHw==
X-Gm-Message-State: APjAAAV7IWAFjQsKjab7w1wG8VC0MZmqzuJLB5jLmCJCh19eNZoQNI8R
        fp6/u4CeS6xzEi+OLTRcIg==
X-Google-Smtp-Source: APXvYqzazl0OEyw6s/9aFSwAU//TPf9Kq04ioUejidSUVLDHnzQKbuDJv21FN6U2dIOhAB9cVm3txg==
X-Received: by 2002:aca:fc17:: with SMTP id a23mr244614oii.63.1575417074391;
        Tue, 03 Dec 2019 15:51:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i15sm1570961otl.69.2019.12.03.15.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 15:51:13 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:51:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC 1/2] dt-bindings: gpio: Document shared GPIO line usage
Message-ID: <20191203235113.GA12929@bogus>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
 <20191120133409.9217-2-peter.ujfalusi@ti.com>
 <CACRpkdbXX3=1EGpGRf6NgwUfY2Q0AKbGM8gJvVpY+BRAo5MQvQ@mail.gmail.com>
 <d423bc53-31df-b1b4-37da-932b7208a29e@ti.com>
 <CACRpkdafEdsN6i16SA175wE4J_4+EhS5Uw4Qsg=cZ=EuDYHmgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdafEdsN6i16SA175wE4J_4+EhS5Uw4Qsg=cZ=EuDYHmgg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2019 at 11:06:35AM +0100, Linus Walleij wrote:
> On Fri, Nov 22, 2019 at 2:36 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> > On 22/11/2019 14.10, Linus Walleij wrote:
> > > On Wed, Nov 20, 2019 at 2:34 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> > >
> > >> Boards might use the same GPIO line to control several external devices.
> > >> Add section to document on how a shared GPIO pin can be described.
> > >>
> > >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > >
> > > As I've stated earlier I think this information is surplus.
> > > If two devices have a phandle to the same GPIO line
> > > then it is by definition shared.
> >
> > Well, phandle + line number to be precise.
> 
> This is what I mean when I say "phandle to the same GPIO line".
> Like this:
> 
> foo-gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
> 
> If the phandle <&gpio0 5 *>; appear in some other
> (non-disabled) node it has > 1 users.
> 
> > >> +               line_a {
> > >> +                       gpio-shared;
> > >
> > > So this is unnecessary: if the same line is referenced
> > > by phandle from two places it is shared, simple as that.
> >
> > phandle is pointing to the gpio controller, not to the line.
> 
> Cleared up above.
> 
> > >> +                       gpios = <5 0>;
> > >> +                       output-low;
> > >
> > > This is overlapping with the use case to define initial
> > > state values for GPIOs, something that has been
> > > brought up repeatedly and I've collected links for
> > > previous discussions several times.
> >
> > I don't mind this to go away and the first set would configure the level.
> > Kept it here so I can reuse the gpio-hog code from gpiolib-of ;)
> 
> People have tried to reuse the hog code to set up
> initial line levels as well, it failed because they could
> not get the DT bindings through the door.
> 
> > > I guess if need be I have to look them up again.
> > >
> > > The DT maintainers don't like the hog syntax so
> > > something else is desired for this.
> >
> > I see, so the gpio-hog might change?
> 
> They will not change since they are ABI, but their
> use case will not be extended AFAICT.
> Not my pick, I liked the hog syntax but we need
> consensus.
> 
> > > (snip)
> > >> +The shared GPIO line management strategy can be selected with either of the
> > >> +following properties:
> > >> +- refcounted-low: The line must be kept low as long as there is at least one
> > >> +               request asking it to be low.
> > >> +- refcounted-high: The line must be kept high as long as there is at least one
> > >> +               request asking it to be high.
> > >
> > > Is this really needed? Isn't it more appropriate to just define the
> > > semantics such that as soon as some consumer requests the line
> > > high it will be refcounted high, and as soon as it is requested
> > > low by any consumer it will be refcounted low.
> >
> > Well. How do we decide which level is the one that should be preserved?
> 
> First come first serve.
> 
> If there is any conflict amongst the consumers we are
> screwed anyway so why try to establish where they should
> agree if they don't agree?
> 
> > How would the core decide what to in a simplest case:
> > two device, they are the same part.
> > ENABLE pin which needs to be high to enable the device.
> > When the driver probes it asks for initial deasserted GPIO as the device
> > is not in active use.
> 
> This makes me think it should be a unique driver
> with a unique compatible string, as it embodies
> use cases.
> 
> It is too broad to just define
> refcounted-high or refcounted-low, that is hiding the
> real use case, so I would go for something like a
> resource in the device tree that all other devices that
> need it can take.

I have similar thoughts.

> Like a reset controller, precisely:
> 
> reset: reset-controller {
>     compatible = "reset-gpio";
>     gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
>     #reset-cells = <0>;
> };
> 
> dev0 {
>     resets = <&reset>;
> };
> 
> dev1 {
>     resets = <&reset>;
> };

> 
> The ambition to use refcounted GPIOs to solve this
> usecase is probably wrong, I would say try to go for a
> GPIO-based reset controller instead.

Yes, but I think we can have that AND use the existing binding.

> The fact that some Linux drivers are already using explicit
> GPIO's for their reset handling is maybe unfortunate,
> they will simply have to grow code to deal with a reset
> alternatively to GPIO, like first try to grab a reset
> handle and if that doesn't fall back to use a GPIO.

I think this could just be all handled within the reset subsystem given 
that we've been consistent in using 'reset-gpios' (GPIO regulators are 
similar, but we never had such consistency with GPIO names for 
regulators). We can implement a reset driver for the 'reset-gpios' 
property that deals with the sharing. Drivers to DT nodes doesn't have 
to be 1:1. It's convenient when they are, but that's encoding the OS's 
(current) driver structure into DT.

Rob
