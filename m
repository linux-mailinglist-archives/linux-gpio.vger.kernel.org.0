Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 809345F8C14
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Oct 2022 17:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiJIPkd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Oct 2022 11:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiJIPkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Oct 2022 11:40:32 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650CB21260
        for <linux-gpio@vger.kernel.org>; Sun,  9 Oct 2022 08:40:31 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id o67so5503742qvo.13
        for <linux-gpio@vger.kernel.org>; Sun, 09 Oct 2022 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i53gbhv2Py9723OMm2TpOm71WJz6X/131K5vEVgyCRo=;
        b=sXJFgbsXyCrkAe62qzy7g0l+9V8tLCCRplUrKpA539fiEBV351B3MXmQyslTZG4AKY
         gff7ctJlgzzK+lDXCfqranl00JVJM86Lq9Mj21N0keWMXnm2LhH3A0gOTf1TTWD/Qxan
         +AZQByCtMvlFro/niZ6MguunOMxyKNgNMfbYJ5qUNmeSH7KFgoOHfyjG/7iTZlJGW53y
         0HQMDzvhMtEKAVFbB8PrJg/34UxnX6ANINNGdFYH2PX5tgggAxC8RwFZAhbFYSJ0wvRo
         dvUkeg0zxoqGpqFbmX1Wqry6pkgDXQB6Vao+7u3nupRU+5Pl9ImYY/y1TEDu4Ekv65bT
         t59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i53gbhv2Py9723OMm2TpOm71WJz6X/131K5vEVgyCRo=;
        b=OUjYxKh3kvinCRt75FiK86n0hEMQUKuwklETZxTzbz5cGZjtWrPoP8H6XkBdZY5B0C
         RKZmiAFy6z1nXrxOm5a9IeSYbeIIOGhbX2wQN6/4yejuDanfu0tSBAkeDFhUlVbIjURZ
         RrWbGyxnIWLhpmR0jELYO9ZDkx9mDk/0dnp1hT0Ura1XToUUOMu83zJeLzs/jEMqR9cE
         7SVkGM2ea8Vi/dpO7/guZZSC5Wn4RvWk6faaTjiZ3Z21I4zQ5hsqMceRbanro3PhPlkA
         bLOPkyy+hMs/4CuQTQbgVc/yvZUKHKmkmstzr5dNQ3qTCAG5ZZ+/gjGD3gNGcNAMgyPU
         UvIQ==
X-Gm-Message-State: ACrzQf3YXDD5KVygX4/qNQpaV5Nz9OBmcb6NHR+/tW6pRAUE1hEhu7Y4
        MA5inSu7r1AQS9qZGMo+WPhaNQ==
X-Google-Smtp-Source: AMsMyM46vVDS5B6aWTcE5KU2g7jxVZfWoZ1KNJyjP6dIkojBpxSuqMXtMbuPYcs+g54CiMYlQmM8PA==
X-Received: by 2002:a05:6214:2402:b0:4b1:85ab:489f with SMTP id fv2-20020a056214240200b004b185ab489fmr11559791qvb.108.1665330030573;
        Sun, 09 Oct 2022 08:40:30 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id t21-20020a05620a451500b006b60d5a7205sm8158288qkp.51.2022.10.09.08.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:40:29 -0700 (PDT)
Message-ID: <23c7afea-5c83-70b6-c5cb-e101e416086d@linaro.org>
Date:   Sun, 9 Oct 2022 17:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RESEND PATCH v16 mfd 7/8] dt-bindings: mfd: ocelot: add bindings
 for VSC7512
Content-Language: en-US
To:     Colin Foster <colin.foster@in-advantage.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Terry Bowman <terry.bowman@amd.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        UNGLinuxDriver@microchip.com,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        katie.morris@in-advantage.com, Rob Herring <robh@kernel.org>
References: <20220905162132.2943088-1-colin.foster@in-advantage.com>
 <20220905162132.2943088-8-colin.foster@in-advantage.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220905162132.2943088-8-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/09/2022 18:21, Colin Foster wrote:
> Add devicetree bindings for SPI-controlled Ocelot chips, specifically the
> VSC7512.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> 
> (No changes since v14)
> 
> v14
>     * Add Vladimir Reviewed tag
> 
> ---
>  .../devicetree/bindings/mfd/mscc,ocelot.yaml  | 160 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
> new file mode 100644
> index 000000000000..8bf45a5673a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mscc,ocelot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ocelot Externally-Controlled Ethernet Switch
> +
> +maintainers:
> +  - Colin Foster <colin.foster@in-advantage.com>
> +
> +description: |
> +  The Ocelot ethernet switch family contains chips that have an internal CPU
> +  (VSC7513, VSC7514) and chips that don't (VSC7511, VSC7512). All switches have
> +  the option to be controlled externally, which is the purpose of this driver.

"Driver" as in Linux driver? If so, drop it.

Best regards,
Krzysztof

