Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E6938FBAE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 09:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhEYHau (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 03:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbhEYHat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 03:30:49 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD995C061574;
        Tue, 25 May 2021 00:29:20 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id h20so13996978qko.11;
        Tue, 25 May 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4BA6UqvX9jBO1xKa7XUgf1vBNEjKeOfkciRH4B0dC6U=;
        b=COoIlADa7tLJQD4D95gezEkwp+5F4j8gn7yVIWYsnmw45zVtD4vK9Ao1/x7B0sAMxB
         pRDMzB8VXzkHizzKtXatIBESytLxPsicU5ezsNYTxaV/ROtdyK/865mXzdXQx8Cfq65X
         1Tbod/AnylIzvh6WfM1u2KOVASHRYHds+ine4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BA6UqvX9jBO1xKa7XUgf1vBNEjKeOfkciRH4B0dC6U=;
        b=BEpHv2zqwQyuSwq4HHgun2Qgk4UidTAa3xwb8JGneia4v/fUky8xlNNLuRItX+7RXU
         rprnk4YekafIRSeTVrznDgrllwbzR2OJsh8rsJcHvMfsFD1EzR+NdEXt+zMGf7n1M1c9
         bAjjl1aLV7ld4RHVmZOc67PHGN9sPt376rrDUCRSg7l8oPcCLAq1IZdNXxbxF1Et7w+8
         dejG633hZ6t2qMdTUIf7JgOiFtD3O4DDkE59KcmuCwS1eytYzzSARcbAbkjUarzjYOp5
         +tBmKvkVDg3D9F6MAWE6AhNHUUvFas2oN58AQya7xD0lnzYi3SGl4jVEpLxEvr/AKtzO
         Tvxw==
X-Gm-Message-State: AOAM531OBcUmHMLLcvPXh7t6cwXREWxkujqUDvhERaUnMAwLZ+bd1/pk
        nm7XyuoYNxPGSU5jOLvstZl2yFzlZu/EzQrg00s=
X-Google-Smtp-Source: ABdhPJxKzrDa3VSpt0hXXJcRKDzsseymcQy9t4uFIRJUAQJ3ZUN47DWvKG2QIYS04WN6l520oVab/lNi/ety+HreRjs=
X-Received: by 2002:a37:6442:: with SMTP id y63mr5995781qkb.273.1621927759742;
 Tue, 25 May 2021 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com> <20210525055308.31069-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-3-steven_lee@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 25 May 2021 07:29:07 +0000
Message-ID: <CACPK8XcgqmYWw3uL=3zckweepnM0vMucuPU1THPCNowjCkka5w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 25 May 2021 at 05:53, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Linus, feel free to take this entire series through your tree.

> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..7e90d713f5e5 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -862,11 +862,21 @@
>                 groups = "SGPM1";
>         };
>
> +       pinctrl_sgpm2_default: sgpm2_default {
> +               function = "SGPM2";
> +               groups = "SGPM2";
> +       };
> +
>         pinctrl_sgps1_default: sgps1_default {
>                 function = "SGPS1";
>                 groups = "SGPS1";
>         };
>
> +       pinctrl_sgps2_default: sgps2_default {
> +               function = "SGPS2";
> +               groups = "SGPS2";
> +       };
> +
>         pinctrl_sioonctrl_default: sioonctrl_default {
>                 function = "SIOONCTRL";
>                 groups = "SIOONCTRL";
> --
> 2.17.1
>
