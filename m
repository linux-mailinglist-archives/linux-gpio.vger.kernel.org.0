Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C57A75942A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 13:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjGSL34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 07:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjGSL3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 07:29:55 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEFA1A8
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:29:54 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-483ee849d00so1031253e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689766193; x=1690370993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4VfGXDItiz3rOhUAQIyTNmCOzkfaYXWYp0bCIPaFY4=;
        b=Vgr2o6cI8lHX0NMfceh2+i/P1G842ozgB/a0J63s/W3gBktk1rCfXLxNTjs3gycu3E
         6A0j9h4au9zLjLIkBNppRbaf1zlPR7dabVZSOjeU1r5dAdIWLMN1F95sY+tGVH3XeOKD
         huVzBUUeonRnAEHlW/Ee8CILx7Lhx6AHjVJwF+M3OqhX3iGod20aaNTGyd9bR10k134x
         k68szYIS+ph8uAmeX/brp0j3hbmeUR8A2jg/PWjHipYIDk681KeC094elCrs5HI/QpTQ
         aheHT47OzZmfkFyAwxUGBSaSyO10LZqMQkFak/KYg9XWYmOHkUGbKSuLiI2XFjWBr8pi
         22wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766193; x=1690370993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4VfGXDItiz3rOhUAQIyTNmCOzkfaYXWYp0bCIPaFY4=;
        b=I+CtIhfVlbvJfdmTKROHxgi6fc4aDK4hFt+TpANVYh+msth2TrD0bZbQbu6DsMgMpJ
         cssDll2S+4pnFEl4dJvTMrYz4QonWet9Z1PRvhY9ZncmPiuwvzI0g839/7nV0yiJ9ZD5
         QQLQHXlIeYucfMry+WX1aa7TlIie7v6mhZHXQlB7dxdqqdqkugLAgijLLpScAuKZdDwl
         4RHmoruxW8NzyI1UuP+W9+AgvmhPMfKDmEuxpXhdbxyfdVnzUO4CnR4Tq02jiexYh0LK
         gBafzWcXuW2IfLytEXE1piQxGJJ9DftfQsRyWmzCsPzoePVR1EdxqspqREgID/q0bSGB
         iLnw==
X-Gm-Message-State: ABy/qLbnPoIbEGeANU22Z/JFOABQNLcBPGfTVv+pNfziWb/NwUY8NhxI
        1VvOj437Vbv0RQmFwcGKAu2yjidZ96VKMxof3P6RpQ==
X-Google-Smtp-Source: APBJJlGhAN7cR3t34C3nRUgJY2UbNEIDk1e+PecKgQX1lein5M7EmL8XAFDWrh4b3tPGbEXDrbnagRCDx33hup8yQGc=
X-Received: by 2002:a1f:60d6:0:b0:471:7398:5af1 with SMTP id
 u205-20020a1f60d6000000b0047173985af1mr2313164vkb.10.1689766193751; Wed, 19
 Jul 2023 04:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230717205357.2779473-1-samuel.holland@sifive.com> <20230717205357.2779473-3-samuel.holland@sifive.com>
In-Reply-To: <20230717205357.2779473-3-samuel.holland@sifive.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 19 Jul 2023 13:29:43 +0200
Message-ID: <CAMRc=MdaS9PXE1xxSyBSxVhv-B6TNwot0+TLoF1-cNcLYaQ-WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 17, 2023 at 10:54=E2=80=AFPM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This can reduce the kernel image size in multiplatform configurations.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  drivers/gpio/Kconfig       | 2 +-
>  drivers/gpio/gpio-sifive.c | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e382dfebad7c..1a8e8a8c85d6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -564,7 +564,7 @@ config GPIO_SAMA5D2_PIOBU
>           maintain their value during backup/self-refresh.
>
>  config GPIO_SIFIVE
> -       bool "SiFive GPIO support"
> +       tristate "SiFive GPIO support"
>         depends on OF_GPIO
>         select IRQ_DOMAIN_HIERARCHY
>         select GPIO_GENERIC
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 745e5f67254e..5941a817491c 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -277,4 +277,6 @@ static struct platform_driver sifive_gpio_driver =3D =
{
>                 .of_match_table =3D sifive_gpio_match,
>         },
>  };
> -builtin_platform_driver(sifive_gpio_driver)
> +module_platform_driver(sifive_gpio_driver)
> +
> +MODULE_LICENSE("GPL");
> --
> 2.40.1
>

This looks good but please follow Andy's suggestion and convert all
of_*() uses in the driver to generic helpers, then drop patch 1.

Bart
