Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5212D5840
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 11:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgLJKaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 05:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732060AbgLJKaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 05:30:02 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E668DC061793
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 02:29:20 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id d14so3579173qkc.13
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0knabE4pLiyMjkoiksYG/IB8kMycYTPeC8EyBeBTFk=;
        b=miRhMRcVYRU8W2s9H83rcF+aFhaacPuIK1msFRh8h6eJwvU0WCRwa9ZzdaBW9vYaSM
         5XrEfOOQ5WKR+Vi4i3eQCuBJOhhTI4d+IymcP5l/zOl4TfKm6+/MK8E1yiXqqFv+VhNz
         gc7Zw1UEvharuOq3E/DRhmUxt30EVJiLe85UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0knabE4pLiyMjkoiksYG/IB8kMycYTPeC8EyBeBTFk=;
        b=sjq/RL6GmVRhrA6wt7z0khEQUg8kPfRQTY/gephhv8alXNYKDtN0aibDJD4yfvyWU6
         CabaI5cH759fLKSDvQX/YXvHbPt05xFBg7rjqFpEo/2KgxCl8T6B/8/B4BgqiFe39tP5
         CCGuNTpENfGovwcEn+OeqVLJ5OOBQw2iSOPRk6V+TFI3ps2NrZpVI06dW4kkmc+WFRE9
         r8PgltfdntgRNZ5xJLjB8H66PX9/Bxbk7QfcrHeXwsbhIvli02qPmHE26V1lj6Y+zkx5
         8uGvw3dJgtlWQeVmW09l8ZAsgZ3Jtrfkyc5IrS4BbVNyJyZpEbvUZKD86Z9AojOreXmw
         Gxbg==
X-Gm-Message-State: AOAM531llKFgbIsOpbp9URFOoTsF2QSWn5vTgh15i1FHIJ7+lHmXtdsy
        hUBuZJMqEfLTSKAz+/kMYY7cJg6sNKWl0S1Sex/UdeFJAuo=
X-Google-Smtp-Source: ABdhPJwOZUi2Sl1Yd/f5v6x5SU7/RnsNHC6u16neZmVHJ04GokosGXeljSbqswV/Mein4PrK5Or0sFRoiVO0l3ifl/U=
X-Received: by 2002:a37:8681:: with SMTP id i123mr7867752qkd.54.1607596159936;
 Thu, 10 Dec 2020 02:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 10 Dec 2020 19:29:09 +0900
Message-ID: <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

On Thu, 10 Dec 2020 at 06:58, Arnd Bergmann <arnd@kernel.org> wrote:
> These seem to just be contiguous ranges, so I probably would have
> suggested describing them as separate gpio controllers to avoid
> all the complexity with the names. As Linus already merged the
> driver into the gpio tree, I won't complain too much about it.
>
> Maybe you can do that for the other chips though and have one
> implementation that works for all others, leaving only the msc313
> as the one with the extra complexity.

I'll have a think about that. The other chips I'm aiming to support
(the mercury5 ssc8336 and infinity2m ssd202) currently reuse most of
the msc313 bits with a few extras for the differences.
i.e. the ssc8336 reuses most of the tables for the msc313 with some
additions. Adding new chips hasn't been too bad so far.

> > +#define MSC313_GPIO_CHIPDATA(_chip) \
> > static const struct msc313_gpio_data _chip##_data = { \
> > +       .names = _chip##_names, \
> > +       .offsets = _chip##_offsets, \
> > +       .num = ARRAY_SIZE(_chip##_offsets), \
> > +}
>
> > +#ifdef CONFIG_MACH_INFINITY
> > +static const char * const msc313_names[] = {
> > +       FUART_NAMES,
> > +       SR_NAMES,
>
> I would try to avoid the #ifdefs and the macros here, don't overthink
> it. The macro really hurts readability with the ## concatenation
> making it impossible to grep for where things are defined, and
> the #ifdef means you get worse compile test coverage compared
> to an if(IS_ENABLED()) check in the place where the identifiers
> are actually used.

Ok. I was really just trying to enforce some sort of pattern there so
that each chip that gets added follows the same convention.

> Even better would be to completely avoid the lookup tables here,
> and have one driver that is instantiated based on settings from
> the DT.

I did think about this and I did this with the clk mux driver I
haven't pushed yet. In that case there is a random lump of registers
with some muxes mixed into it so I decided to make the lump a syscon
and then have a node for each clk mux in the lump and some properties
for the muxes within. The driver is certainly less complex but the
device tree is pretty unmanageable as there are probably 30 or more
muxes.

> > +static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> > +{
> > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > +
> > +       if (value)
> > +               gpioreg |= MSC313_GPIO_OUT;
> > +       else
> > +               gpioreg &= ~MSC313_GPIO_OUT;
> > +
> > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> > +}
>
> It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> reason why you have to do it, and if you do, explain it in a comment what
> the reason is.

The reason is that readb()/writeb() will invoke the heavy memory
barrier even though it's not needed for peripheral registers.
I guess it doesn't actually make all that much difference in reality.

> > +static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
> > +{
> > +       struct msc313_gpio *gpio = gpiochip_get_data(chip);
> > +       u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> > +
> > +       gpioreg &= ~MSC313_GPIO_OEN;
> > +       if (value)
> > +               gpioreg |= MSC313_GPIO_OUT;
> > +       else
> > +               gpioreg &= ~MSC313_GPIO_OUT;
> > +       writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
>
> These look like they also need a spinlock to avoid races between concurrent
> read-modify-write cycles on the same register.

Noted. I'll fix this and the readb and send a patch at some point.

> > +builtin_platform_driver(msc313_gpio_driver);
>
> There is a trend to make all drivers optionally loadable modules these days.
> Is there a reason this has to be built-in?

This was discussed and I think Linus said it was ok.

Thanks,

Daniel
