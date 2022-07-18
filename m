Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFA7578556
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 16:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiGRO1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 10:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbiGRO1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 10:27:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B757A1146F
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 07:27:13 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o7so19602241lfq.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7szMKoB+1l8P6x4W0Thx1sjinfdDfG1LQ+fBDOtwjms=;
        b=mCttHvZm0t/pgbDFqurRyuFNRUwoJoZoJB1WaKvCpA3hIIEvo4ibJjmd5OR+0ex7PU
         L9BfGChdNbv5m6Q6nAwI2MYp0rHF937G0iZO03zO0uTzjWpWmvzXbOz1X6ZvvQxgkmDQ
         ty0CkEi+4eRojY6oqk/O+mvkxTAXfcutQFF0TE1N/YJSkuA8Nf8NXy8RYYlJs4MfS3e3
         z0C8segewYgr/T6+dfWgacXyUpVvnUB7mx5ssYSIhNylvmDKyoLzMC1vvcMRqxw9M3pp
         BZwHP/9GJzVRpP4KY6/9sGqUMURVVnYwNDbLsJCx1OfncvGLhAY4sTj39IQn1l5nPRsn
         GGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7szMKoB+1l8P6x4W0Thx1sjinfdDfG1LQ+fBDOtwjms=;
        b=HvTzJQp1lQhYTyV6iqIqejff7aaw9IzDpHnBH888zeTk08/HraYMLh5cslXbcu37dA
         4tshB/Zm1Xp5X60lV9OUs3j8V0f6gH3+gaXjAkAtvJON9dEF7ITNYb8+f+NPFarMBdt0
         96KSUlhfw3/6D5tbidPdw5Atwf81YOhK3lzjgLFgp5RkiAQP7mEWbwk/ve5D7EBukz5D
         MXmBcMrPdiOZfUTLq+CEqLGg4n8qVfsXN3fVsXnU6JYokpX9PWfPfyrHmKnwNTn9w1Ib
         yT7COl4Qxrktuq2xtmuPKR/UKtVAsxrXKs2ZC22QT+1goOsXSBjVqhgG362m0BLm2EPO
         gyrA==
X-Gm-Message-State: AJIora94DAE0rC+lVQuPE+meZ5qaDDb+ECiXgg6Ob01Xe+KfMVSAz9YL
        jWstHbifs0u4iNkTSc1kAtEOVg==
X-Google-Smtp-Source: AGRyM1vlnLN6Wi63Bi3QU8Ld+M+Ob+/YIrcu+eYaAmqRKohzIsuVp4yYeCgJ6hVbu3COrCdX4CTEVg==
X-Received: by 2002:a05:6512:304a:b0:489:d7eb:82c7 with SMTP id b10-20020a056512304a00b00489d7eb82c7mr15625955lfb.314.1658154432074;
        Mon, 18 Jul 2022 07:27:12 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id z8-20020a0565120c0800b0047e789b9700sm2612607lfu.118.2022.07.18.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:27:11 -0700 (PDT)
Message-ID: <1c73fe9e-81f8-3ecd-edd1-60e6ddd548f3@linaro.org>
Date:   Mon, 18 Jul 2022 16:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/10] dt-bindings: input: adp5588-keys: add bindings
Content-Language: en-US
To:     =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220715125138.378632-1-nuno.sa@analog.com>
 <20220715125138.378632-6-nuno.sa@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715125138.378632-6-nuno.sa@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/07/2022 14:51, Nuno Sá wrote:
> Add device tree bindings for the adp5588-keys driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../bindings/input/adi,adp5588-keys.yaml      | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml

Thank you for your patch. There is something to discuss/improve.

> 
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> new file mode 100644
> index 000000000000..0d262b42150a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/adi,adp5588-keys.yaml#

Is ADP5588 a multi-function device? If not, I propose to drop the "keys"
suffix.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADP5588 Keypad Controller
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices Mobile I/O Expander and QWERTY Keypad Controller
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5588.pdf
> +
> +allOf:
> +  - $ref: matrix-keymap.yaml#
> +  - $ref: input.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adp5588
> +      - adi,adp5587

Bring some order, like alphabetical.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Supply Voltage Input
> +
> +  reset-gpios:
> +    description:
> +      If specified, it will be asserted during driver probe. As the line is
> +      active low, it should be marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller:
> +    description:
> +      This property applies if either keypad,num-rows lower than 8 or
> +      keypad,num-columns lower than 10.
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      This property applies if either keypad,num-rows lower than 8 or
> +      keypad,num-columns lower than 10.
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  adi,unlock-keys:
> +    description:
> +      Specifies a maximum of 2 keys that can be used to unlock the keypad.
> +      If this property is set, the keyboard will be locked and only unlocked
> +      after these keys are pressed. If only one key is set, a double click is
> +      needed to unlock the keypad.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2

What are the values/units? keycodes? If so, maybe "adi,unlock-keycodes"
and add limit on values (like linux,keycodes).

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - linux,keymap
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +          #address-cells = <1>;

Wrong indentation. 4 spaces for DTS example.

> +          #size-cells = <0>;
> +
> +          adp5588@34 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof
