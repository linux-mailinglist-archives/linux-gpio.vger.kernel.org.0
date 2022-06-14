Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A746054AFFF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 14:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiFNMLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 08:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356696AbiFNMKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 08:10:55 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD7349C84;
        Tue, 14 Jun 2022 05:10:36 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id el14so6304438qvb.7;
        Tue, 14 Jun 2022 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1TqWw+Z+tcc67DWXCAxBw86GMgQwTDRi1u8mPHT7xFw=;
        b=PuqjCAAU3a+VFrggpWAUnm9DjEkgnl3BRA1Twix8gwkfHn8imLwkI7XC0nL1lucnzY
         ytMcYnVcRvFG01kRvXkRwbemvspTOOEYnl1j8ym6beMOZsnFSqsiPW+KqBnLrzpEDkuN
         vLas7zt5UhSwGPmeS89beCXHaQ701c4hs+23A9o3o6uNIDpgvNYqUr4p5kpIOpz//viS
         xDRaGr+fLE5zCyfuBXTtkLg3BG8JdWiDqnpn/YElBDeOJrPNLPenZmYUekOTYzMYK0zC
         T/u75zLzkos/yF7jZHVm8LuDkGHzwgRMd6nMMijRkyNdr2MA06r9olnZ9LkpAJ6NTu3W
         97bg==
X-Gm-Message-State: AJIora/vu4X2KyRXq5ZMFWE1xfJCRCTMom7ck7ll4e1kj6ZImaWHfRlz
        8wqCB7Clkjsvx08lTx1xEfHgPdMz6XV1Aw==
X-Google-Smtp-Source: AGRyM1vYVxKl/hl3i5v2W88ZtnjbREU8C8HOBJ75KV5SQQNyhGHXlo4IJGU+FMEIxupgbyB0Gh3H+w==
X-Received: by 2002:a05:6214:2245:b0:464:6b29:f443 with SMTP id c5-20020a056214224500b004646b29f443mr2925909qvc.99.1655208635293;
        Tue, 14 Jun 2022 05:10:35 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id l3-20020a05620a28c300b006a780aa9fc4sm7114307qkp.96.2022.06.14.05.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 05:10:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3137316bb69so27014437b3.10;
        Tue, 14 Jun 2022 05:10:34 -0700 (PDT)
X-Received: by 2002:a0d:e657:0:b0:314:7e4d:30a9 with SMTP id
 p84-20020a0de657000000b003147e4d30a9mr937672ywe.316.1655208634421; Tue, 14
 Jun 2022 05:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220520154051.29088-1-phil.edworthy@renesas.com> <20220520154051.29088-2-phil.edworthy@renesas.com>
In-Reply-To: <20220520154051.29088-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 14:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyoCG7PNtk9b32JAnzq4R+EeLCxM-8owuphhD=KFS=Ow@mail.gmail.com>
Message-ID: <CAMuHMdVyoCG7PNtk9b32JAnzq4R+EeLCxM-8owuphhD=KFS=Ow@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

On Fri, May 20, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/V2M pinctrl.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -0,0 +1,174 @@

> +additionalProperties:
> +  anyOf:
> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        Pin controller client devices use pin configuration subnodes (children
> +        and grandchildren) for desired pin configuration.
> +        Client device subnodes use below standard properties.
> +
> +      properties:
> +        phandle: true
> +        pinmux:
> +          description:
> +            Values are constructed from GPIO port number, pin number, and
> +            alternate function configuration number using the RZV2M_PORT_PINMUX()
> +            helper macro in <dt-bindings/pinctrl/rzv2m-pinctrl.h>.
> +        pins: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-strength-microamp:
> +          # Superset of supported values
> +          enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,
> +                  9000, 9600, 11000, 12000, 13000, 18000 ]
> +
> +        power-source:
> +          description: I/O voltage in millivolt.
> +          enum: [ 1800, 3300 ]

Is power-source actually supported?
While the documentation shows there are some 1.8/3.3V pin groups,
I didn't find how to switch voltage?

> +        slew-rate: true

What are valid values?
Looking at the code, 0 = slow, 1 = fast?

> +        gpio-hog: true
> +        gpios: true
> +        input-enable: true

Missing output-enable?

> +        output-high: true
> +        output-low: true
> +        line-name: true

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
