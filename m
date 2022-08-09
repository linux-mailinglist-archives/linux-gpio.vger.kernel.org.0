Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77B958DB90
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244903AbiHIQFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 12:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244909AbiHIQFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 12:05:22 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DC721C
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 09:05:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d14so17584375lfl.13
        for <linux-gpio@vger.kernel.org>; Tue, 09 Aug 2022 09:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2sKCf9ZKSlcTNKeuU2aWfd4L6pnmOrDWUSqmI6fFKX8=;
        b=bTQjI2BHyw2f+Tnku7sYfkNWsLhWUrb44VDwgB+BLGNI+L2K7MhzxYXYcExLB8LR2W
         lBcnY+B8xdcIC2GlDgqEtA70+6ivW31GG3z3U/yxPcvXjmk4tshwbGM1MD+q4C3XD4w2
         cJpyZ2UyloQYQFVYqd5wXaHb4guR/GQhIc9XSQpAMtWB+V56HrS3h9jpq2BzVBKCvhax
         B/hywRWedBkgrCz5qByzVNK303fS0gEZyEMZEziKBThkt3BDiccZQbWM/E7U/wlCVfX3
         YvW0rIO2zq6XEmJblqR9X1U+uWwwazgZjjKkQFUiGb3VtmQXt16XgA7Q/E7WIiUlT8mr
         PX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2sKCf9ZKSlcTNKeuU2aWfd4L6pnmOrDWUSqmI6fFKX8=;
        b=zCqHPOQ1kYsl9hjUgldaF0swtn1p4FoCFlKrGAq4Cg+K2siqlBw7lJvjYi7QWsrm/P
         wZlS4nwH07NtUUq3Sj819Sw15gBCxTfG1it9MGDfxAErPcVkRATd0zLvZpM6U9zVJjhq
         SMAC/S7EoavxpY7apMmUe+x5e3u8zCKCw4j6UuO5KxVo1vtEgbQO+U4SKvxfwkhKWOrP
         wQqu/5FvPrBNnkfeSua8JWybLNGYFAv2XaM47JfCsTUb+f1R995dqiIu52Gj7sQkqjR1
         /NItHx6CiagZZKPYHlxoTJ2H2DOE10X97sx1qfpACQ6U9MnRzJ0NIYNwjQDaUYlXLdlv
         EJkg==
X-Gm-Message-State: ACgBeo0afv9Kl9zkGAl4+rsLYReu6P7qqOlJpsqy/98Ag8Swq/R6+V28
        6iifyBdgk75dbgvCsbPa2wyKEQ==
X-Google-Smtp-Source: AA6agR7/JH4Rl+hjT86FmJEOgCluUzJLkTTOJern+M60BdxIAadELBCCw7At3ldhoER0sG45xrRJ1g==
X-Received: by 2002:a05:6512:1043:b0:48b:2d4b:a13e with SMTP id c3-20020a056512104300b0048b2d4ba13emr7869247lfb.19.1660061118909;
        Tue, 09 Aug 2022 09:05:18 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id z16-20020a19f710000000b00485caa0f5dfsm22203lfe.44.2022.08.09.09.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 09:05:18 -0700 (PDT)
Message-ID: <5eb4d4a0-9895-dc0b-ba6a-ac435674892d@linaro.org>
Date:   Tue, 9 Aug 2022 19:05:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: Add imx-scu gpio driver
 bindings
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev
References: <20220809143105.17967-1-shenwei.wang@nxp.com>
 <20220809143105.17967-2-shenwei.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809143105.17967-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/08/2022 17:31, Shenwei Wang wrote:
> Add binding document for the imx-scu gpio driver.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/gpio/fsl,imx8-scu-gpio.yaml      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,imx8-scu-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,imx8-scu-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,imx8-scu-gpio.yaml
> new file mode 100644
> index 000000000000..4cbe3108a612
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx8-scu-gpio.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,imx8-scu-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO driver over IMX SCU firmware API
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description: |
> +  This module provides the standard interface to control the
> +  resource pins in SCU domain on i.MX8 platforms.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8-scu-gpio

This should be rather a specific imx8 chip. See other imx8 SCU bindings.
Strictly speaking there is no "imx8" SoC and compatible should be
derived from SoC.



Best regards,
Krzysztof
