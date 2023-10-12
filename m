Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3567C673C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 09:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378013AbjJLHk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 03:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjJLHkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 03:40:24 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4275DD8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:40:20 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-694ed84c981so533590b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697096420; x=1697701220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeyFnsq7kj9nc73z+mJcYj/SpiIQNbMhSQED5EpeFnk=;
        b=J2YsdFYQ2M8Nck2NuIb55XvT7ouEU99gTX4h7OsZE8vL7D6pwGoK60bwO2T9BJXbG8
         JMNo062PU3Cc/fUPbDKWoblALxERXIlGXz/95ioDPWKGk8zE0xuqZXe7VqTXFofxncQ2
         25z4J9nW5vDhCkYUMWfFanRyG6YFUeV2At7B/k/4FbcTTYx+ABDS6qNu7a/iC1WTF6Ud
         o1ZUZ4vAvLQspjUMSl+reTDAqkgw1wrlelzXINM2IMONcV+F88uaehpjRnOpFotNMHfN
         mEFDcQoUCmxZy0O3SXOcNDlxOV/avXxkAGukvubRWpPeyE5Gpmc7yxE7JPai1lDhSWYk
         Nb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697096420; x=1697701220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeyFnsq7kj9nc73z+mJcYj/SpiIQNbMhSQED5EpeFnk=;
        b=KJYYgCDFw7mMccn8dBED+kYfN/rSKEXIsgNvEX1gNJELZrf9a5ptBQ1qOIRqntBRU0
         Uv57qLBJISkOh0eb7H4JpC5KVIbLi/fJMsckgqo/RckSox+SMkyMkqykn89i6MccqFV9
         yeNp+2Imp/ShIivEPD7WJufdQCfppDYMzPZvpInhSdNDqFMhQbiWxM4jpKjmDt3WeibO
         x8Qbsm3DsLHjv7FEYgB1741AKsq3Ra/69BFrI07C3K5ZXTsylwk0omeBz/FOBS5rJ6ig
         4gl8pq0MP8ki7rZa8xq5Y4mGua5cVWnV1E/MewmQsa2A1Iumrl0KT5WLqCDG3wGF4lER
         hNQg==
X-Gm-Message-State: AOJu0YzzmFmJazUHDbwP0u7F+quUBE4MqrAi/BNGXcZwnrgFF48vBUAl
        MSp01yVZvsj/N/gq90IGj+a269MAnpuYWtPHqMUGMg==
X-Google-Smtp-Source: AGHT+IH/pqOJSGAUpimWG1P472lbC+Hea49S/OE3uBkgKRUitvR9pB1D0mSrJquRil0M1gwvWAx/gEyoiscMqY9skRo=
X-Received: by 2002:a05:6a20:4286:b0:159:e0b9:bd02 with SMTP id
 o6-20020a056a20428600b00159e0b9bd02mr25980791pzj.40.1697096419671; Thu, 12
 Oct 2023 00:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-19-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-19-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 02:40:07 -0500
Message-ID: <CAPLW+4mX5bK7zxpxS_1a5Gi1gG8UFRDpMehnSxxXibTFCn_Txg@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] arm64: dts: google: Add initial Oriole/pixel 6
 board support
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
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/Makefile         |  4 ++
>  arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/go=
ogle/Makefile
> new file mode 100644
> index 000000000000..5cea8ff27141
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) +=3D \
> +       gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boo=
t/dts/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..3bebca989d34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;

Why is this needed? Is that really not possible to build this board
dts as actual dtb, not dtbo (and remove this 'plugin' line)? If GS
bootloader is similar to Exynos850 bootloader, it should be possible
to only use dtb, and flash empty dtbo image. Just a thought.

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +       model =3D "Oriole";
> +       compatible =3D "google,gs101-oriole", "google,gs101";
> +
> +       chosen {
> +               bootargs =3D "earlycon=3Dexynos4210,mmio32,0x10A00000 con=
sole=3DttySAC0";

Why is that earlycon is needed here? The serial should work fine (and
actually even better) without that. Might be very useful for debugging
though, but in production dts I'd remove that bit. Also, not sure why
console is needed. Isn't it enough to just have something like:

        stdout-path =3D &serial_0;

inside of /chosen node?

Btw, why isn't serial node enabled somewhere in this dts?

> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&key_voldown &key_volup &key_power>;
> +
> +               button-vol-down {
> +                       label =3D "KEY_VOLUMEDOWN";
> +                       linux,code =3D <KEY_VOLUMEDOWN>;
> +                       gpios =3D <&gpa7 3 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +
> +               button-vol-up {
> +                       label =3D "KEY_VOLUMEUP";
> +                       linux,code =3D <KEY_VOLUMEUP>;
> +                       gpios =3D <&gpa8 1 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +
> +               button-power {
> +                       label =3D "KEY_POWER";
> +                       linux,code =3D <KEY_POWER>;
> +                       gpios =3D <&gpa10 1 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +       };
> +};
> +
> +&pinctrl_1 {
> +       key_voldown: key-voldown-pins {
> +               samsung,pins =3D "gpa7-3";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;

Here and further: maybe replace pid-function and pin-pud hard-coded
values with corresponding named constants?

> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       key_volup: key-volup-pins {
> +               samsung,pins =3D "gpa8-1";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&pinctrl_0 {
> +       key_power: key-power-pins {
> +               samsung,pins =3D "gpa10-1";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&watchdog_cl0 {
> +       timeout-sec =3D <30>;

No status =3D "okay" here? The same question goes for wdt_cl1.

> +};
> --
> 2.42.0.655.g421f12c284-goog
>
