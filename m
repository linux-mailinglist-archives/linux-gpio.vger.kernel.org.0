Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EF5CDB1F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 06:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGEho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 00:37:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34108 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbfJGEho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 00:37:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so7841540pfa.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2019 21:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DW2YGD8sZOjiTum7lanl+M6+2tNWjVwNFLGpscSwmFI=;
        b=jf0xx7gSKkjOaVxsj3A0AKDeNen+FZ2HEFLvThxeUH1U2ATik+wi5gr/X6KAUw0QZq
         EgZNFgcMSbeRKWsKcSruFzYduSEzQ6xqy9n1FlLap0QFIjA/t7px7Y4stHMnrC89L3B1
         mavrphNbLdsL8xOrMoOXqghXbCDDj0EmfeLfjxTC9uyQxSZE0JkfOW7+FJVD+dtrejxX
         523ItjcDqRBgW8LPgRGP5xMi86XKYczWkFV1B8rqb6UACnX7Sm+mjvH3Z88DpY18n2jY
         NMnFPVcUsOtwZLEBkYfFJjJo3Vj64+sh6LgRIM+DXMwtwSe+keY+x19oxFrodfM0XYTO
         WmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DW2YGD8sZOjiTum7lanl+M6+2tNWjVwNFLGpscSwmFI=;
        b=VTwsIIEsEE/w568/Ox1H3/lAtwyruKWheVI+e3AK6cwj8wr4ZNDhBMLu9uiDA1Jy/1
         WYkIZUQfH7zXH17emPb2u9IgFXFHpfOHAN88jTQMgA/lNvks+6INlVbsAbVgTlHPCdBn
         YupekpGo73Dkb1nfSaS5G/jNShrEYsjEXwedYQp2fZtwNeMpWadkrHytHLTYN+ClFQCl
         aUFBUnJGb2O8cQivq5QYT7WAnhF4lKi1Arkf6IFp4K9O6EQ+Xy/CanYU1XNq/Dr1C5Y/
         P4lIH1YQejAvUtGMTyLLmJS+wKfRU64yyJSwNSLLARgntqvSxwnA0i8CDsSR0YnJWepF
         bSww==
X-Gm-Message-State: APjAAAVyBRWBYGmFvLvRSBvwU+iizp9InikUOwlUNL17n0xkpBtucBwg
        7tcf3D9W/dBqgB6EImM16S6y/n9oaOiaMw==
X-Google-Smtp-Source: APXvYqxld8w+txD4KsAXLe0dbnsu32ZwGZesOvqQo1vgbfgE87D/bAhEfONEIQp5YPCYiHEuBAt0pw==
X-Received: by 2002:a65:4549:: with SMTP id x9mr27873266pgr.170.1570423063274;
        Sun, 06 Oct 2019 21:37:43 -0700 (PDT)
Received: from sol (220-235-122-141.dyn.iinet.net.au. [220.235.122.141])
        by smtp.gmail.com with ESMTPSA id r24sm4841451pgo.58.2019.10.06.21.37.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2019 21:37:42 -0700 (PDT)
Date:   Mon, 7 Oct 2019 12:37:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191007043737.GA10121@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
 <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
 <CACRpkdZP8GYPUk4ZB+2Ei4hrrT0Orq0MUEszJ+YM=npuh1uH9w@mail.gmail.com>
 <20191006031220.GA7957@sol>
 <CACRpkdbYxQn21zwWHkcbjeF1DO2-jnre7=wfgd8vCd6biyueuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbYxQn21zwWHkcbjeF1DO2-jnre7=wfgd8vCd6biyueuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 06, 2019 at 11:06:21PM +0200, Linus Walleij wrote:
> On Sun, Oct 6, 2019 at 5:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Sat, Oct 05, 2019 at 07:02:58PM +0200, Linus Walleij wrote:
> > > On Fri, Oct 4, 2019 at 9:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > The config ioctl (or
> > > > something similar) you're mentioning may appear sooner actually -
> > > > users of libgpiod have been requesting a way of changing the direction
> > > > of a line without releasing it - something that's possible in the
> > > > kernel, but not from user-space at the moment. I'll submit something
> > > > that allows to change the configuration of a requested line soon.
> > >
> > > Hm! I guess I assumed that userspace users would be using the lines
> > > for either input or output, not complex use cases like that, reversing
> > > direction and what not.
> > >
> > > What kind of usecase is this? I certainly hope nothing like doing
> > > userspace drivers for complex hardware ... those should be in
> > > the kernel... the current ABI is a bit oriented around industrial
> > > automation and prototyping use cases.
> >
> > I'm not the only one asking for this, and I can't speak to others' use
> > cases, but in my case I'm prototyping and bit bashing a SPI driver for
> > an ADC where the MOSI/MISO lines can be tied to save a pin. I need to
> > be able to switch line direction without glitching the line and that
> > can't be guaranteed with the current UAPI.
> >
> > Would you consider that "complex hardware"?
> 
> I see, so in the Linux kernel this is called 3-wire SPI, and we would
> drive the SPI bit-banged bus using drivers/spi/spi-gpio.c and
> model ADC "foo" it as an ADC in drivers/iio/adc/foo.c.
> 
> The device tree would look something like so:
> 
> spi {
>     compatible = "spi-gpio";
>     #address-cells = <1>;
>     #size-cells = <0>;
> 
>     gpio-sck = <&gpio0 5 GPIO_ACTIVE_HIGH>;
>     gpio-mosi = <&gpio0 8 GPIO_ACTIVE_HIGH>;
>     cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
>     num-chipselects = <1>;
> 
>     adc {
>         compatible = "foo";
>         reg = <0>;
>         spi-3wire;
>     };
> };
> 
> (There are ways to define devices without explicit chipselect
> as well, yielding a 2-wire bus in the end.)
> 
> The goal of the bit-banged SPI GPIO driver is to have one
> driver that can be reused for any GPIO bit-banged SPI.
> 
> The goal of IIO ADC is to present a uniform and scaled
> ADC interface to userspace, such that userspace need not
> worry which ADC it is using because they all present the
> same user API. IIO further provides precise triggers
> using timers or interrupt generators to provide a
> continous stream of AD-converted values using a
> ring buffer.
> 
> So in summary the kernels SPI, GPIO and IIO subsystems
> want to abstract hardware and make userspace simpler,
> and the kernel sees userspace as having no business
> driving hardware.
> 
> This might be seen as a bit imperialistic, but alas, the
> explicit goal of kernel development is hardware abstraction,
> and what happens sometimes in the maker community
> in particular is to reimplement what the kernel does in
> userspace.
> 
> What we are especially worried about is that for systems
> that are not one-offs and lab prototypes, something that is
> getting productified, the userspace tinkering and hackering
> is just preserved in resin and no transition to proper Linux
> drivers happens.
> 
> So we want userspace GPIO access to be an enabler and
> not a competitor to the Linux kernel.
> 
> There are other mechanisms in the kernel with this problem,
> such as UIO.
> 
> There is a problem with the biases here, such that some of the
> kernel people always think they are dealing with companies
> and that kind of larger organizations, and I am one of those
> that don't think like that.
> 
> When it does come to companies, I think
> there is this quote by Fred Brooks that you should
> "always plan to throw one away" so they might write a
> userspace prototype, then
> throw that away and write a kernel driver as one gained
> knowledge of how the hardware works. It's one of the ways
> to spin it. And we want to encourage that way of doing
> some userspace prototyping. And if the usecase gets
> complex enough it will lean toward: what about just writing
> a kernel driver in the first place and refine that.
> 
> If we are thinking a hobbyist, they are thinking to drive this
> thing on their table for the next two hours or as an experiment
> or for fun, or semi business (a few devices, not really mass
> production), like to set up a factory line or a lightshow, that
> is something that should stay in userspace and has no business
> in the kernel.
> 
> And we just need to know what usecase it is here. But I need
> to understand.
> 
Most definitely thinking hobbyist applications, so stepping up to 
DT/SPI/IIO would be massive overkill.

While I understand the desire that those kernel features be used where
appropriate, there are still cases where just being able to drive a
GPIO pin from userspace is the best solution.

I've been working with the Raspberry Pi where the accepted approach
to userspace GPIO is based on gpiomem - a kernel module that provides
memory mapped access to the bcm2835 registers.  For reasons that I hope
are obvious, I would like to move away from that to standard kernel
APIs, so the GPIO UAPI.

The changes to the GPIO UAPI that I've been discussing with Bart,
(the direction change and pull up/down support) are to cover 
reasonably common operations that currently only have kernel
space solutions.

I'm happy to implement those changes, btw, but want to ensure
that I'm on the right track so I don't go wasting anyone's time.

Cheers,
Kent.
