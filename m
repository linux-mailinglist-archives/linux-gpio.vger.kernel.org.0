Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E8860088F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiJQIP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiJQIPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:15:49 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4A25D0F0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:15:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f11so17240941wrm.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chyTRJd/zu2wMefOogTI+JN+hqlETu6Y/krLKJJpbOo=;
        b=PE+FnW2udTmrXGv3Fni/4qREGdhAX5SkbZmazDacBs1sZAJPjDF2PscVxtoYpmzQD8
         fqjURqxkPRQ0YbHcX3vE4rNrRr2xL43A3/CIWNObRij1R6q6XMRx5mcVJQHF0AdQi8if
         g+Q7nxV2FpHemxTFH2ji6fqE0T3WuzHvOjATK/VqYlQMCxj58COPbLiXisxkRSwfOR+H
         NLMMajcr+/gkLCo43qYoQr7t44CYxcdu04PpFPWlMGL8dbTwb8cid1qYHWm8+s6VDK7U
         JXHLGyGJ2LaTcr69r1A8haphquTKbKp5uKCDpaoPs6DD+9AadobcS9AoUlqhOdkLa0+Z
         H52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chyTRJd/zu2wMefOogTI+JN+hqlETu6Y/krLKJJpbOo=;
        b=BUFEhePdkLwTRxrZllsr6+McfjmIomc8xoUfRXA610/LktH3b0efe5PvgpSz8r1OL8
         X6/8vQYgdg9LgkloqtxJicmZ1asZfK7jPUYzTnmpAtq6mxdFMxWk0vnhOAFMcFk6rQr0
         63L9sdtPJ/EW/4HVSKqjkb/ZGV7dr3ivCbY3c3dRTOmzIofe6yz3dxyljtihTWbijTC2
         nYaWJ/Az99GyFidP2iDxFmKgmxrDPZjNQw+V1FYQCKQXa9GTUrBOGFZa+/iCoEFeIM1H
         gcnI/Eyl6Qu7tIeUKbkUUTk7dtq3fbLqjLvfoTWU4aZ8bfv9oAvnAnyyWr8ImZgBO6d3
         KEzA==
X-Gm-Message-State: ACrzQf28aLZfjZDdffW8nkE5c0pjnYAWW9HHizX9BGKLFPXhiXa8h3u5
        CQ1+j3vE89zMQYrFEfOQgNJe1Q==
X-Google-Smtp-Source: AMsMyM4BqGqMMgBxzNmXrMF5rPUfLJTlxQ0iRboNlR6IUeo1h1WSwLpqY1Zpak7T2rUjVtGSuBi8kA==
X-Received: by 2002:a05:6000:10cc:b0:22e:39a:efe4 with SMTP id b12-20020a05600010cc00b0022e039aefe4mr5629182wrx.256.1665994534859;
        Mon, 17 Oct 2022 01:15:34 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b003b4ac05a8a4sm19260114wmq.27.2022.10.17.01.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:15:34 -0700 (PDT)
Message-ID: <5339f5ef-2f51-5ecb-4046-524c6aeaea5e@linaro.org>
Date:   Mon, 17 Oct 2022 10:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8998: align TLMM pin
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
References: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
 <20221012151416.38645-3-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221012151416.38645-3-krzysztof.kozlowski@linaro.org>
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

On 12/10/2022 17:14, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../boot/dts/qcom/msm8998-clamshell.dtsi      |  7 +-
>   .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 16 ++--
>   arch/arm64/boot/dts/qcom/msm8998-mtp.dts      |  4 +-
>   .../dts/qcom/msm8998-oneplus-cheeseburger.dts | 10 +--
>   .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 14 ++--
>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 30 ++++----
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         | 76 +++++++++----------
>   7 files changed, 78 insertions(+), 79 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

