Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E794E562FBB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 11:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbiGAJUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 05:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiGAJUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 05:20:17 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B896957241
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 02:20:16 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id fd6so2164191edb.5
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 02:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pfKYT8Jc1FgDc3r1JIflZV77YweLo1R+EqwQmp3TQuk=;
        b=ch9J5WbROG+jFYrJopCRfju4DrXngt+3FL4iUbLI5xy2A2uxWhyz0d2sZe0ciworIt
         Y+W0HNSRUW3C2v9jOosbXtU97scLz/mZJYuff7rkoQbjUvzoAK1b19V43MiwZ2ABOmpp
         y+lE7/GDO3uyzkuPgaXeLChgWkIoqKN6A9wrB2nbqd1ifLeYnLehAsomrnoRbmxMOOHV
         xX0kTd4uqvnW33YGaOrU+WWAJ8EimtEVWWzZTaY4c42VdOGFUbwd5Adepb+roAcyieuZ
         05OqCxuBlRansgNqWbLq+fnL3c3bRXWLnL/nzfTsn4g33JBBmRNt3yFbjHUL4HZ8ZwlO
         O9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfKYT8Jc1FgDc3r1JIflZV77YweLo1R+EqwQmp3TQuk=;
        b=Y4/gq6TR+uOWm2MfMmayUJS7xvp5w//ufKNSGCrl56YxKSQvMMVeRlo862beMs+dcO
         /RzVFtXs49bS8dU62pKtsJd7C24sV9TWFJ+pH4AhUui1HwJntCaVJMpLOza8KRcnrA00
         s0IXOufJT+vi++O+Qtpbf+wwvlEZXyvgS7GWeLdHldT0FgWvpvJt6cZHHfAXOT9pkRqN
         BO3h073zwKbrZwOTUZFRCIGQXOhP07kRyJ/YELYK/xzq1mtppsuXqh77c+alOu6nzTz/
         j2ivzsd8B2zxsUhkEsqzvFxkCC8grG+eUxcgIFHuiJQ12KuXgSGDCqQpUl7VgH6vXUpq
         If2Q==
X-Gm-Message-State: AJIora8D84J4iFJkH5c2Z9q6gp786lmShJQ1V/KUBhjsSDlvg3KLsB/7
        PoywqOKe0LXkqGcd5ZIy4UVTX2ZCAzsL3+mc1Z9bIQ==
X-Google-Smtp-Source: AGRyM1tAfFM4zxkGfwOTJkzWnl2exmPlKQgrm30eNhARBnWFfa/vm+SDMnOKQLWQIcWGJSdB8mTjO58N3bFdzE4Nlps=
X-Received: by 2002:a05:6402:150:b0:437:b93c:3a9 with SMTP id
 s16-20020a056402015000b00437b93c03a9mr16897407edu.82.1656667216308; Fri, 01
 Jul 2022 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220629170420.2712077-1-l.stach@pengutronix.de> <20220629170420.2712077-2-l.stach@pengutronix.de>
In-Reply-To: <20220629170420.2712077-2-l.stach@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 11:20:05 +0200
Message-ID: <CAMRc=MeN6JxtSJ8kNrvrMZJGcnv9SYzH0JO6RQUc6PQzqYMp-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca9570: add pca9571 support
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 7:04 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The PCA9571 very similar to the PCA9570, it only differs in the
> number of GPIOs.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpio/gpio-pca9570.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
> index cb2b2f735c15..ab2a652964ec 100644
> --- a/drivers/gpio/gpio-pca9570.c
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -121,12 +121,14 @@ static int pca9570_probe(struct i2c_client *client)
>
>  static const struct i2c_device_id pca9570_id_table[] = {
>         { "pca9570", 4 },
> +       { "pca9571", 8 },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
>
>  static const struct of_device_id pca9570_of_match_table[] = {
>         { .compatible = "nxp,pca9570", .data = (void *)4 },
> +       { .compatible = "nxp,pca9571", .data = (void *)8 },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
> --
> 2.30.2
>

Applied, thanks!

Bart
