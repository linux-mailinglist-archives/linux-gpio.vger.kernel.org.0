Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DB65F9D9C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 13:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiJJLcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 07:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiJJLcB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 07:32:01 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6934728E25
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 04:32:00 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id w28so4308048qtv.9
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udkTcYsMkDl++4/6q7yNQSkg4/Iz9OjgmrKT1oZP0DQ=;
        b=sEerDYita79azCEkmkfrIkb1QxpBkJWvCzAxx5CGwyvQ8JL5VV9RqncCYEXf8gmnQD
         JQFPIkP5l4N0eBSJzhsfQLDzqsa097vXeE+K1DD3qT2rge7QeEeGKpURYqcw/dddMqhX
         lbvuMeKXmnUA2ZLbLSUgS+0cib/hQ9302zgLfkg2y+Uhm8Aeyb9P0dRTSbBY+hI/bx+d
         wt/xbPSTzEX4cz/0uDLWnBn05sH+TA087TrvuxGHkZdCOBgqJjn6PWp3WuC4SkTpXJzC
         ArI3NEOIPkNl+2KTnkzYO+THinNE669S3U66thuLq9p8/hu5IP1ephvD08AJcZdz8uNl
         znSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udkTcYsMkDl++4/6q7yNQSkg4/Iz9OjgmrKT1oZP0DQ=;
        b=orFa4mIzPjPtL0O6tbPwgQE4DnmdSD3wkuKY/zsJjXoqshivlc1JrvfLFv9y9hsPI+
         4ha7iU4pY7so6aPIO+xz7a+Bb5cnSHUQmTD4akvy9kOOBJ/Cgq1VFBiHmowW1EkQGBa7
         yXSgvVT5F0OW4eCb1xYU7kaA5jznUhu3PJ1XHHYsl40fycJJfuo/rvmBdmuIY6du37pX
         gsnt0TNSUTC5t9qqIYs25t7/ajJRoJXiTmKrPC9yAasCLMwaPtKXiOMbbQBS6m2lKaB1
         4nyUI0o+GxzUzH+ZgoHs7Qlmm9MMFK24aEqzhcKk+e/Q0unpAHk70dgIfR2oP4dY6wAI
         uiig==
X-Gm-Message-State: ACrzQf2Nq79N92KgzQ02IxpxeEyPOdJC3HizDqxZHV8ByON6iIwxuKLm
        TFNTHl9gIkbbprOQge3WD5qCSSzoTIFFXg==
X-Google-Smtp-Source: AMsMyM6iDYU0n449yi/Poervh+Wt+/XsqG8kherp0ZrmI4+Cj/yOkKE+y4HGbuPzT3U81A0Ak8GACw==
X-Received: by 2002:a05:622a:58d:b0:394:9d68:edc2 with SMTP id c13-20020a05622a058d00b003949d68edc2mr14696370qtb.230.1665401519621;
        Mon, 10 Oct 2022 04:31:59 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bs10-20020ac86f0a000000b0038d9555b580sm5056528qtb.44.2022.10.10.04.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:31:58 -0700 (PDT)
Message-ID: <d6765e12-715a-066e-c6c3-63e0962ee3af@linaro.org>
Date:   Mon, 10 Oct 2022 07:31:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 34/40] arm64: dts: qcom: sm6125: align TLMM pin
 configuration with DT schema
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
 <20220912061746.6311-35-krzysztof.kozlowski@linaro.org>
 <20221009174621.ecamh76faoibuykv@SoMainline.org>
 <d97b7d32-6e27-5a04-336b-0af6bd92c83c@linaro.org>
In-Reply-To: <d97b7d32-6e27-5a04-336b-0af6bd92c83c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/10/2022 06:26, Krzysztof Kozlowski wrote:
> On 09/10/2022 13:46, Marijn Suijten wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> index 8c582a9e4ada..1fe3fa3ad877 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> @@ -387,19 +387,19 @@ tlmm: pinctrl@500000 {
>>>  			#interrupt-cells = <2>;
>>>  
>>>  			sdc2_off_state: sdc2-off-state {
>>> -				clk {
>>> +				clk-pins {
>>>  					pins = "sdc2_clk";
>>>  					drive-strength = <2>;
>>>  					bias-disable;
>>>  				};
>>>  
>>> -				cmd {
>>> +				cmd-pins {
>>>  					pins = "sdc2_cmd";
>>>  					drive-strength = <2>;
>>>  					bias-pull-up;
>>>  				};
>>>  
>>> -				data {
>>> +				data-pins {
>>>  					pins = "sdc2_data";
>>>  					drive-strength = <2>;
>>>  					bias-pull-up;
>>> @@ -413,13 +413,13 @@ clk {
>>>  					bias-disable;
>>>  				};
>>>  
>>> -				cmd {
>>> +				cmd-pins-pins {
>>
>> Is this double -pins-pins suffix intended?
>>
> 
> No, thanks for noticing it.

Wait, you commented on patch which was already merged. Fix is here already:
https://lore.kernel.org/linux-devicetree/20220930192954.242546-11-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

