Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDAC95F6BF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 12:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfGDKki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 06:40:38 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35770 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbfGDKkh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 06:40:37 -0400
Received: by mail-qt1-f195.google.com with SMTP id d23so7553015qto.2;
        Thu, 04 Jul 2019 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J75O2ZYm/AIRp38Aj0T7xtVwqkjaGCkxGvM6r7neVEo=;
        b=svb8eN7znP/WGdtT3CrWT/7VclWevgOLXH+ZMAI+DC5wM3BXGnt/u6lc/RE+8iDWfw
         liiW9ZYL607XBo6qnD1lpUXoPDUdioXWw/QKbHmoNOlVMnjHgEf/OR6/CNQFnchp65cI
         JFhf5SKwp/K1XSyb+i76xI+4IWvnfjFE41buuQVjjfCguncDCNHAvrkZzQpLGiJT0kgb
         JoK7NVI67JRxQFX3fxfRan0bcYG0bOy7TqDV+5zuDFAuy2AeT/9MXv9mR4K7iAxBp8kn
         b3wSRfUEgsQlsZoVJ7Fsfno3dfay2OdhPT3OkFpDa9U+3h+PoPnKO2Q7RJPE3CTqI7Q4
         Mpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J75O2ZYm/AIRp38Aj0T7xtVwqkjaGCkxGvM6r7neVEo=;
        b=kB8Okg9geItCbpuDjE2ubpSUWnboA5Uk4fWU6OyQ/Qer94kWLp2S4vbXp4ypKrf34e
         3h9YvbgFT/Cr+3NZ/5D9GROHwbizyXpPht618QWVsZGSDb2U0Yjkua9X2x3LNTqHfwmk
         a3uwKZETgUjXOs1nvLhdP7iBgWjf44IIo1XzoCmJGJ1IsJo+AGj1ycZkBVwuc6jSEyd4
         r6Kxxe/vBUBxyZ4UgfftFiDUkhqWQWoxIMaNl0gBRaJ2O8olPn5havmezPGWHur6akbb
         ldTmnMpoGQlBEmpOmjmPZKG0lhbqL9+S9ft0HBCHMjK2A9oE5z9pr75WMGDku1IUuoXQ
         Mngg==
X-Gm-Message-State: APjAAAXwdh1AqRLjM+wSjesbzEYDFM1a9W7gfsZ3J5iqktuYXPddW3jU
        1s8SR9b/8nnUfJpWAouXCLtatHOW
X-Google-Smtp-Source: APXvYqz+yPk+2MUL4Psf0OlCLMqisNELh1oDhrrNJ46MfRnYY8Jr2unJvbo1n+PNfKtsECoRc7/Sdg==
X-Received: by 2002:a0c:d1f0:: with SMTP id k45mr37041274qvh.69.1562236836520;
        Thu, 04 Jul 2019 03:40:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id s7sm980077qtq.8.2019.07.04.03.40.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 03:40:35 -0700 (PDT)
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <66b5e81b-d468-e2aa-7336-3d4854c234ab@gmail.com>
Date:   Thu, 4 Jul 2019 13:40:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

04.07.2019 10:31, Linus Walleij пишет:
> On Sat, Jun 29, 2019 at 5:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay that pinctrl
>> will be resumed after GPIO? Shouldn't a proper pin-muxing be selected at first?
> 
> Thierry sent some initial patches about this I think. We need to use
> device links for this to work properly so he adds support for
> linking the pinctrl and GPIO devices through the ranges.
> 
> For links between pin control handles and their consumers, see also:
> 036f394dd77f pinctrl: Enable device link creation for pin control
> c6045b4e3cad pinctrl: stmfx: enable links creations
> 489b64d66325 pinctrl: stm32: Add links to consumers
> 
> I am using STM32 as guinea pig for this, consider adding links also
> from the Tegra pinctrl. I might simply make these pinctrl consumer
> to producer links default because I think it makes a lot sense.

IIUC, currently the plan is to resume pinctrl *after* GPIO for Tegra210 [1]. But this
contradicts to what was traditionally done for older Tegras where pinctrl was always
resumed first and apparently it won't work well for the GPIO ranges as well. I think this
and the other patchsets related to suspend-resume still need some more thought.

[1] https://patchwork.kernel.org/patch/11012077/
