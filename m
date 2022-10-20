Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8341606B72
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 00:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiJTWpP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 18:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbiJTWov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 18:44:51 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEE350BA5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 15:44:49 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id f8so963594qkg.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 15:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPT7tBybriHsBPmnhq33KI/WJRugk0kzMNukS0fuXHg=;
        b=uWOLgWr2PeyCt4D7XtXlrGfikGUHkSh3nw2aJht3Fm8d+PilSBG3qKuSXLSU5rOA9/
         FxDjZk9hSapHSiE1Wd40jsgqd+Ynp5uvDaTbcgn8E5xQ4xBGLyacL+So1pyYrvZal4gn
         ijYOVaz+FefBJoHzVwlkHmnxQhSRyywRsyeeRVnfkSfEE/Kvn5C2GUHNhMKuex4xxPiY
         qyMT+m/A/aURsO1P70gSk+pDraRffQ051g2vhB/pNfJOBtazwOJQIoh4Qz3X78jVmK59
         SRdLfq9I8mDSIAazXCo/Gd0t/PU1Yy5w5nmjnX3DCOHFqBQHDFvWnHVBH3lhxYrZTT4Z
         1pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPT7tBybriHsBPmnhq33KI/WJRugk0kzMNukS0fuXHg=;
        b=M7HO4r6hB1mqAq2axt53teFT2y+IoAF6Kgjl95fdMOyMgjwwwP8rby6E4hb1M4mdum
         gEq/9Vs5NnsVcV+7Z2GkU3P0yluWRG5AN9U8IUIO4ybpLQbPsOn8CqWsmT3FNxGdoEok
         n59JB4iBRpMp6/VRz1HRpUD6KLPpn6DzBZ1q+1Zmu51+b/KNDRYa42c7ayvCLn5D2/3T
         kC7b5/eiQHkmcrsjnCe3fqzyHgyPoBRDHume8P0A9la33larYfmAsh7eBe/SvrCSazMG
         GaaXvx5btBe5EvtzfSeRmusMbSZ24aaesst36RvgVOFRX9tuCXTuAx0LuGUAblr2aku8
         h0Kg==
X-Gm-Message-State: ACrzQf1zRNGSyb7Ly9ZReVLq12jweb+ji4AUmj8HphNt3CY50Ozyvry1
        +cfbcqfWgyXORGmqbAkSTubdog==
X-Google-Smtp-Source: AMsMyM7amq+IROYBz05TXTIlsKX/VhkjUV8sy7t8Ci0hzqT/ojdNJYJCpiCQ2T4CYVQDZzFb7ldt3g==
X-Received: by 2002:a05:620a:440d:b0:6ee:b5eb:a0c6 with SMTP id v13-20020a05620a440d00b006eeb5eba0c6mr11478881qkp.356.1666305888366;
        Thu, 20 Oct 2022 15:44:48 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id f24-20020ac84658000000b0039cbb50951asm6775416qto.24.2022.10.20.15.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 15:44:47 -0700 (PDT)
Message-ID: <f86806a2-7381-40fb-317c-7167933f24ed@linaro.org>
Date:   Thu, 20 Oct 2022 18:44:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sc7180: revert "arm64: dts:
 qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor"
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
 <20221019001351.1630089-3-krzysztof.kozlowski@linaro.org>
 <CAD=FV=UriVs4-=KCg5TkzCuQaS=LEZS=CDOH0=69GsYjhPcu_g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=UriVs4-=KCg5TkzCuQaS=LEZS=CDOH0=69GsYjhPcu_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/10/2022 11:48, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 18, 2022 at 5:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> This reverts commit e440e30e26dd6b0424002ad0ddcbbcea783efd85 because it
>> is not a reliable way of fixing SPI CS glitch and it depends on specific
>> Linux kernel pin controller driver behavior.
>>
>> This behavior of kernel driver was changed in commit b991f8c3622c
>> ("pinctrl: core: Handling pinmux and pinconf separately") thus
>> effectively the DTS fix stopped being effective.
>>
>> Proper solution for the glitching SPI chip select must be implemented in
>> the drivers, not via ordering of entries in DTS.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v2:
>> 1. New patch
>>
>> Not tested on hardware.
>>
>> Cc: Doug Anderson <dianders@chromium.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 27 +++-----------------
>>  1 file changed, 3 insertions(+), 24 deletions(-)
> 
> It would have been nice for the commit message to mention the fix in
> the driver, which has already landed as commit d21f4b7ffc22 ("pinctrl:
> qcom: Avoid glitching lines when we first mux to output").

I'll add it.

> 
> In any case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I've confirmed that this patch is fine after taking the pinctrl fix.
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>

Awesome!

Best regards,
Krzysztof

