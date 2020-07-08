Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340D4218398
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgGHJaA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:30:00 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38343 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgGHJ37 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:29:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id r8so37262775oij.5;
        Wed, 08 Jul 2020 02:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SI+vX2jEKXa1zfH1mtIEuripsdBwBGbCpZ5PANny8O8=;
        b=SBMSF73waHZNOhxpqv4bu0b+EHvi56e3BkmtsbtXWNKurvOgk0Tu2WEkfo/h33nny8
         00LyU97WxbmoZL155C6gBAkvZc06FyMLwRdR3I9c4gXG0Ugew5B6/sf2yXhiXLwj6+mS
         hirVf3AenI3OASZ++bVqZtw2XHnJkSVpGbP08DxQfdKt54he7HDXr9Yx3JG+pDC/Deef
         AVG8NyAon6kGBNw5STjjd1ip9dAD4ayna4ZMl8cJrwKC8ZNcvoTJQGFaH9hG73Pv8uHf
         wGQf4qIN5x8cxNx57D/F5O2V+rhOXyR398SIAvSHAsvEEO6lWfHDJ9jQLm3t9IKuxZ/c
         FwBw==
X-Gm-Message-State: AOAM532wIF7aiX36qp0UroFu2pPaHz0Q5uzfECCU/VNeMYZwnOXeoYbL
        JZv3+AHiqmwIX7dHNDZcJx6OoPenDwFBMkRQrqI=
X-Google-Smtp-Source: ABdhPJz4VXMTz3uA1VJ79hnUuUOe2PKu6BopJkevXqbHkHtkO5hynYd9urBlnN3HNyjsCAldWFO7yto3NsV1JWkgm2g=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr6142794oie.153.1594200598697;
 Wed, 08 Jul 2020 02:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:29:47 +0200
Message-ID: <CAMuHMdURedjjxVTR6ieTzzxaGMvjCXuXP8v=7yia5+Hhy6HXNA@mail.gmail.com>
Subject: Re: [PATCH 06/14] dt-bindings: power: Add r8a774e1 SYSC power domain definitions
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
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> This patch adds power domain indices for the RZ/G2H (r8a774e1) SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9, in a branch shared by driver
and DT (renesas-r8a774e1-dt-binding-defs).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
