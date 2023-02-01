Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E616864D8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 11:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjBAK4u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 05:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjBAK4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 05:56:49 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B54D5A815
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 02:56:48 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h12so16886465wrv.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 02:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl7xjwnlIFO9cTPnHakzqSLtSfVZPcvJWgfAb9UTMgg=;
        b=yMwEZzFJds1B31S8gN6Gtf3DXOsheuyX+qdKKzQ1XkldQSxHFEm+qWlYJCE95L51pm
         gmFplAF3bDfpnRBjiuWm7sxaIPnZNbkwY4FHvtv4KquGN8IuauXG1mTjvKXslADq7RQw
         X7EGQSFtfGh2vS9VVUcKMXowGNKmeQbwBymnOoPl0JB7DB/3CVhBYYdJ9KyVIYEjU1yi
         kW2WXgrylGrw4gWvwTBtJrYMFWa2aW3G9PgeRaIETAbdyNhZNnP2dp0sD158O3ieDN9V
         ZQV6FMqiMlKV3/IaU1Zms6aVa9y7DPuxEWuOGAiPmsikz3NJhHpZlQAPW6Tbf7WiNYzX
         nl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl7xjwnlIFO9cTPnHakzqSLtSfVZPcvJWgfAb9UTMgg=;
        b=yAiXPTEIkTEnGuonBNSeU+94JnMFA128vyrhV58TqrGlQ8pThWpBSgyBVV5Zlz9Ulc
         2pt/EGPUbUvVnn2biznRD2W8jraJgmQbzQenx3BAVZgEC+/KzQLmAPXht1mssQ/cunqi
         A/3aLQYX+tnk9Tr1jiUkgaQCCTMj0o7PL5EHW7biMb66pXWLRD3YlyY1a8Qm4UpMvb3K
         r02LuPGzs5j4WTCSDFnUnRy2/fbAn5MXID0cDDN0DY5okBDctO4SOAdxPzJ0kusRADpR
         4pVNn3J+E7EYOrel7b9HN8+9BlTtSXtTjsWtm14ocbJjROPpYxTsVETjrA4b+2HTq8Wf
         OE9Q==
X-Gm-Message-State: AO0yUKUcUYS2AVEDXSS/avNjzWHXORqZV17CMdii74dOhqvzBFk6aHsh
        Ng4eS+nCxEY6dXTkec4NIFweLg==
X-Google-Smtp-Source: AK7set+KPB702v3Zc0QEXCUeeDFVfwvU1Lo9YL4UGHj4SIr90S4Y+aj9ttU3Tq07PI/5GAwPH9ZT0w==
X-Received: by 2002:adf:fc88:0:b0:2bf:d137:9945 with SMTP id g8-20020adffc88000000b002bfd1379945mr1887395wrr.51.1675249006727;
        Wed, 01 Feb 2023 02:56:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bad9:621b:618e:38d6? ([2a01:e0a:982:cbb0:bad9:621b:618e:38d6])
        by smtp.gmail.com with ESMTPSA id v9-20020a056000144900b002c3b2afae00sm1870583wrx.41.2023.02.01.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:56:46 -0800 (PST)
Message-ID: <604029c8-3286-8514-ec35-6c5cb1b7a38a@linaro.org>
Date:   Wed, 1 Feb 2023 11:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Heiner,

On 30/01/2023 22:00, Heiner Kallweit wrote:
> Convert Amlogic Meson pinctrl binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>   .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
>   .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>   2 files changed, 122 insertions(+), 94 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 

<snip>

Please send new versions as separate threads, or keep the same thread structure othwerwise
it highly confuses humans & b4 when applying the patches...

Assuming new revision: v2 ([PATCH v2] dt-bindings: pwm: Convert Amlogic Meson PWM binding)
Assuming new revision: v4 ([PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding)
Assuming new revision: v5 ([PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding)
Assuming new revision: v6 ([PATCH v3] dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding)
Assuming new revision: v7 ([PATCH v2] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding)

Thanks,
Neil

