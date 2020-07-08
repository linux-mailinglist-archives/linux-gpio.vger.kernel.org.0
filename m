Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAD218494
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgGHKC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:02:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44165 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgGHKC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:02:56 -0400
Received: by mail-ot1-f67.google.com with SMTP id 5so34495247oty.11;
        Wed, 08 Jul 2020 03:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3qpgK68Rp80hw3W1gABSA6K3TvekJse681LfvBNyDQ=;
        b=rkGZMrj0rYGLQMgNTx8Y/Qy7vwQ4a5+xePsm+QBFUHZnXdKyY4tqqARsaSx7MH/Pw9
         6RxoJs/hBFIw6F1x80bN2iPr3BaTVChtaVyxgFzg6vzOHhEiRD6HWxTwxFaOc4UsJmId
         IpAHGZYKYgvdI4hpi5OhkuIYWhPcuXz/MVdUsFLhSr/20YS1LRlQkpcmUxRAHOPHY2eC
         UtOoxBz3FxViMEaQeuyCcoYmGJXwAIW1c58enLx5ZmB79mxPUSIweI2xhujrPTCvBuVx
         31rKfrVvl/E5Kk/4hgWX+C6/OwzItWKmEriMNd6VavSxFGASChRQaLzR8PIMIglTNqtE
         AiPQ==
X-Gm-Message-State: AOAM533MqCiOXbOO2lWgiBDqt+89johBNZhtGHpwSAgnRFq77RhJSR0/
        oDFZuhGwPL0ep8wOAUs4K/n3EA3EPvrzV/2rW2k=
X-Google-Smtp-Source: ABdhPJwxhiElFlvm/0jTBOJjfNwT7dkjs4nWz5ph6kD5CcLj74x1KkLxA+TcUH+k5v7ww7MVFV7rNnCldQAneZprAtk=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr16424471otl.145.1594202575277;
 Wed, 08 Jul 2020 03:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 12:02:44 +0200
Message-ID: <CAMuHMdXr+_Waf2rsk41LXta567ryibgzREz+5aJbTx19fqtJ=A@mail.gmail.com>
Subject: Re: [PATCH 10/14] dt-bindings: clock: renesas,cpg-mssr: Document r8a774e1
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
> Add binding documentation for the RZ/G2H (R8A774E1) Clock Pulse Generator
> driver.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
