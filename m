Return-Path: <linux-gpio+bounces-34121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIbUAFe8w2kRtwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:43:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 679AB32332A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 489973137446
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38693B777D;
	Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQsLCgUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656033B777C
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434724; cv=none; b=tVpM4tiv/thbyZSFwHp1knwo6hDJTJPMkcu0DmdaT44CeUrGnRJpkXJuibLAk+FZ1o5db0N0nsdluhT8ByuC0qKjN5sTCUWcQ0VY8rDjFjbAPpJsmaP3faY02R7CSWdq7uBVe5RcWmKD5oAJytQdn2sINgoePb3uXwl/SABbu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434724; c=relaxed/simple;
	bh=ocM1mdWqdcmXzLcIYmHxofHeePVA9vqDrQenuhbw7uQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bECsPvaIUxugmhN33iaqmwZdKWGHN2Fsqm7Bn1fzn3d6wk9H24koP9Kb8QTtwzSmN6autqWyX0Yjbep6eybbsvCRuHlkU+8XJ8IVpnE9VbIW14YwBt3+HTVTnidXY3ictFTYY2RT3ZfWaRVeHPiO8bFnNjaiyyh4e/e9nXqSsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQsLCgUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4E8C2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434724;
	bh=ocM1mdWqdcmXzLcIYmHxofHeePVA9vqDrQenuhbw7uQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rQsLCgURkLIEosDEkWhGLHl2g1Ra6qaeLKzy2cRqqnyXRcXcVKKwx3toJni6EMrux
	 2yTlCjJ/KdtIfr9nJlV3R9Uyw8RZjwSCEWZZ46F6kW+ognCmhXZTt+4caRkrSnV4pJ
	 g4EKHg7lADOkIJM8Zy429vK7uL9pAvIYddbYoRTRMs0BHYvdVDX9uYgNCxGUfYD9zg
	 KwaTmNGmGRK3/Fgg/iLtZ3V1Oeowegn1mvk53dgavo/7O2ptF2VSu4l/gEOC/UGQ10
	 b27HeM60vA3MAPu4GdjcQl6p8kfoIuA4k6Bdijgtvn3EOmXmoLIi8zD+zePRhB70dz
	 j8GibjkFw3IsQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6550559e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 03:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXShJtWpiNUVHicIUdg+wk8TYcELUjffquwyTdsMAmIVzscZqLgQ+ziXc+Juwm8aFj8z1i2gbMrowPl@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGDWlGlBuZa2Wmt+MbqBAZQ9ok3PGFuELoX10o9jy95xS340M
	cmaxYcWfA91Eh2RdLBb8nsOM4Qwv8PHKoqHHIpq1SCwhr4dEhL9O0HgYOQ3tD7JcmpezDHEgUAW
	9ATU+tcIBNJVDZw+4Fc5/lSE/W3UkCvx10Zps/qJ2WQ==
X-Received: by 2002:a05:6512:220f:b0:5a1:34a3:757f with SMTP id
 2adb3069b0e04-5a29b9958e6mr1037060e87.25.1774434722860; Wed, 25 Mar 2026
 03:32:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org>
Date: Wed, 25 Mar 2026 03:32:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
X-Gm-Features: AaiRm53MDlZLZwdTwMSs-omwMVxdmGT3F6ltQ_Yfx4HD4BKPWevgMv5IzNZGH1g
Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34121-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 679AB32332A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
>
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>
> drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
> drivers/gpio/gpio-mt7621.c:254:20: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   254 |         rg->chip.gc.of_gpio_n_cells = 2;
>       |                    ^
> drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
> drivers/gpio/gpio-tegra186.c:502:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
>       |                         ^~
> drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
> drivers/gpio/gpio-lpc32xx.c:523:49: error: 'struct gpio_chip' has no member named 'of_xlate'
>   523 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
>       |                                                 ^
> drivers/gpio/gpio-spacemit-k1.c: In function 'spacemit_gpio_add_bank':
> drivers/gpio/gpio-spacemit-k1.c:234:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   234 |         gc->of_gpio_n_cells     = 3;
>       |           ^~
>
> Bring that back as a dependency.
>
> Fixes: 7803501e5754 ("gpio: drop unneeded Kconfig dependencies on OF_GPIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> There may be more fallout from the change, this is just what I found immediately,
> but you could already fold the changes into the broken patch while I look
> for additional ones.
> ---

Thanks and sorry for the breakage. However, I'm wondering if it wouldn't make
sense to do the following:

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed077..ce0e0df68dbaa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -473,7 +473,6 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif /* CONFIG_GPIOLIB_IRQCHIP */

-#if defined(CONFIG_OF_GPIO)
 	/*
 	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
 	 * the device tree automatically may have an OF translation
@@ -516,7 +515,6 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
-#endif /* CONFIG_OF_GPIO */
 };

 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);

Symbols from linux/of.h are stubbed out and these drivers can build just fine
with !CONFIG_OF. This would naturally increase the build coverage.

Bartosz

