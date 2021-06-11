Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EAE3A3A2D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFKDQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:16:42 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:33732 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhFKDQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:16:42 -0400
Received: by mail-ot1-f51.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so1876040otl.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KQu0eDuwQvpglxFBbKjew1x6RGhhszO56HCWSTbbarA=;
        b=TX7g+W/s3byvmkCH7QlSOO557obd7nW2JBe6rGkstprgoJpSfCZ/kSiKJNx83GDOU+
         xw1FIybt2mTCYrgfbBnXnPuMvGpx/6AH26eaDRdLGEGhxREwPMei3U1eTY48le7CbTuZ
         ypX7VuXGC6vMtqgn0Seq6ZTqMWOsOJe0NVNxsKFuirQl/KT3jpwq2btseiFZW8BN8eXH
         O6RxNAgDnLL3qOMoFpxC03Mg2lwN8TMizNBiTNerVklP/VYdpatDDAlxwyu0eprsQXt4
         jkYVfYijx2pag0W5k7LD7UPmPAb+xg+jys+k8DszgOUYE+SOqvBfKYCCPNJHC1+Lan9e
         /77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KQu0eDuwQvpglxFBbKjew1x6RGhhszO56HCWSTbbarA=;
        b=bQx9lSntygqoSJH6oxaRHz1rUwZc8oL1vTkkK4CVNK90HwJ1bdi9hCS6j0woZ8MGWv
         0viGl352tznCsvHXqE4qE0O5ACZCRMPLjy3Ew5X+s3VWkpsz/MZRK3r1VkY7Z5bpq2w1
         105ab40Z1V8FGGqhanP1jI4clUajWF3KeuQFDkG1oI5hlP+R3jPRRF4KDY57nFwzIo+2
         ZhAdb97ab7NxAfCEk+J75A/pl5YgM4xqlX7rkJm2CSzRhI4RC0RHvIMvcelwWglGTs3B
         ADBAtZV7ZO08V367jtkr3SMTDktzzz+RybOt3/B5qvVDjm6UwacxantW2iQIcusUnDa0
         vxSA==
X-Gm-Message-State: AOAM531Asy6molmypdutYNIDPlR+LJiw19m8WaeRVQDLEr3UJrJfg9vI
        NARtBdeoQw9PWdbJ2J7CVvrWAg==
X-Google-Smtp-Source: ABdhPJw7EYbfaoXxnIco2pLxpPJBwR54SnN3GzbtMcq7eaTMq+GPiQAso6TL1BvXqJasrqSoKTQHyA==
X-Received: by 2002:a05:6830:19c2:: with SMTP id p2mr1151911otp.234.1623381210437;
        Thu, 10 Jun 2021 20:13:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z23sm601635ooz.15.2021.06.10.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:13:29 -0700 (PDT)
Date:   Thu, 10 Jun 2021 22:13:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 7/8] arm64: dts: qcom: pmm8155au_2: Add base dts file
Message-ID: <YMLU2D+Jkfs6dmM9@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-8-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-8-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> Add base DTS file for pmm8155au_2 along with GPIOs, power-on, rtc and vadc
> nodes.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi | 107 ++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi

As with _1, I approve of this design.

> new file mode 100644
> index 000000000000..11c0c203a4e2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmm8155au-2-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&pmm8155au_2_temp>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmic@4 {
> +		compatible = "qcom,pmm8155au-2", "qcom,spmi-pmic";

"qcom,pmm8155au", "qcom,spmi-pmic"

> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +
> +			status = "disabled";
> +		};
> +
> +		pmm8155au_2_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pmm8155au_2_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmm8155au_2_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +
> +			ref-gnd@0 {
> +				reg = <ADC5_REF_GND>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_gnd";
> +			};
> +
> +			vref-1p25@1 {
> +				reg = <ADC5_1P25VREF>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vref_1p25";
> +			};
> +
> +			die-temp@6 {
> +				reg = <ADC5_DIE_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "die_temp";
> +			};
> +		};
> +
> +		pmm8155au_2_gpios: gpio@c000 {
> +			compatible = "qcom,pmm8155au-2-gpio";

"qcom,pmm8155-gpio"

> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@5 {
> +		compatible = "qcom,pmm8155au-2", "qcom,spmi-pmic";

"qcom,pmm8155au", "qcom,spmi-pmic"

Regards,
Bjorn

> +		reg = <0x5 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.31.1
> 
