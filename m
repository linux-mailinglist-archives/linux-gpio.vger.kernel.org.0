Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF73662745
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237089AbjAINhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237109AbjAINg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:36:56 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0067A3E849
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 05:34:58 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso2524624wms.4
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 05:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Kukoai+7dPesMj73NOB/0XiMbmQYiypYpyBD0Rmy94=;
        b=zOHtFB/xF7vcwYY/emTb5TpaZ/e879x3tN6lXF064jEw6Nce1R7CNOPUIdfoMLUDux
         /HkdOiAkBqdHcbB2z9kDCSLylnQoJ4q3mnQE2StRS3+qzF25tlO3v7hi1mTGtV0TJtK/
         Xy6LMY5+l/heC3fTHKGjAAVvO9ZL2MuCMw5tsq0dRDq1VFaODIZ8nGf42T9X1kgDKjea
         qWDNwCjQJ0k5LQB5cEeRHfndy8jQnjeoqTRx6f1xQCBOglu+sB25ZM8EW8VUdYYHwwZW
         6dz2KgDFnhJuP8Ln2bDfzTtie8kbO3h3hVCwGkCiZJ+bdXZY7v7M5pA8/cue+0nT2ZxP
         kRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kukoai+7dPesMj73NOB/0XiMbmQYiypYpyBD0Rmy94=;
        b=GGl+dmA4IH43qTJvnLrNEkL4yr4NPPlLt8IIW0gAN6nLRtOSjLz6cOWyNkz5vCU0rR
         vySwF82BXIMde2TEjWJgO39wV811PLOXWjrEFTjEnbfV5WBdWGEstZuru/5TzUzL4sgu
         ekCwYrZhZPYHIZRzr/s/C9p8tIbKz94XQKBR8dd6Ab4RuyIbEELyCG0ecStn151rqmsl
         VOsH69iJHqC3NI28e1advnPO6KY/DQNa49WWxFRaq0nYGl16oi3rzwna3hUZ4Mr3F7R0
         HzRtwKuoNuJIUPZP/uT1TYqKXreqkEmdGe8PbThbnh9LQlFMQZv8LRLMKyI1/2bCiVNO
         iMDw==
X-Gm-Message-State: AFqh2koabgSZupAKPi+r3M+aTJDanW+vQWUZe1X6FaYOYHdzEvPehJpS
        NM5kt0qhBo9vaSjcb9f17d4aNgnC7GfqmY0B
X-Google-Smtp-Source: AMrXdXuuIbQxmJyr8sv7eqCDQEhNZuR1xlJjy+MALuch+4sirs3IilzzHrs+adelj6IveSWQjBSMsg==
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id bh18-20020a05600c3d1200b003d2392b3165mr46061791wmb.12.1673271266988;
        Mon, 09 Jan 2023 05:34:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm25333512wms.3.2023.01.09.05.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 05:34:26 -0800 (PST)
Message-ID: <b0f1f804-d0fc-8c1e-fc3d-fa9013bdf493@linaro.org>
Date:   Mon, 9 Jan 2023 14:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add
 input-enable and bias-bus-hold
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221222161420.172824-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbMS7MNPhzi2Ty69TZddEsai-2tASVGJLCiiVktL34V5Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbMS7MNPhzi2Ty69TZddEsai-2tASVGJLCiiVktL34V5Q@mail.gmail.com>
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

On 09/01/2023 14:31, Linus Walleij wrote:
> On Thu, Dec 22, 2022 at 5:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Allow bias-bus-hold and input-enable properties (already used in SM8450):
>>
>>   sm8450-qrd.dtb: pinctrl@3440000: dmic02-default-state: 'oneOf' conditional failed, one must be fixed:
>>     'pins' is a required property
>>     'function' is a required property
>>     'clk-pins', 'data-pins' do not match any of the regexes: 'pinctrl-[0-9]+'
>>     'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Compact the properties which are just set to true for readability.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Looks good, is this something I should be applying directly or are
> you collecting some big qualcomm pull requests like last time?

I have just nine patches so far and it looks it is the end of
cleanups/work on Qualcomm pinctrl. Of course maybe something will pop-up
later.

It's up to you how would you prefer to take them. There are few patches
from other people (also adding new devices/bindings), but I did not
notice any conflicts with my sets.

Best regards,
Krzysztof

