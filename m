Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B07478EE5
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 16:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237786AbhLQPEM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 10:04:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36898
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237648AbhLQPEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Dec 2021 10:04:11 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E703C3FFDB
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639753450;
        bh=wPVtf/uy1u7dZ7UCIs1EK9ItWA1Eink77GM1QcLQQu8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=OY2tJ4uDFSgn6u/v5blS+WFp7dshtLJezcLR7Krv9+AnbRiE8PJwLJ3d80nSHTKRB
         aymmLzdO7FnvApg0aYl8moHpbpaGooUDOdqlC0vcEXRgJvclxC01lpI74DcGIQx9va
         7QcAm8O8txXaYbQU5Kr1vlZq70+JgytmWzirFFMII3AwLP1Zv7yP8gcIwD9n89f/Jb
         W8frRUGzxloWq1NALgRuH1wv4UyVyusnzpVYubp2MH08vMx+jr2raFCA1aXmDxtwdu
         /LXQrlEXNYxuhg9ir7+odyjpbUWCbmrUY2lz6SolGrWsUxpzmGlkEWql6iTtxXiXrF
         YU5A9wtlXbBDA==
Received: by mail-lf1-f72.google.com with SMTP id bi30-20020a0565120e9e00b00415d0e471e0so997826lfb.19
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 07:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wPVtf/uy1u7dZ7UCIs1EK9ItWA1Eink77GM1QcLQQu8=;
        b=RdS6X+U9CJoQZrb7Cxbha6g2v/O/ClDJ0+sjEMLcuwsXNnK/XiXycegVy4h6GKj40d
         Rmv9gTh6oYtmBi1pBGfHx9TMXRPjO2rUBfU2OFdIKZxDRE4nI58Xe+mcEbhltEtrRnAX
         ZhO3CfwdHbtW0XrJIxA0NJw9MVb6bL6rL24fS2q9juoL8HNr0DdU8GFW2W7goH7JDMXZ
         /7NsfgQSRpLzAFabLha/QVrr6k+PGEjM4FyLS51xjOwYpKQDVww6RzMQeTdY1RxzUnQx
         UsUqt2JSx4zZvVak4cPwnOkweXjyUYr4s5t5HqqbclqlxRlnKtVcWaI5Ra1QUMfg5OHm
         jylQ==
X-Gm-Message-State: AOAM5312YXiUO56Qx521u00+BgKctu+IzNEl9eZwUiCtw9T+RDohbllc
        5GO2XJrQy8o5IMs3CfvP1Pv1zZ3rbll8B1GdmmuyGSwVSBxm26yCOEckJW3IjR0rV+ig1t3FV66
        s/VF0dKY5GATamDd+ybOsW9YrfYd8N9jt3Pz+Q44=
X-Received: by 2002:a05:6512:34c6:: with SMTP id w6mr3076171lfr.527.1639753450057;
        Fri, 17 Dec 2021 07:04:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKPU6V+YfccyHlyPYt/dMc242hU4l4P1vUoS9rJfOICYkU7D3AAfeg0pP5FAj+6ftLOjcd4Q==
X-Received: by 2002:a05:6512:34c6:: with SMTP id w6mr3076064lfr.527.1639753448327;
        Fri, 17 Dec 2021 07:04:08 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d23sm1428046lfm.107.2021.12.17.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:04:06 -0800 (PST)
Message-ID: <0b7344d2-629f-7f78-b0e8-f6c70fbe9f37@canonical.com>
Date:   Fri, 17 Dec 2021 16:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit
 device tree
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-16-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-16-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Assorted minor changes to the MPFS/Icicle kit device tree:
> 
> - rename serial to mmuart to match microchip documentation
> - enable mmuart4 instead of mmuart0

This is not refactoring. Refactoring could include renames,
hierarchy/layout differences, naming, coding convention. You are
changing features, e.g. using different UART. Please split the changes.

> - move stdout path to serial1 to avoid collision with
> 	bootloader running on the e51
> - split memory node to match updated fpga design
> - move phy0 inside mac1 node to match phy configuration
> - add labels where missing (cpus, cache controller)
> - add missing address cells & interrupts to MACs
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/microchip-mpfs-icicle-kit.dts   | 52 ++++++++------
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 70 ++++++++++---------
>  2 files changed, 68 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index 174f977c164b..f6542ef76046 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>  
>  /dts-v1/;
>  
> @@ -13,25 +13,34 @@ / {
>  	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>  
>  	aliases {
> -		ethernet0 = &emac1;
> -		serial0 = &serial0;
> -		serial1 = &serial1;
> -		serial2 = &serial2;
> -		serial3 = &serial3;
> +		ethernet0 = &mac1;
> +		serial0 = &mmuart0;
> +		serial1 = &mmuart1;
> +		serial2 = &mmuart2;
> +		serial3 = &mmuart3;
> +		serial4 = &mmuart4;
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0:115200n8";
> +		stdout-path = "serial1:115200n8";
>  	};
>  
>  	cpus {
>  		timebase-frequency = <RTCCLK_FREQ>;
>  	};
>  
> -	memory@80000000 {
> +	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
> -		reg = <0x0 0x80000000 0x0 0x40000000>;
> +		reg = <0x0 0x80000000 0x0 0x2e000000>;
>  		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {

This looks unrelated to refactoring - split of memory - and needs
separate change.

> +		device_type = "memory";
> +		reg = <0x10 0x0 0x0 0x40000000>;
> +		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
>  	};
>  };
>  
> @@ -39,19 +48,19 @@ &refclk {
>  	clock-frequency = <600000000>;
>  };
>  
> -&serial0 {
> +&mmuart1 {
>  	status = "okay";
>  };
>  
> -&serial1 {
> +&mmuart2 {
>  	status = "okay";
>  };
>  
> -&serial2 {
> +&mmuart3 {
>  	status = "okay";
>  };
>  
> -&serial3 {
> +&mmuart4 {
>  	status = "okay";
>  };
>  
> @@ -61,29 +70,32 @@ &mmc {
>  	bus-width = <4>;
>  	disable-wp;
>  	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>  	card-detect-delay = <200>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;

This looks unrelated to refactoring - new modes for MMC - and needs
separate change.

>  	sd-uhs-sdr12;
>  	sd-uhs-sdr25;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
>  };
>  
> -&emac0 {
> +&mac0 {
>  	phy-mode = "sgmii";
>  	phy-handle = <&phy0>;
> -	phy0: ethernet-phy@8 {
> -		reg = <8>;
> -		ti,fifo-depth = <0x01>;
> -	};
>  };
>  
> -&emac1 {
> +&mac1 {
>  	status = "okay";
>  	phy-mode = "sgmii";
>  	phy-handle = <&phy1>;
>  	phy1: ethernet-phy@9 {
>  		reg = <9>;
> -		ti,fifo-depth = <0x01>;
> +		ti,fifo-depth = <0x1>;
> +	};
> +	phy0: ethernet-phy@8 {
> +		reg = <8>;
> +		ti,fifo-depth = <0x1>;
>  	};
>  };
>  
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 808500be26c3..d311c5ea27c9 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>  
>  /dts-v1/;
>  #include "dt-bindings/clock/microchip,mpfs-clock.h"
> @@ -16,7 +16,7 @@ cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		cpu@0 {
> +		cpu0: cpu@0 {
>  			compatible = "sifive,e51", "sifive,rocket0", "riscv";
>  			device_type = "cpu";
>  			i-cache-block-size = <64>;
> @@ -34,7 +34,7 @@ cpu0_intc: interrupt-controller {
>  			};
>  		};
>  
> -		cpu@1 {
> +		cpu1: cpu@1 {
>  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>  			d-cache-block-size = <64>;
>  			d-cache-sets = <64>;
> @@ -61,7 +61,7 @@ cpu1_intc: interrupt-controller {
>  			};
>  		};
>  
> -		cpu@2 {
> +		cpu2: cpu@2 {
>  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>  			d-cache-block-size = <64>;
>  			d-cache-sets = <64>;
> @@ -88,7 +88,7 @@ cpu2_intc: interrupt-controller {
>  			};
>  		};
>  
> -		cpu@3 {
> +		cpu3: cpu@3 {
>  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>  			d-cache-block-size = <64>;
>  			d-cache-sets = <64>;
> @@ -115,7 +115,7 @@ cpu3_intc: interrupt-controller {
>  			};
>  		};
>  
> -		cpu@4 {
> +		cpu4: cpu@4 {
>  			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>  			d-cache-block-size = <64>;
>  			d-cache-sets = <64>;
> @@ -153,8 +153,9 @@ soc {
>  		compatible = "simple-bus";
>  		ranges;
>  
> -		cache-controller@2010000 {
> +		cctrllr: cache-controller@2010000 {
>  			compatible = "sifive,fu540-c000-ccache", "cache";
> +			reg = <0x0 0x2010000 0x0 0x1000>;
>  			cache-block-size = <64>;
>  			cache-level = <2>;
>  			cache-sets = <1024>;
> @@ -162,10 +163,9 @@ cache-controller@2010000 {
>  			cache-unified;
>  			interrupt-parent = <&plic>;
>  			interrupts = <1>, <2>, <3>;
> -			reg = <0x0 0x2010000 0x0 0x1000>;
>  		};
>  
> -		clint@2000000 {
> +		clint: clint@2000000 {
>  			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>  			reg = <0x0 0x2000000 0x0 0xC000>;
>  			interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
> @@ -198,15 +198,6 @@ plic: interrupt-controller@c000000 {
>  			riscv,ndev = <186>;
>  		};
>  
> -		dma@3000000 {
> -			compatible = "sifive,fu540-c000-pdma";

Removal of nodes does not look like refactoring.

> -			reg = <0x0 0x3000000 0x0 0x8000>;
> -			interrupt-parent = <&plic>;
> -			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> -				     <30>;
> -			#dma-cells = <1>;
> -		};
> -


Best regards,
Krzysztof
