Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E96687903
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 10:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjBBJgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 04:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbjBBJgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 04:36:52 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00462302A6
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 01:36:32 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so872743wms.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt8ozUADZ6eeGHmzvcBaxCI0C79i87ycD5W165HFrnQ=;
        b=LlAsSUPrUvuIh5VUAOPjfHAoGUfXDX96nCiMDKbEZernph10xhS3CkihOKxrZc6M6Q
         r3e3tEYxj3Xi6yxBI5LfR5VyxjChKvfVXmXt+pExhvjSG2RAiboe8x+CnT0E3k1JImKc
         2DHP6QDfPWbBRhkqBFlbSUTK62wLR0rF7g/zm6egvDpDqY+wWQR9zUgUHUJxQoEYf6f2
         cCh8Y9PLVQj/EPBvAl3Ri0mBTjQ9Kw7cELWGJxEcs7qqnv49rjtR0em+7BZzl8O6/e6m
         Y+R6G0AC+RSzcm/9Yjp5tclKtZxbLKPeVC/kOMyQfp5RoEJcA9kyzK9xkVlpFIZqLlqQ
         J5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt8ozUADZ6eeGHmzvcBaxCI0C79i87ycD5W165HFrnQ=;
        b=Y+sysFoM4eOBmQ/thfGnvLwZuzvvlmvUOO0+rJuTDXrMgiLgXllTm7CWKY61Cw9Db+
         Bt/eKjVrD0TRRX+lAGuwr0J9ZZPhjNo7/1+l5F0xT5ApgN+bgsGrMKQQ/+u9+mSmrMUI
         VdcJsPFxLpViN6ubFc0eEtb/mbIXDkzo9hIAjT9F+Ii7tgbXMpWBYwMDZ5pSoFo/b/z/
         5PoCIl+qetm+ts+zFNpVH7DbNkICcO/HuNckMoYJpZ+ND7/4Be4rR1SkaHBEQV0nMWxl
         Rew7iOF5JowH0bIx2NvIUqgpHZ7WKOJm1N4a6g7yUcjbGDFS6P8SfdX9QyPnyBRfwN26
         wHHA==
X-Gm-Message-State: AO0yUKW0NSiz4EGgL4xmL/UV9mkMiFx1tJK4d7VPUALGb98BOWfegN9w
        7Cio0IPXV2qMOtDSAqf7MzqAhQ==
X-Google-Smtp-Source: AK7set8B5X1XicB6CO5YGe0QdiSaCPJUiAmapInJVjJKHSPrSIQU5oErqrpGdMcOozxKFkfjMfu7FA==
X-Received: by 2002:a05:600c:5006:b0:3dc:58d5:3a80 with SMTP id n6-20020a05600c500600b003dc58d53a80mr1267788wmr.24.1675330591551;
        Thu, 02 Feb 2023 01:36:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm19468693wrh.91.2023.02.02.01.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:36:31 -0800 (PST)
Message-ID: <722c731f-646d-f953-7408-353bebf2a870@linaro.org>
Date:   Thu, 2 Feb 2023 10:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8350-hdk: align pin config node
 names with bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230201154321.276419-1-krzysztof.kozlowski@linaro.org>
 <844ecb2f-e398-1187-810a-4f24372bd189@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <844ecb2f-e398-1187-810a-4f24372bd189@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 01/02/2023 16:46, Konrad Dybcio wrote:
> 
> 
> On 1.02.2023 16:43, Krzysztof Kozlowski wrote:
>> Bindings expect pins to be named with certain pattern.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> Do we want a Fixes: here?
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Could be:

Fixes: d96d8f9192be ("arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge")



Best regards,
Krzysztof

