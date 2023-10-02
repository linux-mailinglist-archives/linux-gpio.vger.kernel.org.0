Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9DC7B4CC8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 09:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjJBHqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 03:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjJBHqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 03:46:14 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94FCC6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 00:46:10 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-499e2dd41ccso5766143e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 00:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696232770; x=1696837570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqvIhDje53OxVjVG4IMyzH0AYEEkPwbJqHOXxnNcgoM=;
        b=SXOL3OnegeiKvhOsAGCB3Z2flJAWFYAsueQD1ka1JmjmpcdF8/YzstXeyADEsBXeyS
         WUX1p7SyVJmv1BVQKMeoTRnfUe8tyfjVbT5KZq4KHVqRLXctbboZ8dkxam5Ids0zmF6f
         SHyHnXQP36idqVRVjQNFlkPNeP9N/hbTdgEOxwjWejC4nFbAgHqgmThZeuxeDj2D5HNY
         c6hHkSUPgAmnrn4ncdmp3KjwzEcvDYdhDUHggjVp4jyfJv6OuRA7oVX8uESPWITK6lFZ
         MLai1PCfESWD73Mzjdr3yyQL/55CIqBg56UkmTErOcvlfluRENDXSY+X5Myc7Ue6ZcgG
         wTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232770; x=1696837570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqvIhDje53OxVjVG4IMyzH0AYEEkPwbJqHOXxnNcgoM=;
        b=n0+xzZ4552Br8vd1aVQnyEq9DfS1SW9GMT+M04ksY0d1x//21bMLGx0q2hy6SS3LHm
         3ooJJ+zokzU0VPcPW+aDtH2fvoH+o6hbTFugoQgjSqdSG4MAeQXspw59kbiBJyti+oHA
         BBZnteNltQOPuZfpch1dViSzNf68DfBy8jk2tQcvOldP7FhsV1YbEpXfPgSt7aO1BRCo
         rLARqaGivr4r+Nos3gp497FzAC8YDNmn5YjPp8MOo2gFu2Xm3PIUu9nJHcg9SR9liIRJ
         K0r2XTROf7HIdAynCwr7aaF5jTuf+7grZlK2e4iYqp6GYQAZk0l18y9Q5BSVniCYNXN3
         Tc3g==
X-Gm-Message-State: AOJu0YwYXu9NKRhXe4I6LxtrM7rZ3kMGmQogXHUQxlVV5XBhizmzW7Tr
        7XyFHpMjOfQVl9B/RJ0JHii9AcbKpiXAMQdd/Peqww==
X-Google-Smtp-Source: AGHT+IHTpV2uxpyu37sYvaeFFlRCZLBZ48HAtumXYT6TL0P81tfHDEtcfQx3wfacL8SBXAzjoUIJNk0tgavHfPNw63U=
X-Received: by 2002:a05:6122:9a9:b0:49d:d91:8b27 with SMTP id
 g41-20020a05612209a900b0049d0d918b27mr8582974vkd.2.1696232769830; Mon, 02 Oct
 2023 00:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org> <20230926-gpio-led-trigger-dt-v2-1-e06e458b788e@linaro.org>
In-Reply-To: <20230926-gpio-led-trigger-dt-v2-1-e06e458b788e@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 09:45:58 +0200
Message-ID: <CAMRc=MecwZRE=2jG-24hFZaKZW2GdUBzD0FBYfh8Vce69qH84w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: of: Allow "trigger-sources" to reference
 a GPIO
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 27, 2023 at 12:41=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> The "trigger-sources" phandle used for LED triggers are special:
> the DT bindings mandate that such triggers have the same phandle
> references no matter what the trigger is. A GPIO is just another
> kind of device that can trigger a LED.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 531faabead0f..f4a660bf11fd 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -611,6 +611,33 @@ static struct gpio_desc *of_find_mt2701_gpio(struct =
device_node *np,
>         return desc;
>  }
>
> +/*
> + * Trigger sources are special, they allow us to use any GPIO as a LED t=
rigger
> + * and have the name "trigger-sources" no matter which kind of phandle i=
t is
> + * pointing to, whether to a GPIO, a USB host, a network PHY etc. So in =
this case
> + * we allow looking something up that is not named "foo-gpios".
> + */
> +static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
> +                                             const char *con_id,
> +                                             unsigned int idx,
> +                                             enum of_gpio_flags *of_flag=
s)
> +{
> +       struct gpio_desc *desc;
> +
> +       if (!IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO))
> +               return ERR_PTR(-ENOENT);
> +
> +       if (!con_id || strcmp(con_id, "trigger-sources"))
> +               return ERR_PTR(-ENOENT);
> +
> +       desc =3D of_get_named_gpiod_flags(np, con_id, idx, of_flags);
> +       if (!gpiod_not_found(desc))
> +               pr_debug("%s is used as a trigger\n", of_node_full_name(n=
p));
> +
> +       return desc;
> +}
> +
> +
>  typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
>                                                 const char *con_id,
>                                                 unsigned int idx,
> @@ -618,6 +645,7 @@ typedef struct gpio_desc *(*of_find_gpio_quirk)(struc=
t device_node *np,
>  static const of_find_gpio_quirk of_find_gpio_quirks[] =3D {
>         of_find_gpio_rename,
>         of_find_mt2701_gpio,
> +       of_find_trigger_gpio,
>         NULL
>  };
>
>
> --
> 2.34.1
>

Queued, thanks!

Bart
