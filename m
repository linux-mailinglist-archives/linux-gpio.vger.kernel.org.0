Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797B9218371
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGHJWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:22:34 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41919 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHJWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:22:33 -0400
Received: by mail-oi1-f196.google.com with SMTP id y22so24644339oie.8;
        Wed, 08 Jul 2020 02:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xvMJkAppfMGBJdTVeqhxGqEaQ6GrIw43RFY45CP3Dr8=;
        b=joqX9MQRWLngWZRo5TW1WwhqadAG/qA/BK9ptUOXNM9UNAAetcH8b+14wGSkQR3cJX
         uSOdSqajUkmOdckhf8PhrRRGDM8fjWfOP56/10spzEleEQEOMuiVild0wOQKRZ4szdiq
         v/j5Fz6w/7TtjnDGuCJ2AEDt5lBhpW8aIo0ZiXZivVsfkA5dte1x+hMM2ggWNGtgUpmE
         vuHLPPhuiB/8gdZl3meJgwucVj/VnD2U27iOmRt+Xhpb8RSXryGmInadLsJbyttvX4Ux
         dVV7rfBjoTAj80R9BGb3cuKrnukt5WPjx49lJ1AtAgS6hWb8+RDc4glNcEXBIctj4t7M
         gg4A==
X-Gm-Message-State: AOAM530hL5yc406Uv1viSWkfO1ecGnjh96f+YIIBUAwYkczDR5tiqz59
        ghRiDGX7hZ0aCVzoNxNQZKLNiAaeFcxnFUmxUhA=
X-Google-Smtp-Source: ABdhPJzkwaNDRSSoi48tLfW9duIr6PBxhvEH7REKD3+gPHgHqBKsMqPLBYfac7rccRu8rpuHUzl0M1cejwnpFHO2tG8=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr6478500oih.54.1594200152546;
 Wed, 08 Jul 2020 02:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:22:21 +0200
Message-ID: <CAMuHMdVqopD45WJv_aLL9YrNFFTWOi1SPBxMN2q4O6-UafOX-Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] soc: renesas: Add Renesas R8A774E1 config option
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
> Add configuration option for the RZ/G2H (R8A774E1) SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for the patch!

> @@ -296,6 +303,10 @@ config SYSC_R8A774C0
>         bool "RZ/G2E System Controller support" if COMPILE_TEST
>         select SYSC_RCAR
>
> +config SYSC_R8A774E1
> +       bool "RZ/G2H System Controller support" if COMPILE_TEST
> +       select SYSC_RCAR
> +
>  config SYSC_R8A7779
>         bool "R-Car H1 System Controller support" if COMPILE_TEST
>         select SYSC_RCAR

This hunk belongs to "[PATCH 07/14] soc: renesas: rcar-sysc: Add
r8a774e1 support". Might fix that while applying, we'll see.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
