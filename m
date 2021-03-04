Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1CF32CE0C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbhCDIEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235396AbhCDIEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:04:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653DCC061574;
        Thu,  4 Mar 2021 00:03:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m22so41687926lfg.5;
        Thu, 04 Mar 2021 00:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p9grc8fXU1jc972mzIK4SeNb75F6Vg/ZLoSUEVpUnSg=;
        b=t0W7bkwNI8XuCO10QIqKab7Pa5ZOZb54Q2x0gWKgSDD4iPA4iS64vMSSu/A7QadIs2
         EJttgT+pDfCTGEsxcjXoPNJhO+4hjO6+AlerjPiH60dvtHl4EQ0fy+h/+V31v99Yyww6
         qWy9TEgD2xvKi3CTumQYQ4XCYZB/jx+wQW/DjJcGgLz5xp3+3N9aQukaHODEcN9P7TYZ
         IuDflPWqiiRKklchL8mn4+q6/3X32bNVfeb+NbyKa8G2QIahkg9ByHo/XljkDehMdaTf
         F7LPdbhVw8VEALrV1s5NlyFKOSt7UIew5tbVASDCu/JmhyL97NKWzKtZA2zL5AO4Z6sq
         bpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p9grc8fXU1jc972mzIK4SeNb75F6Vg/ZLoSUEVpUnSg=;
        b=SgkAQH/zob3mSpDIEBXxQsk9X2uCGJy2/xRlFHO8GcW9F3Jfr3/15h9bwDTj3cCePq
         ykud7gILMWwMvG8ZSGrMT0RmN0LS97tUtbG1ErcQJ69H6tNcpSZhXC6zlpVhO9B6t6IT
         LaCXTmrLISzsCkjdoIcjKiz/ReZQX0Xk8hY1xkRtoqyzIHixDP5oup6m5X0/Ybx+sCEZ
         U2uokm0fR0He2gIkaFlskmOLqjcHUPC9F341Xojz0JgdJAtpWrFj8FRyBH+UNIx9jXyf
         UNPTy2qh2Nk4kDBcUB3orawhODCA+kOAu8C4GudQSQtJc2EgNRGQc0u/VFzm+tsp9j5s
         etLQ==
X-Gm-Message-State: AOAM533Q57ci1gl/A9rUVDfF1xgLlVLLp7G0VAd5p89AcbGOlFGuy/g8
        NC3JnPp3ESrKeCOzIcmLHW/NgdMMjFAoL/cd
X-Google-Smtp-Source: ABdhPJyF/yBS615fXPgFTkr4fJaSiYODJzBXDvNOjOVkYWdosoZv+avGnZKjbIv5RJaEbekGXU1eDg==
X-Received: by 2002:a05:6512:20c6:: with SMTP id u6mr1566691lfr.493.1614845037861;
        Thu, 04 Mar 2021 00:03:57 -0800 (PST)
Received: from mobilestation ([95.79.88.254])
        by smtp.gmail.com with ESMTPSA id n7sm3183986lfu.123.2021.03.04.00.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:03:57 -0800 (PST)
Date:   Thu, 4 Mar 2021 11:03:55 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Brad Larson <brad@pensando.io>
Cc:     linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, olof@lixom.net, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: Add Pensando Elba SoC support
Message-ID: <20210304080355.cc37g7jagswro3dg@mobilestation>
References: <20210304034141.7062-1-brad@pensando.io>
 <20210304034141.7062-8-brad@pensando.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304034141.7062-8-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 07:41:40PM -0800, Brad Larson wrote:
> Add Pensando common and Elba SoC specific device nodes
> and corresponding binding documentation.

This also needs to be split up into sub-patches seeing these are
unrelated changes like device bindings update, new platform DT file.

Note text-based bindings are deprecated in favor of the DT schemas.
Also note dts needs to pass dtbs_check validation. So all new HW/DT
nodes need to be reflected in the DT-schemas. See [1] for details.

[1] Documentation/devicetree/writing-schema.rst

> 
> Signed-off-by: Brad Larson <brad@pensando.io>
> ---
>  .../bindings/gpio/pensando,elba-spics.txt     |  24 ++
>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   |   2 +-
>  .../bindings/spi/cadence-quadspi.txt          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/pensando/Makefile         |   6 +
>  arch/arm64/boot/dts/pensando/elba-16core.dtsi | 171 ++++++++++
>  .../boot/dts/pensando/elba-asic-common.dtsi   | 113 +++++++
>  arch/arm64/boot/dts/pensando/elba-asic.dts    |   8 +
>  .../boot/dts/pensando/elba-flash-parts.dtsi   |  80 +++++
>  arch/arm64/boot/dts/pensando/elba.dtsi        | 310 ++++++++++++++++++
>  11 files changed, 717 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/pensando,elba-spics.txt
>  create mode 100644 arch/arm64/boot/dts/pensando/Makefile
>  create mode 100644 arch/arm64/boot/dts/pensando/elba-16core.dtsi
>  create mode 100644 arch/arm64/boot/dts/pensando/elba-asic-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/pensando/elba-asic.dts
>  create mode 100644 arch/arm64/boot/dts/pensando/elba-flash-parts.dtsi
>  create mode 100644 arch/arm64/boot/dts/pensando/elba.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/gpio/pensando,elba-spics.txt b/Documentation/devicetree/bindings/gpio/pensando,elba-spics.txt
> new file mode 100644
> index 000000000000..30f5f3275238
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/pensando,elba-spics.txt
> @@ -0,0 +1,24 @@
> +Pensando Elba SPI Chip Select Driver
> +
> +The Pensando Elba ASIC provides four SPI bus chip selects
> +
> +Required properties:
> +- compatible: Should be "pensando,elba-spics"
> +- reg: Address range of spics controller
> +- gpio-controller: Marks the device node as gpio controller
> +- #gpio-cells: Must be 2
> +
> +Example:
> +-------
> +spics: spics@307c2468 {
> +        compatible = "pensando,elba-spics";
> +        reg = <0x0 0x307c2468 0x0 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +};
> +
> +&spi0 {
> +        num-cs = <4>;
> +        cs-gpios = <&spics 0 0>, <&spics 1 0>, <&porta 1 0>, <&porta 7 0>;
> +	...
> +}
> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> index af7442f73881..645ae696ba24 100644
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> @@ -122,7 +122,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      emmc: mmc@5a000000 {

> -        compatible = "socionext,uniphier-sd4hc", "cdns,sd4hc";
> +        compatible = "socionext,uniphier-sd4hc", "cdns,sd4hc", "pensando,elba-emmc";

Alas it's not enough. New HW compatible strings shall be defined in the
binding schema.

>          reg = <0x5a000000 0x400>;
>          interrupts = <0 78 4>;
>          clocks = <&clk 4>;
> diff --git a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
> index 8ace832a2d80..dbb346b2b1d7 100644
> --- a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
>  	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
>  	For Intel LGM SoC - "intel,lgm-qspi", "cdns,qspi-nor".

> +	For Pensando SoC - "pensando,cdns-qspi".

What about converting this file to DT-schema and adding new HW
bindings in there?

>  - reg : Contains two entries, each of which is a tuple consisting of a
>  	physical address and length. The first entry is the address and
>  	length of the controller register set. The second entry is the
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f6064d84a424..9a21d780c5e1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -850,6 +850,8 @@ patternProperties:
>      description: Parallax Inc.
>    "^pda,.*":
>      description: Precision Design Associates, Inc.
> +  "^pensando,.*":
> +    description: Pensando Systems Inc.
>    "^pericom,.*":
>      description: Pericom Technology Inc.
>    "^pervasive,.*":
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index f1173cd93594..c85db0a097fe 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -19,6 +19,7 @@ subdir-y += marvell
>  subdir-y += mediatek
>  subdir-y += microchip
>  subdir-y += nvidia
> +subdir-y += pensando
>  subdir-y += qcom
>  subdir-y += realtek
>  subdir-y += renesas
> diff --git a/arch/arm64/boot/dts/pensando/Makefile b/arch/arm64/boot/dts/pensando/Makefile
> new file mode 100644
> index 000000000000..0c2c0961e64a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_PENSANDO_ELBA_SOC) += elba-asic.dtb
> +
> +always-y	:= $(dtb-y)
> +subdir-y	:= $(dts-dirs)
> +clean-files	:= *.dtb
> diff --git a/arch/arm64/boot/dts/pensando/elba-16core.dtsi b/arch/arm64/boot/dts/pensando/elba-16core.dtsi
> new file mode 100644
> index 000000000000..b0386864cfec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/elba-16core.dtsi
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 { cpu = <&cpu0>; };
> +				core1 { cpu = <&cpu1>; };
> +				core2 { cpu = <&cpu2>; };
> +				core3 { cpu = <&cpu3>; };
> +			};
> +			cluster1 {
> +				core0 { cpu = <&cpu4>; };
> +				core1 { cpu = <&cpu5>; };
> +				core2 { cpu = <&cpu6>; };
> +				core3 { cpu = <&cpu7>; };
> +			};
> +			cluster2 {
> +				core0 { cpu = <&cpu8>; };
> +				core1 { cpu = <&cpu9>; };
> +				core2 { cpu = <&cpu10>; };
> +				core3 { cpu = <&cpu11>; };
> +			};
> +			cluster3 {
> +				core0 { cpu = <&cpu12>; };
> +				core1 { cpu = <&cpu13>; };
> +				core2 { cpu = <&cpu14>; };
> +				core3 { cpu = <&cpu15>; };
> +			};
> +		};
> +
> +		// CLUSTER 0
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x0>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_0>;
> +		};
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x1>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_0>;
> +		};
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x2>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_0>;
> +		};
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x3>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_0>;
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +		};
> +
> +		// CLUSTER 1
> +		cpu4: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x100>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_1>;
> +		};
> +		cpu5: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x101>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_1>;
> +		};
> +		cpu6: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x102>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_1>;
> +		};
> +		cpu7: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x103>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_1>;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +		};
> +
> +		// CLUSTER 2
> +		cpu8: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x200>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_2>;
> +		};
> +		cpu9: cpu@201 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x201>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_2>;
> +		};
> +		cpu10: cpu@202 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x202>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_2>;
> +		};
> +		cpu11: cpu@203 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x203>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_2>;
> +		};
> +
> +		l2_2: l2-cache2 {
> +			compatible = "cache";
> +		};
> +
> +		// CLUSTER 3
> +		cpu12: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x300>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_3>;
> +		};
> +		cpu13: cpu@301 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x301>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_3>;
> +		};
> +		cpu14: cpu@302 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x302>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_3>;
> +		};
> +		cpu15: cpu@303 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72", "arm,armv8";
> +			reg = <0 0x303>;
> +			enable-method = "spin-table";
> +			next-level-cache = <&l2_3>;
> +		};
> +
> +		l2_3: l2-cache3 {
> +			compatible = "cache";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/pensando/elba-asic-common.dtsi b/arch/arm64/boot/dts/pensando/elba-asic-common.dtsi
> new file mode 100644
> index 000000000000..9623df208131
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/elba-asic-common.dtsi
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	model = "Elba ASIC Board";
> +
> +	aliases {
> +		serial0 = &uart0;
> +                spi0 = &spi0;
> +                spi1 = &qspi;
> +	};
> +
> +	chosen {

> +		stdout-path = "serial0:19200n8";

Baudrate of 19200? So sad.(

> +	};
> +};
> +
> +&ahb_clk {
> +	clock-frequency = <400000000>;
> +};
> +
> +&emmc_clk {
> +	clock-frequency = <200000000>;
> +};
> +
> +&flash_clk {
> +	clock-frequency = <400000000>;
> +};
> +
> +&ref_clk {
> +	clock-frequency = <156250000>;
> +};
> +
> +&qspi {
> +	status = "okay";
> +	flash0: mt25q@0 {
> +		compatible = "jdec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <2>;
> +		m25p,fast-read;
> +		cdns,read-delay = <0>;
> +		cdns,tshsl-ns = <0>;
> +		cdns,tsd2d-ns = <0>;
> +		cdns,tchsh-ns = <0>;
> +		cdns,tslch-ns = <0>;
> +	};
> +};
> +
> +&gpio0 {
> +	status = "ok";
> +};
> +
> +&emmc {
> +	bus-width = <8>;
> +	status = "ok";
> +};
> +
> +&wdt0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +	tmp451@4c {
> +		compatible = "ti,tmp451";
> +		reg = <0x4c>;
> +	};
> +	tps53659@62 {
> +		compatible = "ti,tps53659";
> +		reg = <0x62>;
> +	};
> +	pcf85263@51 {
> +		compatible = "nxp,pcf85263";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&spi0 {
> +	num-cs = <4>;

> +	cs-gpios = <&spics 0 0>, <&spics 1 0>, <&porta 1 0>, <&porta 7 0>;

Oh, you've got four peripheral SPI devices connected with only two native CS
available. Hmm, then I don't really know a better way, but just to forget about
the native DW APB CS functionality and activate the direct driving of
all the CS-pins at the moment of the DW APB SPI controller probe
procedure. Then indeed you'll need a custom CS function defined in the DW APB
SPI driver to handle that.

> +	status = "okay";
> +	spi@0 {
> +		compatible = "pensando,cpld";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <12000000>;
> +		reg = <0>;
> +	};
> +	spi@1 {
> +		compatible = "pensando,cpld";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <12000000>;
> +		reg = <1>;
> +	};
> +	spi@2 {
> +		compatible = "pensando,cpld-rd1173";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <12000000>;
> +		reg = <2>;
> +		interrupt-parent = <&porta>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +	spi@3 {
> +		compatible = "pensando,cpld";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <12000000>;
> +		reg = <3>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/pensando/elba-asic.dts b/arch/arm64/boot/dts/pensando/elba-asic.dts
> new file mode 100644
> index 000000000000..411c48457006
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/elba-asic.dts
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "elba.dtsi"
> +#include "elba-16core.dtsi"
> +#include "elba-asic-common.dtsi"
> +#include "elba-flash-parts.dtsi"
> diff --git a/arch/arm64/boot/dts/pensando/elba-flash-parts.dtsi b/arch/arm64/boot/dts/pensando/elba-flash-parts.dtsi
> new file mode 100644
> index 000000000000..1983de1a8403
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/elba-flash-parts.dtsi
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +&flash0 {
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		partition@0 {
> +			label = "flash";
> +			reg = <0x00010000 0x0fff0000>;
> +		};
> +		partition@f0000 {
> +			label = "golduenv";
> +			reg = <0x000f0000 0x00010000>;
> +		};
> +		partition@100000 {
> +			label = "boot0";
> +			reg = <0x00100000 0x00080000>;
> +		};
> +		partition@180000 {
> +			label = "golduboot";
> +			reg = <0x00180000 0x00200000>;
> +		};
> +		partition@400000 {
> +			label = "goldfw";
> +			reg = <0x00400000 0x03c00000>;
> +		};
> +		partition@4010000 {
> +			label = "fwmap";
> +			reg = <0x04010000 0x00020000>;
> +		};
> +		partition@4030000 {
> +			label = "fwsel";
> +			reg = <0x04030000 0x00020000>;
> +		};
> +		partition@4090000 {
> +			label = "bootlog";
> +			reg = <0x04090000 0x00020000>;
> +		};
> +		partition@40b0000 {
> +			label = "panicbuf";
> +			reg = <0x040b0000 0x00020000>;
> +		};
> +		partition@40d0000 {
> +			label = "uservars";
> +			reg = <0x040d0000 0x00020000>;
> +		};
> +		partition@4200000 {
> +			label = "uboota";
> +			reg = <0x04200000 0x00400000>;
> +		};
> +		partition@4600000 {
> +			label = "ubootb";
> +			reg = <0x04600000 0x00400000>;
> +		};
> +		partition@4a00000 {
> +			label = "mainfwa";
> +			reg = <0x04a00000 0x01000000>;
> +		};
> +		partition@5a00000 {
> +			label = "mainfwb";
> +			reg = <0x05a00000 0x01000000>;
> +		};
> +		partition@8000000 {
> +			label = "diagfw";
> +			reg = <0x08000000 0x07fe0000>;
> +		};
> +		partition@ffe0000 {
> +			label = "ubootenv";
> +			reg = <0x0ffe0000 0x00010000>;
> +		};
> +	};
> +};
> +
> +&soc {
> +	panicdump@740b0000 {
> +		compatible = "pensando,capri-crash";
> +		reg = <0x0 0x740b0000 0x0 0x00020000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/pensando/elba.dtsi b/arch/arm64/boot/dts/pensando/elba.dtsi
> new file mode 100644
> index 000000000000..72245e279483
> --- /dev/null
> +++ b/arch/arm64/boot/dts/pensando/elba.dtsi
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2021, Pensando Systems Inc.
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include "dt-bindings/interrupt-controller/arm-gic.h"
> +
> +/ {
> +	compatible = "pensando,elba";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clocks {
> +		ahb_clk: oscillator0 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +		emmc_clk: oscillator2 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +		flash_clk: oscillator3 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +		ref_clk: oscillator4 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
> +					IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
> +					IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) |
> +					IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) |
> +					IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a72-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(1) |
> +				IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	/* Common UIO device for MSI drivers */
> +	uio_penmsi {
> +		compatible = "pensando,uio_penmsi";
> +		name = "uio_penmsi";
> +	};
> +
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gic: interrupt-controller@800000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			interrupt-controller;
> +			reg = <0x0 0x800000 0x0 0x200000>,	// GICD
> +			      <0x0 0xa00000 0x0 0x200000>;	// GICR
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			its: interrupt-controller@820000 {
> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				#msi-cells = <1>;
> +				reg = <0x0 0x820000 0x0 0x10000>;
> +				socionext,synquacer-pre-its =
> +							<0xc00000 0x1000000>;
> +			};
> +		};
> +
> +		/*
> +		 * Until we  know the interrupt domain following this, we
> +		 * are forced to use this is the place where interrupts from
> +		 * PCI converge. In the ideal case, we use one domain higher,
> +		 * where the PCI-ness has been shed.
> +		 */
> +		pxc0_intr: intc@20102200 {
> +			compatible = "pensando,soc-ictlr-csrintr";
> +			interrupt-controller;
> +			reg = <0x0 0x20102200 0x0 0x4>;
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pxc0_intr";
> +		};
> +
> +		uart0: serial@4800 {
> +			device_type = "serial";
> +			compatible = "ns16550a";
> +			reg = <0x0 0x4800 0x0 0x100>;
> +			clocks = <&ref_clk>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +		};
> +
> +		qspi: spi@2400 {
> +			compatible = "pensando,cdns-qspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x2400 0x0 0x400>,
> +			      <0x0 0x7fff0000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&flash_clk>;
> +			cdns,fifo-depth = <1024>;
> +			cdns,fifo-width = <4>;
> +			cdns,trigger-address = <0x7fff0000>;
> +			status = "disabled";
> +		};
> +
> +		gpio0: gpio@4000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x0 0x4000 0x0 0x78>;
> +			status = "disabled";
> +
> +			porta: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <0>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <8>;
> +				interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-controller;
> +				interrupt-parent = <&gic>;
> +				#interrupt-cells = <2>;
> +			};
> +			portb: gpio-controller@1 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <1>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <8>;
> +			};
> +		};
> +
> +		i2c0: i2c@400 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x0 0x400 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			i2c-sda-hold-time-ns = <480>;
> +			snps,sda-timeout-ms = <750>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		/* UIO device using interrupt line PCIEMAC */
> +		pciemac@20102200 {
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <3>;
> +
> +			compatible = "pensando,uio_pciemac";
> +			register-type = "csr-interrupt";
> +			interrupt-parent = <&pxc0_intr>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x0 0x20102200 0x0 0x10>; /* pxc0_intr */
> +
> +			enable_csr_paddr = <0x0 0x20102200 0x0 0x10>;
> +			enable_mask = <(1 << 0)>;
> +		};
> +
> +		/* MSI UIO device 1 */
> +		uio_penmsi1@520000 {
> +			compatible = "pensando,uio_penmsi1";
> +			reg = <0x0 0x520000 0x0 0x10000>;
> +			msi-parent = <&its 0xa>;
> +			num-interrupts = <16>;  /* # MSI interrupts to get */
> +		};
> +

> +		spics: spics@307c2468 {
> +			compatible = "pensando,elba-spics";
> +			reg = <0x0 0x307c2468 0x0 0x4>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};

So that GPIO-controller is just a single register which provides a way
to toggle the DW APB SPI CS-mode together with their output value.
If so and seeing there are a few more tiny spaces of config
registers added to eMMC, PCI, etc DT node, I suppose all of them
belong to some bigger config space of the SoC. Thus I'd suggest to at
least implement them as part of a System Controller DT node. Then use
that device service to switch on/off corresponding functionality.
See [2] and the rest of added to the kernel DTS files with
syscon-nodes for example.

[2] Documentation/devicetree/bindings/mfd/syscon.yaml

-Sergey

> +
> +		spi0: spi@2800 {
> +			compatible = "pensando,elba-spi";
> +			reg = <0x0 0x2800 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			num-cs = <2>;
> +			status = "disabled";
> +		};
> +
> +		wdt0: watchdog@1400 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x1400 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +		wdt1: watchdog@1800 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x1800 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +		wdt2: watchdog@1c00 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x1c00 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +		wdt3: watchdog@2000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x2000 0x0 0x100>;
> +			clocks = <&ahb_clk>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		emmc: sdio-host-chip@30440000 {
> +			compatible = "pensando,elba-emmc";
> +			clocks = <&emmc_clk>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x0 0x30440000 0x0 0x10000
> +			       0x0 0x30480044 0x0 0x4>;
> +			cdns,phy-input-delay-sd-highspeed = <0x4>;
> +			cdns,phy-input-delay-legacy = <0x4>;
> +			cdns,phy-input-delay-sd-uhs-sdr50 = <0x6>;
> +			cdns,phy-input-delay-sd-uhs-ddr50 = <0x16>;
> +			cdns,mmc-ddr-1_8v;
> +			status = "disabled";
> +		} ;
> +
> +		pcie@307c2480 {
> +			compatible = "pensando,pcie";
> +			reg = <0x0 0x307c2480 0x0 0x4   /* MS CFG_WDT */
> +			       0x0 0x00001400 0x0 0x10  /* WDT0 */
> +			       0x0 0x20000000 0x0 0x00380000>; /* PXB Base */
> +		};
> +
> +		panic: panicdump@0 {
> +			compatible = "pensando,pen-crash";
> +			status = "disabled";
> +		};
> +
> +		bsm@307c2080 {
> +			compatible = "pensando,bsm";
> +			reg = <0x0 0x307c2080 0x0 0x4>;
> +		};
> +	};
> +	mnet0: mnet0 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x0>;
> +	};
> +	mnet1: mnet1 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x1>;
> +	};
> +	mnet2: mnet2 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x2>;
> +	};
> +	mnet3: mnet3 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x3>;
> +	};
> +	mnet4: mnet4 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x4>;
> +	};
> +	mnet5: mnet5 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x5>;
> +	};
> +	mnet6: mnet6 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x6>;
> +	};
> +	mnet7: mnet7 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x7>;
> +	};
> +	mnet8: mnet8 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x8>;
> +	};
> +	mnet9: mnet9 {
> +		compatible = "pensando,mnet";
> +		msi-parent = <&its 0x9>;
> +	};
> +};
> -- 
> 2.17.1
> 
