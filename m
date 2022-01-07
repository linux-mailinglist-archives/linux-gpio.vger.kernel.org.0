Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE76A4874B8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 10:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346463AbiAGJbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 04:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346458AbiAGJbn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jan 2022 04:31:43 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA67C061201
        for <linux-gpio@vger.kernel.org>; Fri,  7 Jan 2022 01:31:42 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id w16so19745422edc.11
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jan 2022 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TezwQvy/GrVo/VcXl6Kmghnct9UHJH58seMMxyEI02A=;
        b=w2V+iJUefGp3KlCNcBsEDN8BorejU5hp+6CahknIVFUn1oU3ZtxwjYoPDxNPziGlUz
         a0NH22cY2sthTfr8gRtlzr68GQu94z9Vv96M1sr/BVNCzMP7KwH1oLc7Y7uPIprMBJGp
         jTor+uLGWD9ND97HWJEqboKIKTNtxd8Zvqy6BGjuUSvq1G+ejn9P6ls5DRx/e8AnqPY1
         oaAsTxnPIOOhhcMRfiaCuwrI7HEMhNpBw6z8s5N4t1kc9kc1BvoA7/mW0OOcWAqSy0qI
         cnNGy3ahX/tVMOrHF3dRzQQbbFBVtWLE/ojZIbe0r6fp77jLr7sD41Ov5rETXekX5g/5
         kEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TezwQvy/GrVo/VcXl6Kmghnct9UHJH58seMMxyEI02A=;
        b=4vEqQ40f0ZCo/tySt6r6M5HD/wRq8/FKa885wj6/Ma7J3u8nhZj9+DdRA3QVg+D/VY
         Tp4tmlXvh8ha9fr0xX1e7NbrBFJal7WWZIlR4Cejj8+NjVVzk+uBqH1dU49/vlxp3bEl
         imPHZb3xBi5kAPZxboaUPXpiYA7+cRbKKzCxgLU50zSievrIiNXUyzdkEikj5Yj5LT6V
         UQH489iUO+zdV5nBC4wXs1tuot2EykXOcJ96HZmwnx7zC7q8XAlqUI3dHtqYGYYBLFY0
         YmEErO8O3ZrZwjuwBC1QAdWgMgUma2/nLvekVPnxGHgrtkEQVVvpHRsvYXTLZm6ZiITY
         sZiw==
X-Gm-Message-State: AOAM532BOSGmM5qe8m7AzY2SAS+5cJ+K2dQL1wlTqRzv+VjS6W9nhhpw
        6cL7d/U75JWJrZ5yvyoY7F08BhRCqOlhTYmOeQmpjQ==
X-Google-Smtp-Source: ABdhPJy6Pd5StasJd8Vr9TrAn4EyS2U33Mwnkud6vbrw4HpmRdCGAwwGrmolTePbriBG/I8s4Z7aITOOhf8mDSkaceA=
X-Received: by 2002:a17:907:386:: with SMTP id ss6mr6976366ejb.101.1641547901133;
 Fri, 07 Jan 2022 01:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 7 Jan 2022 10:31:30 +0100
Message-ID: <CAMRc=MdmOMfyyiguowrU52BvoxMr8u3sLQfzCiY_Rqs=qUsX-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Suman Anna <s-anna@ti.com>, - <patches@opensource.cirrus.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        netdev <netdev@vger.kernel.org>, linux-pci@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 7, 2022 at 4:19 AM Rob Herring <robh@kernel.org> wrote:
>
> 'interrupt-parent' is never required as it can be in a parent node or a
> parent node itself can be an interrupt provider. Where exactly it lives is
> outside the scope of a binding schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>  7 files changed, 15 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> index 9ad470e01953..b085450b527f 100644
> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> @@ -43,7 +43,6 @@ required:
>    - gpio-controller
>    - interrupt-controller
>    - "#interrupt-cells"
> -  - interrupt-parent
>
>  additionalProperties: false
>
> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> index e864d798168d..d433e496ec6e 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> @@ -175,15 +175,6 @@ required:
>    - ti,mbox-num-fifos
>
>  allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          enum:
> -            - ti,am654-mailbox
> -    then:
> -      required:
> -        - interrupt-parent
> -
>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> index 499c62c04daa..5dce62a7eff2 100644
> --- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> +++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
> @@ -221,7 +221,6 @@ required:
>    - '#gpio-cells'
>    - interrupt-controller
>    - '#interrupt-cells'
> -  - interrupt-parent
>    - interrupts
>    - AVDD-supply
>    - DBVDD1-supply
> diff --git a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> index 437502c5ca96..3ce9f9a16baf 100644
> --- a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> +++ b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
> @@ -46,7 +46,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupt-parent
>    - interrupts
>    - interrupt-names
>    - lantiq,tx-burst-length
> diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> index 7bc074a42369..5bc1a21ca579 100644
> --- a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> +++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
> @@ -38,7 +38,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupt-parent
>    - interrupts
>    - interrupt-names
>    - "#address-cells"
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> index 2b9d1d6fc661..72c78f4ec269 100644
> --- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -61,7 +61,6 @@ required:
>    - num-lanes
>    - interrupts
>    - interrupt-names
> -  - interrupt-parent
>    - interrupt-map-mask
>    - interrupt-map
>    - clock-names
> diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> index a2bbc0eb7220..32f4641085bc 100644
> --- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> +++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> @@ -55,7 +55,6 @@ required:
>    - reg-names
>    - "#interrupt-cells"
>    - interrupts
> -  - interrupt-parent
>    - interrupt-map
>    - interrupt-map-mask
>    - bus-range
> --
> 2.32.0
>

For GPIO:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
