Return-Path: <linux-gpio+bounces-37648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJgiLTnMGGrrnQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 01:14:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B205FB421
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 01:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B500306126F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 23:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF7836C0BD;
	Thu, 28 May 2026 23:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTjfC1zq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5443369D4B;
	Thu, 28 May 2026 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010000; cv=none; b=BnUzetRQ3hpafVA8gS9G2rC7rDuYOorWFZdm/bPKaVhOnUAGbEd9CcmUEXLKyW7nOP8M1F8IWyQEPW6fueq4Wgzfyc3iZ6Sp1M2OGrVfT+376a7/KWX4KEO2umUp8OHYsVloKjqQTNqeSPBzcuPyyjqY06u30JEpnl0SYGKh5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010000; c=relaxed/simple;
	bh=dU6fF5FvcXF6Ccm7FNR+2XPUjPxNUBJH87UVtyKgytQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtE//TFeeyTPrQsB42vYctsCsPVQ4bLshrIS/pRCHJLI46Ttk6T0ZGYmHWkOvns+tgjAtCXB5lORk0Z9VOQU01oHOcn2M/dvVsaIEC2pI0gJCp+MhtpaIe49KWOU53UgeSNtDQSCqeRy5s3dchWy/x8cU952ypNKCpDFarkh0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTjfC1zq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2111F000E9;
	Thu, 28 May 2026 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780009998;
	bh=jxsu5mpsWeNQpL/7LwNAkICxQ+raS+/vGx6vG9IPh6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CTjfC1zqN/f25TuVrh8z6Gm++9hek8f7lGEmMth7BPG6N5mWPF55axVEeuqQIeYP0
	 Dl2hI+OL+vzoHXSmakMOfZiZAYAl3JqZWr0RUMobFWAY7LTchZcHvywuJJdd2GgxeL
	 /BAp3LVPK8pdvXOF57KBcoh/X2itxGKpabiO94w+7CNDLvNNZ7l/cXuE/5J5dAflM/
	 NbQjewth7iomzXwjekq+7AnK9Uq0R8whBvqp29bkMayj3GJ+axg6lc4LdE/QBpJCqF
	 Faau3sSY9URM/d0vg+J0NPXgHiaBzeHAT/jajfb1Tdi3sJK3NZvnfDbWv4vaD/pbwg
	 qqFN/g1m/MSIQ==
Message-ID: <63e6fdb6-1679-44f5-acfb-563ed3b56a54@kernel.org>
Date: Thu, 28 May 2026 22:24:03 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>,
 Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 brgl@bgdev.pl, basavaraj.natikar@amd.com, linus.walleij@linaro.org,
 linux-i2c@vger.kernel.org
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
 <20260523174440.9629-2-hardikprakash.official@gmail.com>
 <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37648-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 36B205FB421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 11:42, Bartosz Golaszewski wrote:
> On Sat, 23 May 2026 19:44:40 +0200, Hardik Prakash
> <hardikprakash.official@gmail.com> said:
>> I2C controllers may have child devices with GpioInt resources that
>> depend on GPIO controllers to be fully initialized. If the I2C
>> controller probes and enumerates children before the referenced GPIO
>> controller has completed probe, GPIO interrupts may not be properly
>> configured, leading to device failures.
>>
>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
>> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
>> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
>>
>>    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
>>
>> Add a generic dependency check in i2c-designware that walks ACPI child
>> devices, identifies any GpioInt resources, resolves the referenced GPIO
>> controllers, and defers probe if those controllers are not yet bound.
>>
>> This ensures GPIO controllers complete initialization (including IRQ
>> setup and quirks) before I2C child enumeration begins, fixing the race
>> without device-specific quirks or DMI matching.
>>
>> The probe ordering race was confirmed via dynamic debug tracing:
>>
>>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>>    2.348157  lost arbitration
>>
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
>> Assisted-by: Claude:claude-sonnet-4-6
>> Assisted-by: GPT-Codex:gpt-5.2-codex
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> 
> I don't think we use this tag anymore. Just make it Link:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Please make sure that we drop the now unnecessary patch that was 
committed from the earlier series when queuing this.  If that has 
already made it into a PR to linus (as part of -fixes or so) we should 
get it reverted.



