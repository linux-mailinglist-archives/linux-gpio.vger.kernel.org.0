Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D32E3848
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 18:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503699AbfJXQjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 12:39:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53863 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503682AbfJXQje (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 12:39:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id n7so2755895wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6airdfmWbPo+9H8q8yF8Fow5EQ+bKYy5OYJZbu/8klg=;
        b=OT4cDmsUunbscfxvhDw+rIVX2AsuGIv9mDVd9Lz1JmIYVvwuXSxmr+inrLJOCkaPlp
         Z57x8PvO+vWADTq1pOJQK78YuP5oUWFPIpmVNDmTi+yAc0QbSG2tr9ojk+PQ6S98bUxo
         egLtniHBPwO+5iTboWMsWoM/TMqXQFup6d2H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6airdfmWbPo+9H8q8yF8Fow5EQ+bKYy5OYJZbu/8klg=;
        b=EXl82YVvJ7d36N8wQURfH0KvkqDLTkXXHZk8SVyh+Go9BJf5UnJ6oXBa+APpEgZEH6
         L2sfQQYfIRuDDSKv/q8cLYDVDrgvGPmOMKkKx0Bx2rxNtlBSxcxL7Pv4JMYlfUDbMqA5
         aHtH7t0CAYaIfmgaBrrA3mtXyHw4ATZum+ddqSJJx5vvjCmEE9X6rxhpVKii2EK09d/d
         YRCixf3HP7vEySGuTFy5KDFDQw62lRz1RPM5GZyIhAXcCr7C7CJ9x57oUbys/TiyPEb0
         lYkeJ+a1Qi8b8i50n/aOnBOeV2lZk0idD1Djpne0KbKAeXJpGRKyOZ5yUTnIM9ifWYaK
         rnkg==
X-Gm-Message-State: APjAAAU8XJJVyVXSH3syz0m2aQ2tXkgLLzP/OZd6Wh2rokNb/jADpzJd
        gNk6byB+yZtUk8meSgzWPtbM4g==
X-Google-Smtp-Source: APXvYqz3vCdn5X+pVSPFYILymZ7NnZuRiPFSO7yPCexT8xbKvyQr1f9rcrSOfkcoYmxikGkdR5xgng==
X-Received: by 2002:a1c:48c4:: with SMTP id v187mr5904648wma.27.1571935172517;
        Thu, 24 Oct 2019 09:39:32 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x7sm37064980wrg.63.2019.10.24.09.39.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:39:31 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: brcm: Add bindings for
 xgs-iproc
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191024004816.5539-1-chris.packham@alliedtelesis.co.nz>
 <20191024004816.5539-2-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <db6d6cc7-6844-7079-7115-da1eb9c1feac@broadcom.com>
Date:   Thu, 24 Oct 2019 09:39:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024004816.5539-2-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

On 2019-10-23 5:48 p.m., Chris Packham wrote:
> This GPIO controller is present on a number of Broadcom switch ASICs
> with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> blocks but different enough to require a separate driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>      Changes in v3:
>      - incorporate review comments from Rob and Bart
>      
>      Changes in v2:
>      - Document as DT schema
>      - Include ngpios, #gpio-cells and gpio-controller properties
>
>   .../bindings/gpio/brcm,xgs-iproc.yaml         | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> new file mode 100644
> index 000000000000..ec1fd3a64aa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
This doc needs to have gpio in the name to make all other gpio binding 
documents.
ie.
brcm,xgs-iproc-gpio.yaml.
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom XGS iProc GPIO controller
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +description: |
> +  This controller is the Chip Common A GPIO present on a number of Broadcom
> +  switch ASICs with integrated SoCs.
> +
> +properties:
> +  compatible:
> +    const: brcm,iproc-gpio-cca
> +
> +  reg:
> +    items:
> +      - description: the I/O address containing the GPIO controller
> +                     registers.
> +      - description: the I/O address containing the Chip Common A interrupt
> +                     registers.
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +      const: 2
> +
> +  ngpios:
> +    minimum: 0
> +    maximum: 32
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +dependencies:
> +  interrupt-controller: [ interrupts ]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio@18000060 {
> +        compatible = "brcm,iproc-gpio-cca";
> +        #gpio-cells = <2>;
> +        reg = <0x18000060 0x50>,
> +              <0x18000000 0x50>;
> +        ngpios = <12>;
> +        gpio-controller;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +
> +...

