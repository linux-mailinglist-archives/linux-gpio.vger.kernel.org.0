Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11216CAE1D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 21:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjC0TGB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 15:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjC0TGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 15:06:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4CA26A3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 12:05:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b20so40458390edd.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 12:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679943956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BuTaW3J/AVyHqQTC99uJpLP3eB+1iZMX0oLrYWZybg=;
        b=rvtir/fKMe5BFCjaJdjHOfomSp4Suwz5z93QZbJCSSOZzdffa80//lK2r1VS6X8dBV
         Q3zezRWxrKQiVVwJvIDMvQd3VkEbUGUmwyb9jZkg1oU4xR9TXTgCxxgek85roq8Lmg0f
         Fr7ijPOnBZLJT8CPdKRSIFNQyLkK6klKoc+7AW2PhUFI0jo0EWutqEKd51EojBl+1Kg/
         i4k3Lk5ltnk3EtKcBA4Ht3dE4N4I5/cYfW3VNsX01ur+YApq1F8TbISjPvsEEQTZbWhv
         cOqZBzN5C8l0qbQnBnIA7MV3oP4FLqAzhw66qDHsNzurH/iYwboWnETkQOuHCwQZfz1y
         F+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679943956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2BuTaW3J/AVyHqQTC99uJpLP3eB+1iZMX0oLrYWZybg=;
        b=eKdC0LPwtoyAL8bFgh+f+wQgwKtA209TlfzDOsFbCokSH9NBwUy+9Tmr1tpvZvi7Mq
         g5O7c6gfojkxrQSyTlCCkGGKZQ7+78qZHK6k76XyyhilCps30vzp3Qax1F/fkIaqAfIn
         zehZ53gkd4rKCL0P9ZcMDYr/FgSKOBK2g0nitQmYE/61Hekeumye/vAdi+zbG1YE+ym2
         S6kdYvcvyiT8v/KyAK4EEq3YFnDiKTjZ5ePwCfT+IZyBUu4zafkuIwOmq8E6qZCRjEZ5
         t5VIcSwaIDbsMHn73L0hXCcit6MUhXpT/YmNwxSR7mCned9lJTxt8WcoH+1cn6ij0iAR
         l2dg==
X-Gm-Message-State: AAQBX9f3M/Q3vMpE765iBSnXsP1464nzqtICr/VEoM9qr6oogwEioyOV
        QEStohNCJb6dW1rMhkepr7jDig==
X-Google-Smtp-Source: AKy350Yk0SAFeqtvDmPlrfg7iYq7hca/kt9KOVLp+eQtXd3p2q9/r1Uucloa+XrwYBhRNKnXMxHopA==
X-Received: by 2002:a05:6402:1655:b0:501:d917:d52 with SMTP id s21-20020a056402165500b00501d9170d52mr11701917edx.8.1679943955993;
        Mon, 27 Mar 2023 12:05:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9314:a4b3:ce49:2c6b? ([2a02:810d:15c0:828:9314:a4b3:ce49:2c6b])
        by smtp.gmail.com with ESMTPSA id x93-20020a50bae6000000b004fbf6b35a56sm14997800ede.76.2023.03.27.12.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 12:05:55 -0700 (PDT)
Message-ID: <138820d9-5ff4-0cd1-88a9-6845ad85d157@linaro.org>
Date:   Mon, 27 Mar 2023 21:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: ds4520: Add ADI DS4520
To:     Okan Sahin <okan.sahin@analog.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230327130010.8342-1-okan.sahin@analog.com>
 <20230327130010.8342-2-okan.sahin@analog.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327130010.8342-2-okan.sahin@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/03/2023 15:00, Okan Sahin wrote:
> Add ADI DS4520 devicetree document.
> 
> Signed-off-by: Okan Sahin <okan.sahin@analog.com>
> ---
>  .../bindings/gpio/adi,ds4520-gpio.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml b/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml
> new file mode 100644
> index 000000000000..69f90e59d415
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml

Filename matching compatible.

> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/adi,ds4520-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DS4520 I2C GPIO expander
> +
> +maintainers:
> +  - Okan Sahin <okan.sahin@analog.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ds4520
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':

Use consistent quotes - either ' or ".

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
> +    i2c0 {

i2c


> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ds4520: gpio@50 {

Drop the label, not used here.

> +            compatible = "adi,ds4520-gpio";

As Rob's bot pointed...

Best regards,
Krzysztof

