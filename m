Return-Path: <linux-gpio+bounces-37696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLalG22uGWpyyQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 17:19:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E914B604822
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 17:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09E7B3331063
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 14:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEA23E9F7D;
	Fri, 29 May 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1xnbE2i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F73DD537;
	Fri, 29 May 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065809; cv=none; b=ti3ckGs5hWyJdz7pfi32HVei8MA6g+vJqm+oX/fbMKZw5kxa/G3LDAIUrSuykJSvVJhm+pmDpR9l4X0BwYjTpBlvz7S++y1umHXkKU4OC/kq7C49QmSzUCl03OB+NXI1hYAqbn6uMN2BlwCReKxKL2Lo0B2ZS9d+BFFAZ/iAnvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065809; c=relaxed/simple;
	bh=llqHHBXafj2/eJ9qAxXvkIZgwgvw8FcXaS9VEIntx+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkuNUjpvwdj+snmKKyHRz7Yg/3hSkvFggy7caLgAyHWrqshm4YdYQWAMQUv6BZs39XNS8+EhZfvMXQHv2yq1yUO03NnEF4lYBmCCrXwzEFPUEZ3hO4QQbHRsuNSr/+tykKVFcHuVYjtnEoeybeZAdcJ1b985VvbJVstL/nw3I3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1xnbE2i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70DF1F00893;
	Fri, 29 May 2026 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065808;
	bh=Ap3IQUzK8ECOqaQJ6lsmmO3I8zu6ZCKctGfCPGdj+FM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B1xnbE2iVrTr1ilx/9kDRMy16h0/HUDyeRchRPYK1aXNrcxXYDw0WY+Jaf568P7Eu
	 FGai5NAmhWEjMvPmrJHdeDKxZlw6BfY/qHr0WL1IVccGmywara/CsuM89dJH1/QPYP
	 AYY8Fy+5W4k/2X42IhDmokxGhjQ/oDUPpHnqulvVQziaRStcCtscr49OcbotHGcxsw
	 /DXPg5/LpLXyvksLV0/iESmzuOtfiFO9M1U84OYcs8MANhdiv82YWq59lUjwyJTm4L
	 +f4gkHeINjZ8ZsCvdxIVS8uYTJm6DFk5KNRUL913Kidjvnbutgvu+pzGdNIy16KFEJ
	 F6s/ACgHC0jcw==
Message-ID: <9d7590b5-bda7-4274-a5a9-b5c22ee394a1@kernel.org>
Date: Fri, 29 May 2026 16:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@intel.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
 linusw@kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, kernel test robot <lkp@intel.com>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org> <ahml4iX_FpI7Arwb@shikoro>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <ahml4iX_FpI7Arwb@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,bgdev.pl,amd.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-37696-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: E914B604822
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 16:42, Wolfram Sang wrote:
> On Fri, May 29, 2026 at 12:12:31PM +0200, Mario Limonciello wrote:
>>
>>
>> On 5/29/26 12:08, Hardik Prakash wrote:
>>> I2C controllers may have child devices with GpioInt resources that
>>> depend on GPIO controllers to be fully initialized. If the I2C
>>> controller probes and enumerates children before the referenced GPIO
>>> controller has completed probe, GPIO interrupts may not be properly
>>> configured, leading to device failures.
>>>
>>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
>>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
>>> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
>>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
>>> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
>>>
>>>     i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
>>>
>>> Add a generic dependency check in i2c-designware that walks ACPI child
>>> devices, identifies any GpioInt resources, resolves the referenced GPIO
>>> controllers, and defers probe if those controllers are not yet bound.
>>>
>>> This ensures GPIO controllers complete initialization (including IRQ
>>> setup and quirks) before I2C child enumeration begins, fixing the race
>>> without device-specific quirks or DMI matching.
>>>
>>> The probe ordering race was confirmed via dynamic debug tracing:
>>>
>>>     0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>>>     0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>>>     0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>>>     2.348157  lost arbitration
>>>
>>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Assisted-by: Claude:claude-sonnet-4-6
>>> Assisted-by: GPT-Codex:gpt-5.2-codex
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
>>
>> Fixes: 3812a9e84265a ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on
>> Lenovo Yoga 7 14AGP11")
> 
> No Rev-by from you, Mario?
> 

I added to the individual patches instead, all LGTM.


