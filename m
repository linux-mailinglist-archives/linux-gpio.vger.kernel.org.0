Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7134462D445
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 08:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239095AbiKQHmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 02:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbiKQHmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 02:42:13 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C513F6D
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:42:12 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so4321590wmb.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fp81WR1dwD4In8eMPiMBs3woGAJFhqoDd1dZ9IdE5jw=;
        b=Lv/IXN9HRRcWZXtqmPB25i3q8KTUfZ6t+xsk7EdQ7IGKn+EQ0K83ETzrLL/JPpwpoF
         UlK6AE5is+ojSayIHQ3sOI1dmY8049fIV05Gm7jaspBGx7/iglSqYVRCYxBVf0LYcb7s
         hvUxdUJ1lXqAHmWi2Tv5TlrtqWfK0lpTtatlr03ts6+f3mBnbK37sQAc6lKO+lTixyqV
         hwL5lAhsY01ecv+QgOASoz5Aoy0b+Sij0O0/xMZdn3kIqLqxMlVb1hpVhGgNrM7Fv88J
         MPF0tKaXAIoyzWU7z4nuqT90NQi5NqadmVifpfyObdG+MKfx570Pe2e9W+YSp88Z+GNq
         qhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp81WR1dwD4In8eMPiMBs3woGAJFhqoDd1dZ9IdE5jw=;
        b=q43JDAiGbbS86iFUupNC+NJEkX55PFc2ixRsUAsPUT7eYoKGUfsP/nw+l8m5B2Wr9s
         iHmIr/aLoegQqmjr7hbUzLC4bjI+N+5k2ibzkiCsyYEkDkBnxRUtg1M0uPN2oaxO7SV/
         L2slQMsDpWPvKcHFnfHhPOO7lhfRkSh7JG2fwjroFuMAb5oDLuIDGoEgGq9J651joKRX
         mMiC6SJA0xVEBm0N2L/WAthXjiRy5WEYS9iAckvN3o2nfIPC9qINakI1iV2VLxvEXQw5
         ViIMH1mSvMaNYdJCb9MzZonxh1Gu09OHJuTwviELFxl9moGBN/DoBu+1coDfX5LzTSc/
         6vBw==
X-Gm-Message-State: ANoB5pmi5oxQAwxPg9+L4nqKR+Ca4tAombgGaCbw7iqPwa2Re3gFqh6/
        jeyCu6nF+MF9mKz5kieLuWOpog==
X-Google-Smtp-Source: AA0mqf76uBamLSiz8AZO4X7010wIY/Z6HZJBkBiADrMVceWIB7XnbAaR277pjS+AyKAKY5COlUQfsQ==
X-Received: by 2002:a1c:7303:0:b0:3cf:e7bd:3035 with SMTP id d3-20020a1c7303000000b003cfe7bd3035mr787172wmb.60.1668670931068;
        Wed, 16 Nov 2022 23:42:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b? ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
        by smtp.gmail.com with ESMTPSA id u23-20020a05600c00d700b003c6c3fb3cf6sm334685wmm.18.2022.11.16.23.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 23:42:10 -0800 (PST)
Message-ID: <3be329e6-79f8-4b78-c24e-9341f4d803a2@linaro.org>
Date:   Thu, 17 Nov 2022 08:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/7] dt-bindings: mfd: qcom,spmi-pmic: document pmr735d
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-3-6338a2b4b241@linaro.org>
 <f3338d53-a0bf-9fc4-fcee-959e2b9a7e22@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <f3338d53-a0bf-9fc4-fcee-959e2b9a7e22@linaro.org>
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

Hi,

On 16/11/2022 12:16, Krzysztof Kozlowski wrote:
> On 16/11/2022 11:11, Neil Armstrong wrote:
>> Document compatible for the pmr735d SPMI PMIC.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> I think this should be squashed.

I'll squash both 2 & 3 into 1, can I keep your Reviewed-by on 1 ?

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 

