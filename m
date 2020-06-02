Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BD01EBD42
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 15:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgFBNns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 09:43:48 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37742 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBNnr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 09:43:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 052Dheqp020813;
        Tue, 2 Jun 2020 08:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591105420;
        bh=065I5Q+YC+eqm5MUdzZUCPVbrqG+ejrqSWg2p4bVKMg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vMnwh9os7JRoZ5/GwBtiL4UyzI504++HJqFIf7d7Yn4Xq2GN118+MbEyfggQEiCe+
         afL9e1N6CuZH7AuqZtQodZYgEhcee2mRiIoqzdBiFaiaKm2hlzVQXdKO04NI4tJFC4
         /Gl1vGi6EvHnsogW0WG02rhmuGmIHjcYimb+00Sc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 052DheKO083413
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jun 2020 08:43:40 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 08:43:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 08:43:40 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052DhbgE070165;
        Tue, 2 Jun 2020 08:43:38 -0500
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
References: <20200602131428.GA496390@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
Date:   Tue, 2 Jun 2020 16:44:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602131428.GA496390@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 02/06/2020 16:14, Drew Fustini wrote:
> Add gpio-ranges properties to the gpio controller nodes.
> 
> These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> A csv file with this data is available for reference [2].

It will be good if you can explain not only "what" is changed, but
also "why" it's needed in commit message.

> 
> [0] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
> [1] http://www.ti.com/lit/ds/symlink/am3358.pdf
> [2] https://gist.github.com/pdp7/6ffaddc8867973c1c3e8612cfaf72020
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> Notes:
> There was previous dicussion relevant to this patch:
> https://lore.kernel.org/linux-gpio/20200525131731.GA948395@x1/
> 
> Here is the list I compiled which shows the mapping between a gpioline
> and the pin number including the memory address for the pin control
> register
> 
> gpiochip,gpio-line,pinctrl-PIN,pinctrl-address
> 0,0,82,44e10948
> 0,1,83,44e1094c
> 0,2,84,44e10950
> 0,3,85,44e10954
> 0,4,86,44e10958
> 0,5,87,44e1095c

...

> On a BeagleBlack Black board (AM3358) with this patch:
> cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/gpio-ranges
> 
> GPIO ranges handled:
> 0: gpio-0-31 GPIOS [0 - 7] PINS [82 - 89]
> 8: gpio-0-31 GPIOS [8 - 11] PINS [52 - 55]
> 12: gpio-0-31 GPIOS [12 - 15] PINS [94 - 97]
> 16: gpio-0-31 GPIOS [16 - 17] PINS [71 - 72]
> 18: gpio-0-31 GPIOS [18 - 18] PINS [135 - 135]
> 19: gpio-0-31 GPIOS [19 - 20] PINS [108 - 109]
> 21: gpio-0-31 GPIOS [21 - 21] PINS [73 - 73]
> 22: gpio-0-31 GPIOS [22 - 23] PINS [8 - 9]
> 26: gpio-0-31 GPIOS [26 - 27] PINS [10 - 11]
> 28: gpio-0-31 GPIOS [28 - 28] PINS [74 - 74]
> 29: gpio-0-31 GPIOS [29 - 29] PINS [81 - 81]
> 30: gpio-0-31 GPIOS [30 - 31] PINS [28 - 29]
> 0: gpio-32-63 GPIOS [32 - 39] PINS [0 - 7]
> 8: gpio-32-63 GPIOS [40 - 43] PINS [90 - 93]
> 12: gpio-32-63 GPIOS [44 - 59] PINS [12 - 27]
> 28: gpio-32-63 GPIOS [60 - 63] PINS [30 - 33]
> 0: gpio-64-95 GPIOS [64 - 81] PINS [34 - 51]
> 18: gpio-64-95 GPIOS [82 - 85] PINS [77 - 80]
> 22: gpio-64-95 GPIOS [86 - 95] PINS [56 - 65]
> 0: gpio-96-127 GPIOS [96 - 100] PINS [66 - 70]
> 5: gpio-96-127 GPIOS [101 - 102] PINS [98 - 99]
> 7: gpio-96-127 GPIOS [103 - 104] PINS [75 - 76]
> 13: gpio-96-127 GPIOS [109 - 109] PINS [141 - 141]
> 14: gpio-96-127 GPIOS [110 - 117] PINS [100 - 107]
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 5ed7f3c58c0f..340ea331e54d 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -151,6 +151,18 @@ SYSC_OMAP2_SOFTRESET |
>   
>   			gpio0: gpio@0 {
>   				compatible = "ti,omap4-gpio";
> +				gpio-ranges =	<&am33xx_pinmux  0  82 8>,
> +						<&am33xx_pinmux  8  52 4>,
> +						<&am33xx_pinmux 12  94 4>,
> +						<&am33xx_pinmux 16  71 2>,
> +						<&am33xx_pinmux 18 135 1>,
> +						<&am33xx_pinmux 19 108 2>,
> +						<&am33xx_pinmux 21  73 1>,
> +						<&am33xx_pinmux 22   8 2>,
> +						<&am33xx_pinmux 26  10 2>,
> +						<&am33xx_pinmux 28  74 1>,
> +						<&am33xx_pinmux 29  81 1>,
> +						<&am33xx_pinmux 30  28 2>;
>   				gpio-controller;
>   				#gpio-cells = <2>;
>   				interrupt-controller;
> @@ -1298,6 +1310,10 @@ SYSC_OMAP2_SOFTRESET |
>   
>   			gpio1: gpio@0 {
>   				compatible = "ti,omap4-gpio";
> +				gpio-ranges =   <&am33xx_pinmux  0  0  8>,
> +						<&am33xx_pinmux  8 90  4>,
> +						<&am33xx_pinmux 12 12 16>,
> +						<&am33xx_pinmux 28 30  4>;
>   				gpio-controller;
>   				#gpio-cells = <2>;
>   				interrupt-controller;
> @@ -1700,6 +1716,9 @@ SYSC_OMAP2_SOFTRESET |
>   
>   			gpio2: gpio@0 {
>   				compatible = "ti,omap4-gpio";
> +                                gpio-ranges =	<&am33xx_pinmux  0 34 18>,
> +						<&am33xx_pinmux 18 77  4>,
> +						<&am33xx_pinmux 22 56 10>;
>   				gpio-controller;
>   				#gpio-cells = <2>;
>   				interrupt-controller;
> @@ -1733,6 +1752,11 @@ SYSC_OMAP2_SOFTRESET |
>   
>   			gpio3: gpio@0 {
>   				compatible = "ti,omap4-gpio";
> +				gpio-ranges =	<&am33xx_pinmux  0  66 5>,
> +						<&am33xx_pinmux  5  98 2>,
> +						<&am33xx_pinmux  7  75 2>,
> +						<&am33xx_pinmux 13 141 1>,
> +						<&am33xx_pinmux 14 100 8>;
>   				gpio-controller;
>   				#gpio-cells = <2>;
>   				interrupt-controller;
> 

-- 
Best regards,
grygorii
