Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDB687D56
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407188AbfHIO4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:56:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44678 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407024AbfHIO43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:56:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79EuOvr045452;
        Fri, 9 Aug 2019 09:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565362584;
        bh=WOf8yBns8ce81Y1JTQ+OLGciZ5jeJWvtnFFxHufBK7E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hZq+ljhv0SoklT5IiJrY8jjA4D9m5h6NEEPMZt/4O9gvNePEJXwuKtqS1s33TILt5
         HdSxWFX8LU56HodDmkNrmsetmgzo60zurygWpptJpZK9CEjvzl6LZk1JP+eKJAv6Fr
         ASr6W2NrARuWL4PueHiXODIu1Jqb6oYQZpAxffD0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79EuOKj034694
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 09:56:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 09:56:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 09:56:24 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79EuLmV102066;
        Fri, 9 Aug 2019 09:56:21 -0500
Subject: Re: [PATCH 6/6] arm64: dts: k3-j721e: Add gpio-keys on common
 processor board
To:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>, <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-7-lokeshvutla@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <4d923b5f-16ba-2bc1-b195-d6ec7ae496b0@ti.com>
Date:   Fri, 9 Aug 2019 20:26:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-7-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Common processor board for K3 J721E platform has two push buttons
> namely SW10 and SW11.
> Add a gpio-keys device node to model them as input keys in Linux.
> Add required pinmux nodes to set GPIO pins as input.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../dts/ti/k3-j721e-common-proc-board.dts     | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 509579ca3db2..d2894d55fbbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -6,12 +6,49 @@
>   /dts-v1/;
>   
>   #include "k3-j721e-som-p0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>   
>   / {
>   	chosen {
>   		stdout-path = "serial2:115200n8";
>   		bootargs = "console=ttyS2,115200n8 earlycon=ns16550a,mmio32,0x02800000";
>   	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sw10_button_pins_default &sw11_button_pins_default>;
> +
> +		sw10: sw10 {
> +			label = "GPIO Key USER1";
> +			linux,code = <BTN_0>;
> +			gpios = <&main_gpio0 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		sw11: sw11 {
> +			label = "GPIO Key USER2";
> +			linux,code = <BTN_1>;
> +			gpios = <&wkup_gpio0 7 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	sw10_button_pins_default: sw10_button_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
> +		>;
> +	};
> +};
> +
> +&wkup_pmx0 {
> +	sw11_button_pins_default: sw11_button_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_WKUP_IOPAD(0xcc, PIN_INPUT, 7) /* (G28) WKUP_GPIO0_7 */
> +		>;
> +	};
>   };
>   
>   &wkup_uart0 {
> 
