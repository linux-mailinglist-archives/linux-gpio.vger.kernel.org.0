Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CFB44E86D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbhKLOUv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbhKLOUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:20:51 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF095C061766;
        Fri, 12 Nov 2021 06:18:00 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id y3so24063170ybf.2;
        Fri, 12 Nov 2021 06:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8GW8Ktwdvz3yOVsUiwE1qEeSmqgP7liHkg9/rj0kpmg=;
        b=YljvRFEWNYsZBhp4XWpLm9WojDm+QblDf+TsfWcNb7zE6zGpVSqylrYt7R+tP5crWy
         IsEC5PnPyrnWeoHbSpjygv84V80qw4JhYiQ82SLu10FDFbPcTLdnhZv165j3Atiidbhx
         FCxCnOzYhgpNPg+W/Fa0Oa4KAXqm+6aihkrHcUx4/puxcb/ukt6OetRs+wMiNuJSNl0K
         ywjqvlsb7OAMQW6C/YhJUKSyA1hKcuqezV82orV2T9B51fzXWH2DLdelD5tOJ3cAqaVR
         8eNoEr3L5i1ll6mBsWGv6N3oYdgEcA/swg7K/DmoItBAWdRpmQ+FH40HSWzCTDAHr4o9
         +YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8GW8Ktwdvz3yOVsUiwE1qEeSmqgP7liHkg9/rj0kpmg=;
        b=j4UrTCLWPM4+PfKirvL91np4+is89QVKEGQXckMigOPEUZE9bi3gn183AgIqQLePdA
         BapXo7xuF4MhOUjlAAhE4Bah4V3i2KvzdASqLrj70NiYX8rvyWAJts+WR7pFDHWgL3mU
         eqBvqX07+fbjxJ5qL6q0aRzo4EP1JQNRIQA4JGAtboYVgqx292gMWHA50AsEM8FjZaEr
         5IjtA3jEoXOmswKvAY/plr0+ShImq1r7kYIx/xuo0DBgnhVlu3OVK5Hqh5/u/GQf+3T3
         WA2NshPusGLYQaa9weD7EgZdAOMhH4UWCXqe5lAWGBgx83stbZlE1Opjw9XhtpFaBmEw
         zN4g==
X-Gm-Message-State: AOAM533EHvtcBl5MivwQlSmV4Wrs++8RkJ5worYXqsrOh6/NiT5LDf89
        wUCjtPVSLEcoDwoEGQJFwDeKpHYH6nRaAUpVWmE=
X-Google-Smtp-Source: ABdhPJy8zWIEN6Xk5IvLbBpN7EDSIpRpKemxsQnUf6/ud1TWix6coMoFlaXbmk5G55NxGjOzsu6pimxsP6zLHJbjsx8=
X-Received: by 2002:a25:c792:: with SMTP id w140mr16519436ybe.131.1636726680056;
 Fri, 12 Nov 2021 06:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVw=bDj=Uq+wXzBb_HhG4viHZC0A0znv15htvwwS15oEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVw=bDj=Uq+wXzBb_HhG4viHZC0A0znv15htvwwS15oEQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 12 Nov 2021 14:17:34 +0000
Message-ID: <CA+V-a8t2_m7S38_ZF5tu_EfZ1A-oTBeXwmPXARAYF4N9JQ7PhQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RZ/G2L: pinctrl: Support to get/set drive-strength
 and output-impedance-ohms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, Nov 12, 2021 at 2:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 10, 2021 at 11:46 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch series add support to get/set drive-strength and
> > output-impedance for RZ/G2L SoC. Along with some macro renames
> > and code cleanup.
> >
> > Cheers,
> > Prabhakar
> >
> > Changes for v3:
> > * Fixed review comments pointed by Geert.
> >
> > Changes for v2:
> > * Fixed review comments pointed by Geert, split up patch 4 from series [1]
> >
> > Note: This patch series is dependent on first two patches of series [1]
> >
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
> > 20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Thank you, will queue in renesas-pinctrl-for-v5.17 with the dependencies.
>
Thank you for the review and acceptance.

Cheers,
Prabhakar


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
