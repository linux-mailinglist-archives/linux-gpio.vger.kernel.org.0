Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA652D5B8D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389188AbgLJNXm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:23:42 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34998 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389111AbgLJNXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:23:35 -0500
Received: by mail-oi1-f194.google.com with SMTP id s2so5689300oij.2;
        Thu, 10 Dec 2020 05:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YrrmDGBtPB40xWq8Xs0g2ZWc20nUchgMGGf+8yx/xg=;
        b=RLhCONemDWXyMbPS7k4YD5J0H51u4xG1EKKxcHvE/WtCk8V/hjaTClOV9Eyo3tTi81
         +1zgq0L0otTaGK9kbuEccGFj/kg03gr7+m96ERNisQS/sNT43we8NjUXIF0PHomPKjOB
         dZzFhutLrvZytMoeViVp8S7Gz44a6TmKP5jx6pkE+pfHzd/Q331tnr1OokNohMSKIHgL
         QhcYYoJIPJdHici4HkDxULEnDyTvd5vAttiOARYljM9Go0qZrnXw0mUXFoC7iWFguTRR
         hCwpBHSv9C3RP5zVP0Whe1aVhhlUtbOv0bK8vqag1E0OlHw5kRRgQSep8FWY48rii0Ef
         cYUw==
X-Gm-Message-State: AOAM53070pAQc1sk16nM3qtkiNoCBKKnRAk5Dj9ilnp5QPX7LavuQymg
        0yj2SsO1rSfQsCM5aKfiqtf1O7SqPZDgP8FF34w=
X-Google-Smtp-Source: ABdhPJyqGfuC/drmAWDcS+9KsCPX7gcqJAznxiSfiFBUXqkMzi0Y9Mgi8ZYjpvm4VhAa0RHtEVcG55I8rIitOVjYj3s=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr5296436oia.148.1607606574747;
 Thu, 10 Dec 2020 05:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
 <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com> <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
In-Reply-To: <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 14:22:43 +0100
Message-ID: <CAMuHMdVnR2E6+ANYuZLvsTW8Od4Sa=wDtjnio4h3z=W2ePPGGw@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Thu, Dec 10, 2020 at 1:36 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On Thu, 2020-12-10 at 11:04 +0100, Geert Uytterhoeven wrote:
> > On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> > > Changes from v6:
> > > * Annotate struct platform_driver variables with __refdata to avoid
> > >   section mismatch compilation errors
> >
> > Blindly following the advice from kernel test robot <lkp@intel.com> is
> > not always a good idea:
> >
> >     The variable k210_rst_driver references
> >     the function __init set_reset_devices()
> >     If the reference is valid then annotate the
> >     variable with or __refdata (see linux/init.h) or name the variable:
> >
> > If your driver's probe function is annotated with __init, you cannot
> > have a pointer to it in the driver structure, as any binding done after
> > the freeing of initmem will cause a crash.  Adding the __refdata merely
> > suppresses the warning, and won't avoid the crash.
>
> Hmm... I must be misunderstanding something here. free_initmem() is called from
> kernel_init() right before starting the user init process. That is late enough
> that all drivers are already probed and initialized. At least that is what I
> thought, especially considering that none of the k210 drivers can be modules
> and are all builtin. What am I missing here ?

For these specific cases, binding is indeed unlikely to happen after
free_initmem(). In the generic case that is not true.
However, you can still trigger it manually by unbinding and rebinding
the device manually through sysfs.

> So I think I will go with option 2. It is simpler and safer. We can always
> revisit and optimize later. I would prefer this series to land first :)

Right. Correctness first, performance later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
