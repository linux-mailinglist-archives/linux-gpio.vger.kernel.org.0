Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D27D4D5E66
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 10:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347451AbiCKJ0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 04:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347446AbiCKJ0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 04:26:41 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15EC118605
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 01:25:38 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 33A023F1E5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646990734;
        bh=D1XtJyL/qqPN2xLVrq6WSrUWrKPZ0qDx4WjygrxcxL4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MWi8bO+EMw9545+2buiID51o0JJ/VUKhsxW4TFk039+JvZgrfYeyY5E1nkTqmLSEx
         yKEcL3SMBYAhfTRA9g0niz3okPC+qg6CavJroFdCGCs9Wo5rgUWqdF0ln64J6F+3gI
         utligUyJwoZs+dzURHm9tjv3Bi02WS2XObbaEVeo64ScJJVFVOgUTXDDg6OsOphZji
         oUKVya7l3hPolUD+3bW8rnzSudSSnaBnF9cliRXY2nStgrOEMW+iF70VLmXCcVKbQB
         5eR24BV+r23hLu2DF+nB+X01xQXNYzaiIDL+DvmIJyrzPTw89yLe1iEa318656tI7U
         IjQEU9g+JugXg==
Received: by mail-ej1-f71.google.com with SMTP id hx13-20020a170906846d00b006db02e1a307so4636640ejc.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 01:25:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D1XtJyL/qqPN2xLVrq6WSrUWrKPZ0qDx4WjygrxcxL4=;
        b=c9GTJuSXTcxzR4rcg346AdvMlp6qavZCl/bn3Cs8gI6/HMKWecLQHWu14ndy96hJcq
         8RLD+9AMt7+TgMHBM0xGEFirCO2OvQgg9hqR/Ld2B6pceuFFDjfZr6fibw7UqppIGuZV
         o/0CyAwQCv5JCM3eF3U6pehiEhiU6lk0JdVt/ximtxwLxwzwebXU+LuGVgqLARC52m/L
         lRoXXBfG6Jx95W8pXvtHrx2ira+tXmxy6+OUjppjrB1KzWtxHyiSy1L+cpLqMQsigghz
         5R5H0Wp6u504bWouUVllHUM3vtcXZiIsItJj0wui0b6bvTDdHsEBLWgVeTNswhD1IstI
         n12w==
X-Gm-Message-State: AOAM533fMuw6SjmItv2WzmHACwbI2eJSpXoNztb+xz5JzyQk/fOvkH5w
        to5weySWaxA0CGyA1S1CU+QQwM/F+7VxZRQIpXUglhrYtOX97oldBoL9El7YcGamGxv7qCjOqIu
        L64xL8v11KyIzTFCJfP7K181ZRFW0ZnAjpq3Q8Ho=
X-Received: by 2002:aa7:c54b:0:b0:415:c714:7a1f with SMTP id s11-20020aa7c54b000000b00415c7147a1fmr7914979edr.385.1646990733006;
        Fri, 11 Mar 2022 01:25:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHiW2gWM85UR5m9XbGbjsYu5M4yHXr5ZVuoNQ8b/CLVDoNmQC144ImvZc/fVRESprMrS3lzg==
X-Received: by 2002:aa7:c54b:0:b0:415:c714:7a1f with SMTP id s11-20020aa7c54b000000b00415c7147a1fmr7914962edr.385.1646990732722;
        Fri, 11 Mar 2022 01:25:32 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id m13-20020a056402510d00b00416ca731b5fsm986108edd.9.2022.03.11.01.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:25:31 -0800 (PST)
Message-ID: <49b19cf0-a4aa-69c3-a609-422a8b3f9798@canonical.com>
Date:   Fri, 11 Mar 2022 10:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/3] dt-bindings: support Nuvoton sgpio
Content-Language: en-US
To:     jimliu2 <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
        KWLIU@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        robh+dt@kernel.org, avifishman70@gmail.com, tmaimon77@gmail.com,
        tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, CTCCHIEN@nuvoton.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
 <20220311060936.10663-3-JJLIU0@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311060936.10663-3-JJLIU0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/03/2022 07:09, jimliu2 wrote:
> Add nuvoton sgpio yaml in dt-bindings

Missing full stop.

Subject: missing prefix. Check git log history.

> 
> Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> new file mode 100644
> index 000000000000..8766e1fa4528
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton SGPIO controller
> +
> +maintainers:
> +  - Jim LIU <JJLIU0@nuvoton.com>
> +
> +description:
> +  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC,
> +  NPCM7xx/NPCM8xx have two sgpio module each module can support up
> +  to 64 output pins,and up to 64 input pin.
> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Directly connected to APB bus and its shift clock is from APB bus clock
> +    divided by a programmable value.
> +  - ngpios is number of nin_gpios GPIO lines and nout_gpios GPIO lines.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-sgpio
> +      - nuvoton,npcm845-sgpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  nin_gpios: true
> +
> +  nout_gpios: true

Both do not look like proper property. No description, no vendor prefix,
no type, wrong value (true).

> +
> +  bus-frequency: true

Why a GPIO controller needs this legacy bus-frequency property? Which
bus frequency is it? Internal? APB? If APB, use assigned-clocks.

> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - nin_gpios
> +  - nout_gpios
> +  - clocks
> +  - bus-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    sgpio1: sgpio@101000 {

Generic node name, so "gpio".

> +        compatible = "nuvoton,npcm750-sgpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +        reg = <0x101000 0x200>;

reg goes after compatible.

> +        clocks = <&clk NPCM7XX_CLK_APB3>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&iox1_pins>;
> +        nin_gpios = <64>;
> +        nout_gpios = <64>;
> +        bus-frequency = <16000000>;
> +    };


Best regards,
Krzysztof
