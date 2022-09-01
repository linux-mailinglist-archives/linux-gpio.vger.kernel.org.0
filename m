Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF935A9B5C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiIAPPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiIAPPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:15:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B29402FC
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 08:15:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g7so7940291lfe.11
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gyNVCFkaWNsKBaoIpibBhspi5hxPuuG/Dvrr/wS3a7I=;
        b=wAubuwLzKPR6GV1qetXH4QaFJMWXbtjhYc0Kcr1CE6SfUMgea1gpwtfh1Y4ECyT54/
         JX3Rpmt/dIf+WxH7n5FGocI+2bTUXw8EWWWki6+085uECpswC1nrlriZh1BcgRtUGstf
         KGKqkZmuaK6XNYEXXL2BQNAQRJlYAh6K58+dDWeyHmbO2XXXfI/A3VWoEq/fDfZk2A/Z
         +PUbJ7tKuL4krb8xJCjXQ7OSP+Gj/TzC0djScgtRqVAchUR2PwlBF8HCoVDCHjMiuM6q
         48Evdh8MLPgTCQKgsTnfIAsBEgdwq/5vP4SJIpwxzvQOqZYMDgV+04LgPeT6fEK+n2Tk
         c3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gyNVCFkaWNsKBaoIpibBhspi5hxPuuG/Dvrr/wS3a7I=;
        b=SE2W88JLUVVTc+ClC8M5MSSKQhEx2RVcOTTuAL6ECUlHqVw1Yp1Ga58kUM1L2zTrKO
         ku9+YAE0d3f98J4xij8s9TERrcBU6JQ4/IDwyT7diammqU5DI1MyFYl8VRJu+JEwoe5L
         TZsC0SnwK5Q75V53+ZZ8t55TEQp8ODjfAc/clRKN+cpb9aNZ7XtwANDvjUbCGUuLd6Qp
         0miy6deEddFBKAMM7Oi4Qq52hM6XP5ElVKdHByikGVBQ0x442tClOrXZMRKv+lHPguqr
         0g3P4MhIoEe1NYZnrtqxlt+M5qnOQpxxgqARvpZpFEKVukxKU1Oe+ogv/iRCvSq5Sl99
         xPhg==
X-Gm-Message-State: ACgBeo0plJ/hcXCZEOSqf3YLCLVKjiqz1k/FLjigUo33yvx5tjZlDLrC
        47lQy9/h1UniMKue1JQLByZxGg==
X-Google-Smtp-Source: AA6agR5MpbukT/Tca+4lJmUDLkrqlKDBqgbUDBrUrfiqS8yHyVFbox6z5ZZ4tGsdTDAnNdH/MCg4zg==
X-Received: by 2002:a05:6512:1312:b0:492:e14d:54d4 with SMTP id x18-20020a056512131200b00492e14d54d4mr10205963lfu.469.1662045347897;
        Thu, 01 Sep 2022 08:15:47 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h1-20020a05651c124100b0026181a42284sm2059267ljh.88.2022.09.01.08.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:15:47 -0700 (PDT)
Message-ID: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
Date:   Thu, 1 Sep 2022 18:15:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 18:12, Russell King (Oracle) wrote:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +        - apple,t8103-smc
>>
>> You miss two spaces of indentation on this level.
> 
> Should that be picked up by the dt checker?

I think yamllint complains about it. It is not a hard-dependency, so
maybe you don't have it installed.

> 
>>> +        - apple,t8112-smc
>>> +        - apple,t6000-smc
>>
>> Bring some order here - either alphabetical or by date of release (as in
>> other Apple schemas). I think t6000 was before t8112, so it's none of
>> that orders.
> 
> Ok.
> 
>>> +      - const: apple,smc
>>> +
>>> +  reg:
>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
>>
>> You need constraints for size/order, so in this context list with
>> described items.
> 
> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> objected to it.

One way:
reg:
  items:
    - description: SMC area
    - description: SRAM area

but actually this is very similar what you wrote for reg-names - kind of
obvious, so easier way:

reg:
  maxItems: 2


> 
>>> +  reg-names:
>>> +    items:
>>> +      - const: smc
>>> +      - const: sram
>>> +
>>> +  mboxes:
>>> +    description:
>>> +      A phandle to the mailbox channel
>>
>> Missing maxItems
> 
> Ok. Would be helpful if the dt checker identified that.

Patches are welcomed :)

Best regards,
Krzysztof
