Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78A5218492
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgGHKBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:01:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35270 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgGHKBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:01:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id d4so36544042otk.2;
        Wed, 08 Jul 2020 03:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Od5/IKwUaZH7vBYoitS0Ni1R59CrgLmqnVtFqI2byA=;
        b=NNxmo9VSfMAjYRCdIT3X+DUH8ffJsC4qPgO5ca9Q/NCbZuvB8xj5zmjlThctf+o6yQ
         3LAzNz8CmjhYH2ECTwo/VdFvSvNxbVnItHcAfgysJMlwvb+OPxBqgtLrZT/t8UQaKLLp
         A2WJrA/t7MOUVZuapaIucuA4yFY9S1sa3dmt8IIfNRnr01BFjtOiWOzkgaVL3ETL5r8f
         YpqySJ/WRe/Gn/dzk6pIHaRE0whQ+UCQ48LTeVNGQz6VIgtkOKlRrgUCdKFD/w7w9FT4
         6U4eMoNmfh3J2qlFF2OqVO/M0JVsU5lBMPf88LfD2CNWE2lY2uH9sGPlcAX10k9+nFpG
         p1pg==
X-Gm-Message-State: AOAM530qjzC2ogmcLeyiEr2bCMKg6RTgtY+l2UUWqfKFO9RECkaiEQFQ
        ywiWRzU+g+TQTBh+vt3QuFmtw00IoC1G83i3lgg=
X-Google-Smtp-Source: ABdhPJwh+QJapHYqqogpDGFIrsNKpl9NifpjTVIdei/1lvymLMXBmJmOrZBOn62svUeQVf2fysdDTy+tJGe2eFrUw38=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr16418282otl.145.1594202483944;
 Wed, 08 Jul 2020 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 12:01:12 +0200
Message-ID: <CAMuHMdXOa5VXZpZxJj3g3UXx6KHn047OLqvP_JJ+_VD1C5T1Kg@mail.gmail.com>
Subject: Re: [PATCH 09/14] soc: renesas: rcar-rst: Add support for RZ/G2H
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
> Add support for RZ/G2H (R8A774E1) to the R-Car RST driver.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
