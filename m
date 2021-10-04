Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB01F42114F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 16:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhJDObI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 10:31:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43386 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhJDObH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 10:31:07 -0400
X-Greylist: delayed 8194 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Oct 2021 10:31:07 EDT
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 194CCgUM057091;
        Mon, 4 Oct 2021 07:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633349562;
        bh=i5Nav41XdPOpxnBOObxR4cnbWd3GTYV6bv5bwO44XIQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i3E8XvOnB00sihGCYnHnzLQmNmw02ZYxjDSuYfVrrSyf0G4dt2PRVimO3kwIR+sHp
         Dn57ml2vCm/114L3I1cDxkS0gNYPfaRoCiF1vZ9zlA5kLZWfU9fygYZb+tJeFFVlNR
         alp199lb/7nQEIVWtJzn9VqhewzZeFfxUkGLgUB4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 194CCgt5091835
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Oct 2021 07:12:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Oct 2021 07:12:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 4 Oct 2021 07:12:42 -0500
Received: from [10.250.232.107] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 194CCdVp073892;
        Mon, 4 Oct 2021 07:12:40 -0500
Subject: Re: [PATCH] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
To:     Aparna M <a-m1@ti.com>
CC:     <vigneshr@ti.com>, <grygorii.strashko@ti.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <bgolaszewski@baylibre.com>
References: <20211004112743.19828-1-a-m1@ti.com>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <a444c057-c6cf-8a98-8b94-105049d861b7@ti.com>
Date:   Mon, 4 Oct 2021 17:42:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004112743.19828-1-a-m1@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Aparna,

On 04/10/21 4:57 pm, Aparna M wrote:
> * Convert gpio-tpic2810 bindings to yaml format
> * Remove outdated gpio-tpic2810 bindings in .txt format
> 

Usually, I have not seen the commit messages being listed as points, but
rather written as paragraph.

Also, I see the following warnings on running dt_binding_check,

./Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml:10:4:
[warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml:27:5:
[warning] wrong indentation: expected 2 but found 4 (indentation)

Thanks,
Aswath

> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
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
> index 000000000000..6d4e22143551
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
> +   - Aswath Govindraju <a-govindraju@ti.com>
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
> +    - compatible
> +    - reg
> +    - gpio-controller
> +    - "#gpio-cells"
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

