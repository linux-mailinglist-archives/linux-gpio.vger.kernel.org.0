Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2571F449E29
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 22:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240276AbhKHVaa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 16:30:30 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57544
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239237AbhKHVaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 16:30:30 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 85DA13F1F3
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406864;
        bh=gsSzukojkEIKbZ4C7biaTDNc7cqvWWRMW5pLSQwL88I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WMqik+ql6N3WqK7Bzrcb1s0SLaRdaqer2ZVelGTDOiVwKpvf3FcUmJmC+sYUToTlC
         5g1ueYY9MMdVojbbhOSrxdlQyyTdmSySDsNSm2WzCBNM4QSYt9J5FTiTveST1uakby
         zWG0u9QYyKuULUc6b60Rxxc6fCaR5rGbp/yBg4e0kBK9lf5+QqPbtKAQy5oBp+l4fT
         8INL6sILBEewg4rsL9mmkU8wapxN28VaHj2gFZHIySmPwvJApWS5ZiZsuxeidX5C+Z
         E5VrVQO2iK0sUrUnwMrHqCQyFfgmy+SoTZaixSFu1U7oOgdI1Q/L8vMbij4vvVzkDR
         4tUQaF9D9cx3A==
Received: by mail-lf1-f71.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so1212213lfu.16
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 13:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gsSzukojkEIKbZ4C7biaTDNc7cqvWWRMW5pLSQwL88I=;
        b=WL5vgZfY1BCeIdLjvvsh3sbTJ5tQUnRhoz+vUmK7WPObY9LrzjTw/JpVxRUz0GK/Kd
         HNrlf3ltipgGzJf39T6W1sMCFPO8SdEaWX4vD6HwVFqx+V2bfXG5TlZp7LApNHKArUm5
         2pPI1Yk4Oc39xIhBSg8y7NiD8pHklsUfC/Wdigxde+eEx3pU4SxEp1V1wzBSVax0kL4I
         VudiwtEt4qrfYw6cVbQSFy89VUazwahRRZLF+8mq0j2/ANCBC8jHqTrRa9/IWDO275lQ
         cnJfS7bJeobHUQHG10GaGu5gUXHidpBjWjiQ0s2JuCf/37TAy1Xd9pDLQp2UoTY1LCBL
         X1yg==
X-Gm-Message-State: AOAM533v0i39AOEsdFDXxWvvTInW3J5ot/vDuLccemldDj4taDOURFSY
        Lxuzj6yeKj+VqfVH9EOLjWfEOvbnabU5fzA5t0QuGWXTMXI+rHocByyJYTIgtWBw1xu1PCq0T4r
        qHyYL4MvBssFGAwmv8FWLbUcyWBvXsMY+AwUwKio=
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr2126564lfg.677.1636406863686;
        Mon, 08 Nov 2021 13:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGKgvZJkQA/4SyxVeMlcPDkjIat9cPad52UQIcFQ9i8k9Fl9QQidq5il9q/ZKjlaYE9irTVQ==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr2126517lfg.677.1636406863498;
        Mon, 08 Nov 2021 13:27:43 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o10sm1060383ljd.30.2021.11.08.13.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:27:43 -0800 (PST)
Message-ID: <6e8065cc-5688-b820-0bdd-6fb887ae3261@canonical.com>
Date:   Mon, 8 Nov 2021 22:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs
 musb
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-12-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> new file mode 100644
> index 000000000000..b867f49e7d70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This USB controller is found on the Microchip PolarFire SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-usb-host
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    minItems: 2

minItems should not be needed because you define all expected items below.

> +    items:
> +      - const: dma
> +      - const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - dr_mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      usb: usb@20201000 {
> +        compatible = "microchip,mpfs-usb-host";
> +        reg = <0x0 0x20201000 0x0 0x1000>;
> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
> +        interrupt-names = "dma","mc";
> +        dr_mode = "host";
> +        status = "disabled";

Skip disabled in example.

> +      };
> +    };
> +
> +...
> 


Best regards,
Krzysztof
