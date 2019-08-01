Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAA7D996
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 12:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730881AbfHAKoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 06:44:15 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46703 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfHAKoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 06:44:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so45612504lfh.13;
        Thu, 01 Aug 2019 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A9cNcwd9IRgmvJyTlL5BGGVDEQhizQRLKM43NthiAE0=;
        b=usboDGU6NGUK3qHYroj4RCdJOx+Sf10386/eHiQMaWkw9l/UnAHTCuDn1FQGSFcFkt
         wUTR+IWoCevF1ZMWaD9o0nd66076Vx+sMiTpUczZR5eMTiTa/zwDnKfai13M31Troxp8
         7rDzsJvvH0sVA2i4tIuL8IvwkB/5U5VQEMq1xJtFNSLF/mdxVOBzpaXBZj9w/q3nf2bL
         LrhvBPaB1a4jX1FCuNV/4L/WiIoR1QsgqlnXIyFvMFG70s+sD/X7b8QBatsvKCIPcmjk
         8a0AYuWuXlGypW7owZEV2eRZzAjWmtW3+UlHbW702h5ZQtJ3rWsokKpagTAY6vaBclUz
         mKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A9cNcwd9IRgmvJyTlL5BGGVDEQhizQRLKM43NthiAE0=;
        b=uGiR4gKDy7Ksrwd44upBJVURO1IXTQdCFO9iptMZ3PbIrC/PoiTleD13Xe83clI88I
         2RUQ0JyFEKSHRTE5Mhvg2HrOr+DQQVXr6ylz0r/2pG+YOqpuBgZPlPUXOKq6cDyTR82O
         bLGzXn44xgU1Z1YZxi1q5Gt+G35JOcdvx5LbmMwXwe4Mn9POR4Sm+UFGFOgKE9jGbOj0
         Hy9RplScVDDT28wWidYrWwvW1UBNKm1VFxOJGve60ZsrTwVWqHJAAdvOR+Na7Oe7Upcw
         ByQC3JnTUtaO5zB1+NoEjdbtOz5ZW+VhOty4WY5BfiKZTR8twapnVBhNWolQ7ZNLHYiW
         4GjQ==
X-Gm-Message-State: APjAAAW4KcdBLl8eQ5zR3BmltN1UHkXZJ3VSAR6ouJOBpcsGKuAfWUNU
        1ixL7vzOkLJflZx3k3litsJmEsIq
X-Google-Smtp-Source: APXvYqz2Y9yO3DiF+D395+ZEnFkpJg59qBaSjGFWD2gYvgHURdqUCdJs91JgmbgjhhmlQ3qiOoz+2A==
X-Received: by 2002:ac2:414d:: with SMTP id c13mr9975444lfi.47.1564656252635;
        Thu, 01 Aug 2019 03:44:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id b6sm13533059lfa.54.2019.08.01.03.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 03:44:12 -0700 (PDT)
Subject: Re: [PATCH v7 16/20] arm64: tegra: Enable wake from deep sleep on RTC
 alarm
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
 <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
 <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f8b9ee7-5402-6463-d6d2-7b00e274a185@gmail.com>
Date:   Thu, 1 Aug 2019 13:43:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.08.2019 0:08, Sowjanya Komatineni пишет:
> 
> On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>> This patch updates device tree for RTC and PMC to allow system wake
>>> from deep sleep on RTC alarm.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>> b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>> index 659753118e96..30a7c48385a2 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>> @@ -768,7 +768,8 @@
>>>       rtc@7000e000 {
>>>           compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>>           reg = <0x0 0x7000e000 0x0 0x100>;
>>> -        interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-parent = <&pmc>;
>>>           clocks = <&tegra_car TEGRA210_CLK_RTC>;
>>>           clock-names = "rtc";
>>>       };
>>> @@ -778,6 +779,8 @@
>>>           reg = <0x0 0x7000e400 0x0 0x400>;
>>>           clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>>           clock-names = "pclk", "clk32k_in";
>>> +        #interrupt-cells = <2>;
>>> +        interrupt-controller;
>>>             powergates {
>>>               pd_audio: aud {
>>>
>> Is this a backwards-compatible change? Or it's not really worth to care
>> about the compatibility with older kernel versions, I'm not sure about
>> overall state of T210 in the upstream kernel.
> I don't think its required to be backwards-compatible as SC7 entry/exit
> implementation for T210 is with this patch series onwards..

The new device tree binary should work with older kernel versions, AFAIK
this is the upstream rule. But if kernel support isn't in a very good
shape and not much people are using it, then obviously it is not very
important.
