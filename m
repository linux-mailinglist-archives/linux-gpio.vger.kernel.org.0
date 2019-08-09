Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8990487D3C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHIOyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:54:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57978 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfHIOyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:54:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79EruZH021377;
        Fri, 9 Aug 2019 09:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565362436;
        bh=+6Rfl9oSqGGXjVeD367cB0oSgYNVzKo1d3JOerv49IQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Tq1CWY6fFhyndTpbYoM6/COWt0VPzTtw9PUfRq/HvYkrkLAb9CMqZotG2ZfE+pqQ1
         QPwoMSe41sMDWwIOxxi6pqTRmhioRC5WYbya2fCoZP67Ct8sM6D8P8uBVCgkX/zOW4
         nfTK3aXrb21tpi/SWahZYl33EqAXy8U1feE8KQpg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79EruDf048582
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 09:53:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 09:53:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 09:53:55 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79ErqMV098542;
        Fri, 9 Aug 2019 09:53:53 -0500
Subject: Re: [PATCH 3/6] arm64: dts: ti: k3-j721e: Add gpio nodes in wakeup
 domain
To:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>, <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-4-lokeshvutla@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <48fca046-d683-bb6c-d848-24ffada6ed85@ti.com>
Date:   Fri, 9 Aug 2019 20:24:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-4-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> Similar to the gpio groups in main domain, there is one gpio group
> in wakup domain with 2 module instances in it. This gpio group pins
> out 84 lines(6 banks). Add DT node for these 2 gpio module instances.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> index e616c2481f51..555dc7b7aedc 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> @@ -87,4 +87,38 @@
>   		ti,sci-dst-id = <14>;
>   		ti,sci-rm-range-girq = <0x5>;
>   	};
> +
> +	wkup_gpio0: gpio@42110000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x42110000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&wkup_gpio_intr>;
> +		interrupts = <113 0>, <113 1>, <113 2>,
> +			     <113 3>, <113 4>, <113 5>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <84>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 113 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 113 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	wkup_gpio1: gpio@42100000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x42100000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&wkup_gpio_intr>;
> +		interrupts = <114 0>, <114 1>, <114 2>,
> +			     <114 3>, <114 4>, <114 5>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <84>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 114 0>;
> +		clock-names = "gpio";
> +	};
>   };
> 
