Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3589506B69
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 13:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351898AbiDSLw7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 07:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351972AbiDSLwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 07:52:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A602252C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 04:50:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v4so20891744edl.7
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+22hDYu2wEuHGd4AY54ocAOL5u0kABhClqX/TcY/LTY=;
        b=H3QC9C/R5KWMtDxmmpBzxTkk9M+RZW5ws2177KxkG0PkyXHubfD11/YNIFepjAaqQu
         9+5v0HiMVHwAEvOPUvTi9UDmYHW3xR73dcLKI5bdDYfJqzl4zX/rW3LjuPOdkv/IjfuW
         RO8C4nY2FIdSgWflqcH4AHm2ZTd0cC78GfBOPEuRQN6r6yC5UsouIiMGT/rG1KE8HLw0
         mHRLBtBEK+MC/KnFfs6MmL8kjPtnQxJXkQDeFoEWVzYW8BlzRZJ1NR8dHAaoMki7/Xgg
         Gng8p+TLfSD6TdDyiXnJu3BCw8+2dclVFf+tTe1WLjrGUfdAcWlBGdgPo4B3/JV26MSK
         Vnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+22hDYu2wEuHGd4AY54ocAOL5u0kABhClqX/TcY/LTY=;
        b=uO5MqdmhO+LvW7TI8WHJES6oTtDmJ8s5YFQrq9WGdr+tByrwU7R+u7YQKkAQKCrh52
         8/FSC72j+DQTd+lgmnvAtnc4BBqXbEljJpCvb+H1W3xWKb3aUT33+dlthYHc9v7Br/8S
         Xaeygeug9EcOBpkEVXVKAHEeIbfQ3t/HLiFeKamthusMLJV2xtvC5ThT4ARJ+pq273mD
         7uOe1XY6ca8iSqfvj+gvgMb9y/mZak1FaJEucpTqBICpnI9lECRCeBwPx7dweJlaA8TO
         vH8aULUWgy/BeCrhfDy7Dg0ulv7fia1L+IpOC3Pwg1AmVey3J5ICNNiIhwiml48+SnlQ
         FU3w==
X-Gm-Message-State: AOAM532US3LAfjUDa3aNmEH1cg6BKRAJFA9qdIQhjiZEDkGQsMaPezxR
        f7MBaNqZ+vN/Q42oXolQKgKktTKIo1mguA==
X-Google-Smtp-Source: ABdhPJyAypytXd6YzKO7SLGGgIe0gMwBMbxU3UaUCtlCeDPRJAXYOEuM+LrBoWoWZZbdZia5GX2REQ==
X-Received: by 2002:a05:6402:430c:b0:419:4660:e261 with SMTP id m12-20020a056402430c00b004194660e261mr16895758edc.324.1650369002202;
        Tue, 19 Apr 2022 04:50:02 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b006e834953b55sm5547719ejx.27.2022.04.19.04.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 04:50:01 -0700 (PDT)
Message-ID: <f6ea5c51-97dd-b225-3fb7-fcea5f722c39@linaro.org>
Date:   Tue, 19 Apr 2022 13:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-binding: Add cypress,cy8c95x0 binding
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220419071503.1596423-1-patrick.rudolph@9elements.com>
 <20220419071503.1596423-2-patrick.rudolph@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419071503.1596423-2-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/04/2022 09:15, Patrick Rudolph wrote:
> Added device tree binding documentation for
> Cypress CY8C95x0 I2C pin-controller.
> 

Thank you for your patch. There is something to discuss/improve.

(...)

> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      The first cell is the pin number and the second cell is used
> +      to specify optional parameters.
> +    const: 2
> +
> +  gpio-reserved-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the pin number and flags, as defined in
> +      include/dt-bindings/interrupt-controller/irq.h

Skip description, it's obvious.

> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 60
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 60
> +
> +  vdd-supply:
> +    description:
> +      Optional power supply.
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:

Why do you need oneOf here?

> +            - pattern: "^gp([0-7][0-7])$"
> +        minItems: 1
> +        maxItems: 60
> +
> +      function:
> +        enum: [ gpio, pwm ]
> +

No need for blank line. In other cases you put description before the
property constraints, so do it consistently here as well.

> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +      drive-push-pull: true
> +
> +      drive-open-drain: true
> +
> +      drive-open-source: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'

no allOf referencing pinctrl.yaml? Include it unless there is some
reason not to.

Best regards,
Krzysztof
