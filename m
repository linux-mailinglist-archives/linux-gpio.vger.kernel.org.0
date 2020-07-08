Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A3621854C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgGHKyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGHKyv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:54:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9BDC08C5DC;
        Wed,  8 Jul 2020 03:54:50 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d21so26594993lfb.6;
        Wed, 08 Jul 2020 03:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=twagDEp7uXq8z35DJ39Z3HkBCRXMKE29CuddS5Pgx5o=;
        b=XChWUnKZ+z/Z5z1PK/1divkaicO/LV6npjMADhKRxPYqJytgHgUFLk/KIxgsQFO7Pd
         oDZ51RnSlis9BPZ5B2AVl6nR3gjYI+WDpp1em5WzYQLxnKHm2b2ZDEaky2Oz+Ft5Nmlw
         kKSZIb9kUQADUXgvjXOjFfZUjSlgGU4WZ6C2dG2qoFJZe+CTyi0268LStKihiJL0RnPn
         k8jsFmAw0ypOVa8rHnjMgAiMURDtfZbI8b/gE9yKXUxdiiAZyfU67/0ml/xC3E+ZX7VB
         PNlCqqSVMJn1BN6/T7BkDpA9o4nEd8eHorO8aB5gjAt0lIVlgpIiDMXouZjwpE3clTrM
         1BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=twagDEp7uXq8z35DJ39Z3HkBCRXMKE29CuddS5Pgx5o=;
        b=uMG9ko2B4i07aBnjm+xl8c/ye71nIDOxt+goDNgxWg+2NL02bFfUYlGKILzOiABMQY
         t8Tg+sVWlZZBz4xYTyFEHPoFKs7WonIw7ZQNYX95wvZiZ1jj6/QAJets9g+J7d/dK2JI
         Dy5CLtcsmD5bfnRTZ8/pgYUdSgcpmwJ3OrND8TvyP3RWvmnd0HY0BScbw4w/apfci9x/
         vNolZAa5SzLuBaX/MxKweMvWqZYhzqX0QozllY6uO6wVR36MWJ1HgZAC8+psFgnEWZ30
         b0/sc03+sX9Lu1ZwzSdZ6g94xf3tPdV2Yfk5E71/jNedAxtQz9Zeu71jBFVGqXJjrH1q
         heAg==
X-Gm-Message-State: AOAM532GdOIVRF98+hZdL1Lgk5/ZtbaLyZfIqvUUVv+HbEU9FCmms67a
        1iSo11VtOQqjBd+uMRjhZyfNQc6y
X-Google-Smtp-Source: ABdhPJyn246HkXwL6wJP8gCUOR9MyRwPQIe4JsLfHYYmrLKs5pX1SN7KzP2DXlB+WqQI0GrcHrPZUw==
X-Received: by 2002:a05:6512:3153:: with SMTP id s19mr23969454lfi.25.1594205689103;
        Wed, 08 Jul 2020 03:54:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id c14sm9868812lfb.69.2020.07.08.03.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 03:54:48 -0700 (PDT)
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
 <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
 <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d39caa8f-816c-5d4d-6f54-99baea3e0d5a@gmail.com>
Date:   Wed, 8 Jul 2020 13:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 13:11, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 12:19 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 08.07.2020 11:46, Andy Shevchenko пишет:
>>> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> Check whether GPIO IRQ is enabled before proceeding with handling the
>>>> interrupt request. The interrupt handler now returns IRQ_NONE if none
>>>> of interrupts were handled, which is usually a sign of a problem.
>>>
>>> ...
>>>
>>>> -       pending = value;
>>>> +       pending = value & gpio->irq_enb_mask;
>>>
>>>> +       if (!pending)
>>>> +               return IRQ_NONE;
>>>
>>> for_each_set_bit() should take care of it, no?
>>
>> Do you mean that the handle_nested_irq() takes care of handling
>> unrequested interrupts? Actually, looks like it cares. Alright, I'll
>> drop this patch since it should be unnecessary. Thank you for the comment!
> 
> I think it's still good to have reduced IRQs to handle by dropping not
> enabled ones, my comment was about the case when pending == 0. Sorry
> if it was unclear.

It should be unnecessary since we now see that the handle_nested_irq()
checks whether interrupt was requested and if it wasn't, then particular
GPIO interrupt will be treated as spurious [1]. The pending == 0
condition is an extreme case, I don't think that there is a need to
optimize it without any good reason.

[1] https://elixir.bootlin.com/linux/v5.8-rc3/source/kernel/irq/chip.c#L485

Hence it should be better to drop this patch.
