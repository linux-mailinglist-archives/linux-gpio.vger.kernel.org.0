Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D711478E92
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 15:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237619AbhLQOx6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 09:53:58 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36274
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232732AbhLQOx6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Dec 2021 09:53:58 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0020B3FFD5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639752837;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vLTMEL7n7woY5q+s7N7uOzihSJ1Iohdltx8RgCRfN94iixxaq6X09A+WMrFOk6lGu
         5Gh5zjqvSDuBrZqQ7Ck9N496kK9HabywB0U8OE6mcxpUwCHmNPGfc0CKPFSype0qfW
         iwfwSKbwFxjhdsFjb1QvR9HMYNTZjd0XS+BfhpsIY8PpxOGnw0UOVcmpV4tw56/L4a
         oLUJFfQcQZ/zzet9YRleW4SqS+62CpDXoklSXFgo9K2Nsf9TRNTwFu04e9DNbYCO31
         gfdgswimF/qmHPqJ8JzIFYzUV0CQjDJH+g+1ZnfCytZOHIvrEa1v0qhAgvcfa1m+qL
         7rRoqVwUFD0Qg==
Received: by mail-wm1-f70.google.com with SMTP id b75-20020a1c804e000000b0034569bde713so3039777wmd.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 06:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        b=sATTowngLElu7qz3Bo3yVtjZKa7KGOcURaE0JM9XaVzJmamdXij9SzZZX1Mrz9QEUz
         50gQvevdDxzFvTInK3oJ7UOF1q525GK4F89QB2oMY9I2kEnVFINh6/8GE+VfzcHzVzzX
         WZ1E+iiWDl9slruVrTCfTzaqEkkRDZaxnAhI7xx/5X/79knPzOdpx7lr9R0StkwAy4Uj
         emoMK7Rc2tQ+XTXVJlWyhSNDRrfHDbcMeCrf1QKxr8n5vf2itKT799lguq341SAd9dUC
         v57UYdcisG8yVs5UFaHPqqSaRlb0cXK+uGanuIgzcFD/JeFWxCY3bbXDV0vYcIolSztD
         FDYg==
X-Gm-Message-State: AOAM531Dw1YRrQSg5k790CFUuie8AWXPcBACQwFAesrx40BMlKGSj8hZ
        mFpz/L8i/UB+Pb6tTU+4Hp3XVH9+vTclhVnIhIAWQmXMZXRS351VJKIdJ6Fw+JZjRBqD6UDIdff
        MAth9VFPElMIdmLBYdZRUoqbGDDlGr8hFk2fJX8E=
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361846lfu.24.1639752826433;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWZAhKPzpNiuI3jFYeXfUrK3lYJtF2bSZiJkAI3tx170rbCKWelfdxX/kRZ9W0bjHvtpmAig==
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361809lfu.24.1639752826232;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 76sm1687531ljj.69.2021.12.17.06.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 06:53:45 -0800 (PST)
Message-ID: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
Date:   Fri, 17 Dec 2021 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
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
 <20211217093325.30612-7-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-7-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..32cbc37c9292
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  The hardware random number generator on the Polarfire SoC is
> +  accessed via the mailbox interface provided by the system controller
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-rng
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {

Three topics:
1. Node name (as most of others are using): rng
2. skip the label, not helping in example.
3. This looks very simple, so I wonder if the bindings are complete. No
IO space/address... How is it going to be instantiated?

> +        compatible = "microchip,mpfs-rng";
> +    };
> 


Best regards,
Krzysztof
