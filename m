Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0E660E3A7
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 16:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbiJZOq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 10:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbiJZOqu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 10:46:50 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D93BB04A
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 07:46:48 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id z186so5691708vkg.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDoFbRmpFybio1qcLHY0tDGGsYUITlP7lC7AmzHBMGM=;
        b=ErjcaOkv9A46t8SE5ZuZYqWKYgxYU75Xn13yXsVaU5LHB7gHdONvR2sFcvOw8AWc0W
         fIPqi4JoNgoKnKqqU5szIVXZLtX0VkOJOf/YLRrtNOO2scUbyXe6Oi92ajQuJ40154br
         zLynY1TTM2qoqp67CLdL3UViRqFtsysf5KHh7qCz6vNdgOu4Y8XzwnfMq/8hWBQUnOdP
         oK3W3ue69CjfJQfNeiLF531tKavZ8icMLSkfYMbaV7IKC+DnBl2rKuoOwpIZzofsp53z
         faCmggwwoUjw7Wl/QdZLRviaun8Fnfn/o3eG+w9fsn1oSqfqVo0k4NVS8MJVrmbQjoS/
         H9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDoFbRmpFybio1qcLHY0tDGGsYUITlP7lC7AmzHBMGM=;
        b=tfSMuqfHzBwxsT/VAGDcLMOY0GrzDwcZtlcyXaLWlQJOy9kG1KvMkGM8/aP9xrp6Lm
         3B+ydexNqNBE9WuGYLLmI0opaMc5L3J3N0DBk7oB9J/sUB6u8wCzDd5NfnpthTKOG99Y
         mE4KxH3iwc5dZyW7YtKn4Akcs5XFsoVpG94Fk0aOXoSGMV5zTMZw8d3c0IeqxTHbvwqw
         E58pVL1yJYTfz+wzuwLUPEKLwkRcBnAwvXa5HUucby0gl8idQNrfgycMPAenWM9FTee4
         1Ze7bEBZF8x1i+DccwtB50LPUfgFG05mxWFooZtLKnxIHZcG9cKJI3RwiAFUsUIoBhKW
         CMSA==
X-Gm-Message-State: ACrzQf2kEY6L/EBU5BNBB0iNXL45VJaQcaaUF84j+eFbpieEeu0AANrf
        vlPWJAhZCMas2l49tKOrfVev3AatYfz76w==
X-Google-Smtp-Source: AMsMyM6tLMgDzhVuBp730Vc4cqg8QdTyjhTznsNLsPIIhXXYp6fgBJ1sbSEQDjUxH62sokrHC0E+Pw==
X-Received: by 2002:a05:6214:20aa:b0:4b3:e0de:cbc2 with SMTP id 10-20020a05621420aa00b004b3e0decbc2mr35685060qvd.91.1666795596881;
        Wed, 26 Oct 2022 07:46:36 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a111200b006ec9f5e3396sm3935338qkk.72.2022.10.26.07.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:46:36 -0700 (PDT)
Message-ID: <30b95e7b-b902-babc-ea78-a2112c80ec7e@linaro.org>
Date:   Wed, 26 Oct 2022 10:46:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH next 2/2] dt-bindings: gpio: add entry for
 hisilicon,gpio-ascend910
Content-Language: en-US
To:     Weilong Chen <chenweilong@huawei.com>, f.fangjian@huawei.com,
        linus.walleij@linaro.org, yangyicong@hisilicon.com,
        xuwei5@huawei.com, robh+dt@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221026034219.172880-1-chenweilong@huawei.com>
 <20221026034219.172880-2-chenweilong@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026034219.172880-2-chenweilong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/10/2022 23:42, Weilong Chen wrote:
> Add the new compatible for HiSilicon gpio controller driver.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  .../gpio/hisilicon,gpio-ascend910.yaml        | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/hisilicon,gpio-ascend910.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/hisilicon,gpio-ascend910.yaml b/Documentation/devicetree/bindings/gpio/hisilicon,gpio-ascend910.yaml
> new file mode 100644
> index 000000000000..912e4b808cae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/hisilicon,gpio-ascend910.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/hisilicon,gpio-ascend910.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon common GPIO controller Device Tree Bindings

Drop "Device Tree Bindings"

> +
> +maintainers:
> +  - Jay Fang <f.fangjian@huawei.com>
> +
> +properties:
> +  compatible:
> +    const: hisilicon,gpio-ascend910
> +    description:
> +      The HiSilicon common GPIO controller can be used for many different
> +      types of SoC such as Huawei Ascend AI series chips.

Put this description in top-level description.

> +
> +  reg:
> +    description:
> +      Address and length of the register set for the device.

Drop description.

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
> +required:
> +  - compatible
> +  - gpio-controller

gpio-cells are not required?

> +  - reg
> +  - interrupts
> +  - ngpios
> +
> +unevaluatedProperties: false

Instead:
additionalProperties: false

> +
> +examples:
> +  - |
> +    gpio@840d0000 {
> +      compatible = "hisilicon,gpio-ascend910";
> +      reg = <0x840d0000 0x1000>;
> +      ngpios = <0x20>;

Convention for counting is to use decimal numbers.

> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      interrupts = <0x0 33 0x4>;

This looks like standard IRQ flags, so use respective defines.


Best regards,
Krzysztof

