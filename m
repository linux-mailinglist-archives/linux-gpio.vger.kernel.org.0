Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACD33B2BC9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 11:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhFXJvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 05:51:04 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:45631 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbhFXJvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 05:51:04 -0400
Received: by mail-ua1-f47.google.com with SMTP id c20so1968997uar.12;
        Thu, 24 Jun 2021 02:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/kroWqcKlXWFFemZQ/NRzbiGg9xEeZfy1xoLaGDU8GA=;
        b=PdO5VS++jkgz2JRcGxjSjdLq4YVhm7cFfidPA97d5eQ7hvDD1CpWVxoLrF2qGR7jYY
         vp/aslcGiGbtQm06MyJVQ1JJWF3kpLjY+jf8Dh1Br44LSov1rnMVVHZXMi05B3QpmSn3
         6X4yH8rYNnqJTDaHVnSmzFgmuqIEbK+7+k+2ynTVGAPWQ6X6vlE7Aj3b8wCjzzrgon4w
         RiDQ/yeqdHSwygQo1hhRY3KWAC0IVeLnpDvSLFRWJZ2Ek9g97YpmVbn1pyrrBWoVf5VM
         Mk3D/dsX1bPY6RGj0qR9sqQ86Ne0NjG+pj9z6jBeGBg1nBL6mAmEXwbV/WqVEZ/Dd9l3
         LHqA==
X-Gm-Message-State: AOAM530LzX+3uie/WDwaz7uBq+2QT/DkbiSB3gzUL6IjH/TJF+cbWTL1
        4EnxH+h4tKZLuosgHUs8VfnKHFejbJHNcdooe7o=
X-Google-Smtp-Source: ABdhPJx8eLZCaQK4JJwT1wiEqQ3kpv3yUbtFJCq1izK+isDq95Iy/KbQ3PFmqEMo0o5JCpRXTr+PiKGGRgOL7pk+SYI=
X-Received: by 2002:ab0:3734:: with SMTP id s20mr4456679uag.106.1624528123937;
 Thu, 24 Jun 2021 02:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Jun 2021 11:48:32 +0200
Message-ID: <CAMuHMdXp_QS3TXDA4m5w-rY9Q+UYmKKZpzt+OzyBwuj2ax+3+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT
 bindings for RZ/G2L pinctrl
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 16, 2021 at 3:27 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L combined Pin and GPIO controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Renesas SoCs of the RZ/G2L series feature a combined Pin and GPIO
> +  controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 8 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZG2L_GPIO() helper macro in <dt-bindings/pinctrl/pinctrl-rzg2l.h> and the

<dt-bindings/pinctrl/rzg2l-pinctrl.h>, for consistency with other Renesas
header files?

> +      second cell represents consumer flag as mentioned in ../gpio/gpio.txt
> +      E.g. "RZG2L_GPIO(39, 1)" for P39_1.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
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
> +        function: true
> +        groups: true

RZ/G2L uses per-pin configuration, and, unlike R-Car, the configuration
registers do not have the concept of pin groups.  Hence I'm wondering
why you are using "function" and "group" properties, and not per-pin
"pinmux" properties, like RZ/A2?

> +        pins: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-strength:
> +          enum: [ 2, 4, 8, 12 ]
> +        power-source:
> +          enum: [ 1800, 2500, 3300 ]
> +        slew-rate: true
> +        gpio-hog: true
> +        gpios: true
> +        input-enable: true
> +        output-high: true
> +        output-low: true
> +        line-name: true

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-rzg2l.h

include/dt-bindings/pinctrl/rzg2l-pinctrl.h, for consistency?

> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G2{L,LC} pinctrl bindings.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RZG2L_H
> +#define __DT_BINDINGS_PINCTRL_RZG2L_H

__DT_BINDINGS_RZG2L_PINCTRL_H

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
