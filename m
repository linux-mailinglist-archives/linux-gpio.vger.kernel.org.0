Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1C92E94D3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 13:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbhADM1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 07:27:21 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:46985 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhADM1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 07:27:21 -0500
Received: by mail-oi1-f182.google.com with SMTP id q205so31877917oig.13;
        Mon, 04 Jan 2021 04:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KGqjjOBqYkUhZO5NUTLsMInYidsYOh5Z+GKhoyq8Vl8=;
        b=BiIj7lltPSK2nTHV/0LdHPoFG+e5tGWgWuVP30BROHkmAU56s9GehQZt96oZ7Lgz5r
         coixlelRuPNfLHe56MuaKiHff/wd4jDRC4o/j2qSF01DMG+qcso25PyVB+9sAAowFZEW
         vLgXLODfsWxYuMd5XNR4b0SS48LXxzFR/f5B9EVG3H+ThQUgaYuviNNXgheXkaNY1vgQ
         XLm0ut1opPPKdownrdht58qxvcL0cIdoFQUobci8xdML6yStE2bV1mt85eHt/X9SaD12
         n1BDlkDEvhK8qP6OPou+oWG1Bb31y5FkBw0L9SbQ9y7N75o9yISwXtvBXNAygfHGUSPn
         Ks4A==
X-Gm-Message-State: AOAM5308dZjb1SfYlzf5ZtKb4y1y2sxwpDFS+7NjvWupKJnT50vwaCGW
        JGS9vHYtmzFYhj2tKu3vdBMPkM34pz63rVG6t+g=
X-Google-Smtp-Source: ABdhPJyy8WVYk74ifItC5ErpbK7ek7hVhTRudnGii5zDueFRpPPk79DIwtxgynDczsXHbEH5UrN6FUVKZN+T6uykMVA=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr17764299oia.54.1609763200164;
 Mon, 04 Jan 2021 04:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20210104113744.10681-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210104113744.10681-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 13:26:29 +0100
Message-ID: <CAMuHMdVFZsKb7=z4NJAbgHY9fEL-cNQqahEpoynjeMG7-wAuiQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Kconfig: Update help description for GPIO_RCAR config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 4, 2021 at 12:37 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The gpio-rcar driver also supports RZ/G SoC's, update the description to
> reflect this.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
