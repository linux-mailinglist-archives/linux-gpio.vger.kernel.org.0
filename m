Return-Path: <linux-gpio+bounces-36001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC8yJV1Z92mxgQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 16:19:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F034B6030
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 16:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D9213002924
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 14:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5F43C8700;
	Sun,  3 May 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxCxleWV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6233CBE70
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817942; cv=none; b=n3IRhvG+GY4r7YreD5L0krrZAiHPu7umWFPPkMHxlRlmW52Jgk5YR8OZKPzWkvED4IhyLMaRPNi8lmd9P1I0D2pFRGPI4ebfqj0KShi6DB/JTd+zKcCIlxz2yvxTw2W3JetI6oWM5MtuAuaa0Oyjqh+9pTppqttXCJvD/Vp4oxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817942; c=relaxed/simple;
	bh=k2g4JV1KUrs12s7qAM9odomL0DLieqxgng3pruwzcJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4A+Ndun65db2HXSna4EP+s23PuzS+CmaFEJY3daUQk66jU9wu3RlklUyAY8vJ2eyTod3LLlHMvqFoqohk10dQcSp0ajutBfnbvaELyc2okJl9TI+Jd75J7fu5cC2yMNIJDr/wsOJwE2hDw9zvRKQV5jSSeN3fJwkle2HzR15LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxCxleWV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so52934775e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817939; x=1778422739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D31Kjx5p4Zz0J/9eHZzNKvFTByn7RU7HP4MuPEMcbXY=;
        b=FxCxleWVN7MUblEkz+DTBFfykM3uOd4ljZpkD8n02Xxh0N21/QcqUoIxh1P7lNZSVP
         S4bUEfUp8j7DmN2JpD8x0EKYLqDZG+CjqgvRtNACbTrI8caK2156xKy1pk3YLbO2xoWL
         n+WDd36/Bwhqk8tyFP7VzWLEt8q3HmolSgzTixH4Btwbz5FtU6wcoO/Bv4Vonm9EPeYx
         9AxLBrW0RsrigQCXe47Nj9IdgH4WpJR90fQhmvkHqVo38IRNur2bcQd66hAWdr9sojOm
         FJyJaFOAdzyyYcuIfTmGeTB4IwcFEeKJsiwbXFyHz9Cnk6pDGMhPzm3dla29nD6qESZB
         agNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817939; x=1778422739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D31Kjx5p4Zz0J/9eHZzNKvFTByn7RU7HP4MuPEMcbXY=;
        b=X3vjOja8TcHYBqhkrshjnSWcBQkBp4e2oKcH78UBo/c/lU6xyzctyo5yvgIxAVtbUQ
         gf2h7T8gYHjRVo4Lqr1FRsH63AvvHGW+fJsdxZJTEXO9kQkGkzxpIoc2DiT3HtWfLuqp
         TEaPP7LFVVLMDqJwymvd+Fe6JjkawYJkB6DmfJjhTaG/l33EW/xADh6h4SRJ8WdMVl3o
         FiLpRRj1vJ6JX8ZLPs8eGjmSgeHPnU3wlamdx7ALjbJ/p2yvAyxyCDaa5+F4Tm3pp5Ml
         uAoZ0B8kDs8+AuGkU7LBuJCuOQtrDf59j/LwMt4saAxbK1YIvLmjiNmW1liwLPSATVMu
         5bLw==
X-Forwarded-Encrypted: i=1; AFNElJ+oVgjG1QlORDKQ2laOWucGnScsjWe9zpYY28X2/jU93DkjF4auo8y7DL5xK/Ty7i64mIz1sjsLk4qY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/wuC3Lcq7KzAjv6YssUHE/rZq5VBttFMtarvDfRrCrnjt2kX
	wCmEmoxq0Fp/wsuvXSmXKXWBBv3UHvG6SVNLgDyBzb0W7Z5kYZD5pBn+
X-Gm-Gg: AeBDietn5qxG55PCUQseBAqvRjndpuqzSezmiKLDy3MKkVRnCsNBQbUqc54v9oUU8y+
	exlKKfwFbSDhwG2L/e8C8y0EzARmX4uYaYqSPbKLtgOSvhITL55MLDFkoE1mR4x19VNrtz8KoSG
	Ml5SdcxjN84Yo00V7/02w128z7paSNPm3jg46nEJQSBcMQDPp9nIHXtGGnhaRsHvHMTQ+WzsIX9
	YjNgESWEKSe8V/IgMqfXijcO9BE2iDSMnTQidvaevzkjpi6Ash83YYYK0oOLk7A+se3xKA0VeDv
	2jZs/EnYvtAtVngBm05AoQ6maXdFUzYjFazThxb6QIqaknUBs2a4fpWxGDkts5hHKV62kvZWKxV
	uslJyTYVGN/lsYEqr8TWy6JgPxlglZG04VLJfAdpsutt/ZHwj825QAtmQcECPbIq17W48ONrQWM
	ibRkFBGrNCAcKSJZ+vqzTf1peMwOFcvEthL2GGxRW6wVcmS+xeg7TPVN1pEqDTLkEdl4h15eq7w
	M8u1Pg=
X-Received: by 2002:a05:600c:698d:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48a9852f4b9mr100217425e9.6.1777817939042;
        Sun, 03 May 2026 07:18:59 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:68b1:8d59:e348:c16e? ([2a01:e11:202b:40:68b1:8d59:e348:c16e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm209044485e9.7.2026.05.03.07.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 07:18:58 -0700 (PDT)
Message-ID: <a42767b8-7a0c-4202-9132-be8fa65baabc@gmail.com>
Date: Sun, 3 May 2026 16:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
To: Hans de Goede <hansg@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, westeri@kernel.org,
 linusw@kernel.org, brgl@kernel.org, bentiss@kernel.org,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 Armin Wolf <W_Armin@gmx.de>, mika.westerberg@linux.intel.com,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
 <6f359bec-2525-40e9-9994-15b16fb82f12@kernel.org>
 <afHcUTi5QNq8LlIb@ashevche-desk.local>
 <c7fb45be-f53f-461f-b7a2-8298e5c7df05@kernel.org>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <c7fb45be-f53f-461f-b7a2-8298e5c7df05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 95F034B6030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,protonmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36001-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


On 4/29/26 13:01, Hans de Goede wrote:
> Hi,
>
> On 29-Apr-26 12:24, Andy Shevchenko wrote:
>> On Wed, Apr 29, 2026 at 11:48:13AM +0200, Hans de Goede wrote:
>>> On 29-Apr-26 04:52, Mario Limonciello wrote:
>> ...
>>
>>>> +	/*
>>>> +	 * Make sure we trigger the initial state of ActiveBoth IRQs.
>>>> +	 *
>>>> +	 * According to the Microsoft GPIO documentation, triggering GPIO
>>>> +	 * interrupts marked as ActiveBoth during initialization is correct
>>>> +	 * as long as the associated GPIO line is already "asserted"
>>>> +	 * (logic level low). We should not trigger edge-based GPIO
>>>> +	 * interrupts not marked as ActiveBoth.
>>>> +	 *
>>>> +	 * See: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
>>>> +	 * Section: "GPIO controllers and ActiveBoth interrupts"
>>>> +	 */
>>>>   	if (acpi_gpio_need_run_edge_events_on_boot() &&
>>>> -	    (event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
>>>> +	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
>>>> +	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
>>>>   		value = gpiod_get_raw_value_cansleep(event->desc);
>>>> -		if (((event->irqflags & IRQF_TRIGGER_RISING) && value == 1) ||
>>>> -		    ((event->irqflags & IRQF_TRIGGER_FALLING) && value == 0))
>>>> +		if (value == 0)
>>>>   			event->handler(event->irq, event);
>>>>   	}
>>>>   }
>>> One nitpick, which can be a follow-up patch since Andy has already picked this
>>> one up.
>>>
>>> I think that now that the second if condition has been simplified to just
>>> value == 0, it can be added to the first if as " && value == 0" dropping
>>> the nested if.
>> But we need to get that value first (unconditionally!). I think it wouldn't
>> be desirable change.
> Ah right, I read over the line getting the value I thought this was already
> done, never mind:
>
> FWIW:
>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>
> Regards,
>
> Hans

Hi everyone,

I tested it personally against both kernel 7.0 and 7.1 and can say it works.

Are there any news on how it is proceeding? Somewhere I can check the 
progress?

Best regards,

Marco "scardracs" Scardovi


