Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A3B5F628C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 10:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiJFIYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 04:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiJFIYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 04:24:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7E0925B7
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 01:23:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x40so1343911ljq.9
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h7Kd/pB9SOWaC27DON9TzRwx54nr/iBbnVwruHWBbBw=;
        b=Eu+WWa0DBMnVDkDrJyPH+8LKrT9A53gyPTYJrXRk7NjqQDeCPnpapdKYTWujKPmpEu
         y4h1UYK3D8DKDhnsO3eBfhmrajdwfV5IiiaJwfALhGdVC1xbC5+NfiEw8XyWqn0RVu4y
         OQ0IQt2CTOP0NP4gCGWyzcP+VZPHgy0244ookz21ahYbLJLwJHChqSUOyLZah/8IvERR
         8EfBn7G/lgujAKpirAKGCCr3fkoUSqF48htOcoD3hoUQ+vuEeZIObykm0NGWA4HvKIg0
         +tTBb03wKkJxQ9aL5APQ3lBsMDscpE3UoLmJKlmgUlmgkOgY8VoxmWnlvG/CKpbazIv/
         m65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h7Kd/pB9SOWaC27DON9TzRwx54nr/iBbnVwruHWBbBw=;
        b=Ofir54N6jvJl3x0mTz1eaZ64/IMRASJH8w7hD4MA8OjS91TEu6SbEwu5v73i6+qplf
         3U9JxXdZjC0Zhrq6XNkLIe9cfcwFylmg2NOb8D6q2OHSu/qzONQDlNzqvQzxhnkGkJGI
         gD8JLxpq2dwovpcvZLx2zWqHpt3pEEkwFGy6oVsDFueJuF+zp32QUJP+G8E0gd+/Mifu
         dOzOyKNnAgiTHQ9ezwZWOmvEw50FSIaBoQ2ZHpxbwgFjhofitUd4V5hbc34DW4+1Z43O
         8GQX/fZGcqdtBUVznPWkE1sg1sVzkuMuQ4awwBQar3HX9nbXqhLvQ5NMxCL2idF2+Wic
         goMg==
X-Gm-Message-State: ACrzQf1zm++EPeL/7ZHWCW8/qmzEbzyJbz9e3GiYi0VI5FUAbvQj9A9+
        zy4/3YkyxvariOnzJ/qxfZeolA==
X-Google-Smtp-Source: AMsMyM7ZaARzFHd7DjvycsbDPy6i/mAnNxF/HIIBqSzjZ4z9oHgSIDRQCEjl6Y7dTKD2l/biIXfLKw==
X-Received: by 2002:a05:651c:244:b0:26d:e2af:db15 with SMTP id x4-20020a05651c024400b0026de2afdb15mr1373903ljn.271.1665044631001;
        Thu, 06 Oct 2022 01:23:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512318800b0049ebc44994fsm2623002lfe.128.2022.10.06.01.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:23:50 -0700 (PDT)
Message-ID: <959a45b0-b4bb-98df-20be-707aa0d26700@linaro.org>
Date:   Thu, 6 Oct 2022 10:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFCv2 PATCH 3/4] dt-bindings: gpio: add Wiegand GPIO driver dt
 documentation
Content-Language: en-US
To:     =?UTF-8?Q?Martin_Za=c5=a5ovi=c4=8d?= <m.zatovic1@gmail.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        gregkh@linuxfoundation.org, jeffrey.l.hugo@gmail.com,
        andersson@kernel.org, Michael.Srba@seznam.cz, saravanak@google.com,
        mani@kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20221005145746.172138-1-m.zatovic1@gmail.com>
 <20221005145746.172138-3-m.zatovic1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005145746.172138-3-m.zatovic1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2022 16:57, Martin Zaťovič wrote:
> The Wiegand GPIO driver uses two GPIO lines to transmit data -
> data-hi and data-lo. These lines need to be defined in the
> devicetree, otherwise the driver will not probe successfully.
> 
> Signed-off-by: Martin Zaťovič <m.zatovic1@gmail.com>
> ---
>  .../bindings/gpio/gpio-wiegand.yaml           | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-wiegand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-wiegand.yaml b/Documentation/devicetree/bindings/gpio/gpio-wiegand.yaml
> new file mode 100644
> index 000000000000..3b235667ae17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-wiegand.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-wiegand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wiegand GPIO controller
> +
> +description: |
> +  Wiegand GPIO controller running under Wiegand bus.

GPIO controllers need "gpio-controller" property, so this seems to be
something else.

> +
> +maintainers:
> +  - Martin Zaťovič <m.zatovic1@gmail.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^wiegand-gpio@[0-9a-f]+$"

No need to enforce node name, unless this is for a class of devices. But
then why "gpio" not just "wiegand"?

> +
> +  compatible:
> +    const: wiegand,wiegand-gpio
> +
> +  data-hi-gpios:
> +    description: GPIO spec for data-hi line to use
> +    maxItems: 1
> +
> +  data-lo-gpios:
> +    description: GPIO spec for data-lo line to use
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - data-hi-gpios
> +  - data-lo-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    wiegand {
> +        compatible = "wiegand";
> +
> +        wiegand-gpio {

I have troubles understanding this. The "wiegand" node is the bus,
right? Then what is "wiegand-gpio"? GPIO controller? Then why it is not
marked as GPIO controller? What GPIOs does it control?

> +            compatible = "wiegand,wiegand-gpio";
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_uart2_wiegand>;
> +            data-hi-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +            data-lo-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

Aren't these properties of the bus, not the device?

> +        };
> +    };
> +
> +...

Best regards,
Krzysztof

