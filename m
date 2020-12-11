Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DF82D7453
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 11:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394313AbgLKKz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 05:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394304AbgLKKzs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 05:55:48 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DF6C0613CF;
        Fri, 11 Dec 2020 02:55:33 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id q7so3946055qvt.12;
        Fri, 11 Dec 2020 02:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QdoHrrkUrH8spW9hsEUvaf3pNxGmQYKrvERe+V2jfHg=;
        b=H6Qt7rRq8Fac2RnPo2pkZ1qhIcBIxMjQwW5Npu+JAavqN3A3YZtPNIl+OKFz1WjBSt
         7+08A1Zl7oNG/REpAOqWpIIjwmRgbZOdSr623jO38G7Db/iCQzcq922mO6yaugojE+wG
         bM00Smh0iZ5ZTdxY/Oif228zNpjFuhYTfkO7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QdoHrrkUrH8spW9hsEUvaf3pNxGmQYKrvERe+V2jfHg=;
        b=DAWxCitue30yTBb6Bz3DlUGqBst5dW4HNn6Pa7bkP0hGuk6SevnX2KExZvKUwrvLU2
         MwjEu88x6CtPj1s51kWMd7TQ21HGypOP6DD/HW8mvrHpQEw0JTIFlvMxK/ZCAQwV3tUW
         CuAFFYNNMC6J+KfDipUsynTRbhB8LYKhaks5Wy++fXBOmGg0wUmRial2x6LSbEgaAKx1
         pIzJ+1XXtc6Mj8m1UFYPdCyBHl89DT3jovx580G3fpA0BO/n2Nt8AcW9cJk2vMSnqvFQ
         wxOoYeV4nm6omdB9L97E5Tw23oGOYmcrp0WOWHZLfA68mOJuMCmbKDCe4eL3LlA5fTYW
         VMSQ==
X-Gm-Message-State: AOAM532wdSC+2XhigmqZGJCg6gHJecXnzlAJCShV/4asdrFCxgpchjJe
        VNKL+mhTddDHnMCZhiysfnurRKrM8sqDO/l8i7YcDc+jWi8=
X-Google-Smtp-Source: ABdhPJzZwGieUQ4L65aIz5AhrZ471LVCKHRMGZT2IlzX+vcQSL+UVzLS7K96G6okZZjsaSYt7Tj+OqqmRqZCEsS2UTw=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr15146718qvd.16.1607684132584;
 Fri, 11 Dec 2020 02:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20201211031741.23711-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201211031741.23711-1-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Dec 2020 10:55:21 +0000
Message-ID: <CACPK8XdDn7GfGKAwZnoZrFc5wZW4p=xMuLmCcHvEyyNJZ8rGvw@mail.gmail.com>
Subject: Re: [PATCH] driver: aspeed: g6: Fix PWMG0 pinctrl setting
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Dec 2020 at 03:18, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
> Besides that, When PWM8~15 of PWMG0 set it needs to clear SCU414 bits at
> the same time.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 26 ++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..6e61f045936f 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -346,50 +346,58 @@ FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
>  FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
>
>  #define D22 40
> -SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8))

Is this missing a semicolon?

> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8),
> +                       SIG_DESC_CLEAR(SCU414, 8));
