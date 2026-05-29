Return-Path: <linux-gpio+bounces-37675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNyyGBtnGWrZwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:14:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA08B6008FC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 728393058047
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15093362120;
	Fri, 29 May 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmMr8Qwm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA8A28506C;
	Fri, 29 May 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049596; cv=none; b=Doj2FuItwLf4q9f5w3d0mghP8naw9A5NZ9t40WPd8az32EU7ZqNUpPrq9MUMYoK9gy7g5dCjgurzoKV7Fs6tuYSVbKPKatHy2JVwzWeEJJ9aU6xVVP0YRC1QRQRAmoH2bv8h3yBg0eIzhMVRhO1YsD48FOeCk6YNuvcR5fv0ryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049596; c=relaxed/simple;
	bh=/O3mUfRul7/eSs//D1wSs/cMdPo5nLbK3Wikl4fpiSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAtmY5GJ1/bgY24V6W7kRrUroVY9XDzrcTkjU7fVrg4RxMz0OoKObvpHVNAuSZmxxCERztYqFngd71L12KoYJSrlBZj45f2VmWapksUhDe3zGhC+Wu+s1wiNPtb1jPoF6ocAG8+L6avEJWILNRPyt6qIWsaAXUSiHCMBFiaPOVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmMr8Qwm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC741F00893;
	Fri, 29 May 2026 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780049595;
	bh=ooSz/4P4lvD6bnWxiEeMqdaVmk0O3WlvMFEEEG6iHIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kmMr8Qwm15hGeQJ02R2+lKBPgNt3D15piA1G3OYjKTlX8r3cW3u4ezBXnL0cPwOYi
	 APNr2dtoifopEAApMjTfYkLe9mrh0lSquUig+t2MFNdHmjpibObZQDOFA3CDF8KfAa
	 rKndYn5mpxWAgQ8ieY0oon62jTyiWFbj484TgKnVbZ7K71Q2SrYDnYl2F+JPbjER0b
	 11OW5O+TC61Fh27MGXsD9eSOZw90fYWUGnKo2WZhPMbHzQaCLL9qDNxR8+BAkMUguA
	 M4C51nmyaWyeQuDT5nchohpMtj62HhdWDL9dc/BodtxXTmV56M4ukTIoCBmkL7ohpK
	 ANlQYcsWN6RSQ==
Message-ID: <970dd49f-cdae-4656-ba32-fa19f3c3bc5c@kernel.org>
Date: Fri, 29 May 2026 12:13:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] i2c: designware: fix WACF2200 touchscreen probe
 ordering
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>,
 linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com,
 brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260529100838.8896-1-hardikprakash.official@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37675-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA08B6008FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/26 12:08, Hardik Prakash wrote:
> This series fixes the non-functional WACF2200 touchscreen on Lenovo
> Yoga 7 14AGP11 by:
> 
> 1. Reverting the earlier DMI-specific GPIO IRQ quirk (patch 1 of the
>     original series, already in Torvalds' tree) which is no longer
>     needed.
> 
> 2. Adding a generic probe deferral in i2c-designware that walks ACPI
>     child devices, finds GpioInt resources, and defers probe until the
>     referenced GPIO controllers are fully bound.
> 
> Testing confirms patch 2 alone is sufficient — the existing
> amd_gpio_irq_enable() flow works correctly once probe ordering is
> fixed, making the manual IRQ restoration in the reverted patch
> unnecessary.
> 
> The probe ordering race was confirmed via dynamic debug tracing:
> 
>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>    2.348157  lost arbitration
> 
> Tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel 7.1.0-rc5+.
> 
> v8:
>   - Add revert of now-unnecessary patch 1 (Mario Limonciello)
>   - Collect Acked-by (Bartosz Golaszewski) and Reviewed-by (Mario Limonciello)
> 
> v7:
>   - Fix unused 'ret' variable in check_child_gpioint() (kernel test robot)
>   - Replace BugLink: with Link: (Bartosz Golaszewski)
>   - Add Reported-by and Closes tags for kernel test robot warning
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
>   - Rebase onto Linus Walleij's tree
>   - Use --base so series is correctly 1/1 (Andy Shevchenko)
> 
> v3:
>   - Fix variable declaration style (Andy Shevchenko)
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
> Hardik Prakash (2):
>    Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo
>      Yoga 7 14AGP11"
>    i2c: designware: defer probe if child GpioInt controllers are not
>      bound
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
>   drivers/pinctrl/pinctrl-amd.c               |  35 -----
>   2 files changed, 156 insertions(+), 35 deletions(-)
> 
> base-commit: 8fde5d1d47f6

I've left some tags on your series, no need to resend for them though if 
no other feedback.

They should be able to be picked up by the maintainers with b4.


