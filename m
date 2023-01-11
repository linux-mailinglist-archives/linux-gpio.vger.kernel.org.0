Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C7B666077
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 17:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjAKQaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 11:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238996AbjAKQ3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 11:29:32 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8D31120
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 08:28:14 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so13117177wms.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7CWF9KkUKbOJvIgyBGuBX3AgumkGtq/yuQpNawXVGo=;
        b=QG/1xRDc2gvPUcV3qYyLpo9U1+DrMtmYMCpfUHY3aBxCA/zvDPrypygAq50eRHghxJ
         VMQZMBAirs1WNJzVVb5Z2Cr9RIBnVWz/mxGftXpw0Vl5NqIg/1370zLOgEEStiNr9L8n
         6u97vE0rrLrlha03SYeQIX+8vZD2HXqxn2I6ogvtXhMWZ0MD3iV9VAa/QA1qSafYq10g
         /Dv0x3t+uUCvWLa3esZKGcAoUI+MRcKPyf+GgWtlOiYECKsOOcVajufpcYZI4oa6IFCo
         9iMsozsf8EujJzSufGogv/LJdpQ9o8xZZwozSz9oZSGHTiz2dEmesqr5B2O9Lk/fQEck
         r8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7CWF9KkUKbOJvIgyBGuBX3AgumkGtq/yuQpNawXVGo=;
        b=lr9UGl/SnEKy4imHCyGC4ErT0/e0KyFEtfXAAff6Anl7gx9dlRpKAKjLD6dRWMhR/+
         FPs4WWaQ1SbDYr+zantV7U9DUfZg82c0kCSvNTqj7RcrJBVXjl2+mYYxkOb2UYpaa8MJ
         e1v9N8MuFX0apB7D34r2I1BHqdDSsLievtbHlNk4unPa2g+matMMKtbxKPe9tim75aPe
         pPMZed0IZF0ohoJNxX+HKbUyTiJZmXEhetwiLNnLuSExmZi40Ly8qJ63YRgIxm1BRab+
         8D2g/GeriMNVVzo+YL/yPWRhmEJQtzBQPl7gQsFPjUtyK1m0+53OIc8OPMRTgbhkLKvf
         St5A==
X-Gm-Message-State: AFqh2krbMH+EWjWMepk4JhWj44g1m3oO9Q54Mr9it3yC4HWEZHQlqg1k
        gmLUKxyVkOktEJF+G62XMIiTKg==
X-Google-Smtp-Source: AMrXdXsJO0FKX4wDji1FsHRVmHI5Sp0+ktkb3opEqy9j/XqlcQpG//WN65wKFYu7H+P8NXUVJtGUQg==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id ay9-20020a05600c1e0900b003cfb73fbf8fmr51982781wmb.7.1673454493504;
        Wed, 11 Jan 2023 08:28:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003a6125562e1sm20455115wmq.46.2023.01.11.08.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:28:13 -0800 (PST)
Message-ID: <c4497bde-c1e0-1efc-7a46-233495f7760b@linaro.org>
Date:   Wed, 11 Jan 2023 17:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
 <20230111134905.248305-2-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111134905.248305-2-herve.codina@bootlin.com>
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

On 11/01/2023 14:49, Herve Codina wrote:
> The Renesas IDT821034 codec is a quad PCM codec with
> programmable gain.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/renesas,idt821034.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> new file mode 100644
> index 000000000000..2c29b770e3f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,idt821034.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas IDT821034 codec device
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The IDT821034 codec is a four channel PCM codec with onchip filters and
> +  programmable gain setting.
> +
> +  The time-slots used by the codec must be set and so, the properties
> +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
> +  sub-nodes that involve the codec. The codec uses one 8bit time-slot per
> +  channel.
> +  'dai-tdm-tdm-slot-with' must be set to 8.
> +
> +  The IDT821034 codec also supports 5 gpios (SLIC signals) per channel.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: /schemas/gpio/gpio.yaml#

This one is never needed. Drop.

> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,idt821034
> +
> +  reg:
> +    description:
> +      SPI device address.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 8192000
> +
> +  spi-cpha: true
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - '#sound-dai-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false

This should be rather unevaluatedProperties: false, so other properties
from spi-props and dai-common will work.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec: idt821034@0 {

Node names should be generic, so "audio-codec"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "renesas,idt821034";
> +            reg = <0>;
> +            spi-max-frequency = <8192000>;
> +            spi-cpha;
> +            #sound-dai-cells = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +        };
> +    };
> +    sound {
> +        compatible = "simple-audio-card";

Drop sound{} node. Not relevant to the case here and it's the same in
every case of audio codec... unless something here is specific. But even
the dai-tdm properties are sound card specific.


Best regards,
Krzysztof

