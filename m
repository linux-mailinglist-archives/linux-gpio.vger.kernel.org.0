Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577BF4222DD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbhJEJ6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:58:12 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:36572 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbhJEJ6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:58:10 -0400
Received: by mail-ua1-f41.google.com with SMTP id u11so14412044uaw.3;
        Tue, 05 Oct 2021 02:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7f7La1K3j/sf3y6WAPsiJ3HiHMfo9c5sHomKDoZBG7U=;
        b=k2IKov7jB0n+UA2Ba6xXi/dtkzWMyvN8/oXdRDjW/TVGcXQs5GyrZCahRsU9ZUzoSk
         qXfb3TdiyKbNjQI2i2tlB32LSBrDG2mHcucnAAPxaZatqc0lz4ujs+g4Boz1/yOTQltl
         VVYAXO9LhU2an/YvvnzO9e59P8m8QfNu6UJOD76u5w0lmLnUzjW6Zg+pAh97G1d0YN4b
         yIcWwqrIlfIfLGbzPUvgTgzWXD8Ec7A6n5UMWjYOtUJKQjvvxirZS1f+AGXdSYOYo4VV
         nDZzSMEPh8sRK2DfZcqwoVFSha3/emEyeiwO/zPUntHjwzyKiYFO65GDv0Jw4gJHv3Fk
         SCPA==
X-Gm-Message-State: AOAM531c3rkWFNKd9MWvG9S5We1t54akg894yzQ4balVf22SemmRUco6
        9ZKSs6prEmfXhMyF7ZWVwYcmrOJvVbbl4aU24fc=
X-Google-Smtp-Source: ABdhPJwoedqIMTs/zp1tZCy9OstAKU8ntmrhQvtFdRYOoHyHH+E8MpEzp9P57PSyaiMXuRqdCgIgcecFKpCx4qab0jY=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr10862299ual.122.1633427779260;
 Tue, 05 Oct 2021 02:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210921193028.13099-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdaJk-G0YE63uvH9C=G3n7k2gZqf9QrwGfAZC2O4hhps=A@mail.gmail.com>
In-Reply-To: <CACRpkdaJk-G0YE63uvH9C=G3n7k2gZqf9QrwGfAZC2O4hhps=A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 11:56:07 +0200
Message-ID: <CAMuHMdUvThtOKrhTqW+U1qijW7dRc6GYg4_Owt_GnUxX4DrGog@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] pinctrl: renesas: pinctrl-rzg2l: Add IRQ
 domain to handle GPIO interrupt
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Sep 23, 2021 at 11:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Sep 21, 2021 at 9:30 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add IRQ domian to RZ/G2L pinctrl driver to handle GPIO interrupt.
> >
> > GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> > used as IRQ lines at given time. Selection of pins as IRQ lines
> > is handled by IA55 (which is the IRQC block) which sits in between the
> > GPIO and GIC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Why can't you just use the hierarchical IRQ domain handling inside
> gpiolib?

Out of interest (not related to this patch), does this support multiple
parent domains?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
