Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E7D41DAB5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 15:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350471AbhI3NKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 09:10:22 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38826
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350654AbhI3NKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 09:10:21 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 28B0A402C9
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633007317;
        bh=hUl4AzMPgOLZrORvQmrSxH7LjjpDiFvnLVFli7UcmE4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=df4sY7RK1qm0xtJ3qL4YAUHP69jfKR7mLneGD0JJPLheAa2QENb5UxaRbjRb5Vdjw
         a34pn1G/0f8UKJi/bViWLwY2VNiNcyHCXmKLrOaAb7RZwY7QV3bJa9KMOrIw3YrJFL
         qazzbHphc1NHQyhRSD4eQ4p2EM16o0dagOp1Pln1ZBaq+V+X6Ql6UczIIw5kzuaJ3D
         I9fz/HkyPN8sAFpKe4gnHwdMBAcvs4reFst5/YGrCpWm8UGF8ykhgYO6oAbBx0HB8s
         a6jHBUg9ybom4/Rd0qzPUJQ3D5sNQ9nJWg9vUStYso4IQzv0RXyCIuRGNVc9pbB6QV
         dGV9NDwwYbYhQ==
Received: by mail-wr1-f71.google.com with SMTP id r21-20020adfa155000000b001608162e16dso1084874wrr.15
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUl4AzMPgOLZrORvQmrSxH7LjjpDiFvnLVFli7UcmE4=;
        b=Vyo0PjvLouqU12VroIDVyzdJnTPSPA8ZWMQY5tofue7uv0zpkNHtLtDKg4wxwaJwYI
         GEskV9j20ujAIrBW96l4LSAIKSjLXEoaWkVynlHzMyDGAS+aw3ROGVzMcgYNQO+3iKYJ
         CcHIwfg3paaD3meOsH59DgCQvRJV6kDBNT9pwutUwZc58T3u2SWxTQnZbZrbNfqNx2KJ
         NmJkRkRpOK0PJfKS1xXsHCtA7UxSQEumzlMDtZnPVcUa5PZr0qUT4GzbKlxk7Ucl2NHp
         0FlYV8CNiuown/Wy883WKh13TmA8nveAEaI27p1qqKy/+JHgHRcaI/UfhLqp/xOyb3hF
         fDhg==
X-Gm-Message-State: AOAM530gJxNT0uo8DL4auJeCaSAYnNg1v5V54Szx8B+K8e0rMytHLnXJ
        mHyn7X9sXNj2KoBnept+R7ugixhnYQt3ytnI3pAURn5COwsDdpEtAHYrUwGVGas6mvp7jordL8O
        IeXTqiQgP9BOPY14Zs70lwd8jcgiz4Fzw89Qpkyw=
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr5968001lfd.242.1633007305736;
        Thu, 30 Sep 2021 06:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjm3vd0EFvqL7ckfqAQvq9Lo79q9lkx+VOJUC5cK4B1tRx3+/dBYuyWUn8tO852nNIwX6f3w==
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr5967946lfd.242.1633007305455;
        Thu, 30 Sep 2021 06:08:25 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id r3sm367245lfc.131.2021.09.30.06.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 06:08:24 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
 <YVWwBz8jrznqXah4@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com>
Date:   Thu, 30 Sep 2021 15:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWwBz8jrznqXah4@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/09/2021 14:39, Lee Jones wrote:
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> On 30/09/2021 11:23, Lee Jones wrote:
>>> [0] Full disclosure: part of my role at Linaro is to keep the Android
>>> kernel running as close to Mainline as possible and encourage/push the
>>> upstream-first mantra, hence my involvement with this and other sets.
>>> I assure you all intentions are good and honourable.  If you haven't
>>> already seen it, please see Todd's most recent update on the goals and
>>> status of GKI:
>>>
>>>   Article: https://tinyurl.com/saaen3sp
>>>   Video:   https://youtu.be/O_lCFGinFPM
>>>
>>
>> Side topic, why this patchset is in your scope or Will's/Google's scope?
>> Just drop it from Android main kernel, it will not be your problem. I
>> mean, really, you don't need this patchset in your tree at all. The only
>> platform which needs it, the only platform which will loose something
>> will be one specific vendor. Therefore this will be an incentive for
>> them to join both discussions and upstream development. :)
> 
> How would they fix this besides upstreaming support for unreleased
> work-in-progress H/W?
> 
> Haven't I explained this several times already? :)

Either that way or the same as Will's doing but that's not my question.
I understand you flush the queue of your GKI patches to be closer to
upstream. Reduce the backlog/burden. you can achieve your goal by simply
dropping such patch and making it not your problem. :)


Best regards,
Krzysztof
