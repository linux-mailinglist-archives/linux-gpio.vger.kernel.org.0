Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8398D609C12
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 10:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiJXIHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 04:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiJXIHu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 04:07:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112D7625C9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:07:46 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id t4so6050090wmj.5
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N1VDqtl3vnv+ST8kbtEniqsZC1oLb+z2ds9xQmLxmS4=;
        b=gMVmbYfW/UB/h09+QcUH5Gagql2ebppbZ8JhumRALj+6aoM0fgNk4RC+XfcsBq8D8v
         M19QmLGesRewwy2+MenuWRJ6jLSHd5ponsMhXpfiZcIm8aQamMXcQu9JYhS2W/YfXtgP
         8cYBXEOyYYIisaJLkeIRnCxdZ64dOBLBYuKFdpBKVwyo2gPVpk1NymoVJZs2sfJ6ktv4
         5S7DwwBJvuXSk/127ICGK6r6rWTzE5q1WyDoq5/ALui8PqDPRaZOqM9VEektUivT5AF3
         Xwr43jXIAEiL791GUcJlr0LX0h/M6GR+J9nVSY5HmlIjLvqOxEbGmTFlWfuBBN+l0kYF
         NeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1VDqtl3vnv+ST8kbtEniqsZC1oLb+z2ds9xQmLxmS4=;
        b=gkFzyxZ6pS8QlZa65KlrHgUr/BS2uDgBzWEgRhhpASQEsKhecsQxgyuTS9iS1V6X4A
         ajwQUpnEJq77Yw4RFVfaCTfWiYNF0uYl1W5A1fFb8+WSuf6R9dV0Z/Tpoj366XEGyIuM
         v3p1JixOutnm+Zs1fdS41yWRsy4b7DdB/4eTnK/fzHz71lu2d/7gDhuX1C5eSP2oqb8d
         9qa//oYsULBlnz5aoX9F4Dnu9B0ehGru+F00YRTslICvfP+GqGIOxao6P4Zr/YSnniKJ
         tjOKQpRGziyetyoK2UQIAesU0pOEdRHxZOKQUyxsErpOfad+aI9VLOmbvFl2RRl/v2G/
         HXrw==
X-Gm-Message-State: ACrzQf34L+EFGIdngQmLrE6MSwQWtTfOEkI/JZZ8SRQK9HILc5dtzqzV
        pXiknOqw+VDc8BJve3Fh+8yf2EJQE5dhOu2b
X-Google-Smtp-Source: AMsMyM7J4KHskw3szJmZmmvck7UO/jaQFyNAuw9wdES5q9aV4H8fLYFYKH/DuHI80YEwY6GeLVhPag==
X-Received: by 2002:a05:600c:214d:b0:3c7:1182:4874 with SMTP id v13-20020a05600c214d00b003c711824874mr13663854wml.4.1666598864237;
        Mon, 24 Oct 2022 01:07:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:735:6af:71fd:8d8b? ([2a01:e0a:982:cbb0:735:6af:71fd:8d8b])
        by smtp.gmail.com with ESMTPSA id t2-20020a5d49c2000000b0023657e1b980sm7646065wrs.53.2022.10.24.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 01:07:43 -0700 (PDT)
Message-ID: <9d7bbb01-ee3f-6a62-ad6a-98451df1da45@linaro.org>
Date:   Mon, 24 Oct 2022 10:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024002356.28261-1-krzysztof.kozlowski@linaro.org>
 <20221024002356.28261-2-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20221024002356.28261-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/10/2022 02:23, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on hardware.
> ---
>   arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |  14 +-
>   .../boot/dts/qcom/msm8916-alcatel-idol347.dts |  14 +-
>   .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts |  24 +-
>   .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |  20 +-
>   .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  16 +-
>   .../boot/dts/qcom/msm8916-longcheer-l8910.dts |   8 +-
>   arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    | 274 +++++++++---------
>   .../qcom/msm8916-samsung-a2015-common.dtsi    |  61 ++--
>   .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |   6 +-
>   .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |   2 +-
>   .../qcom/msm8916-samsung-e2015-common.dtsi    |   4 +-
>   .../dts/qcom/msm8916-samsung-grandmax.dts     |   2 +-
>   .../boot/dts/qcom/msm8916-samsung-j5.dts      |   2 +-
>   .../dts/qcom/msm8916-samsung-serranove.dts    |  41 +--
>   .../dts/qcom/msm8916-wingtech-wt88047.dts     |  21 +-
>   15 files changed, 259 insertions(+), 250 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

