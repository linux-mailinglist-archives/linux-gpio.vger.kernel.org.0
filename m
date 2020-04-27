Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABEB1BAE5E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2020 21:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgD0TqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Apr 2020 15:46:25 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42273 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgD0TqZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2020 15:46:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id m18so28365069otq.9;
        Mon, 27 Apr 2020 12:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZPSwnLaVJoHKZ9gTmqcQzdkiKyom2KMXuvcc5NL8f0=;
        b=p8i9GxvwmI+vSaBy51oRhysv1KIvesRfoSLjdDxggUJbaGbgufy5GT04xUSTlyiW2K
         OYtrMae+bCpuCnq93476EtLNTkex549yHotWHOoco6jFUZ4+k7xxAlSgYS21jDwwztqp
         GOXZkl+M5voqFnDkBETXETWURszwJDvXl8xLqcCiIyZ4f21kNJAw0CvABfdoMmSJ+cIT
         Qvk6HCI2KcKYdr/e1KBEwHlOhWvjj3XigODGDM42obAwg8PrkNJTWG9tKEXFPqa80oyG
         LU3aQb0+YqYHn7Z/M/G2K431YMExu/VHV8CZ7i3k94Sl/78ZEuBvQyQK+9gnQKXzH0x6
         mgww==
X-Gm-Message-State: AGi0PuaZ9EU1AWSedvUuQSdWp5NjqTIkAfJCyZ9ve3F9nLh5dLj/w9mz
        C/TtXp2P2YpN9QcqrGhl38+kyeDqO8BIGC6RjbCbnQ==
X-Google-Smtp-Source: APiQypJCloyTuyhE1nAXCCzRliRmHFTlHmDKYp7HOimcUBYBVgEQDe3B0HJO+sJOS1VGIexMbvmLJwg5Jp6Tos7p5YI=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr13546563otm.145.1588016783144;
 Mon, 27 Apr 2020 12:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdW4KJ8GgEZZVBuuY2ciG1UqaufQUk04b95f9j4pA_2i2g@mail.gmail.com>
In-Reply-To: <CAMuHMdW4KJ8GgEZZVBuuY2ciG1UqaufQUk04b95f9j4pA_2i2g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Apr 2020 21:46:11 +0200
Message-ID: <CAMuHMdX2D=t7AoRcaeE7b205U9n9F812jVJq7BHKJdJL8r1siw@mail.gmail.com>
Subject: Re: gpio-reserved-ranges and RZ/G1C (was: Re: [PATCH] gpio: rcar:
 select General Output Register to set output states)
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Vladimir,

(This time with the new email address ;-)

On Mon, Apr 27, 2020 at 9:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Sorry for taking so long to get back to you, after our chat at Embedded
> Recipes.
>
> On Tue, Dec 18, 2018 at 1:58 PM Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
> > I'm still influenced by a use-case of competing access to a GPIO controller
> > from two OSes, there might be an overlapping with Linux PM routines in
> > the driver.
> >
> > As a side note I'm not convinced that gpiochip_line_is_valid() and
> > gpiochip->valid_mask usage in the driver is justified, unless it is agreed
> > that 'gpio-reserved-ranges' property is really supposed to describe "holes"
> > in GPIO controllers. The property found in r8a77470.dtsi (RZ/G1C) looks like
> > a kludge instead of making a proper assignment of 'gpio-ranges' property:
> >
> > -                       gpio-ranges = <&pfc 0 96 30>;
> > -                       gpio-reserved-ranges = <17 10>;
> > +                       gpio-ranges = <&pfc 0 96 17>, <&pfc 27 123 3>;
> >
> > The change above is untested and I have no access to RZ/G1C manual, it is
> > shared just to demonstrate an alternative idea of describing holes.
>
> Actually this is what Biju's v1 did[1].  But making that works means
> adding support for multiple "gpio-ranges" to the gpio-rcar driver.  Of
> course that can be done, but it will complicate things, as all "offset"
> parameters in GPIO controller callbacks would need to take into account
> the holes when converting from contiguous offsets to discontiguous
> register bits.
>
> Note that the second tuple is <&pfc 27 123 3> not <&pfc 27 113 3>, i.e.
> the hole is not only present in the GPIO bank, but also in the pin
> controller's pin numbering (the PFC GPSR3 register has the same hole).
>
> Documentation/devicetree/bindings/gpio/gpio.txt says:
> | Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO bank is an
> | instance of a hardware IP core on a silicon die, usually exposed to the
> | programmer as a coherent range of I/O addresses. Usually each such bank is
> | exposed in the device tree as an individual gpio-controller node, reflecting
> | the fact that the hardware was synthesized by reusing the same IP block a
> | few times over.
>
> ... which applies to the R-Car GPIO block.
>
> | Optionally, a GPIO controller may have a "ngpios" property. This property
> | indicates the number of in-use slots of available slots for GPIOs. The
> | typical example is something like this: the hardware register is 32 bits
> | wide, but only 18 of the bits have a physical counterpart. The driver is
> | generally written so that all 32 bits can be used, but the IP block is reused
> | in a lot of designs, some using all 32 bits, some using 18 and some using
> | 12. In this case, setting "ngpios = <18>;" informs the driver that only the
> | first 18 GPIOs, at local offset 0 .. 17, are in use.
>
> So far the R-Car GPIO DT bindings never had a need for the "ngpios"
> property.  The same information can easily be extracted from the last
> cell of the (single) mandatory "gpio-ranges" value.
>
> | If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1, an
> | additional set of tuples is needed to specify which GPIOs are unusable, with
> | the gpio-reserved-ranges binding. This property indicates the start and size
> | of the GPIOs that can't be used.
>
> This also matches the case on RZ/G1C.
> So IMHO using "gpio-reserved-ranges" is appropriate for RZ/G1C.
>
> I do think the commit description of commit b9c725ed73b7cecc
> ("dt-bindings: gpio: Add a gpio-reserved-ranges property"):
>
> | Some qcom platforms make some GPIOs or pins unavailable for use
> | by non-secure operating systems, and thus reading or writing the
> | registers for those pins will cause access control issues.
> | Introduce a DT property to describe the set of GPIOs that are
> | available for use so that higher level OSes are able to know what
> | pins to avoid reading/writing.
>
> is confusing, as it only talks about pins that can be used by a secure
> OS only, but the actual changes to gpio.txt are in-line with GPIO lines
> that are simply not wired to physical pins, which is what the original
> paragraph was talking about, too.
>
> What do other people think?
> Thanks!
>
> [1] [PATCH 2/4] ARM: dts: r8a77470: Add GPIO support
>     https://lore.kernel.org/linux-devicetree/1532685089-35645-3-git-send-email-biju.das@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
