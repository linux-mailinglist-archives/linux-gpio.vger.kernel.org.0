Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949C6218365
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGHJT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHJT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:19:59 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD411C08C5DC;
        Wed,  8 Jul 2020 02:19:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r19so2249643ljn.12;
        Wed, 08 Jul 2020 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SZtBFfa0g+wGCizZuqzfHIkE+IhJtVPGPcDb8dmNUH4=;
        b=gzd1v4V7knWNgFBRr6zzbwe+D58eM4WpkJhFh7utHSNHmPnDfzMBFGO2Kq0Z/1XNGy
         I/IUHUR5emRfKDJI3/I1hAD2EYCsjmnHNwH+yi8Q9OaDoanVDSO8R+2l+ILbB54saNL+
         uwP5V8PgVpuIz0rxVgeEnc3KuwSh1ijqCtR89RU49M2EhDQZXG5fpNkx8JlZZFiJ9A8B
         lwH0h4bpK5s5pUtAH4bCCfZo2FGOmvlbHMjPXmeF/4aQNv8XyanWrHq6uIUjAUp4MXgJ
         fNtZz47Mzq7/tbqT2SbHJAKdAoAx9bQkuS4XiS1v4vNHw2gh3z5uEnpcnt96HlKZoRK2
         DQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SZtBFfa0g+wGCizZuqzfHIkE+IhJtVPGPcDb8dmNUH4=;
        b=KtvX2BQOlSG/M/OnhH56qwKYGAIVmxibC6+5ZUNQDtg5evWN2YVJXnR85j7kaoW7xA
         ss/p3/AsyxO4FdSHqwyznVhiESZyZNC6ceFBVwnTZ9HymgD1FgovZivg/MnecFM87jCw
         YhKsqWEz+LlU+CHpxcw6EuZ97rzL2QXfBUaokKUze2Vy/6DIQt9+tlP+2BsUlJvVaOZp
         Imh7n1hkR8uO37R7NqwC5LV0PKHppzTXvoc65+Vyhe6mVpMAtigWGqOaBIXPqMOsIpBJ
         tHu4IN99SY5u0Z9d/L7uD9cnI76CCGKWcF60bttESlAxW8OHyn3PEysmp7YXyg2lMeNQ
         qnuQ==
X-Gm-Message-State: AOAM532t3AEBEfZu9cBBT1YwGHtuQHkQv7XzJVA2CnB3hXtNzfA2HZhs
        zJHUfxt0UeTl/IAAKoKVNlKEJKxA
X-Google-Smtp-Source: ABdhPJzDYO14MBb/EW9m89T1TV8HCsncNStT1tGR7S7wCXYyH0gp8vJIhXk1LEDbyGjsPM1953qRdg==
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr1198970ljc.443.1594199997113;
        Wed, 08 Jul 2020 02:19:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id j17sm10177811lfk.31.2020.07.08.02.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 02:19:56 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
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
 <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
Date:   Wed, 8 Jul 2020 12:19:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 11:46, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Check whether GPIO IRQ is enabled before proceeding with handling the
>> interrupt request. The interrupt handler now returns IRQ_NONE if none
>> of interrupts were handled, which is usually a sign of a problem.
> 
> ...
> 
>> -       pending = value;
>> +       pending = value & gpio->irq_enb_mask;
> 
>> +       if (!pending)
>> +               return IRQ_NONE;
> 
> for_each_set_bit() should take care of it, no?

Do you mean that the handle_nested_irq() takes care of handling
unrequested interrupts? Actually, looks like it cares. Alright, I'll
drop this patch since it should be unnecessary. Thank you for the comment!

> (and probably return with IRQ_RETVAL() macro)
> 
>>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>>                 unsigned int virq;
> 

