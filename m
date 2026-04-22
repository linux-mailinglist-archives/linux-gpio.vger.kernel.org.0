Return-Path: <linux-gpio+bounces-35353-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKnbHUi66GkHPgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35353-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:08:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F91445B71
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FB213014102
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFB43D170F;
	Wed, 22 Apr 2026 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHRqZIFs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF334DCE4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859714; cv=none; b=jAXkNh6O31DagF7HuCEaA4dKuv5XeJv46mgElc+YlYyv7oQKn5pZbUzBPn9UQGxVcZACTGzueTFG0l6iP1WJPjfX5eHJZX5mS2IEKNXPN3ZrNGPBArryAL04TAbzuIy31uF1zu0iJhVq/7VgUPmuE8vGLHov6jm1EcidNmDqXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859714; c=relaxed/simple;
	bh=YsZRZJwMyF0JmyqtIb+8z2p9fViWe6kZh3QoXuO4hHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sxe8BOmJilKFoPtiPzoUR9mj5l8T0oZQ834xnvIAdnr1X2D04dBD2E9N0CEGmhPyqlsidnyM5LetHeDm3L2e37TJHkaEoKTY+o/SrrTIM2HnCyoGHWDusecq46dmoH/l+JIdUjb+wTfKzoYc56AqK7iT8+4BAJSSJQSCPkdz+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHRqZIFs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so49525615e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776859711; x=1777464511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OH3FKNYqov5c9Pzh8OPnLDc5XEVHpmOUMSX0nrhvEyY=;
        b=RHRqZIFs6ENqRaRKi5y6p99EtomBsLiFadK/djnrxMblhOMSc+sf4v2t96+GyrNPBa
         kXj1O+fvBKB+GxuNt3heDoB3S/8+NvAv3aMmUnFOVQAf/y2dznYqb4HfK4WM6HV9QzQ8
         TyZw+hRowkTmhzmGC9HSJKm1AmVkGWnQQt29rlzFVc3KJEBIPhJWmPI/xdps8GZZs9HI
         MDCQtlwlS65MpG9keG81KZdHcjwIG14uW0YjT0D8u7EBKzUvfUuuN1cHloL5nQ1WI3Fk
         1sFJa/EyAyHgqrE4pAHBk6erLCyRER+phRga7ZmHSuAlehhYjfVw3Lwwm+8N5rcoe8cW
         0E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859711; x=1777464511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OH3FKNYqov5c9Pzh8OPnLDc5XEVHpmOUMSX0nrhvEyY=;
        b=hTLIFttfOH7kGYNRqc+ysoh4Sf68WnEnvH5kR/vEquZkyHiDpU/r43nXdfvszgytu3
         X8BlZwxCTbmXSPCoOpb3Ma7laeV5GWZ3YsWKdrAaFive7qIkby5Oeu48Odp9kJ5JS8wF
         7ANLKTRBVOTEBsHfGHEvEpXcfCGbmx6QeRuB2vxp30z4AzQ3RhZVtWJ7yoC/1u97UwhZ
         /1G7esQ5649fsgnlJ/YKtAUuunKWxOMHgagryZh0mOSYDNUemwz1+/ZjNUWIfc8CU6M1
         ud7RmGAUwZN7MEapH5Q8qd8dHAesnLg2hzjRLEwEUsHURDTC3+9ecKJFdt53N71muufS
         H9Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9iR9j0D4eCgm8cXxr6EFoWDcHsT+x1Wf4d/4hKlVbLqM+e312qclLmhOWQk5oY+tx+pBJoxns7Btli@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1J0YPkXMoCBYwHfp6Y6yexeuG5z+jVjo/TFb10763sZjUOEpP
	Z9gzEn+LE4bF4AHFprjyZm32q/6byhF1LAJkKmAjdmZP20VT1YvTTHV+
X-Gm-Gg: AeBDiesED2MYHwCEv+fKmPxC27X4IaS/QzzVlXK6KT63mvQ/XxF9PLhxq98WFdntQ/L
	Lp/IUQsr6D/dNfnpuwjuZgmh2KelMkkP452dA/ApQlEaRr1ANZWo4GESKnkB9zIwVbLqGS33IXu
	u+YAe5BwKsB5IlCjM/IPV1VtTOWXAV4by7VviB2P+XGpdlaEldVqIRMUkzyVe70fn10iDAGPd5y
	Fu/984szCdzwXJET5YsaxTo89atwlVU0VkSxdujlH5D29IvseXLxgU/y1zp4EalSzxsC3K7wmjT
	7Vu0d5IrcLoHLeUcmxPDenS1KgubI4pHnJAImq04IfjD5q00QPJI6x1QoJCW2qt9KWmFxY0LybM
	lWJe/7HaASujLrEq0tSLBKVGFUv6KKqtmEEiYbAQ5WgWdP5oVVLrTCp6uG3IEuJa7SFUyomle2b
	cD/ZTnYkHzf0YzCz0v88ncv+1rVp78HAIe6pbiEJkkg1of8ptujyZwexQL+Z76u0fZH3iXr4zZU
	sl+8Tw=
X-Received: by 2002:a05:600c:4fc6:b0:48a:53ea:1408 with SMTP id 5b1f17b1804b1-48a53ea15a4mr119784885e9.8.1776859710927;
        Wed, 22 Apr 2026 05:08:30 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:3c42:f121:865e:1066? ([2a01:e11:202b:40:3c42:f121:865e:1066])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm383222985e9.14.2026.04.22.05.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:08:30 -0700 (PDT)
Message-ID: <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
Date: Wed, 22 Apr 2026 14:08:29 +0200
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
References: <woxnPhTYiKi2aLzBK8GnO8DpvdgYjQc-P42uhJOzyrcYC3Gdstht27hML8yNHgOklhm2MgGA7wt9gGZ17BHoWlG0vqJuVVJDgCSev8udfds=@protonmail.com>
 <NIIS8XD_nSRvp36X39GxcDRAWsaScQIFx6o9JsFCbyBZk5PqznRdxg9EDDb_9tzWd5TcjzxrRtFx5_uLCVa5wJAYykW2k0Ue_XPMPtWCQiY=@protonmail.com>
 <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <20260422095558.GC557136@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35353-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.1.99:email,0.0.0.21:email,0.0.0.24:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email]
X-Rspamd-Queue-Id: 31F91445B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/22/26 11:55, Mika Westerberg wrote:
> On Wed, Apr 22, 2026 at 11:45:33AM +0200, Marco Scardovi wrote:
>> On 4/22/26 11:07, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Wed, Apr 22, 2026 at 09:51:01AM +0200, Marco Scardovi wrote:
>>>> On 12/18/25 11:38, Mika Westerberg wrote:
>>>>> On Thu, Dec 18, 2025 at 11:33:14AM +0100, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 18-Dec-25 07:39, Mika Westerberg wrote:
>>>>>>> On Wed, Dec 17, 2025 at 07:19:56PM +0000, Francesco Lauritano wrote:
>>>>>>>> On Wednesday, December 17th, 2025 at 7:01 PM, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>>>>
>>>>>>>>> On 12/17/25 10:57 AM, Francesco Lauritano wrote:
>>>>>>>>>
>>>>>>>>>> On Wednesday, December 17th, 2025 at 4:12 PM, Francesco Lauritano francesco.lauritano1@protonmail.com wrote:
>>>>>>>>>>
>>>>>>>>>>> The _AEI defines 5 GPIO interrupts. Narrowed it down to two:
>>>>>>>>>>>
>>>>>>>>>>> gpiolib_acpi.ignore_interrupt=AMDI0030:00@21,AMDI0030:00@24
>>>>>>>>>>>
>>>>>>>>>>> This fixes the delay. Pins 0x15 and 0x18 both call: \_SB.PCI0.SBRG.HNC0()
>>>>>>>>>> Traced it further. HNC0(pin, 0) takes the Else branch and calls:
>>>>>>>>>> ATKM(0xC0)
>>>>>>>>>> ADTM(Zero)
>>>>>>>>>>
>>>>>>>>>> ADTM calls NOD2(), which is the actual culprit:
>>>>>>>>>>
>>>>>>>>>> While ((Arg0 != RDNT))
>>>>>>>>>> {
>>>>>>>>>> If ((Local0 >= 0x0F)) { Break }
>>>>>>>>>> Notify (^^GPP0.PEGP, Arg0)
>>>>>>>>>> Local0++
>>>>>>>>>> Sleep (Local0 * 0x64)
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> It notifies the dGPU and polls RDNT, sleeping 100, 200, ... 1500ms per iteration.
>>>>>>>>>> Max 15 loops = ~12s per pin. GPU doesn't respond at boot so it maxes out.
>>>>>>>>>>
>>>>>>>>>> Two pins, ~12s each, ~24-36s total.
>>>>>>>>>>
>>>>>>>>>> Francesco
>>>>>>>>> Any idea why isn't the dGPU responding? I would have expected
>>>>>>>>> https://git.kernel.org/torvalds/c/4d4c10f763d78 sets up policy that it's
>>>>>>>>> in D0.
>>>>>>>>>
>>>>>>>>> Is the dGPU turned off in BIOS or through some reverse engineered
>>>>>>>>> tool/API or something?
>>>>>>>> dmesg without the workaround:
>>>>>>>> [    1.005184] pci 0000:01:00.0: PME# supported from D0 D3hot
>>>>>>>> [    1.288811] pci 0000:01:00.0: vgaarb: VGA device added
>>>>>>>> [   38.250139] nvidia: loading out-of-tree module taints kernel.
>>>>>>>> [   38.369358] nvidia 0000:01:00.0: enabling device (0000 -> 0003)
>>>>>>>> [   39.744421] NVRM: GPS ACPI DSM called before _acpiDsmSupportedFuncCacheInit
>>>>>>>>
>>>>>>>> GPU is in D0 from 1.0s. nvidia loads at 38.2s after the GPIO hang completes.
>>>>>>>>
>>>>>>>> No weird tools/APIs besides userspace utils (asusctl/supergfxctl).
>>>>>>>>
>>>>>>>> No changes to BIOS factory defaults other than disabling Fast Boot.
>>>>>>>> dGPU is active, Display Mode is Dynamic (hybrid).
>>>>>>>>
>>>>>>>> Traced RDNT - it's set by GPS function 19 in the ACPI tables:
>>>>>>>> Case (0x13)
>>>>>>>> {
>>>>>>>>        Debug = "GPS fun 19"
>>>>>>>>        \_SB.PCI0.SBRG.RDNT = (Local1 + 0xD1)
>>>>>>>> }
>>>>>>>>
>>>>>>>> As far as I can understand GPIO initcall blocks at late_initcall_sync, preventing nvidia
>>>>>>>> from loading in time to respond. Based on the timing, GPU is awake but nothing can
>>>>>>>> register a handler while kernel is stuck at NOD2 polling loop.
>>>>>>> I wonder if you could try with the nouveau driver so that it's built-in to
>>>>>>> the kernel proper? Then it should be ready at the time these events
>>>>>>> trigger.
>>>>>> That is not really a workable solution though.
>>>>> Yeah, I did not meant it to be the "solution" rather just to check whether
>>>>> it is related if the GPU driver is there or not. You cannot build the
>>>>> proprietary driver into the kernel so that's why I suggested the
>>>>> open-source one.
>>>> Hi Everyone,
>>>>
>>>> I would start saying sorry for the necrobump. I faced the same problem on my
>>>> G614PR and fixed the same way as Francesco.
>>>>
>>>> Do you happen to know if there is any news about this? I'm currently on
>>>> CachyOS with kernel 7.0 and noticed it behaves the same way as 6.19.
>>>>
>>>> I'm on to try patches or provide more infos if needed, even if I have to
>>>> admit I know Linux but not that deeply.
>>> As far as I can tell no updates unfortunately. I guess we could go with
>>> slightly updated patch from Francesco, like below that just ignores those
>>> two interrupts. Can you try if that works for you?
>>>
>>> This list of devices that suffer from the "edge events on boot" seems to be
>>> growing so maybe we should re-think if that should be enabled for all
>>> systems or limit to the problematic ones (although that list could get big
>>> too ;-))
>>>
>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
>>> index a0116f004975..4e60a176ac93 100644
>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>>>    			.ignore_wake = "VEN_0488:00@355",
>>>    		},
>>>    	},
>>> +	{
>>> +		/*
>>> +		 * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>> +		 * causes acpi_gpio_handle_deferred_request_irqs() to
>>> +		 * stall for ~36 seconds during boot so ignore the two
>>> +		 * interrupts involved.
>>> +		 *
>>> +		 * Found in BIOS G614PP.307.
>>> +		 */
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16 G614PP_G614PP"),
>>> +		},
>>> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>> +			.ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>> +		},
>>> +	},
>>>    	{} /* Terminating entry */
>>>    };
>> Hi Mika,
>>
>> thank you for the quick reply. AFAICS the patch as is would only works for
>> the G614PP and not for the others (for eg I have G614PR_G614PR).
> Ah sorry missed that.
>
>> Assuming all the variants suffer the same problem would it be ok to use a
>> wildcard for it?
> Yeah, we could expand it to all "ROG Strix G16" I think:
>
> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> index a0116f004975..e3a6111854e8 100644
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
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
> +		},
> +	},
>   	{} /* Terminating entry */
>   };
>   
As for now it seems working. I've reverted it on my kernel as I prefer 
remain as much as possible close to the CachyOS' one but hopefully it 
will be implemented on 7.1, if someone propose the patch and it is 
accepted. It would be amazing to see Asus more interested on Linux and 
more strict with their BIOS but in the end I understand it's like asking 
for the moon.

