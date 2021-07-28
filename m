Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4220C3D8CA0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 13:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbhG1LWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 07:22:07 -0400
Received: from mail-yb1-f176.google.com ([209.85.219.176]:36556 "EHLO
        mail-yb1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbhG1LWG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 07:22:06 -0400
Received: by mail-yb1-f176.google.com with SMTP id j77so1342164ybj.3;
        Wed, 28 Jul 2021 04:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9C90hpgYkE4biTrUIzNHDYYty+iOjCgfF4PS52t6ewo=;
        b=F6pJPrvdCieXriMEBuqgIXnPrNl6PtcJpZiaoh3GGXKuHZowv6plgRKI2uRH93Lbfh
         AKiAwfdG+sAvdvz1Wpwib/UQtps7ej/ius40I1HAKzkcAhliU1gtoKLmE2vr6kJQPo7Y
         w+Lattr/kY729rVR0sddKt0LSBYh1cxJjYDiHws0sidf7/AfPCzRyaHnMAM5CsjPic/f
         1cb/0wXiw7VsbQo7zjt2AT7NFqHvCVKAWayp7D0J+2UkB3pjQavxpWMHkCa7kL/CayA3
         UC+G5v+80KNR6PwPjXbq/LecM0JUr50Vf+7kRLDxEbZMxsi+xZjgAJDuCeigCGsvAktm
         vRJg==
X-Gm-Message-State: AOAM533zp8NXxWGhVujmsuzCr6KClIbetHx1Dh4GWuEW0mWed+WusCLR
        aHH59FAc6+6cqry5Ejslj7X65oa3YQ0iucKCICk=
X-Google-Smtp-Source: ABdhPJyMKN9A7vWkH92nGKXoClZVP7xtHJgjDzAKw67iBSQKKzU7V2Oom+eEuE5m1MWc9u5CTXApe/NPMo7j7l4w0a4=
X-Received: by 2002:a25:1e89:: with SMTP id e131mr9659175ybe.90.1627471323751;
 Wed, 28 Jul 2021 04:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc> <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1> <dad13b899b69436acc1804b7c3438639@walle.cc>
 <20210727052851.GA3147871@x1> <ff76b62927e3f5f016f6c4c11ca16ccf@walle.cc>
 <CANBLGczfrmv1tzFm=Fu6B_S8nZ=ckwd3DOBkN4x7BUZtAg7bdw@mail.gmail.com> <a15823a88515f944cad6d77bdd65555c@walle.cc>
In-Reply-To: <a15823a88515f944cad6d77bdd65555c@walle.cc>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 28 Jul 2021 13:21:52 +0200
Message-ID: <CANBLGcyN9TVp6UghJMpc4hULz4e+OPux0fEwfQoJrixxO4rcuA@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 28 Jul 2021 at 13:19, Michael Walle <michael@walle.cc> wrote:
> Am 2021-07-28 12:59, schrieb Emil Renner Berthing:
> > On Wed, 28 Jul 2021 at 11:49, Michael Walle <michael@walle.cc> wrote:
> >> Hi Drew,
> >> Am 2021-07-27 07:28, schrieb Drew Fustini:
> >> [..]
> >> >> > > Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
> >> >> > > of GPIO_GENERIC calling bgpio_init() in probe().
> >> >> >
> >> >> > Thank you for the suggestion. However, I am not sure that will work for
> >> >> > this SoC.
> >> >> >
> >> >> > The GPIO registers are described in section 12 of JH7100 datasheet [1]
> >> >> > and I don't think they fit the expectation of gpio-mmio.c because there
> >> >> > is a seperate register for each GPIO line for output data value and
> >> >> > output enable.
> >> >> >
> >> >> > There are 64 output data config registers which are 4 bytes wide. There
> >> >> > are 64 output enable config registers which are 4 bytes wide too. Output
> >> >> > data and output enable registers for a given GPIO pad are contiguous.
> >> >> > GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
> >> >> > is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
> >> >> > effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
> >> >> > Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
> >> >> >
> >> >> > However, GPIO input data does use just one bit for each line. GPIODIN_0
> >> >> > at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].
> >>
> >> Mh, I'm not sure I'm understanding the datasheet/registers. _DOUT_CFG
> >> and _DOEN_CFG seem to specify the pad where this GPIO is mapped to.
> >> Shouldn't this be some kind of pinctrl then? Apparently you can map
> >> any GPIO number to any output pad, no? Or at least to all pads
> >> which are described in Table 11-2. What happens if two different GPIOs
> >> are mapped to the same pad? Bit 31 in these _CFG seems to be an invert
> >> bit, but what does it invert?
> >>
> >> Similar, the input GPIOs are connected to an output pad by all the
> >> GPI_*_CFG registers.
> >>
> >> To me it seems, that there two multiplexers for each GPIO, where
> >> you can connect any GPIOn to any input pad and output pad. Sound
> >> like a huge overkill. I must be missing something here.
> >>
> >> But what puzzles me the most, where do I set the actual GPIO output
> >> value?
> >
> > Yeah, it's a little confusing. The DOUT registers choose between a
> > number of
> > signals from various peripherals to control the output value of the
> > pin. Similarly
> > the DOEN registers chose between a number of signals to control the
> > output
> > enable of the pin. However, two of those signals are special in that
> > they are
> > constant 0 or constant 1. This is how you control the output value and
> > output
> > enable from software like a regular GPIO.
> >
> > You're completely right though. This ought to be managed by a proper
> > pinctrl
> > driver, and I'm working on one here:
> > https://github.com/esmil/linux/commits/beaglev-pinctrl
>
> Ahh, I see. So for the non-gpio function you have to set a value other
> than 0 or 1, correct?
>
> And as an implementation detail you have to set the corresponding OE
> pin if the non-gpio function will need a tristate pin (or whatever).
>
> So, the _DOUT_CFG will actually be shared between the pinctrl and the
> gpio driver, right? (I haven't done anything with pinctrl, so this might
> be a stupid question).

No, not a stupid question. You've got that exactly right.

/Emil
