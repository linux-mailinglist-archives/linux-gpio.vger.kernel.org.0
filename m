Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D2770D766
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbjEWI1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjEWI06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:26:58 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D005198C
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:24:13 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-437e2e0a5c7so1662860137.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684830252; x=1687422252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhIEUTCqqOmVrq27EtPsyFUUnmaruBYTBMIlfActsI0=;
        b=JwP21OUt+M3xBUO76ScQKB4cTBYx1alaTB5hrufl4wljE+PTPonPK7Gysa6y4zAFUi
         Q8+FuKTAGOz+lT0bFUn8UzBpxnioPSDSUn7qZEQjfvFPNWEnVuC4B8No1M/Woo2Gaild
         xefFWAPqG3cYEX9RINDe0vzlSNtILhzXJEeLmZZcQMy9xQwIrghryfxN5Kc8URNuZB/K
         vRS3F9LNgGIkVuOT2kXZhKzynAJMA67Oetp3D8tLzKGvhpEByqFeifkuk8Udxu+2QNi/
         sp7pahqka4U7G4Y2JvWhkwF1NEM6aXDDCtbxGHkhEzX5S7egL5DZj+NWUQ3+ridRv022
         AOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830252; x=1687422252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhIEUTCqqOmVrq27EtPsyFUUnmaruBYTBMIlfActsI0=;
        b=TM3vZ3pe+z5r+dYh/gKAUD0v3A7d1lfHf4PJT7HUKRh2ogNKH0EopwSvvG+UCqAQXX
         UsBPwi+vMimzVALO+kORawKpM8GaVRHB6wY+huliqKoTRHNjFAV7DZrdYwGBAy2ShCxI
         YfZFVEpz/krdqZyMQldqWgQ2Ndc2FQMt301SE51f2dbkD7U4Ulat+8DXn1s+3QvU/3KU
         dMBQiITmjd4+SfjCoAnMt7cM3beFqCxIr+s50zoq564XWqMKJY+hD40RGSygbYHVDw4X
         8loVbn/q+ZktU0BUsaZtY15Rb7VEOj8jkNBRFEOtiDIOcHN5wdbMrvop/wIx3aWVpBab
         acFg==
X-Gm-Message-State: AC+VfDwiVVfOeILV6c/8mTBp5VZNDKwL9NxxlC1vrO2vJ6/ToQPUa0od
        drTEkfthevXIYg3EXHIBFRJ3JV31lwSAZlLK48gwgw==
X-Google-Smtp-Source: ACHHUZ7hwJFYsy2dWBOdGAT7bXIwryKtP4pxjHazuwEXjR/yb9tO4U8H5QSANrCV3THKkhpLGtnVVafGzJ+l+SpFdXo=
X-Received: by 2002:a05:6102:2821:b0:436:3238:bd1 with SMTP id
 ba1-20020a056102282100b0043632380bd1mr3151674vsb.34.1684830252555; Tue, 23
 May 2023 01:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230428061109.102343-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230428061109.102343-1-yang.lee@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:24:01 +0200
Message-ID: <CAMRc=Mc4ifLQ-QB2v+hgMEc2P9pK-6uzDmOXfdP_g-jkjrCp7g@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: brcmstb: Use devm_platform_get_and_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linus.walleij@linaro.org, opendmb@gmail.com, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Apr 28, 2023 at 8:11=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index c55b35da61a0..6566517fe0d8 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -609,8 +609,7 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         platform_set_drvdata(pdev, priv);
>         INIT_LIST_HEAD(&priv->bank_list);
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       reg_base =3D devm_ioremap_resource(dev, res);
> +       reg_base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res=
);
>         if (IS_ERR(reg_base))
>                 return PTR_ERR(reg_base);
>
> --
> 2.20.1.7.g153144c
>

Applied, thanks!

Bart
