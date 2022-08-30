Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41655A5FDC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 11:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiH3Jxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 05:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiH3Jxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 05:53:43 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C7AC0B5D
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 02:53:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so10789352ljq.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WzU0qOlWug57JVpS5AGaeSKleZya1eqzbthcaN0TYiA=;
        b=d0anH1LiPZQubvfhzwbeIASyA2xV2YkOQAZSfpTuXafG+qc+CZZ56iYW5RAbSGfA/C
         ZfRm4ps3PTkNcBSFPkCoW+fUp/q4wt9cGkDSX1+glKepA74Ngu1jpdsQ+h50hc+unB0c
         Xe84Tse1xb3DdLrviuVd94At20gPbidV9eeKmAyWsj0fzkmju8MFMWSu0psn+zjdDBUh
         Apg+KOiv9cv4ZqsjMWqBCDGUqi0EOmPUoACncds8oBbKF91z3eJC09ngs+Ykp/PXxpli
         i3T4gtQCIhT90ioatqdfxp7Oj3wP4ePYUfwu+p1tdpgGEL0MGttaBBvNHhKS3J3laJzv
         Rf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=WzU0qOlWug57JVpS5AGaeSKleZya1eqzbthcaN0TYiA=;
        b=T19a1LHlTLB6EBSbHkK76Qv7NkUv1xed5jwui1UPF8J97hzMOZXIDv5JEZNnicuYby
         7eaedK30LGXagRYAjF7J51D8ubDwWH/f7kzav24BE277jnD4PxfLOEZkz01R/Uij7zwD
         /3RJ6f6LHXMQbHA8dTAVW8UQ5qGIDMfLt+EtCQwY+tM6lLX6+IgHpwX68OKMz4x2CpJ3
         gyVgPbRUPVdMw4MwajUrzmoajI77GuCzBNVoE8hqcpSGzG0PuOlQgLx5CBpiBfokPn5t
         WwArVByi3wv5tosOGDeP3xEcjrUum5m2NG5XiQJeoG7OAuJaKnCe8tSlTZAduFt3z5lq
         HZSw==
X-Gm-Message-State: ACgBeo3GsvJxiLhCQSQ5eW5dABTXjfrjHlk7KliCgjLwW5P/inMNsZDU
        sT3+qPORbHE8zT/3iSzeFAARmQ==
X-Google-Smtp-Source: AA6agR5ubGa3oiKwgsmb923gHZhlcPCP4QoyO+/v+uL7uPfay5OdunMd1GM8dDWvcBEC5Xcgh3VBpg==
X-Received: by 2002:a05:651c:2112:b0:261:b9c1:509 with SMTP id a18-20020a05651c211200b00261b9c10509mr7186701ljq.39.1661853220611;
        Tue, 30 Aug 2022 02:53:40 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id be19-20020a056512251300b00492edc64d08sm795273lfb.32.2022.08.30.02.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:53:40 -0700 (PDT)
Message-ID: <4001e0eb-f370-7bf4-89d0-ceed6d22e492@linaro.org>
Date:   Tue, 30 Aug 2022 12:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: k3: Introduce pinmux
 definitions for AM62A
Content-Language: en-US
To:     Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bryan Brattlof <bb@ti.com>
References: <20220829082200.241653-1-vigneshr@ti.com>
 <20220829082200.241653-3-vigneshr@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829082200.241653-3-vigneshr@ti.com>
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

On 29/08/2022 11:21, Vignesh Raghavendra wrote:
> Add pinctrl macros for AM62AX SoCs. These macro definitions are similar
> to that of previous platforms, but adding new definitions to avoid any
> naming confusions in the SoC dts files.
> 
> checkpatch insists the following error exists:
> ERROR: Macros with complex values should be enclosed in parentheses
> 
> However, we do not need parentheses enclosing the values for this
> macro as we do intend it to generate two separate values as has been
> done for other similar platforms.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  include/dt-bindings/pinctrl/k3.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
> index a5204ab91d3e..97cd2e39efa4 100644
> --- a/include/dt-bindings/pinctrl/k3.h
> +++ b/include/dt-bindings/pinctrl/k3.h
> @@ -44,4 +44,6 @@
>  #define AM62X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>  #define AM62X_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>  
> +#define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
> +#define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))

Alphabetical order, so maybe before AM642?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
