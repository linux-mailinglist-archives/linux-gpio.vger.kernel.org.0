Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69816C1E21
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 18:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjCTRfW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 13:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjCTRes (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 13:34:48 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309C6D30B
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:30:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a32so12949463ljr.9
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679333423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYCtTil8AXt9XWTFwbS9HfjaK2cncQVnlmA9jbUiyaY=;
        b=Sm5kiQFWbD67ftCLaJ5h2yeTA+MFw7io4iFnGkON1NMmau3ri9ZNtRd0RFkdJxnlXg
         DwyWkNh/7SGpas4WFN8+RZAFfMqroN+MmUHr6BTI5gt/ExGPEGfOLDAZdAWLM+qW5h63
         QDVuIHjiOUZtB3PqFFLbnAUm0HF6Yx17cUo53sZxUvbIG9VA/Bf6v5NAG0F9eWfRdnBe
         TAJpzQKf+vN5ItVUfXBMYOn2kFsyzAgSxLqoxLeCV9Yu2LRTTDyPcx7XSm9wcoK5Lc3+
         TnI56BDCElrMUleIxNoS3LlqoUWCjw+fWf1qyqA6ECgmeH/qZXUEjVzujs3BoAVezRJA
         1t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYCtTil8AXt9XWTFwbS9HfjaK2cncQVnlmA9jbUiyaY=;
        b=rNCQ7EdHROAJbuCrk/1CFsMGVnr/EKkRaKnqHh0XHIhKvlxPrrYzuUHlkXGTH6o9gk
         hcd5e9N5K1HcehsP/x3k9HZjeMc9ZO57qgtniAydEqU0PXA0fgyqA426Hzyasa5P5Hka
         uEVzYZiv97kChOHaSrHa2CP25s0fBQWkfXGCsqJUZxaQc4/HHHOAg+dJEXJmc6iNsRwG
         eVx3Kq6youyBEFibblZ8ICmFBoJIQ1pZvx42H96d8DgHmHjTVvzja+Fa3oZ70zTBSQpL
         bdaqpdZJYLyaqNHMBtmGQjKf+mLkZsGzf1govSp4m8ks3efAsUIVVU01J8VM7lKaBv8S
         nUGg==
X-Gm-Message-State: AO0yUKXcXWghQ5HBhBpBKTkVo2iFst7VnchEJnPyjeAEmkkRzyes/mCV
        PKT5+2vCyXYSZxSTzw974Ex9Ig==
X-Google-Smtp-Source: AK7set/fb6K6oItvMNI37kvioFdlggdZGhLWPpvZcNly60ZwMFBJbrN8qgwCxTZ43eFpMjEEunr7nA==
X-Received: by 2002:a2e:3012:0:b0:29e:896a:5ce8 with SMTP id w18-20020a2e3012000000b0029e896a5ce8mr212161ljw.41.1679333423067;
        Mon, 20 Mar 2023 10:30:23 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e95d6000000b0029bfcbeac09sm958205ljh.41.2023.03.20.10.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:30:22 -0700 (PDT)
Message-ID: <98525742-78e6-b512-a84a-fc54e5874e1c@linaro.org>
Date:   Mon, 20 Mar 2023 18:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sa8775p-ride: enable PMIC
 support
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230320154841.327908-1-brgl@bgdev.pl>
 <20230320154841.327908-9-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320154841.327908-9-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
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



On 20.03.2023 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Include the PMIC .dtsi file in the board's .dts to enable PMIC support
> on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Thinking about it again, this could have been squashed with the previous
patch - this way we avoid adding dead code.

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index 1020dfd21da2..b7ee4cc676b5 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "sa8775p.dtsi"
> +#include "sa8775p-pmics.dtsi"
>  
>  / {
>  	model = "Qualcomm SA8775P Ride";
