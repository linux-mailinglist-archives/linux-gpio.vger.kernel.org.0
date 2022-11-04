Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A50619DC3
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 17:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiKDQwB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 12:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiKDQvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 12:51:41 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED19742F4B
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 09:49:47 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id z30so3383674qkz.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szOAhCODiz2psvbLaxB05H0+fft3Kwz0ZU1zhJdCDdQ=;
        b=ttyl45T4rcwvy19XAH/tMzLVbnxQ07TsEg2etISoj+uvocLgeye+GCly2rxOdjFzPZ
         NHfeIxWgFrcvmeGvFTznOkg8BYvCrL8m3eKROcxfmlJyKd61tyCL6uKFier8UR+21fpW
         jIeU7QkwN3lFMm6zxcKwHZ3EQOO0/vFs/QJuLlf5L0950ssC+XJpfGmR8hCRTG//Psfs
         xPg2swVaVcknk28KhPsE+6UAh5M7QFWJRkQaNkjvsFYeQ2EehLw7kcPEXbfWRz1igf5A
         efsG/HBNI+Nzc2icw/RqwtmmF0JIneaiVbVUEGSWxrYXKl4oJCPDPsOprSKoL+UQ2jut
         9Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szOAhCODiz2psvbLaxB05H0+fft3Kwz0ZU1zhJdCDdQ=;
        b=kRe8KzLHYdewIRPCx6N46p7aXp+Tya3o1wolA99O+CTJT99BN9MjpBf+14+s80Ec10
         1RATvOgi//jGGg7wjSgKiSLVkbYLG8uVWlVUzHwWDlbXzTwW+zpCzrNC8Fdz8fxO2cdC
         ZWnNurwfX3E72AEGWIr5gBm0g3+d9iJ2HZlGeYuNy84qGPUE1c0XuL8EN4Za6dXwN79z
         Jag/5f0MjSMZ3StFrTQ1t+97VNoK8u09/9VBHXMNZlrOLT6FqIPggG8BeTm1rJ2PkB22
         Inbu3+7Xs+wskjZtuqqHS2UE43DKuhSWEN3a3GfDdlaLcZcGrCnb6gw9PmsWq1yU6b20
         pf/g==
X-Gm-Message-State: ACrzQf1H29JIa1pHyCMJFSbuXzEy3nWXgHA3Qle1LrOY96xUXLIkSTWn
        1RC60Tga4T5UDh115j80/n9P3A==
X-Google-Smtp-Source: AMsMyM5qHrayLZ4x1Xy8q+I1McvLmvl9QsUflOS8FBeq1znjLnFdKgBaqb3J/5HMhiVDBhLQezmtrQ==
X-Received: by 2002:a05:620a:2909:b0:6ee:6c83:9769 with SMTP id m9-20020a05620a290900b006ee6c839769mr27246269qkp.732.1667580587144;
        Fri, 04 Nov 2022 09:49:47 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id bp33-20020a05620a45a100b006ee7923c187sm3220489qkb.42.2022.11.04.09.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 09:49:46 -0700 (PDT)
Message-ID: <f1273127-0349-9978-b8de-94760684dc1d@linaro.org>
Date:   Fri, 4 Nov 2022 12:49:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs404: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221104161131.57719-1-krzysztof.kozlowski@linaro.org>
 <b9f217bf-f0cc-675e-bf76-399a63b10309@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b9f217bf-f0cc-675e-bf76-399a63b10309@somainline.org>
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

On 04/11/2022 12:34, Konrad Dybcio wrote:
> 
> 
> On 04/11/2022 17:11, Krzysztof Kozlowski wrote:
>> DT schema expects TLMM pin configuration nodes to be named with
>> '-state' suffix and their optional children with '-pins' suffix.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Konrad

Thanks Konrad. Could you also take a look at:
https://lore.kernel.org/linux-arm-msm/20221024002356.28261-2-krzysztof.kozlowski@linaro.org/
?

Best regards,
Krzysztof

