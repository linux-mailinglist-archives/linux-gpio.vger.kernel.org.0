Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802F6219E0B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 12:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgGIKia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 06:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgGIKia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 06:38:30 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB83C061A0B;
        Thu,  9 Jul 2020 03:38:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y13so854228lfe.9;
        Thu, 09 Jul 2020 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b3nvtrFoAaXSkUPmIflmEsQDIojlyJCetyOU5B6Jdkg=;
        b=AyxM2Hq4isSQgbRSa96E0ZX8J8YHfxYDufGkRFsRULapTaNBLKd7Y4LAd+Bp1rwap5
         KAYWi72BHe47/GdliDuMBlZNXQu4cHrACIbjX1xBefZ4PQp52W5TR+m+yKbKXZ6XpFlc
         PGO4yx7gkZITrIudBkMnTGalsgr34guYn2h/z8rMeUBbOFJHHj6y0YF9D7NLHyjhJeVO
         t1a8cH09ectOXb9XMy24snbB98PRwqnOSCQMbqlVJY8/1R51ULQG/dL4Nub0Sh/Hbonm
         noYG+JZvCVv5U7lHhd5H5KQGefXecrJX0YkGWWeHqloJK8LqFlEEA2wFO+tbpu9McP1h
         +ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b3nvtrFoAaXSkUPmIflmEsQDIojlyJCetyOU5B6Jdkg=;
        b=EBiWuuDJ8GtZpk4BD0BYpXY9nCpwWNJtDClUhGvpQ/eRi+7GOVsQwRpQCEdCMwQtn0
         Lu1a8e/dYd41/RcLx2AJm2fk8C91TDBUPwBnAR172ZlXXepeAm130Innwn6Ek58092AK
         tsELTtwZpsKDNDOgmd8C1zmi7Vsw71zuB2dXGdezg/1IThk/nLvei2ubF7l63qnEOSWq
         23TrjMxVs0asYUWMm9nTnrOD2+h+rozfK30R2N3ODv8f7qxb/rMGEpxowfOr+/zBvJfb
         m7lZ8U4slhcIWOQi/pOgxcrJyrEztwko0keLiHct6MDoRNVLLGac5VmUDjJeRivdFeR+
         ybOg==
X-Gm-Message-State: AOAM5337o0iMf0AH7rmIBWf03OId+rJyP3EFRmiEuL8nKA4h13YFkE4z
        9r2iVoc+8thuaarUQL2CseaZGYif
X-Google-Smtp-Source: ABdhPJxST9mVM+8Ql63IDWlaUT39N2nUOtf0lOm6EvnbbfgEPInr6qwSWYX1MW0vNetzORgAXD0ycw==
X-Received: by 2002:a05:6512:52a:: with SMTP id o10mr39253739lfc.137.1594291108065;
        Thu, 09 Jul 2020 03:38:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id s12sm659627ljd.116.2020.07.09.03.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:38:27 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-4-digetx@gmail.com>
 <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com>
 <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
 <CAHp75Vd89QpwaGvkpzG+pxnLd8S2guPCARLW5xPwhxXL8ZRfFw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ff7985a4-58be-b466-62c2-abce9ae1c0f0@gmail.com>
Date:   Thu, 9 Jul 2020 13:38:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd89QpwaGvkpzG+pxnLd8S2guPCARLW5xPwhxXL8ZRfFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

09.07.2020 12:07, Andy Shevchenko пишет:
> On Thu, Jul 9, 2020 at 12:44 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 08.07.2020 23:57, Andy Shevchenko пишет:
>>> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx@gmail.com
>>> <mailto:digetx@gmail.com>> wrote:
> 
> ...
> 
>>> I gave a second look and I think my suggestion is wrong. Here is an
>>> interesting propagation of the parent device node to its grand son,
>>> leaving son’s one untouched. Original code has intentions to do that way.
>>
>> The [1] says that gpio_chip.parent should point at the "device providing
>> the GPIOs".
> 
> Yes, physical device I believe.
> 
>> That's the pdev->dev.parent in the case of this driver.
>> MAX77620 is an MFD PMIC device that has virtual sub-devices like GPIO
>> controller, PINCTRL and RTC. The MFD is the parent device that provides
>> the GPIOs [2].
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L276
>>
>> [2]
>> https://elixir.bootlin.com/linux/v5.8-rc3/source/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi#L48
>>
>> I think the old code was wrong and this patch is correct, please correct
>> me if I'm missing something.
> 
> Hmm... I have checked through GPIO drivers I have knowledge of / care
> about and PMIC ones do like you suggested in this patch, the rest
> (which are instantiated from MFD) take a virtual platform device.
> 
> Looking at DT excerpt I think you're rather right than wrong, so I
> leave it to you and maintainers.
> Thanks!

Okay, waiting for the maintainers then :)

Thank you very much for the review!
