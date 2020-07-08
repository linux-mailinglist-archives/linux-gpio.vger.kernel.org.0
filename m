Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED7218329
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgGHJJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:09:20 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44554 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgGHJJT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:09:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id 5so34400513oty.11;
        Wed, 08 Jul 2020 02:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TOVO6Hb9HZqjDMN7R8CrnBFLPvMAJa6aPykM+a7dds=;
        b=iONej4vdLbgt2ACKzkM/tyRixQxWQ9UnKvZgyfs3DRVqn9EIDwXqMKKS1byqCRUtDx
         I3D+yFBTuiw1O1hNcxnAlpN+kF/Mwhc6sofSgw8qoiyPp71yg34pfqXyONNhx6/x8ZRG
         J00Go//wffVIfmYRnrimWZa0piEdGcO0wPMaEsR04+f2Ztof0vQJ5KkdrJG05cCkK4mh
         cOwCSEToSURiDkDPjC4plTj0EckS86NakDE4e4LqVeJfSMzzRv58YBl4Al7xiPFwa8NM
         Cpoo2saZKLboeIduKnxoX50xmQ7zkGMyZDGwtY6UWARFRtCHrFBQvU1ZjXjcrsMpTT8P
         te4w==
X-Gm-Message-State: AOAM530xGzOi/Ucb364TV3iqHgSs2WeK+FpdKKOXQA7eu2+72cnQxuCT
        Za7PxusdEDmeLN5zxgRoYaohjkDDlBhMQ/EMV8Y=
X-Google-Smtp-Source: ABdhPJyhkpRCJtpPAs9hAa8vrBNGvUEx4nBIs4nP7nRXvEerlITrMEI9OahTeNAuPq/kfTLdDiw/8PJ9ezSlGzPVEFo=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr16283684otl.145.1594199358865;
 Wed, 08 Jul 2020 02:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 11:09:07 +0200
Message-ID: <CAMuHMdXLLVhi7wj4z82Si2HjiU5P=MLecTi2=0-yoyV_6TRHEA@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Add HopeRun RZ/G2H boards
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
> This patch adds board HiHope RZ/G2H (the main board, powered by the
> R8A774E1) and board HiHope RZ/G2 EX (the expansion board that sits on top
> of the HiHope RZ/G2H). Both boards are made by Jiangsu HopeRun Software
> Co., Ltd. (a.k.a. HopeRun).
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
