Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129A142588D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 18:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242922AbhJGQ7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 12:59:24 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:35596 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242927AbhJGQ7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 12:59:17 -0400
Received: by mail-ua1-f42.google.com with SMTP id q13so4748069uaq.2;
        Thu, 07 Oct 2021 09:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHGIoV7Hfbbu/9BkiOkHuK+t9qYG8/aGn3949dx2OyM=;
        b=QLi+Fm0rweEEApstMctjejtxx2qHOoEvsmtm7CRjkOWjMJKgCUJd2XERwXo06VWoWd
         Lz61q/AIyhx0FZdYG5jgFC2Aogm3ucWzC4G0jYSftdnO2jTcSjAFH40HaEUprkFUgpBw
         E0uI24vXHLV8X+mY2HpM9sEV4UEHqXlxyMx39mJLy+pV0sl7zAKEvxc74en62m4pm9Iu
         XXZ5cipFy/4EvoZ2a+KUljaqsULCTNliC9yP0SMdLUSrzELw9aR2UuQy6OIivsDE9+B/
         uN5CuzGGXC/UgpDI7F5sAdYrMO4p1WZqMgzgpPS/qxXIJj4RsAa3n19zg+UJabPx5D5y
         FZqA==
X-Gm-Message-State: AOAM530L8vp6YOOjUuQFf+P/4F5UsiOk4STld67ixvdxINXOQLEVuJzd
        +mSS68LuPCXV3KXXdfBrx1n+VfExO4niOMuW3b/QgZGhF/g=
X-Google-Smtp-Source: ABdhPJy8M36Q04+A6uhVYWTeSIdm4xbLl8phJgcuCl+qtwaJrAjH15v35YHy4Ust53D6BLtTPq8G+zt8kC2Sr8t4Mvg=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr6017528ual.122.1633625842202;
 Thu, 07 Oct 2021 09:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 18:57:11 +0200
Message-ID: <CAMuHMdVm5gYFKZa=4jSm+GAsMYRUFwXjjXNhr16Z-ROVzpsZbA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance" property
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> On RZ/G2L SoC for Group-B pins, output impedance can be configured.
> This patch documents "output-impedance" property in pincfg-node.yaml so
> that other platforms requiring such feature can make use of this property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -114,6 +114,10 @@ properties:
>      description: enable output on a pin without actively driving it
>        (such as enabling an output buffer)
>
> +  output-impedance:

output-impedance-ohms (ugh, the standard suffix is plural)

Yes, I know only one other property has a standard unit suffix from
dt-schema/schemas/property-units.yaml. Should we add properties
including standard unit suffixes, and deprecate the old ones?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: set the pins output impedance at most X ohm
> +
>    output-low:
>      type: boolean
>      description: set the pin to output mode with low level

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
