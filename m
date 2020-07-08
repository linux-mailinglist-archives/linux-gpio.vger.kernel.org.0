Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE93218478
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgGHJ5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:57:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33722 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgGHJ5D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:57:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id h13so15933008otr.0;
        Wed, 08 Jul 2020 02:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XMiWJeC9gW4zNEiGNGQ7Jia3B7H7LS3LhnFPaKtC4g=;
        b=cAebVONZZ7bMYY5J+ExVAu3ogmzNZabjQIZd7uwlAtjsyZWnnyPI6ZrtmKTetGIWUe
         QJXQyRHBbn/FddhdH9HGzrUUGoptU8+7jz2klxn94SfwT31nTV5KF/lfLcZOoPzFiAP+
         EL259q2jUCrCSlyXc7kph8d/nVXV0EnaCKKTtDPpL9/dOM6oFEzGYOHiLDV4gjQEHkPP
         wkSGDIqWD73BE1msxIrv3CPfMppG9AZ0OPeb+oOrsA2qwmNGocl7UPX/7hxpZOzA1k4X
         I/6hG8i4BigJiJCZ/duxNlIZDIOannLf6uP/p6qsd8SvDjynBOcWohdGnVlLLKDAgilM
         HSWA==
X-Gm-Message-State: AOAM533bUrZTOnjNVQzV8el95sQPM9LYmnx8/JBWlVzaxjeW8g5KKkoV
        1wd56+JJc7QBaKKm5zjROVOZtywvQuvIyBxq/IxZwscUe6M=
X-Google-Smtp-Source: ABdhPJyuevYFnTlFM0LnJZUoW7t2WZAhJReoOxca7ubZPR+uLGRaihk2OIZA0t2pcDxVCl8uiENhn5qrU2TBWt7WZac=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr46196987otb.107.1594202222825;
 Wed, 08 Jul 2020 02:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:56:51 +0200
Message-ID: <CAMuHMdVo7gsK-SpHUqWnV1zzcjbXp6FDRFD46J88iksoJrPakg@mail.gmail.com>
Subject: Re: [PATCH 08/14] dt-bindings: reset: renesas,rst: Document r8a774e1
 reset module
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
> Document bindings for the RZ/G2H (R8A774E1) reset module.
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
