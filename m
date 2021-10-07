Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3244D4258C9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 19:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242985AbhJGRF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 13:05:56 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:43552 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242964AbhJGRFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 13:05:55 -0400
Received: by mail-vs1-f46.google.com with SMTP id p2so7476087vst.10;
        Thu, 07 Oct 2021 10:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k/AVoCzAraA2PyKzTWn7ZFVdIxhqagP4oPTHWfnliPg=;
        b=Sn7EL4yAcsbLp08tpuDVe6fOV9OVSnzehuCilqWIHcaQvzyAqzG4dzrOqWFCwJdw2+
         deMm14QdQ3eHfvMVZ6GAWXGmWAWIor5SA+jETbQpzSa4B+0pLtlJGK1y24g/wapPr9Ju
         LoT1Dh/mo8PCR4Jglfp4gwPh2oRJlQ92qC70WmTCQeynQccX+lwLP3e7/fnq258GD0Yg
         TbMYkeSuAc119LqpLiATHZq+8+rUmmZBQlj9kcnL5z/KXWyLIhSrsp/awcetuBpPVPU8
         sjQ7qUwkArRkYruUuINnfo0bKEbEdXNgupoD6bNE9xPNsL9n2/MpG4eiPB+LhcdLsAep
         Mj9g==
X-Gm-Message-State: AOAM531/E1bfPFU4m+N4YEA5MgNv0jiLH2Em8+fsN5stXwbVYrT+Xo4A
        64/shNjHgnVuIFabB1PQh65TQGzKQQoZGZN6fKQ=
X-Google-Smtp-Source: ABdhPJy5Ztbq7UtjQc4jDGhQctOdP9bDEDAJ6WtC0mcBbAg3k+HREuP2zESbj5HH4fd3DmHYSTWScBe/Q4rUChJQTJA=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr5747203vse.50.1633626241259;
 Thu, 07 Oct 2021 10:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210930121630.17449-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210930121630.17449-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 19:03:50 +0200
Message-ID: <CAMuHMdUN-iFBAtUjvS8Bg+jqpkfcWrx=9Lif2VmYqMXLUZ5jtA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 output-impedance property
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
> RZ/G2L SoC has two groups of pins, Group-A and Group-B. RZ/G2L SoC supports
> configuring Output Impedance for Group-B pins (valid values 33/50/66/100).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -73,6 +73,8 @@ additionalProperties:
>          pins: true
>          drive-strength:
>            enum: [ 2, 4, 8, 12 ]
> +        output-impedance:

"output-impedance-ohms", as per DT standardized property units.

> +          enum: [ 33, 50, 66, 100 ]
>          power-source:
>            enum: [ 1800, 2500, 3300 ]
>          slew-rate: true

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
