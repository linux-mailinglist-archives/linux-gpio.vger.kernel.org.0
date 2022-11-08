Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C00621E20
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 21:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiKHU4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 15:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiKHU4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 15:56:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600605D6A2
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 12:56:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id l12so11757629lfp.6
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 12:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ad8MM775MX8kkZmKXPWgGcns6ayg4q9MzIVD+G5PmQg=;
        b=goi2RTkINNq3mhzzDvlkafzAxaDL67ZVh9LTbILuCJ9C5o32QH/23LZKjbOLvgDNh3
         EJQEyP/6abyTw5NMK3rcVvLbCNkGPefbeG2p9yYx5JE8xJTz/ZnmqjuCiScTy5fIse9z
         n0vAFBf9Oz5qfGWOT3xGaCnqK2wnlD7Llg5FAZlkiCxJICTDO2qpFLwbLmS87w1ayHlT
         A//wV5GT85S8x+8CuMB5/s9Qnj9A3OUDmwi3Gi9otijYsLGGSru+vleBzv5uOI0DYSgt
         JdMqwX7MO3a9Wz4iLf5DD+VUHP/JrgROgS6MKrDPwNdBzJdjUiV0Ftu8TkyzcaXCY1+q
         TZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ad8MM775MX8kkZmKXPWgGcns6ayg4q9MzIVD+G5PmQg=;
        b=wlemEka3hdJ0of6wxr2+kg0lyc+4GhNnNGGrm/xBeC45E14YNLcaD1kqIyC9d7zQQI
         EouqrHcVRzarBy06r75RQy+LO2FbQxe1ljDjIyDlphq5aip9R2I4xBv7MoS1YkpwY1q8
         Z7ceZOAxs0675WB+fWVRPfS57lzouTaZ9mDPFzu8/1cEQQ2dsfv2CssvtyGGlUmxKGLV
         3j9zpBsyhltJ36+04NcpfyJFDvHNW91KL4fIg02hVcv1IK3eMzD+eyb+szAJ+7bZEMDc
         idQd+5MYN+dKEO1SPfUNJAPThzmv5lnr0GFkdE5SSXYwjbgyjIt53IJBRRwn5Ap4xL3i
         +HGg==
X-Gm-Message-State: ACrzQf36Iu06dWOVo7CLEFs1LDi7ZKcSnESTm8AlZhHtVHny6HZb48sK
        NFDjHvE4exn5IS1ciG7qMfJmJA==
X-Google-Smtp-Source: AMsMyM4hu9OiiCewvDU7A8lsXIdopQmxVX5urSunLwOwa3m+oe93nVaD5+oSBQfFSD8aFdv4exQGkQ==
X-Received: by 2002:a05:6512:2821:b0:4a1:e97e:5025 with SMTP id cf33-20020a056512282100b004a1e97e5025mr19317061lfb.41.1667941001742;
        Tue, 08 Nov 2022 12:56:41 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a11-20020ac2520b000000b004b1892aa5c8sm1932148lfl.56.2022.11.08.12.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 12:56:41 -0800 (PST)
Message-ID: <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
Date:   Tue, 8 Nov 2022 21:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/11/2022 17:33, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> new file mode 100644
> index 000000000000..1a415b78760b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller GPIO block.
> +

Best regards,
Krzysztof

