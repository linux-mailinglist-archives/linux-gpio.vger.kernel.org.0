Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1B6101FD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 21:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbiJ0Tx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 15:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236632AbiJ0Tx2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 15:53:28 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089DD86808
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 12:53:28 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id u7so2360376qvn.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 12:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rv+NwcB7Y1yDXTCYeLwyYiNYVuug6DzRn6hIRZBdCUg=;
        b=aOIi48sLTeaB/rmVmxJkBD94JfMUWgq6PS8ZwjX7+2exH4wccljv1jo1YzB50A8kHT
         an1Fgb+VXsSl/ExzuheFeXQEkbCBoADkWq7RoSq3seEOFGi0kf39OO+aEqvI47NqnySI
         qtGP5bY9Q9rSZykvjffToryxmXekwIfCsX4Ybuc08tUZv8BVyV2SYD/G46zOsoo3/xZi
         Ljid7RBu2+ZXZDONp+UH4G5Q8zyQQyxXQYlc82gTLJy8PajVTdMsbN8kB9jiOh2BhYyq
         5g6agQmai3Jn37TtubHGDAMk0SX3mqmQZblJwmQg0lKY/mhkf7tTC+4GxUZ0NoGxwKAp
         py4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rv+NwcB7Y1yDXTCYeLwyYiNYVuug6DzRn6hIRZBdCUg=;
        b=ZFrTqIN46TonDUZAICg58H2QcAJkoqYhkDARi1VyaYNRM80fb7lV/4/TLVC0RFvrv0
         chg879nQ1jzu7R/6I52Y5Hqv67Tcj8KmyiPwvnT1tgbQeuXBxilMjyZ4JfDZwCWJRGFI
         VCPOPP1/1zBBzcflZdCTHmnMm4nKA1QZzdgGKGssQFP06Y+Sg9dC1on/CC3+FAeXtHem
         lJNsOciLRRQAuN9C92QFpTwchuBzu+O+a9ogf9Q5e7GgShbHcXkArcxtyxTIJmNWMxej
         lDp5a3W31a5arbs5x4Qxmpio/PhiS43GZTGRCph9QpkKZVsJzdh4O3xemYO6fMfk0GLk
         z4zQ==
X-Gm-Message-State: ACrzQf13dZfNzjh8QyYAje8yFUWOb+6usodhHLa9ahamu3Ariau0GtYf
        bWjguFRaj/v90IL3l5Emgw26cQ==
X-Google-Smtp-Source: AMsMyM6ct22e5nG9urtpWalWZ+2YwdwI+iPWj7oQCtEY2tAG4vdm4z0F1CwIJOTD6IQ+CLC/tZzp5Q==
X-Received: by 2002:a05:6214:5098:b0:4b4:2172:dc0 with SMTP id kk24-20020a056214509800b004b421720dc0mr42707171qvb.109.1666900407168;
        Thu, 27 Oct 2022 12:53:27 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m8-20020a05620a24c800b006ce515196a7sm1572362qkn.8.2022.10.27.12.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:53:26 -0700 (PDT)
Message-ID: <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
Date:   Thu, 27 Oct 2022 15:53:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hector Martin <marcan@marcan.st>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
 <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
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

On 27/10/2022 13:03, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> new file mode 100644
> index 000000000000..a3883d62292d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml


Filename based on compatible, so "apple,smc-gpio.yaml"

> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  This describes the binding for the Apple Mac System Management Controller

Drop "This describes the binding for"

> +  GPIO block.
> +
> +properties:
> +  compatible:
> +    allOf:

That's not proper syntax. Look at other examples (e.g. Apple bindings)
doing it. Probably you wanted items here.

> +      - enum:
> +          - apple,t8103-smc
> +      - const: apple,smc-gpio
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2

Missing required properties. Start from new bindings or example-schema.

> +
> +additionalProperties: false

Missing example, it's necessary to validate these.

Best regards,
Krzysztof

