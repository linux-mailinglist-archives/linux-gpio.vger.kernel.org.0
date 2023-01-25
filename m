Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B31D67B2B1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 13:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbjAYMnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 07:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbjAYMnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 07:43:06 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E06B125A3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 04:43:05 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id k6so19670646vsk.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 04:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y9MlLzfNrrNROBs/lmqVUqpRhex8MV2e9oSUqiRXNtw=;
        b=dIU76gvQDKTrVJUilk0mp2w7ONp2FVbZt0p5Lc1YXRHFE36+PMZU0t77kyUhKv6vLL
         ECN89B5JxxvfcYGbSOthbdRo5XIYQ8hy6p3yYLv0AJsdY0MrcwBV3N9bq3OhRH+UMeu4
         SGDCQraEXBMsRTJBHIkt354g4GIIbcgYwRJX3p+S3sdNSTI7r5mWLWGjmCZ4YiDtKJW+
         e6V/8pHdW3T0R7hpRGje/TqV5qFMZ+nwRpYhdXTxl6Ev6+oYEi4rz233Bd4M040CZkV3
         kb1KH0+rXMSGTRmrHkxlHVqvjH4FYUtZ7umjV3Dq0N5qA6el+Gn9WgYcUQVw/PX9b8rW
         R67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9MlLzfNrrNROBs/lmqVUqpRhex8MV2e9oSUqiRXNtw=;
        b=TFxrssdHbsLldnXCVQbg/3LmyB+lb2qXCXYWM1LhCK06llnKUT4i5h8Ni/VDzymc5E
         ymW97Myzehj2048oEF6PLAhZtPwr+MBaarS1JDX9SaPkiibFZyp/a6ZKTOPkGFvVYsRG
         n6jxG8NV/qxOTfQ6E49VJpxcXo8nMMPdElOaMQ8Qp7/F4Mc+EBGGPUdpvKW24uGzWxJE
         xUWlVLuUnM9xHPRnpXfaS53N6eTZPh0VbHhruL504tzbViEAtCRYd9gmXrwLuF5L29g3
         jQwR9hNs9l/fZv0W49tzE8VJcb3EPXeRxSySt2ajNP/LAEjFnxW9IlRqN6BFMgb/euRK
         aAzg==
X-Gm-Message-State: AO0yUKVx4mODjCsAH+k6T4bWsh8Dq2uZT6gsFmyyo2G2S2PPUFv/CHXq
        zR+K2So5jXnV02Lw16MbPbUsVIP2jxTGo5ylVzA9gw==
X-Google-Smtp-Source: AK7set+l8LFXjDVC/jgEj23injH7PuO3CV8lR6zv3xkqv3AnjMFZNbA1etZcwdXtKMQP2RAkHfAbJsTjLyip3l4Wt34=
X-Received: by 2002:a67:e902:0:b0:3e8:4ce6:e27c with SMTP id
 c2-20020a67e902000000b003e84ce6e27cmr233236vso.73.1674650584378; Wed, 25 Jan
 2023 04:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20230117100845.16708-1-nikita.shubin@maquefel.me>
 <20230125083026.5399-1-nikita.shubin@maquefel.me> <20230125083026.5399-2-nikita.shubin@maquefel.me>
In-Reply-To: <20230125083026.5399-2-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Jan 2023 13:42:36 +0100
Message-ID: <CAMRc=MciLG-FDSuq5SwaRnuJH0x2R+SQ28JxNu6wBrSZu8S=dQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: ep93xx: Fix port F hwirq numbers in handler
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     linux-gpio@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Lukasz Majewski <lukma@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 9:30 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Fix wrong translation of irq numbers in port F handler, as ep93xx hwirqs
> increased by 1, we should simply decrease them by 1 in translation.
>
> Fixes: 482c27273f52 ("ARM: ep93xx: renumber interrupts")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 2e1779709113..7edcdc575080 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -148,7 +148,7 @@ static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
>          */
>         struct irq_chip *irqchip = irq_desc_get_chip(desc);
>         unsigned int irq = irq_desc_get_irq(desc);
> -       int port_f_idx = ((irq + 1) & 7) ^ 4; /* {19..22,47..50} -> {0..7} */
> +       int port_f_idx = (irq & 7) ^ 4; /* {20..23,48..51} -> {0..7} */
>         int gpio_irq = EP93XX_GPIO_F_IRQ_BASE + port_f_idx;
>
>         chained_irq_enter(irqchip, desc);
> --
> 2.37.4
>

Queued for fixes, thanks!

Bart
