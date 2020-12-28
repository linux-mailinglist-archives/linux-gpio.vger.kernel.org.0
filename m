Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C972E36E4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgL1MEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgL1MEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:04:47 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583CDC061799
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:04:07 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m25so23332489lfc.11
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
        b=N1BqInflZaVkvS7OFqtKtFNbJwXS2drGzzeilgbCkGVgaiLQmFNXnkD3V63iRuyHKz
         udNkBwZ36/VzHCTQyP5bca9C20HcAso3QK8/CgxbDfL9OgeajAJUeSjw2nfvsjeNC2nK
         MpWHHj0Ja2brGRTMNCGa+srTnvBBf7TjyqD+CG+8WP38Ii9f2Ww72QkibJAOmqsDkcug
         0uj7e0+zoKOdP6t7uYVhJCFNvM7mYGIFyqwUi5GV0xzpTU8WT7Q2IXfwrXzGjuuQAb0T
         8MDzKyjIDVpeLaC5XGDwD1NQrPeq+RcpUnitfgupN5enVgEkOZNiowEEYOGnkRqVzfPg
         og9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
        b=ukjJvvPtgOQKam2P56UkQLwNpAaHnwmCl58YRqW9/ykg5vNeB972hqyCgJBTYjG3g3
         MLMBVs7MLpWKRQmOlRLS0J4p/9R3g9ytd/aoJZsoIBKmYVyqT8UNwp2zOUHzVVJGDEts
         HfpU1l0p22YDgRxIGZW5UPfvx1VQGZXpy+YbqPmKsR0pKYnSQY0WRyn3ioGYjZWp5ofL
         oLfDu3Z4LCCCMIQibmpCeYUzspJZgLPEooCRRwKoWnX1KBFCxFLcBl9jP3wfJ/VWmcBK
         OloZEqRYKT5u+zFJJU0IrHPQj4K2p6HtWEziOjffsotpEAZVArqVile4Vb/kj2bt9gi3
         ZNog==
X-Gm-Message-State: AOAM5326IQJPhibub5hUX4/xjjB/kOmJStdjhRT3tyt4JRy9ith/q6Nl
        lNjO8B1Aw5yphXWseABp0y69DUrEGWS4xT4PJfpb+A==
X-Google-Smtp-Source: ABdhPJwYYejAn6DdechGz0yOHYEnzIsJPixk6roStHOZHb1jzFU8Cj9/i9DfQ/AmCZ4lIUR/9bTbJuRcfbZzNPP4pyU=
X-Received: by 2002:a05:651c:22b:: with SMTP id z11mr21023290ljn.38.1609157045775;
 Mon, 28 Dec 2020 04:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-7-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-7-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:33:52 +0530
Message-ID: <CAAhSdy1Hud+6m6Pqrj9808G4+j54Y0KK66b2cX=dFBWoJ31X1Q@mail.gmail.com>
Subject: Re: [PATCH v10 06/23] riscv: Fix Canaan Kendryte K210 device tree
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Remove the clocks property from the cpu and clint nodes as these are
> ignored. Also remove the clock-frequency property from the cpu nodes as
> riscv relies on the timebase-frequency property.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index d2d0ff645632..354b263195a3 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -38,8 +38,6 @@ cpu0: cpu@0 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -56,8 +54,6 @@ cpu1: cpu@1 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu1_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -101,7 +97,6 @@ clint0: clint@2000000 {
>                         reg = <0x2000000 0xC000>;
>                         interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>                                                 &cpu1_intc 3 &cpu1_intc 7>;
> -                       clocks = <&sysctl K210_CLK_ACLK>;
>                 };
>
>                 plic0: interrupt-controller@c000000 {
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
