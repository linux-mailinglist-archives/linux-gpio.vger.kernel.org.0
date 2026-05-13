Return-Path: <linux-gpio+bounces-36783-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIhUONi0BGplNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36783-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:28:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31875380D0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D89A8300CB1B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047A04C8FEA;
	Wed, 13 May 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/x2fWjA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A33FFAB7;
	Wed, 13 May 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693332; cv=none; b=rBFFJXs5bebvl2ScSQ3aThmybFYf08E5BPu8b4VEJqbRqLglbchpcvqsZRikKnx/t3hb2gQvYQfZpAGhxVLP7xuQrCke/sBf1S/c/AZbzVbxGcqAu6q92YTS1FbRJsuG7jHXwybk/NzLUKBe//kMOOfMMJvf3IHvOpuNd7UGBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693332; c=relaxed/simple;
	bh=pxj0jepxEIQGRJkSwjh5KN9T4OX/Z7pdEPs63eCxJRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxRxzLjCNc1RHVj0Sk+LwaWrYJsA+bsFWr7e54d3r3+5RGtEF5iA4XAPVOdhBjJKcT9DN9hp1aeXVu/oE7gxuSXBTos9YBT6uR8By02kd1mtAf6WXNHSfKXwO3T6dHW7eryNQzi4gXmC08R0u2+beWvpVtBH0S5FwJTyyVci4HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/x2fWjA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2658DC19425;
	Wed, 13 May 2026 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778693332;
	bh=pxj0jepxEIQGRJkSwjh5KN9T4OX/Z7pdEPs63eCxJRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P/x2fWjABzQtH6PNeviTB2Yija+SFdqs+6ZZ/Fk6XdkkWOEdqADWzytH5Y23N6QAw
	 0g1kU045Oiyvlb5IM50oUbj8gwD3VbHY8LXE3y2EsJXnm4xZOww4lgtK0EqK9tO9we
	 9HJcYLV+HJcLM7JObbrMYX/Zyy+VmouWuhTwCztqroXJtMK0KLdkmJP7e3e2lNZ5sC
	 UOtEUNnJ2uvCMH2xXaP5vig3F3jH0QvhLMU2jsluULam8jfN89w3JD5uGr3rLGMQde
	 Nd9IZHim05AA1CJni0xziy7wk+cbJemDetdMMltAhS/J1nDorA/BRY0MX4tB2eKtr7
	 J00LqATey+wBQ==
Message-ID: <705ef2f4-3bdf-4e7c-be9c-980cc0a21544@kernel.org>
Date: Wed, 13 May 2026 12:28:50 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on
 Lenovo Yoga 7 14AGP11
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Hardik Prakash <hardikprakash.official@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linus.walleij@linaro.org, wsa@kernel.org,
 "Natikar, Basavaraj" <basavaraj.natikar@amd.com>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-3-hardikprakash.official@gmail.com>
 <agSw-Y_jjliO1gaE@ashevche-desk.local>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <agSw-Y_jjliO1gaE@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B31875380D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36783-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

++

On 5/13/26 12:12, Andy Shevchenko wrote:
> Please, Cc AMD people on the AMD related stuff.
> +Cc: Mario
> 
> +Cc: Bart
> (the GPIO enumeration and checks, smells like it might be done differently).

Yeah; I tend to think doing this with a quirk is hiding a bug.

Are you sure this isn't a case of two masters on the bus?

[    2.286838] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.286887] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.286923] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.286964] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.287521] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.287569] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.287616] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration
[    2.287658] i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost 
arbitration

I saw something really similar on a Dell platform last year; but around S4.

It ended up being a situation that the EC had way to act as I2C master 
and until the right method from I2C-HID was called it thought it was 
still I2C master.

https://git.kernel.org/torvalds/c/7d62beb102d6f

Could this be something similar that really calling the _DSM is the 
missing link?

> 
> On Wed, May 13, 2026 at 11:43:38AM +0530, Hardik Prakash wrote:
>> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails with
>> lost arbitration errors on AMDI0010:02 at boot. The root cause is a
>> probe ordering issue: i2c_designware probes AMDI0010:02 before
>> pinctrl-amd has finished initialising, so the GPIO 157 interrupt
>> needed by the touchscreen is not yet enabled.
>>
>> Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
>> device_is_bound() under device_lock() to correctly wait until
>> pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_match_dev()
>> for robust HID/UID-based GPIO controller lookup instead of string
>> name matching.
> 
> ...
> 
>> +static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
>> +{
>> +	struct acpi_device *adev = ACPI_COMPANION(device);
> 
> Split hard-to-maintain definition and assignment that's going to be validated.
> 
>> +	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
>> +		return false;
>> +	if (!adev)
>> +		return false;
> 
> 	struct acpi_device *adev;
> 
> 	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> 		return false;
> 
> 	adev = ACPI_COMPANION(device);
> 	if (!adev)
> 		return false;
> 
>> +	return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
>> +}
> 
> ...
> 
>> +static int dw_i2c_defer_for_amd_gpio(struct device *device)
>> +{
>> +	struct acpi_device *gpio_adev;
>> +	struct device *gpio_dev;
>> +
>> +	if (!dw_i2c_needs_amd_gpio_dep(device))
>> +		return 0;
>> +
>> +	/*
>> +	 * Find the AMD GPIO controller by HID/UID and get its physical
>> +	 * platform device. We need the platform device (not the ACPI device)
>> +	 * because that is what gets bound by the amd_gpio driver.
>> +	 */
>> +	gpio_adev = acpi_dev_get_first_match_dev("AMDI0030", "0", -1);
>> +	if (!gpio_adev)
>> +		return -EPROBE_DEFER;
> 
> Hmm... This is interesting case, smells like something similar to what we had
> with x86 Android quirk driver. Cc'ed to Bart to briefly look at this.
> 
>> +	gpio_dev = acpi_get_first_physical_node(gpio_adev);
>> +	acpi_dev_put(gpio_adev);
>> +	if (!gpio_dev)
>> +		return -EPROBE_DEFER;
>> +
>> +	/*
>> +	 * Check that amd_gpio probe has fully completed, not just that the
>> +	 * driver pointer is set. The driver pointer is assigned before probe
>> +	 * finishes, so checking it would allow i2c_designware to probe before
>> +	 * the GPIO IRQ quirk in amd_gpio_probe() has run.
>> +	 */
>> +	device_lock(gpio_dev);
>> +	if (!device_is_bound(gpio_dev)) {
>> +		device_unlock(gpio_dev);
>> +		return -EPROBE_DEFER;
>> +	}
>> +	device_unlock(gpio_dev);
>> +
>> +	/*
>> +	 * Create a device link so the driver core enforces probe/remove
>> +	 * ordering between this I2C controller and the GPIO controller.
>> +	 */
>> +	if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUMER))
>> +		dev_warn(device, "failed to add device link to %s\n",
>> +			 dev_name(gpio_dev));
>> +
>> +	return 0;
>> +}
> 


