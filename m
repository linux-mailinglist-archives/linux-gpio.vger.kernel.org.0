Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC097204B53
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 09:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731271AbgFWHiC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 03:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731054AbgFWHiB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 03:38:01 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0CDC061796
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 00:38:00 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id d4so15644547otk.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 00:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=35v059ZSefWiE/94cPIdPsNYSj0+xNFw0zZxXG6+Ru4=;
        b=yRvE71xHNF6E696AMfCuE+3xfDYcTc3yUU5vc4zZuoFKBV+AuBEygXslM1Ri7FTqUY
         rkGrksg+O5zIiKwLkV7GOpfoBgKJzecwIZ27dR8MSb3+TqccBwzqIyTgHgCwSOWZ3raO
         aKjAluRAqMOGafA0LdI9hhJWBES/lxYbZ3AnM4gRHU+rz5SuW4fftU6TBQxdxrUmftk/
         5XTGJczBhWcJJUDufYD+cbqasMyyd4zLqegwr9rid76/Xx+1wrQ8gKs9VjmRV2jppftX
         cSnL6ESOX0FImU/i1qcy6CE/5oxJKmIOAEtCqBz/Ghds+X7S7Er8h9++Kd4ydM+eKq+e
         u6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=35v059ZSefWiE/94cPIdPsNYSj0+xNFw0zZxXG6+Ru4=;
        b=Drb1/6dt7fsU77C/riSpJ2lt4BqTv5MTj7HiJsPWwJUA78B3rIUHLI/YIxw41i1H2O
         ib40ew2i0nScnygMSd4e+PciVDcYKU0/u/D2BAghCy9Wm/Udi6yPQ4mTElVEPbNcw7Fh
         BeeCUgG5nD2gyL+4+emd8sS2EE8OWjO0MXPt/W9cvOwDbiZjuNot3zd+GGFzRiSMWC84
         x8PswJArKnxqBAU2XcvlhZ3LHAvJiNkC+jS1xDa4X99/uxSkH2gRyQ1qm/Eg2sy7WGZh
         PX/GP3SoJJzHJIQ67DQ6utFbMUp1u5id2rAIkJ8GBTCbtwwh0KEh0Al7h49Nkj3pCdD4
         8KBw==
X-Gm-Message-State: AOAM5317CNgEY2nJiBSqYAK+JFgsjfRp0dK3CLYQUM2LuTTiqnRKPXx4
        Px1qhnUGVsK1i1KvdtxmO2t4pQ==
X-Google-Smtp-Source: ABdhPJw8UOm3lfPe6w8OyAPXm0lHSGhZgHDMNbj0rIur8GCTV3KPjYo4LH/vcrmVM3xONNX++19JDg==
X-Received: by 2002:a9d:aaa:: with SMTP id 39mr16361606otq.269.1592897879660;
        Tue, 23 Jun 2020 00:37:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x194sm154858oix.22.2020.06.23.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:37:59 -0700 (PDT)
Date:   Tue, 23 Jun 2020 00:35:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        ??ukasz Patron <priv.luk@gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
Message-ID: <20200623073515.GA128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-6-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622192558.152828-6-konradybcio@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:

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
>  .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 136 ++++++++++++++++++
>  5 files changed, 185 insertions(+)
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
> index 000000000000..8fca0b69fa01
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
> +	model = "Sony Xperia XA2 Ultra";
> +	compatible = "sony,discovery-row", "qcom,sdm630";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
> new file mode 100644
> index 000000000000..90dcd4ebaaed
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
> +	model = "Sony Xperia XA2";
> +	compatible = "sony,pioneer-row", "qcom,sdm630";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
> new file mode 100644
> index 000000000000..fae5f1bb6834
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
> +	model = "Sony Xperia XA2 Plus";
> +	compatible = "sony,voyager-row", "qcom,sdm630";
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
> index 000000000000..9ba359c848d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -0,0 +1,136 @@
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
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <1920>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			status= "okay";
> +		};
> +	};
> +
> +	gpio_keys {
> +		status = "okay";
> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		autorepeat;
> +
> +		camera_focus {
> +			label = "Camera Focus";
> +			gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_CAMERA_FOCUS>;
> +			debounce-interval = <15>;
> +		};
> +
> +		camera_snapshot {
> +			label = "Camera Snapshot";
> +			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_CAMERA>;
> +			debounce-interval = <15>;
> +		};
> +
> +		vol_down {
> +			label = "Volume Down";
> +			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpio-key,wakeup;
> +			debounce-interval = <15>;
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
> +		sdhci@c0c4000 {

I believe I forgot to ask you to refer to these nodes by label instead
of per their structure (i.e. &sdhc_1 { ... outside / {). As we do in
e.g. sdm845-mtp.dts.

But the patches looks good, so I applied them anyways. When it suits you
(e.g. when you're populating the i2c nodes below) please update them
accordingly.

Thanks,
Bjorn

> +			status = "okay";
> +
> +			mmc-ddr-1_8v;
> +			/* SoMC Nile platform's eMMC doesn't support HS200 mode */
> +			mmc-hs400-1_8v;
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
> +		serial@c1af000 {
> +			status = "okay";
> +		};
> +
> +		/* I2C3, 4, 5, 7 and 8 are disabled on this board. */
> +
> +		i2c@c1b6000 {
> +			status = "okay";
> +
> +			/* NXP NFC */
> +		};
> +	};
> +};
> -- 
> 2.27.0
> 
