Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56F9248551
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 16:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQO1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 10:27:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47928 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQO1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 10:27:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HERIiI023072;
        Mon, 17 Jun 2019 09:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560781638;
        bh=LXNTgUL3IzEu+dPtfl7knxkpN2HWl5SErV8d1BUZZ8M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=o2YQ1GEU8312fs9YElfwa62d6flBK5/igTpKD96CPwbvVZaWkLuoYFK5BYONOnFxb
         XMFzSeeT13z6wry0oHDfOpJqU/3Q1/seAnqVu3JSp+qjcZyVywoqP+UiJfkX1PKZKA
         8tHWHRkR46BYzJdYzxbe1kBwP9icC2aqjwtzrPDA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HERI5N021513
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 09:27:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 09:27:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 09:27:16 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HEREYL061294;
        Mon, 17 Jun 2019 09:27:14 -0500
Subject: Re: [RFC RESEND PATCH v2 3/4] arm64: dts: ti: am6-main: Add gpio
 nodes
To:     Keerthy <j-keerthy@ti.com>, <nm@ti.com>, <robh+dt@kernel.org>
CC:     <lokeshvutla@ti.com>, <bgolaszewski@baylibre.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190606095620.6211-1-j-keerthy@ti.com>
 <20190606095620.6211-4-j-keerthy@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <39705d27-155d-373e-1c83-25757665821e@ti.com>
Date:   Mon, 17 Jun 2019 17:27:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606095620.6211-4-j-keerthy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/06/2019 12:56, Keerthy wrote:
> Add gpio0/1 nodes under main domain. They have 96 and 90 gpios
> respectively and all are capable of generating banked interrupts.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 32 ++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 22154f401930..182efe70402b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -350,4 +350,36 @@
>   			ti,sci-rm-range-global-event = <0x1>;
>   		};
>   	};
> +
> +	main_gpio0:  main_gpio0@600000 {
> +		compatible = "ti,am654-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x600000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&intr_main_gpio>;
> +		interrupts = <57 256>, <57 257>, <57 258>, <57 259>, <57 260>,
> +				<57 261>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <96>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		clocks = <&k3_clks 57 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio1:  main_gpio1@601000 {
> +		compatible = "ti,am654-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x601000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&intr_main_gpio>;
> +		interrupts = <58 256>, <58 257>, <58 258>, <58 259>, <58 260>,
> +				<58 261>;
> +		interrupt-controller;
> +			#interrupt-cells = <2>;

The above line has an extra tab. Fixed locally and pushed to am654-next.

-Tero

> +		ti,ngpio = <90>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		clocks = <&k3_clks 58 0>;
> +		clock-names = "gpio";
> +	};
>   };
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
