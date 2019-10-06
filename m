Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9A6CD947
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 23:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbfJFVGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 17:06:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44977 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJFVGf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 17:06:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id q12so2875494lfc.11
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2019 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9MkvVZadgXuuiXK3axP5nHEK5R/AEkoEv0bGFpNGy8=;
        b=vZ7hW2ehiAJwwZIag3VaRTkCoKZZZSNQ2opz/0C9STBqCf4n4e8DIN9U1rksYLL/bW
         Q9EAwlAtxRmh2PIoNE/LdYy8W0ffjy4eKNHg996YV7cP7vzQtAYLPStoPII6/p76zQC5
         NiMJIUZp8Aim/k2CwadFVd9qEcsnWdZEh8YqjPy8h02gWWhdDc3CBiwRhKbBGanVtpnO
         AFsJh0CPk1kOQVwM6swxy16ZkWQ9VxjdXYgXlbKhMZDyfs95HZRTWQOEHzchAGlS8dp+
         +FP9UmacJNP6HfHACLs6GkHBXnDTTDjRyIJ/uavQglwFaXxG023qj9LfkoMK3dMLCRk4
         SKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9MkvVZadgXuuiXK3axP5nHEK5R/AEkoEv0bGFpNGy8=;
        b=TrvwH1EfBkIvYFGu72PbIG05D0DyYA4PAWTQeT0HnB7JMW8CxTUWbI57/rW8BB7W7Z
         9vedkmNEPBSUh69n8Yo1w36pWOZnGoWlQquvqorjmwv7C6ITeDwrcb8kFiVBrlBYIU9l
         4sOl41JPTHqoxhNO7nBmVJwo7QkQ4p78axP3pV2o5u5HH7b4ns/N54AWcVypnkZuIFiA
         YIVNvLENt65SJdrCwag2WUOUg26UhamayhADL+AJ4HhHfDjW1oHdj8b24iv5iXn9jgeB
         koQ1MJIRIDQNCL57bzsiC1Y0ycpG7OwDgKLcaaNA5/ETvfpzuHacIGNVQuc6q2iExZag
         1Bhg==
X-Gm-Message-State: APjAAAU+fmQW92IZLRp+Eaj17XMTSMyxbohx0PLxJ+T61t2sC0/IY7gw
        G1GWFtvuvMSacTtvn+Tmk3v6cSXdpNWQXyEtCLiVag==
X-Google-Smtp-Source: APXvYqx59iYduVB6yeDCadchOR/K9/w3B2RA+oQkRZEh5DZaGuTnXHFIRrCY78zdjgr16DzjSPXTyoItyP/vcqbnC6c=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr14819472lfp.61.1570395992899;
 Sun, 06 Oct 2019 14:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
 <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
 <CACRpkdZP8GYPUk4ZB+2Ei4hrrT0Orq0MUEszJ+YM=npuh1uH9w@mail.gmail.com> <20191006031220.GA7957@sol>
In-Reply-To: <20191006031220.GA7957@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Oct 2019 23:06:21 +0200
Message-ID: <CACRpkdbYxQn21zwWHkcbjeF1DO2-jnre7=wfgd8vCd6biyueuQ@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 6, 2019 at 5:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Sat, Oct 05, 2019 at 07:02:58PM +0200, Linus Walleij wrote:
> > On Fri, Oct 4, 2019 at 9:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > > The config ioctl (or
> > > something similar) you're mentioning may appear sooner actually -
> > > users of libgpiod have been requesting a way of changing the direction
> > > of a line without releasing it - something that's possible in the
> > > kernel, but not from user-space at the moment. I'll submit something
> > > that allows to change the configuration of a requested line soon.
> >
> > Hm! I guess I assumed that userspace users would be using the lines
> > for either input or output, not complex use cases like that, reversing
> > direction and what not.
> >
> > What kind of usecase is this? I certainly hope nothing like doing
> > userspace drivers for complex hardware ... those should be in
> > the kernel... the current ABI is a bit oriented around industrial
> > automation and prototyping use cases.
>
> I'm not the only one asking for this, and I can't speak to others' use
> cases, but in my case I'm prototyping and bit bashing a SPI driver for
> an ADC where the MOSI/MISO lines can be tied to save a pin. I need to
> be able to switch line direction without glitching the line and that
> can't be guaranteed with the current UAPI.
>
> Would you consider that "complex hardware"?

I see, so in the Linux kernel this is called 3-wire SPI, and we would
drive the SPI bit-banged bus using drivers/spi/spi-gpio.c and
model ADC "foo" it as an ADC in drivers/iio/adc/foo.c.

The device tree would look something like so:

spi {
    compatible = "spi-gpio";
    #address-cells = <1>;
    #size-cells = <0>;

    gpio-sck = <&gpio0 5 GPIO_ACTIVE_HIGH>;
    gpio-mosi = <&gpio0 8 GPIO_ACTIVE_HIGH>;
    cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
    num-chipselects = <1>;

    adc {
        compatible = "foo";
        reg = <0>;
        spi-3wire;
    };
};

(There are ways to define devices without explicit chipselect
as well, yielding a 2-wire bus in the end.)

The goal of the bit-banged SPI GPIO driver is to have one
driver that can be reused for any GPIO bit-banged SPI.

The goal of IIO ADC is to present a uniform and scaled
ADC interface to userspace, such that userspace need not
worry which ADC it is using because they all present the
same user API. IIO further provides precise triggers
using timers or interrupt generators to provide a
continous stream of AD-converted values using a
ring buffer.

So in summary the kernels SPI, GPIO and IIO subsystems
want to abstract hardware and make userspace simpler,
and the kernel sees userspace as having no business
driving hardware.

This might be seen as a bit imperialistic, but alas, the
explicit goal of kernel development is hardware abstraction,
and what happens sometimes in the maker community
in particular is to reimplement what the kernel does in
userspace.

What we are especially worried about is that for systems
that are not one-offs and lab prototypes, something that is
getting productified, the userspace tinkering and hackering
is just preserved in resin and no transition to proper Linux
drivers happens.

So we want userspace GPIO access to be an enabler and
not a competitor to the Linux kernel.

There are other mechanisms in the kernel with this problem,
such as UIO.

There is a problem with the biases here, such that some of the
kernel people always think they are dealing with companies
and that kind of larger organizations, and I am one of those
that don't think like that.

When it does come to companies, I think
there is this quote by Fred Brooks that you should
"always plan to throw one away" so they might write a
userspace prototype, then
throw that away and write a kernel driver as one gained
knowledge of how the hardware works. It's one of the ways
to spin it. And we want to encourage that way of doing
some userspace prototyping. And if the usecase gets
complex enough it will lean toward: what about just writing
a kernel driver in the first place and refine that.

If we are thinking a hobbyist, they are thinking to drive this
thing on their table for the next two hours or as an experiment
or for fun, or semi business (a few devices, not really mass
production), like to set up a factory line or a lightshow, that
is something that should stay in userspace and has no business
in the kernel.

And we just need to know what usecase it is here. But I need
to understand.

Yours,
Linus Walleij
