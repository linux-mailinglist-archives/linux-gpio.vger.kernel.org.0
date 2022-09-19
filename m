Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3A35BCACB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 13:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiISLcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 07:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiISLcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 07:32:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BC127FD5
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 04:32:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i26so46415041lfp.11
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=f3dXWg0oh8xL1M1dPWVh4Ebk/AkdK0Pb6P7zeBhDtd8=;
        b=WNQozphNVQEppxOaUs5pFh0cbqStGednEszBlcHE4tVBgW8Fitzf6RfFqiVg9uSafn
         NHQBhxyRtXdXJ5Nmy0jbE9fCtb7RLeo6HjmJmcotg2syt95F765PD17poSOqlJ/+3/Pj
         3gNKTsPca1DH4ARuIs2M34Lo+TP20QTTV5I/A/p3ubbkNdvVvteVnomRf3m9zwavVmtC
         e+zRTkNuQ5MZj8hC7keLp8imZRieAuL7xQRi2Bx9idof1dozsQ6r15WXR8N8UFlaSrB/
         vY5iPx+yJ5ytmyK0O05RDrZ0fjfaFUK+w2oAqPfmwnC8K/iVLk1fRFXVVeHAktxM1j56
         JMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=f3dXWg0oh8xL1M1dPWVh4Ebk/AkdK0Pb6P7zeBhDtd8=;
        b=sS128+u0XhE9OFOMv/ZJdX8oDAtOHhHxmnFgN/nGIWAn31ZIRRu6pCvK6WGdw6JvKN
         r2kTratOGV+ip9ycvFlG91Sauyz2YjgMUo5GYGkdO313YGTbQt65tAzDTm1lpYFlSivm
         6Sn0kj7C8YdgUmFYQSFlPlWXrqLFaOcpYs59NC7HKicTZkWnhmOyESxOGsMw/0Pfa1u2
         QD4jIiwLYQw3bn3GYvVpH1nRR3gY5jHRs9YxMDgLC61Ox1ZsCtcOXTSqhF2WKxuiJqO4
         uM49f3f49k7ARjMbc2OB1vUZwPlpJNBJ5ecWpF0yNNyQvcXYMnuz2AJzTcjnyzO8YcHR
         F9YQ==
X-Gm-Message-State: ACrzQf23fCOHOTFXlPA8kuCuJf4DZxYfrUOy+i8bb4H3XJb9lZnXPvDM
        PdX31NVN1vIRRXlI/MQf3tWnZQ==
X-Google-Smtp-Source: AMsMyM72aSuNbNRXSHuMBnyfRIgi9Sq5tlL62YUtFv6VcV1eQojmbXG0YOwSyj5a45zfpYEjpES+Ag==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id h8-20020a05651211c800b00497c19ec709mr6532651lfr.152.1663587148763;
        Mon, 19 Sep 2022 04:32:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bf16-20020a056512259000b00494792ea34esm5130747lfb.273.2022.09.19.04.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:32:28 -0700 (PDT)
Message-ID: <9b711a9e-9e63-b69e-fabf-e05c11f145a6@linaro.org>
Date:   Mon, 19 Sep 2022 13:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: pinctrl: stm32: add missing entries for gpio
 subnodes
Content-Language: en-US
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Fabien Dessenne <fabien.dessenne@foss.st.com>
References: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/09/2022 09:46, Alexandre Torgue wrote:
> Add "interrupt-controller" and gpio-line-names to gpio subnodes in order to
> fix dtb validation.

Rebase your patch on recent Linux kernel and use get_maintainers.pl.

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index d35dcc4f0242..92582cccbb1b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -65,6 +65,10 @@ patternProperties:
>        '#gpio-cells':
>          const: 2
>  
> +      interrupt-controller: true
> +      '#interrupt-cells':
> +        const: 2
> +
>        reg:
>          maxItems: 1
>        clocks:
> @@ -80,6 +84,8 @@ patternProperties:
>          minimum: 1
>          maximum: 16
>  
> +      gpio-line-names: true

maxItems?


Best regards,
Krzysztof
