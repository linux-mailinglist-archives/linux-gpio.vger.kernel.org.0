Return-Path: <linux-gpio+bounces-31749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP5pMX1clGm3DAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:18:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0A14BDB4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D181A3045010
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB3433984B;
	Tue, 17 Feb 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg/PMoq9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22A33893D
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330643; cv=none; b=Ex1/IfkPloCueLjHXsOf6GrgIsd8ebrRckjFLK6+j/cC/Uf+/uxPJFzVDFdTGDLfj6g0LDg0AhiIXkKngrYEm8pReDBT8phQi+Bxg4B+PU9IgaIrWPSuZ4ykZMUbf1Z4ALYebQ/VQvyDxQz/AFOEXYWtkYgqC1eQDU28wwjpT60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330643; c=relaxed/simple;
	bh=Vr3S/NRZ+Gxmt2xKTLbKVQLfF3pD6Rdqfj9+2BcEPe4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhhmqROxaBj5cugvIP5trMMmvtrYUFCwO0PJ6nGjklsMY/v8xr+x27Izc92fA34VjWBm2hOHoXqFrTGF3Aen4lpzCZPTELeVSCG/uGHxF3pJlqBXTN2gvEb23uKEqvIWI2r/7cyCGyV7om1Ad1UlZcm46K1XBEfYrOERhIpN2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg/PMoq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7923C19424
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771330642;
	bh=Vr3S/NRZ+Gxmt2xKTLbKVQLfF3pD6Rdqfj9+2BcEPe4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=fg/PMoq9kKLwdQ7gaP4k3iwtSwh23cUoCYH88fd1ubxiJ2ZPKqsH6U+xnH8xzm9yQ
	 1xaRQ+ccI0Qaf4xiMO+Rl8EJcyjxvxXkQkpeTDIvLf73Dl5f27U8dM0M2/kJUtWarO
	 zhLrLO3h7Iaf7kdvdxtt87u2vZzH9iGj/trjd0erOezsBiKVGmIHwwA2xO6eroZmEe
	 wwKYYbPmu/t8ygKa179DlkePkBLDRZeVB70PVxv3lvqJfDlOXnVRJ1IQcMZ+BuLq//
	 k7w2Sj+uPaC4Pz/kOR13vXWJjKReGarYox2NPoyMyui34h02pGVXUZspklav++FX2Z
	 mGJa0Hr4MYVLg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e6c181402so5227878e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 04:17:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfsZ1GIFUuLE+OTHOxBoRvjVOY6fXQZBbIQg379A2YwIHRuJMIl1FpjAKw7pKBc4GCDzkchl1i3i5H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm0nzy2Jw/av42/jf0qXy6FQQldRCxmP118fDAp1UZsw9zEqHs
	RGGa0fiuKL1dklWhp26olo4EoTj5z/QTzXvfgN8j6yK07ZSmh45ypcALA6cY6xdeAIFFjNw8oNx
	jb/lJ0D5gPhtMyETIW2xUqRlwj0ogXFut6Lu1/eNpVw==
X-Received: by 2002:a05:6512:12d0:b0:59e:6111:7304 with SMTP id
 2adb3069b0e04-59f69c648f7mr5083995e87.31.1771330641602; Tue, 17 Feb 2026
 04:17:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 04:17:20 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 04:17:20 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081431.1208351-1-pshete@nvidia.com>
Date: Tue, 17 Feb 2026 04:17:20 -0800
X-Gmail-Original-Message-ID: <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
X-Gm-Features: AaiRm52J6lD5e8NE2zdA9lxwXIHqquar7R_7jfasbmJL2Edc9lJ1kEaMUERE_Ns
Message-ID: <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31749-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72B0A14BDB4
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 09:14:30 +0100, Prathamesh Shete <pshete@nvidia.com> said:
> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>   * Split the v1 patch into two; this one to simplify prefix handling.
> ---
>  drivers/gpio/gpio-tegra186.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9c874f07be75..f04cc240b5ec 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -942,12 +942,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  		char *name;
>
>  		for (j = 0; j < port->pins; j++) {
> -			if (gpio->soc->prefix)
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
> -						      gpio->soc->prefix, port->name, j);
> -			else
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
> -						      port->name, j);
> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
> +					      gpio->soc->prefix ?: "", port->name, j);
>  			if (!name)
>  				return -ENOMEM;
>
> @@ -1373,6 +1369,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>  	.has_vm_support = true,
>  };
>
> +/* Macro to define GPIO name prefix with separator */
> +#define TEGRA_GPIO_PREFIX(_x)	_x "-"
> +
>  #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
>  	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
>
> @@ -1388,7 +1387,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
>  	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
>  	.ports = tegra410_compute_ports,
>  	.name = "tegra410-gpio-compute",
> -	.prefix = "COMPUTE",
> +	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
>  	.num_irqs_per_bank = 8,
>  	.instance = 0,
>  };
> @@ -1418,7 +1417,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
>  	.num_ports = ARRAY_SIZE(tegra410_system_ports),
>  	.ports = tegra410_system_ports,
>  	.name = "tegra410-gpio-system",
> -	.prefix = "SYSTEM",
> +	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
>  	.num_irqs_per_bank = 8,
>  	.instance = 0,
>  };
> --
> 2.43.0
>
>

I'm perfectly fine with patch 2/2 but this one is giving me a hard time. What
are we really gaining other than some questionable obfuscation? Keeping the
dash in the format string makes more sense to me and if we ever reuse the
prefix, we'll need to remember about it trimming it. I would drop this patch
and keep just 2/2.

Bartosz

