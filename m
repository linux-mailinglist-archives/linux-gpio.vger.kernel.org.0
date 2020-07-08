Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003F021837F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgGHJYX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHJYW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:24:22 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34863C08C5DC;
        Wed,  8 Jul 2020 02:24:22 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y13so26444580lfe.9;
        Wed, 08 Jul 2020 02:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lYLALftbbaQGDGQ4oQhMNUUQUOfek5lRcVRjkuKdTrA=;
        b=sYYeGlJ2kC4wRWadEnOsdLVLgAVucuP6kKJIkLigv2jxcGBNt/IgDVdey4LdbU81ac
         SysXqvh5kKC0gb2Zll29v6bxvr7vMXLluwggwr3qufh4qUGQCqaUWEM2JpUQs1uZrcmk
         2VwZqpWSVqyzARCvEhYNwBm+IOHPY1FrYoDcLo5+NN4anJIME7bcrvxh8H+UA5Y+NjyP
         lO4x2JfrsGgh3YIMwl6+sG/iTtNMNdCXrwP7LJwSsyYOw4onW9OyhV254b9ZUIUlPbp1
         3X7XJKxca7k3CrX88J7UYV/r6g9AIAyAfkgzlUV6gDC3tQuoxvpzD895H9M5qxQtTl6X
         i/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lYLALftbbaQGDGQ4oQhMNUUQUOfek5lRcVRjkuKdTrA=;
        b=eFP88LOVclSoG2XJiozRzsSP10wdshLvfCFG4J7OGJZa8ZvjMUQp5DcjYTyO6u5rFg
         dgKC1J+bwkPLQJp0dZsS+qXECw6GVCinohESAFcBUIzXg41OuSwwqSFRS8eZxCpirgYh
         VvMbCISRi+Va6R8krFFAWuJjk58lyru6DkrM/R0sXnwl/yWS1ObIeRwTI6+lOVRx6Tv1
         Zl0x/tFGERTNXmdmfN5hNQ4LLHER4u+V7Eq7qmKqf8heom8Ueu9IG5S3PHxQcRLTG8GT
         TsIPAEyjUoNuEP5fbOxdwwV2zeJFRkUfY3QoP0MS+95en8c7AfR+wIDCDkottb9b1X3j
         DKfw==
X-Gm-Message-State: AOAM531zHelyTj2B2uDvXh5XspWgTcb7QDBhTfHvzcYRDknSG38ynk8g
        m79pLOGkaJlkoMlpGtiDy8+LTtAm
X-Google-Smtp-Source: ABdhPJz4YTE9aTWCU8kxIn8SD7jDy4/H2vk0ZHjetWPH6HDT81VoGJgghIr8zluUMuMVKQ0FA+3Z+g==
X-Received: by 2002:ac2:521a:: with SMTP id a26mr35148791lfl.192.1594200259811;
        Wed, 08 Jul 2020 02:24:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id x17sm10195475lfe.44.2020.07.08.02.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 02:24:19 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] gpio: max77620: Move variable declaration
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-6-digetx@gmail.com>
 <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <204bc417-02cf-1b8f-da99-a598056ff7e4@gmail.com>
Date:   Wed, 8 Jul 2020 12:24:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 11:47, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Let's move the virq variable declaration to a top-level scope just to
>> make the code a bit more visually appealing.
> 
> To me it sounds like unneeded churn, but it's up to maintainers.
> 

I agree that this is an unnecessary change, but I couldn't resist :)
Alright, I'll skip the patches 3-5 in the v2. Thank you very much for
the review!
