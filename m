Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61592625463
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 08:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiKKHXm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 02:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiKKHXm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 02:23:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033C2657D7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:23:41 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso2609867wmo.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hCt+s7KzrEZnZzX/V6UkrovCzttNU9klucFddcbEXQ=;
        b=LxuIejDcXyzNr5EimGzlNfhCNF4vXCRjWClWUruFy6JB5nHm8oZtztdWs7EqCLH8vN
         qHx6XJVB+/E5h22Otcbqct8N4Pur7GXxM7Wzu3EqVxH8AUJx4JA9oShrAEc3cPibEteI
         99kRC/6q3NhzvuEtx82iPsFXeWFwna0uVjgzpjTeptHbXe/a9Ch8/6+HlSyoW7emmquO
         SjfHT7kbVf2kSkUBytEfStFoI1njTRCFbBntUi46KD5VUVN0/mBbAkTf+7fXSO+Rt2gx
         JalYkHy465D0DhX38iWm9KFER9o8pW4xhN1AURm9naMI2f/AXm0L67GEexQlaCoX5Ker
         IV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hCt+s7KzrEZnZzX/V6UkrovCzttNU9klucFddcbEXQ=;
        b=O0N4jrniFRROBUs8+UWgchevoMGYQwEc0sB1mmhuaUMaqhHtcj9AvC2G12cfSgRe9/
         qS1a7X6wPg9MyIxD5EFYu0kimfq2C7pAedg0qVaEL/kvVPKsytOwa9fc7Gn4wNxGpgDC
         Ye7DdpaZ8j5J6Xz+dJ//ctxWZsYySpzayl8vp2M5dfcXcmB9ecuKYYVWJGzTSaYExqZn
         YoxRCpXxHtCB+hkWkeGrnkoAH8wRXmNKAukcHpimISW3tDdK/281dVx5ZUB8xDw9wbdU
         2XA71N1KnD0sAkxpYbSBclXOTmYcZl5cRM7rZYhkFXVgV666Leb0n+Z3ZzLf7jqOp0hH
         fHmQ==
X-Gm-Message-State: ANoB5pkbOzbw2pUwaGm54SaeN2YIIf8cs6r7BY3tInr0wzDx4T0sLjDa
        diew7ZEIPvEGEFjecDn9oenYzo2ByOM8jcRj
X-Google-Smtp-Source: AA0mqf62fb1OzdzRHyplikXG3IRVNe1wOO245/BagvYyII6v7QZWaLxR2HJgDscPbstPSsiGINkSBg==
X-Received: by 2002:a05:600c:4e50:b0:3cf:71b7:7a41 with SMTP id e16-20020a05600c4e5000b003cf71b77a41mr343647wmq.31.1668151419591;
        Thu, 10 Nov 2022 23:23:39 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id k5-20020adff5c5000000b0022e344a63c7sm1110093wrp.92.2022.11.10.23.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:23:39 -0800 (PST)
Message-ID: <9f7f922c-a904-d47a-de62-854e5e784424@linaro.org>
Date:   Fri, 11 Nov 2022 07:23:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 2/3] pinconf-generic: add pull up and pull down config
 with resistance
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-3-niyas.sait@linaro.org>
 <Y21cRkOwH/pmn5NP@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y21cRkOwH/pmn5NP@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ACPI Pull up and Pull down config also passes resistance values and 
looking at the existing PIN_CONFIG_BIAS_PULL_DOWN and 
PIN_CONFIG_BIAS_PULL_UP types I wasn't sure if it was designed to pass 
the extra resistance values.


On 10/11/2022 20:17, Andy Shevchenko wrote:
> On Thu, Nov 10, 2022 at 07:12:57PM +0000, Niyas Sait wrote:
>> pin configuration types have been extended to include a pull up
>> and pull down config with resistance in ohms.
> Why do we need this?
