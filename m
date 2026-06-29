Return-Path: <linux-gpio+bounces-39158-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PlnaAk2mQmrg/AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39158-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:07:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EA6DD983
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:07:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yrxvbo4X;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39158-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39158-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D625B301C3F0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778AE3B6364;
	Mon, 29 Jun 2026 17:07:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5337F8A5
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 17:07:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752824; cv=none; b=es6nrBevU1AZ/UuVly1Jpgn0u/WBL1E5ZVZojJyw6ZVWiNm3Ne54n2nacExEyxztfaTR2XdKBGf51DhAY8/9mNmbexZ8gXuOXDDLJlNgfydM05ECSS/EGuBc7pyRyGjsZ+AuHSF7XvxTC3pvik9pDPpzY1KaLFj68PR9fB4OTD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752824; c=relaxed/simple;
	bh=iYf31nvEv14euCo/bLXTi3/WkhtdASg9KgXlPFWoU8s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPQhTRhr4d6oRNa9BXdRHYvUFLs0kU/DsSFVb9+DxzczaoaD15DoM6/itdzs1ZHfHISNUtjrsGwuPJkF8DWByeKL6ZYAMeYPjDwYjBWLZQlKjjIByUeUEl9Xp6CNfPamuKyXuB5Zr1V2bXjem99xm4ksTqN7/sUBBKK+dE21g2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yrxvbo4X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FE11F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752822;
	bh=CU8TMB46KVquqb6NZE+mjswOyduzrIxQL/Z45liuHG4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Yrxvbo4XVFc+tkKdK7ym6mYWtieEBKFP4ZF/LfZmsMd+Q2sbjIohStqMyffYbb58m
	 fo2OjtDduxdHXaWy+Bev1CZcc8KNmm1GFXx+PhNrm7ZYumddHmBPQdHAbWbk70xjTA
	 AYXXm5/9uFyV1BJu5nILEbmvwZ5k2KrYToZBRfhRAUKYhvDT1mIDIZ1Rgvh3Jyc3s6
	 G6uFpkq84Tnqzhx50fgN0Zqmv+hftyHBlT9H1sVzLfpQXniz7880NHZEmkrJ2b9aL6
	 GyNQ2WIkGDusVbegI6YLTwu73CQV2IVb4o4/cnaVVQxgbH1FGChiBRSv3jBYoTpVog
	 MD9GRaLjSTOPA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39af6402933so21179611fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYCKAWGQn/cMFLvKe+ud1/6B6OSTunwwOBnetV0RxVEQJlvQP9w265MTf4P3uzObYL21EI7/qrFqSH@vger.kernel.org
X-Gm-Message-State: AOJu0YyvTpsz913PG6qZSxtYKUjOghEgPAfNYRbxyjst3MSI84qjP7Af
	LNWYYqkD3yOleKTv3fzynEgM7xWXXc9wO85mMmvMLWHUZD73V+QwPYeYyHi//kNMqwAALu9SyC6
	KEOvwI6w1nogJPny841x321bCZA3OpjsaYYZV/VQHHw==
X-Received: by 2002:a05:651c:158c:b0:399:83a4:4f2c with SMTP id
 38308e7fff4ca-39b1daae071mr107701fa.18.1782752821184; Mon, 29 Jun 2026
 10:07:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 10:06:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 10:06:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625115718.1678991-2-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
Date: Mon, 29 Jun 2026 10:06:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
X-Gm-Features: AVVi8Cex4Km60qsC3nmt5H_9iHFU4BjDrOYA0iDy91F4RstIOAhIA0emnN3RoSU
Message-ID: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39158-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,samsung.com:email,baodeep.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A5EA6DD983

On Thu, 25 Jun 2026 13:57:17 +0200, Viacheslav Bocharov <v@baodeep.com> said:
> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
> runtime from the underlying chip's can_sleep:
>
> 	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> 	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();
>
> can_sleep describes only the value path (->get/->set). Under the same
> lock, however, the proxy may call gpiod_set_config() and
> gpiod_direction_*(), which can reach pinctrl paths that take a mutex
> (e.g. gpiod_set_config() -> gpiochip_generic_config() ->
> pinctrl_gpio_set_config()), independent of can_sleep. On a controller
> with non-sleeping MMIO value ops the descriptor lock was a spinlock, so
> the sleeping pinctrl call ran from atomic context. Reproduced on an
> Amlogic A113X board with the workaround from commit 28f240683871
> ("pinctrl: meson: mark the GPIO controller as sleeping") reverted; the
> original Khadas VIM3 report hit the same path:
>
> 	BUG: sleeping function called from invalid context
> 	  __mutex_lock
> 	  pinctrl_get_device_gpio_range
> 	  pinctrl_gpio_set_config
> 	  gpiochip_generic_config
> 	  gpiod_set_config
> 	  gpio_shared_proxy_set_config   <- voting spinlock held
> 	  ...
> 	  mmc_pwrseq_simple_probe
>
> The spinlock existed to take the value vote from atomic context, but the
> vote and the (possibly sleeping) control operations share the same state
> and lock, so this scheme cannot serialize config under a mutex and still
> offer atomic value access. Always serialize the shared descriptor with a
> mutex instead and mark the proxy a sleeping gpiochip, driving the
> underlying GPIO through the cansleep value accessors: those are valid
> for both sleeping and non-sleeping chips, so value access keeps working
> on fast controllers, at the cost of no longer being atomic.
>
> This is observable: consumers gating on gpiod_cansleep() take their
> sleeping branch on a proxied GPIO (mmc-pwrseq-emmc skips its
> emergency-restart reset handler; its normal reset is unaffected), and
> consumers that reject sleeping GPIOs (pwm-gpio, ps2-gpio, ...) would
> fail to probe. Such atomic users do not share a pin through the proxy,
> whose purpose is voting on shared reset/enable lines. The same narrowing
> already applies on Amlogic since that workaround, and rockchip
> addressed the identical splat per-driver in commit 7ca497be0016 ("gpio:
> rockchip: Stop calling pinctrl for set_direction"); fixing the proxy
> addresses the locking error once, for every controller.
>
> The lock type was added by commit a060b8c511ab ("gpiolib: implement
> low-level, shared GPIO support"); the sleeping call under it arrived with
> the proxy driver.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
> ---
> v1 -> v2: open-code the descriptor mutex; drop the gpio_shared_desc_lock
>           guard and the gpio_shared_lockdep_assert() helper, use
>           guard(mutex) and lockdep_assert_held() directly; move the
>           mutex rationale from the header to the can_sleep assignment in
>           probe.
>
> v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-2-v@baodeep.com/
>
>  drivers/gpio/gpio-shared-proxy.c | 66 +++++++++++++-------------------
>  drivers/gpio/gpiolib-shared.c    |  9 +----
>  drivers/gpio/gpiolib-shared.h    | 28 +-------------
>  3 files changed, 29 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 6941e4be6cf1..0cd52015b731 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -9,8 +9,10 @@
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/lockdep.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/string_choices.h>
>  #include <linux/types.h>
>
> @@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,

I was about to apply it but then realized that it can be simplified further.
The set_func() argument in gpio_shared_proxy_set_unlocked() is no longer
needed and can be replaced with a direct call to gpiod_set_value_cansleep().

Would you mind sending a v3 with that included?

Thanks,
Bartosz

