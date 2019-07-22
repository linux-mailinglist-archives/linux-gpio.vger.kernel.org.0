Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C53270D6C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 01:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731123AbfGVXfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 19:35:51 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42357 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbfGVXfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 19:35:51 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so27929811lfb.9;
        Mon, 22 Jul 2019 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SyN4PMS8VdJuZtYAYv7/mZHuR7T+1K3l9M3mMacsc+A=;
        b=AzLi2KP23pmRxkwmIXlrISi/NKbSONyUgYkBZNbaJO73EszX4dS22lkiDWZswJ8h0g
         aqjGTP4d32ZROrCSBAGYEHTvhDDGgiJvAfswDyoqhbRm3auRD/2iqPYjf3vmjnfFyb8r
         dk/UMF5YEMeE4+CwefO4LGjTZHLbknFadqOFc/V+rqJhrJlDmZWAO1kXNvluSP73gQNm
         qDJPLf/3h9j5c4jISKA1CflIrbV/mfHQQnbCDlYoO/hVwqRVnJGGB/tzRefIsicJj1E4
         HDOyiy5ScyHevG8RNYIoYCbaxNzzSneWSXfG7BNc8ZBBcO0TRtDvH8UIQdaZUSDBJ1if
         isrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SyN4PMS8VdJuZtYAYv7/mZHuR7T+1K3l9M3mMacsc+A=;
        b=MqkvhqpeC3GR8eng4IBZND9dt+2nvwXL5oefgNsg8NXcfskWOtIUoffYd74S+G2mE8
         WFSXPkA569VYKavtwze8kyQdJiSEUCGpbM4gBWu34V4Vzl5r8ijOT/pLIgWSb9IXgi9Y
         cwGA0zxJ5+OREWoI/P3iB2XQaXczB6jzkCsg9F6LzTZSiArOAuzdGN5JkW42nC01ZLxx
         iohryfLYOkKCSG85fidg2nc+GKl7zyYaQhF28w9qNPENTyyAyWgi/gGjmmw5oicFkMFL
         w3A/P41ktVszjp23rHhMdfzBrQ3z/Plg3mRPQK3XlEoWNwECm+mdTCOnoQVm+ARNyNjo
         qrNw==
X-Gm-Message-State: APjAAAUS5A4Wx96bb3E3jiKh0ydu3SDKQQnv4oSJJJv+trwxnPv2OKy7
        jj0CTEnx50d6J803eRwc8ilHD5/2
X-Google-Smtp-Source: APXvYqxnqujN01Dh+F4vReSd0zY91B9eV6mNZEOjyfpmuNHfRfxbCUMyYCnJzFeafdbDaOnXsdqYjg==
X-Received: by 2002:a19:f00a:: with SMTP id p10mr32218584lfc.68.1563838547818;
        Mon, 22 Jul 2019 16:35:47 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id b68sm8751413ljb.0.2019.07.22.16.35.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 16:35:46 -0700 (PDT)
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
 <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
 <a2ecc3ad-b7e9-9398-d59b-c7d3fbbd10bb@nvidia.com>
 <20190722193838.0d7cd2ad@why>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e9f821c-3717-510d-c64f-8a1cc2452c25@gmail.com>
Date:   Tue, 23 Jul 2019 02:35:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722193838.0d7cd2ad@why>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 21:38, Marc Zyngier пишет:
> On Mon, 22 Jul 2019 09:21:21 -0700
> Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
> 
>> On 7/22/19 3:57 AM, Dmitry Osipenko wrote:
>>> 22.07.2019 13:13, Marc Zyngier пишет:  
>>>> On 22/07/2019 10:54, Dmitry Osipenko wrote:  
>>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:  
>>>>>> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
>>>>>> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>>>>>>
>>>>>> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
>>>>>> for Tegra210.
>>>>>>
>>>>>> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
>>>>>> interrupt controller suspend operation.
>>>>>>
>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>   drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
>>>>>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
>>>>>> index e1f771c72fc4..851f88cef508 100644
>>>>>> --- a/drivers/irqchip/irq-tegra.c
>>>>>> +++ b/drivers/irqchip/irq-tegra.c
>>>>>> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
>>>>>>   
>>>>>>   struct tegra_ictlr_soc {
>>>>>>   	unsigned int num_ictlrs;
>>>>>> +	bool supports_sc7;
>>>>>>   };
>>>>>>   
>>>>>>   static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
>>>>>> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
>>>>>>   
>>>>>>   static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
>>>>>>   	.num_ictlrs = 6,
>>>>>> +	.supports_sc7 = true,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct of_device_id ictlr_matches[] = {
>>>>>> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] = {
>>>>>>   
>>>>>>   struct tegra_ictlr_info {
>>>>>>   	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
>>>>>> +	const struct tegra_ictlr_soc *soc;
>>>>>>   #ifdef CONFIG_PM_SLEEP
>>>>>>   	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>>>>>>   	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
>>>>>> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
>>>>>>   		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
>>>>>>   		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
>>>>>>   
>>>>>> -		/* Disable COP interrupts */
>>>>>> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>> +		/*
>>>>>> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
>>>>>> +		 *
>>>>>> +		 * Tegra210 system suspend flow uses sc7entry firmware which
>>>>>> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
>>>>>> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
>>>>>> +		 * system to go to SC7/LP0.
>>>>>> +		 *
>>>>>> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
>>>>>> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
>>>>>> +		 */
>>>>>> +		if (!lic->soc->supports_sc7)
>>>>>> +			/* Disable COP interrupts if SC7 is not supported */  
>>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>>>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>>>>> better here.  
>>>> If what you're saying is true, then the whole patch is wrong, and the
>>>> SC7 property should come from DT.  
>>> It should be safe to assume that all of existing Tegra210 devices use
>>> the firmware for SC7, hence I wouldn't say that the patch is entirely
>>> wrong. To me it's not entirely correct.  
>>
>> Yes, all existing Tegra210 platforms uses sc7 entry firmware for SC7 and 
>> AVP/COP IRQ need to be kept enabled as during suspend ATF triggers IRQ 
>> to COP for SC7 entry fw execution.

Okay, as I already wrote before, it looks to me that a more proper
solution should be to just remove everything related to COP from this
driver instead of adding custom quirks for T210.

The disabling / restoring of COP interrupts should be relevant only for
the multimedia firmware on older Tegra SoCs. That firmware won't be ever
supported in the upstream simply because NVIDIA abandoned the support
for older hardware in the downstream and because it is not possible due
to some legal weirdness (IIUC). The only variant for upstream is
reverse-engineering of hardware (not the firmware BLOB) and writing
proper opensource drivers for the upstream kernel, which we're already
doing and have success to a some extent.

> That's not the question. Dmitry says that the SC7 support is not a
> property of the SoC, but mostly a platform decision on whether the
> firmware supports SC7 or not.
> 
> To me, that's a clear indication that this should not be hardcoded in
> the driver, but instead obtained dynamically, via DT or otherwise.

We already have an nvidia,suspend-mode property in the device-tree of
the Power Management Controller node (all Tegra SoCs) which defines what
suspending type is supported by a particular board.

>>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);  
>>>>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>>>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>>>> cut-n-pasted from downstream kernel without a good reason and could be
>>>>> simply removed.  
>>>> Please verify that this is actually the case. Tegra-2 definitely needed
>>>> some level of poking, and I'm not keen on changing anything there until
>>>> you (or someone else) has verified it on actual HW (see e307cc8941fc).  
>>> Tested on Tegra20 and Tegra30, LP1 suspend-resume works perfectly fine
>>> with all COP bits removed from the driver.
>>>
>>> AFAIK, the reason why downstream needed that disabling is that it uses
>>> proprietary firmware which is running on the COP and that firmware is
>>> usually a BLOB audio/video DEC-ENC driver which doesn't cleanup
>>> interrupts after itself. That firmware is not applicable for the
>>> upstream kernel, hence there is no need to care about it.
>>>  
>>>> Joseph, can you please shed some light here?  
>>
>> SC7 entry flow uses 3rd party ATF (arm-trusted FW) blob which is the
>> one that actually loads SC7 entry firmware and triggers IRQ to
>> AVP/COP which causes COP to wakeup and run SC7 entry FW.
>>
>> So when SC7 support is enabled, IRQ need to be kept enabled and when
>> SC7 FW starts execution, it will disable COP IRQ.
> 
> This looks like a lot of undocumented assumptions on what firmware
> does, as well as what firmware *is*. What I gather from this thread is
> that there is at least two versions of firmware (a "proprietary
> firmware" for "downstream kernels", and another one for mainline), and
> that they do different things.
> 
> Given that we cannot know what people actually run, I don't think we
> can safely remove anything unless this gets tested on the full spectrum
> of HW/FW combination.

I'm not sure whether multiple firmware variations exist in the wild for
Tegra210. Maybe Sowjanya or somebody else from NVIDIA could clarify. I
think there should be some efforts in regards to a fully opensource
firmware on Tegra210, but I'm not following it and have no idea about
the status.

You're right that there are multiple variants of suspend-resuming flow
on Tegra SoCs. The older 32bit Tegra SoC generations have a variety of
options in regards to suspend-resuming, including firmware-less variants
on platforms that are having kernel running in secure mode (dev boards,
most of Tegra20 consumer devices) and Trusted-Foundations firmware
variant for insecure platforms (consumer devices). And yes, vendor
firmware creates a lot of headache in regards to bringing support into
upstream because it usually does a lot of odd undocumented things which
may also vary depending on a firmware version (bootloader, etc) and it
also usually difficult to replace it with an opensource alternative due
to a crypto signing.
