Return-Path: <linux-gpio+bounces-37411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOWgLOfqEWq5rwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:59:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEB5C03C7
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201143015E38
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 17:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459A53446B9;
	Sat, 23 May 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtU/sp75"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067512BB1D;
	Sat, 23 May 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779559042; cv=none; b=bc3Are96wbWX4uToBFYvxIke3zpmu7eSC4LgTNc9+EGhrnKeh7NAV1ayGYRvWnVNvsHS3gtyxvbP6eD/mVPcBa4VBSTHa0oSS+XgbtbSxSQQa8+7tuWM5OcCX2XuiHK7uWWXJByrac0pO79igHZpSj56E3vWSHwmnC4+GU6aXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779559042; c=relaxed/simple;
	bh=dG8m2Fc0j6LzN9SMfsdDp1y1HNxo/JPVWQkXUNkG5Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjnMjkZJU7LcsS6wANbx8c+xmyLP1P0yjiilJgWS/ryM3+I1can3ozUuGX86Q9IHpCQojbQpkrM7JU/ctn4VUxT+I2pnkDNHtJqhC4rfm234HTxR5Uz1mfi8R7+iEoKJodEQrQ13YY82n9vIDgy8GE1/2a76hqt19liKZnWaPy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtU/sp75; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE811F000E9;
	Sat, 23 May 2026 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779559040;
	bh=G/RetKAJRSwpWdu1PDP+KMyGok8pM1UY/4YpGi6zfmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DtU/sp75ffhhDIzl9v0McwLqsOf6oNmOyLfs/pi7yL+Fv19bosCzAGfcGX7VVV7Zz
	 hIBbQYsunmbS7gKEjTFOT3ULTBU/EaHT0DNtPRdukH4h+52dq2eb0QDWLTtBrJno+L
	 av4i8h66h4qPOGlb48H5RMnA5hkzhVzhurv8t7NbA0bxWata3twnBhS0VinEL/6Nyh
	 ILKjME8w/hkSWmTqN3BaTzQZA1OJkwZXN/Nv47y53eMoyt1yA8pk0Vg1xLmsbiq9U8
	 900q3ciXfP99GXsVPbVO98jgQos3Y7DikhZiVh9Rv83yKBuf2ghXJA1+VoAHxDBgYS
	 wMQi3jvMydFaw==
Message-ID: <5e467847-34b3-4d29-a09a-18f6fa8641a5@kernel.org>
Date: Sat, 23 May 2026 12:57:18 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
 linus.walleij@linaro.org
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260523174440.9629-1-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37411-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 17BEB5C03C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/23/26 12:44 PM, Hardik Prakash wrote:
> Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
> tree. 

Is patch 1 still needed with this approach?

> This replaces patch 2 with a generic solution suggested by
> Mario Limonciello.
> 
> The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
> completes. Dynamic debug tracing confirmed the race:
> 
>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>    2.348157  lost arbitration
> 
> Previous attempts to fix this via initcall promotion (subsys_initcall,
> fs_initcall, arch_initcall) all failed because the race is not about
> when the driver registers but about when probe completes. The GPIO chip
> becomes visible to the system via gpiochip_add_data() before
> amd_gpio_probe() finishes, and i2c-designware probes AMDI0010:02 in
> that window.
> 
> This patch adds a generic check that walks ACPI child devices, finds
> any GpioInt resources, and defers probe if the referenced GPIO
> controllers are not yet fully bound. No DMI matching required.
> 
> v6:
>   - Replace DMI-specific deferral with generic GpioInt dependency check
>     walking ACPI child devices (suggested by Mario Limonciello)
> 
> v5:
>   - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
>   - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)
> 
> v4:
>   - Rebase onto Linus Walleij's tree (patch 1 already there)
>   - Use --base so series is correctly 1/1 (Andy Shevchenko)
>   - Add subsys_initcall test results (Mario Limonciello)
> 
> v3:
>   - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy Shevchenko)
>   - Add BugLink tag (Andy Shevchenko)
>   - CC AMD engineers (Andy Shevchenko)
> 
> v2:
>   - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev()
>   - Use device_is_bound() under device_lock() with explanatory comments
>   - Add Assisted-by tags per coding-assistants.rst
> 
> Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454
> 
> Hardik Prakash (1):
>    i2c: designware: defer probe if child GpioInt controllers are not
>      bound
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c | 157 ++++++++++++++++++++
>   1 file changed, 157 insertions(+)
> 
> base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945
> 


