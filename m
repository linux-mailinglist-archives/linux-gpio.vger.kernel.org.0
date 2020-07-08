Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58973218E5F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 19:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgGHRgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 13:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgGHRgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 13:36:00 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E49BC061A0B;
        Wed,  8 Jul 2020 10:35:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t9so27337677lfl.5;
        Wed, 08 Jul 2020 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0go/Ywd9NLu2fQFwy7ITgscW8Fvhwb0kSSx94KkN6qQ=;
        b=AQSJPXvAehcaC6E4s4aEzDy10L+p17B130aW8NNx4YZdGEkzM1Hm7TRl1HCmco1kVW
         oeLIBgPLnbk2C21kAmouftX+4+gaDSSwAo0BnwkRe3yzRFZsTOsSRxzLGbMTUYxpgXts
         JMV8H4HQ4soaV9okb3GTZP9Nt2gQvuGzWuNxhwuGpOoLwJ2PH+5Yl1eu+w+M/lZBeSmr
         HPzcdV/8B8/8QAeW27HL+bSXhLQ3haKjhWYMSupwIYZpABjs4O1Wh6T2lABRxl+JObao
         i8lta6o8p6v1RKWxE6yO2pmtietemN+jGZp58K2kloMS1D8WQFNuGfT+Rqa63ai9t+M6
         osnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0go/Ywd9NLu2fQFwy7ITgscW8Fvhwb0kSSx94KkN6qQ=;
        b=Ns/omrmLfaGblZYZXd9Mp0h9E+h4U9QBuc5MJNALzzc+hi+iISKSBjjwTouA015jln
         NEWL/Iz3tG118Ii1+4PZiELVGIjSyuXyt7gatuDzXS14FRRSdIrmte03Q4iY5zQOQMCP
         dq3x9QgSZ4twZWy5Gs4WnBvPsQ2nkExHPG6GI0rJzL4WvMO+NO/CAQqxtvis+60JU1wQ
         ojcf7vRZr75u41JxBY2POzBONv1bCDAksYo13lfAVoIMEMog8/1B4XPJCsaXXRkDIt73
         g5r82QSJuRYtwpUtvM9uzL3mWYErybKGMQrQ2KT8mCDI683ROpwDKpMuiOoRP/K5yKY6
         z5KA==
X-Gm-Message-State: AOAM532/1DoxYAShwv5hvcyBq/r1L1UtUcDukwtPG4Ts8UKF5wrysBfp
        72ciP9Jd9U64tEaVSL6U/Rr7V5w6
X-Google-Smtp-Source: ABdhPJx2dKgAODQ81t/pTzKZAGIlcurXRdTe/cXHYFlicjssRadZkxC98kXpYUjJhWiF8cPtkOd82w==
X-Received: by 2002:a19:8a07:: with SMTP id m7mr37060035lfd.31.1594229757359;
        Wed, 08 Jul 2020 10:35:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id n10sm141266lfb.82.2020.07.08.10.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 10:35:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200708155834.19762-1-digetx@gmail.com>
 <20200708155834.19762-2-digetx@gmail.com>
 <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2f61f759-81fc-c429-8181-508368c4f091@gmail.com>
Date:   Wed, 8 Jul 2020 20:35:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 19:58, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> I noticed on Nexus 7 that after rebooting from downstream kernel to
>> upstream, the GPIO interrupt is triggering non-stop despite of interrupts
> 
> despite interrupts
> 
>> being disabled for all of GPIOs. This happens because Nexus 7 uses a
>> soft-reboot, meaning that bootloader should take care of resetting
>> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
> 
> but the bootloader
> 
> As a result

Thanks!

>> may be left ON at a boot time. Let's mask all GPIO interrupts at the
>> driver's initialization time in order to resolve the issue.
> 
> ...
> 
>>         mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>>         mgpio->gpio_chip.can_sleep = 1;
>>         mgpio->gpio_chip.base = -1;
>> +       mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
> 
> Now this seems a bit awkward. Perhaps you need first to switch to use
> GPIO IRQ chip structure?
> It's also in the TODO of the GPIO subsystem ;-)

Alright, I'll try to switch it to use the GPIO IRQ chip struct in v3!

> ...
> 
>>  #ifdef CONFIG_OF_GPIO
>>         mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>>  #endif
> 
> This seems to be done by GPIO library.

Indeed!

> Also point to improve: don't shadow error from platform_get_irq().
> 

Good catch!
