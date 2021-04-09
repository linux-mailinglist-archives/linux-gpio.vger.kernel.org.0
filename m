Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EC83592F4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 05:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhDIDTW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 23:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbhDIDTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 23:19:21 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113AAC061760;
        Thu,  8 Apr 2021 20:19:09 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id m16so2587468qtx.9;
        Thu, 08 Apr 2021 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tlsotF4H+AmLvxNjD/snhIqz+CJm5ffNylMiriBTrI=;
        b=JtXchGW/69XHEdWjps7WnhWcSL4QJKiCa+XoD9A9oJ5iGzSPpM8sJ9LgZt8xOTiyxq
         p/as1e9vX72qXH3SNByu502tI5MFomxlGMI3KtPNyxcZrVcDVjqt+pqwNAZJyMsok57/
         wu0/XWL/CNfYhAPGDbWWrgs7ZxvAeX2WAZmJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tlsotF4H+AmLvxNjD/snhIqz+CJm5ffNylMiriBTrI=;
        b=UIoJ92SMSsSeKC8RUYAc/fWEfV4v0NIp9db74mrzLpYCwRDgMfgYpOCrfA2ebGyvnE
         PAsxQ7bY4msMDwsmDSO37cGKA+sV2EWBTvHUZisjaM+EmIOd+0noLvppF6+yKbTYQOcK
         bGZ7QWpnYqOmXx2VyQ49HGUkACHmmsp9IRdk1ro/X6rHeSHtfIUCtukBSbc4qzhxK1xR
         JTAksvqn0rlN1H5fzZiBitRKkqnwwWOvlSy1bs6AW9sbBvdAW1dDKNj2Z3gfMHY2HcnP
         QxHnsWkdBDztQKhh4V0ql3aunHawEVuVmub8BCYEV4vJbgvb2QUmOUBV/V6ruEFemIDQ
         skwA==
X-Gm-Message-State: AOAM530W4xUSOcwUUllo5sBEH3WElYnn+jNRucvNRJefkizmnGlTt+Ko
        G8c7LY2VM31UAiWDQNsOzoh8BbFo/VBSNmxpmrQ/bL9b
X-Google-Smtp-Source: ABdhPJz4xEUAC6m97NKz1UjwDx/kiYVvZRBIBprh3OJLwWO9Waj9drc7EI7fMCOOoJmw7S4anNcOgjtvJOf2NrXgzpA=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr10453274qta.135.1617938348141;
 Thu, 08 Apr 2021 20:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 9 Apr 2021 03:18:55 +0000
Message-ID: <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: aspeed-lpc: Remove LPC partitioning
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.

Is this accurate:

 The node examples change their reg address to be an offset from the
LPC HC to be an offset from the base of the LPC region.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
>  1 file changed, 25 insertions(+), 75 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index d0a38ba8b9ce..936aa108eab4 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a slave on the bus
>  conditions it can also take the role of bus master.
>
>  The LPC controller is represented as a multi-function device to account for the
> -mix of functionality it provides. The principle split is between the register
> -layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> -"basically compatible with the [LPC registers from the] popular BMC controller
> -H8S/2168[1]", and everything else, where everything else is an eclectic
> -collection of functions with a esoteric register layout. "Everything else",
> -here labeled the "host" portion of the controller, includes, but is not limited
> -to:
> +mix of functionality, which includes, but is not limited to:
>
>  * An IPMI Block Transfer[2] Controller
>
> @@ -44,80 +38,36 @@ Required properties
>  ===================
>
>  - compatible:  One of:
> -               "aspeed,ast2400-lpc", "simple-mfd"
> -               "aspeed,ast2500-lpc", "simple-mfd"
> -               "aspeed,ast2600-lpc", "simple-mfd"
> +               "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> +               "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> +               "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
>
>  - reg:         contains the physical address and length values of the Aspeed
>                  LPC memory region.
>
>  - #address-cells: <1>
>  - #size-cells: <1>
> -- ranges:      Maps 0 to the physical address and length of the LPC memory
> -                region
> -
> -Required LPC Child nodes
> -========================
> -
> -BMC Node
> ---------
> -
> -- compatible:  One of:
> -               "aspeed,ast2400-lpc-bmc"
> -               "aspeed,ast2500-lpc-bmc"
> -               "aspeed,ast2600-lpc-bmc"
> -
> -- reg:         contains the physical address and length values of the
> -                H8S/2168-compatible LPC controller memory region
> -
> -Host Node
> ----------
> -
> -- compatible:   One of:
> -               "aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> -               "aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> -               "aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
> -
> -- reg:         contains the address and length values of the host-related
> -                register space for the Aspeed LPC controller
> -
> -- #address-cells: <1>
> -- #size-cells: <1>
> -- ranges:      Maps 0 to the address and length of the host-related LPC memory
> +- ranges:      Maps 0 to the physical address and length of the LPC memory
>                  region
>
>  Example:
>
>  lpc: lpc@1e789000 {
> -       compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +       compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
>         reg = <0x1e789000 0x1000>;
>
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x0 0x1e789000 0x1000>;
>
> -       lpc_bmc: lpc-bmc@0 {
> -               compatible = "aspeed,ast2500-lpc-bmc";
> +       lpc_snoop: lpc-snoop@0 {
> +               compatible = "aspeed,ast2600-lpc-snoop";
>                 reg = <0x0 0x80>;
> -       };
> -
> -       lpc_host: lpc-host@80 {
> -               compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> -               reg = <0x80 0x1e0>;
> -               reg-io-width = <4>;
> -
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -               ranges = <0x0 0x80 0x1e0>;
> +               interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +               snoop-ports = <0x80>;
>         };
>  };
>
> -BMC Node Children
> -==================
> -
> -
> -Host Node Children
> -==================
>
>  LPC Host Interface Controller
>  -------------------
> @@ -149,14 +99,12 @@ Optional properties:
>
>  Example:
>
> -lpc-host@80 {
> -       lpc_ctrl: lpc-ctrl@0 {
> -               compatible = "aspeed,ast2500-lpc-ctrl";
> -               reg = <0x0 0x80>;
> -               clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -               memory-region = <&flash_memory>;
> -               flash = <&spi>;
> -       };
> +lpc_ctrl: lpc-ctrl@80 {
> +       compatible = "aspeed,ast2500-lpc-ctrl";
> +       reg = <0x80 0x80>;
> +       clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +       memory-region = <&flash_memory>;
> +       flash = <&spi>;
>  };
>
>  LPC Host Controller
> @@ -179,9 +127,9 @@ Required properties:
>
>  Example:
>
> -lhc: lhc@20 {
> +lhc: lhc@a0 {
>         compatible = "aspeed,ast2500-lhc";
> -       reg = <0x20 0x24 0x48 0x8>;
> +       reg = <0xa0 0x24 0xc8 0x8>;
>  };
>
>  LPC reset control
> @@ -192,16 +140,18 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>
>  Required properties:
>
> - - compatible:         "aspeed,ast2600-lpc-reset" or
> -                       "aspeed,ast2500-lpc-reset"
> -                       "aspeed,ast2400-lpc-reset"
> + - compatible:         One of:
> +                       "aspeed,ast2600-lpc-reset";
> +                       "aspeed,ast2500-lpc-reset";
> +                       "aspeed,ast2400-lpc-reset";
> +
>   - reg:                        offset and length of the IP in the LHC memory region
>   - #reset-controller   indicates the number of reset cells expected
>
>  Example:
>
> -lpc_reset: reset-controller@18 {
> +lpc_reset: reset-controller@98 {
>          compatible = "aspeed,ast2500-lpc-reset";
> -        reg = <0x18 0x4>;
> +        reg = <0x98 0x4>;
>          #reset-cells = <1>;
>  };
> --
> 2.27.0
>
