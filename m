Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A789D68619A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 09:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjBAI1M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 03:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbjBAI1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 03:27:11 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830DA5EFA1
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 00:27:09 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id l8so12035726wms.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 00:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcqaKTvkrWswwNjAisVqJkEic8s+QfkjvGkfxYTZrLU=;
        b=mNicKAAddL8Ncg85u3jIb8XXSMga5R11jorShMeXovaTkQ4JfSvd8c35ZF4FQNTI7C
         +V/B7cMNqbCz9gW1jUkmQkY9Q7j+VJncOWsGBorVEY3a/P8HHmIT0RzLsU+4jfwQ/EWj
         UCPSuloe62QIvEaPfWJ8gNCgOc2bUgLy/Lea6KeCeD17/GXte2sUvG0+ZRgddQiAJ1ct
         PF0DAYsMIkj98hgYt5y/3lEU9Ohp+k77blko2LhtAt7JUX8WmT5TVgMLzyxTfUCv/dTo
         7j1M4s579/dukoXc4aD5kReudIxbaQIkRW0JaA2r8tS/X4mleNVz+s5jWPeQeDvFr0Pz
         o9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcqaKTvkrWswwNjAisVqJkEic8s+QfkjvGkfxYTZrLU=;
        b=KhPWmcawyQAmTUQCQSdXVbiy8H/a/u+OXbE7WJlIu7DeVVQFzB9sYfHoFVOW+sZxEv
         Sh+L6a90Z50mzj4fXUSGxYl2gCAcmUPv4E7ArsXZo7Mj6MGWAg6AVkkoaZ2tw9plPg4V
         mcj+gCTFRaeJX8g2gAS0i8YcH+tEqPqSKKLU75ihV0hKTaPADIH2TIMuv7T5c4mi6RNW
         DGZNTMYwCVP8hlqJHUdUOQqqrpjKqykhoLZZhLTHRuh+cEWR8nY2v+VRrEtjeiy/Op52
         1i+P2BE9mlrwutJpBO03XaERAMF4+vBeOCfKuqViJI1MKMxGwfZC3pXDgUiWbMVk/qhD
         zrsA==
X-Gm-Message-State: AO0yUKX0nuItx4LKmWOPRBcI7+HB8nHax6M06uA7F9EPBbb/+tC4aAQR
        J1wfJ638b2nB1wh2Heg5Tq9YxA==
X-Google-Smtp-Source: AK7set+dt7bnRcY9++vYrESIwx1xJoUTy3pJRYjmCioerZ6qEc2wVMsL4gqxMLT9EvmGbC6R0X/TdA==
X-Received: by 2002:a05:600c:46c7:b0:3de:720c:10ff with SMTP id q7-20020a05600c46c700b003de720c10ffmr1127755wmo.40.1675240028047;
        Wed, 01 Feb 2023 00:27:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r38-20020a05600c322600b003dd7edcc960sm909468wmp.45.2023.02.01.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:27:07 -0800 (PST)
Message-ID: <4df3ec7a-e4af-89bc-9eda-21150395a935@linaro.org>
Date:   Wed, 1 Feb 2023 09:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: improve wb,mbl-gpio binding
 documentation.
Content-Language: en-US
To:     nl250060@ncr.com, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126-gpio-mmio-fix-v2-0-38397aace340@ncr.com>
 <20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/01/2023 14:49, Niall Leonard via B4 Submission Endpoint wrote:
> From: Niall Leonard <nl250060@ncr.com>
> 
> Convert existing wd,mbl-gpio binding documentation to YAML and add
> new optional propery "no-input".

Subject: drop full stop

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Subject: improve is vague. Instead: convert to DT schema


> 
> Signed-off-by: Niall Leonard <nl250060@ncr.com>
> ---
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt       | 38 -----------
>  .../devicetree/bindings/gpio/wd,mbl-gpio.yaml      | 78 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> deleted file mode 100644
> index 038c3a6a1f4d..000000000000
> --- a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
> -
> -The Western Digital MyBook Live has two memory-mapped GPIO controllers.
> -Both GPIO controller only have a single 8-bit data register, where GPIO
> -state can be read and/or written.
> -
> -Required properties:
> -	- compatible: should be "wd,mbl-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: GPIOs are read-only.
> -
> -Examples:
> -	gpio0: gpio0@e0000000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0000000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	gpio1: gpio1@e0100000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0100000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		no-output;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.yaml b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.yaml
> new file mode 100644
> index 000000000000..d1c72a42c5bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/wd,mbl-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Western Digital's MyBook Live memory-mapped GPIO controllers.

Drop full stop.

> +
> +maintainers:
> +  - Niall Leonard <nl250060@ncr.com>
> +
> +description: |+
> +  Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.

Drop "Bindings for". Actually drop entire line - it's redundant, you
repeat the title.

> +
> +  The Western Digital MyBook Live has two memory-mapped GPIO controllers.
> +  Both GPIO controller only have a single 8-bit data register, where GPIO
> +  state can be read and/or written.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - wd,mbl-gpio
> +
> +  reg-names:
> +    items:
> +      - const: dat
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  no-output:
> +    description: GPIOs are read-only.
> +
> +  no-input:
> +    description: GPIOs are write-only.


Split adding new property into separate patch. Each patch should do one
logical change. New feature is another logical change. Conversion is
that logical change (with any fixes needed for successful conversion,
but not with new features).


> +
> +required:
> +  - compatible
> +  - reg-names
> +  - reg
> +  - '#gpio-cells'

Use consistent quotes - either ' or "

> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio0@e0000000 {

gpio@

(0 is not correct name of node)

> +        compatible = "wd,mbl-gpio";
> +        reg-names = "dat";
> +        reg = <0xe0000000 0x1>;
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +    };
> +
> +    gpio1: gpio1@e0100000 {

gpio@

> +        compatible = "wd,mbl-gpio";
> +        reg-names = "dat";
> +        reg = <0xe0100000 0x1>;
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +        no-output;
> +    };
> +

Drop all examples below, they are not needed. Actually even these two
above could be combined as they differ with only one property.

Best regards,
Krzysztof

