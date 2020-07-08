Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158F421832B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGHJJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgGHJJ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:09:57 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC64C08C5DC;
        Wed,  8 Jul 2020 02:09:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d21so26409709lfb.6;
        Wed, 08 Jul 2020 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1gdtgViliRja9rqUjgZFjyZIZrgRR3jloFr5I8HG70w=;
        b=ip5z9I12KRzGsIweFPgXHt4rHPNxM7v+LKq8Ccfit6iua93R/o7sHR6SWiF9qT55KY
         baowHqHKjtCoRGaRBtiimXNPT1J6pAsMz+spGlVIPkukXDsipVn+EJyQ8COK3CpbqJdI
         W+LLAmdJyjl0xEmKT3KLEpu7F8mVdy8kVTRlcTbgUsYSemfG416FHVyUtuDVJ5XxTMZw
         FhHMRVDrZhjgubxxHAZQRlNzhNaLpLA6jteyr0zBE46YxU/fRn0Owbq+Dsi8/hkqkI6Z
         mc33llo0T1nPRa/RJ4ee+IufykHbgPdRsB0DshqH+2iIMzKc8KVgrgY+ck9P5/hKXLuY
         caZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1gdtgViliRja9rqUjgZFjyZIZrgRR3jloFr5I8HG70w=;
        b=SnVQAdq4xA5+PA0QRKDuBMlIM0X1ucY4CVBJuqfbsIn1MkrEFfFehTtwBx12dNDc78
         IlEwAQIvWJPE5P1wTA6BIprF0JzoQwUcBSpXwb8glDvb9D5qacfnn+IXZ65CWxHseYpK
         ED7yuvSRxJXx9d2+Ptsizbkg9zoIQmArsfStqNJpn3yrs/uQwEnJ7gz1IbSJEO3qkJ1D
         oJTkz0xaDUjDlCP5IjWGUaEprNRyWjAPRZgXIBx/7jmsQ6E9q84QGdILuplCRec6uR9a
         X5OpFx+kWQPMXRjTFELQlKE3bAlAGy4qobQLk6xfveC0c9UrlOl1aWi3Nye/wA/VwMXH
         Mp+Q==
X-Gm-Message-State: AOAM533l1o9n7iL4+ZVgt9T1DqZrLY/q3flepibe9bZXqKkbSsaR43HX
        +cj4bdJZiRFBhYfwJeKIR5/yaqWa
X-Google-Smtp-Source: ABdhPJwgl/YmckGYFZNlQjZ1UgVGe49toblQoK1n8mLTRkHQcw7zfygG5rxEVSkeKiZRjGLpkkm4Cw==
X-Received: by 2002:a19:4f11:: with SMTP id d17mr35562511lfb.2.1594199395461;
        Wed, 08 Jul 2020 02:09:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id o201sm10166793lff.8.2020.07.08.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 02:09:54 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
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
 <20200708082634.30191-2-digetx@gmail.com>
 <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
 <CAHp75VdTw87aOGqnjS-jukiHcMACG7-gDDhDWP6hikSLWpDebQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e9850c2d-43ea-9c07-19c6-f3e2e096e52a@gmail.com>
Date:   Wed, 8 Jul 2020 12:09:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdTw87aOGqnjS-jukiHcMACG7-gDDhDWP6hikSLWpDebQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 11:53, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:51 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
> ...
> 
>>> +       max77620_gpio_initialize(mgpio);
>>
>> I guess we have special callback for that, i.e.
>> https://elixir.bootlin.com/linux/v5.8-rc3/C/ident/init_hw.
> 
> Sorry, here is correct link
> 
> https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L212
> 

Indeed, I missed the init_hw(), thank you!
