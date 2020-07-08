Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787B721837C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgGHJXw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:23:52 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38674 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHJXv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:23:51 -0400
Received: by mail-oi1-f195.google.com with SMTP id r8so37250810oij.5;
        Wed, 08 Jul 2020 02:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uRrUPcHstxq9BkgjI6vnpH4KszKClgTBJE06AkYcztc=;
        b=CUrklVRm8yukd62BbjAKNJ9YhAu8+I5bP7oNragQUGs6WLE00i40gfVI35i/3YMjom
         1nOg43tjhiHXDb89YDF+trRBMbgld6uQVsKMATtTkWFrkicEnt+TI2rX8dBplRB/fJ08
         q8CqySml7Lqvxz7v7sCq8CrIC0ds7CVry+0c/1prthjGX9A4i6o7fP3LSGRTZicJaGE4
         NQkbM7AGKH9bij1dUJL/4zqzKJvGTUzgxIbTZUoGCqpv9wpn7psyCxGI7caxiXu5WBU8
         k7vvemsddb8I0KF2HTBF9oo94CEUav7KJJYXQB2O1U/OfiKbcgJXl5oAQ8lhAGx6lBYN
         MGOg==
X-Gm-Message-State: AOAM531TSCGLdYEuc6W1TdxRnmgD9OsxoVFtG2AcSdB+5DDXrp8M6Vsg
        n0XX6Y9a5KREIpXZa0o/p5U2OcE9i/2ph87kC74=
X-Google-Smtp-Source: ABdhPJw/h8f5Kis8UalwBsKneubiY5z2iSAtJed4AhomXo2jGp/awDUmDdgBRshyWBZ7rOIvS+O3RiJ0BAwLO/z4q9A=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6166090oib.148.1594200230635;
 Wed, 08 Jul 2020 02:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:23:39 +0200
Message-ID: <CAMuHMdUgoeWFj0iCL=UACN6L6_9O3r-RRNXDF8iJ_ahjFSgn=w@mail.gmail.com>
Subject: Re: [PATCH 05/14] dt-bindings: power: renesas,rcar-sysc: Document
 r8a774e1 SYSC binding
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
> Document bindings for the RZ/G2H (aka R8A774E1) SYSC block.
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
