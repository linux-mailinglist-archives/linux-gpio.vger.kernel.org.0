Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C0D2DCB45
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 04:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgLQD1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 22:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbgLQD13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 22:27:29 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5759C061794;
        Wed, 16 Dec 2020 19:26:49 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id d11so12680363qvo.11;
        Wed, 16 Dec 2020 19:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNZ7AMe4cLHmnMLAtt8IJmwBucyEmBbRYyBbkl+v2AE=;
        b=ApAyR3W7pn0Xb8qXx9hZLPIzSYkIeQI2mix5QVd2C+XgzRkz9RpKtTZ7rVk5lj01xC
         MpBkXdNQWocvpqCOJIjya7V4JOODwe7obaZNjQwow4ZjWt5m6xsIKUoRKVSgVjkn7N0Q
         x7XN2OQiim6MoCLRLAXTLdlaGytDwax+di+G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNZ7AMe4cLHmnMLAtt8IJmwBucyEmBbRYyBbkl+v2AE=;
        b=Phj0eTbnq8TlWyRBjIQ9Q90eB7KGksdCZsDq4vsiyXmG4Fdrm6FTIWdRMqvhl1f9yX
         Or9pjOXNKRr78FOHhjeViNNyAc+2YivuGWHskgvu4P15mvpctgNpdsIVho2pdWH3cbYE
         hc9EFw4CUQ+ryWOfKmC/wZtoG1U3jCgd2TyMqAXb0/sRQkBxKrPtJsustZuY/LySpSVW
         qaECiMbmCxeBUF4EGJ8zCHOSc3QMtNCwdB/sokuXAzKS3v1qw5uZcVSJaSWbj6D0YzCN
         TfIuTXPhLgvmZkm45eYWDOt6JlNiD5o8jwQiUSfeGY6fAvlRbsWH5qj1tQKS5ynSlnvJ
         oA9w==
X-Gm-Message-State: AOAM533lc74g+xSuSl+RAnY3zteGCH7Lh/lwywddf0UlAUljYWoWZS5H
        tRug8bMp6+hOMQwebv+Yzay7BH7ZvNSJZyPT0yNwlnNHjLM=
X-Google-Smtp-Source: ABdhPJwhJaKeLKSvu+8D7miZDngPk0d8g3gukqn/1/zLmpk8q3A883iEvBLFmrC0s9xac4a2LdojxqGrVQNzLY4uA/A=
X-Received: by 2002:a05:6214:c66:: with SMTP id t6mr45581201qvj.43.1608175608805;
 Wed, 16 Dec 2020 19:26:48 -0800 (PST)
MIME-Version: 1.0
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com> <20201217024912.3198-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 17 Dec 2020 03:26:36 +0000
Message-ID: <CACPK8XenUwdHiFnqHEKgQj=fisnThuDRwrosUm+tG20tdxzg-w@mail.gmail.com>
Subject: Re: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
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

On Thu, 17 Dec 2020 at 02:50, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Billy!

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index b673a44ffa3b..aa53e9d3489b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -367,7 +367,7 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
>
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8));
>  PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
>  GROUP_DECL(PWM8G0, D22);
>
> --
> 2.17.1
>
