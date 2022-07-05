Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C002567065
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiGEOJv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 10:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbiGEOJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 10:09:32 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AC11EAEF
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 06:59:56 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y4so2047519edc.4
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2022 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+hBzbUaagKi4IwScllUI6gmB3FQjSahzqgi96CMOIek=;
        b=j/EphDMCYX2MQJnPgqUrnQxuDgFfB8cRx7owvJhz046ppaKsnqwB9fNoOA6HGnk6+2
         4q8rqxGiopcar/ulRiEKlhxn3EL51p9Dof+XHYsu2ZnUkp9yXqRpDAi9RJcxuPZKdk7F
         OiGLRn7jg2nyju7aK4C7JgbkP64Aemo4RVRqAPSf9Lq7KiiN+4vAzTFq0XXsliV5nGl3
         OQKNbHfDDIzAMf0VncW5iPsS0QGkLoD9I/S0vW7gGviTaQf+sfHgpZfK6eVoG2B3vsQQ
         Zjw96B9TnQbc9WmoDUoeCcNEj2nO+wtfPWvX4nb5U6IP+vN6cwxMSYzPnMgnjoHy/4cG
         OPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+hBzbUaagKi4IwScllUI6gmB3FQjSahzqgi96CMOIek=;
        b=4lmvEP1FniCnppNL/pgZY2cPzySAIiLpMGNu//jLt3qx1hbmWvBA3umd5iVvjESF7g
         0Lnht5VG4EfoRdVgL+sYLBKOFOuQKrGzLEIDWiwonDEo76u0Oan5Ie2XBywnnxynOSu4
         UR2G3qAF9kLlJe6ggJhu0ff0LUWdg0KWJEqSyt9VHMvT34nN1uXwqkqGCSKovcNlbUXu
         RRx9vHJp/m7z/xJvcMsr63ceBc8Z21A19XTZ1aDzV8rRdCnKFMgGBAmySmCPVNjG8Pi5
         e6mXV62pW+fssKxR0KDmivZB001nwfIzbdqE0VLUS490KZ4mBdMpxjJYEteUjPIWTVqU
         P+lQ==
X-Gm-Message-State: AJIora+y/09rm91BHVG4hh/nvowmuT7sv9Pa1XAdcc1kEXKY2n2mFRsI
        Pofi5n+CziimCVTBVrWzrABebNE+zyqGHc8OSrKlqA==
X-Google-Smtp-Source: AGRyM1uP74HPMZ7iQRZkKpT6GH8P6cQmrT0QOkOM7fw+P6hs/fHEVE9co05RY8/SY8ZW3jsskO8m1TZowJHmM0+X5nE=
X-Received: by 2002:a05:6402:18:b0:435:9a79:9a40 with SMTP id
 d24-20020a056402001800b004359a799a40mr45611436edu.328.1657029595047; Tue, 05
 Jul 2022 06:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220705102114.2067-1-tariqt@nvidia.com>
In-Reply-To: <20220705102114.2067-1-tariqt@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Jul 2022 15:59:44 +0200
Message-ID: <CAMRc=MeM4oryk7-hFeQJdXY28MF13mwpaO8dY5ddQeQroiZe1Q@mail.gmail.com>
Subject: Re: [PATCH gpio] gpio: vf610: fix compilation error
To:     Tariq Toukan <tariqt@nvidia.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ran Rozenstein <ranro@nvidia.com>, gal@nvidia.com,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
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

On Tue, Jul 5, 2022 at 12:21 PM Tariq Toukan <tariqt@nvidia.com> wrote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Fix compilation error by explicitly adding the missing include.
>
> drivers/gpio/gpio-vf610.c: In function =E2=80=98vf610_gpio_direction_inpu=
t=E2=80=99:
> drivers/gpio/gpio-vf610.c:120:9: error: implicit declaration of function =
=E2=80=98pinctrl_gpio_direction_input=E2=80=99; did you mean =E2=80=98vf610=
_gpio_direction_input=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   120 |  return pinctrl_gpio_direction_input(chip->base + gpio);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |         vf610_gpio_direction_input
>
> Fixes: 30a35c07d9e9 ("gpio: vf610: drop the SOC_VF610 dependency for GPIO=
_VF610")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  drivers/gpio/gpio-vf610.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 23cddb265a0d..9db42f6a2043 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
>
>  #define VF610_GPIO_PER_PORT            32
>
> --
> 2.21.0
>

Applied, thanks!

Bart
