Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEB92184C9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgGHKSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:18:09 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:46653 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgGHKSH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:18:07 -0400
Received: by mail-oo1-f67.google.com with SMTP id s190so5185012ooa.13;
        Wed, 08 Jul 2020 03:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DW+k++6QmShOYTPp1GCiBSfmYcnWVZRPXo5Q7LF3tA0=;
        b=jzEDVVqf+vpnTzAO8O7YEur1YefzHERctZFB8JV202/ZNQN21GincXfj+74EJH/UJx
         IikpsTgOreG0FP8qWm/Rr2vls5g+xya3IHCtdzkyKJTXPV/O+0YdEZcAqUNW7flgjpzE
         DKmJzJuFX2830mZStMkXyo9vcVXCuUZmMRhCQnBy40mKQ4lzIpdBnV4tBO3M/yYpVqGO
         Qlj3vMYCngCg3rPh3uuRc4joR/KtsjPn0sWcs8potwHSiDYsVtTI5xJsvW2iX/+p36fc
         pQt1f0C56AWlC+T+XE55FkTAKAT1+qNqGpCRHGZ+DG6CsFRNZ9+MMvxFHfjzwIHKdP7z
         pRpQ==
X-Gm-Message-State: AOAM530vR0kxczD2utPrjGcCQIGOVMOckWyF3vk17hOQLA6RNzOnG5nd
        yUfENjuhT6duuE3QMAsL0+6hbigUaiTMUGVb2I7cF/vQSxo=
X-Google-Smtp-Source: ABdhPJx+L6lRbWyeMJB6JvYEpS+n2WhASo6vd9a544uDAG1Ay2/5APPOJa/auzmeTbGCqjBXDSgeavriOmv1d4Ly1Ic=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr33382180oob.40.1594203486265;
 Wed, 08 Jul 2020 03:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 12:17:55 +0200
Message-ID: <CAMuHMdWPLi4OVyfSgcc50BZHsTuWQ=dbKyJsEfzN5bEeDe9tAQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] clk: renesas: Add r8a774e1 CPG Core Clock Definitions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add all RZ/G2H Clock Pulse Generator Core Clock Outputs, as listed in
> Table 11.2 ("List of Clocks [RZ/G2H]") of the RZ/G2H Hardware User's
> Manual.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas for v5.9, in a branch shared by driver
and DT (renesas-r8a774e1-dt-binding-defs).

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774e1-cpg-mssr.h

> +#define R8A774E1_CLK_CANFD             46

I guess it's fine we keep CANFD last, for consistency with other RZ/G2
SoCs (CANFD was not present in early revisions of the Hardware User's
Manual).

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
