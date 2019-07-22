Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484ED6FE2D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfGVK5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 06:57:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41470 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfGVK5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 06:57:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id d24so37130088ljg.8;
        Mon, 22 Jul 2019 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MfMbQo+3px3OA9BnZZv/vPC4tyxY+4Fa99yi+j6MVSs=;
        b=IPH+KevhCcZGuzjzdQ0lz5atsUMe6SkDXi4+XrZuh259ziqgPwYr39ftyFmF6MozMv
         0FuiimMJuXT9M81SWd6yIn7GIcsRO2RmTAtX+6bnHiQbOv6CwECBnCcQn24U29tC9Xws
         mquHnECZoGFfUwH6Jio5Rzmdbcs9774hkOfwBqmbPm7kKpnmSXGk34iU98hZSsQEUap4
         QKoCGxb7JqPUkku2oJcSC62tOPR1+ui6wKvZEXS38ZY8LeDbO+czhoikIFPROGbQrs7J
         ijD5HKto3HhyrHLFZNx9EUkkKOsy/eJEEWb2LVMP3E+ldgpuVUcwQ1i5z4cfdG9hvJBw
         RtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MfMbQo+3px3OA9BnZZv/vPC4tyxY+4Fa99yi+j6MVSs=;
        b=JORvly5QnOunbyYc67O8nK49l1EjjEx2ElqklyWyaTx8dS/QCQ555imF6PL9CaYp0c
         ncrtydc/fRi+LAUcqzUW0glowBYDjYi22rid33tONB6Wl3tVaMDwrPrvE3fAdS0pdMoc
         PKDE8Mc8i0XJzRhD5E7kMN/5bigYMux+Bt6l8Q9V72wKprMxpIlVF3X0q9dt+Fx2RPos
         7qGr4Cb3yHir18JFhzQuzUXcDJklwqYzQetfffphrOB3c/FXill8kcTMwKLpeR/FFdom
         kcbI6G7BaysxJurMc4B47Nmscy2J+18lSmfKs7TsxfcLS9VIotz77kpQ8qHwxdnNOkpF
         vPZw==
X-Gm-Message-State: APjAAAVMigEiMAdA5kYLskIBEH5GO+bn+k87CRgVluSoWC8qJG6mqOX1
        q80npa0H7gzhqYAk2pqcDBGN8994
X-Google-Smtp-Source: APXvYqxKBaaGhtcXgBX8AYLsoJaFMBoWGA/+yePSQ6iGvovI8f37U1Gps+nEDTjxrdgHmGvpFBkIbA==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr35967848ljg.134.1563793050348;
        Mon, 22 Jul 2019 03:57:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id m4sm7464928ljc.56.2019.07.22.03.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 03:57:29 -0700 (PDT)
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
Date:   Mon, 22 Jul 2019 13:57:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 13:13, Marc Zyngier пишет:
> On 22/07/2019 10:54, Dmitry Osipenko wrote:
>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
>>> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>>>
>>> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
>>> for Tegra210.
>>>
>>> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
>>> interrupt controller suspend operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>  drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
>>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
>>> index e1f771c72fc4..851f88cef508 100644
>>> --- a/drivers/irqchip/irq-tegra.c
>>> +++ b/drivers/irqchip/irq-tegra.c
>>> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
>>>  
>>>  struct tegra_ictlr_soc {
>>>  	unsigned int num_ictlrs;
>>> +	bool supports_sc7;
>>>  };
>>>  
>>>  static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
>>> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
>>>  
>>>  static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
>>>  	.num_ictlrs = 6,
>>> +	.supports_sc7 = true,
>>>  };
>>>  
>>>  static const struct of_device_id ictlr_matches[] = {
>>> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] = {
>>>  
>>>  struct tegra_ictlr_info {
>>>  	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
>>> +	const struct tegra_ictlr_soc *soc;
>>>  #ifdef CONFIG_PM_SLEEP
>>>  	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>>>  	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
>>> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
>>>  		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
>>>  		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
>>>  
>>> -		/* Disable COP interrupts */
>>> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>> +		/*
>>> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
>>> +		 *
>>> +		 * Tegra210 system suspend flow uses sc7entry firmware which
>>> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
>>> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
>>> +		 * system to go to SC7/LP0.
>>> +		 *
>>> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
>>> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
>>> +		 */
>>> +		if (!lic->soc->supports_sc7)
>>> +			/* Disable COP interrupts if SC7 is not supported */
>>
>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>> better here.
> 
> If what you're saying is true, then the whole patch is wrong, and the
> SC7 property should come from DT.

It should be safe to assume that all of existing Tegra210 devices use
the firmware for SC7, hence I wouldn't say that the patch is entirely
wrong. To me it's not entirely correct.

>>
>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>
>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>> pre-T210 at all, since COP is unused. This looks to me like it was
>> cut-n-pasted from downstream kernel without a good reason and could be
>> simply removed.
> 
> Please verify that this is actually the case. Tegra-2 definitely needed
> some level of poking, and I'm not keen on changing anything there until
> you (or someone else) has verified it on actual HW (see e307cc8941fc).

Tested on Tegra20 and Tegra30, LP1 suspend-resume works perfectly fine
with all COP bits removed from the driver.

AFAIK, the reason why downstream needed that disabling is that it uses
proprietary firmware which is running on the COP and that firmware is
usually a BLOB audio/video DEC-ENC driver which doesn't cleanup
interrupts after itself. That firmware is not applicable for the
upstream kernel, hence there is no need to care about it.

> Joseph, can you please shed some light here?

