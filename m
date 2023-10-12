Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7B67C65BA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 08:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbjJLGkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 02:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347078AbjJLGkJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 02:40:09 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3D6BE
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:40:06 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406609df1a6so6857715e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092805; x=1697697605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBr1hwHD25bRhBkWRPQylNtFUOku6GBNnWwm/nUebWM=;
        b=LtR59DQaMKYasbSZ+c+7CM7XP49i/sh/xDJZj/72fD4xA8aCXFyt+4oBOoUi/ahOMm
         DsKst2yPqkjP74zMHEar+MJuJtQkaCnt85yNpEhPufkOB0NxNQkx9YcWpDkbKjxHEodA
         E+2aEJ/RWg+lEsr/gYY/ybSuauwuR6qljfAJJL4UdzYEWvapXmGOV7ZCBtrHCR/swW8M
         +Zn9gX0QGBitvxkjWsfc0aUHkZLIL1FOHOKkJi4dMDvLdN9up5PKoC3/6iwr/2SCd6d4
         IQGrEn9Q4tBV89hLxZRgvvXzQyAQCqDdVQxyb6xs4HekrRPTLrClzcRLwXXpF2zKHP+3
         Hzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092805; x=1697697605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBr1hwHD25bRhBkWRPQylNtFUOku6GBNnWwm/nUebWM=;
        b=uUVsTtTOik3k0qY6g4z1FK5QhLfckHU1WXaO7dMC/8IMAgMg62x50VVwvfqsUgI0lC
         fFznu3w1634ftIRl43cWANNALBI34Qlo7NT2BB91pRQAaKtAPA/IESGSL3vBpJSrYnDV
         22vJMYhzOVF+VZbpq/gLxxEymGyDCm7nXomtw4J3KKfjEdT7jluNQYsgEGgnCQweUr57
         ckKSn5xYKxJ/bqBJc/ku+Ijxcs5YcqT8XITMHWXFDeJCH5hnjrorD7hjreJxu48X49Mi
         yb7aRdW6y9LYTSku2RJrd/WMG0OsNmVNN1pxpXB0ZBbfkGWOaVFeuNrQ4WQXjcX6oPMA
         pJhQ==
X-Gm-Message-State: AOJu0YzoPcXT6lLA3xNliLbLbettRCe5RSPzmahQlz8HvjCZz5EUJSlC
        7GThnlX1b6UY9OIVc0pomxnsPg==
X-Google-Smtp-Source: AGHT+IF37iFe5rzi/jVKKLSbSO2i7WhFnCibS5SIVqUiTGBtbLyFss5op3l5+7uXmT5b+Kdw/blj2Q==
X-Received: by 2002:a05:600c:252:b0:402:f536:2d3e with SMTP id 18-20020a05600c025200b00402f5362d3emr19740466wmj.14.1697092805153;
        Wed, 11 Oct 2023 23:40:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b00405bbfd5d16sm18843678wmj.7.2023.10.11.23.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 23:40:04 -0700 (PDT)
Message-ID: <33fe3e2e-9d09-42ee-9472-25d3be09baf4@linaro.org>
Date:   Thu, 12 Oct 2023 08:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com
Cc:     tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-18-peter.griffin@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231011184823.443959-18-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/10/2023 20:48, Peter Griffin wrote:

...

> diff --git a/arch/arm64/boot/dts/google/gs101.dtsi b/arch/arm64/boot/dts/google/gs101.dtsi
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
> + */
> +
> +#include <dt-bindings/clock/google,gs101.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "google,gs101";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_0;
> +		pinctrl1 = &pinctrl_1;
> +		pinctrl2 = &pinctrl_2;
> +		pinctrl3 = &pinctrl_3;
> +		pinctrl4 = &pinctrl_4;
> +		pinctrl5 = &pinctrl_5;
> +		pinctrl6 = &pinctrl_6;
> +		pinctrl7 = &pinctrl_7;
> +		serial0 = &serial_0;
> +	};
> +
> +	arm-pmu {

pmu-0

> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	dsu-pmu-0 {

pmu-1


> +		compatible = "arm,dsu-pmu";
> +		interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
> +		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +	};
> +
> +	/* TODO replace with CCF clock */
> +	dummy_clk: oscillator {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12345>;
> +		clock-output-names = "pclk";
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0000>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0100>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0200>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0300>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0400>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> +			capacity-dmips-mhz = <620>;
> +			dynamic-power-coefficient = <284>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0500>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> +			capacity-dmips-mhz = <620>;
> +			dynamic-power-coefficient = <284>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0600>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&HERA_CPU_SLEEP>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <650>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0700>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&HERA_CPU_SLEEP>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <650>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			ANANKE_CPU_SLEEP: cpu-ananke-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <70>;
> +				exit-latency-us = <160>;
> +				min-residency-us = <2000>;
> +			};
> +
> +			ENYO_CPU_SLEEP: cpu-enyo-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <150>;
> +				exit-latency-us = <190>;
> +				min-residency-us = <2500>;
> +			};
> +
> +			HERA_CPU_SLEEP: cpu-hera-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <235>;
> +				exit-latency-us = <220>;
> +				min-residency-us = <3500>;
> +			};
> +		};
> +	};
> +
> +	/* bootloader requires ect node */
> +	ect {

This needs bindings.

> +		parameter_address = <0x90000000>;

No underscores in property names. Use hyphen.

> +		parameter_size = <0x53000>;

No underscores.

> +	};
> +
> +	ext_24_5m: clock-1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +		clock-output-names = "oscclk";
> +	};


Best regards,
Krzysztof

