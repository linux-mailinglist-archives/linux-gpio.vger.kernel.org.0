Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 868DE50A63
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 14:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbfFXMIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 08:08:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34036 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfFXMIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 08:08:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D7F77609F3; Mon, 24 Jun 2019 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561378087;
        bh=9ujNcqd3Jlk3Z/TiNKetSI2m/c0UKKDThlftDiCds6c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=h9pJqog2KLZX2/CZvlRhbXHEzNCMAQzo5TGj+iu443rfjrQ+4njhrLR9DW7ewOPn3
         DBUzKIXYZWR4KGP6jytD6O6kyVWHNhTgfCztOyv2QVOYo5v1n0bUPWCWtxPr9xVyFS
         arKJsBlfFCr4f+mRJjy78JBCZiiGHlOSf+s5Pgv4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E619660741;
        Mon, 24 Jun 2019 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561378086;
        bh=9ujNcqd3Jlk3Z/TiNKetSI2m/c0UKKDThlftDiCds6c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=c/cNt6ab0JnsACEdMUTWK8p12ZkhjGvGmOB4Z0EKau0tn0Y9V+YljIe2zNvb9ELjB
         k8cL6vc0otLqpc3sFowUcEv+qu1D1Qw+4MRHw7oMNl3QESYStoAdTHXebgyJGpfoBd
         YLUX/tzSnLy4okEaUFilCKJNyX9y1oRkC/TpdIF8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E619660741
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1981742.H2rzviYcjI@debian64>
 <96fd8992-e333-6b3b-15c0-2845984120aa@codeaurora.org>
 <2600627.FlAEz51UtF@debian64>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <e2a447f8-6024-0369-f698-2027b6edcf9e@codeaurora.org>
Date:   Mon, 24 Jun 2019 17:38:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2600627.FlAEz51UtF@debian64>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Christian,

On 6/20/2019 9:02 PM, Christian Lamparter wrote:
> Hello Sricharan,
> 
> On Wednesday, June 19, 2019 4:42:11 PM CEST Sricharan R wrote:
>> On 6/15/2019 2:11 AM, Christian Lamparter wrote:
>>> On Wednesday, June 12, 2019 11:48:48 AM CEST Sricharan R wrote:
>>>> Hi Christian,
>>>>
>>>> On 6/10/2019 5:45 PM, Christian Lamparter wrote:
>>>>> On Monday, June 10, 2019 12:09:56 PM CEST Sricharan R wrote:
>>>>>> Hi Christian,
>>>>>>
>>>>>> On 6/6/2019 2:11 AM, Christian Lamparter wrote:
>>>>>>> On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
>>>>>>>>
>>>>>>>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>>>>>>>> CP01 evaluation board.
>>>>>>>>
>>>>>>>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>>>>>>>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>>>>>>>
>>>>>>>> +       clocks {
>>>>>>>> +               sleep_clk: sleep_clk {
>>>>>>>> +                       compatible = "fixed-clock";
>>>>>>>> +                       clock-frequency = <32000>;
>>>>>>>> +                       #clock-cells = <0>;
>>>>>>>> +               };
>>>>>>>> +
>>>>>>> Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
>>>>>>> on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
>>>>>>> From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
>>>>>>> declares them at 32000 Hz. Since you probably have access to the BOM and
>>>>>>> datasheets. Can you please confirm what's the real clock frequency for
>>>>>>> the IPQ6018.
>>>>>>> (And maybe also for the sleep_clk of the IPQ4018 as well?).
>>>>>>>
>>>>>>
>>>>>> What exactly is the issue that you faced ?
>>>>>> Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.
>>>>>
>>>>> We need just a confirmation.
>>>>>
>>>>> Then again, Currently the qcom-ipq4019.dtsi is using 32768 Hz.
>>>>>
>>>>> |		sleep_clk: sleep_clk {
>>>>> |			compatible = "fixed-clock";
>>>>> |			clock-frequency = <32768>;
>>>>> |			#clock-cells = <0>;
>>>>> |		};
>>>>>
>>>>> <https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom-ipq4019.dtsi#L144>
>>>>>
>>>>> Which makes sense, because all previous Qualcomm Atheros MIPS and the
>>>>> future IPQ8072 SoCs have been either using or deriving a 32768 Hz clock.
>>>>>
>>>>> For example: The AR9344 derives the clock from the 25MHz/40MHz external
>>>>> oscillator. This is explained in "8.16.9 Derived RTC Clock (DERIVED_RTC_CLK)".
>>>>> Which mentions that the "32KHz" clock interval is 30.5 usec / 30.48 usec
>>>>> depending whenever the external reference crystal has 40MHz or 25MHz.
>>>>> (1/30.5usec = 32.7868852 kilohertz!). The QCA9558 datasheet says the same
>>>>> in "10.19.11 Derived RTC Clock". 
>>>>>
>>>>> For IPQ8072: I point to the post by Sven Eckelmann on the OpenWrt ML:
>>>>> <http://lists.infradead.org/pipermail/openwrt-devel/2019-May/017131.html>
>>>>> "I was only able to verify for IPQ8072 that it had a 32.768 KHz
>>>>> sleep clock." 
>>>>>
>>>>> So this is pretty much "why there is an issue", it's confusing.
>>>>> Is possible can you please look if there are (fixed) divisors values
>>>>> listed in the documentation or the registers and bits that the values
>>>>> are stored in? Because then we could just calculate it. 
>>>>>
>>>>
>>>> Really sorry for the confusion. So looking little more, SLEEP_CLK is derived
>>>> from an external 38.4MHZ crystal, it is 32.768 KHZ.
>>> That's really valuable information to have. Thank you!
>>>
>>>> Somehow the clk freq plan etc seems to mention them only as .032 MHZ and misses
>>>> out. That means i will correct the patch for 32768 and probably the
>>>> ipq8074.dtsi as well
>>>
>>> Ok, there's one more issue that Paul found (at least with the IPQ4019),
>>> https://patchwork.ozlabs.org/patch/1099482
>>>
>>> it seems that the "sleep_clk" node in the qcom-ipq4019.dtsi is not used by
>>> the gcc-ipq4019.c clk driver. this causes both wifi rtc_clks and the usb sleep
>>> clks to dangle in the /sys/kernel/debug/clk/clk_summary (from a RT-AC58U)
>>>
>>>    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
>>> ----------------------------------------------------------------------------------------
>>>  xo                                       9            9    48000000          0 0
>>>  [...]
>>>  sleep_clk                                1            1       32768          0 0  
>>>  gcc_wcss5g_rtc_clk                       1            1           0          0 0  
>>>  gcc_wcss2g_rtc_clk                       1            1           0          0 0  
>>>  gcc_usb3_sleep_clk                       1            1           0          0 0  
>>>  gcc_usb2_sleep_clk                       1            1           0          0 0  
>>>
>>> with his patch the /sys/kernel/debug/clk/clk_summary looks "better" 
>>>
>>> (something like this:)
>>>
>>>    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
>>> ----------------------------------------------------------------------------------------
>>>  xo                                       9            9    48000000          0 0
>>>  [...] 
>>>  gcc_sleep_clk_src                        5            5       32000          0 0  
>>>     gcc_wcss5g_rtc_clk                    1            1       32000          0 0  
>>>     gcc_wcss2g_rtc_clk                    1            1       32000          0 0  
>>>     gcc_usb3_sleep_clk                    1            1       32000          0 0  
>>>     gcc_usb2_sleep_clk                    1            1       32000          0 0  
>>>
>>> but judging from your comment "SLEEP_CLK is derived from an
>>> external 38.4MHZ crystal" the gcc_sleep_clk_src / sleep_clk
>>> should have xo as the parent. so the ideal output should be:
>>>
>>>    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
>>> ----------------------------------------------------------------------------------------
>>>  xo                                      10           10    48000000          0 0
>>>  [...] 
>>>     gcc_sleep_clk                         5            5       32768          0 0  
>>>        gcc_wcss5g_rtc_clk                 1            1       32768          0 0  
>>>        gcc_wcss2g_rtc_clk                 1            1       32768          0 0  
>>>        gcc_usb3_sleep_clk                 1            1       32768          0 0  
>>>        gcc_usb2_sleep_clk                 1            1       32768          0 0  
>>>
>>> or am I missing/skipping over something important? 
>>>
>>
>> Sorry for the delayed response. So what i said above (32768 clk) looks
>> like true only for ipq8074. For ipq4019, looks like 32000.
>>
>> That means, there is still some thing unclear. I am checking for precise
>> information from HW team for ipq4019/8074/6018. Please hang on, will
>> update you asap.
> 
> Thank you for looking this up! I'll definitely stick around for the final
> verdict.
> 

So the HW guys responded and as per that, ipq4019/ipq6018 it is 32000.
It is derived from a 48M wifi refclk

48M wifi ref clk -> [/2 divider] -> [/750 divider] -> sleep_clk (32000)

In case of ipq8074, it is derived from the pmic and 32768.


> Also, I think the "xo" clk of your IPQ6018 dts should get the
> "always-on;" property (any maybe sleep_clk as well?).
> 
> Paul discovered that the QSDK had this extra commit
> <https://lore.kernel.org/patchwork/patch/1089385/>
> (Maybe the changeid can help you look it up internally)
> 
> For IPQ4019, this enables the high resolution with a 1ns resolution
> instead of 10ms.
> 

ho ok, this patch is needed.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
