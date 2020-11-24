Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A754B2C220B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgKXJtL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 04:49:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:32877 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgKXJtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 04:49:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id n12so15256003otk.0;
        Tue, 24 Nov 2020 01:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBoBDmbswRP+f/TlioNfn5J/ITMiXwI/C+Hc6TcJgzU=;
        b=awlVAqi149ohU1zRA3TDEJminW+K8I6A+whQW4P1GmL8M8Oi4IPgMMF/2xp4i9GCcd
         4wfalHEvzVnzlq/dRVzTjBWuMSk4sQSGhXWY/5vROFqG1J69g+pCBuoNNFxvQU0t9i11
         +F8nhrZ5HLqpv55oPDSv30LnhYOxc35bMRrHuhkDEthGHeIFPg2U4h1didG7k38dBTLV
         49v/49eEAezJdHdL97pXlsA0dcQU062YJX9xqOAw8LQpQfYHkxuzTFxDcrlKWUEvICLp
         2hUVDZWiYpZivfmujGpY4+LTTeTku8EA2LgKeC6dZ0sWumDD/gg4EVmio3q/8/1qldb0
         vbnA==
X-Gm-Message-State: AOAM5318wyke4HyCchYWGijeXgh+7PHMx5UMLegE/d8vSopyK/asuVc+
        j2rsvSSG3Gjhniavi01rEVWGznqPeJtAcD1wQ4w=
X-Google-Smtp-Source: ABdhPJz6Irq78spBVJCaLnpjMMDP1gMl71i0GUJM0pl7Y1kWkNP5zH9k8WezE7l7eQvPgrURVWHQIqBizil9lQFKdNE=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2653636otc.145.1606211350289;
 Tue, 24 Nov 2020 01:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com> <20201124043728.199852-10-damien.lemoal@wdc.com>
In-Reply-To: <20201124043728.199852-10-damien.lemoal@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Nov 2020 10:48:59 +0100
Message-ID: <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> Fully Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> define all 256 possible pin functions of the SoC IO pins, as well as
> macros simplifying the definition of pin functions in a device tree.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml

> +  canaan,k210-sysctl-power:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      phandle of the K210 system controller node and offset of the its

of its

> +      power domain control register.

Your k210-sysctl-v15 branch has a bogus trailing space here.

> +
> +patternProperties:

> +  '-pins$':
> +    type: object
> +    $ref: /schemas/pinctrl/pincfg-node.yaml
> +    description:
> +      FPIOA client devices use sub-nodes to define the desired
> +      configuration of pins. Client device sub-nodes use the
> +      properties below.
> +
> +    properties:

> +      input-schmitt: true
> +
> +      input-schmitt-enable: true

Do you need both?
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml documents
input-schmitt-enable and input-schmitt-disable, but not input-schmitt.

> +
> +      intput-polarity-invert:

input-polarity-invert

> +        description:
> +          Enable or disable pin input polarity inversion.

Still, this is a non-standard property.  Do you need it, or can this be
handled by the software GPIO_ACTIVE_LOW flag?

> +      output-polarity-invert:
> +        description:
> +          Enable or disable pin output polarity inversion.

Same comment as for input.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
