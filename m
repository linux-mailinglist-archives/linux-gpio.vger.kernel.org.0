Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421636E6A9C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Apr 2023 19:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjDRRKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Apr 2023 13:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjDRRKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Apr 2023 13:10:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6A82125
        for <linux-gpio@vger.kernel.org>; Tue, 18 Apr 2023 10:10:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id q23so65564906ejz.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Apr 2023 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681837810; x=1684429810;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WHlqIBM+MCUF6hZ83TONgjkCjEOxfdRoRjzJHTAirE=;
        b=IiitgDIk9VE8JzLsktssHGI0FW2etCrF6Wg7u2A2flpDQCDbDQyzY8jZGt3Zp3asGC
         O6/94VNsfP9I1oUzxU4STP2R+/WnlEErhhpbJpvt9MqQf/4wq2F9swlKk2R84FmVBbhg
         DCtFjngcc8O4/vht+yYOSceeC0YZBGAHVTq8pm2pqwlxEdOMoPdKIpgTwmz9EC1hw27/
         +0hcCRfeb3XW+sz+aon1fjKDaTsUvNZYrXhkJElu4Rt8NMvLPtfNI3EldH5XJ0lzfC19
         P4wwd5uyZrxa8qJ9TfiqdRuy6vsDmf+U4Ju6OwzKwJXdGAdeND1My9Qg/A0dCpklbUB/
         oalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681837810; x=1684429810;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WHlqIBM+MCUF6hZ83TONgjkCjEOxfdRoRjzJHTAirE=;
        b=dMYglHoqCm0DARbvm2qLz9gdZYwuyUpuvYkOgCM7acbFPoiR4XKOZ8IoNsWY8rhPes
         X2qV5spwOm7/Tgz1u1pqU1EUqISW9PPGrb+LBfDZGGqZPcSUtTooCHvC2Inlx7ykWUh3
         1uoiftKbO9Ouje6d3BU4CD076y2x/brraP6x+0dltq6C6OPPv6kjfToRhmqeNuPCpeh7
         b4QIRveBEX0ljxpS7kI+fyCpMt7hAwqXlsG7/Oyr7TN6cyX4YGIrrLYV50k/S+bk1UUB
         hyPdrO2E9xH+Nbj37G+kCExIQCs2eW8O3PG5s4W4Ql9yVkPRLWjrpcolp8bZgqlhN/3R
         Na5Q==
X-Gm-Message-State: AAQBX9dofAoeUme23AIVI5Lol0WQxFYw7mnZ9qK2dwOJG1FCLjbMksqt
        TcKm4SIPCNaFB2rxpA9ppcX+pg==
X-Google-Smtp-Source: AKy350Z+V33GqZk1LMN4KjbXN+KpaCPlxtuNlAz3iwywFv/cQjcLqJa8BsHzHSvDzhIEVubog9OKjw==
X-Received: by 2002:a17:906:80d4:b0:94f:247d:44d2 with SMTP id a20-20020a17090680d400b0094f247d44d2mr10380121ejx.5.1681837809689;
        Tue, 18 Apr 2023 10:10:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id fy1-20020a170906b7c100b0094e4b8816e0sm8207409ejb.217.2023.04.18.10.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 10:10:09 -0700 (PDT)
Message-ID: <b1594fda-1fe4-5609-8db3-3f2edf3380d6@linaro.org>
Date:   Tue, 18 Apr 2023 19:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 6/9] dt-bindings: hwmon: Add HPE GXP PSU Support
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, linux@armlinux.org.uk,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230418152824.110823-1-nick.hawkins@hpe.com>
 <20230418152824.110823-7-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418152824.110823-7-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/04/2023 17:28, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Provide i2c register information and CPLD register information to the
> driver.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  .../bindings/hwmon/hpe,gxp-psu.yaml           | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/hpe,gxp-psu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/hpe,gxp-psu.yaml b/Documentation/devicetree/bindings/hwmon/hpe,gxp-psu.yaml
> new file mode 100644
> index 000000000000..60ca0f6ace46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/hpe,gxp-psu.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/hpe,gxp-psu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP psu controller
> +
> +maintainers:
> +  - Nicholas Hawkins <nick.hawkins@hpe.com>
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-psu

Missing blank line.

> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1

All your bindings are written with different style... reg is second in
your previous patchset, so what order did you choose here?


> +
> +  hpe,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the global status registers shared between each psu
> +      controller instance.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Drop blank line.

> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        psu@48 {
> +            compatible = "hpe,gxp-psu";
> +            reg = <0x48>;

Add also interrupts.

Best regards,
Krzysztof

