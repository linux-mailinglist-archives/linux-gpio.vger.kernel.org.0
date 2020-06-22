Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC89203E8B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgFVR5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730080AbgFVR5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:57:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4020C061798
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:57:14 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x202so16442106oix.11
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M3GEVdXIf0tk+DXRvjn8ivHe3tRnJ1flWGbCBgMSqFc=;
        b=fKYxb8a5H/16u9zlWS8iJSngzhsQi8W1gBgVdQKgopZCmgNRKW4ShQtq754r/X5ZHq
         fy6m5ZY5hX4E0YahT9PIK9K0hD3j10Uy59Ms3GAKtrVZaffV73Avh9kzG2xPwcQpE2jN
         8f9MCiTyTnGs+lgdJ4+REJgssZ4aoLmVB39814XTPl2qPHqWj/gzwk+XimPFIVVEHUvp
         JzsFN060SsfLCwR1b2ZTOFv/2dloiWXa9fBsxadwXtQFyVQEwAdDKS6LxeGJ6e36GFJZ
         nvfChvHXG4x7H6NJ79akzQS3olwqvZy18fNlsxK0nyMeuPuAZK5+wYZs67khpZMIQQqQ
         mHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M3GEVdXIf0tk+DXRvjn8ivHe3tRnJ1flWGbCBgMSqFc=;
        b=SIXqLbnmLmWeNSy1gbEukhmMAHhH9iBLO5JvjKuc/rdFjJsVXdlLH/PjGGJV3DcoLX
         W2ZJpWUYFD6JVMO5qJXRruYY3xiFVhZcoao5GRLlR6aPSRNqnfPJcrQq3N/7QAv3XFdP
         jfTgt4OTLJHUDVKjBQnBMGZzaGBPym88iI08dhGgko0sLdp2fEr73t6HlP2CQfKP4Gfv
         VZ7W8erhgDMTExOKJazGikMrOP8eX+XWi/vJ0fZUXTIGLBWY0AAYL4zqve5hphXP63vN
         NRoGHo0VyVXkwgABUfskdyg33JSfXwUYWrkMOzH67A9p1iQFeFGymBpJjriux9AmFAvH
         ImFA==
X-Gm-Message-State: AOAM5310dW/PiUIKnNn0QRCT2d6L+hlirwqb3zHXxVaXK8dZL2z4e4ot
        LmmfFu4plsXdLz2uiudaCyKfqg==
X-Google-Smtp-Source: ABdhPJxkLE5HD8rZWtgYIPepWBzqCb0jDBaJuqVva8yCjfKKXg5Nh77NsC5ouVeAKrFlZLLucadR5A==
X-Received: by 2002:aca:7213:: with SMTP id p19mr13643738oic.58.1592848634118;
        Mon, 22 Jun 2020 10:57:14 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k7sm3510087oon.29.2020.06.22.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:57:13 -0700 (PDT)
Date:   Mon, 22 Jun 2020 10:54:28 -0700
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
        Martin Botka <martin.botka1@gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: Add support for Sony Xperia
 10/10 Plus (Ganges platform)
Message-ID: <20200622175428.GU128451@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-9-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-9-konradybcio@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

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
> Tested-by: Martin Botka <martin.botka1@gmail.com>

Same comments as on patch 7 regarding the model, but apart from that
this looks good.

Happy to see these patches on the list, keep up the good work!

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../qcom/sdm630-sony-xperia-ganges-kirin.dts  | 13 ++++++
>  .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   | 40 +++++++++++++++++++
>  .../sdm636-sony-xperia-ganges-mermaid.dts     | 20 ++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1cad7cb07574..c98bafe03a96 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,9 +16,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
> new file mode 100644
> index 000000000000..246710a01046
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
> +	model = "SoMC Kirin-RoW";
> +	compatible = "sony,kirin-row", "qcom,sdm630", "qcom,sdm630-mtp";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
> new file mode 100644
> index 000000000000..ea051b3d14b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Martin Botka
> + */
> +
> +/dts-v1/;
> +
> +/* Ganges is very similar to Nile, but
> + * there are some differences that will need
> + * to be addresed when more peripherals are
> + * enabled upstream. Hence the separate DTSI.
> + */
> +#include "sdm630-sony-xperia-nile.dtsi"
> +
> +/ {
> +	chosen {
> +		framebuffer@9d400000 {
> +			reg = <0 0x9d400000 0 (2520 * 1080 * 4)>;
> +			height = <2520>;
> +		};
> +	};
> +
> +	soc {
> +
> +		i2c@c175000 {
> +			status = "okay";
> +
> +			/* Novatek touchscreen */
> +		};
> +
> +		/* Yes, this is intentional.
> +		 * Ganges devices only use gpio-keys for
> +		 * Volume Down, but currently there's an
> +		 * issue with it that has to be resolved.
> +		 * Until then, let's not make the kernel panic
> +		 */
> +		/delete-node/ gpio-keys;
> +	};
> +
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> new file mode 100644
> index 000000000000..96b7782d58de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Martin Botka
> + */
> +
> +/dts-v1/;
> +
> +/* Mermaid uses sdm636, but it's different ever so slightly
> + * that we can ignore it for the time being. Sony also commonizes
> + * the Ganges platform as a whole in downstream kernels.
> + */
> +#include "sdm630-sony-xperia-ganges.dtsi"
> +
> +/ {
> +	model = "SoMC Mermaid-RoW";
> +	compatible = "sony,mermaid-row", "qcom,sdm636", "qcom,sdm636-mtp";
> +
> +	qcom,msm-id = <345 0>;
> +	qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00 0x1001b 0x102001a 0x00 0x00>;
> +};
> -- 
> 2.27.0
> 
