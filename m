Return-Path: <linux-gpio+bounces-37199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COIzMoe1DWrC2QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:22:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20158EB16
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8129A302E8DD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212503B27D8;
	Wed, 20 May 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N93UnU3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F136404D
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283224; cv=none; b=tCQfD+T6RaaRuN40HMfk9HciYR1bQW4D4tqdNpBdKjlW81iG83Snc9facNh0zdv8SbEVdPBzVt0YZ7lTBUdrRhHhJFzvB5bJddPCuNPBViMUVueWqbJJAAf/Q6uPbyNv5mNhGmYZD+mtz8zgCUA+vLDutvnAEuWdsn4fom5Dcuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283224; c=relaxed/simple;
	bh=rMvArdMsOx+ARlPWMw9n/ZTqV/HZTHreqwaDNFIuiC4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoJ+iuY0C1cS1iMYNkvwutm6f/jeZ/am9/nF4UiPPwhmxI/cbaIXsaDI0P45NqLepavCQRNZgQT5uOVXbW6q76ZcbxJ24AtiPi+59XACDb12YZuhpPyHJkxNQUZO0EGcd8BXrmVrSXa5mm+iT531p0O88gO26UOZzADyQnsQ/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N93UnU3A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0580A1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283222;
	bh=UhMdH0+vZEC/cCyut7bWOMedfvAFyX53VwvJqq4MuwQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=N93UnU3AfgKLbNwPv+wYW4tvQ72v4ig8gyMcggCObIlLBq5MlpkQ2eM3nztWXPk89
	 YDp6snrixPpHVPkXU7EeaHdzTDbPDDUsKnBnG8eXzrEUjG9fKnBI36d7TYRIgnhh2h
	 STJxH0h13xBIK75I7bgR8bBUkW4RSuzW5/iqRKQQSFq6Z42/Sfw5khN3Yvqq4OeCES
	 pWj2/e0+3cvzc5QdPWlBHbAdknwZFloAJS6z9WJCQ2RwwFrixJ0p4CN4TR7ip5mAgc
	 d/e+Y7+yslB/TC4zNLl6Jiw5YSL0Jg3lbdIwrwxD9XqD+U4yHgioM5o9fdbt0ofa66
	 m4IHMZreVQbnA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e8292423fso34757141fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:20:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/w4+WQqaRhS+dfhnMT/tc3HlX8sRshrIJcF1vd2O0Ri55GNmmDjfHA/VlaRFCVrL/dT9Qk5ZzmaWcP@vger.kernel.org
X-Gm-Message-State: AOJu0YynB6Gp0qiPt11InZOoMPodQDUxS7+7SAS2tqhPim6fdVCxEv+V
	40Keaa/9nyXm2kiKWNTl9dgOs4JiwdkMbbrTq8mjV65qYY17R6l1AEnacAzuh/KppB14S7D1SWB
	KOyUY/pI8qYgrYh5O5HX2ye0QWksQYPC4eldmuqNLag==
X-Received: by 2002:a05:651c:154e:b0:393:d776:bc89 with SMTP id
 38308e7fff4ca-39561f0774fmr66107771fa.21.1779283220813; Wed, 20 May 2026
 06:20:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 09:20:18 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 09:20:18 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260518214951.16526-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518214951.16526-1-rosenp@gmail.com>
Date: Wed, 20 May 2026 09:20:18 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcch_8Y7VsF3zb0X6pzvv-yOxk9KQowWYVNGORj6sj3+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JKVY0s3YS4m5W8R2j2Mx5hwcR6t3P_43xl1UJ7l1sce9R-2yA4iOfKtJw
Message-ID: <CAMRc=Mcch_8Y7VsF3zb0X6pzvv-yOxk9KQowWYVNGORj6sj3+Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pc104: Add COMPILE_TEST coverage
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37199-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE20158EB16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 23:49:51 +0200, Rosen Penev <rosenp@gmail.com> said:
> The port-mapped GPIO drivers are hidden on non-x86 builds even when the
> architecture provides I/O port access. Several PC/104 GPIO drivers only
> depend on generic ISA, regmap, and gpiolib infrastructure, so they can be
> built for compile-test coverage.
>
> Allow the port-mapped GPIO menu and the PC/104 GPIO drivers to be selected
> under COMPILE_TEST while retaining the existing HAS_IOPORT guard.
>

This to me should be split into two commits: one adding the menu and one
extending the coverage.

Bart

> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 25a6d7af3f5c..c33a10a31861 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -934,7 +934,8 @@ config GPIO_IDT3243X
>  endmenu
>
>  menu "Port-mapped I/O GPIO drivers"
> -	depends on X86 && HAS_IOPORT # I/O space access
> +	depends on X86 || COMPILE_TEST
> +	depends on HAS_IOPORT # I/O space access
>
>  config GPIO_VX855
>  	tristate "VIA VX855/VX875 GPIO"
> @@ -963,7 +964,7 @@ config GPIO_I8255
>
>  config GPIO_104_DIO_48E
>  	tristate "ACCES 104-DIO-48E GPIO support"
> -	depends on PC104
> +	depends on PC104 || COMPILE_TEST
>  	select ISA_BUS_API
>  	select REGMAP_MMIO
>  	select REGMAP_IRQ
> @@ -978,7 +979,7 @@ config GPIO_104_DIO_48E
>
>  config GPIO_104_IDIO_16
>  	tristate "ACCES 104-IDIO-16 GPIO support"
> -	depends on PC104
> +	depends on PC104 || COMPILE_TEST
>  	select ISA_BUS_API
>  	select REGMAP_MMIO
>  	select GPIO_IDIO_16
> @@ -991,7 +992,7 @@ config GPIO_104_IDIO_16
>
>  config GPIO_104_IDI_48
>  	tristate "ACCES 104-IDI-48 GPIO support"
> -	depends on PC104
> +	depends on PC104 || COMPILE_TEST
>  	select ISA_BUS_API
>  	select REGMAP_MMIO
>  	select REGMAP_IRQ
> @@ -1016,7 +1017,7 @@ config GPIO_F7188X
>
>  config GPIO_GPIO_MM
>  	tristate "Diamond Systems GPIO-MM GPIO support"
> -	depends on PC104
> +	depends on PC104 || COMPILE_TEST
>  	select ISA_BUS_API
>  	select REGMAP_MMIO
>  	select GPIO_I8255
> --
> 2.54.0
>
>

