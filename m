Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8781E68155
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2019 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbfGNVmC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Jul 2019 17:42:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45631 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbfGNVmB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jul 2019 17:42:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so14112568lje.12;
        Sun, 14 Jul 2019 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A3OYivNwUGHYOSxix42WhhjLsPNywH0YEPeMJekZJ6E=;
        b=g6KCcs9sN6lkHPEl+C6SGXrUseBxjgYpoKWZGD8zFz8jRohfB4D8n2ctU/wJY51H5q
         uQibLj0cGWeUPl98B7JKR4CztJwwuDyE9tsHq7XDawzsZ+dSJHiXTJQJN5N0Lq+oloT5
         KUL7XijFK785yi9gbhAXmuge9bwO+BflbYNOcOY1MNTFiyv5YQp2LfHBOCgDZxzTHPn/
         xpbA/3hX7xJQQblD1saufJhh0s6j1JhAmeil6nHC5BYjCiopmArM+0/becVm3p7Y2ILq
         U3ZXMk/lNAjkvTAxN312yHUvD6Ztjwkw+IXFDzna9jSkJLXOYOAv7uTo+v+S5/ZcX+NQ
         q5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A3OYivNwUGHYOSxix42WhhjLsPNywH0YEPeMJekZJ6E=;
        b=n4AT9UnzlMAqGeILfd0PUWSKwG/kTqidvMBA0SPWef6LC+CBsQ6OtC55bQ9yNxp+jF
         vbkIy7ruBU7iL0cRU9HGhk/MdtDzVL+4GnEecowVtwfLki9uU1VNfb+iCCJTfhGv649y
         Mko6Na65dojI6yuxCo7Yo0O3XEK64hwR0HL43hZQGJNu871Vmfh9nlTtL/al7BeiuBIy
         UjbYtm9nFP08yjcYbvBZrazPRU7YMjB2wAYFOaFWr6opG2XdsubHbrAVmtQQGUgZdipg
         YQ1i6+eGzfT42bo27EaW4u9PT/P2ViEAo7w11ajkEwkuN/q0Erj4aOsXfzYw8zOz7qEH
         Pn8Q==
X-Gm-Message-State: APjAAAWuGslfD9vZ/V4Ni6h8RphegeoF6Qm0ddgpwkqeJdWE1xD1GFMB
        LFj23UDaFDFY4w31ns4b6PHaf0TV
X-Google-Smtp-Source: APXvYqzxHKe/eVV/wzCEUknf2UJgEROtblGr1hgbk1WhEjuuEfCTVKoQIiLXy9ri1qWdjAYtkZv5gQ==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr12289841ljh.43.1563140519056;
        Sun, 14 Jul 2019 14:41:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id b192sm2025060lfg.75.2019.07.14.14.41.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jul 2019 14:41:58 -0700 (PDT)
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
 <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
 <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
 <66b5e81b-d468-e2aa-7336-3d4854c234ab@gmail.com>
 <db7ac8e6-bfad-bc60-b46e-d886025872e4@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <23f10791-3fff-0e94-2798-6f38a27745d1@gmail.com>
Date:   Mon, 15 Jul 2019 00:41:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <db7ac8e6-bfad-bc60-b46e-d886025872e4@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

13.07.2019 8:31, Sowjanya Komatineni пишет:
> 
> On 7/4/19 3:40 AM, Dmitry Osipenko wrote:
>> 04.07.2019 10:31, Linus Walleij пишет:
>>> On Sat, Jun 29, 2019 at 5:58 PM Dmitry Osipenko <digetx@gmail.com>
>>> wrote:
>>>
>>>> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it
>>>> okay that pinctrl
>>>> will be resumed after GPIO? Shouldn't a proper pin-muxing be
>>>> selected at first?
>>> Thierry sent some initial patches about this I think. We need to use
>>> device links for this to work properly so he adds support for
>>> linking the pinctrl and GPIO devices through the ranges.
>>>
>>> For links between pin control handles and their consumers, see also:
>>> 036f394dd77f pinctrl: Enable device link creation for pin control
>>> c6045b4e3cad pinctrl: stmfx: enable links creations
>>> 489b64d66325 pinctrl: stm32: Add links to consumers
>>>
>>> I am using STM32 as guinea pig for this, consider adding links also
>>> from the Tegra pinctrl. I might simply make these pinctrl consumer
>>> to producer links default because I think it makes a lot sense.
>> IIUC, currently the plan is to resume pinctrl *after* GPIO for
>> Tegra210 [1]. But this
>> contradicts to what was traditionally done for older Tegras where
>> pinctrl was always
>> resumed first and apparently it won't work well for the GPIO ranges as
>> well. I think this
>> and the other patchsets related to suspend-resume still need some more
>> thought.
>>
>> [1] https://patchwork.kernel.org/patch/11012077/
> 
> Park bit was introduced from Tegra210 onwards and during suspend/resume,
> requirement of gpio restore prior to pinctrl restore is not required for
> prior Tegra210.
> 
> Also currently pinctrl suspend/resume implementation for prior Tegra210
> is not yet upstreamed but having gpio restore prior to pinmux during
> suspend/resume should not cause any issue for prior tegra's as well as
> gpio resume restores pins back to same gpio config as they were during
> suspend entry.
> 

Okay!
