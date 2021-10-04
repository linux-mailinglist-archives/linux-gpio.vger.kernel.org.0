Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011E94214F8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 19:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhJDRQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 13:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238197AbhJDRQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 13:16:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DF6C061745
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 10:14:29 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id bm13so17388468edb.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 10:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=41gb7RTmm5R83BjDq5NI1aGdQX7f8HnAOeNpQ9vC3Q8=;
        b=gFrqVsxd+2gUq0Ax770u8Y6jU6/QdutB2sCugHckshOJ8crYDGw3MXLEb3Yk4ln94X
         TOtg0/uvf84UbDm/QlCFDvTyaGNhRAuE1ETQJTd8ITOFDvi80FRqdwMnj4e3lfpQrJ6J
         WuShu1/x42K5QmVtXsA9xkNoUfhJ0/SWN5vimOcbv9pt1Pw+9cegglnkc5+n4pnhWTx2
         NQp6FDO622n52v6YVBl/fLldGBBh1ubJRBj1ONQ7Pid7Woqab/1NkqR4hnj/XfFoSU4B
         ZvHFt3Ka1WtloRZPvshyA41gbQ7GGHd0aMWs69oOaGHIGYPLflMRDhraxBg8NNmE0HFk
         YwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=41gb7RTmm5R83BjDq5NI1aGdQX7f8HnAOeNpQ9vC3Q8=;
        b=oxYzBrvn1j/8jBuE3lBNYyUZdekBGqpjbax01abQlF7o/fI5DKrW5dM1DNnP/du/sX
         CqBQ3QINWOP2c/dhe533X4tXi2ZBxs1/+95ftXma1P6WpJ1DOR7mO0zDr9pXIwSlSNIA
         MnlCjx2dxebPFLYP2rUlGGsZObCF5hISglj9CsG6UGPgLSQZK4Ud41sE00enTzkAOFa3
         RbBlr4H7puEVBD5wy1Y172s4u1TYUM/NBxNZbb3LDy4d829U5TIcrADVIh2V9JezM03r
         FoVTGx1Jcpyytmdg4hVqCuHHFUOkoLizPoICpbW64mYWSfsV97qAsOxzNXIFQ9xZKA8S
         5V/A==
X-Gm-Message-State: AOAM532WwNJFUIWOzrXpA6UAUDdqf0nyIXTtw/NNSfhRZSSvZMmMhVVg
        qx+ngFv5Djfmnrt5c6dIv7PgwplXpWvmpL9sfqs8+A==
X-Google-Smtp-Source: ABdhPJxcQMwT6iICRwvvUdQpAva10BFNtgrS8TgkPsNJwL8K15HAcUGaaB0EAcJiLunRtR0hVfLYakwKjozWIC9mVkI=
X-Received: by 2002:a17:906:3f83:: with SMTP id b3mr19117219ejj.233.1633367664575;
 Mon, 04 Oct 2021 10:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210304034141.7062-1-brad@pensando.io> <20210304034141.7062-2-brad@pensando.io>
 <CAHp75VcG9KajNpDbewDq7QzotB6t7MfwiGk15FaobX+cmMVSzg@mail.gmail.com>
 <CAK9rFnwrA=W2Vk5yFwG4N_WS=eBXXnhtexA+tqgAYb6xOAO4oQ@mail.gmail.com>
 <CAHp75VdfrJ3JV_gL3xCLHOiw6Tj-5Ep7z5JKWUFKFbUt8gobcw@mail.gmail.com>
 <CAK9rFnx--z_pr_yR6CqGsH04ddwUtx4rxc7MxNNmy7ZSF86+Mg@mail.gmail.com>
 <CAMuHMdUz4vUQzXBHA9AiT3w6L20yBpgd0emVZJb=v_qw70qiJQ@mail.gmail.com>
 <CAK9rFnw-j8whcsK-NQ4w4+sCdrumCk7Bb=J+KfsF9ZO2Tf5r5g@mail.gmail.com> <CAMuHMdW0s=x+DBZffeuEcyifDRfy8YM3c_wEAZscO7twR2wj3Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW0s=x+DBZffeuEcyifDRfy8YM3c_wEAZscO7twR2wj3Q@mail.gmail.com>
From:   Brad Larson <brad@pensando.io>
Date:   Mon, 4 Oct 2021 10:14:13 -0700
Message-ID: <CAK9rFnwCry1G7RqdWL9W1vq6Q3RV9tRxmDD6UErY=hQB6W-=_Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpio: Add Elba SoC gpio driver for spi cs control
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 23, 2021 at 1:11 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Brad,
>
> On Mon, Aug 23, 2021 at 6:31 PM Brad Larson <brad@pensando.io> wrote:
> > On Mon, Aug 23, 2021 at 12:50 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Aug 23, 2021 at 3:14 AM Brad Larson <brad@pensando.io> wrote:
> > > > On Mon, Mar 29, 2021 at 3:40 AM Andy Shevchenko
> > [...]
> > > > Regarding the above module question and Kconfig definition, since I
> > > > first looked at this and reviewed the comments I realized I should be
> > > > using builtin.  The file gpio/Kconfig is currently this
> > > >
> > > > config GPIO_ELBA_SPICS
> > > >         def_bool y
> > > >         depends on ARCH_PENSANDO_ELBA_SOC || COMPILE_TEST
> > >
> > > That means the driver will default to yes by merely enabling
> > > COMPILE_TEST, which is a no-go.
> > >
> > >     config GPIO_ELBA_SPICS
> > >             bool "one-line summary"
> > >             depends on ARCH_PENSANDO_ELBA_SOC || COMPILE_TEST
> > >             default y if ARCH_PENSANDO_ELBA_SOC
> >
> > Thanks Geert, changed to this
> >
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -241,8 +241,9 @@ config GPIO_EIC_SPRD
> >           Say yes here to support Spreadtrum EIC device.
> >
> >  config GPIO_ELBA_SPICS
> > +       bool "Pensando Elba SoC SPI Chip Select as GPIO support"
> > +       depends on ARCH_PENSANDO_ELBA_SOC
> >         def_bool y
> > -       depends on ARCH_PENSANDO_ELBA_SOC || COMPILE_TEST
>
> So we're losing the COMPILE_TEST ability again?
>

Hi Geert,

The gpio-elba-spics.c driver is being deleted with the spi chip-select
control integrated into spi-dw-mmio.c.  The GPIO_ELBA_SPICS config
option goes away and fixes my breakage of COMPILE_TEST.

Best,
Brad
