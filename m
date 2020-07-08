Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE902218626
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgGHLbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:31:25 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44288 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGHLbZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:31:25 -0400
Received: by mail-oi1-f194.google.com with SMTP id k6so33619667oij.11;
        Wed, 08 Jul 2020 04:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8e4hZ651cVQvM3D1punaVKh1Yt9HoxZQTsJcXMEqkDA=;
        b=m4CeBAmYjBTwDcD5+n6LdHoOdyrGoKD5rg+xLWEASq3yMMJWNZnsqQex+A1CYd08lB
         wVuROSHYLeY8QFmTZSIYGQG3ePHI+qSqRY9XyXhcjV+B5opgXTRIdlCW1Kxd4jrvQ/VJ
         hSiVws5i/5XsME+1TZ4bPSqqfMWEF5/bg4nl8jhL86oCN1f88LOOm93vgE/xQ970chxc
         s4Pyg8iEvxLTVkE3bgbW+Tp4OxITXkH++TLJ74Zo0FDV+WpT/N7Nyl7UflUN1ypyc9bR
         xvkXJyVs6VZYTajYUu4jmEZtgZ3py4STQZ8I02glj5jqpVAkPTFDBeJgUZ+AONp3uDYA
         Qx4g==
X-Gm-Message-State: AOAM53243vR3RuZw5DwLZ0/WhQ9pHpKr9yx8YqbKL+iRBUnkIr+MOKyV
        4kp4w+6k1J63Cpgvyud4rOqhAbIhZ8RmlUOfkmQ=
X-Google-Smtp-Source: ABdhPJwafYtlIK3JfqVod814xS1tHS++kFtnvZz6/F9NZ7RsO086oPA3TeNASTK81u1+qTWjwuY65ewtSNE84DDJois=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6476331oib.148.1594207882458;
 Wed, 08 Jul 2020 04:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <1594138692-16816-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594138692-16816-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594138692-16816-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 13:31:11 +0200
Message-ID: <CAMuHMdU92mn8cYT2hb-f=e8ob7M52=uJkEAwAwnGyRKymg=eRA@mail.gmail.com>
Subject: Re: [PATCH 13/14] dt-bindings: pinctrl: renesas,pfc-pinctrl: Document
 r8a774e1 PFC support
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
> Document PFC support for the RZ/G2H (R8A774E1) SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
