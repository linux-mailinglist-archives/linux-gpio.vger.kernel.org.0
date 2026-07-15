Return-Path: <linux-gpio+bounces-40110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2nfNRx7V2r9OwEAu9opvQ
	(envelope-from <linux-gpio+bounces-40110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:20:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF675E082
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=htydiT+o;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40110-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40110-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E931A3050099
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A855446AEEA;
	Wed, 15 Jul 2026 12:08:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245544C662
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:08:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117321; cv=none; b=IZ94wALCYjonGr13k3oGs0AmtzV+biZZVA1G9vc+usJ+86rvmBG7OErmzJB8//Kej8vUyrpoXkwDN9RyNrZYlhUWdOVu6tDbDpKks77WZx/BaFxTdUbU2oUx/+oOibXwzPa48nt6/m1ZQMuGc2Mdb4xP2OJqwlGi0Ql+66ngcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117321; c=relaxed/simple;
	bh=O3D4DuMVlFnowfwB55XmZhgK8QP5M8Jnyw3tCtKzBZE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhGu17E2gy67c6hWihppKhTe57hdcSWAFEsmFcVhmsyKAiJQqsDKw0bThtQc7BOB9GaAoaooelVpt4627bX5YjWSB17/IRDgZG1ejBHe/GeeD2JYKiSLzR+xPQLdVDXHX6tPDZL8MmBB9t6c0vsF+iTA/fajPt1EaizHH92817U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htydiT+o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8EC1F00ACA
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117317;
	bh=PAbQMU3a4zsk62hRhiYERiZWy5WaKH4uugNgN6vzCrg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=htydiT+oBRyNeK4R/AwGY+qFYk4IT7UVR839fWR3r67TEb37R4AplS0mYG1q+RNuK
	 bZyBEIRamrijZGVGAqxb+hbTOcfACvKPmMn0ZW4MXIlCqxH3bJVG1F7zOCfDiv6u73
	 Zp3e/VXhtebvzy77KsGk6mCY8d6l/17g22VnXIH+4w16D5NxMd/e/6gbbZUZHoJBaE
	 QlN9PaWo4r+DzMOSoX71zFh32NGOjk5HW+y+SY/sJ12ebwLkO42bZDvvyi4DdKM24A
	 kmag4Ujsd9puGy12UBfL95WMmOzGdQd9UHFB7DwMlwzHrKZgnhTVbTiBrK2E0amxLi
	 9QRfDCqUxhQyA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c86945164so44531441fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:08:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YwqZxOWAQkNVq+aWCP+KdpTO9OIcLqFG3wNPQ8r2bX31lcMitcX
	xi32iJueR76kiDDH61RuiXkLGSmApqhaWw4V4E35PputpqTlugG4S6FQIkXzNnlY1gNvGA9QoPV
	JOGhUusnx6VNEhb4ixZug6xtHr8NpVPOP4AdJ8F8rEg==
X-Received: by 2002:a05:651c:b2a:b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-39db6ba2f04mr6775831fa.6.1784117316161; Wed, 15 Jul 2026
 05:08:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 12:08:34 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 12:08:34 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260715114701.7713-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715114701.7713-1-hardikprakash.official@gmail.com>
Date: Wed, 15 Jul 2026 12:08:34 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdCn7BtFCQvraax5vV1t+G=Tjs4OP4ikd7RquFAj+G=Ww@mail.gmail.com>
X-Gm-Features: AUfX_my3syVuuoAttMGOdOgurOycsXARkvaCzELF8v-pCujG44vgqsxmC-_c92M
Message-ID: <CAMRc=MdCn7BtFCQvraax5vV1t+G=Tjs4OP4ikd7RquFAj+G=Ww@mail.gmail.com>
Subject: Re: [PATCH v11] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40110-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:linux-i2c@vger.kernel.org,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0AF675E082

On Wed, 15 Jul 2026 13:47:01 +0200, Hardik Prakash
<hardikprakash.official@gmail.com> said:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers being fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
>
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> fail with lost arbitration errors:
>
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
>
> Add a dependency check that walks ACPI child devices and defers probe
> until any referenced GPIO controller is bound.
>
> Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Assisted-by: Claude:claude-sonnet-5
> Assisted-by: DeepSeek:deepseek-v4-pro
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 80 +++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> v10 -> v11:
> - Replaced custom gpio_controller_ref list with gpio_device_find_by_fwnode(),
>   as suggested by Andy, dropping the linked list and dedup logic (~60 lines)
> - Moved resource-skip explanation from commit message into a code comment
> - Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
>   rather than the gpio_device's own internal class device, which never
>   has a driver bound to it
>

Please include the entire changelog in every new iteration. I believe I gave
my Ack for this and now it's gone. I have no idea why because there's neither
a complete changelog nor links to previous versions.

Bart

