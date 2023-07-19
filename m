Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499AF7597D3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 16:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjGSOMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 10:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjGSOMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 10:12:52 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2EB8E
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 07:12:49 -0700 (PDT)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 20D833F11C
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689775966;
        bh=fTUvgetUaqT3wHGPq5i4Fev7+8uAQkZMBnoHSdm3l3w=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=bywkgrySn1qYARM1u9eKGf84kdbHJU57+GgMk0C2y3THfW68HtKm+QlrCGKQpg99Q
         Dl7H/2VLyw5vKd7LY+9RVf0jQamwPPneI8ZVUV84HmLHNkKJIYnDvxI6o8cu3FqU1w
         3GieuNypeIl90HZTleaRLWrXsE7FlEPc8pwgpHRSDXQSeC3YBqVpJCvg/4CMbzX4N6
         zkLjEuMNZM436JSGP2DFk/c69XqKwHrJYkpHvxewTGulB+6PXs54DmIv3A936Z+BzA
         f0udUkNf5wu4JSXGWFxbfW+YXA7f+jQP6OecxiyrPUND3hz6MAA6/XTCF+aC5xv5k6
         cTwXjUGFWcAxA==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7683cdabcb7so85874585a.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 07:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689775965; x=1690380765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTUvgetUaqT3wHGPq5i4Fev7+8uAQkZMBnoHSdm3l3w=;
        b=M5sw/57ZGyuRwUMZh1bUSZp1zdv5pHI5VXkdPPhk80IiasO3/V+/F4P58P7w78qlVG
         23Kvlhti2iKxutphz/BuBYmVPG1FDrtJMJEBYOnJnqOEreilEHTVoEpk4wvGiT5aQHER
         e61SjOoLLRup1f854AI0UOW+tKMADORb64QhnmLmdfwYmRxbp2s/eR3zDJUqmuzsa8np
         egTjhp9XYQRsOmNa96wdLNfKj6D0Lo5vg5UiL0LcOqqggrR0AiRLN1J8JtcHoGY1AWqu
         CkVHXlFt9WOv7iq/GTGrtt/14tTDYIwsBWWYC73XcythSJUr8asnNDR7IyAnBzvy0m0h
         8u9g==
X-Gm-Message-State: ABy/qLYG0wTyC2vYIP3iukgMqX6Lq7V65wPstrxLv4kPHu/JKWA94Icz
        nc+5uu3o6j8kpyOvvY7DA+QFxKBL7Pnm9V3FSNKlmw0mudTDNQU+7yfVxs7bWam1dcDPDHGbgC4
        X/QGD/eIKB43Bd12B/yrhbqoYiPpxbSX7OVRQFkQMHC/dc6vCxFUNMPs=
X-Received: by 2002:ac8:5a82:0:b0:3f9:cb01:9dae with SMTP id c2-20020ac85a82000000b003f9cb019daemr21215426qtc.50.1689775965096;
        Wed, 19 Jul 2023 07:12:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyqJAW0YcwGXzwaqtO+haPvbXa6TVCnEWDq/UNmAT5PINh4LZDlSHEpJIERRJmT2R7L69By/E3f/BC3H9q+ls=
X-Received: by 2002:ac8:5a82:0:b0:3f9:cb01:9dae with SMTP id
 c2-20020ac85a82000000b003f9cb019daemr21215415qtc.50.1689775964905; Wed, 19
 Jul 2023 07:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230717205357.2779473-1-samuel.holland@sifive.com> <20230717205357.2779473-3-samuel.holland@sifive.com>
In-Reply-To: <20230717205357.2779473-3-samuel.holland@sifive.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 19 Jul 2023 16:12:28 +0200
Message-ID: <CAJM55Z8Q-kGFKhFc57_Ew+0VsmBqwLrBAaiaiJ5zYdu_OG-wMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2023 at 08:26, Samuel Holland <samuel.holland@sifive.com> wrote:
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
> @@ -277,4 +277,6 @@ static struct platform_driver sifive_gpio_driver = {
>                 .of_match_table = sifive_gpio_match,
>         },
>  };
> -builtin_platform_driver(sifive_gpio_driver)
> +module_platform_driver(sifive_gpio_driver)
> +

While you're at it maybe also add the MODULE_AUTHOR() and
MODULE_DESCRIPTION() macros.

> +MODULE_LICENSE("GPL");
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
