Return-Path: <linux-gpio+bounces-37516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLUSBDp5FWrgVQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:43:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2E5D4505
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C9C03028F7F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D14F3DD870;
	Tue, 26 May 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lp8hqrFq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4743DCDBA
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792183; cv=none; b=oeraXDhvhej/BIjVjfX8V/doNht6L8F+ff4VGbPl31dXD8am+9q2w2utyMlG9yKhtHddvGW3+IdhEEFWCSDlQE+alGXWzNJySYdhr1VqOMC2JLS1B83Saec7n4ImlZbzao+X8g/hp6f0EdogdBlEPU7K9EI9Lzm+8Fgusk1MSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792183; c=relaxed/simple;
	bh=FKw4KIVaPKunvIVR7uNj1OxxI8eIhOoGTXqqL+3fh2I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G21rgEMeuEHG05zTq0+qPPcvuUEYohj5/IJwXynwZWrZ654zOQOBhkjRR50mnncE693xWdDsgsGZ6zORh8qz9SoJP2yzxaUL82hEha+8l2M2xsWZ9KedXe4X85J0yM72Qgo4MEMDVqq8NBaRhPruLNUdYaHBc67yc+pycp/g75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lp8hqrFq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6521F00A3F
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792182;
	bh=U0W8nF2/ypbMYzffJd+xeLQKSwkY8cvWdmQ8F+BuG3Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lp8hqrFqyWFWLZyTZ7yfwc/eDYEdZ4xwPTrxtwov2ipz7NMC1VXV6Y8qkLtWfI207
	 /fgYxqa/ec7IAnLLBTnQVT/GhboDeFFqfe4BB6Hx8S1YeUonC2sDKtPszaQQ7fckCP
	 fmB+2lftI7FFn4koar/UTyXN1rAR5YW06umTE4gAt6YiYunCKwL+wsb6DrnNv9A816
	 ZTQBbwkgL+teO7pRIF1IK4CS14MeEId0isnm8h+BSNqNxsSll1R7tijCEGiFgjal7v
	 ScHgy3yNaeHg4H1xpbh65vD5ky4C1z1I5Jb4nK4ZwKHHxyvMcWCKWFb3WQA7vrjYzs
	 jGKAPg7OTGXCA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393800f638bso76803111fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:43:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YykUg4RqAgx0fuEny+4cfmrL7E0WCugkFEI1HzXk2KjFEUu8WaB
	0UtV/zTTmUt06XUPY4f5P4pQBiHqQuBkCxGxILUqQKOqd8XrzFQNotyLRedJRUdA/Cm+TqVr0Ut
	tgHXWjDYJA/IipXI6+Ip04gbC0sLqMiZJRTTfDWb9RQ==
X-Received: by 2002:a05:651c:98b:b0:394:c44:a4d4 with SMTP id
 38308e7fff4ca-395d8a1c1ccmr58389311fa.0.1779792180642; Tue, 26 May 2026
 03:43:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 06:42:58 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 06:42:58 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260523174440.9629-2-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523174440.9629-1-hardikprakash.official@gmail.com> <20260523174440.9629-2-hardikprakash.official@gmail.com>
Date: Tue, 26 May 2026 06:42:58 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
X-Gm-Features: AVHnY4J-6eVxM0Kye2QkUfNSAbEgrVjqtuY1WAH_wjUho36iw5Qp56N9Vr0HX7c
Message-ID: <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37516-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85A2E5D4505
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 23 May 2026 19:44:40 +0200, Hardik Prakash
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
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494

I don't think we use this tag anymore. Just make it Link:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

