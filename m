Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FCD420EE7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 15:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhJDN3Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 09:29:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35742 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236913AbhJDN1U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 09:27:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 194DPR8l119744;
        Mon, 4 Oct 2021 08:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633353927;
        bh=tg65zxqAIo6JHCoBcOsaI5xso/b3UXz2yT65otS3DMQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g7fnYEIjW++hF0XAoRjhTtdtVYRwSF7C5kH2Angb9zXroIZ3TrciqXjrQYqix60LD
         bDNLo4SJHI/knyJ7Ot5f4zD80ovKnIUuywswZ3ymYHHdFYhYLEDhJU5lEOjWaAQ78X
         8ywYsxXFoyXmHJX0yhs6Fy8/BaRtfxPmU+M8YadI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 194DPRao051940
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Oct 2021 08:25:27 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Oct 2021 08:25:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 4 Oct 2021 08:25:27 -0500
Received: from [10.250.232.107] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 194DPOY5079224;
        Mon, 4 Oct 2021 08:25:24 -0500
Subject: Re: [PATCH v2] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
To:     Aparna M <a-m1@ti.com>
CC:     <vigneshr@ti.com>, <grygorii.strashko@ti.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <bgolaszewski@baylibre.com>
References: <20211004131500.22100-1-a-m1@ti.com>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <d4ca4dbc-32b8-5189-adc0-ed876abfca49@ti.com>
Date:   Mon, 4 Oct 2021 18:55:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004131500.22100-1-a-m1@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Aparna,

On 04/10/21 6:45 pm, Aparna M wrote:
> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> bindings in .txt format.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
Thank you for making the requested changes.

Reviewed-by: Aswath Govindraju <a-govindraju@ti.com>

Thanks,
Aswath

>  .../bindings/gpio/gpio-tpic2810.txt           | 16 -------
>  .../bindings/gpio/gpio-tpic2810.yaml          | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
> deleted file mode 100644
> index 1afc2de7a537..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -TPIC2810 GPIO controller bindings
> -
> -Required properties:
> - - compatible		: Should be "ti,tpic2810".
> - - reg			: The I2C address of the device
> - - gpio-controller	: Marks the device node as a GPIO controller.
> - - #gpio-cells		: Should be two. For consumer use see gpio.txt.
> -
> -Example:
> -
> -	gpio@60 {
> -		compatible = "ti,tpic2810";
> -		reg = <0x60>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> new file mode 100644
> index 000000000000..811aee483f43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-tpic2810.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPIC2810 GPIO controller bindings
> +
> +maintainers:
> +  - Aswath Govindraju <a-govindraju@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tpic2810
> +
> +  reg:
> +    maxItems: 1
> +    description: The I2C address of the device
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio@60 {
> +            compatible = "ti,tpic2810";
> +            reg = <0x60>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> 

