Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB4624470
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 15:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKJOg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKJOgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 09:36:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACE21F2CF
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 06:36:23 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id a29so3588301lfj.9
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A69txW9iggSNkdP/nQ5U6dpUNL+jGVuughye7m5si+I=;
        b=TzwBwyFSBp6qkaEkfafIvqSCCZPx5YULBwW9S0b3J+5SfWHYxCnTH8VAaxfWnIkchh
         gT67jqTe4iLpzCjG/AKLmOXon91u5uSHKjC3z57Gf/S5hfoETUMdcfm0Y55Uz7enW7uL
         TnttORDMbW77Al0vidB2llkLkXhczLLl4dp4YI+vVmlo01D1L1RtuV13NP2m30sOCzZo
         0rmMoJyeGSdP05w9GvOZvx9ebhTc7m+TfQGXHQq170yprWRSh8X+jguYFvESGPIX40w5
         MytFPR+/jCEWllShm9nJ4bw4dabv5OdF1puYb4T7ma8aKfUsYdfkv7CpJtb5oDL01OOk
         hlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A69txW9iggSNkdP/nQ5U6dpUNL+jGVuughye7m5si+I=;
        b=pVyrQagvWQX/2Xlni39LfmUogQYUpQa2DJ4al8HTYpqgUPoFdr9c28uiQ1v+FEPPaz
         17PhVjtgD6Qp5BannRBfBhlzPRbzApv6pHJKdzND+TaHf8Yep3zovFS15UcQofGE0hiJ
         RrSAmYmAj7MIxKy44qRUEHNXkZy6KU8EbuN3v5u2QjxGfNjc3Ci/RD7ZtdSWiolou6HX
         3nNwybBDa2hLwQdd6d5n4Ef1VxXRqkErMionAcmu1vxHKa3v01C5SoFdGbeSz5CoFjad
         VlH9yHMTaLVfJGoD5Ie6KA/bIEcrGs6AGqqZIRKiRRZSzeW25ZXC5VsbSw4Qw0OBCmzz
         SBZg==
X-Gm-Message-State: ACrzQf2mP2Q2/2AC88nz0D3bv+4guHhKhMsm5f4fNNPMAUvEoZSsbiud
        Wtrc5NuWxEM2/WDNNHoy5VXbIg==
X-Google-Smtp-Source: AMsMyM7KGIkty4xZO/9jQRsXxH0v5rDOnPRRVCHh0SQ4GWyXcX+Zd6lGgflOmMs/QVCB2FziHhNHzw==
X-Received: by 2002:a05:6512:210b:b0:4a2:361d:da22 with SMTP id q11-20020a056512210b00b004a2361dda22mr20829878lfr.561.1668090981735;
        Thu, 10 Nov 2022 06:36:21 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id i24-20020a2ea238000000b002770d98151dsm2746981ljm.122.2022.11.10.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:36:19 -0800 (PST)
Message-ID: <392bec2d-c4aa-f87d-5250-c62760f808e2@linaro.org>
Date:   Thu, 10 Nov 2022 15:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
 <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
 <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
 <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
 <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
 <Y20Je7quui2iohNR@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y20Je7quui2iohNR@shell.armlinux.org.uk>
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

On 10/11/2022 15:23, Russell King (Oracle) wrote:
>>>
>>> Make up your bloody minds and stop pissing me about. This is why I've
>>> given up trying to get this in.
>>
>> I don't think it is constructive to discuss this with you anymore.
>>
>>>
>>> Getting a consistent message would be nice, but it seems impossible.
>>>
>>
> 
> In which case you CLEARLY didn't read the cover message to that two
> patch series.

I have every day 100-200 new patches, so not every cover letter gets
enough attention. Your did not say this is part of MFD, just mentioned
some build dependency.

Anyway, job of submitter is to make the patch and its context readable
to the reviewers.

There is literally nothing about including in parent MFD node in DT.
Just take a look:

https://lore.kernel.org/all/Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk/

Or maybe you refer to this:
"previously posted before the last merge window."
Yes, so I will go through hundreds of emails from a week or months to
satisfy you?

"this driver is dependent on the
Apple SMC driver in order to be buildable and usable."

The only hint... it's about driver, not MFD. Make it obvious for
readers, not obvious for you.

"It is expected
that this Apple SMC driver will be merged via Lee's MFD tree."

Maybe there is dependency, maybe not, who the heck knows.

> Again, YOU are giving contradictory information.

Best regards,
Krzysztof

