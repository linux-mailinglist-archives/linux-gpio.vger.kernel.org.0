Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 465917E260
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 20:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731061AbfHASkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 14:40:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33003 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbfHASkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 14:40:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so70402549ljg.0;
        Thu, 01 Aug 2019 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4c3n1B53LvUEIdK6qUukwsh+1tTm+53NKlqlUPwTPLw=;
        b=WIqTbRfbE+WhINixGHNyGRO/85YFIbVhq7vTAJcqF/5wmXxgrW2pDiYcSgGFViEuxQ
         UapdyH2YzMsI127d3oUDm/llTps4ysEpFs6Laqg/en/S+5G05BMzGUdKoPtPoUeqqpwk
         u3hOVZDHAeEu0Aw4suvZ5/eG8+rzIs2i2/oG69yXvlI70cB/XaDljkUGrOrzHhBwHWq8
         TFAY1VPuD+cgA9aQ+4UZXavH9369Jmh2GABiq4O3NPGb+iumRK1+pNNfc89XDLWoCuWV
         Q39YR5hrdGLDf0YY6+zggQgmovP9uuZpGG56SfxFF/WI1DMVKKZdAnA/SSsa8+rJedwW
         NjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4c3n1B53LvUEIdK6qUukwsh+1tTm+53NKlqlUPwTPLw=;
        b=C/PoxfHxeTIqCnXC+5nB4f4sq3SkGvWoDY4ke1eG45XR5cBmNNZE1Bx0QEEdYQ0oGs
         vkohHoBdp90sqZutQ1WhxNjrzg31WNEZKJygTHtwiG98pH2QoNVysYJFwWi285NM+F66
         4NxzyyKdqUKEjL4be9bIRgS19nxUwJA+qQIAoUOu+fMvzUkfpAFAtooGMzatgNyKlBYJ
         HPUh7VD4Y8r5ngmJLiFuySZaWI7YjItKSTO8rSZcYUOJIhSK6Kms/vdIoSoKnX9p32AA
         Dc0LGh9Ecssp9gP3bHrnwVtELQXwfQFpvvATxa1iUUBqk8n/BbwvITdrzGZvfgHee08v
         2DnQ==
X-Gm-Message-State: APjAAAU6hOqLulhv5QKfoQxzMr0xF3Rct2zNRTgyy5rQUTCoyd4kf36f
        oBFJ/h7YSDH6zEV0+sOhuhLY7OS6
X-Google-Smtp-Source: APXvYqwFlMwfOka+WDpjapw7+2AlV0AyTflsuSIh4d/2IGyuMsvkQ2QBdp8ah6kNuScn5w2pRJDILg==
X-Received: by 2002:a2e:2bd3:: with SMTP id r80mr70148648ljr.23.1564684800514;
        Thu, 01 Aug 2019 11:40:00 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id q30sm14103444lfd.27.2019.08.01.11.39.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 11:39:59 -0700 (PDT)
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
 <4f8b9ee7-5402-6463-d6d2-7b00e274a185@gmail.com>
 <1e2e6282-9d94-e322-c4ba-8a1f3b902860@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47c3e2f3-b9e8-983d-3df9-b45552190850@gmail.com>
Date:   Thu, 1 Aug 2019 21:39:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1e2e6282-9d94-e322-c4ba-8a1f3b902860@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.08.2019 20:56, Sowjanya Komatineni пишет:
> 
> On 8/1/19 3:43 AM, Dmitry Osipenko wrote:
>> 01.08.2019 0:08, Sowjanya Komatineni пишет:
>>> On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>> This patch updates device tree for RTC and PMC to allow system wake
>>>>> from deep sleep on RTC alarm.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> index 659753118e96..30a7c48385a2 100644
>>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> @@ -768,7 +768,8 @@
>>>>>        rtc@7000e000 {
>>>>>            compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>>>>            reg = <0x0 0x7000e000 0x0 0x100>;
>>>>> -        interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        interrupt-parent = <&pmc>;
>>>>>            clocks = <&tegra_car TEGRA210_CLK_RTC>;
>>>>>            clock-names = "rtc";
>>>>>        };
>>>>> @@ -778,6 +779,8 @@
>>>>>            reg = <0x0 0x7000e400 0x0 0x400>;
>>>>>            clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>>>>            clock-names = "pclk", "clk32k_in";
>>>>> +        #interrupt-cells = <2>;
>>>>> +        interrupt-controller;
>>>>>              powergates {
>>>>>                pd_audio: aud {
>>>>>
>>>> Is this a backwards-compatible change? Or it's not really worth to care
>>>> about the compatibility with older kernel versions, I'm not sure about
>>>> overall state of T210 in the upstream kernel.
>>> I don't think its required to be backwards-compatible as SC7 entry/exit
>>> implementation for T210 is with this patch series onwards..
>> The new device tree binary should work with older kernel versions, AFAIK
>> this is the upstream rule. But if kernel support isn't in a very good
>> shape and not much people are using it, then obviously it is not very
>> important.
> 
> Yes, my response to backwards-compatible was with respect to interrupt
> parent change as this will not be backward compatible and also there is
> no Tegra210 suspend/resume earlier. Other functionality wise, it is
> backward compatible.

Should be good then.
