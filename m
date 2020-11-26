Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E822C51A1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 10:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731421AbgKZJwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 04:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgKZJwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2020 04:52:31 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95075C0613D4;
        Thu, 26 Nov 2020 01:52:31 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id z188so1051546qke.9;
        Thu, 26 Nov 2020 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lhAJwHP75hsl97cC7IiYuLFHgheKFMaUCjy83jp4Xo8=;
        b=hjFNlGqmmrZOvOqgtSKCMkq23TreyWsww2nNG6qSTyjbNybNlEzTAIULz8iEfDfZFr
         1xEj/PepyV12Gz0KFPN13cFk0aRhKPB0kOrbkbcVx4J3o2u4zKyizzGeJUK4hfKF1EuE
         HTgCJ0cpMkiWXjqau3GJ4YaU6OWpnBkl9cMq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lhAJwHP75hsl97cC7IiYuLFHgheKFMaUCjy83jp4Xo8=;
        b=N1iKh/P3rBgoZc+WbJtBNlxo/t8UOXXQUuxOWbdMYy2P8RP6LV7MQYZk9Ru8vFZ626
         5qk3R1K9dc2F2pE5RaI2kmwEAndBlF/Z0gllP0wV15uq+VTQC4aViDqXZTPXz2nKpjSg
         JQ0JIA8TySiNfLAW+pPuFjt6gPjpHjy/AbASxXIO74Q61DH3LXNYHGCL20WWXoov7HEL
         HGGxMDM+xOnMNdP4pvb99W3Y1VUHjXZlFq7kKVyHdABdDHg5LgtEITwtrMwIP3C2sRug
         Mx3sAPmcp1+4khx0WpGMrQUFj1TTCAJqEfwrXhdFhMC1UBDF4bLJoWQApiohG0Vy3APL
         i34Q==
X-Gm-Message-State: AOAM532ylGnZJm2JY5T8k5cT1hrCJTCfqlsLlq4/68whbkQ4A8XAwE4q
        vqrnh0u/eaMppPS74KOOanmRs8VQDwZ3AVZXQjE=
X-Google-Smtp-Source: ABdhPJxBkPAme7JvzEXh0g2dZnoiqdHBTGf5YeQLBNz4RkIbTThw92RlwtAreusQavSct1HU26j3F0mgO8JuE1QS9RU=
X-Received: by 2002:a37:6805:: with SMTP id d5mr2390243qkc.66.1606384350546;
 Thu, 26 Nov 2020 01:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20201126063337.489927-1-andrew@aj.id.au>
In-Reply-To: <20201126063337.489927-1-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 26 Nov 2020 09:52:18 +0000
Message-ID: <CACPK8XeWH0269EGg6=CRSrsk0U5tQNJkmgNP=FKuRPpbE-vpeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO requests on pass-through banks
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 26 Nov 2020 at 06:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Commit 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> fixes access to GPIO banks T and U on the AST2600.

...but caused a regression when muxing GPIOs.


> Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I didn't read all of the text, but the code change looks good. This
should go to stable as the offending commit was also added to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Cc: stable@vger.kernel.org


> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 74 +++++++++++++++++++++++--
>  drivers/pinctrl/aspeed/pinmux-aspeed.h  |  7 ++-
>  2 files changed, 72 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 1d603732903f..9c44ef11b567 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -286,14 +286,76 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>  static bool aspeed_expr_is_gpio(const struct aspeed_sig_expr *expr)
>  {
>         /*
> -        * The signal type is GPIO if the signal name has "GPI" as a prefix.
> -        * strncmp (rather than strcmp) is used to implement the prefix
> -        * requirement.
> +        * We need to differentiate between GPIO and non-GPIO signals to
> +        * implement the gpio_request_enable() interface. For better or worse
> +        * the ASPEED pinctrl driver uses the expression names to determine
> +        * whether an expression will mux a pin for GPIO.
>          *
> -        * expr->signal might look like "GPIOB1" in the GPIO case.
> -        * expr->signal might look like "GPIT0" in the GPI case.
> +        * Generally we have the following - A GPIO such as B1 has:
> +        *
> +        *    - expr->signal set to "GPIOB1"
> +        *    - expr->function set to "GPIOB1"
> +        *
> +        * Using this fact we can determine whether the provided expression is
> +        * a GPIO expression by testing the signal name for the string prefix
> +        * "GPIO".
> +        *
> +        * However, some GPIOs are input-only, and the ASPEED datasheets name
> +        * them differently. An input-only GPIO such as T0 has:
> +        *
> +        *    - expr->signal set to "GPIT0"
> +        *    - expr->function set to "GPIT0"
> +        *
> +        * It's tempting to generalise the prefix test from "GPIO" to "GPI" to
> +        * account for both GPIOs and GPIs, but in doing so we run aground on
> +        * another feature:
> +        *
> +        * Some pins in the ASPEED BMC SoCs have a "pass-through" GPIO
> +        * function where the input state of one pin is replicated as the
> +        * output state of another (as if they were shorted together - a mux
> +        * configuration that is typically enabled by hardware strapping).
> +        * This feature allows the BMC to pass e.g. power button state through
> +        * to the host while the BMC is yet to boot, but take control of the
> +        * button state once the BMC has booted by muxing each pin as a
> +        * separate, pin-specific GPIO.
> +        *
> +        * Conceptually this pass-through mode is a form of GPIO and is named
> +        * as such in the datasheets, e.g. "GPID0". This naming similarity
> +        * trips us up with the simple GPI-prefixed-signal-name scheme
> +        * discussed above, as the pass-through configuration is not what we
> +        * want when muxing a pin as GPIO for the GPIO subsystem.
> +        *
> +        * On e.g. the AST2400, a pass-through function "GPID0" is grouped on
> +        * balls A18 and D16, where we have:
> +        *
> +        *    For ball A18:
> +        *    - expr->signal set to "GPID0IN"
> +        *    - expr->function set to "GPID0"
> +        *
> +        *    For ball D16:
> +        *    - expr->signal set to "GPID0OUT"
> +        *    - expr->function set to "GPID0"
> +        *
> +        * By contrast, the pin-specific GPIO expressions for the same pins are
> +        * as follows:
> +        *
> +        *    For ball A18:
> +        *    - expr->signal looks like "GPIOD0"
> +        *    - expr->function looks like "GPIOD0"
> +        *
> +        *    For ball D16:
> +        *    - expr->signal looks like "GPIOD1"
> +        *    - expr->function looks like "GPIOD1"
> +        *
> +        * Testing both the signal _and_ function names gives us the means
> +        * differentiate the pass-through GPIO pinmux configuration from the
> +        * pin-specific configuration that the GPIO subsystem is after: An
> +        * expression is a pin-specific (non-pass-through) GPIO configuration
> +        * if the signal prefix is "GPI" and the signal name matches the
> +        * function name.
>          */
> -       return strncmp(expr->signal, "GPI", 3) == 0;
> +       return !strncmp(expr->signal, "GPI", 3) &&
> +                       !strcmp(expr->signal, expr->function);
>  }
>
>  static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> index f86739e800c3..dba5875ff276 100644
> --- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> @@ -452,10 +452,11 @@ struct aspeed_sig_desc {
>   * evaluation of the descriptors.
>   *
>   * @signal: The signal name for the priority level on the pin. If the signal
> - *          type is GPIO, then the signal name must begin with the string
> - *          "GPIO", e.g. GPIOA0, GPIOT4 etc.
> + *          type is GPIO, then the signal name must begin with the
> + *          prefix "GPI", e.g. GPIOA0, GPIT0 etc.
>   * @function: The name of the function the signal participates in for the
> - *            associated expression
> + *            associated expression. For pin-specific GPIO, the function
> + *            name must match the signal name.
>   * @ndescs: The number of signal descriptors in the expression
>   * @descs: Pointer to an array of signal descriptors that comprise the
>   *         function expression
> --
> 2.27.0
>
