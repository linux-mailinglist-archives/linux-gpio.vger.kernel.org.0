Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5B7621E1C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 21:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKHU4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 15:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiKHU4D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 15:56:03 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242012180D
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 12:56:02 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d6so22880949lfs.10
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 12:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9uZSDNWvaPFO2rZ2x2Euvj8Fn47RRK/0sBC6DfBoo=;
        b=CuaG+ej43GV97bUxgLQ9Mm7HA7sNVVPduZA+KOU+AD0jUQpgdK2xLg5+jOzpTkMTkd
         YRdoqohWEn/klIj6bPC4IgxMSsVVC5svI2BPsorqQfBxwe2o/DohjYx8NEPwa7rt9UKU
         ZzBGG9pXB6oIJ2M1xF0rDC5J/WyZQlJFOzL436PLSirh6EBvyoOzAwnGoGNKwu+7RWN8
         GmyflwkKAKtNq2iUMsLJJCxoFxNgINizTJBJ8uNMxS7U19tp/v6cAF224e07LIq/QTo0
         NSiBRikayAq+us4QpLNdvEfZjYkk1nwrFpBCSb26a3cbqrN+o7ih+b5KtV5C0CaseA0o
         4K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9uZSDNWvaPFO2rZ2x2Euvj8Fn47RRK/0sBC6DfBoo=;
        b=ydhlh8DQyP8RoBIwoY6Eqftp5vcnpuJDxsaN0itlI0QhkHC7nSkoT47wV7HfROglSm
         VN5ASyl5fuiM9SF32W1IKOMaY1REXU4XAdo7CBUXE9wCEIiLX6G4UDvrOlxmJOHSg+8F
         yq0IHNm7kMibO/xPZhjs+lktJHGTOoL15majA9qsr08bQKcm3by6f3FUKJZc89RwPkqi
         YsLX2BBlJNBGfczIfYSSsYWGfKqZL8chwfqJo8FOn7GQ8ki0hKoXJTmq4+Cz1fEEXfZC
         YVWKFrSZRR3hQf8tMJZCBVIHRZtISGaseiztQYRnK6MFH9BEko06m2Xc6bVa9Dr2g/U0
         G7aw==
X-Gm-Message-State: ANoB5pk6TlJm4j/0vibrbl/3UwUpAr2gPhP/Skz7d2Ix3mu5O2ZeBym/
        i72/VxQeZUFvl3hk6UgVkENXPA==
X-Google-Smtp-Source: AA0mqf5bvyq3TmeVB175nUAweelEZ+MjMm8/M3KZoRYAcUcfeLH2drcbccrcU5kqWiR1zP0FQH25kg==
X-Received: by 2002:ac2:5b8f:0:b0:4b3:e970:693f with SMTP id o15-20020ac25b8f000000b004b3e970693fmr2654998lfn.421.1667940960464;
        Tue, 08 Nov 2022 12:56:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00497a1f92a72sm1933759lfr.221.2022.11.08.12.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 12:55:59 -0800 (PST)
Message-ID: <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
Date:   Tue, 8 Nov 2022 21:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
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
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
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

On 08/11/2022 17:33, Russell King (Oracle) wrote:
> Add a DT binding for the Apple Mac System Management Controller.

Drop the second, redundant "binding" from subject. It's already in prefix.

> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 000000000000..014eba5a1bbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  gpio:
> +    $ref: /schemas/gpio/gpio-macsmc.yaml

So this depends on other patch, so:
1. You need mention the dependency in cover letter (nothing there),
2. Re-order patches.

The GPIO cannot go separate tree and this must be explicitly communicated.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {

Usually these are called system-controller, to have a generic name (as
asked by DT spec).

> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;

Align the items (opening <).

With three above:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

