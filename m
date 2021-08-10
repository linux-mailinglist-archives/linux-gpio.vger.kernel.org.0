Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3553E56C2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 11:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbhHJJZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 05:25:00 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:36701 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbhHJJY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 05:24:57 -0400
Received: by mail-ua1-f52.google.com with SMTP id v3so8300356uau.3;
        Tue, 10 Aug 2021 02:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICqADYaP1A14+MyANtx/aXP29/vtA2xTZTvUmJgQydA=;
        b=qX1PtnwZCIwCfUbDCXChUb0CPdkFiFLNtSVl2zNY5SrQLc4dwYn7dlXYV9uK1fC3td
         1j4pNAC0ZXFsAJad7ZyrDFjHaJhsKROh02IC7hUhMwD/ylLiyouwEKmbJokVaUp0Sx8F
         3UXmZZeM3+OOqUDo15igvAaTRJ+yRbWlcorGiSSZK2cpaQ+xX8UxG07Kvvg51lDuw4/Q
         Zb0nsNyWXDMjcFhGOeNivYaq62eRAKUuckRa8n32WhSwix6IgjHitqmm011qvyUUn1x+
         GALJJ7Lpzb6xJqRrAUrdAkmMAaGwwcFLO9nW8efdFGSzFjrCfTfomgNp/m/dxGijih5n
         RE2Q==
X-Gm-Message-State: AOAM532kfE0CW/qybN+lV015IYZRN28l2h/3LfLSXHc8TKgC04/D3qKV
        hDD2LJs+dXhmpBsOrhyDafq7tIhQeIegzMhMH5Y=
X-Google-Smtp-Source: ABdhPJx0+WKs4BIH2VfJ9bQwS28hkA/EVWEvawlX2BcIkosS8SlaxLrvTttwLfx7NXsyDcZcgZofzopA9Ko/fGvHiyM=
X-Received: by 2002:ab0:1d05:: with SMTP id j5mr5141579uak.2.1628587473228;
 Tue, 10 Aug 2021 02:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210727112328.18809-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210727112328.18809-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 11:24:22 +0200
Message-ID: <CAMuHMdWUr94SrsmJ_Qu8F=YqvWiKhUURpUJ=FHofQWhZBf=N3A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Tue, Jul 27, 2021 at 1:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add scif0 pins in pinctrl node and update the scif0 node
> to include pinctrl properties.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As this depends on the pin control driver, which goes in through a
different path, I think I have to postpone this to v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
