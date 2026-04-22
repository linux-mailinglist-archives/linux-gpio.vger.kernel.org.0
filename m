Return-Path: <linux-gpio+bounces-35344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FI2G8yY6GkwNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:45:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFE4442F7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61F1E30285AB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CD73C0621;
	Wed, 22 Apr 2026 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp+8MNHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11553C9EC2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851141; cv=none; b=qXwkbsFiFJ6GDgVdpJ0Uz9v8L3ukIt2ie5uSGLaQoBLn8+NP99g30HiI0ExmVdxjBMzanZDi5FJal/GYRKHVc6K17RvGOOpLzOS8F/cI1HYZHcM/sm9exUzE0NAzq6j6vNFx+4KfFLWzwywPvhETRseIL5LT0MceLTY+iG23Ge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851141; c=relaxed/simple;
	bh=ODnCfWZuWwHdn590dcvqmnkYq/WoxSTobshHkjf3NH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLxsNDGW30v2JurGNZ/Fj5ls8eNUXWRyNSu6vQPXvzU6z/yqwqYETMa+ClzAo8XiMyF8UktQK3k0EPqQCiW2Z3BpKUwXcr0Fqr12BmV56mbcVx0kFUsSGKt9Gay9d5WgYfzFjJLe9vTSqj/RtUQ/dnn6Q7/MPJB2MaoWBGCLtv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp+8MNHl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso29733855e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 02:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776851135; x=1777455935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeuZlq/zNmg8pc25SmmpuXfPXUHWMsZAmnTbjh6IQJw=;
        b=Wp+8MNHlunhbA/YQl5T1elv7ZrxgMytgNySJhv5sH5KwXi/UNDe16R90EzfVA3sM8W
         QsJhFehGMJXChGXYFkKKL4a9FS8vD+cpI/40hBFxwdW1n5XrDUpoQjQu/gyAhNnAChi2
         yc8FIjt3QQwo7JLz1IsrFUwNRVb6Dg/rKdV6DPl2y3DjU8knh1Kk+XKITRXTYDgIS5JB
         UHWsux0Bur5KBUpiPwSABBdV4y8HHeVoHbP80TuKZHK6Upt8cI8c5vE/QhVwT5pzDvYU
         25l22nrIuAFljSVfSHTwJaX5ZWHtW7PWa6mlUMQ9JdAf6oWDJVf9+c34sPVJpJTmeYG7
         NkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851135; x=1777455935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeuZlq/zNmg8pc25SmmpuXfPXUHWMsZAmnTbjh6IQJw=;
        b=L6ZnX0l5wLUsw3+MuPaLOKFoMinpPLesJjHh6rL6SzOHLno4dVIvNVrA39hGcxf/RN
         /D1fBUqSmveVUI+rsdRddUaD3WeEnb8PY3XWQFkNIxA6NusUrqPKJQeOxGyPmaFxpPZO
         4QaFzheniAXfWX1cjbB9i6Ohi/EBDym1UBi/NN5jvKipemXovu5b2XwuoCSrbAbKaVyu
         XXZzDlm5HdzKK1fd+TweQZtjN3KQ8bf4jt170txspa4323dZ8sa4SRXk52RTEAsIXAuj
         BveRo9HuhX9XszjVc8RiJft7h40aMu/Xpse8Pi9+es7A77+BNJY+XxwI0ncUXBoeMkWi
         zFnw==
X-Forwarded-Encrypted: i=1; AFNElJ/kLS9E2MJcFQ44tv6VlSMFep7+GFiMZsxFLzTDVXP8YI0w7VHS6yMLVKPX5ebRwVjFKFHFmjFJjGBk@vger.kernel.org
X-Gm-Message-State: AOJu0YytWkh8I9zr3tSgPOruzA3L+fwH699p7yrEW8sUL5mF1wxFQ6kK
	bBA8cL6FMAyP1LTDYklm4s/Z5msYtGk4Qw8fd5qTZmNXJM3OUe7PYeW5
X-Gm-Gg: AeBDiev/9REYmUcWkCIi527/3+2gol8ud7Etv4HOej6uLLHiykvj1WL8Brm0glrwJbu
	kCjWa2YvojOaq1woTJniRXSMPQukewADGIRAAXy/4huAQPk0RUj3ErONZjhKRAIHWRx3/hgWLFD
	rP0BIaPlU0AIrdMKyij/qqE/pNx5grjyng+CNh4wH4LoHF7odM7AsNroT4cmz29NSZdrH1jyeaz
	vbF1DJRhlbXujkwm8lXbc+X+OvHo0Mgf8VgRDpfLFC720nQmRhiVXiy8uhNaWBqyBeshukqWaGO
	bVmbuA+8/e6ehf7Xdz2BqLKT/DyT9bBhCdUun6pVm3KQp27XEjjPzeWjSKKFsyuFcXihUDJHMMQ
	N4qMDXVSgK3bJY9FZcCZndHCuxwoYlqAFmWbu5aQjpl8bdCmwQCfQshxIclPHvVCm/r1q957wh6
	rNanttynC3bLcfTJZj3FoNUXW16oQCzb8yamQVWcmJP0PEqLXtp/pTvbtpZV4iSVcACHIBcAqnQ
	ValrSk=
X-Received: by 2002:a05:600c:3ba0:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488fb73a089mr338917855e9.5.1776851134576;
        Wed, 22 Apr 2026 02:45:34 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:3c42:f121:865e:1066? ([2a01:e11:202b:40:3c42:f121:865e:1066])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm80365995e9.2.2026.04.22.02.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:45:34 -0700 (PDT)
Message-ID: <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
Date: Wed, 22 Apr 2026 11:45:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com>
 <4402ed86-77f5-4a47-a9e1-8d57a709bb15@kernel.org>
 <woxnPhTYiKi2aLzBK8GnO8DpvdgYjQc-P42uhJOzyrcYC3Gdstht27hML8yNHgOklhm2MgGA7wt9gGZ17BHoWlG0vqJuVVJDgCSev8udfds=@protonmail.com>
 <NIIS8XD_nSRvp36X39GxcDRAWsaScQIFx6o9JsFCbyBZk5PqznRdxg9EDDb_9tzWd5TcjzxrRtFx5_uLCVa5wJAYykW2k0Ue_XPMPtWCQiY=@protonmail.com>
 <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <20260422090709.GB557136@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35344-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.24:email,0.0.1.99:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.21:email]
X-Rspamd-Queue-Id: 40AFE4442F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/22/26 11:07, Mika Westerberg wrote:
> Hi,
>
> On Wed, Apr 22, 2026 at 09:51:01AM +0200, Marco Scardovi wrote:
>> On 12/18/25 11:38, Mika Westerberg wrote:
>>> On Thu, Dec 18, 2025 at 11:33:14AM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 18-Dec-25 07:39, Mika Westerberg wrote:
>>>>> On Wed, Dec 17, 2025 at 07:19:56PM +0000, Francesco Lauritano wrote:
>>>>>> On Wednesday, December 17th, 2025 at 7:01 PM, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>>
>>>>>>> On 12/17/25 10:57 AM, Francesco Lauritano wrote:
>>>>>>>
>>>>>>>> On Wednesday, December 17th, 2025 at 4:12 PM, Francesco Lauritano francesco.lauritano1@protonmail.com wrote:
>>>>>>>>
>>>>>>>>> The _AEI defines 5 GPIO interrupts. Narrowed it down to two:
>>>>>>>>>
>>>>>>>>> gpiolib_acpi.ignore_interrupt=AMDI0030:00@21,AMDI0030:00@24
>>>>>>>>>
>>>>>>>>> This fixes the delay. Pins 0x15 and 0x18 both call: \_SB.PCI0.SBRG.HNC0()
>>>>>>>> Traced it further. HNC0(pin, 0) takes the Else branch and calls:
>>>>>>>> ATKM(0xC0)
>>>>>>>> ADTM(Zero)
>>>>>>>>
>>>>>>>> ADTM calls NOD2(), which is the actual culprit:
>>>>>>>>
>>>>>>>> While ((Arg0 != RDNT))
>>>>>>>> {
>>>>>>>> If ((Local0 >= 0x0F)) { Break }
>>>>>>>> Notify (^^GPP0.PEGP, Arg0)
>>>>>>>> Local0++
>>>>>>>> Sleep (Local0 * 0x64)
>>>>>>>> }
>>>>>>>>
>>>>>>>> It notifies the dGPU and polls RDNT, sleeping 100, 200, ... 1500ms per iteration.
>>>>>>>> Max 15 loops = ~12s per pin. GPU doesn't respond at boot so it maxes out.
>>>>>>>>
>>>>>>>> Two pins, ~12s each, ~24-36s total.
>>>>>>>>
>>>>>>>> Francesco
>>>>>>> Any idea why isn't the dGPU responding? I would have expected
>>>>>>> https://git.kernel.org/torvalds/c/4d4c10f763d78 sets up policy that it's
>>>>>>> in D0.
>>>>>>>
>>>>>>> Is the dGPU turned off in BIOS or through some reverse engineered
>>>>>>> tool/API or something?
>>>>>> dmesg without the workaround:
>>>>>> [    1.005184] pci 0000:01:00.0: PME# supported from D0 D3hot
>>>>>> [    1.288811] pci 0000:01:00.0: vgaarb: VGA device added
>>>>>> [   38.250139] nvidia: loading out-of-tree module taints kernel.
>>>>>> [   38.369358] nvidia 0000:01:00.0: enabling device (0000 -> 0003)
>>>>>> [   39.744421] NVRM: GPS ACPI DSM called before _acpiDsmSupportedFuncCacheInit
>>>>>>
>>>>>> GPU is in D0 from 1.0s. nvidia loads at 38.2s after the GPIO hang completes.
>>>>>>
>>>>>> No weird tools/APIs besides userspace utils (asusctl/supergfxctl).
>>>>>>
>>>>>> No changes to BIOS factory defaults other than disabling Fast Boot.
>>>>>> dGPU is active, Display Mode is Dynamic (hybrid).
>>>>>>
>>>>>> Traced RDNT - it's set by GPS function 19 in the ACPI tables:
>>>>>> Case (0x13)
>>>>>> {
>>>>>>       Debug = "GPS fun 19"
>>>>>>       \_SB.PCI0.SBRG.RDNT = (Local1 + 0xD1)
>>>>>> }
>>>>>>
>>>>>> As far as I can understand GPIO initcall blocks at late_initcall_sync, preventing nvidia
>>>>>> from loading in time to respond. Based on the timing, GPU is awake but nothing can
>>>>>> register a handler while kernel is stuck at NOD2 polling loop.
>>>>> I wonder if you could try with the nouveau driver so that it's built-in to
>>>>> the kernel proper? Then it should be ready at the time these events
>>>>> trigger.
>>>> That is not really a workable solution though.
>>> Yeah, I did not meant it to be the "solution" rather just to check whether
>>> it is related if the GPU driver is there or not. You cannot build the
>>> proprietary driver into the kernel so that's why I suggested the
>>> open-source one.
>> Hi Everyone,
>>
>> I would start saying sorry for the necrobump. I faced the same problem on my
>> G614PR and fixed the same way as Francesco.
>>
>> Do you happen to know if there is any news about this? I'm currently on
>> CachyOS with kernel 7.0 and noticed it behaves the same way as 6.19.
>>
>> I'm on to try patches or provide more infos if needed, even if I have to
>> admit I know Linux but not that deeply.
> As far as I can tell no updates unfortunately. I guess we could go with
> slightly updated patch from Francesco, like below that just ignores those
> two interrupts. Can you try if that works for you?
>
> This list of devices that suffer from the "edge events on boot" seems to be
> growing so maybe we should re-think if that should be enabled for all
> systems or limit to the problematic ones (although that list could get big
> too ;-))
>
> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> index a0116f004975..4e60a176ac93 100644
> --- a/drivers/gpio/gpiolib-acpi-quirks.c
> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>   			.ignore_wake = "VEN_0488:00@355",
>   		},
>   	},
> +	{
> +		/*
> +		 * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
> +		 * causes acpi_gpio_handle_deferred_request_irqs() to
> +		 * stall for ~36 seconds during boot so ignore the two
> +		 * interrupts involved.
> +		 *
> +		 * Found in BIOS G614PP.307.
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16 G614PP_G614PP"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
> +		},
> +	},
>   	{} /* Terminating entry */
>   };
>   

Hi Mika,

thank you for the quick reply. AFAICS the patch as is would only works 
for the G614PP and not for the others (for eg I have G614PR_G614PR).

Assuming all the variants suffer the same problem would it be ok to use 
a wildcard for it?


