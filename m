Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DD5295DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897835AbgJVMF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:05:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38905 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503373AbgJVMF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:05:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id i12so1251488ota.5;
        Thu, 22 Oct 2020 05:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXsf0JzowlWQk9Peu1meNL0npoiLDdl2GFMGp+hpMac=;
        b=X0X8FFjwbbPNJvUfzVUn/Pnfg8zfc04R/fzZ5XgGuxBPvJvR72NxunXuaOPcrmj7rl
         nt1WPxVAF8eHjUG2KgI6edtiS45j9Q0gW7w2BbARZTWtAXYvNasAmzKD4zq19p1ev+Sk
         J1Jy3nB4+pIbb37i+pWYW8+NUW6TmPeJ2Dw6vMrjzla8FlZud/mej4LWRYmli8Q1hR6x
         69lpJtfLDqk3zM2KzaS9rGlpZdpYpYd03JU1dDZh+Inn+sKrp0SArpo7kHwJLowZNZ1y
         wcpsTljAWn6ikrE/l8Bsrae4/wt5uwRtPe10GnGF1lkJ9glS1avcnVaWIEU7y2j/7JlN
         g1fw==
X-Gm-Message-State: AOAM532CwMW05WxgZ2fyLYzIlFp2k5dcTwAaiNfxmBYebqaj039KbTlb
        f1wYUvJy6BN0NUe6i5pW51sNY5K1/F6tnHT0lqM=
X-Google-Smtp-Source: ABdhPJwlPm2VHQBnj+yovSxRVMdYueLPhgujOassdHBx6ya7L/wFoK/oDT5PgjvHXntC+177153T5zMpaz6gdf2aTcs=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1603488otc.145.1603368357392;
 Thu, 22 Oct 2020 05:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com> <20201019124258.4574-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:05:45 +0200
Message-ID: <CAMuHMdXB2+z85nX1OLjaftZZYxYrvuXNhRwdDg39CEXRu6vF0Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] pinctrl: renesas: r8a7790: Optimize pinctrl image
 size for R8A7742
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports both RZ/G1H and R-Car H2(R8A7790) SoC's.
> Optimize pinctrl image size for RZ/G1H, when R-Car H2(R8A7790) SoC is
> disabled in the shmobile_defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11, with comments added to
the #endifs where appropriate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
