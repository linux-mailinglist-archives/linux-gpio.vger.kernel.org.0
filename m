Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E0E6D5BA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 22:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391496AbfGRU0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 16:26:16 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34425 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfGRU0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 16:26:16 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so12905585lfq.1;
        Thu, 18 Jul 2019 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w31kF+V/Pg3wOfRqeq+cX6WjQGIznpGqubrdnMQea4M=;
        b=d/KhGBFEn+mvcJNU3mO6VOCUuSspg8P4yd2FHyExdo4qXfDPdfaeuIingGcZxrMP8c
         TnyfNEMJwN0PKNs5Rls/m3XJivqqJGRdhnQ0xanjJNuRmXL5RDFd7Y/Q+s1cGg7MP7Ek
         811Vh8SyjjT7yB9mjqzx0JsKmdXp9lqzo9rYB7i9E21YMbIg4ySRx4ruLStqUCYz8Niq
         6obxoXHL7smeW1+q+trlxI+3oyhxUbenlLXJLlkYmzmf17JVqJwvPEb5hFDJn3gO5MfX
         +nMjbRyMUyqjURJR5SrHQEPD1WTRikbuJ5FtarswxiRhcHg1D1B002cOIW4D9xN/E3nU
         IJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w31kF+V/Pg3wOfRqeq+cX6WjQGIznpGqubrdnMQea4M=;
        b=ftsZkasiQ3ZXG5ekO5/aaYsxro5Hc34jEw4ZSxd5eHe7ma/Ktab6ZV9exoZBUB4Snj
         atj8b7JUeNxaSdpWWhC893z1GGlwsqOOrf1Y95kGVzmc1hE2eMcLR7mpM2urteQJV1v4
         LofXyKd7LdoVD4Ps3EJPSTF5SOSQI9C46AtyZUAqaF8ALct9WGeIjRPpSGAJDPxa8c/v
         HSrFjvFbCsfQxI730CvKyx0bAgk1tMneeSSQV00qy1if6BwErIbcwLmM+ZLv1UBllLih
         jJZxHFkcwFZKP9ufjsQ6t3EtjdD1hLc9zfbPuDE32/xx6ZHZGS1XzV5ppYifHNpNgAOt
         P9sA==
X-Gm-Message-State: APjAAAX69iZYtn4w54e2sYTYNWbOIhXjAgk+VedWjwdTrNMJTXfo3svG
        XRienewmdxNAs8YqmjUN7guOKfZ7
X-Google-Smtp-Source: APXvYqzbRmCFFqtgfHFKBiSes/LsRJlZpBRMHMsnYsccd13e2GKnbfR/q3V6eqbvJdDK1glD1hnjTw==
X-Received: by 2002:a19:7616:: with SMTP id c22mr22470206lff.115.1563481572500;
        Thu, 18 Jul 2019 13:26:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id h1sm4132665lfj.21.2019.07.18.13.26.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 13:26:11 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pgaikwad@nvidia.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
 <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <056496ed-9abf-6907-c61c-a99ccf23b834@gmail.com>
Date:   Thu, 18 Jul 2019 23:26:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.07.2019 22:42, Peter De Schrijver пишет:
> On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote:
>>>
>>> dependencies I am referring are dfll_ref, dfll_soc, and DVFS peripheral
>>> clocks which need to be restored prior to DFLL reinit.
>>
>> Okay, but that shouldn't be a problem if clock dependencies are set up
>> properly.
>>
>>>>> reverse list order during restore might not work as all other clocks are
>>>>> in proper order no with any ref clocks for plls getting restored prior
>>>>> to their clients
>>>> Why? The ref clocks should be registered first and be the roots for PLLs
>>>> and the rest. If it's not currently the case, then this need to be
>>>> fixed. You need to ensure that each clock is modeled properly. If some
>>>> child clock really depends on multiple parents, then the parents need to
>>>> in the correct order or CCF need to be taught about such
>>>> multi-dependencies.
>>>>
>>>> If some required feature is missed, then you have to implement it
>>>> properly and for all, that's how things are done in upstream. Sometimes
>>>> it's quite a lot of extra work that everyone are benefiting from in
>>>> the end.
>>>>
>>>> [snip]
>>>
>>> Yes, we should register ref/parents before their clients.
>>>
>>> cclk_g clk is registered last after all pll and peripheral clocks are
>>> registers during clock init.
>>>
>>> dfllCPU_out clk is registered later during dfll-fcpu driver probe and
>>> gets added to the clock list.
>>>
>>> Probably the issue seems to be not linking dfll_ref and dfll_soc
>>> dependencies for dfllCPU_out thru clock list.
>>>
>>> clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk reference
>>> thru DT.
> 
> The dfll does not have any parents. It has some clocks which are needed
> for the logic part of the dfll to function, but there's no parent clock
> as such unlike for peripheral clocks or PLLs where the parent is at
> least used as a reference. The I2C controller of the DFLL shares the
> lines with a normal I2C controller using some arbitration logic. That
> logic only works if the clock for the normal I2C controller is enabled.
> So you need probably 3 clocks enabled to initialize the dfll in that
> case. I don't think it makes sense to add complicated logic to the clock
> core to deal with this rather strange case. To me it makes more sense to
> use pmops and open code the sequence there.

It looks to me that dfllCPU is a PLL and dfll_ref is its reference
parent, while dfll_soc clocks the logic that dynamically reconfigures
dfllCPU in background. I see that PLLP is defined as a parent for
dfll_ref and dfll_soc in the code. Hence seems dfll_ref should be set as
a parent for dfllCPU, no?

Either way is good to me, given that DFLL will be disabled during
suspend. Resetting DFLL on DFLL's driver resume using PM ops should be
good. And then it also will be better to error out if DFLL is active
during suspend on the DFLL's driver suspend.
