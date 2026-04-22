Return-Path: <linux-gpio+bounces-35339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBGKB1R/6GkILAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:57:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A665C44330E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B2930470E9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 07:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F5F373BF3;
	Wed, 22 Apr 2026 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv7fSa/R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5D2609C5
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844267; cv=none; b=mKxpzlz/sUfdSV6gmHd2t3uAfI47bfmplB/F/qMy+gIh16tACfe6kY+M+WIW+WBXW3eLwu6AKJ+Lx9xamQInXVD0k37Cn5jUg2pSJNCRYZHVd4kQSnyHf4/WChqpa/pDLn0kjIj1a17oAqeAulmJxTwDZu/VdW+v6ByHDghEQbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844267; c=relaxed/simple;
	bh=Fm+6JsKYL5p+lIphcLpRUQ//+P47s7cB1+1S8XqDqhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw1yG3ztLc0kAHUtztV84hHfxRVZZAJjg9lHhSNEHzc2zKnQD5kKui73uVBJIOyiMqgXB+aXzdc09MNmCLV6hh2/TyCWJWj68prn6EybQ4KGxXF28qS56R3B/+dqSLAuoXxAisiFLj2VMSJCW55Ov+zrbvgyaZXqpcGc8UdOtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv7fSa/R; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so65610325e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776844263; x=1777449063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OeBgF5ArqvNpLLh7sLJtZPShItT09VS9VrZ4plNfw2M=;
        b=Rv7fSa/R489VJu0OABj246u0IlY+Hv9LASHu/qttbr4la7yqF1lmWU+8uCgmRW4Y0y
         +YGuDkGvDhcZlGd9hqqWlaKl1WryBDGh/s/eGdQxoGt1vVLjaZqNikDQ+fwzt0LeMtTk
         1SuOEYpfAvvXYn588BdAWrg6qtJ3KorP+1hzsjm3T5qM8zti7qhpiYlffmy3Nb0uE9O1
         0aGCb9Q0RN6Q11fS3cvuC/wIUMHS1CG3Y03917brcSe9J9MOje16gVeS80x5H7+vKV31
         2g4R3lp6A8Cw9Gv4XV/QohaYlxvDYfEB3bzvwaAI/FyoUB9nIAGeNRqbcCglKFGijsyt
         iGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844263; x=1777449063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeBgF5ArqvNpLLh7sLJtZPShItT09VS9VrZ4plNfw2M=;
        b=ZjbPTBYcpm4VoNGa47scAUa7Vv5M8us1rZrNYKT+uAsRWUb9Y+hD+78mPn1yxH/o9C
         mcVO1KINr7c1Pt4hyhVP9Lv9tT99UeUPBO/AJG2wft7JI8KbluFipuDWGJ/4nF0FXNk7
         n1W9wZ+QfthzTz8HN8cnv7bGa9slrU/k/AgLqHl+QHWVqVqUkHmm6xK9Vlxt39wnLcr6
         COCdCjK49kIXsV5qcjXQRXhkgnm/ozYATZJADnx3SOfMx+SZVnZ26KE/lDsUUoJ6YaZ0
         61gukVGjVyN73Fmpmxx2x7PlZvwz95sQK2GgkqqZKi5SD8mMgOopHq0i67JFPhDRw4q4
         ZKeg==
X-Forwarded-Encrypted: i=1; AFNElJ//YIiccpVAqssP/r1eCwghTIc96tsrCqDNnlz3o6ZsxUAG49lo2pgbVp8jUagcreLrE79Urq+3ua79@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Vb5BCmjoUQmTql1zKQs+VcJDmtEP704zyPVPUyrMRreacjJz
	2JRN5DV3kH0QqfNkD0gpuk+oV9IfJAmr/3ai8hurFJxp5rQQkm8Q3Rlp
X-Gm-Gg: AeBDiev2UO3O3ApOOEKpL8iB6iai5m+x39edXsSDXAo93itTYAFhzAo1DEt1kIeV8nI
	RESZTHWXWxtUd/1IxHNAlZbHZEPvgm3TrJR3+Y8FEwaWH80NQzUWJzWms8gxp1UIAVQ3Ykytnwc
	61ZKGqX6XQFwhgp6MxmI5Cw8+S0FgtsfXcuYkYiS2zlWZMZu7q1x6rCNX43dLf4xUt5O2a3wuPF
	N0fo09dxaGwpPva3PjFr0sX7rt49SCQW00AUk6rB99PHVFb3sEcAAYrrqvppAVYLXDBmezH2TcW
	ozQCDpvYtzWLQfwwftZ1xsK67nKZqB0yxJYBCT4rN07hkcwsL0nGMaKQ/GhxgCljyGG9YFEgvgo
	B9fRayIdugYhkB/CCzTomf4ISVai7htV23qhAr5azgJygGW7aWJgw2EvflyABT585tw8DplbrUh
	qMHB9WUyzxvFDOFCBioxiFduJuIVo2Piu5MwJFCtIO6/GXpWQO66dRRFopGhetkmfFDcU72rEas
	1lWlpU=
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr347044255e9.22.1776844262834;
        Wed, 22 Apr 2026 00:51:02 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:3c42:f121:865e:1066? ([2a01:e11:202b:40:3c42:f121:865e:1066])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a575ad67asm79137295e9.2.2026.04.22.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:51:02 -0700 (PDT)
Message-ID: <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
Date: Wed, 22 Apr 2026 09:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <2kSCn4XaoXsXJ3EUR0syTdmip8Z1cBuUr0Br4sFVnwnsA8q4GlhiHOmsJkeBxvxYoLnetp4r44wIPXw42yTAFl-BtMROnIwR-NkckKgA5EY=@protonmail.com>
 <6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com>
 <4402ed86-77f5-4a47-a9e1-8d57a709bb15@kernel.org>
 <woxnPhTYiKi2aLzBK8GnO8DpvdgYjQc-P42uhJOzyrcYC3Gdstht27hML8yNHgOklhm2MgGA7wt9gGZ17BHoWlG0vqJuVVJDgCSev8udfds=@protonmail.com>
 <NIIS8XD_nSRvp36X39GxcDRAWsaScQIFx6o9JsFCbyBZk5PqznRdxg9EDDb_9tzWd5TcjzxrRtFx5_uLCVa5wJAYykW2k0Ue_XPMPtWCQiY=@protonmail.com>
 <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <20251218103831.GW2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35339-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.21:email,0.0.0.24:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: A665C44330E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 12/18/25 11:38, Mika Westerberg wrote:
> On Thu, Dec 18, 2025 at 11:33:14AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 18-Dec-25 07:39, Mika Westerberg wrote:
>>> On Wed, Dec 17, 2025 at 07:19:56PM +0000, Francesco Lauritano wrote:
>>>> On Wednesday, December 17th, 2025 at 7:01 PM, Mario Limonciello <superm1@kernel.org> wrote:
>>>>
>>>>> On 12/17/25 10:57 AM, Francesco Lauritano wrote:
>>>>>
>>>>>> On Wednesday, December 17th, 2025 at 4:12 PM, Francesco Lauritano francesco.lauritano1@protonmail.com wrote:
>>>>>>
>>>>>>> The _AEI defines 5 GPIO interrupts. Narrowed it down to two:
>>>>>>>
>>>>>>> gpiolib_acpi.ignore_interrupt=AMDI0030:00@21,AMDI0030:00@24
>>>>>>>
>>>>>>> This fixes the delay. Pins 0x15 and 0x18 both call: \_SB.PCI0.SBRG.HNC0()
>>>>>> Traced it further. HNC0(pin, 0) takes the Else branch and calls:
>>>>>> ATKM(0xC0)
>>>>>> ADTM(Zero)
>>>>>>
>>>>>> ADTM calls NOD2(), which is the actual culprit:
>>>>>>
>>>>>> While ((Arg0 != RDNT))
>>>>>> {
>>>>>> If ((Local0 >= 0x0F)) { Break }
>>>>>> Notify (^^GPP0.PEGP, Arg0)
>>>>>> Local0++
>>>>>> Sleep (Local0 * 0x64)
>>>>>> }
>>>>>>
>>>>>> It notifies the dGPU and polls RDNT, sleeping 100, 200, ... 1500ms per iteration.
>>>>>> Max 15 loops = ~12s per pin. GPU doesn't respond at boot so it maxes out.
>>>>>>
>>>>>> Two pins, ~12s each, ~24-36s total.
>>>>>>
>>>>>> Francesco
>>>>>
>>>>> Any idea why isn't the dGPU responding? I would have expected
>>>>> https://git.kernel.org/torvalds/c/4d4c10f763d78 sets up policy that it's
>>>>> in D0.
>>>>>
>>>>> Is the dGPU turned off in BIOS or through some reverse engineered
>>>>> tool/API or something?
>>>> dmesg without the workaround:
>>>> [    1.005184] pci 0000:01:00.0: PME# supported from D0 D3hot
>>>> [    1.288811] pci 0000:01:00.0: vgaarb: VGA device added
>>>> [   38.250139] nvidia: loading out-of-tree module taints kernel.
>>>> [   38.369358] nvidia 0000:01:00.0: enabling device (0000 -> 0003)
>>>> [   39.744421] NVRM: GPS ACPI DSM called before _acpiDsmSupportedFuncCacheInit
>>>>
>>>> GPU is in D0 from 1.0s. nvidia loads at 38.2s after the GPIO hang completes.
>>>>
>>>> No weird tools/APIs besides userspace utils (asusctl/supergfxctl).
>>>>
>>>> No changes to BIOS factory defaults other than disabling Fast Boot.
>>>> dGPU is active, Display Mode is Dynamic (hybrid).
>>>>
>>>> Traced RDNT - it's set by GPS function 19 in the ACPI tables:
>>>> Case (0x13)
>>>> {
>>>>      Debug = "GPS fun 19"
>>>>      \_SB.PCI0.SBRG.RDNT = (Local1 + 0xD1)
>>>> }
>>>>
>>>> As far as I can understand GPIO initcall blocks at late_initcall_sync, preventing nvidia
>>>> from loading in time to respond. Based on the timing, GPU is awake but nothing can
>>>> register a handler while kernel is stuck at NOD2 polling loop.
>>> I wonder if you could try with the nouveau driver so that it's built-in to
>>> the kernel proper? Then it should be ready at the time these events
>>> trigger.
>> That is not really a workable solution though.
> Yeah, I did not meant it to be the "solution" rather just to check whether
> it is related if the GPU driver is there or not. You cannot build the
> proprietary driver into the kernel so that's why I suggested the
> open-source one.

Hi Everyone,

I would start saying sorry for the necrobump. I faced the same problem 
on my G614PR and fixed the same way as Francesco.

Do you happen to know if there is any news about this? I'm currently on 
CachyOS with kernel 7.0 and noticed it behaves the same way as 6.19.

I'm on to try patches or provide more infos if needed, even if I have to 
admit I know Linux but not that deeply.



