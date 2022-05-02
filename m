Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5F0516F56
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 14:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384918AbiEBMQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 08:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384622AbiEBMQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 08:16:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95919BFA
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 05:12:35 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y3so27322157ejo.12
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GbW9lhOFF5KXo9xug99W/WsonkZx+ThY9PcaPlAUco=;
        b=Z2TeefYz2wjRgvDurfjRhcnoy/dzOezKzMbKLUxGjxKrPADD4F3ug8uG8RbFD0xwrE
         C1d9orHqdq9vw8ipvahOAC2/z8umXeKMfAbwDaAh7m6kmOlCFZ3IRAK5fkWJQnxV1BNd
         Q+pCkIAoOGJeICcdD0YntlIhYP6lL5Lewe5jei4hgyYDetBN4PzDMWlRo6E+vEp/sA0/
         XIqRHiGsRzC+r0y/1mRc8+R4HHigJw6KM8ySdfhUmRZ2OpNYNtGnZE2j0Sz+Xi/luWKa
         bFpSX/Ze/bLlJcgNYAZfypnde9u6psjRDiLRE8X6bp2eVJVwGa2NdLWO6+1s1puorVyH
         COYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GbW9lhOFF5KXo9xug99W/WsonkZx+ThY9PcaPlAUco=;
        b=cswg4fqWDaMH61+Ec+TaTFHfGZxQQqVoKFA7ICy86UHOojDJ/FX9e6BYHx58RFDNCG
         pvzJnovwkG11PhfA/ieFCpShSNEf2YnuUyIAzgvF5diioi1eaP9yEGIt4KsIEvXF9kXh
         CXFKG6D9BJck4liQCqvQ/oZxJhmmaTCuOXgRPgKm6SY/u35CB6ALClwO0z2kk4D0wiO8
         /1jCTLBxghxW2qP2GDCQO++VNfy0b54jZOOMMb//ccSMUjpWrOokQRB4mtDc/WnoQvEe
         TQTLFTN1e7F6pmuLT+Q2GngbBNOVZwSQv+F27vHiMd/Rhf7h1JlC3lAd66WCNowGim70
         QBfg==
X-Gm-Message-State: AOAM532x0tUlp3C6G4x56wmLhTV0tbODrrKrK9pF0EUodig32HIzGakc
        AHCaHWsv9YRhXeH6xo/TaEiPPSxr04rG5zGlmc5O7A==
X-Google-Smtp-Source: ABdhPJx9cHHsrODR/QKr4vfa+VYk/ZMOeW2OHBi3Px9GgvkczgpK4jBUmP9QqsrWu2s6dNtgCOEcdGJ3nLMscIMeboM=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr10914101ejc.286.1651493554126; Mon, 02
 May 2022 05:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220425111135.1632047-1-peng.fan@oss.nxp.com>
In-Reply-To: <20220425111135.1632047-1-peng.fan@oss.nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 14:12:23 +0200
Message-ID: <CAMRc=MdBgrkva2w-CYkFHpWXFsp1qCP6W9Lm3YuqN2Ox=o3_og@mail.gmail.com>
Subject: Re: [PATCH] gpio: drop the SOC_VF610 dependency for GPIO_VF610
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 25, 2022 at 1:09 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX7ULP, i.MX8 and i.MX9 use this driver, so drop
> the SOC_VF610 dependcy to make the driver could be built
> for i.MX platform.

In the future use `gpio: <driver>: ...` for the commit message.

Applied, thanks!

Bart

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/gpio/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 82a3bda6e047..9f2a076da6af 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -681,10 +681,10 @@ config GPIO_UNIPHIER
>
>  config GPIO_VF610
>         def_bool y
> -       depends on ARCH_MXC && SOC_VF610
> +       depends on ARCH_MXC
>         select GPIOLIB_IRQCHIP
>         help
> -         Say yes here to support Vybrid vf610 GPIOs.
> +         Say yes here to support i.MX or Vybrid vf610 GPIOs.
>
>  config GPIO_VISCONTI
>         tristate "Toshiba Visconti GPIO support"
> --
> 2.25.1
>
