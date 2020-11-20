Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D052BA4FF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 09:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgKTIof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 03:44:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43833 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgKTIof (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 03:44:35 -0500
Received: by mail-oi1-f196.google.com with SMTP id t143so9610759oif.10;
        Fri, 20 Nov 2020 00:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9/c0DqdQymtn4DJG/AwP6hpGMmRc2yuo5UgjgHb48A4=;
        b=BDFGz4gJp8Xf2BeEKdXdUmEqZxkk5N3wHG6AcgtiF98efgwscWItcBJmhEq0cgqqZa
         QfAt9MfxXxmX8WkycYFt/Xbl1VuRbo4Bnvde2rv8X9Uw17m7fLR+Lzst03WdWoZtDXsd
         TyCiH4wGzVIe6kObmx0SuSBOiFzvJTTTOKEHdqCYYJLhDyYOOIY6yDz4qtsKLB6RBqiV
         ELnInsqB3cmDPDDt1aUp3ga0E70rkXFyWMaEiheY5FWCq7sXCimjzZq9yohd8EL/lip2
         7eHB2KK5wM56eI62lp7WCChI7yjazrC8Yq+iU6qrg80d7iZ/NbsjSXrowSSF7czC2V0M
         pgRw==
X-Gm-Message-State: AOAM530+mBDtstfA/+BCviCZpnVAOdPeqrohaE4pzZnruWXOoK0VtM63
        Kso7lLOJ/MdbxMEehbNeyTo/8tOO+FqUpZL2srBe2vIcIpM=
X-Google-Smtp-Source: ABdhPJwx1q8sbES3bwwk+ltASw0pLHiP3VDPbit4w6xtabJblJ3ti08n2iADTJPjg+z+KsPUUZQ8AC0nvySAo5F8Jj8=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr5358672oia.153.1605861874263;
 Fri, 20 Nov 2020 00:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20201119130926.25692-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201119130926.25692-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201119130926.25692-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 09:44:22 +0100
Message-ID: <CAMuHMdXuw9+4YJp59GkQx2jfHVKxs5zm8aE7A4Y1L2dAv2nJbg@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups
 and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 2:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for QSPIO[01].
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c

> +static const unsigned int qspi1_data4_pins[] = {
> +       /* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
> +       PIN_QSPI1_MOSI_IO0, PIN_QSPI1_MISO_IO1,
> +       /*  QSPI1_IO2, QSPI1_IO3 */

I'll fix the double space while applying.

> +       PIN_QSPI1_IO2, PIN_QSPI1_IO3,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
