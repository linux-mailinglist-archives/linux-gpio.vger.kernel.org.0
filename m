Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B39F5B02B8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 13:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiIGLSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 07:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiIGLSC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 07:18:02 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4E0A3D77
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 04:18:01 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z21so9141178edi.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2022 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=dZIh4+/56mPZ8GNJ0DQtWOl7S488zyoNCksTXVS4XdY=;
        b=VQ6UrKP2Ppw5g7e/Y4qcRdVDeCmUJMzs7joV+B4t8ncxhcBJIkf4z2eN9HY+A8FH2u
         28PSq0leDUdV/Ce3Mk8N6YOp0YvlptviGdXp+LcqWWiJZz8arYfmIP/8FiuvUchkbPIy
         G7MHEsVpJFr7LnHH7omvOCMceCYO3A1k92MGnCZ7HVa+dJmXdHzCJqyJbgDInaoKn1pC
         AYxW8yCczu52agaQcsnuaS79r/jL69MJeHTSqILIDgzCq5VtH2l+KjQ+dpHLFcoNw+FK
         Bwcyb6kkBcX+Ps5PE+6iXhSHChUjYHpPL4qC0dBcVuGA5dRhh0H+W+/xH0zOSL1wUGJb
         Puug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dZIh4+/56mPZ8GNJ0DQtWOl7S488zyoNCksTXVS4XdY=;
        b=GOP/YJ2nlKNvFurefyQd9web0YL+WDYqiOvD90lem1Xtk275oy8MaJkhKXmyu9Y25c
         LRL/lVezrr0RgRXlOoELTTP3dqSrd+4fxoivQzfBcVqDPOZ5cNBmALUULg3ykKjz2L10
         sSVICDpBOK49RHePoxBE+SbmqtXn5usrXTqcPgtUPmyq/THHpf7g132mg//MzZBm6hdW
         fsqgIxptNPy1F9qkptYeUoVsiuep+d83qlEmc4MrrrlLJRbEF9yii9hd6KUO9oW4Cm3K
         CMUx5ww6M1JGgOc6yDR8Fltxko7JpnUZ6FkTG4SH9ly/EG11y/Rkw5F61PZTtId5XEO2
         qVPQ==
X-Gm-Message-State: ACgBeo3pEKbDXjsU6BGNblzHfw0s2EG7V+a+q5pAWTgnIiActFDFfhTA
        Bznjqn0YKuKbxWyfQV/hWx4Ndw6aKaZMOOPmXrRihA==
X-Google-Smtp-Source: AA6agR6EW00/7vkJywy6kMguX7icdT7VZ02IGp5o8iDc7yvy/ODvZlLvwivz+1E23l5HysN4M6uUnfPg/dawCWF73OE=
X-Received: by 2002:a05:6402:524c:b0:43e:aba4:a42d with SMTP id
 t12-20020a056402524c00b0043eaba4a42dmr2712719edd.328.1662549479692; Wed, 07
 Sep 2022 04:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220906105431.30911-1-pali@kernel.org>
In-Reply-To: <20220906105431.30911-1-pali@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Sep 2022 13:17:48 +0200
Message-ID: <CAMRc=MeEg30wpA-Xw5CyYJMB-NTX8Agmq5UrzcTtqBJTc_49qQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW
 flow_type in mpc85xx
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2022 at 12:54 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> Commit e39d5ef67804 ("powerpc/5xxx: extend mpc8xxx_gpio driver to support
> mpc512x gpios") implemented support for IRQ_TYPE_LEVEL_LOW flow type in
> mpc512x via falling edge type. Do same for mpc85xx which support was adde=
d
> in commit 345e5c8a1cc3 ("powerpc: Add interrupt support to mpc8xxx_gpio")=
.
>
> Fixes probing of lm90 hwmon driver on mpc85xx based board which use level
> interrupt. Without it kernel prints error and refuse lm90 to work:
>
>     [   15.258370] genirq: Setting trigger mode 8 for irq 49 failed (mpc8=
xxx_irq_set_type+0x0/0xf8)
>     [   15.267168] lm90 0-004c: cannot request IRQ 49
>     [   15.272708] lm90: probe of 0-004c failed with error -22
>
> Fixes: 345e5c8a1cc3 ("powerpc: Add interrupt support to mpc8xxx_gpio")
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index a964e25ea620..763256efddc2 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -172,6 +172,7 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, u=
nsigned int flow_type)
>
>         switch (flow_type) {
>         case IRQ_TYPE_EDGE_FALLING:
> +       case IRQ_TYPE_LEVEL_LOW:
>                 raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
>                         gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
> --
> 2.20.1
>

Applied, thanks!

Bart
