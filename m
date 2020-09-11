Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1F02656F1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 04:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgIKCVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 22:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgIKCV3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 22:21:29 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08418C061756;
        Thu, 10 Sep 2020 19:21:28 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l17so8355878edq.12;
        Thu, 10 Sep 2020 19:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tj2t95Ze73swWD6k2tc6L6Ey6C/gEPP1/6YDyLUTQ8s=;
        b=fUHEbIAzuvX+0lTwzuC8LNuolHbBFlk8nal7opR3A4AYrMOVp5u3EHzNG8XU367FPl
         A1DR6RG7yq3DRgHil/V6nRD0SNEbpfnPWsl0G2WUKz//MHwEPiBRgK3mHYya2lNzQb6P
         Uwg4QaGKgpsFlp4IxLHYNedVFmN86/+OOcgU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tj2t95Ze73swWD6k2tc6L6Ey6C/gEPP1/6YDyLUTQ8s=;
        b=BB7itphNU2pDlrHOlRIiaztI8540W7Ua1HBPusiu4c9nySmV/UY14X+CFpJ7EJORwL
         0Fd6wfRnRMZ+f5P7bcFCPzit1oHzZB4dJSSY76CtAzCZQTL1D83DT7mzJ2TDqz2f/OA8
         mYLuAtRVvnISr6Op1BlKC9ofUe1NMSzV3TWkRQfTCgfuH40DP9o9s6V2BkFBSmSQ8Ekf
         FXiGO+FNJCuzUkclpzvtLseMWT2YL+cA0ENdkNgLCrZzFD9aboKTUCH7LBsB2hkdpv2g
         cAYbrT42GqOd3q2k/AP0t9kH/rpASL2iaWPsO+FnOE+S3mTZiOYdErfJ3jfAfm0+a/l3
         LibQ==
X-Gm-Message-State: AOAM533dk96icVxWKN/zLk0wPpsPphVve6kGFfiD/U1rJrdQ+O88436Q
        23lLv+RCdR9/gCK2HZfOH01cmPb7ZHm+TrIyOqE=
X-Google-Smtp-Source: ABdhPJya3ZCopKPQvKtv2oSG4E1csSZD3pBVuEyBwyhlBblULY0YLM3Kl7f6y8yg8qzJsr6cX3SJ9Plad+UvzYNKkCs=
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr13120668edq.172.1599790887514;
 Thu, 10 Sep 2020 19:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au> <20200911015105.48581-2-jk@codeconstruct.com.au>
In-Reply-To: <20200911015105.48581-2-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Sep 2020 02:21:15 +0000
Message-ID: <CACPK8XcK6pQpLZZudr1ovzxRqxT5ph5un+m3OwhnsFr+2-YtUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio/aspeed-sgpio: don't enable all interrupts by default
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, the IRQ setup for the SGPIO driver enables all interrupts in
> dual-edge trigger mode. Since the default handler is handle_bad_irq, any
> state change on input GPIOs will trigger bad IRQ warnings.
>
> This change applies sensible IRQ defaults: single-edge trigger, and all
> IRQs disabled.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v2:
>  - update comments to reflect trigger mode change
>  - tweak wording to reflect disabled state & single-edge trigger mode
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index a18ca52432e0..64e54f8c30d2 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -452,17 +452,15 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
>         irq->parents = &gpio->irq;
>         irq->num_parents = 1;
>
> -       /* set IRQ settings and Enable Interrupt */
> +       /* Apply default IRQ settings */
>         for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
>                 bank = &aspeed_sgpio_banks[i];
>                 /* set falling or level-low irq */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
>                 /* trigger type is edge */
>                 iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
> -               /* dual edge trigger mode. */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> -               /* enable irq */
> -               iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
> +               /* single edge trigger */
> +               iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
>         }
>
>         return 0;
> --
> 2.28.0
>
