Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2717F203E82
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgFVRzj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbgFVRzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:55:38 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234E9C061797
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:55:37 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 72so240713otc.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yL/GGFgKvPpT/ESkDllNmDDqKcU651dh4sx64jW309s=;
        b=AT4AvU9sAT5ioVcP/Ma82mag06FRZC53FNcWA1/DQgm2s3sS33VltL9VIEI3UqR0M5
         TNTcrDi7uP7DdLozHKbKufOXZKfzrTJpjDIVIcd3As/rfGfC4xxeW2Fu65Yr0k22eOEi
         qX9SP3JdyPQMPfz5IvW1Aef66AMQtm5vGBr+K+tWNkBWMLB4zsAi1h+uRlBAQ/7tlORO
         tkP+zf5ZaWa98u/3LgqRZiDpD8ublLJ9e2OB8sb0Kah9I5R793MuvtMFLtNKlJan3iKh
         VYRwouZuzG9f+nUHLefWF6ZF6Ydga4Ge/rPCe6pxSPMh99UBaVKUMbauepZ0T61t9Nyu
         JoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yL/GGFgKvPpT/ESkDllNmDDqKcU651dh4sx64jW309s=;
        b=T+BZcuS4scVZMnvIVKrvQeCH9+ezttqpzkOdc4tL6xodigRfjF4pk7IjuDG2cXxjwM
         i3FKkPNeKE+Q5cb6matJ0pt9nPu0Jn+b8W2CJjnvJJDmsMatwaXxYv/MNXqduxaTrURE
         zZ+Ip22u0sUGKaAfVMIZ8uLFV2BivFOh03/NCfaAVBKtAujVDSi7zsg1hTT4LfrHH+tY
         YavmJHZE2tKpJlceuMW4BZOi24Y9bF2kPD7z7jvAh23iHlLsHrgTLQPXS2HCgb8UIZAP
         8t8QH/PdB2c2SI+0TJjmEtG3v3NhUm/95o9BtNipMvsMzmoE1ZYVZ+FF1wqp58dIePKC
         BKEQ==
X-Gm-Message-State: AOAM5330FLnu259sNaPFQ1v9XPNG/C1WllMqlLtA1XKPC62V8/RM2SKD
        tIrdS/c7nu4g67R1ZKcgImmO5Q==
X-Google-Smtp-Source: ABdhPJxdPSEtlZTw4FnQA7BtS442zJ/JmTFbMHgsow0c1g5UJUAeaTEOfHwjrLB7P+2NEyn5SJtbgg==
X-Received: by 2002:a4a:e2c1:: with SMTP id l1mr15507498oot.12.1592848536280;
        Mon, 22 Jun 2020 10:55:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k15sm3552652oom.22.2020.06.22.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:55:35 -0700 (PDT)
Date:   Mon, 22 Jun 2020 10:52:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        ??ukasz Patron <priv.luk@gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
Message-ID: <20200622175250.GT128451@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-8-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-8-konradybcio@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

> Add device tree support for the Sony Xperia XA2, XA2 Plus and
> XA2 Ultra smartphones. They are all based on the Sony Nile
> platform (sdm630) and share a lot of common code. The
> differences are really minor, so a Nile-common DTSI
> has been created to reduce clutter.
> 
> XA2 - Pioneer
> XA2 Plus - Voyager
> XA2 Ultra - Discovery
> 
> The boards currently support:
> * Screen console
> * SDHCI
> * I2C
> * pstore log dump
> * GPIO keys
> * PSCI idle states
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Tested-by: ??ukasz Patron <priv.luk@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   3 +
>  .../sdm630-sony-xperia-nile-discovery.dts     |  13 ++
>  .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  13 ++
>  .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  20 +++
>  .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 135 ++++++++++++++++++
>  5 files changed, 184 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0f2c33d611df..1cad7cb07574 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
> new file mode 100644
> index 000000000000..1312eebe76a1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm630-sony-xperia-nile.dtsi"
> +
> +/ {
> +	model = "SoMC Discovery-RoW";

Given that this is already stated by the compatible, would it be
reasonable to make this use the marketing name instead?

(I.e. "Sony Mobile Xperia XA2 Ultra")

> +	compatible = "sony,discovery-row", "qcom,sdm630", "qcom,sdm630-mtp";

Does the -mtp one have any significance? Otherwise I would like you to
drop this - given that this isn't going to be compatible with the actual
MTP hardware.

> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
> new file mode 100644
> index 000000000000..76f20ad5273f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm630-sony-xperia-nile.dtsi"
> +
> +/ {
> +	model = "SoMC Pioneer-RoW";
> +	compatible = "sony,pioneer-row", "qcom,sdm630", "qcom,sdm630-mtp";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
> new file mode 100644
> index 000000000000..82e54a73d172
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm630-sony-xperia-nile.dtsi"
> +
> +/ {
> +	model = "SoMC Voyager-RoW";
> +	compatible = "sony,voyager-row", "qcom,sdm630", "qcom,sdm630-mtp";
> +
> +	chosen {
> +		framebuffer@9d400000 {
> +			reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
> +			height = <2160>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> new file mode 100644
> index 000000000000..af75ab211b5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm630.dtsi"
> +#include "pm660.dtsi"
> +#include "pm660l.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +
> +/ {
> +	/* required for bootloader to select correct board */
> +	qcom,msm-id = <318 0>;
> +	qcom,board-id = <8 1>;
> +	qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00>;
> +
> +	/* This part enables graphical output via bootloader-enabled display */
> +	chosen {
> +		bootargs = "earlycon=tty0 console=tty0";
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "framebuffer0";
> +
> +		framebuffer0: framebuffer@9d400000 {
> +		compatible = "simple-framebuffer";

Please check the indentation here.

> +		reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
> +		width = <1080>;
> +		height = <1920>;
> +		stride = <(1080 * 4)>;
> +		format = "a8r8g8b8";
> +		status= "okay";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ramoops@ffc00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xffc00000 0x0 0x100000>;
> +			record-size = <0x10000>;
> +			console-size = <0x60000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +			status = "okay";
> +		};
> +
> +		debug_region@ffb00000 {
> +			reg = <0x00 0xffb00000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		removed_region@85800000 {
> +			reg = <0x00 0x85800000 0x00 0x3700000>;
> +			no-map;
> +		};
> +	};
> +
> +	soc {
> +		gpio_keys {

/soc is for mmio devices, as such gpio_keys should be moved outside
"soc".

Regards,
Bjorn

> +			status = "okay";
> +			compatible = "gpio-keys";
> +			input-name = "gpio-keys";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			autorepeat;
> +
> +			camera_focus {
> +				label = "Camera Focus";
> +				gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
> +				linux,input-type = <1>;
> +				linux,code = <KEY_CAMERA_FOCUS>;
> +				debounce-interval = <15>;
> +			};
> +
> +			camera_snapshot {
> +				label = "Camera Snapshot";
> +				gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
> +				linux,input-type = <1>;
> +				linux,code = <KEY_CAMERA>;
> +				debounce-interval = <15>;
> +			};
> +
> +			vol_down {
> +				label = "Volume Down";
> +				gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +				linux,input-type = <1>;
> +				linux,code = <KEY_VOLUMEDOWN>;
> +				gpio-key,wakeup;
> +				debounce-interval = <15>;
> +			};
> +		};
> +
> +		sdhci@c0c4000 {
> +			status = "okay";
> +
> +			/* SoMC Nile platform's eMMC doesn't support HS200 mode */
> +			/delete-property/ mmc-hs200-1_8v;
> +		};
> +
> +		i2c@c175000 {
> +			status = "okay";
> +
> +			/* Synaptics touchscreen */
> +		};
> +
> +		i2c@c176000 {
> +			status = "okay";
> +
> +			/* SMB1351 charger */
> +		};
> +
> +		/* I2C3, 4, 5, 7 and 8 are disabled on this board. */
> +
> +		i2c@c1b6000 {
> +			status = "okay";
> +
> +			/* NXP NFC */
> +		};
> +
> +		serial@c1af000 {
> +			status = "okay";
> +		};
> +	};
> +};
> -- 
> 2.27.0
> 
