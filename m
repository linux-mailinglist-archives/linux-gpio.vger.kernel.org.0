Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578ED7C6714
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 09:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347103AbjJLHYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 03:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377720AbjJLHXz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 03:23:55 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D552EC0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:23:50 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c88b467ef8so5743585ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697095430; x=1697700230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah964nhhRjTlqCRCTQx6nSLutIhQSEdJpinzUq6ePz4=;
        b=tO246fgFqITMbbRz3ag2GIcVxsKIMo0ndheZijUsYe4RhkScgU3kldsl+fxnkl895w
         olQGJW9UU1qqKneWdkzQaqpqxBw+QbLTMYHgFffUl1Gs2y8MSDs19CfeHYItgoq/EJaG
         tngxbU8C06K8i62LqidUKi2iovxvwG0Zdr4FmTz75kJXNUljY+sj70p+l9vFaHZWtWVE
         x3vuzRFzPzsGc5izgAULP7SWRcc9K2BWfNkNTzvHfx9Z+mEDRvgX/5QIJ48kycqicR4t
         aW6B6Yv1eC+BKxBZ5vKC5f4xTfCLt1IDF3+KQf1RmBoQFHHkFS/Qk1sJvCU26BNTGD2C
         70iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697095430; x=1697700230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah964nhhRjTlqCRCTQx6nSLutIhQSEdJpinzUq6ePz4=;
        b=Mth4Mb/qb5lzpSI8P4WD2MCyFckUjt7adJ9YqDL9QBEwSiI2HJGhu29L1PNWmEQqZZ
         yD904BVLXl7eB5bGHY9jnLJSUY3NTfrZOZwtgz71EzRV9oyQNU0Dc2V+g6459uKSEN93
         8AiE1iOBVWVXmGFvov4xQ1UpJ1XzpxHWBjh5YACKTmxod5DjYyxe4ZULPEBtkmqF9qaH
         u+pAkBnzOpp/i7d5YpiAI1abBfNTFtY8MSNIYeCL5u2WmzC1js+7yTFmOGNfsZGrffVr
         ax0VbfrRw4sPKlCnMpw5auu+gUhulXVN5bVU63SzZARxlrK5oTbmzZnq/rZFVvOtk1+M
         df4w==
X-Gm-Message-State: AOJu0Yz43G6MGaoMJYYfJ4xnDkbXRV3Guz4bquVtD8FSUCkG8pOg6tZB
        c02FmX+Rkg5644dhARew6KnglZCMJ+pw5lndbOApoQ==
X-Google-Smtp-Source: AGHT+IH8hg51fYlNUS5pn03ZMnRNpOgqfOq63GqnyO5ngsHS3+64i03p7JeUEiECc5vSsgdEy8RJRJIoknQLGL3PqKU=
X-Received: by 2002:a17:90a:d386:b0:27d:9ed:96fc with SMTP id
 q6-20020a17090ad38600b0027d09ed96fcmr3388750pju.29.1697095429831; Thu, 12 Oct
 2023 00:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-18-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-18-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 02:23:38 -0500
Message-ID: <CAPLW+4=uDEcsJBbkjy48NMF5DPvheJ1ygO8=542=fb91ff8COw@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] arm64: dts: google: Add initial Google gs101 SoC support
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> phones. It features:
> * 4xA55 little cluster
> * 2xA76 Mid cluster
> * 2xX1 Big cluster
>
> This commit adds the basic device tree for gs101 (SoC).
> Further platform support will be added over time.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms                  |    6 +
>  arch/arm64/boot/dts/Makefile                  |    1 +
>  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1275 +++++++++++++++++
>  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   32 +
>  arch/arm64/boot/dts/google/gs101.dtsi         |  504 +++++++
>  5 files changed, 1818 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..a5ed1b719488 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -107,6 +107,12 @@ config ARCH_EXYNOS
>         help
>           This enables support for ARMv8 based Samsung Exynos SoC family.
>
> +config ARCH_GOOGLE_TENSOR
> +       bool "Google Tensor SoC fmaily"
> +       depends on ARCH_EXYNOS
> +       help
> +         Support for ARMv8 based Google Tensor platforms.
> +
>  config ARCH_SPARX5
>         bool "Microchip Sparx5 SoC family"
>         select PINCTRL
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 30dd6347a929..a4ee7b628114 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -13,6 +13,7 @@ subdir-y +=3D broadcom
>  subdir-y +=3D cavium
>  subdir-y +=3D exynos
>  subdir-y +=3D freescale
> +subdir-y +=3D google
>  subdir-y +=3D hisilicon
>  subdir-y +=3D intel
>  subdir-y +=3D lg
> diff --git a/arch/arm64/boot/dts/google/gs101-pinctrl.dtsi b/arch/arm64/b=
oot/dts/google/gs101-pinctrl.dtsi
> new file mode 100644
> index 000000000000..ba88000c3ed8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
> @@ -0,0 +1,1275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright 2019-2023 Google LLC
> + *

This line is not needed. Also, maybe also add Linaro copyright here?

> + */
> +
> +#include "gs101-pinctrl.h"
> +
> +/* GPIO_ALIVE */
> +&pinctrl_0 {

Why not just rename it to pinctrl_alive and remove the comment? The
same goes for all pinctrl nodes below.

> +       gpa0: gpa0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,

Here and further: please align it to be at the same indentation level
as above line.

> +                          <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa1: gpa1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa2: gpa2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa3: gpa3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa4: gpa4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa5: gpa5-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa9: gpa9-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa10: gpa10-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       uart15_bus: uart15-bus-pins {
> +              samsung,pins =3D "gpa2-3", "gpa2-4";
> +              samsung,pin-function =3D <2>;
> +              samsung,pin-pud =3D <0>;

Could above two lines be replaced with some meaningful consts? I see
it's done below.

> +       };
> +
> +       uart16_bus: uart16-bus-pins {
> +              samsung,pins =3D "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
> +              samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +              samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       uart16_bus_rts: uart1-bus-rts-pins {
> +               samsung,pins =3D "gpa3-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-val =3D <1>;
> +       };
> +
> +       uart16_bus_tx_dat: uart1-bus-tx-dat-pins {
> +               samsung,pins =3D "gpa3-1";
> +               samsung,pin-val =3D <1>;
> +       };
> +
> +       uart16_bus_tx_con: uart1-bus-tx-con-pins {
> +               samsung,pins =3D "gpa3-1";
> +               samsung,pin-function =3D <1>;

Named const?

> +       };
> +
> +       uart17_bus: uart17-bus-pins {
> +              samsung,pins =3D "gpa4-0", "gpa4-1", "gpa4-2", "gpa4-3";
> +              samsung,pin-function =3D <2>;
> +              samsung,pin-pud =3D <0>;

Here and further: if possible, try to use named constants.

> +       };
> +
> +       spi15_bus: spi15-bus-pins {
> +               samsung,pins =3D "gpa4-0", "gpa4-1", "gpa4-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi15_cs: spi15-cs-pins {
> +               samsung,pins =3D "gpa4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +/* GPIO_FAR_ALIVE */
> +&pinctrl_1 {
> +       gpa6: gpa6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa7: gpa7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa8: gpa8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gpa11: gpa11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +/* GPIO_GSACORE */
> +&pinctrl_2 {
> +       gps0: gps0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gps1: gps1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gps2: gps2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +};
> +
> +/* GPIO_GSACTRL */
> +&pinctrl_3 {
> +       gps3: gps3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +};
> +
> +/* GPIO_HSI1 */
> +&pinctrl_6 {
> +       gph0: gph0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph1: gph1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       pcie0_clkreq: pcie0-clkreq-pins{
> +               samsung,pins =3D "gph0-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <3>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <3>;
> +               samsung,pin-pud-pdn =3D <3>;

What are those two properties? I don't see them documented in
dt-bindings or being mentioned in the driver.

> +       };
> +
> +       pcie0_perst: pcie0-perst-pins {
> +               samsung,pins =3D "gph0-0";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <3>;
> +       };
> +};
> +
> +/* GPIO_HSI2 */
> +&pinctrl_7 {
> +       gph2: gph2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph3: gph3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph4: gph4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       sd2_clk: sd2-clk-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_cmd: sd2-cmd-pins {
> +               samsung,pins =3D "gph4-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <3>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_bus1: sd2-bus-width1-pins {
> +               samsung,pins =3D "gph4-2";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <3>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_bus4: sd2-bus-width4-pins {
> +               samsung,pins =3D "gph4-3", "gph4-4", "gph4-5";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <3>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +       };
> +
> +       ufs_rst_n: ufs-rst-n-pins {
> +               samsung,pins =3D "gph3-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-con-pdn =3D <3>;
> +               samsung,pin-pud-pdn =3D <0>;
> +       };
> +
> +       ufs_refclk_out: ufs-refclk-out-pins {
> +               samsung,pins =3D "gph3-0";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-con-pdn =3D <3>;
> +               samsung,pin-pud-pdn =3D <0>;
> +       };
> +
> +       pcie1_clkreq: pcie1-clkreq-pins {
> +               samsung,pins =3D "gph2-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <3>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <3>;
> +               samsung,pin-pud-pdn =3D <3>;
> +       };
> +
> +       pcie1_perst: pcie1-perst-pins {
> +               samsung,pins =3D "gph2-0";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <3>;
> +       };
> +};
> +
> +/* GPIO_PERIC0 */
> +&pinctrl_4 {
> +       gpp0: gpp0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp1: gpp1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp2: gpp2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp3: gpp3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp4: gpp4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp5: gpp5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp6: gpp6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp7: gpp7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp8: gpp8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp9: gpp9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp10: gpp10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp11: gpp11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp12: gpp12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp13: gpp13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp14: gpp14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp15: gpp15-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp16: gpp16-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp17: gpp17-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp18: gpp18-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp19: gpp19-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       /* USI_PERIC0_UART_DBG */
> +       uart0_bus: uart0-bus-pins {
> +               samsung,pins =3D "gpp1-2", "gpp1-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       disp_te_pri_on: disp-te-pri-on-pins {
> +               samsung,pins =3D "gpp0-3";
> +               samsung,pin-function =3D <0xf>;
> +       };
> +
> +       disp_te_pri_off: disp-te-pri-off-pins {
> +               samsung,pins =3D "gpp0-3";
> +               samsung,pin-function =3D <0>;
> +       };
> +
> +       disp_te_sec_on: disp-te-sec-on-pins {
> +               samsung,pins =3D "gpp0-4";
> +               samsung,pin-function =3D <0xf>;
> +       };
> +
> +       disp_te_sec_off: disp-te-sec-off-pins {
> +               samsung,pins =3D "gpp0-4";
> +               samsung,pin-function =3D <0>;
> +       };
> +
> +       sensor_mclk1_out: sensor-mclk1-out-pins {
> +               samsung,pins =3D "gpp3-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk1_fn: sensor-mclk1-fn-pins {
> +               samsung,pins =3D "gpp3-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk2_out: sensor-mclk2-out-pins {
> +               samsung,pins =3D "gpp5-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk2_fn: sensor-mclk2-fn-pins {
> +               samsung,pins =3D "gpp5-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk3_out: sensor-mclk3-out-pins {
> +               samsung,pins =3D "gpp7-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk3_fn: sensor-mclk3-fn-pins {
> +               samsung,pins =3D "gpp7-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk4_out: sensor-mclk4-out-pins {
> +               samsung,pins =3D "gpp9-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk4_fn: sensor-mclk4-fn-pins {
> +               samsung,pins =3D "gpp9-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk5_out: sensor-mclk5-out-pins {
> +               samsung,pins =3D "gpp11-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk5_fn: sensor-mclk5-fn-pins {
> +               samsung,pins =3D "gpp11-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk6_out: sensor-mclk6-out-pins {
> +               samsung,pins =3D "gpp13-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk6_fn: sensor-mclk6-fn-pins {
> +               samsung,pins =3D "gpp13-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk7_out: sensor-mclk7-out-pins {
> +               samsung,pins =3D "gpp15-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk7_fn: sensor-mclk7-fn-pins {
> +               samsung,pins =3D "gpp15-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk8_out: sensor-mclk8-out-pins {
> +               samsung,pins =3D "gpp17-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk8_fn: sensor-mclk8-fn-pins {
> +               samsung,pins =3D "gpp17-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       hsi2c14_bus: hsi2c14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart14_bus_single: uart14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1",
> +                              "gpp18-2", "gpp18-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi14_bus: spi14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1", "gpp18-2";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs: spi14-cs-pins {
> +               samsung,pins =3D "gpp18-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs_func: spi14-cs-func-pins {
> +               samsung,pins =3D "gpp18-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c8_bus: hsi2c8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PDN_OUT0>;
> +       };
> +
> +       uart8_bus_single: uart8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1", "gpp16-2",
> +                              "gpp16-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi8_bus: spi8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1", "gpp16-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi8_cs: spi8-cs-pins {
> +               samsung,pins =3D "gpp16-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi8_cs_func: spi8-cs-func-pins {
> +               samsung,pins =3D "gpp16-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c7_bus: hsi2c7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart7_bus_single: uart7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1",
> +                              "gpp14-2", "gpp14-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi7_bus: spi7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1", "gpp14-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi7_cs: spi7-cs-pins {
> +               samsung,pins =3D "gpp14-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi7_cs_func: spi7-cs-func-pins {
> +               samsung,pins =3D "gpp14-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c6_bus: hsi2c6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart6_bus_single: uart6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1",
> +                              "gpp12-2", "gpp12-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi6_bus: spi6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1", "gpp12-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi6_cs: spi6-cs-pins {
> +               samsung,pins =3D "gpp12-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi6_cs_func: spi6-cs-func-pins {
> +               samsung,pins =3D "gpp12-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c5_bus: hsi2c5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart5_bus_single: uart5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1",
> +                              "gpp10-2", "gpp10-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi5_bus: spi5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1", "gpp10-2";
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi5_cs_func: spi5-cs-func-pins {
> +               samsung,pins =3D "gpp10-3";
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       hsi2c4_bus: hsi2c4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart4_bus_single: uart4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1",
> +                              "gpp8-2", "gpp8-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi4_bus: spi4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1", "gpp8-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi4_cs: spi4-cs-pins {
> +               samsung,pins =3D "gpp8-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi4_cs_func: spi4-cs-func-pins {
> +               samsung,pins =3D "gpp8-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c3_bus: hsi2c3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart3_bus_single: uart3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1",
> +                              "gpp6-2", "gpp6-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi3_bus: spi3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1", "gpp6-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi3_cs: spi3-cs-pins {
> +               samsung,pins =3D "gpp6-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi3_cs_func: spi3-cs-func-pins {
> +               samsung,pins =3D "gpp6-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c2_bus: hsi2c2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart2_bus_single: uart2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1",
> +                              "gpp4-2", "gpp4-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi2_bus: spi2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1", "gpp4-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi2_cs: spi2-cs-pins {
> +               samsung,pins =3D "gpp4-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi2_cs_func: spi2-cs-func-pins {
> +               samsung,pins =3D "gpp4-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c1_bus: hsi2c1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart1_bus_single: uart1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1",
> +                              "gpp2-2", "gpp2-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi1_bus: spi1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1", "gpp2-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi1_cs: spi1-cs-pins {
> +               samsung,pins =3D "gpp2-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi1_cs_func: spi1-cs-func-pins {
> +               samsung,pins =3D "gpp2-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +/* GPIO_PERIC1 */
> +&pinctrl_5 {
> +       gpp20: gpp20-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp21: gpp21-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp22: gpp22-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp23: gpp23-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp24: gpp24-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp25: gpp25-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp26: gpp26-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp27: gpp27-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       hsi2c13_bus: hsi2c13-bus-pins  {
> +               samsung,pins =3D "gpp25-0", "gpp25-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart13_bus_single: uart13-bus-pins {
> +              samsung,pins =3D "gpp25-0", "gpp25-1",
> +                             "gpp25-2", "gpp25-3";
> +              samsung,pin-function =3D <2>;
> +              samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi13_bus: spi13-bus-pins {
> +               samsung,pins =3D "gpp25-0", "gpp25-1", "gpp25-2";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi13_cs: spi13-cs-pins {
> +               samsung,pins =3D "gpp25-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi13_cs_func: spi13-cs-func-pins {
> +               samsung,pins =3D "gpp25-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c12_bus: hsi2c12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart12_bus_single: uart12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5",
> +                              "gpp23-6", "gpp23-7";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi12_bus: spi12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5", "gpp23-6";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs2: spi14-cs2-pins {
> +               samsung,pins =3D "gpp23-6";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi12_cs: spi12-cs-pins {
> +               samsung,pins =3D "gpp23-7";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi12_cs_func: spi12-cs-func-pins {
> +               samsung,pins =3D "gpp23-7";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c11_bus: hsi2c11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart11_bus_single: uart11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1",
> +                              "gpp23-2", "gpp23-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi11_bus: spi11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1", "gpp23-2";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi11_cs: spi11-cs-pins {
> +               samsung,pins =3D "gpp23-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi11_cs_func: spi11-cs-func-pins {
> +               samsung,pins =3D "gpp23-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c10_bus: hsi2c10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart10_bus_single: uart10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1",
> +                              "gpp21-2", "gpp21-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi10_bus: spi10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1", "gpp21-2";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi10_cs: spi10-cs-pins {
> +               samsung,pins =3D "gpp21-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi10_cs_func: spi10-cs-func-pins {
> +               samsung,pins =3D "gpp21-3";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c9_bus: hsi2c9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart9_bus_single: uart9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5",
> +                              "gpp20-6", "gpp20-7";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi9_bus: spi9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5", "gpp20-6";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi9_cs: spi9-cs-pins {
> +               samsung,pins =3D "gpp20-7";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi9_cs_func: spi9-cs-func-pins {
> +               samsung,pins =3D "gpp20-7";
> +               samsung,pin-function =3D <2>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c0_bus: hsi2c0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart0_bus_single: uart0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1",
> +                              "gpp20-2", "gpp20-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       spi0_bus: spi0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1", "gpp20-2";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi0_cs: spi0-cs-pins {
> +               samsung,pins =3D "gpp20-3";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi0_cs_func: spi0-cs-func-pins {
> +               samsung,pins =3D "gpp20-3";
> +               samsung,pin-function =3D <3>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> diff --git a/arch/arm64/boot/dts/google/gs101-pinctrl.h b/arch/arm64/boot=
/dts/google/gs101-pinctrl.h
> new file mode 100644
> index 000000000000..16c54888f4bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-pinctrl.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Pinctrl binding constants for GS101
> + *
> + * Copyright (c) 2020-2023 Google, LLC.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
> +#define __DT_BINDINGS_PINCTRL_GS101_H__
> +
> +#define GS101_PIN_PULL_NONE            0
> +#define GS101_PIN_PULL_DOWN            1
> +#define GS101_PIN_PULL_UP              3
> +
> +/* Pin function in power down mode */
> +#define GS101_PIN_PDN_OUT0             0
> +#define GS101_PIN_PDN_OUT1             1
> +#define GS101_PIN_PDN_INPUT            2
> +#define GS101_PIN_PDN_PREV             3
> +
> +/* GS101 drive strengths */
> +#define GS101_PIN_DRV_2_5_MA           0
> +#define GS101_PIN_DRV_5_MA             1
> +#define GS101_PIN_DRV_7_5_MA           2
> +#define GS101_PIN_DRV_10_MA            3
> +
> +#define GS101_PIN_FUNC_INPUT           0
> +#define GS101_PIN_FUNC_OUTPUT          1
> +#define GS101_PIN_FUNC_2               2
> +#define GS101_PIN_FUNC_3               3
> +

Maybe it's possible to somehow re-use already existing values in
arch/arm64/boot/dts/exynos/exynos-pinctrl.h?

> +#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
> diff --git a/arch/arm64/boot/dts/google/gs101.dtsi b/arch/arm64/boot/dts/=
google/gs101.dtsi
> new file mode 100644
> index 000000000000..37fb0a4dc8d3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101.dtsi
> @@ -0,0 +1,504 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC
> + *
> + * Copyright 2019-2023 Google LLC
> + *

This line is not needed. Also (but not sure): maybe add the author and
Linaro copyright?

> + */
> +
> +#include <dt-bindings/clock/google,gs101.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible =3D "google,gs101";
> +       #address-cells =3D <2>;
> +       #size-cells =3D <1>;
> +
> +       interrupt-parent =3D <&gic>;
> +
> +       aliases {
> +               pinctrl0 =3D &pinctrl_0;
> +               pinctrl1 =3D &pinctrl_1;
> +               pinctrl2 =3D &pinctrl_2;
> +               pinctrl3 =3D &pinctrl_3;
> +               pinctrl4 =3D &pinctrl_4;
> +               pinctrl5 =3D &pinctrl_5;
> +               pinctrl6 =3D &pinctrl_6;
> +               pinctrl7 =3D &pinctrl_7;
> +               serial0 =3D &serial_0;
> +       };
> +
> +       arm-pmu {
> +               compatible =3D "arm,armv8-pmuv3";

Is there any more specifi Cortex PMU compatible for this chip?

> +               interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_T=
YPE_LEVEL_HIGH)>;

Please try to keep it to 80 characters per line.

> +       };
> +
> +       dsu-pmu-0 {
> +               compatible =3D "arm,dsu-pmu";
> +               interrupts =3D <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
> +               cpus =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +                      <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +       };
> +
> +       /* TODO replace with CCF clock */
> +       dummy_clk: oscillator {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <12345>;
> +               clock-output-names =3D "pclk";
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;

Why 2-cells is needed here? If you make it 1, all below reg properties
can be made 1-cell, which removes not needed 0x0.

> +               #size-cells =3D <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu =3D <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu =3D <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu =3D <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu =3D <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu5>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu =3D <&cpu6>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";

Is there maybe any more specific Cortex compatible?

> +                       reg =3D <0x0 0x0000>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0100>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0200>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0300>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0400>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <620>;
> +                       dynamic-power-coefficient =3D <284>;
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0500>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <620>;
> +                       dynamic-power-coefficient =3D <284>;
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0600>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <650>;
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0700>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <650>;
> +               };
> +
> +               idle-states {
> +                       entry-method =3D "psci";
> +
> +                       ANANKE_CPU_SLEEP: cpu-ananke-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <70>;
> +                               exit-latency-us =3D <160>;
> +                               min-residency-us =3D <2000>;
> +                       };
> +
> +                       ENYO_CPU_SLEEP: cpu-enyo-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <150>;
> +                               exit-latency-us =3D <190>;
> +                               min-residency-us =3D <2500>;
> +                       };
> +
> +                       HERA_CPU_SLEEP: cpu-hera-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <235>;
> +                               exit-latency-us =3D <220>;
> +                               min-residency-us =3D <3500>;
> +                       };
> +               };
> +       };
> +
> +       /* bootloader requires ect node */
> +       ect {
> +               parameter_address =3D <0x90000000>;
> +               parameter_size =3D <0x53000>;
> +       };

The bootloader doesn't work if you just remove this?

> +
> +       ext_24_5m: clock-1 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <24576000>;

The frequency is probably should be set in board dts file. Because the
crystal is actually soldered on the board, not in SoC.

> +               clock-output-names =3D "oscclk";
> +       };
> +
> +       ext_200m: clock-2 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <200000000>;

Ditto.

> +               clock-output-names =3D "ext-200m";
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       reserved_memory: reserved-memory {
> +               #address-cells =3D <2>;

Doesn't look like 2-cell address is really needed here.

> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               gsa_reserved_protected: gsa@90200000 {
> +                       reg =3D <0x0 0x90200000 0x400000>;
> +                       no-map;
> +               };
> +
> +               tpu_fw_reserved: tpu-fw@93000000 {
> +                       reg =3D <0x0 0x93000000 0x1000000>;
> +                       no-map;
> +               };
> +
> +               aoc_reserve: aoc@94000000 {
> +                       reg =3D <0x0 0x94000000 0x03000000>;
> +                       no-map;
> +               };
> +
> +               abl_reserved: abl@f8800000 {
> +                       reg =3D <0x0 0xf8800000 0x02000000>;
> +                       no-map;
> +               };
> +
> +               dss_log_reserved: dss-log-reserved@fd3f0000 {
> +                       reg =3D <0 0xfd3f0000 0x0000e000>;
> +                       no-map;
> +               };
> +
> +               debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
> +                       reg =3D <0 0xfd3fe000 0x00001000>;
> +                       no-map;
> +               };
> +
> +               bldr_log_reserved: bldr-log-reserved@fd800000 {
> +                       reg =3D <0 0xfd800000 0x00100000>;
> +                       no-map;
> +               };
> +
> +               bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
> +                       reg =3D <0 0xfd900000 0x00002000>;
> +                       no-map;
> +               };
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TY=
PE_LEVEL_LOW)>;
> +               clock-frequency =3D <24576000>;
> +       };
> +
> +       soc: soc@0 {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;

Is 2 cells are really needed for the addresses in this node? I only
see 32-bit addresses below in reg properties.

> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               cmu_misc: clock-controller@10010000 {
> +                       compatible =3D "google,gs101-cmu-misc";
> +                       reg =3D <0x0 0x10010000 0x8000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D  <&ext_24_5m>, <&cmu_top CLK_DOUT_MISC=
_BUS>;
> +                       clock-names =3D "oscclk", "dout_cmu_misc_bus";
> +               };
> +
> +               watchdog_cl0: watchdog@10060000 {
> +                       compatible =3D "google,gs101-wdt";
> +                       reg =3D <0x0 0x10060000 0x100>;
> +                       interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0>=
, <&ext_24_5m>;
> +                       clock-names =3D "watchdog", "watchdog_src";
> +                       samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> +                       samsung,cluster-index =3D <0>;
> +               };
> +
> +               watchdog_cl1: watchdog@10070000 {
> +                       compatible =3D "google,gs101-wdt";
> +                       reg =3D <0x0 0x10070000 0x100>;
> +                       interrupts =3D <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1>=
, <&ext_24_5m>;
> +                       clock-names =3D "watchdog", "watchdog_src";
> +                       samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> +                       samsung,cluster-index =3D <1>;
> +                       status =3D "disabled";
> +               };
> +
> +               gic: interrupt-controller@10400000 {
> +                    compatible =3D "arm,gic-v3";
> +                    #interrupt-cells =3D <3>;
> +                    interrupt-controller;
> +                    reg =3D <0x0 0x10400000 0x10000>,    /* GICD */
> +                          <0x0 0x10440000 0x100000>;   /* GICR * 8 */
> +                    interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               sysreg_peric0: syscon@10821000 {
> +                       compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
> +                       reg =3D <0x0 0x10821000 0x40000>;
> +               };
> +
> +               /* GPIO_PERIC0 */

This comment won't be needed if you rename pinctrl_4 -> pinctrl_peric0 :)

> +               pinctrl_4: pinctrl@10840000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x10840000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               serial_0: serial@10a00000 {
> +                       compatible =3D "google,gs101-uart";
> +                       reg =3D <0x0 0x10a00000 0xc0>;
> +                       reg-io-width =3D <4>;
> +                       samsung,uart-fifosize =3D <256>;
> +                       interrupts =3D <GIC_SPI 634 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&dummy_clk 0>, <&dummy_clk 0>;
> +                       clock-names =3D "uart", "clk_uart_baud0";
> +               };

Does this SoC have USI blocks? If so, maybe this node should be made a
children of some USI node?

> +
> +               /* GPIO_PERIC1 */
> +               pinctrl_5: pinctrl@10c40000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x10C40000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               sysreg_peric1: syscon@10c21000 {
> +                       compatible =3D "google,gs101-peric1-sysreg", "sys=
con";
> +                       reg =3D <0x0 0x10C21000 0x40000>;
> +               };
> +
> +               /* GPIO_HSI1 */
> +               pinctrl_6: pinctrl@11840000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x11840000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               /* GPIO_HSI2 */
> +               pinctrl_7: pinctrl@14440000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x14440000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               cmu_apm: clock-controller@17400000 {
> +                       compatible =3D "google,gs101-cmu-apm";
> +                       reg =3D <0x0 0x17400000 0x8000>;
> +                       #clock-cells =3D <1>;
> +
> +                       clocks =3D <&ext_24_5m>;
> +                       clock-names =3D "oscclk";
> +               };
> +
> +               sysreg_apm: syscon@174204e0 {
> +                       compatible =3D "google,gs101-apm-sysreg", "syscon=
";
> +                       reg =3D <0x0 0x174204e0 0x1000>;
> +               };

Sure it doesn't need any clock? I remember having some issues until I
declared a clock for some Exynos850 sysreg node.

> +
> +               pmu_system_controller: system-controller@17460000 {
> +                       compatible =3D "google,gs101-pmu", "syscon";
> +                       reg =3D <0x0 0x17460000 0x10000>;
> +               };
> +
> +               /* GPIO_ALIVE */
> +               pinctrl_0: pinctrl@174d0000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x174d0000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;

Are you sure all those interrupts are actually needed? Please check
this patch: daeb1c2b50fb ("arm64: dts: exynos: drop incorrectly placed
wakeup interrupts in Exynos850"). If you decide to remove those
interrupts, then bindings doc should be changed too I guess.

> +
> +                       wakeup-interrupt-controller {
> +                               compatible =3D "google,gs101-wakeup-eint"=
;
> +                       };
> +               };
> +
> +               /* GPIO_FAR_ALIVE */
> +               pinctrl_1: pinctrl@174e0000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x174e0000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible =3D "google,gs101-wakeup-eint"=
;
> +                       };
> +               };
> +
> +               /* GPIO_GSACTRL */
> +               pinctrl_3: pinctrl@17940000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x17940000 0x00001000>;
> +               };
> +
> +               /* GPIO_GSACORE */
> +               pinctrl_2: pinctrl@17a80000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x0 0x17a80000 0x00001000>;
> +               };
> +
> +               cmu_top: clock-controller@1e080000 {

Move it up to other cmus, to make nodes under soc ordered alphabetically?

> +                       compatible =3D "google,gs101-cmu-top";
> +                       reg =3D <0x0 0x1e080000 0x8000>;
> +                       #clock-cells =3D <1>;
> +
> +                       clocks =3D <&ext_24_5m>;
> +                       clock-names =3D "oscclk";
> +               };
> +       };
> +};
> +
> +#include "gs101-pinctrl.dtsi"
> --
> 2.42.0.655.g421f12c284-goog
>
