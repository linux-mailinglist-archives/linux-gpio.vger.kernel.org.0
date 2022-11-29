Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A3363BDE4
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 11:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbiK2KX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 05:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiK2KXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 05:23:01 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8B163E1;
        Tue, 29 Nov 2022 02:22:58 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id k4so9346914qkj.8;
        Tue, 29 Nov 2022 02:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LO8RI0jr7bJrxY0cMQR0w9JdTdn6jpW6eDbtgUcb5TM=;
        b=g/3uxiW2w6dm6n5CQ4DjHRjR2mK4VLwrG8YR3Zr5cVrpiR5RcxsllHD+j9QOIGhVZf
         BDozoOL8Ck4CGIlItLS+97x8ayxG1fND3Hj9rXXCQsWT5nahLDXDfqZ/XXHRC0wEgHIr
         HiXTHTBwcSb+6epR7p50lvM4CLx3SeBRL+kd1r4oDrlAsBARCOTgQKtlpfkRlM8/UVJ9
         2QD6bCg2dbEmIAnkB0ofDjRKzPwoacLNeFS2do7sLE3NCFvkrQTjmItb12K3QXJllEZP
         xWkQ2PwyQp+yQU3wa1b0i5q0rdzL+5BWU70BlpEu4cGblPK0ZmD+kh1Z/aFtlI3BPbcW
         3FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO8RI0jr7bJrxY0cMQR0w9JdTdn6jpW6eDbtgUcb5TM=;
        b=rOLOZxxfI99nyqkkIaatGNRq1M7OPmkHH5GjsfwZPqxNytWlaUmzS61rpheYzSExus
         gtcEYNRxUE73HQtZU25WJuw5HoX9gSwpJAjf8v2xzB4cYL/rNsXROy85c+jexr1qfmM3
         zDg/UttI99ZHQ6a7PgBJ2QZ4Ua0uv8Mx+UeH6sJTWqw4EfIE1AQFKcj5pTlFxn40FLNu
         8HVun3E8FKFNF8R/mUFqm+6o8AChjpYgVF0vY+Lj0yCpj14HP6d0MKKP9zAQLiNUI1B7
         ffZVes0/pARtXCRJou++0YuQ9kwjSeppKCUDqrnYJvUUETl7QlavDcGKyAVuQSa96hoz
         04RA==
X-Gm-Message-State: ANoB5pkMRnEY4hxCySiVtJJ3XRPlPRboDGkiM/SAsowe+3Y6TykSvM4x
        quq8kLrj7Ay8ZJHn2mcaGdxWUnQdELYGK5mlfjk=
X-Google-Smtp-Source: AA0mqf6U2varNApHDZTWUqBYkp99y+gnTiId4wt8LQ4sHtS5r98TBSQgiCD8zmhudYzc8pwjJPs5IE4JHPNH6Ruhl3E=
X-Received: by 2002:a37:b404:0:b0:6fa:4a82:1152 with SMTP id
 d4-20020a37b404000000b006fa4a821152mr51095200qkf.504.1669717377965; Tue, 29
 Nov 2022 02:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <20221128214408.165726-2-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Nov 2022 12:22:20 +0200
Message-ID: <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> so that the actual value of the pin is read, rather then the value the pin

than

> would output when put in output mode.

I don't see it here and haven't checked the context, but the idea is
to check the direction and return either input (if pin is in input
mode) or [cached] output.If it's the case, the patch looks good to me.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/gpio-tps68470.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index aaddcabe9b35..778a72cf800c 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -30,7 +30,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  {
>         struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>         struct regmap *regmap = tps68470_gpio->tps68470_regmap;
> -       unsigned int reg = TPS68470_REG_GPDO;
> +       unsigned int reg = TPS68470_REG_GPDI;
>         int val, ret;
>
>         if (offset >= TPS68470_N_REGULAR_GPIO) {
> --
> 2.38.1
>


-- 
With Best Regards,
Andy Shevchenko
