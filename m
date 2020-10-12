Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A7228AD11
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 06:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgJLEgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 00:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgJLEgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 00:36:33 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7088CC0613CE;
        Sun, 11 Oct 2020 21:36:31 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id b10so5616839qvf.0;
        Sun, 11 Oct 2020 21:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXUPAN9Z/Rz81n54Jgt5lcjYMAq/GQtzgsE1D7f7Lqs=;
        b=B19LJQL9gNGI+USiJENNYytqaiV5DjBYIqvpRcM4f0uuaRtEAJZVsqUgpPjQybYOqb
         XS7fFa0UAHxfp+NmnpYipKQzuEdUOEvkthL2e+BCgzbqmRKfJkHkQkOxueWaAaaDbKR5
         nGMTunzsNI2KBSjbEGykVgY1SJUZAgvCU+G7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXUPAN9Z/Rz81n54Jgt5lcjYMAq/GQtzgsE1D7f7Lqs=;
        b=tAL0wlG8ZvY04S73is1hwwXZLGS9cWvK7jcom8NQTr3n0lQp839NWWkc7lrOc30USx
         WKv/I2BNCURebNZgyyVdIt5VWg9OBuHgdyY5YOvaEWkB3I6tZpj1rkCMcvxk6KR57fRL
         MpT5rQptjvHTxGgT8qD1B0W9bT+4L/ekss/dTGmznstQh/cHmw7HdriTRK3ugrVPoqna
         BcdfubArd/v+yHcnuZgT4gatg+HWVhI3bD6tQV8HNicsMPuu5LOQPbL/qLYa4wYTxN3T
         ByWeeg+vCXo3vjikZIkeGHUjUU1InmLOYzyx5Et8RPpBAtlx5mzYLpj2BjO0A4NNnPQR
         wAlA==
X-Gm-Message-State: AOAM531m9C9sqvXygQmXOO2QESxiuY6DsGVa2sOJj6V9BO56ihJcONmO
        UtF67Snf9CCZWo/YY8xVOcN3zUcRMaQoo8g6H4g=
X-Google-Smtp-Source: ABdhPJxBhJAIvzG71POJdVwegvk4Xn31ZRbhnVpA7O9tP5UNzHH66QXopvBFonDa5shlTkdaW2qLchh321d18YE5Jok=
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr7674902qvx.18.1602477390583;
 Sun, 11 Oct 2020 21:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com> <20201012033150.21056-4-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-4-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 12 Oct 2020 04:36:18 +0000
Message-ID: <CACPK8Xc2vo6cvDHBiLN+a+k+wLG2VCynVHZgq6EtZjnNVjNNxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
To:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> At ast2600a1 we change feature of master sgpio to 2 sets.
> So this patch is used to add the pinctrl setting of the new sgpio.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Linus, can you take this through the pinctrl tree? The patch to the
will be fine to come through your tree as we rarely update that file.

> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  5 ++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30 +++++++++++++++++++---
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..a16ecf08e307 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -862,6 +862,11 @@
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
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..b673a44ffa3b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -46,8 +46,10 @@
>  #define SCU620         0x620 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634         0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638         0x638 /* Disable GPIO Internal Pull-Down #6 */
> +#define SCU690         0x690 /* Multi-function Pin Control #24 */
>  #define SCU694         0x694 /* Multi-function Pin Control #25 */
>  #define SCU69C         0x69C /* Multi-function Pin Control #27 */
> +#define SCU6D0         0x6D0 /* Multi-function Pin Control #28 */
>  #define SCUC20         0xC20 /* PCIE configuration Setting Control */
>
>  #define ASPEED_G6_NR_PINS 256
> @@ -81,13 +83,21 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>  #define K26 4
>  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
>  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4),
> +                         SIG_DESC_CLEAR(SCU410, 4), SIG_DESC_CLEAR(SCU4B0, 4),
> +                         SIG_DESC_CLEAR(SCU690, 4));
> +PIN_DECL_3(K26, GPIOA4, SGPM2CLK, MACLINK1, SCL13);
>  FUNC_GROUP_DECL(MACLINK1, K26);
>
>  #define L24 5
>  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
>  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5),
> +                         SIG_DESC_CLEAR(SCU410, 5), SIG_DESC_CLEAR(SCU4B0, 5),
> +                         SIG_DESC_CLEAR(SCU690, 5));
> +PIN_DECL_3(L24, GPIOA5, SGPM2LD, MACLINK2, SDA13);
>  FUNC_GROUP_DECL(MACLINK2, L24);
>
>  FUNC_GROUP_DECL(I2C13, K26, L24);
> @@ -95,16 +105,26 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
>  #define L23 6
>  SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
>  SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
> -PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6),
> +                         SIG_DESC_CLEAR(SCU410, 6), SIG_DESC_CLEAR(SCU4B0, 6),
> +                         SIG_DESC_CLEAR(SCU690, 6));
> +PIN_DECL_3(L23, GPIOA6, SGPM2O, MACLINK3, SCL14);
>  FUNC_GROUP_DECL(MACLINK3, L23);
>
>  #define K25 7
>  SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
>  SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
> -PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7),
> +                         SIG_DESC_CLEAR(SCU410, 7), SIG_DESC_CLEAR(SCU4B0, 7),
> +                         SIG_DESC_CLEAR(SCU690, 7));
> +PIN_DECL_3(K25, GPIOA7, SGPM2I, MACLINK4, SDA14);
>  FUNC_GROUP_DECL(MACLINK4, K25);
>
>  FUNC_GROUP_DECL(I2C14, L23, K25);
> +/*SGPM2 is A1 Only */
> +FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
>
>  #define J26 8
>  SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
> @@ -2060,6 +2080,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
>         ASPEED_PINCTRL_GROUP(EMMCG4),
>         ASPEED_PINCTRL_GROUP(EMMCG8),
>         ASPEED_PINCTRL_GROUP(SGPM1),
> +       ASPEED_PINCTRL_GROUP(SGPM2),
>         ASPEED_PINCTRL_GROUP(SGPS1),
>         ASPEED_PINCTRL_GROUP(SIOONCTRL),
>         ASPEED_PINCTRL_GROUP(SIOPBI),
> @@ -2276,6 +2297,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
>         ASPEED_PINCTRL_FUNC(SD1),
>         ASPEED_PINCTRL_FUNC(SD2),
>         ASPEED_PINCTRL_FUNC(SGPM1),
> +       ASPEED_PINCTRL_FUNC(SGPM2),
>         ASPEED_PINCTRL_FUNC(SGPS1),
>         ASPEED_PINCTRL_FUNC(SIOONCTRL),
>         ASPEED_PINCTRL_FUNC(SIOPBI),
> --
> 2.17.1
>
