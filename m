Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349135ED68F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 09:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbiI1HnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 03:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbiI1HmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 03:42:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3069722507
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 00:39:37 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so2028529wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 00:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=eZ9vmIYK1QfwhenZBRouVIsuSBTYdFiZ0xlDO4qNIH8=;
        b=YP59cW8lrVF2vOFhawusd/K5/JXcFlmeVWcAqT73dIHoqw4dH5sezATt8Hll/hbLvX
         lYD8qnVkefTQ1h0d4S4jN64oaBrp6dsd6vKNCLiOwi8EX09JwxAPeEN2p9pH6SA9IYMN
         DmxlZx1WEqGi2zNwBX7QxROa+6QyYLs+uS5vViRyZaRG8y9aKlmCZtz8Dj7c44RGqkro
         M+j1HygCMomNO+hRirBWBUvA85CmmVfWvQmVpJlpfCWJ3IbB/cSH6M7IAr6qXlRDujaV
         bExBan0gvXm+tRx8uqrS3R1YhpiVvUfOOaqQ8xkPUhyUYlKG1XKcJs+pVYZKUjqOsgbh
         DX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=eZ9vmIYK1QfwhenZBRouVIsuSBTYdFiZ0xlDO4qNIH8=;
        b=BXGKultoGtCOuF3GHHiRoHeHADIzAs7k6XUWAjVaXzWhXz3RwYLwDaPCNGy7d0BuKP
         lAddsd9u5Zg3Y8l2UG8b54U1C3Pg/v+jjnx5jxKPAeXp39FKLqBTocfWA0pIWaFHJ1i6
         9HJ2hCdsp7Y1/u+MmEJLtuYQZFg2e1Rrye7JGtWRypCcqlIl063YgXX90GoINTv+JD2y
         4lINuhBGMlTeFMTCaq8eHwkx7oyvKEpNY8x8JzAy3BhX4YxH7taxisCQ75geQQfgi0kU
         5JLgupEfy24WvAUWgZkIIsOFxXcudWNInhQuQsT8Nnvfm7Z3t9bOa46NmbbEaROOHsnC
         pY7w==
X-Gm-Message-State: ACrzQf3cIj6p+mGfMKcGKGM9gHM5rijOLq6HY4/AZHG9xxBAi86k0tQD
        0qP/8erv2JvkxatpgLti1OCQwg==
X-Google-Smtp-Source: AMsMyM5jD0OFaMJHJ0m2ZOXngKxrXR6qa0WEz8XJGfH4kTaEpvtxFwKJlI7b68KFB4UtiSXWq7mv4g==
X-Received: by 2002:a05:600c:2212:b0:3b4:9ab8:b24e with SMTP id z18-20020a05600c221200b003b49ab8b24emr5583208wml.127.1664350776087;
        Wed, 28 Sep 2022 00:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003a1980d55c4sm912020wms.47.2022.09.28.00.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:39:35 -0700 (PDT)
Message-ID: <ec137750-1c8f-d190-701a-48a9866aeefd@linaro.org>
Date:   Wed, 28 Sep 2022 09:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/12] arm64: dts: qcom: sm8250: align LPASS pin
 configuration with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
 <20220927153429.55365-5-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220927153429.55365-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/09/2022 17:34, Krzysztof Kozlowski wrote:
> DT schema expects LPASS pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 44 ++++++++++++++--------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
