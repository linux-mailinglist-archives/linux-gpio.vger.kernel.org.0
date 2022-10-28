Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB19611B9F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 22:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiJ1UhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 16:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJ1UhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 16:37:08 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4F622EE31
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 13:37:07 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id a27so918626qtw.10
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLhDGX+PrEvnm4Dlo2lfmgiA3MNJTPSJGxJWbaZR8W8=;
        b=dP4p4Ok2D32LJTsv+EjZxVrvDh1JmRlkNAmsuKZR7akxXFdrlkTqJLWv1S7zAi0TRe
         oMsD7dCt5jS2K7AH8aEJ+BvfgYbefW+KgGp9z+BKzh07aWvPulc/Dps+aMxq+EfxkNbT
         u9FeToJoRFTd0nWVeVpKJbAFsvnQ4hByiUJIYB40hT1xF1q5aiBn8s+kCdDBJg6Z0Lhr
         r7TN6Z0o5H9hRNWejPbhcpLo/TFiC5+hyBYkiAVuhF/PdZ39EW9sLF+M8Q90CVr3CVVG
         18rgJO3aOSiY69X9lDt7Nj2pvhLKatYocDrT6TK4/69H5kmjW08JkLz5LnInELBjsvXc
         Kakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLhDGX+PrEvnm4Dlo2lfmgiA3MNJTPSJGxJWbaZR8W8=;
        b=JY0VFVRYph4X1KVhR39Im9rOvMPoaFlihqynaMk8gFOgnK32zIZ3PHf6LlglTmjBN5
         Eb+WH2xJWC022kvMJjtXRmZYugPWvjiaB3e2ZzdD0qGAsUGQSGUkCX3/lK0DZQB1+6sh
         rUZlWci6911gdwetnUagSz1ffPxGapZP5Xc7OqJOCTh4npAiG3ibPw2dcssST9Kq2iUh
         qD6Q+qze5f0+Yv/U+PxwCkzNZvJ3KVd/hidgwuDj0VWd+9eXTqnGpG2/Ao7/VoOdYxKu
         1Dc9H1rutJS/4FnQeOIDD1I6C0SgtUyUjdmkervA33jD8Z5u6Z/0BL4aeoD2H2PT4y4V
         9LcA==
X-Gm-Message-State: ACrzQf2bFpF0l5PLRGRh9m3SKFEV8Z3DNC0lO6LQXsZy8vLRU0qiCIQU
        cfoSYx+gXZSJYbJru6WprdTeXw==
X-Google-Smtp-Source: AMsMyM5qKtdHZ8nexHN/YCSovC/f5dnkvPRDrUYXFOY9EAVNFTH5gMukdPnFsDXSX89IzH1T2mH09g==
X-Received: by 2002:ac8:7f07:0:b0:39c:c64d:852e with SMTP id f7-20020ac87f07000000b0039cc64d852emr1178683qtk.21.1666989426498;
        Fri, 28 Oct 2022 13:37:06 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h18-20020ac87d52000000b003998bb7b83asm2827619qtb.90.2022.10.28.13.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 13:37:05 -0700 (PDT)
Message-ID: <ebf10a8f-b2cb-b2d0-0742-1ab7e5d60172@linaro.org>
Date:   Fri, 28 Oct 2022 16:37:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org
References: <Y1vZprz7t1WRW3bz@shell.armlinux.org.uk>
 <E1ooPSs-00Hb5D-PE@rmk-PC.armlinux.org.uk>
 <Y1vvoc2x90HnG1E9@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y1vvoc2x90HnG1E9@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/10/2022 11:05, Russell King (Oracle) wrote:
> On Fri, Oct 28, 2022 at 02:32:02PM +0100, Russell King (Oracle) wrote:
>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>> ---
>>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 41 +++++++++++++++++++
> 
> Sorry, just realised I hadn't renamed this file. I'll do that for v3.
> Please review assuming I've made that change.

v3 is needed anyway for the tooling/automated checks.

> 
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>> new file mode 100644
>> index 000000000000..2bb8faa2c08c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple Mac System Management Controller GPIO
>> +
>> +maintainers:
>> +  - Hector Martin <marcan@marcan.st>
>> +
>> +description:
>> +  This describes the binding for the Apple Mac System Management Controller

Missing change. Drop "This describes the binding for". This is a
description of hardware.

Rest looks good.

>> +  GPIO block.
Best regards,
Krzysztof

