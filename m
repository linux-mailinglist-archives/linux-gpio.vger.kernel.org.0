Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467951B6F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 10:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgDXIHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 04:07:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42824 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgDXIHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 04:07:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id m18so10934569otq.9;
        Fri, 24 Apr 2020 01:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzIFhflCUpW0vlwD+HN499aTW1TuNaMPbwNcI/YnbU8=;
        b=sSX50AOTW8dUpnYE+Fuki2PZITmeLRO2PtouLIrv57IVcQz0IpnI4UWvD99MmD22yG
         SAWGvNwBFbajaf2NXazrw13oSgONZZzVIEipsFpGgNCEMKxzkTXVsSOzRxdH+T18CD2M
         1vJcwMfEmF0chAmi4ptV146nIChqbDtplA60esmVB1mD0hzAqP5ICjmEnoeJ2PWTrXHr
         HOYEHExELPJ+QQ/ITljVEPHhGyAkTfNxfTFNFu1c+ZXcg2Ttb54u9+BuP35RbAL3a6fr
         xJJFo19E6jBwuAgtvkjYUIKA5Kav+fmHqVhGY9bFQwzluIN5S6zKlOC/Wh5FzPx3sNHH
         xs1Q==
X-Gm-Message-State: AGi0PuZv9BDBONgIydasA6ozGJSt1zrtVm6AZp/b831RR8clkn6PwCGJ
        r7LibU1b08ZCKqT/nlAXXLjnCDbRYkxNPYWz2AzHapEy
X-Google-Smtp-Source: APiQypKQNbeN4mNtj3QtUc1MVDLrUbKP4GFG3yBb1TIc/Bv8Ot642D/RYCQ/hI/TESa0U15+fXMnRv0n9KoFV8tx1ZE=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr6433482otn.107.1587715630830;
 Fri, 24 Apr 2020 01:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200422101026.9220-1-erosca@de.adit-jv.com> <20200422101026.9220-2-erosca@de.adit-jv.com>
In-Reply-To: <20200422101026.9220-2-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Apr 2020 10:06:59 +0200
Message-ID: <CAMuHMdXvrBHuBpVbJ=fUcRsQ9qk4Q3Lr13DeJjiHanN3f8K+1g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpio-rcar: Add optional
 use-alternative-interrupt property
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

CC devicetree

On Wed, Apr 22, 2020 at 12:11 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
>
> When setting this property, you must set alternate interrupt number in
> the 'interrupts' property.
>
> Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> [erosca: tidy up the descriptions/comments]
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your/forwarding this patch!

> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -50,6 +50,9 @@ Optional properties:
>    - clocks: Must contain a reference to the functional clock.  The property is
>      mandatory if the hardware implements a controllable functional clock for
>      the GPIO instance.
> +  - use-alternative-interrupt: Use 'alternative' GPIO interrupt instead

renesas,use-alternative-interrupt?
(unless you can convince Rob this becomes a generic property).

> +    of 'normal' GPIO interrupt. When you specify this property, you must
> +    also change the 'interrupts' DT property.

In light of "DT describes the hardware", I think you should instead list
both interrupts in DT.  I.e. first/single interrupt is the normal one,
second optional interrupt is the alternative one.

On R-Car Gen2, the oldest SoC family with this feature I could find,
they are called "ext_int" resp. "ext_alt_int", so introducing the
optional "clock-names" property would be a good idea, too.

>    - gpio-reserved-ranges: See gpio.txt.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
