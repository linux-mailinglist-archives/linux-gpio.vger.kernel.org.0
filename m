Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C2371FD75
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 11:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbjFBJSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 05:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbjFBJSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 05:18:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C7110E6
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 02:17:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96ff9c0a103so259867066b.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697439; x=1688289439;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXjhrkmC6ETRHh84XvkEcm7oc+gqgXzZ8F9SFZsUAa0=;
        b=BjVyqUZHHRmlilU01AM5nHbeaMWINu66Yn/cIKqoi7/zNnYh7Yqf1ECDvP1/TG/hP1
         bKQQ4xEGRkPwzfoffGUxLF8/S/mqbIPUBfItLI2VzXNkt7364FpBXNgkweQ1cuxeBYl9
         jn9ebhcqtJL4LNam4Tc+DYByhXrnWzLVsT/boyH7ybjsO54suJvYG0ywSMdIPNttbAaB
         O/d4m0qabTHbgHOHhxFNg2Wko2RtH0HLvBlH1HvygNpcGolqrUrLJA2BArsEFhO3z4gw
         tYbTKXtWH3Zlxo4+Tka5Hf/XMkd1c2xn+lAGp0uKcjZCG+Vl81DH5uVU6np0i2Nuv9B5
         xsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697439; x=1688289439;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXjhrkmC6ETRHh84XvkEcm7oc+gqgXzZ8F9SFZsUAa0=;
        b=WtfJZNMdt3nB7MtctjCdfIxXlbs3ILfxmTBy/E5v/85txrb5mLxZZIwF4IbK4KD1W/
         lC9BECA6TxxbMRAgkPdE/pbPp026UjusnQvded7L08ryrmwQ5Hl0/0oklo8EM5poHvjI
         2XXjkzwn9Uo98a5Ow2gJjANL+EO5/43t8gy39uuALakf2aa1gFpVXBxPgpt3lQWjN04U
         Kq1nImyev/twOW/RKAGiozfdARl2GrSbFDm0WQVlRPqdqvFQVQJWZgfCYzPpBVkx26k3
         44wDoGo64LQDt0R9jNlTrcv2ipSiCF6eWV/g1Jf4imFippHSPouy403mOPsrfE3kYnVC
         ZgLw==
X-Gm-Message-State: AC+VfDxbonGeux7NQKpvBVslomMRE0DoW43HvolYJmDMn1jpqn3daHs7
        K1gmfhuZmvJppChzybC/GZ8epg==
X-Google-Smtp-Source: ACHHUZ6fxt+H/eN4IYSEGrMJq9k16byAcMq8OPSaSx0tcu04hSzHsxw0X4qBlk9jZQ0VkL5cwLNf5A==
X-Received: by 2002:a17:907:9455:b0:96f:e2c4:a063 with SMTP id dl21-20020a170907945500b0096fe2c4a063mr10450385ejc.33.1685697439425;
        Fri, 02 Jun 2023 02:17:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906960200b00965b2d3968csm519886ejx.84.2023.06.02.02.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:17:19 -0700 (PDT)
Message-ID: <71b1f98c-ce20-e6e6-14c6-e5ab2d66dd96@linaro.org>
Date:   Fri, 2 Jun 2023 11:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 6/8] pinctrl: qcom: allow true compile testing
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
 <20230601152026.1182648-6-krzysztof.kozlowski@linaro.org>
 <8f364aac-f9f3-4b85-9718-78f084bdf104@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8f364aac-f9f3-4b85-9718-78f084bdf104@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/06/2023 11:08, Konrad Dybcio wrote:
> 
> 
> On 1.06.2023 17:20, Krzysztof Kozlowski wrote:
>> Makefile selected Qualcomm pinctrl drivers only for ARCH_QCOM, making
>> any COMPILE_TEST options inside Kconfig ((ARCH_QCOM || COMPILE_TEST) or
>> (OF || COMPILE_TEST)) not effective.  Always descent to the qcom
>> subdirectory to fix this.  All individual drivers are selected in
>> Makefile via dedicated CONFIG entries, thus this should not have
>> functional impact except when compile testing.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Should analogous changes be made for all remaining
> obj-$(CONFIG_PINCTRL_VENDOR) entries?

Only for ones depending on ARCH_XXX and that requires actual compile
testing which might point to missing dependencies etc.

Entries depending on selectable PINCTRL_VENDOR are already
compile-testable (see Samsung for example).

Best regards,
Krzysztof

