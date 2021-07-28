Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A6F3D9210
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbhG1Pdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 11:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235648AbhG1Pdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 11:33:43 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21576C061757;
        Wed, 28 Jul 2021 08:33:41 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id nb11so5298620ejc.4;
        Wed, 28 Jul 2021 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=si1mgqR4hY6Vfet+JUR4OQ+XcsaVJnN5eLUW6jCI1H8=;
        b=Yabfn2tEqlcOW2R6zKpzZxhVViW1JCNZDXH4aPGMpZ+9cPDKUySzKe9UlZXhh4hCN3
         bptI/95PoVJdM5dVdW/EsVyxakJ4Ewnj8xO02xKrjbzby9rVkxbR6N5EBpHQkqIhe9JR
         JV4fnkPf0Vx+X1Ek9dWfd2ejsfwFqrL++gt7tAirrryxw5nqPwpNN7+NnJHpS+Uf3de8
         Lx0zgCgsiym6jqaDgRNg99Vjj+WPcJjwKmGyrdBeCkPEiBhEXIiWYr/LPhYennJat054
         jmHlSfmjP6yBjNBGOb4LCkM5wV8FcfQRsGWcvDmIjr0g4VC6eBfpccmf37mhn1zaJnbK
         H50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=si1mgqR4hY6Vfet+JUR4OQ+XcsaVJnN5eLUW6jCI1H8=;
        b=P04MXrxWu9pJ5vyD+N50BvgfTsRsX82FrSmSwKWWiZktkRsNltKRDuTQQgAth4U5VZ
         KAvW5twPLyS4LcO7FXzhf3JmARQ7KodRkvsey8mO4J+Et0QoIfA2mQNC1fmQzMJ+DNGF
         pFDUr4g9KNFliXno3JJj2lRiSwU3SynmF73z0/5ajOD90A3xsE0haUe9+TV7vWfDyr1P
         8veoXd3/rOe2vjHFn3ZFOIQsiy495jEr2bdx6aK7nuu6Pv8h6viMLAekyJcs6PN+RVfx
         n/pkNAzHujxjw+jW6K7gsX3rrDrQCDvjikMGGh3or5q1ZTAw1VAodsCx0MN4VlsNs/ob
         6hyw==
X-Gm-Message-State: AOAM530qP3g1qamViodlL3k3lMgUrnbrmAkwl9SrIU45APVgwOvh4umu
        FjEy+y9u2qX3ofsa8h2RgM2F/HqbV2U=
X-Google-Smtp-Source: ABdhPJzshhdEflocyi4gdgO2oNd2Rd65Idabh0CmlCYsp4GRU1wwosn3cznIEOllvFeWvJxs9NQTpQ==
X-Received: by 2002:a17:906:a5b:: with SMTP id x27mr108635ejf.18.1627486419760;
        Wed, 28 Jul 2021 08:33:39 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id dj16sm53392edb.0.2021.07.28.08.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 08:33:39 -0700 (PDT)
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: add rk3568 tsadc nodes
To:     Peter Geis <pgwipeout@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210728135534.703028-1-pgwipeout@gmail.com>
 <20210728135534.703028-6-pgwipeout@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <757c6db0-c259-32d8-53c1-c1e31e9cbe8c@gmail.com>
Date:   Wed, 28 Jul 2021 17:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728135534.703028-6-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

On 7/28/21 3:55 PM, Peter Geis wrote:
> Add the thermal and tsadc nodes to the rk3568 device tree.
> There are two sensors, one for the cpu, one for the gpu.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |  6 ++
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 71 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> index a588ca95ace2..b464c7bda1f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> @@ -2420,6 +2420,12 @@ spi3m1_cs1: spi3m1-cs1 {
>  	};
>  
>  	tsadc {
> +		/omit-if-no-ref/

> +		tsadc_gpio: tsadc-gpio {

nodenames ending on -gpio -gpios are kind of reserved.
Maybe use -pin or -pins.

From  dt-schema/schemas/gpio/gpio-consumer.yaml

patternProperties:
  "(?<!,nr)-gpios?$":
    $ref: "/schemas/types.yaml#/definitions/phandle-array"


> +			rockchip,pins =
> +				<0 RK_PA1 0 &pcfg_pull_none>;
> +		};
> +
>  		/omit-if-no-ref/
>  		tsadcm0_shut: tsadcm0-shut {
>  			rockchip,pins =
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 77c679304916..0905fac0726a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -51,6 +51,7 @@ cpu0: cpu@0 {
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x0>;
>  			clocks = <&scmi_clk 0>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -59,6 +60,7 @@ cpu1: cpu@100 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x100>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -67,6 +69,7 @@ cpu2: cpu@200 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x200>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -75,6 +78,7 @@ cpu3: cpu@300 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x300>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -774,6 +778,73 @@ uart9: serial@fe6d0000 {
>  		status = "disabled";
>  	};
>  
> +	thermal_zones: thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsadc 0>;
> +
> +			trips {
> +				cpu_alert0: cpu_alert0 {
> +					temperature = <70000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu_alert1: cpu_alert1 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu_crit: cpu_crit {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device =
> +						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		gpu_thermal: gpu-thermal {
> +			polling-delay-passive = <20>; /* milliseconds */
> +			polling-delay = <1000>; /* milliseconds */
> +
> +			thermal-sensors = <&tsadc 1>;
> +		};
> +	};
> +
> +	tsadc: tsadc@fe710000 {
> +		compatible = "rockchip,rk3568-tsadc";
> +		reg = <0x0 0xfe710000 0x0 0x100>;
> +		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +		assigned-clocks = <&cru CLK_TSADC_TSEN>, <&cru CLK_TSADC>;
> +		assigned-clock-rates = <17000000>, <700000>;
> +		clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
> +		clock-names = "tsadc", "apb_pclk";
> +		resets = <&cru SRST_TSADC>, <&cru SRST_P_TSADC>,
> +			 <&cru SRST_TSADCPHY>;
> +		reset-names = "tsadc", "tsadc-apb", "tsadc-phy";
> +		rockchip,grf = <&grf>;
> +		rockchip,hw-tshut-temp = <95000>;
> +		rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> +		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
> +		pinctrl-names = "gpio", "otpout";
> +		pinctrl-0 = <&tsadc_gpio>;
> +		pinctrl-1 = <&tsadc_shutorg>;
> +		#thermal-sensor-cells = <1>;
> +		status = "disabled";
> +	};
> +
>  	saradc: saradc@fe720000 {
>  		compatible = "rockchip,rk3568-saradc", "rockchip,rk3399-saradc";
>  		reg = <0x0 0xfe720000 0x0 0x100>;
> 
