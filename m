Return-Path: <linux-gpio+bounces-37835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t/8NOCwnH2rViAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 20:55:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 889586313EC
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 20:55:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NRzCYxdD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37835-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37835-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 695F63047661
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 18:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC5239B49A;
	Tue,  2 Jun 2026 18:53:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03AB39A806;
	Tue,  2 Jun 2026 18:53:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426426; cv=none; b=XITzLW5pK4HA4J2IXTNc5mxQCWUl0tW+p7e8ECbaWU4bdRqBj9DCASaqWdrr666medHreo0FGTvqTEfebjoFEVqgQxpT2dJBEz37DJGFlhkznVHjrv16EtmIcf/IVCFryENKIZXf/meopgCyjBM92fJFk1IkwCvzXeX6Tb+H8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426426; c=relaxed/simple;
	bh=dl+5lQcu7WGVD6gn89R8E0HqmtxymmQV/VW7zx35OTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHuX7otT+Y1mhvRvAheLOR3LR7Vld9xu6NCkOdfZvWXky+3BAQogAPoVHqg5E8JPKRkHwEwk4ALAxZoQEM6crP2v8jxiKTdrHCl2LobBhY7fa3Eu6M/ugr2PN7yA7vUyS1QT4wqnnxLr5wnT1QIddV+tVkX31jWiQumyJd4Spkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRzCYxdD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7C21F00893;
	Tue,  2 Jun 2026 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780426424;
	bh=TpI15tipC8iZy8iRzmtd2j95YT9CH9D1OJCSYZTNlks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NRzCYxdD+coVJ8+8v329GILHzcN68BioLqkK45m06Gmv1LG4gJG9CZ7ZWywbkQvtl
	 OvUZD1WG7I8LKaye2hhf+gjRSuz8wLWnI0OYSox/mu5elLc2BgjjFsD1lsHEvdvNdm
	 LDYtG3MiKYCHUDH6UkZhhpKsYtWGYx9wB96RbRBSFZ8OkNTJ75UGL+Db8GoZRxiFXE
	 i+RbJTQfZ84uYDTGEj6EwwY/F7bppF0ske0iP6Biut6wJHnMtWE4Uxxbh0OgYfnlwZ
	 AevpNReb6wOUj+ojWU8+/X0e0ONXV/lxXWMIUJHKgWxsVwianffFVn4v69YDYUPBnU
	 V42DHSFkqVV+Q==
Date: Tue, 2 Jun 2026 11:53:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	andriy.shevchenko@intel.com, mario.limonciello@amd.com,
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <20260602185339.GA404948@ax162>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529100838.8896-3-hardikprakash.official@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37835-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 889586313EC

Hi Hardik,

On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers to be fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
> 
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> 
>   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> 
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
> 
> This ensures GPIO controllers complete initialization (including IRQ
> setup and quirks) before I2C child enumeration begins, fixing the race
> without device-specific quirks or DMI matching.
> 
> The probe ordering race was confirmed via dynamic debug tracing:
> 
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494

I bisected boot issues with a few of my test machines to this change in -next
as commit ef76a3a28c79 ("i2c: designware: defer probe if child GpioInt
controllers are not bound"). I consistently get no display output and I do not
have serial access to these machines, so I do not have much to go on here at
the moment. Occasionally, the network controller will be initialized so I can
remote in but I have not been able to do it recently to try and gather logs.
What information would be useful for trying to figure out what is going on
here? I seem to recall a crash in strcmp() in one log but I cannot be too sure
since it was late at night when I was doing my initial triage.

# bad: [08484c504b55a98bd100527fbe10a3caf55ff3ff] Add linux-next specific files for 20260601
# good: [e43ffb69e0438cddd72aaa30898b4dc446f664f8] Linux 7.1-rc6
git bisect start '08484c504b55a98bd100527fbe10a3caf55ff3ff' 'e43ffb69e0438cddd72aaa30898b4dc446f664f8'
# good: [57fb910db1b6051476b91a4d4ae18bc027a7f36d] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 57fb910db1b6051476b91a4d4ae18bc027a7f36d
# good: [18ea7e3ca91e7a9eb9e43c11154350cec160830b] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
git bisect good 18ea7e3ca91e7a9eb9e43c11154350cec160830b
# good: [a5696dd9c080352e25b576acf24450cef255b6eb] Merge branch 'tty-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
git bisect good a5696dd9c080352e25b576acf24450cef255b6eb
# good: [c158564f40f0d2a68833610ac136f9714fc51b16] Merge branch 'staging-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
git bisect good c158564f40f0d2a68833610ac136f9714fc51b16
# bad: [4240c928a5edeb13fb3953248dfc45e5d9f42f00] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git bisect bad 4240c928a5edeb13fb3953248dfc45e5d9f42f00
# good: [2e24f5964b72ef213ecdb959a0b0d60b2dc00a3b] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 2e24f5964b72ef213ecdb959a0b0d60b2dc00a3b
# good: [6a350ccc4dc3f46ed2ee2592e3050956e415ef64] pinctrl: add new generic groups/function creation function for pinmux
git bisect good 6a350ccc4dc3f46ed2ee2592e3050956e415ef64
# good: [b12e12ee4138e30d786eda02223e87044c989bb1] gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init
git bisect good b12e12ee4138e30d786eda02223e87044c989bb1
# good: [446fa334d186316e76cbdc4e94e42af7d040a79c] pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()
git bisect good 446fa334d186316e76cbdc4e94e42af7d040a79c
# good: [a8754838f83a9905af516f38dd2633744a94f71a] gpio: max77620: Unify usage of space and comma in platform_device_id array
git bisect good a8754838f83a9905af516f38dd2633744a94f71a
# bad: [ef76a3a28c79b628890431aa344af633e892035b] i2c: designware: defer probe if child GpioInt controllers are not bound
git bisect bad ef76a3a28c79b628890431aa344af633e892035b
# good: [b0c13ec17438577f90b379d448dfed1233e2c0a4] pinctrl: mcp23s08: Read spi-present-mask as u8 not u32
git bisect good b0c13ec17438577f90b379d448dfed1233e2c0a4
# good: [3f786abd23951f3f600a62fef42469d9200d5f52] Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11"
git bisect good 3f786abd23951f3f600a62fef42469d9200d5f52
# first bad commit: [ef76a3a28c79b628890431aa344af633e892035b] i2c: designware: defer probe if child GpioInt controllers are not bound

-- 
Cheers,
Nathan

