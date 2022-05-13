Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A91526AC1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 21:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383946AbiEMTxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 15:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbiEMTxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 15:53:09 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD012B1A1
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 12:53:08 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g6so18209813ejw.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlGl2MaiMBLQI/aO0f7foJ6mZ+PTk9tDqFdYEd8IR2Y=;
        b=oRLlClpAh71GWZTw7oLrDvn+314x3USElC9/aOKcJVhrExVADHaj9ty/lC7N0Vny7n
         TUnDUmGSLZ2BjDH8zLZoquQ7HoZlkkGe/J3gIR5GQt2D7vRnUzXQjFPkG1XH1/2SSYGY
         j+U7YuicTRidxaHCBDWALTEfifSamsYGbTkQgavfIifCnqJCBdWfZrG6fryaf2t5ZiXI
         kcoXuvy++jbnV9kABQ/5FuxUWjpdfAvIMDeaW7pG/+Ac50gZHWOSvG/igleL/1sw8GK5
         dDO/t4uYafKtnXz3/b0dgOt62D2SsdUSOjHCfs1K3KGRs9t52z+vMXLJ4oYvhbkKDTBD
         Xljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlGl2MaiMBLQI/aO0f7foJ6mZ+PTk9tDqFdYEd8IR2Y=;
        b=piSt/jz4hLklZfRkOSSD3kU9gCHHQSU/0uRwqv/HNoTRVnqhpLwuOcirJJacklM2TT
         BsZyWfs9SymcDOh0FD/97+/tR38S5NyPMSpT3TNXw3ecPtKD9yk/QjzNGIH01w5SOUJt
         vrM2j61h4kLXEeTfi1d5QNxPo5aLdrjMtl7Yd+jtENDXbcdbGBMievJVklom/+hbInXf
         Tk+m2LXnK/7YDX2AUzCDSrmWsdnvMBKOA+BNkAa0rxCmz/T2MF/qVF2HRIeY4tnqULzH
         vK7H1cFFTMyztCMCUNDuAIfn/PToFqKDa87Z8yqjKK9zmj5aGTRf++p8yhyAlIPlXNdf
         G9Eg==
X-Gm-Message-State: AOAM5334bcDign+K6pQ5LoyL9ctAERKUKjM6xiSxNWwYorbDrsFsJPaZ
        21918IfY2+Bdl5WRvHdf9HdAx/qNLL0MIpXzHzS58A==
X-Google-Smtp-Source: ABdhPJwRhgKX7mUP6+PQkVOOeZ1xXmDZn3EGxcsqrYJdO18wHGsLKvyb68Uujw+msD4VNJbpMnV00GCR7LQv5g6WxwU=
X-Received: by 2002:a17:907:6d8b:b0:6fe:874:25bf with SMTP id
 sb11-20020a1709076d8b00b006fe087425bfmr3441172ejc.734.1652471586839; Fri, 13
 May 2022 12:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <1652235304-4617-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1652235304-4617-1-git-send-email-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 May 2022 21:52:56 +0200
Message-ID: <CAMRc=Mf_fc9h-8TokbYapVV=mer8b3MQumO=Y9QLgjbKnNh6Cw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-vf610: do not touch other bits when set the
 target bit
To:     haibo.chen@nxp.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 11, 2022 at 4:27 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> For gpio controller contain register PDDR, when set one target bit,
> current logic will clear all other bits, this is wrong. Use operator
> '|=' to fix it.
>
> Fixes: 659d8a62311f ("gpio: vf610: add imx7ulp support")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 20780c35da1b..23cddb265a0d 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -125,9 +125,13 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
>  {
>         struct vf610_gpio_port *port = gpiochip_get_data(chip);
>         unsigned long mask = BIT(gpio);
> +       u32 val;
>
> -       if (port->sdata && port->sdata->have_paddr)
> -               vf610_gpio_writel(mask, port->gpio_base + GPIO_PDDR);
> +       if (port->sdata && port->sdata->have_paddr) {
> +               val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
> +               val |= mask;
> +               vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
> +       }
>
>         vf610_gpio_set(chip, gpio, value);
>
> --
> 2.25.1
>

Applied, thanks!

Bart
