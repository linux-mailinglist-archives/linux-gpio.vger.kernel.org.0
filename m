Return-Path: <linux-gpio+bounces-37529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAzZByB9FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:59:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 395015D4892
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CC24300BCA5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BB43DCDBE;
	Tue, 26 May 2026 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDFpD5FS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259A3D7D89
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793023; cv=none; b=YDR+k2DXi+crNnTS9upafr1uLELzp4grDtYDk9njbwMfuCBCNe138jVf2Ry2O2dSzmOeY5TPnQqJI+iaYnCpoOgykk08OwS56cl88zsR5rME3Q5T4mfTZZbUIJi12mRZBKD0IAWmPDo8K5+gg2q8mb2AndEy9qXLjX+iKEsiebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793023; c=relaxed/simple;
	bh=TmoaLIWJTYdLjOBDjaQgzo3slB2jy1VY4TxYRJPW8QQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlRm2w7W0tsAmvU3tWiy9QBUmEaPCYIAXjhrjUhGf9wNJf4TxxrY9ph91ZaywNCcnUe7tDv/+wn2wg7OatEXlIYccvIZBYCOrczeAkB8FH/pEx5OVeRDber4/yqXRIHHdl7yPgXU2vtGfrz0zhdIPlnwmQtcjSbyT1GkcvukxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDFpD5FS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B6C1F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779793022;
	bh=6vDthLWDKY+kpEjXsL0PEKBhF12zGf+PZtLZ5hHWffs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bDFpD5FSZ5ALdCBM7n/XfiznYjRp+IHArpz7TMaO0e0yNDBlPZhWAhV/hRAdzLgh7
	 hdMIEnrJVCFG5f/SsaK/2ENbL4sGqDNEWsIi6JhnoqwK45UZH5sskdzyoeRMKORuag
	 ed2+/RfkL5BHv7MRiwLGLCq3u9KzTwN81cfefuu1HvhT/HIeiIOlNJ72AgMzQLUiaa
	 Qgbn+oZ2IkLa+l4gi1fDsJSz081l+ysElKe8StrQqXo1HjvLUJxgFkiB0X6Yjjh6I4
	 FA50wfrVKy9aay8Bvd5PhrgpaqgBMaqjKdmtKKB6FeYWNLe90wNISN/iipL3HY17T2
	 yzqJclZaJcofg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa0da74eaaso10313209e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:57:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWKht/82xt3r+tTsVgTgdqnhAsAbO1VaZDGWWjq0xg9oiYihYe
	Z9vTvzsUosHTRKyQMVwVIteObrQtxMk3cIRvNArfr0H23H/oDyN2Cn+YP2q1gDobHYIEkMYtp0Z
	/tYqWjvM/vJPE7uoikoEIyUTTiX4CrO6AokUjFzQH4A==
X-Received: by 2002:a05:6512:33d6:b0:5a8:9a1d:b951 with SMTP id
 2adb3069b0e04-5aa2ba62e26mr7015303e87.2.1779793020952; Tue, 26 May 2026
 03:57:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 06:56:59 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 06:56:59 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260526105213.85833-2-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526105213.85833-1-hardikprakash.official@gmail.com> <20260526105213.85833-2-hardikprakash.official@gmail.com>
Date: Tue, 26 May 2026 06:56:59 -0400
X-Gmail-Original-Message-ID: <CAMRc=McrvEJWNbKYfPWwZGGwoQMqK00ErTYY8b_ePLX0Y23tQg@mail.gmail.com>
X-Gm-Features: AVHnY4I1qGkY4vmYtHPmG3Y8CXJgoDQgKc5DlaZQMuzt4-9jFKKFpRJF8Ob13zQ
Message-ID: <CAMRc=McrvEJWNbKYfPWwZGGwoQMqK00ErTYY8b_ePLX0Y23tQg@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37529-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,amd.com:email,qualcomm.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 395015D4892
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 12:52:10 +0200, Hardik Prakash
<hardikprakash.official@gmail.com> said:
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
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
> ---

Please collect review tags, I already left my A-b under the last revision.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Hint: try to give others some time to respond, don't resend a new version
immediately after each review email from maintainers.

Bart

