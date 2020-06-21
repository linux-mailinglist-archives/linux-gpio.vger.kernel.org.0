Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5874B202D45
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgFUVvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgFUVvZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:51:25 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D4BC061794;
        Sun, 21 Jun 2020 14:51:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so15995868ejn.10;
        Sun, 21 Jun 2020 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C6Tq/liioq2UyKzEaWtu9VTGJjccozN1RCpnhQeCWcc=;
        b=SLEpILXWxAjObaeL0ryGxor/nIrSX9AF7pdnzRkTTOd/UDyj9BiXWpnCxQ0UwpU0hA
         Y6DghwWiyUhBWfx7CabHQ/EM5NNjtw/9vCvFkz1zF1ReiAvzEhELMJaIBUbKnRTzZthI
         gf5corGIhmG03zvb6/uEd3l9gwgV0Wi07Y1x2OL42tHBaISUljtsiec5spZR+bTqf3Qn
         24sPYvFYfBwdGU/AkXDJmUmfNQfo/57jZtcWTSoh1ONf/mFR7DrYIpD9PI9ME7Yj9wyb
         0WF6cWy1mbC/PC8JsyINfvkeAuTZIYmbBL+JJYYzuU4xcyeGBsmgy23y4Jquo6/Fg960
         c9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C6Tq/liioq2UyKzEaWtu9VTGJjccozN1RCpnhQeCWcc=;
        b=O0wjoHu0eiTECAMtwAeL5V+m35msidJS/E8MI2CufB9+Y24fONSoLHrrLykriS5E7S
         wxb4x6UU/KRE1+ZNTCemybpKa7B8rSVWcEh5+aL2JcRyiLvi2VCVWBK/Tci+czcOpNVq
         pTZ8pSFgOdcddWhtAR41cRsLQE1itW6UDDusWXX7UVbujXKZdMqnTLslO4cdr8z7gZLF
         P1xWT9yhjZe5DJL/+vLQJ4io2QFuUSdObS0YL5FWD+qNCLrBr8pI4kaf1K31mhEjjvOc
         YzyAoGx9dHOh19YsaiugoUBp8/SFPwTL0/WpC5PSP9mciS1Rw5r29lVfvuPyYic7QJUe
         Y0uw==
X-Gm-Message-State: AOAM530XDUI0gMMPqdSemaXUZTj+gARruzfhk+Cgu1XCJnTVCTRq8tdl
        4b7oa+mJNH3asubzEkeyUXkWe04m7amPpYD9SRs=
X-Google-Smtp-Source: ABdhPJzz157p4nNXnRl9LV6GUwfM5g4DaNTYskNEv6jpTLmePiwLbFMvAgdAbb5yGz8w3iE7k58JLLdv6XcuJ5jPBL0=
X-Received: by 2002:a17:906:4cd0:: with SMTP id q16mr5105594ejt.418.1592776283512;
 Sun, 21 Jun 2020 14:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com> <20200621213806.551879-9-konradybcio@gmail.com>
In-Reply-To: <20200621213806.551879-9-konradybcio@gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Sun, 21 Jun 2020 23:51:12 +0200
Message-ID: <CADQ2G_G8iFE_9oNRBFum_je8FGgZCEe-Hj1SMr06x+xoBanAnA@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10
 Plus (Ganges platform)
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tested-by: Martin Botka <martin.botka.1@gmail.com>


ne 21. 6. 2020 o 23:38 Konrad Dybcio <konradybcio@gmail.com> nap=C3=ADsal(a=
):
>
> From: Martin Botka <martin.botka1@gmail.com>
>
> Add device tree support for the Sony Xperia 10 and 10
> Plus smartphones. They are all based on the Sony Ganges
> platform (sdm630/636) and share a lot of common code.
> The differences are really minor, so a Ganges-common DTSI
> has been created to reduce clutter.
>
> 10 - Kirin
> 10 Plus - Mermaid
>
> This platform is based on SoMC Nile, but there are some
> major differences when it comes to pin configuration and
> panel setup (among others).
>
> The boards currently support:
> * Screen console
> * SDHCI
> * I2C
> * pstore log dump
> * GPIO keys
> * PSCI idle states
>
> Signed-off-by: Martin Botka <martin.botka1@gmail.com>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../qcom/sdm630-sony-xperia-ganges-kirin.dts  | 13 +++++++
>  .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   | 39 +++++++++++++++++++
>  .../sdm636-sony-xperia-ganges-mermaid.dts     | 19 +++++++++
>  4 files changed, 73 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-ki=
rin.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dt=
si
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-me=
rmaid.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1cad7cb07574..c98bafe03a96 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,9 +16,11 @@ dtb-$(CONFIG_ARCH_QCOM)      +=3D msm8998-hp-envy-x2.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D msm8998-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sc7180-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-ganges-kirin.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-discovery.dt=
b
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-pioneer.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm630-sony-xperia-nile-voyager.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm636-sony-xperia-ganges-mermaid.dt=
b
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm660-xiaomi-lavender.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sdm845-cheza-r2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts=
 b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
> new file mode 100644
> index 000000000000..5326e019db20
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Martin Botka
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm630-sony-xperia-ganges.dtsi"
> +
> +/ {
> +    model =3D "SoMC Kirin-RoW";
> +    compatible =3D "sony,kirin-row", "qcom,sdm630", "qcom,sdm630-mtp";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi b/ar=
ch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
> new file mode 100644
> index 000000000000..6c4c30e4cd9d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Martin Botka
> + */
> +
> +/dts-v1/;
> +
> +/* Ganges is very similar to Nile, but
> +there are some differences that will need
> +to be addresed when more peripherals are
> +enabled upstream. Hence the separate DTSI. */
> +#include "sdm630-sony-xperia-nile.dtsi"
> +
> +/ {
> +    chosen {
> +        framebuffer@9d400000 {
> +            reg =3D <0 0x9d400000 0 (2520 * 1080 * 4)>;
> +            height =3D <2520>;
> +        };
> +    };
> +
> +    soc {
> +
> +        i2c@c175000 {
> +            status =3D "okay";
> +
> +            /* Novatek touchscreen */
> +        };
> +
> +        /* Yes, this is intentional.
> +        Ganges devices only use gpio-keys for
> +        Volume Down, but currently there's an
> +        issue with it that has to be resolved.
> +        Until then, let's not make the kernel panic
> +        */
> +        /delete-node/ gpio-keys;
> +    };
> +
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.d=
ts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> new file mode 100644
> index 000000000000..97dce64d0185
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Martin Botka
> + */
> +
> +/dts-v1/;
> +
> +/* Mermaid uses sdm636, but it's different ever so slightly
> +that we can ignore it for the time being. Sony also commonizes
> +the Ganges platform as a whole in downstream kernels. */
> +#include "sdm630-sony-xperia-ganges.dtsi"
> +
> +/ {
> +    model =3D "SoMC Mermaid-RoW";
> +    compatible =3D "sony,mermaid-row", "qcom,sdm636", "qcom,sdm636-mtp";
> +
> +    qcom,msm-id =3D <345 0>;
> +    qcom,pmic-id =3D <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00=
 0x00 0x1001b 0x102001a 0x00 0x00>;
> +};
> --
> 2.27.0
>
