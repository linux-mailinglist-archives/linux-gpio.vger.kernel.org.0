Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA4C53ABBB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 19:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345765AbiFARVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 13:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344343AbiFARVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 13:21:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C86A33B5
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 10:21:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id n28so3103926edb.9
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVqBkM2uA4gXxg439LWOzD6Nex8nLR94/6FthFVSN2g=;
        b=BTw7KeOoPad7dIiwnjV4JfF+BhO2JkgmmQldFVxqP7+2OUg5fRvugjjWD8f/vnqtLL
         I6pzm2XfnO4K/2dDMTQMLuFNYUfqQv/hxeQDp3e7AUJX6LELrwP+Bs75M0lEBg0zdPT/
         Hg8EgY1S+Y7X1puBlPaY6xWPw7OB6FGNRVyfPIpMegDK/UDMGKQFw29SG1/h8oUMRgoc
         /VH7yeXvvIwrdeWwsVkkQ4/c+uV1x4Dx8gY9WDhyq93v+5J652sCIIUZAaRjQFodEg88
         VBUf9JyqAsP8MhdLMVf96uRJ3Nqu51HAhFhA6mCwPbtUN1qnFKdhplWf9g+pJlxi1oI/
         HKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVqBkM2uA4gXxg439LWOzD6Nex8nLR94/6FthFVSN2g=;
        b=amcj2sd5IGBaCFDjkzXxKVTJBZZlTYF/nvDEHw0qbW3GRvOfPqvp6SzSbOm1+B9gTg
         nnD0hRuCd+zP4g2xY9We8FjYt9z2i+Bhs/FPr+eqIWcF7Era+Tz1gYvpjGoMLMjWdB3o
         ivMIPF/RFh17jzQsnSzOmEdKEQg5jHFNNPpJ9mOJyjMZTX0M8zqOruOkzPZU0XDocKW9
         Ld0lxp3HRBoOSRcTyO0o58LJVlHPFQjym0haRZgddbCb6ar4z+gaf8d17nqW7cslzVNA
         E2kFDM+v2zgWVnLAudgOugG3AV0EKFg2xIaIEw+JI1Yoj1UCi3KTX4iRx2S6uGIef0uu
         HEsg==
X-Gm-Message-State: AOAM532JorBUf62FrxACtL2jUY+ROlsSTmqnhmLFM4vTi5I9Ol0ckZRl
        JYwWLDfNVos/VzgFohIJpNwq0uwky3SJxtS6RB83DA==
X-Google-Smtp-Source: ABdhPJyPw5Go6kBA5cuuOnmuEGHhvdJmwDbMbZOE25sq9ouXsJIx80rdougScNUG/K3fqXtUpOZuemDSIDFZhpgCd+I=
X-Received: by 2002:a05:6402:2999:b0:428:bb4d:6cea with SMTP id
 eq25-20020a056402299900b00428bb4d6ceamr829039edb.29.1654104066499; Wed, 01
 Jun 2022 10:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <1653907728-27235-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1653907728-27235-1-git-send-email-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Jun 2022 19:20:55 +0200
Message-ID: <CAMRc=Mc1S_-rzwNrkemcFM6beomkY=UAM+r1U2V_fZ_iKZwWog@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: use the correct register address to do
 regcache sync
To:     haibo.chen@nxp.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

On Mon, May 30, 2022 at 1:02 PM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> For regcache_sync_region, need to use pca953x_recalc_addr() to get
> the real register address.
>
> Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b444c6ab958b..08bc52c3cdcb 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1120,20 +1120,21 @@ static int pca953x_regcache_sync(struct device *dev)
>  {
>         struct pca953x_chip *chip = dev_get_drvdata(dev);
>         int ret;
> +       u8 regaddr;
>
>         /*
>          * The ordering between direction and output is important,
>          * sync these registers first and only then sync the rest.
>          */
> -       ret = regcache_sync_region(chip->regmap, chip->regs->direction,
> -                                  chip->regs->direction + NBANK(chip));
> +       regaddr = pca953x_recalc_addr(chip, chip->regs->direction, 0);
> +       ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
>         if (ret) {
>                 dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
>                 return ret;
>         }
>
> -       ret = regcache_sync_region(chip->regmap, chip->regs->output,
> -                                  chip->regs->output + NBANK(chip));
> +       regaddr = pca953x_recalc_addr(chip, chip->regs->output, 0);
> +       ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
>         if (ret) {
>                 dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
>                 return ret;
> @@ -1141,16 +1142,18 @@ static int pca953x_regcache_sync(struct device *dev)
>
>  #ifdef CONFIG_GPIO_PCA953X_IRQ
>         if (chip->driver_data & PCA_PCAL) {
> -               ret = regcache_sync_region(chip->regmap, PCAL953X_IN_LATCH,
> -                                          PCAL953X_IN_LATCH + NBANK(chip));
> +               regaddr = pca953x_recalc_addr(chip, PCAL953X_IN_LATCH, 0);
> +               ret = regcache_sync_region(chip->regmap, regaddr,
> +                                          regaddr + NBANK(chip));
>                 if (ret) {
>                         dev_err(dev, "Failed to sync INT latch registers: %d\n",
>                                 ret);
>                         return ret;
>                 }
>
> -               ret = regcache_sync_region(chip->regmap, PCAL953X_INT_MASK,
> -                                          PCAL953X_INT_MASK + NBANK(chip));
> +               regaddr = pca953x_recalc_addr(chip, PCAL953X_INT_MASK, 0);
> +               ret = regcache_sync_region(chip->regmap, regaddr,
> +                                          regaddr + NBANK(chip));
>                 if (ret) {
>                         dev_err(dev, "Failed to sync INT mask registers: %d\n",
>                                 ret);
> --
> 2.25.1
>

Queued for fixes, thanks!

Bart
