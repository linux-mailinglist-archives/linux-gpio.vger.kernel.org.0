Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17D12CF9D8
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 06:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgLEFr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 00:47:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgLEFr2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Dec 2020 00:47:28 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607147207;
        bh=N9944AoUzOF/flZHzHrrl01FA35Tkc7qrcy9VwvBa84=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EjQZW4pQHa+WwewOqtB4/JLvvH2kll+61Eynml0eR3moC2QcR9IgwB0ChVGSv2UZI
         cyHMcn5X8P76u87HjP+r9oMYJUTVQhcznOa6vKzqO5nJN4X9RLD2tgQmLCDe48sjeU
         0TLWt2HyBWar1nLu5yNoyjb3snc26/T3/mosIEFc7zyULFzTMu12+uXInYPNLLQho3
         cE8K5UucVEc52demwnAmZKOodffzEzajr3iLZOBYt23smAv6DY9kEtMQ6wEtRYVCDq
         xrUQtsYPpnIWBiA3NzVbt8Ins9KgT2cuSg5lgByo55h8ia8FQqKwtnBwlL+zWnw9hx
         WVL7f3SrDCodA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201202032500.206346-8-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com> <20201202032500.206346-8-damien.lemoal@wdc.com>
Subject: Re: [PATCH v4 07/21] dt-binding: clock: Document canaan,k210-clk bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Fri, 04 Dec 2020 21:46:46 -0800
Message-ID: <160714720649.1580929.10979600141579296560@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-01 19:24:46)
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml=
 b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> new file mode 100644
> index 000000000000..3547916a2421
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k210-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K210 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Canaan Kendryte K210 SoC clocks driver bindings. The clock
> +  controller node must be defined as a child node of the K210
> +  system controller node.
> +
> +  See also:
> +  - dt-bindings/clock/k210-clk.h
> +
> +properties:
> +  compatible:
> +    const: canaan,k210-clk
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      System fixed rate oscillator clock.

Is it optional? I suspect not and it can always be specified, so drop
maxItems.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks

Maybe also add clock-names as an optional property, but doesn't really
matter if there's only one clk.
