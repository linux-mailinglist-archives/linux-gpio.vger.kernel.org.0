Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1411A6FA34F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 11:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbjEHJal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 05:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEHJak (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 05:30:40 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08B06E8D
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 02:30:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965fc25f009so479433266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683538237; x=1686130237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fe1Pd9sqJ/vND699Tq/zXfEZYs/5kGN53Nyynpo4z7s=;
        b=SQrxupFKOW8vs3iF6YW1jKxTlOwH5mBVHe3a2qKqaOAE+jR3jllqcDNsnbF+jvlOA7
         xjhKg/64/p42mS1+pEVCVYkikWjfLeKmSO5HxnAjRIlxeutYyg/gRdFvQ+cAD8LE9leK
         EJ/VevIomlmsj+U+XgxJT8klp7fH9w3hA6Tbvdqve945fTc2ozQGs0GL10+3dTFdhqj7
         bYQmb54Kce9sBzfjMoCiSlbg3RzcFYm5pxWrDtMAPphjvxcrMXbnIg84FzT/Z9KD3uRH
         nKq3qW+1Nd9JV3jmbV5ljYhUh67eXibOJnTcGvxrlHk7oSK00F8SNMdiwCl6mMSzJ6dd
         LhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683538237; x=1686130237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe1Pd9sqJ/vND699Tq/zXfEZYs/5kGN53Nyynpo4z7s=;
        b=Ajvavkh4eBTiB41PMfAESnwSqsxf/kXGm5Nhp7vNdpA90cI2tqv0ObyG0hlp2TvUa7
         51iLqXvcTGk9ieM8yuPZ4QQ0vSS8ZkkEjpQbW5zosgqPpu6+HVWXsng9IQOAMcEV2vzB
         wn027GXyPbi39PBD0hV68x7CGmKoyPAiXq+vmAjTnV1486ozV1dPnUnwyn8JxbedqQF5
         KmCAoCQyh0S+t4HHSFhZsBI1K+4n/Fv4Y50HqUK0O6lqvVi5d4zsqjHRJyCZU2GV3OFp
         BOSPesJLZCaA53KPq+POeICdvhlRBl+1Xqc1vljJRs9cWedtWXyZ+osO/WL9MXRFCLLj
         hqTw==
X-Gm-Message-State: AC+VfDylWXfaEeMV6DE2bFsjFBzoU3c/FaMsdZYjtLW0uFuMmz9jg+Nu
        UkxJQY9HmqoLPp1R+NtsZFcRRA==
X-Google-Smtp-Source: ACHHUZ4k6iOdwZ5Fs5mYEyfbwG8X3cDDVJmdFPdXB92C/JPuXK9AY6MOc4IE+C3wosHFxfXMTx/m3A==
X-Received: by 2002:a17:907:7f14:b0:94f:9acc:65c9 with SMTP id qf20-20020a1709077f1400b0094f9acc65c9mr8390341ejc.66.1683538237347;
        Mon, 08 May 2023 02:30:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709070b0d00b0094efdfe60dcsm4642563ejl.206.2023.05.08.02.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:30:36 -0700 (PDT)
Message-ID: <2f45fa08-202b-4eb8-b204-d0466df1d033@linaro.org>
Date:   Mon, 8 May 2023 11:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML DT schema
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
 <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/05/2023 23:19, Linus Walleij wrote:
> This adds a schema for the STMPE GPIO that while it is used a
> lot in the kernel tree is anyway missing its bindings.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Use a compact hog node schema backed by the standard hog
>   schema.
> ChangeLog v1->v2:
> - New patch split off from the MFD patch.
> ---
>  .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

This should be a conversion of
Documentation/devicetree/bindings/gpio/gpio-stmpe.txt:
1. Expressed in subject, commit msg,
2. With changes against original binding mentioned in commit msg,
3. With removal of old file.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> new file mode 100644
> index 000000000000..41aa82b8b3eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectonics Port Expander (STMPE) GPIO Block
> +
> +description: STMicroelectronics Port Expander (STMPE) is a series of slow

If there is resend/new version, put blank line after description:

> +  bus controllers for various expanded peripherals such as GPIO, keypad,
> +  touchscreen, ADC, PWM or rotator. It can contain one or several different
> +  peripherals connected to SPI or I2C. These bindings pertain to the
> +  GPIO portions of these expanders.
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: st,stmpe-gpio
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  st,norequest-mask:
> +    description: A bitmask of GPIO lines that cannot be requested because for
> +      for example not being connected to anything on the system

Here as well.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
Best regards,
Krzysztof

