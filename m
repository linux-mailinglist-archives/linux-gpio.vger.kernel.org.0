Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACCA487D38
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfHIOxC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:53:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33058 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIOxC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:53:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79Equnw076130;
        Fri, 9 Aug 2019 09:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565362376;
        bh=V2KXqyvDDIJp8HPjSXjxQloTkI08WBnBkF4L8tqqD1A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kQTXHwN1zRnKz80S77FF9u2hIo/4nVL/HRzLlV99r1cBKa6aLtAGzYZjniUn7ko+e
         CxwJL8BqezFQhXUGVW3xHLDR0bvyOzuGlVnRr8TSfEjU8s+LIoF9qEFSxS7DUN7AjG
         tbJyyFkOtBNSj55rZJbKlhe6xBcVvoDcBJSwjxfQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79EquWP041139
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 09:52:56 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 09:52:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 09:52:56 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79EqrAo086111;
        Fri, 9 Aug 2019 09:52:54 -0500
Subject: Re: [PATCH 2/6] arm64: dts: ti: k3-j721e: Add gpio nodes in main
 domain
To:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>, <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-3-lokeshvutla@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <170f021e-eeeb-9b5b-1e66-7cf2dfc54185@ti.com>
Date:   Fri, 9 Aug 2019 20:23:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-3-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> There are 8 instances of gpio modules in main domain divided into 2 groups:
> - Group1: gpio0, gpio2, gpio4, gpio6
> - Group2: gpio1, gpio3, gpio5, gpio7
> 
> Groups are created to provide protection between two different processor
> virtual worlds. There are x gpio lines coming out of each group. Each module
> in a group has equal x gpio lines pinned out. There is a top level mux for
> selecting the module instance for each pin coming out of group. Exactly
> one module can be selected to control the corresponding pin. This muxing
> can be controlled along the pad mux configuration registers.
> 
> Group1 pins out 128 lines(8 banks). Group 2 pins out 36 lines(2 banks).
> 
> Add DT nodes for each module instance in the main domain. Users should
> make sure that correct gpio instance is selected in their pad configuration.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 132 ++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 01661c22c39d..199bc9a00b20 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -240,4 +240,136 @@
>   		clocks = <&k3_clks 286 0>;
>   		clock-names = "fclk";
>   	};
> +
> +	main_gpio0: gpio@600000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00600000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <105 0>, <105 1>, <105 2>, <105 3>,
> +			     <105 4>, <105 5>, <105 6>, <105 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 105 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio1: gpio@601000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00601000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <106 0>, <106 1>, <106 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 106 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio2: gpio@610000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00610000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <107 0>, <107 1>, <107 2>, <107 3>,
> +			     <107 4>, <107 5>, <107 6>, <107 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 107 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio3: gpio@611000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00611000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <108 0>, <108 1>, <108 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 108 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio4: gpio@620000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00620000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <109 0>, <109 1>, <109 2>, <109 3>,
> +			     <109 4>, <109 5>, <109 6>, <109 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 109 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio5: gpio@621000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00621000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <110 0>, <110 1>, <110 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 110 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio6: gpio@630000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00630000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <111 0>, <111 1>, <111 2>, <111 3>,
> +			     <111 4>, <111 5>, <111 6>, <111 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 111 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio7: gpio@631000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00631000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <112 0>, <112 1>, <112 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 112 0>;
> +		clock-names = "gpio";
> +	};
>   };
> 
