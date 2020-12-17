Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F152DCD6A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 09:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgLQIKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 03:10:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:34864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgLQIKm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 03:10:42 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608192601;
        bh=T619GpfnsNUVG7ybqE3r/JQVeRBCmUlACnAIeSE4AqA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OM8byHptyPa3OKLYRZOSAc14KRCWWU1twEt5rHxS5eARrOH+ZysLdhvatygQavIuc
         0XflD+WPOVqpB2O3RrIhZoKGYIm9oBcBShJRRcVLzRqdDhGQKI+tkuvYXpgA2UFIeN
         j10zGERr8pnso5JmPFsgLcGHrtZhoFeUjUrDg1oJ+Fyw5GOwUVrNBP0WxGKN79BXBu
         eNIz2MLeP1qvE6rVisggyUS9kU6riYJnpzLv47VNzBgDIlYopQx01HhIpQ3sCcQpSy
         C933xf963fhkOCz0zo9SpIVXWtkZhHuX9i9tGPDfOqZZt5aZSS/Yt58CG58bzjEjjM
         fRu9mOjfIn4Zw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201213135056.24446-10-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-10-damien.lemoal@wdc.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Thu, 17 Dec 2020 00:09:59 -0800
Message-ID: <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-13 05:50:42)
> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/c=
lock/k210-clk.h
> index 5a2fd64d1a49..b2de702cbf75 100644
> --- a/include/dt-bindings/clock/k210-clk.h
> +++ b/include/dt-bindings/clock/k210-clk.h
> @@ -3,18 +3,51 @@
>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>   */
> -#ifndef K210_CLK_H
> -#define K210_CLK_H
> +#ifndef CLOCK_K210_CLK_H
> +#define CLOCK_K210_CLK_H
> =20
>  /*
> - * Arbitrary identifiers for clocks.
> - * The structure is: in0 -> pll0 -> aclk -> cpu
> - *
> - * Since we use the hardware defaults for now, set all these to the same=
 clock.
> + * Kendryte K210 SoC clock identifiers (arbitrary values).
>   */
> -#define K210_CLK_PLL0   0
> -#define K210_CLK_PLL1   0
> -#define K210_CLK_ACLK   0
> -#define K210_CLK_CPU    0

This seems to open a bisection hole. I see that ACLK is used in the
existing dtsi file, and that is the same as CLK_CPU, but after this
patch it will change to not exist anymore. Can we leave ACLK around
defined to be 0? I imagine it won't be used in the future so we can
remove it later. I can then apply this for v5.11-rc1 and then merge the
clk driver patch in clk tree.

> +#define K210_CLK_CPU   0
> +#define K210_CLK_SRAM0 1
> +#define K210_CLK_SRAM1 2
