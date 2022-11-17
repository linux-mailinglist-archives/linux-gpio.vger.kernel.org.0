Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 809F962D64B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbiKQJSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiKQJSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:18:35 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802F960C6
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:18:25 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g12so1841894lfh.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLFGwEWPh+89QV0pVhSS68GinK0G+oaZz4v6Lu9hAZs=;
        b=LkMa0Dl0cNwFkd3Q3OQLsQFFNFtI+G8p4jjHruzKFqDFaxOB0nYlAHulUFdSYR9G3e
         zfYmMOVN29KSDydbMwW6ElcJdg4lsE6tEaRjSwOp+UggOL1UWg2xM6WTvzTFcJfL0ehT
         NMEl4dyNHR0IIxFPlTw95P03mFvMFJVAU32e5dZ7YN0CYHLFdz3hYNRwkL0A3OlmoSYT
         zrDLB8VAAdFPg0lCz6HLhT4OurxKsuF2zO4AMEHhHMP3QNg/HQnSCOL9F5r+AbHNZzM+
         ZW848XWUK6uJq1kHLN2fHocExahorRrc7Mlwn4vShZ5KcICTylHVrsGP8RjedPG2UXmm
         IjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLFGwEWPh+89QV0pVhSS68GinK0G+oaZz4v6Lu9hAZs=;
        b=riOwI+PTIuWTzhKG0ZMJIURa3BIuLdRCcVAIv9jB/NzI/tBGYJ+yIgZVkSRTZRnhI4
         ueta9fnVN8VuMkSy+8BhkkibJqNUGEX+dq+Pyx7CXKLOJtzTo2QSkZrEXa+/+5mHT74o
         rflCSBl824cLgIVwZamHqhLOMximUQfJoSaJKmIdjR35Z01aAU6yr0W3JQ8IhGU0i9vz
         PpUMCqIMvB7+VLOs6AbZAXrdKzLw6VL6cneN6NLtPSzVfZs7kzIVAipJqbWAtHlOunvK
         M/2tXmkieQM5cdmbFgIwOPx1j93E/s/4EoaLal8xduTqa3xmaIuG/F5MRi4VWw9GimV6
         ReKA==
X-Gm-Message-State: ANoB5plDMwP1a4h0wlQM0dAwxHmRrsaIMQ4r0Y4epP98Sa+RwIz5nuIZ
        t++CLzSV228Ou/ymEJpr6C6WxnxBRavp1gdn
X-Google-Smtp-Source: AA0mqf4/6BJcvJvcM+zce625GqtjXKyhZFyZtLVu6hUl5YtywTAvK6E7RO04n2pluWLT4D7i7ORDRw==
X-Received: by 2002:ac2:4c18:0:b0:4a2:6e2e:2d17 with SMTP id t24-20020ac24c18000000b004a26e2e2d17mr567318lfq.339.1668676703843;
        Thu, 17 Nov 2022 01:18:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z10-20020ac25dea000000b0048b003c4bf7sm56570lfq.169.2022.11.17.01.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:18:23 -0800 (PST)
Message-ID: <d9c41d62-6318-0fec-c2f6-9eac8f2d0de0@linaro.org>
Date:   Thu, 17 Nov 2022 10:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: qcom,pmic-gpio: document
 pmr735d
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
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
 <20221114-narmstrong-sm8550-upstream-spmi-v1-5-6338a2b4b241@linaro.org>
 <2ca3260e-f3f6-cd69-96c7-e971fa757968@linaro.org>
 <575758c9-6bc1-e980-4aba-b49cf9246d03@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <575758c9-6bc1-e980-4aba-b49cf9246d03@linaro.org>
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

On 17/11/2022 08:42, Neil Armstrong wrote:
> On 16/11/2022 12:17, Krzysztof Kozlowski wrote:
>> On 16/11/2022 11:11, Neil Armstrong wrote:
>>> Document compatible, pin count & pin names for pmr735d.
>>>
>>
>> Squash with previous.
> 
> I'll squash 5 into 4, can I keep your Reviewed-by on 4 ?

Yes.

Best regards,
Krzysztof

