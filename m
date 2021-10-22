Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F15437820
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJVNlb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhJVNl3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:41:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D01C061764;
        Fri, 22 Oct 2021 06:39:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id d3so1758787edp.3;
        Fri, 22 Oct 2021 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjH1AZkHzisZEzNDajZXWL4sIkWjjuq3q0O7XBT8vcY=;
        b=dSvMQAZry0z5cEHt2WuRSPjcgGK+3Gp+e1imsJ9W9jh0QUfeKNpp3oE3jthG+9ITG/
         IZDd/O+iU4Kl+/BYsKzWOMkm6FZo3vLXOWjJzI13PE6sEQGI/1t3oyR55iGB1y1s5T/i
         kJsgfkb7+5Eet/XIbMefWNtmKC82xC4P7F5X6WSK7KE1g6tZf/sA65Yl6+q2eZsNv2G2
         71Hz+8sba+4c+fe1pxBHHMbQIC7HaDv7vuipzeuisgPvxuqXA+wXuv48D0eFsV21SQ9N
         FX1jeSEu/wt28mVP8alksjDR/FIRiQu+eAJJhLgCeW1XSHBU3830aC8eeatj1pKrIgaQ
         KrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjH1AZkHzisZEzNDajZXWL4sIkWjjuq3q0O7XBT8vcY=;
        b=ZXlwXaR4j6+hvxVgpfFXwDZFmhw9ikXBWWrYnU/KaRv+2c7RqiWCBp7g1ri9Nr0iiL
         MnuEQvTM3+UHuTZ8LsKBZutfdjVCyzcMp/yt+GBOILHFZhI8Y7DZ1EBBGViLLvDBnPVF
         uHLSvUL/j2mpjCRjGWUUmSX6ZLAAheBmbBc5lUsb1a0FJpEif7avzI/OpXcNUxRUF2uk
         LBip6JWOstLXmz3Vhs4s53nOL/HQ7S+idP3okQuH6joO3LA/HXQxYcQdYez6cSCKq79L
         Zgk+PJhEKfSRlU3wxWg7Cp3hkOwo5tW7pdDypZMBBgAMWzBxUmhV99GV3jHMQE3Zhinq
         7rKQ==
X-Gm-Message-State: AOAM530dW4fkFft9dJT6CI4S2VN5ghDffM6levFvFnR9n88vfPcW2xak
        +RiqjfP8RrK2bxz6zha/akw1seRYx0FRcuZAqio=
X-Google-Smtp-Source: ABdhPJxH5Qrtm/RWOE5LyJWihUvlgo6g/2IV76oa7WETtiadA6OP/8uW7eZKfFIregk0grROWeVw/hpM6ldeQgVrdNs=
X-Received: by 2002:a17:906:eb86:: with SMTP id mh6mr15592741ejb.141.1634909949961;
 Fri, 22 Oct 2021 06:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com> <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
In-Reply-To: <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 16:38:14 +0300
Message-ID: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > Why all these ugly % 32 against constants?
>
> Because the JH7100_RST_ values goes higher than 31. There is a
> BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> machine.

And? It's exactly what you have to use!

...

> > Can you convert this to simple
> >
> >   if (assert)
> >     ret = readl_...
> >   else
> >     ret = readl_...
> >
> > below?
>
> I don't see how that would work. We're using the done value in in the
> readl_poll_timeout. Maybe you can be a bit more explicit.

Supply done either == mask or == ^mask. Try it.

-- 
With Best Regards,
Andy Shevchenko
