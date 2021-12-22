Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA4247D1B2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 13:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236680AbhLVMav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 07:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhLVMau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 07:30:50 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5395AC061574;
        Wed, 22 Dec 2021 04:30:50 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id bn20so3529048ljb.8;
        Wed, 22 Dec 2021 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=iIr26KyOkmmARDAmr9R+iY9FmSdwEq1NYoaAlGQMEtw=;
        b=i7DQBPfsmEqnYdLwHTeeEx5XHDLXfNzkfnvrQXRcnEaAO9LC5Vlz2cpoxrFSm2KboX
         sYLok2WBFdXT9HyqHx8UxNgIMcoLPYrVs4RyaiBl6ujescdz9tlO+Sd9MkeOFyVbGKsa
         WRgSwUQKlyQac6gLMOL6dxIH2JkiVCE753kALJEEyKDt7E7/I1A3H144CwE5EX3H3T7r
         i1JbAGUKGqk7wqXp/HOMz6D7fOdWpuWCgMZGBoak6KFMHz1XVfNq14WHKMT5C4l/aNF1
         EJAJ8HzRqmfzHXqIVjYtthS43wi3E1KeP9GAG2EHmLjvDgyZSb+sulZPMvLdHL2Y59WQ
         ZZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iIr26KyOkmmARDAmr9R+iY9FmSdwEq1NYoaAlGQMEtw=;
        b=WJqDbVxr/KkfXQt41E5/ZED+4TNcUBgRS3Bui1LDzyUerofGJ98iVkWhWnppDWw07i
         kHpBQ6/53hMQ/dyjPhOkY513KHMu8itbkDxtiD3q1I38kei8GgOrRzZitB08HgmfrhWK
         qxfNihds8axImTBj5aQBxNgnt+R/AWOkJBFlrOsi5Mo/z+WwCFUU7kKSUqG8VSXLELxE
         L6uYuXWn31P23OlLBqniILe1Kq6AODhIKPQ4KqE1gAh13A2YE3eOJBwUxjrsorhsHY3X
         SIdIrC+/NIHvlK70+0SlvSjOhUmvvb0TqsWABZGmT4HNpzE6qtKpihjCYRhXwR8cJJQY
         8bHA==
X-Gm-Message-State: AOAM532pfYklo5IIpmenDvHgwcdJ88kO9jhluiw3jlHuqTfPGwUkmWZb
        uVWtfOpfzhp1EtsYIju1oWCpJ225FaA=
X-Google-Smtp-Source: ABdhPJxADldgDEkA4BmBKjw8XrAAWy/8HuLq2JDLHbGS63MUo/Fr72ZIryVT2cHHMjzV6F7lVKpzZw==
X-Received: by 2002:a05:651c:1988:: with SMTP id bx8mr1964070ljb.22.1640176248468;
        Wed, 22 Dec 2021 04:30:48 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id q2sm202935lfr.64.2021.12.22.04.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 04:30:48 -0800 (PST)
Message-ID: <daa0eaf5-952f-df7a-b8a7-08f7d34a8d58@gmail.com>
Date:   Wed, 22 Dec 2021 13:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211222111108.13260-1-zajec5@gmail.com>
 <20211222111108.13260-2-zajec5@gmail.com>
 <CAHp75VcdXR=vZ3=UX+GKbA1hMvQ=4rKJyPkg+BQskepL9SCSyw@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAHp75VcdXR=vZ3=UX+GKbA1hMvQ=4rKJyPkg+BQskepL9SCSyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22.12.2021 13:13, Andy Shevchenko wrote:
> On Wed, Dec 22, 2021 at 1:11 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> BCM4908 has its own pins layout so it needs a custom binding and a Linux
>> driver.
> 
> ...
> 
>> V2: Formatting fixes
>>      Kconfig fix
>>      Cleanup of #include-s
>>      Use devm_kasprintf_strarray()
> 
> Thanks, but it seems there are unsettled down points as per v1.
> Can you comment on them there?

Those remaining comments are a matter of personal taste & details of
personal coding style. We don't have defined rules for such details.

If developer submitted code that matches *defined* rules and is fine to
read I don't see why we should enforce someone's coding style. We may
easily get into pointless and time wasting argues between multiple
developers.

Empty line after one-line comment isn't against rules and checkpatch.pl
doesn't complain about it.

I've never heard of rule of sorting #include-s from the most generic to
the most particular one. I don't even know how to meter that. Actually
coding-style.rst suggests #include-s should be sorted but without
specifying how. My first guess is alphabetical order.

If you think some extra coding style should be enforced for Linux code
please kindly update coding-style.rst and checkpatch.pl so that:

1. We have clear rules
2. We keep code consistent across subsystems
3. It can be automatically verified
4. There are not more argues about what's the preferred format

As I pointed out we have over 1000 examples of empty line above
module_platform_driver() so clearly what you describe as common sense
isn't clear for all developers.
