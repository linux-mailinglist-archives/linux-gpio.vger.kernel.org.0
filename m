Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFECD295DF5
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897774AbgJVMEg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:04:36 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33152 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897772AbgJVMEg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:04:36 -0400
Received: by mail-oi1-f196.google.com with SMTP id s21so1466007oij.0;
        Thu, 22 Oct 2020 05:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddP321kWN2T0UYQIoEK73Oe5iFC6C9ZksTMTgrDRYoM=;
        b=Fqn5r954w6cP+CQ3wZAuvFvbXEfbsceyQwQ6gJfx5JSA+OyVyp4TkYyGRUnZue2B5a
         BzY9sR6ZvgUvNUCCg7Qwni96q23GpYsDeaxKgi9t+XPC+pYGWx7VveImBNh8Sh9/McbT
         sP494vFSW+pVnv3SbMcXuMawg3Q3AD0rXsUtOA2oL+/Kn9g4U+CnnAlEjgpHgfjke2E8
         9uyLmotkTjTtngjjsVhLzZUAaqQR0Drtwe8qKOJv/cc1Y7zupUpzf7CKJ/DW/tZzftev
         dkU322FuKkj7VdpAuT+vtLCrsONXNvzpTUdk+NtEtwnyVeGCSYesqGcn/HF6UIRlRlkZ
         D7Qg==
X-Gm-Message-State: AOAM533Yv0Ok8xa/RzI9N9l4PWf8mPmUcVg+tWVemIiIbmEflLT4aXAU
        Ew/pOzG++MaO7D6fm3EMxwUEGCxLs+f2sooeqqA=
X-Google-Smtp-Source: ABdhPJyrCdGdj5my3iylrMXtUaLFF9cW/Y0LhQBj7rbsP9bWXdUn7Lng1w5sa0E3URMRx3qhMJFk4EjlV9W8UCKdvqA=
X-Received: by 2002:a05:6808:8f5:: with SMTP id d21mr1176202oic.153.1603368275606;
 Thu, 22 Oct 2020 05:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com> <20201019124258.4574-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:04:24 +0200
Message-ID: <CAMuHMdXJ3TxDdge8juLMS7ZmWm9f8Z-dxt-CSAD-GjEvFjNE-w@mail.gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: renesas: r8a77990: Optimize pinctrl image
 size for R8A774C0
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
> This driver supports both RZ/G2E and R-Car E3(R8A774C0) SoC's.
> Optimize pinctrl image size for RZ/G2E, when R-Car E3(R8A774C0) SoC is
> disabled in the defconfig.
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
