Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B8C6225B6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiKIIqc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiKIIqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:46:31 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E84A2BFE
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:46:30 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id s24so24683913ljs.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfRa70L7g0nxe8P0BclrazZWpKjrPweL5zf7N3oG2m4=;
        b=IUY3VD9UK53+OdkIAp16Q6OthrEIBlaCwIS+04/+wqYsufoykWa7ec+XrK0zWZKOLa
         9Xzj6/zUaGWLu70p+rtSjKWSbi/bwzoMKcO5hMjsnxm2lMp9viboE46t5XqiqmDkBSDJ
         TX8RdQJKRJ76ggcJk1xc2zFytuyQPXFj6EnpPfWXt2ABSWEUv3gNt+uJQOy97TjkvrU5
         WeriNZP5okt8MvUGbEyfjT3OZDULrDbRymmqFLkZ1yoCs/gEmG5pdEm3LWFFH4o2FYsK
         pM50Z+BTo3pPTPnsYb1HvboYRnljbO0UhVIvdG8YTlUwLskYwJ3D54BTgBKfmN/3NEGQ
         226A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfRa70L7g0nxe8P0BclrazZWpKjrPweL5zf7N3oG2m4=;
        b=LFK2bOFH9B6VammIb2JyBD5vgku01aMcBKRgEpI/1e2beSIxXGY+X7lQn/tfDpPPqY
         2i/qqv0Q5UFZFo1Q1pnooFnROM/BuNCxJEaMBh8iRtu3DTs99G78jXFEnDv04L6SGDIU
         4ftB6QcwPV0eVvltTjwzAffKZSQz8/rfoRIMYZsWwy0nZ8SYaXGhdV9dUMnGttaw0cR2
         XcV1koiLQaNQwlbUVrCGX56URLu3Ewpr6HOn3A825cfKR9bvoWaCMzwpGSvEk2hVoCi0
         SEyg4grcyUk7Cz8Qsit83mZ0GAPKqbVCK9KOlMV6G6l/D5Mk5qhm62oitE0SXikJ6/L8
         QMlg==
X-Gm-Message-State: ACrzQf1am3jmQIF3RBjinnMlMdlHU712OJQvhSEJpra0rjqb5yN72brj
        +e12f6gQXq1sbjAzXlCBaPYIrA==
X-Google-Smtp-Source: AMsMyM6fnwCEY5y06IZIpi9DtTIMT7zAe2zw95FGw/UKN9dOcLrqH4A5BEisW1ztQojxGaa3aHSzgA==
X-Received: by 2002:a2e:92c6:0:b0:277:3ca2:dac6 with SMTP id k6-20020a2e92c6000000b002773ca2dac6mr7337738ljh.143.1667983588862;
        Wed, 09 Nov 2022 00:46:28 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b0026a92616cd2sm2026488ljl.35.2022.11.09.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:46:28 -0800 (PST)
Message-ID: <371d8427-b854-a39b-9d20-6c55018f670f@linaro.org>
Date:   Wed, 9 Nov 2022 09:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/7] Documentation: tps6594x: Add DT bindings for the
 TPS6594x PMIC
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-2-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-2-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2022 07:55, Matt Ranostay wrote:

Missing commit msg.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594x.yaml  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
> new file mode 100644
> index 000000000000..be87f0037bf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps6594x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS6594x Power Management Integrated Circuit (PMIC)
> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    contains:

Drop contains.

> +      enum:
> +        - ti,tps6594x

No wildcards in compatibles.

> +
> +  reg:
> +    const: 0x48
> +    description: I2C slave address

Drop description.

> +
> +  ti,system-power-controller:
> +    type: boolean
> +    description: PMIC is controlling the system power.
> +
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594x-rtc

No wildcards in compatibles.

> +
> +  gpio:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594x-gpio

No wildcards in compatibles.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible

> +...

Best regards,
Krzysztof

