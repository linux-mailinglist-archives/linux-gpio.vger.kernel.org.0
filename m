Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EE7218475
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgGHJ4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:56:10 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39994 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgGHJ4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:56:10 -0400
Received: by mail-oi1-f196.google.com with SMTP id t198so24772139oie.7;
        Wed, 08 Jul 2020 02:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wuZ52/2R2QhpWJLHCV/wGrDxu4may668Ov4P0DPN7go=;
        b=jWqbpALxf7txcC6DUNhOfsAct/3VMzJvM1yM78IRSwTRbH/DF2S8bzVW1v+w4HdLr6
         jN8pMLCjZGo6E/UHmA6llO/LOn7RZcF4WxcMm21y+yZE/B7NdrFmDqKHZ1zbCvjKPAhM
         BPvKzBzcQkMjn2kDh1NHZDJvHqOzC1PYA49RcT4k8vEZ8USyxtjKMYs/FAaKdifBoCzW
         YFuw+iDKsJ9pmZuWRBySmeoHRI6XSt9yPfiC63jwokXdC+S+9mgNLA++A57ErY67cIrP
         upKTOA6jXXVVPErc5W86s8M5POy3mfFtqAnWKEugUN1rA4WQzFvR0XQ4SQ5IrF88xEQO
         jDHA==
X-Gm-Message-State: AOAM532JSyRVHa6sd6ZwzDsRoMOiIbn+TUgIOn/SCrJ1jv9rVLTGHC/b
        cCUJa8yj042/yz0c6R+4ZjTUDl/o5z5A9iWwywo=
X-Google-Smtp-Source: ABdhPJziRItiVHnSBeIux3430KjIvDj8lyVf1dBBml+v4gyc2l5NRtIxrY4n2e1Chzu0gV5BFqwWF3ybNdNI/IJ/wW4=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6236480oib.148.1594202168991;
 Wed, 08 Jul 2020 02:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:55:57 +0200
Message-ID: <CAMuHMdUMnt1VJ6b7=S+5DoDTxbUQ6mRsfEPu2Fu7ZeDUobi8cw@mail.gmail.com>
Subject: Re: [PATCH 07/14] soc: renesas: rcar-sysc: Add r8a774e1 support
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

Hi Prabhakar,

On Tue, Jul 7, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add support for RZ/G2H (R8A774E1) SoC power areas to the R-Car SYSC
> driver.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

with the Kconfig part moved in, and reordered before 4/14:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
