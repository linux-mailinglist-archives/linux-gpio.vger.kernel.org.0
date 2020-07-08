Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8261421835A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgGHJRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:17:17 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:46487 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHJRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:17:17 -0400
Received: by mail-oo1-f66.google.com with SMTP id s190so5156596ooa.13;
        Wed, 08 Jul 2020 02:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfSlSoJT6hTRymRYzmoO+21wXQYQh3l9NYIqmEcTF0s=;
        b=IFxTeiaOz38JnvM0q6vKMK55HWgEtQeagalS9ufm9Z5wsz9I9HCcIYd873iH8GJG+f
         uT8FkauSJkOL5YLk5Q5KZ03+SrClBt4zsPFmvKCSeGuGKOYw09G/r971Dut/XgdrcJZR
         uCNz5BT7q+hKsnxhGPu9qdWSl77Szr7gwrdK8i2QKO/npkOhPcnk6saIx8B+VFGUndZp
         waqNpN91i+aUPSQcqlvDJ3B7g59fRn6TVSNz+MroNAJkkBzFie1z4vwcAD0gvZtjIC0Y
         xAmFkcCtabdGoNIL5RGqQlG0CO0XRu1JRjOs8wtF3NhIY5eJ+Cbs8x1etPEAUI7R82yE
         gA9g==
X-Gm-Message-State: AOAM532yaFOEhEAEOKl7QEYrgGrCqABmGw/WsaGfT6C8914EpnhDIJCz
        8Gy1m1D4mbjKLfgfjgdFBW9xOToHYnbPWqgvWNw=
X-Google-Smtp-Source: ABdhPJwzpQITlLNiEpP+YUnYc6Xl2667LnCWQxNGWmmkC5R0KzN2IE7Ic+eKoZjzqEJpcjI9xjlJQvk9OU+un9179cE=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr33209384oob.40.1594199835974;
 Wed, 08 Jul 2020 02:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:17:05 +0200
Message-ID: <CAMuHMdWy7GWTWvSdanDNkNaYEN1ywJ9wqjGMy17+D1oDEROffA@mail.gmail.com>
Subject: Re: [PATCH 03/14] soc: renesas: Identify RZ/G2H
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
> This patch adds support for identifying the RZ/G2H (r8a774e1) SoC.
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
