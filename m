Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6016D4492
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 14:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjDCMiN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 08:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjDCMiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 08:38:13 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8107F3586
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 05:38:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id ew6so116670017edb.7
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680525490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpyLniNan8kXaWmdK0bPB2p3FPHPkCqFQCXNF67g44w=;
        b=FpBaA6xbw0CpGMMiVJLqnlfsDevhHDaVIP+Bzng9cI/bE40CyZJI+ZxU882eMNS/b8
         9R/wd+LV9AJsUzDKy228ECHJJ0GT8Gvy7X5kAvttYpYtyad5FVR/EwMf4fJeiD9ZJow4
         vOP5DGfnfZrIcazDpDH08u//HXiaMU70H5tY+rfqwOCTkVJnXXTjwYugUTNztf4PHi2l
         85dPDwlyU7us7eYNoFtfogUlFAnlICMQo+e0PGrgHQUb7A8V9ziHgPvK/q+2np+lhJDR
         BPFRWT5Cb9jlFQ9kkejwJTgttSRbUfOyd9FDgW4/GVyUz9HOCAX28xuyWTUKuK+LSVKy
         VxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680525490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpyLniNan8kXaWmdK0bPB2p3FPHPkCqFQCXNF67g44w=;
        b=XmuCpkwfnINpYbI6nKYco5ftSUQaVG40VJY9UJNTcpAQX0kFS2u46pRE4vUBcKOIjk
         7q4lCXqUIA+6TCt7Jjna4q15lzKXkmSFasZhHdu68gnHd32IGk+UToc6k0Mh+VIrF+0b
         z1j++0+hDHCpHOBJ60niXR5DXzY+1tjJaF/Sgs1Tx0hLKfFFVbqqtkImN7IrKMX54i4W
         JhtlEqnoEM3XEr+1aQ+iwC0cIMProeuNcC46J2SmH3Vg2umXinOxf5SY27n8xqETvnSu
         BbzUbLB6wmgE46ZZEPnYR5xtms2wo+brc08e3dj1dNTifZOljQ92q1DzaQ2TuMxWLJvc
         v+JQ==
X-Gm-Message-State: AAQBX9czR0BrqUk5an8FGnL78ET6RBFyTg6HLAitsMlxR7SOElVDUsEI
        iD6nG+BTG1AX9GM1xfOUX00JVjbUqbnncvZDXzs=
X-Google-Smtp-Source: AKy350aPJ9GmzIXqmf5TkKiPoxebAeXc8qJaZQ0yylyUqd1bbN2VZH0uOeImlJ0Sy0ZPjkyWPYBRTg==
X-Received: by 2002:a17:906:d1cf:b0:8b1:7aaa:4c25 with SMTP id bs15-20020a170906d1cf00b008b17aaa4c25mr37745413ejb.29.1680525489952;
        Mon, 03 Apr 2023 05:38:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906328f00b0093e6f40d124sm4487670ejw.139.2023.04.03.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:38:09 -0700 (PDT)
Message-ID: <2beba334-1c5e-0f68-1d32-57006b4a3321@linaro.org>
Date:   Mon, 3 Apr 2023 14:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: max7317: add spi gpio extender
 documentation
Content-Language: en-US
To:     Edmund Berenson <edmund.berenson@emlix.com>
Cc:     Lukasz Zemla <Lukasz.Zemla@woodward.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230403114033.8336-1-edmund.berenson@emlix.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403114033.8336-1-edmund.berenson@emlix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/04/2023 13:40, Edmund Berenson wrote:
> Add driver documentation for the maxim max7317 spi
> gpio expander.

Subject: drop second/last, redundant "documentation". The "dt-bindings"
prefix is already stating that these are bindings and documentation.

> 
> Co-developed-by: Lukasz Zemla <Lukasz.Zemla@woodward.com>
> Signed-off-by: Lukasz Zemla <Lukasz.Zemla@woodward.com>
> Signed-off-by: Edmund Berenson <edmund.berenson@emlix.com>
> ---

This is v2, so where is the changelog? No cover letter, either.

>  .../bindings/gpio/gpio-max7317.yaml           | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max7317.yaml

Filename must be like compatible. "gpio" is not a vendor prefix.
maxim,max7317.yaml


> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-max7317.yaml b/Documentation/devicetree/bindings/gpio/gpio-max7317.yaml
> new file mode 100644
> index 000000000000..ad5a796c704e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-max7317.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-max7317.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX7317 SPI-Interfaced I/O Expander
> +
> +maintainers:
> +  - Edmund Berenson <edmund.berenson@emlix.com>
> +
> +description:
> +  Bindings for 10-Port Maxim MAX7317 SPI GPIO expanders.

Describe the hardware, not the "bindings". Drop "Bindings for".

> +
> +properties:
> +  compatible:
> +    const: maxim,max7317
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':

Use consistent quotes, either ' or ".

> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

Fix ordering. allOf goes either before properties or before
unevaluatedProps. See for example example-schema.

> +
> +examples:
> +  - |
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

Use 4 spaces for example indentation.

> +


Best regards,
Krzysztof

