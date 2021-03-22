Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BB134456C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 14:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhCVNSn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 09:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbhCVNQz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 09:16:55 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ADAC061762;
        Mon, 22 Mar 2021 06:16:54 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id g1so6551710plg.7;
        Mon, 22 Mar 2021 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K57hes70Y9glf2q1uih1lFr//oeCaWquhrG1a8vl7tI=;
        b=mLWf2rrM1KV5IhBtwlUucUCUuYornZ/N+fY1RoIERa/PpHBE57T/K3VvYiWDiRgnus
         A51FzDkevuiQANz0BSteAH+2lJ8pbisqzMDtPSEUXlOfeaCPr3RuQ3kumFhrAAISof7/
         iwqmWnDrnM4hsLxzW8yZrRQBnF4DM8KG9b7F9KYW4NCxxt6Waywed5V45Yeq0Bhg/9bi
         PPPREBF2sQOqz31zHDMgDQ4i2o4O+WS5dtbaI8GrxF4dVdY9JljFOZBW1ZQSSWh88E/e
         G+wyb9PsQr7BGnflhew/BDVglX15SjJhOM4HXk+bQAbaaOYy1efTkNCZpik4teJq/oqj
         JxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K57hes70Y9glf2q1uih1lFr//oeCaWquhrG1a8vl7tI=;
        b=cpYKQpBgnQGrctUyH77zo/tavQKFi+1ZK/2aAG/49mMdfq74qQluTjSCD0HgKryvpV
         hv64JO0kkyc2fNXZ2UXfdFt0olzUQl8Uo/XxmhQisaHT66UlYV+iM1w5NDhy1OfttHeH
         Y0+8lzXaH8TMujdLT3WRL0jxEt31+LnkvWL01iFm4hlpxYTe6EQOls11FQZz4fQ4yzkX
         AF9ECW4We34V1ZyB3WAftwLxyaran9QKNWL9xJmy+lfQ43jgxyHKhvxYjTEe+vavAn4B
         cw0sAzvRhWz4uYRx/9up9pnmrZH4/+C0ZQw89bPSzbHs7cLAqe6bpeKobqhX67ENy3s+
         GiOg==
X-Gm-Message-State: AOAM531wQ4iaypj4yFjp8/ml6NVwetip+5Dy84mjnIBpZzjuvkxIKdBG
        CZaWb22uo/Wdy4MV6uK4ewlCFcQ8FLzM29zAIRs=
X-Google-Smtp-Source: ABdhPJyAaZ/6vVR0qPPoyWiz0yovB0VUvK5knKjOMHb4y4dSFPQXoGgB/EjSzR2pwMmCQpM9xXZ0EExloxsRHGNVW6s=
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id
 u8-20020a170902c808b02900e64204f62fmr27505252plx.0.1616419014403; Mon, 22 Mar
 2021 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210315082339.9787-1-sander@svanheule.net> <20210315190806.66762-1-sander@svanheule.net>
 <20210315190806.66762-3-sander@svanheule.net> <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
 <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
 <CAHp75VdrqE0kBwzK9Jk7pZGjyfFnhatfa8UY0z-3T1w1PrbAbw@mail.gmail.com>
 <9d736f272aae42b154a4fdfbcadc1572ee82f516.camel@svanheule.net>
 <CAHp75Vf=-WdJ3U6o1G-Xi4W7tkCzyij0FD3MNY1q0x6bkimxow@mail.gmail.com> <e89125c1ffb56f64c7c2037192e490d56ab12492.camel@svanheule.net>
In-Reply-To: <e89125c1ffb56f64c7c2037192e490d56ab12492.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Mar 2021 15:16:38 +0200
Message-ID: <CAHp75VdPro54q9_hhdi8m+GkwYDqyvsUthBGjksk2LTkHeYJgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 11:48 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Fri, 2021-03-19 at 23:24 +0200, Andy Shevchenko wrote:
> > On Fri, Mar 19, 2021 at 11:20 PM Sander Vanheule <
> > sander@svanheule.net> wrote:
> > > On Fri, 2021-03-19 at 19:57 +0200, Andy Shevchenko wrote:

...

> > > The point I was trying to make, is that it isn't an endianess issue.
> > > I
> > > shouldn't have used a register with single byte values to try to
> > > illustrate that.
> > >
> > > Consider instead the interrupt masking registers. To write the IMR
> > > bits
> > > for port A (GPIO 0-7), a 16-bit value must be written. This value
> > > (e.g.
> > > u16 port_a_imr) is always BE, independent of the packing order of the
> > > ports in the registers:
> > >
> > >    // On RTL8380: port A is in the upper word
> > >    writew(port_a_imr, base + OFFSET_IMR_AB);
> > >
> > >    // On RTL9300: port A is in the lower word
> > >    writew(port_a_imr, base + OFFSET_IMR_AB + 2);
> > >
> > > I want the low GPIO lines to be in the lower half-word, so I can
> > > manipulate GPIO lines 0-15 with simple mask and shift operations.
> > >
> > > It just so happens, that all registers needed by bgpio_init contain
> > > single-byte values. With BGPIO_BIG_ENDIAN_BYTE_ORDER  the port order
> > > is
> > > reversed as required, but it's a bit of a misnomer here.
> >
> > How many registers (per GPIO / port) do you have?
> > Can you list them and show endianess of the data for each of them and
> > for old and new hardware (something like a 3 column table)?
>
> Each GPIO bank, with 32 GPIO lines, consists of four 8-line ports.
> There are seven registers per port, but only five are used:
>
>        |        | Data    | RTL8380    | RTL9300
> Reg    | Offset | type    | byte order | byte order
> -------+--------+---------+------------+-----------
> DIR    | 0x08   | 4 * u8  | A-B-C-D    | D-C-B-A
> DATA   | 0x0C   | 4 * u8  | A-B-C-D    | D-C-B-A
> ISR    | 0x10   | 4 * u8  | A-B-C-D    | D-C-B-A
> IMR_AB | 0x14   | 2 * u16 | A-A-B-B    | B-B-A-A
> IMR_CD | 0x18   | 2 * u16 | C-C-D-D    | D-D-C-C
>
> The unused other registers are all 4*u8.

You mean that they are following the same rules as DIR/DATA/ISR. right?

> A-B-C-D means:  (A << 24) | (B << 16) | (C << 8) | D
> A-A-B-B means:  (A << 16) | B

If the above is true for unused registers, it's clearly hardware endianness.

You need special treatment for IMR, but in general it follows the
logic behind the others.

So, you need some kind of I/O accessors like
 read_u8_reg()
 write_u8_reg()
 read_u16_reg()
 write_u16_reg()

And depending on endianess of hardware to call proper set of them.

-- 
With Best Regards,
Andy Shevchenko
