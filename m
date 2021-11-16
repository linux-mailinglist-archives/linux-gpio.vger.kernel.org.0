Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B316453741
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhKPQYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhKPQYt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:24:49 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EF2C061570;
        Tue, 16 Nov 2021 08:21:51 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id m20so44526081edc.5;
        Tue, 16 Nov 2021 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HbjQZ9qC9PVy9xyUznsD044YzcKQcNeflsU41tNyEx8=;
        b=adkmREf//AVW+01II7pYaKJQurnlV6epCtfgqSPf+f1uy25bpjBD2NWbKHm3knPCwp
         j8CtrEIWA4SLI+qqiMVjVUDm540HNAH/R+k1Zz0v3oaZHJSNQnaRCV2M8rbvjylWrA0A
         kTwCkiw+0NBNj2Hd8VJeZKxcYGOj1dWUDiMX9CBIPz+uzLfgU5V8irwwaG5vye/XKwPf
         sohcc1AM9dL+M1WVOIsDGJc02GaGUTdVcP/0utjf7ZajIXP1je2BpPUejZB33SyfWY69
         ggFROuynTLfWDShw2WNe5hxcse81BsM2jWrlwpxlKmlOhUuCetL5kbe6ZJ0d2OlFr6Er
         e7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HbjQZ9qC9PVy9xyUznsD044YzcKQcNeflsU41tNyEx8=;
        b=XWgsgQfFP1Jvyhmut96mxzPKu0joJLNcA+FgiN1xVFCY++b8gR2OOBksj1bwJgtN+R
         p0pu+enF0nTkC5YYQvCbxHHuYeEA+I+HYrm4TIxQMwEGmgeWRd82FkmS668rZFgB0EQ3
         V2pBMlrH0iGqCqZx53AH7y8HICRhbBjYmAtd4TspgyyJW6uVAyTfnW4Yks90cOxvtNoA
         u1h3zcynBeQPuoMYqsAOOgUvz3e0YJ94q0tU6iSS4eFOnS3DIC73r15T8vSWjcATBaMy
         I7Z6aLe5s1YeLjNacNjjSrg9VNE8oobVurgo+t4VykvDDslPVFLHkyqIPz+H4IHkSo5u
         2d6w==
X-Gm-Message-State: AOAM5302xsseKMNr6sO4oNn8itiADKXfNu2vU9ca/2mnp2vJM+rNjCJw
        /zIU6pCmg4CQnBXx3N3dBV8IRhTqDB8eilLQM04=
X-Google-Smtp-Source: ABdhPJw0xUYhZeCDQ1K16VL4b8hQ89kn7JVjj324pCSD8CvqzYdih+ZW2BrxBBJPvwrJJPKEZ/nnOEWAzmDejrK4XYI=
X-Received: by 2002:a05:6402:84b:: with SMTP id b11mr11743912edz.107.1637079710222;
 Tue, 16 Nov 2021 08:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <20211116150119.2171-10-kernel@esmil.dk>
 <CAHp75VcUziRv4_U9aDfKu2SKnqj1dab7y+N90tw0JaEKxWW_wQ@mail.gmail.com> <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com>
In-Reply-To: <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Nov 2021 18:21:09 +0200
Message-ID: <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100
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
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 6:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 16 Nov 2021 at 17:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 16, 2021 at 5:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +#if BITS_PER_LONG == 64
> > > +#define jh7100_reset_read      readq
> > > +#define jh7100_reset_write     writeq
> > > +#else
> > > +#define jh7100_reset_read      readl
> > > +#define jh7100_reset_write     writel
> > > +#endif
> >
> > No need, just use always readq() / writeq() and include io-64-nonatomic-lo-hi
>
> Hmm.. how would that work on a 32bit architecture where sizeof(long)
> == 4? The whole point of this is to read chunks in sizes matching the
> words in the bitmap later on.

Why not? You just put some amendments, see below an example.

...

> > > +       void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(long);
> > > +       void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
> > > +       unsigned long value;

      void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + off64;
      void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + off64;
      u64 value;

> > > +       value = jh7100_reset_read(reg_assert);
> > > +       if (assert)
> > > +               value |= mask;
> > > +       else
> > > +               value &= ~mask;
> > > +       jh7100_reset_write(value, reg_assert);

value = readq(...);
...update...
writeq(value, ...);

> > > +       /* if the associated clock is gated, deasserting might otherwise hang forever */
> > > +       ret = readx_poll_timeout_atomic(jh7100_reset_read, reg_status, value,
> > > +                                       (value & mask) == done, 0, 1000);

readq_poll_timeout_atomic()

Maybe at the end of the day simple use of u64 will be better than bitmap.
Up to you, you have got the idea. Either way you may put my tag.

-- 
With Best Regards,
Andy Shevchenko
