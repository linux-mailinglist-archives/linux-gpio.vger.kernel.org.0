Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F093B8EE5
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 10:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbhGAIhj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 04:37:39 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:44701 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbhGAIhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 04:37:39 -0400
Received: by mail-ua1-f43.google.com with SMTP id e7so2148267uaj.11;
        Thu, 01 Jul 2021 01:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bpYvv8lA/1j4v7R7NAURrd4Uck8U09k/ENnDW1qf6k=;
        b=M+ohH+lkIrViw+bXY3l8eMu148YOY4a7wRRAICP6iNCOfPBBYc+aqmOGZTjiXTzCF8
         9d+6s3c6N+VieS9EpXd9PgIYwl/72LiYmu91VwXtyPTG2D8ZQmtDZOhZe3hqjubBF9oL
         lvtG3uI1liabPll8WoEs7ZcnIf2eKly7KngvFCylWaA49RriInGF9AZXvB9K2rOCHlGu
         mBFD8ULGzRy+3XLb8AU/gl351E3/hRkE/lE9IhJb9z+ROnEuetddT1HDTHkayj3CZPTO
         KW62khfu6RXzJnYzeEt9j7Em/+8yp65KGrqwvDrFvP1eY1Pthd7Ll8W8B7DFYtGBU9Jt
         eYxQ==
X-Gm-Message-State: AOAM532KvTVeHfopuKU6rmFoYYWaOFsgZUPErfJdSVJh/LKYe/afdC1H
        FcrOyNSX/L7LQM/+yWhfp84BfJLJetUWv1GZxlk=
X-Google-Smtp-Source: ABdhPJwv1SzSKBtSCPdf+iejl9KUHvCm35kUVL+cj+WtMmtHDKpmwGbx1YK1y6nfi8T9nvDLRwwPtfy6XeF7XbGZgAw=
X-Received: by 2002:ab0:71ca:: with SMTP id n10mr2640663uao.106.1625128507544;
 Thu, 01 Jul 2021 01:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-2-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-2-drew@beagleboard.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 10:34:56 +0200
Message-ID: <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio bindings
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
>
> [1] https://github.com/starfive-tech/beaglev_doc
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 GPIO controller
> +
> +maintainers:
> +  - Huan Feng <huan.feng@starfivetech.com>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jh7100-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> +    minItems: 1
> +    maxItems: 32

What about clocks and resets?

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      gpio@11910000 {
> +        compatible = "starfive,jh7100-gpio";
> +        reg = <0x11910000 0x10000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <32>;
> +      };
> +
> +...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
