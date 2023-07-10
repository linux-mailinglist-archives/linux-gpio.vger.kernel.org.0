Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581A774D0F8
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jul 2023 11:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjGJJFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jul 2023 05:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjGJJFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2023 05:05:10 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44741C9
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 02:05:09 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-794c5f5ae8aso1324141241.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979908; x=1691571908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy2KuLcXZ4Ve1Tpog66+CQXXOfL/pwzTVK9wzp2h/kY=;
        b=YE+VfCqfJoJp0tmjB0RFKq39bKSXtnUO3Dm4zvB0Y0Fq9Vjm2fgh5t4/sBD1sxB2eY
         IQSYIsb66mJLgM/I2FVBkp22OLiB/dSjBeSZQ7f0cDu0fa5YnzGYIMYUZusZXggOMn+x
         vJPcdGuQ2FdFPpzbW/dLV/DQIEGuaX6LW9lx4CRUJszjEIYVko3x8hCVBEMKSW+yCl3/
         1BWpKfSYPIWd9bDbfFVlpRkLa7eQjlWvRMHXSxq3fNSn+ktUjj1iU4UjExdAvFY6PF4N
         zgC8Spd6dfIcv+JLcmds/2140n07lwvlcRbgPBkPM5suSuaF1bif33PklFo0lmQtFxme
         QUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979908; x=1691571908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy2KuLcXZ4Ve1Tpog66+CQXXOfL/pwzTVK9wzp2h/kY=;
        b=k0iHYmLDGf7mp7QwgC4qbnBGyf+57aIkkxF3CrBhR0jspGFl7pOFuCLilDVzL7wXav
         KOOBTIbDYq2bkF8AIhLBVCTZ7uOcZC24aeVoO9u9OSwS/wkz7E7A2Q33/QTDK/yVzlka
         rzLo6oxscl/rXzS62KU2uK3UdATu94tDvnR8wYd6Rfp2tuewYCT/VxrMzt/gVNpjC/VF
         1Sq5zbYgHk2klgvdYpVISnJmgI0jaZ7lwqfDbUUYQh44ggdsBtLso12AuZrHhVyUMRJ7
         yMSgRchv7ukZNFSmVcZBQmYNyNtxC43a1P4fz/bPk+YIQkicebsV5O7Vd39uneCEi3PR
         PM+Q==
X-Gm-Message-State: ABy/qLZh+Z9sNNbmp1nyDUMg5RL8zbVaq5LKiZnES5YYGRc1ifj4mWrs
        /C/X7LjYvX2zasuYO+EeQeVZ5H8NUabmFGyg5cXeLw==
X-Google-Smtp-Source: APBJJlEdo1R2E090zn3ecweFkWTp3l4QNO79GBLaXhJtnB6M+dCng+dsfc05WHU9/mhxXwGhnSmIrycnWCooN6CvlxA=
X-Received: by 2002:a67:eb44:0:b0:43b:3cab:23a8 with SMTP id
 x4-20020a67eb44000000b0043b3cab23a8mr6227319vso.20.1688979908344; Mon, 10 Jul
 2023 02:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com> <20230710042812.2007928-2-huqiang.qin@amlogic.com>
In-Reply-To: <20230710042812.2007928-2-huqiang.qin@amlogic.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Jul 2023 11:04:57 +0200
Message-ID: <CAMRc=McCKW6x_qrYFowfuxZ8O3at1NjudjyxabHTomzQz7R0yg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: Add a header file for Amlogic
 C3 SoCs
To:     Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        andy@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 10, 2023 at 6:28=E2=80=AFAM Huqiang Qin <huqiang.qin@amlogic.co=
m> wrote:
>
> Add dt-binding and related header file for Amlogic C3 GPIO.
>

The subject of this patch is describing the new model, not only adding
the header, so make the commit message say that, e.g.: dt-bindings:
...: describe xyz

Bart

> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |  1 +
>  include/dt-bindings/gpio/amlogic-c3-gpio.h    | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinc=
trl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinct=
rl-a1.yaml
> index 99080c9eaac3..e019b6aa6ca3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - amlogic,meson-a1-periphs-pinctrl
>        - amlogic,meson-s4-periphs-pinctrl
> +      - amlogic,c3-periphs-pinctrl
>
>  required:
>    - compatible
> diff --git a/include/dt-bindings/gpio/amlogic-c3-gpio.h b/include/dt-bind=
ings/gpio/amlogic-c3-gpio.h
> new file mode 100644
> index 000000000000..75c8da6f505f
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic-c3-gpio.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_C3_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_C3_GPIO_H
> +
> +#define        GPIOE_0         0
> +#define        GPIOE_1         1
> +#define        GPIOE_2         2
> +#define        GPIOE_3         3
> +#define        GPIOE_4         4
> +
> +#define        GPIOB_0         5
> +#define        GPIOB_1         6
> +#define        GPIOB_2         7
> +#define        GPIOB_3         8
> +#define        GPIOB_4         9
> +#define        GPIOB_5         10
> +#define        GPIOB_6         11
> +#define        GPIOB_7         12
> +#define        GPIOB_8         13
> +#define        GPIOB_9         14
> +#define        GPIOB_10        15
> +#define        GPIOB_11        16
> +#define        GPIOB_12        17
> +#define        GPIOB_13        18
> +#define        GPIOB_14        19
> +
> +#define        GPIOC_0         20
> +#define        GPIOC_1         21
> +#define        GPIOC_2         22
> +#define        GPIOC_3         23
> +#define        GPIOC_4         24
> +#define        GPIOC_5         25
> +#define        GPIOC_6         26
> +
> +#define        GPIOX_0         27
> +#define        GPIOX_1         28
> +#define        GPIOX_2         29
> +#define        GPIOX_3         30
> +#define        GPIOX_4         31
> +#define        GPIOX_5         32
> +#define        GPIOX_6         33
> +#define        GPIOX_7         34
> +#define        GPIOX_8         35
> +#define        GPIOX_9         36
> +#define        GPIOX_10        37
> +#define        GPIOX_11        38
> +#define        GPIOX_12        39
> +#define        GPIOX_13        40
> +
> +#define        GPIOD_0         41
> +#define        GPIOD_1         42
> +#define        GPIOD_2         43
> +#define        GPIOD_3         44
> +#define        GPIOD_4         45
> +#define        GPIOD_5         46
> +#define        GPIOD_6         47
> +
> +#define        GPIOA_0         48
> +#define        GPIOA_1         49
> +#define        GPIOA_2         50
> +#define        GPIOA_3         51
> +#define        GPIOA_4         52
> +#define        GPIOA_5         53
> +
> +#define        GPIO_TEST_N     54
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_C3_GPIO_H */
> --
> 2.37.1
>
