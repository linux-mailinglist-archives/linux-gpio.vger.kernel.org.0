Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACDB35513B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 12:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbhDFKvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 06:51:47 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:39613 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245201AbhDFKvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 06:51:44 -0400
Received: by mail-vs1-f51.google.com with SMTP id d65so3426722vsd.6
        for <linux-gpio@vger.kernel.org>; Tue, 06 Apr 2021 03:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NlIK0KbSMJ/Zwyqist5Us8yORxLX1WL0K4PvIzKMJA=;
        b=j5MzzED2kPxsId/msH566rdqJilH8Tn1wK7M30jLYzKoe4tMSx5us24FPPd9A8Cd5u
         O+66iUPN3DXNFoAo1LkuEnDfPKAFkh3RrbzjCZ52ZV/OTEWxeVNvDvbIRhzVdB9LFW+t
         HajZlQMDbxxuXylIj2PPCnPDwqvi4i6mXP07k2fNUSTZ8v2rz/BeCKE+Q0pJYR1/ok1z
         ZcyLt5MSfnz1pHhtTaxQWoi0PDkSGZwd06L3uYDOCl7wl3bFTTyqrz+BTlbS2uYC9M9Q
         iM59DH8VXqDz9tBgE1BP/EISS15zXNbGWNXLgx7wx2Vx4vt1/8/Oz1ClJ+jaVDXkjndH
         pJ8A==
X-Gm-Message-State: AOAM5306LJRF0OB6J27BqBOPJ05gqL2wLtedhZIeuRVpL1H4NwdXWP6b
        qKikvBhPtAhipjxNSn4YE2D6EOFZzZtTtmxHrRJ/psxOVHY=
X-Google-Smtp-Source: ABdhPJxt0PI15+ht7weFVLNk7HB8frtk8dzVcrC7235QztdNnnPngN+/lrQtgWZjNkhk/5IP04HZdQudliRasht3nKs=
X-Received: by 2002:a05:6102:3010:: with SMTP id s16mr12680394vsa.3.1617706296937;
 Tue, 06 Apr 2021 03:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201117213351.249668-1-linus.walleij@linaro.org>
 <CAMuHMdUu2UpcbvNGuDfHAp+aFGkhMS4rJXLwiqQu6QFB+FytBw@mail.gmail.com> <87mtubpufr.wl-maz@kernel.org>
In-Reply-To: <87mtubpufr.wl-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 12:51:25 +0200
Message-ID: <CAMuHMdUUG9u1CEArGOCPNve-8uXm0Jyc+1NQyqEk560-h_N=Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] gpio: sifive: Set affinity callback to parent
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Wesley W . Terpstra" <wesley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

On Tue, Apr 6, 2021 at 12:40 PM Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 06 Apr 2021 11:20:57 +0100,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 17, 2020 at 10:37 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > This assigns the .irq_set_affinity to the parent callback.
> > > I assume the sifive GPIO can be used in systems with
> > > SMP.
> > >
> > > I used the pattern making the hirerarchy tolerant for missing
> > > parent as in Marc's earlier patches.
> > >
> > > Cc: Yash Shah <yash.shah@sifive.com>
> > > Cc: Wesley W. Terpstra <wesley@sifive.com>
> > > Suggested-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thanks for your patch!
> >
> > > ---
> > > ChangeLog RFT->v1:
> > > - Make the affinity setting call return -EINVAL if there
> > >   is no parent.
> >
> > Would it make sense to incorporate this check into
> > irq_chip_set_affinity_parent(), so drivers can just point
> > .irq_set_affinity to the latter, without having to provide (duplicate)
> > the same wrapper over and over?
>
> Calling one of the irq_chip_*_parent() functions assumes that there
> *is* a parent at all times, because you really need to know what
> context you are in by construction. There are a couple of exceptions
> to this rule (irqchip state, retriggering), but overall I'd like to
> stick to it and leave the checks on the implementations that have
> weird setups.
>
> I would assume that it is possible to know at the point where you map
> the interrupt whether it has a parent or not, and use a different
> irqchip. Is that doable in this case?

I think you're missing my point (or I'm missing yours ;-)

I don't mean to set up .irq_set_affinity = irq_chip_set_affinity_parent()
by default.

Right now, several drivers do this:

    static int foo_irq_set_affinity(struct irq_data *data,
                                       const struct cpumask *dest,
                                       bool force)
    {
           if (data->parent_data)
                   return irq_chip_set_affinity_parent(data, dest, force);

           return -EINVAL;
    }

    .irq_set_affinity = foo_irq_set_affinity,

If irq_chip_set_affinity_parent() would not blindly dereference
data->parent_data, there would be no need for the
foo_irq_set_affinity() wrappers.

Or are all those drivers using such a wrapper wrong?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
