Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D791E35D3E6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 01:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbhDLXWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 19:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbhDLXWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 19:22:48 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7057AC061574;
        Mon, 12 Apr 2021 16:22:29 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id h7so11375268qtx.3;
        Mon, 12 Apr 2021 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUN8tSeSOnf7DAkPqNQanB/rFs0da6WdiLNb6KUhk6s=;
        b=vB2w0y1h4Ef8oVhbqXA1cZCrsfvvJLt3EDVgYFW4xa1T7icicCaz/dGEbCvCdZ5Sq5
         815+75lH4znEV2R97bC2YmM00/AZkUaJ3RBkGRT3rdS+UBGQ0WMhS6DcDRVVrHEBxRDq
         8yG3NICtoDJgUhtQMIfk5dSqnRotcbOcinDkD2BVcq0PBD3OwRkYf6FQ5MKcQZWeDJxV
         3ZvyPYr1dRrpGCUqeE2jjWjKnWeEnbv+74HFi6+mSGYWKJobBCZhZ3+Nzw41B6OVnoWI
         kf2UphxBHYBH6BCenkc9FjnjF/Wz+6qHyqOD18oLtUzUGEemwefmbXaYXD0RjxVbv4iW
         GC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUN8tSeSOnf7DAkPqNQanB/rFs0da6WdiLNb6KUhk6s=;
        b=GM42A6Dy6LTludAXV3yMKZfu4a8lbdpy1+K8BAolnTMyBHAz62W350UFB5lWZZtCwt
         ci6A501idGlNs8nyH/IVNsF+DkoEIGUfBHM2wQKBzp8A98tUD/AeqPJYRYixaYV0Ous1
         GfSWZMUdWt8XumkrkQgu/o7QKoplxb0lLpb2gUjnWJYq967SwKAJ1ZHG5q6IMaauV7Od
         TqDnmam2lm1Amz4u6rJTI9RfjRbWNrKipKrGKD5chgRU3SjYCJuu0xqmrrh1smukdBeD
         NZ1r+4NAbFxorgKRElJ8+eSR/ce/uNl66bdsIkX0K0HQ0Nfupd2tX8RPIvdrwjwLlEQj
         oT3w==
X-Gm-Message-State: AOAM533QmYAP08ISbDuT/dACT51YABlQJEocJlaXpNc8jTKl7fb/ISAz
        wIKSKUQlYtmO1oMyt4mkHHGUpy5vhPfMmvY0pFA=
X-Google-Smtp-Source: ABdhPJznh7/pGX/O2H6YmpOs21DYtphA0HiiIUimdzJayeF/wu2KIzIQu0vLTkiM/NpY5EvB7/qLo8DYJKbX0ubwvvo=
X-Received: by 2002:ac8:4899:: with SMTP id i25mr15866226qtq.59.1618269748446;
 Mon, 12 Apr 2021 16:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210412223617.8634-1-jbx6244@gmail.com> <20210412223617.8634-3-jbx6244@gmail.com>
In-Reply-To: <20210412223617.8634-3-jbx6244@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 12 Apr 2021 19:22:17 -0400
Message-ID: <CAMdYzYqTS-qEOaVsnWMSABpj5Z55An_GLCUoOZZg-fjMp9qi8w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: change gpio nodenames
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 6:38 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Currently all gpio nodenames are sort of identical to there label.
> Nodenames should be of a generic type, so change them all.

Currently the rockchip pinctrl driver checks np->name against the
bank->name and if they do not match it does not set the gpio-bank as
valid.
The new GPIO driver appears to follow a similar method.
This will break the driver without a correction.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pinctrl/pinctrl-rockchip.c?h=next-20210412#n3836

>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi   |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3308.dtsi | 10 +++++-----
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 +++++-----
>  5 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 939440015..96924e05a 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1247,7 +1247,7 @@
>                 #size-cells = <2>;
>                 ranges;
>
> -               gpio0: gpio0@ff040000 {
> +               gpio0: gpio@ff040000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff040000 0x0 0x100>;
>                         interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1259,7 +1259,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio1: gpio1@ff250000 {
> +               gpio1: gpio@ff250000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff250000 0x0 0x100>;
>                         interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1271,7 +1271,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio2: gpio2@ff260000 {
> +               gpio2: gpio@ff260000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff260000 0x0 0x100>;
>                         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1283,7 +1283,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio3: gpio3@ff270000 {
> +               gpio3: gpio@ff270000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff270000 0x0 0x100>;
>                         interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> index 00844a0e0..ba7dee2e8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> @@ -688,7 +688,7 @@
>                 #size-cells = <2>;
>                 ranges;
>
> -               gpio0: gpio0@ff220000 {
> +               gpio0: gpio@ff220000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff220000 0x0 0x100>;
>                         interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> @@ -699,7 +699,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio1: gpio1@ff230000 {
> +               gpio1: gpio@ff230000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff230000 0x0 0x100>;
>                         interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> @@ -710,7 +710,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio2: gpio2@ff240000 {
> +               gpio2: gpio@ff240000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff240000 0x0 0x100>;
>                         interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> @@ -721,7 +721,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio3: gpio3@ff250000 {
> +               gpio3: gpio@ff250000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff250000 0x0 0x100>;
>                         interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> @@ -732,7 +732,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio4: gpio4@ff260000 {
> +               gpio4: gpio@ff260000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff260000 0x0 0x100>;
>                         interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index c2ca358c7..858d52e2d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -1019,7 +1019,7 @@
>                 #size-cells = <2>;
>                 ranges;
>
> -               gpio0: gpio0@ff210000 {
> +               gpio0: gpio@ff210000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff210000 0x0 0x100>;
>                         interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1032,7 +1032,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio1: gpio1@ff220000 {
> +               gpio1: gpio@ff220000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff220000 0x0 0x100>;
>                         interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1045,7 +1045,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio2: gpio2@ff230000 {
> +               gpio2: gpio@ff230000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff230000 0x0 0x100>;
>                         interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1058,7 +1058,7 @@
>                         #interrupt-cells = <2>;
>                 };
>
> -               gpio3: gpio3@ff240000 {
> +               gpio3: gpio@ff240000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff240000 0x0 0x100>;
>                         interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> index 7832e26a3..8ae10c434 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -803,7 +803,7 @@
>                 #size-cells = <0x2>;
>                 ranges;
>
> -               gpio0: gpio0@ff750000 {
> +               gpio0: gpio@ff750000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff750000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO0>;
> @@ -816,7 +816,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio1: gpio1@ff780000 {
> +               gpio1: gpio@ff780000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff780000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO1>;
> @@ -829,7 +829,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio2: gpio2@ff790000 {
> +               gpio2: gpio@ff790000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff790000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO2>;
> @@ -842,7 +842,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio3: gpio3@ff7a0000 {
> +               gpio3: gpio@ff7a0000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff7a0000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO3>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 6221b027e..c97a25c70 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1941,7 +1941,7 @@
>                 #size-cells = <2>;
>                 ranges;
>
> -               gpio0: gpio0@ff720000 {
> +               gpio0: gpio@ff720000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff720000 0x0 0x100>;
>                         clocks = <&pmucru PCLK_GPIO0_PMU>;
> @@ -1954,7 +1954,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio1: gpio1@ff730000 {
> +               gpio1: gpio@ff730000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff730000 0x0 0x100>;
>                         clocks = <&pmucru PCLK_GPIO1_PMU>;
> @@ -1967,7 +1967,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio2: gpio2@ff780000 {
> +               gpio2: gpio@ff780000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff780000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO2>;
> @@ -1980,7 +1980,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio3: gpio3@ff788000 {
> +               gpio3: gpio@ff788000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff788000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO3>;
> @@ -1993,7 +1993,7 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> -               gpio4: gpio4@ff790000 {
> +               gpio4: gpio@ff790000 {
>                         compatible = "rockchip,gpio-bank";
>                         reg = <0x0 0xff790000 0x0 0x100>;
>                         clocks = <&cru PCLK_GPIO4>;
> --
> 2.11.0
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
