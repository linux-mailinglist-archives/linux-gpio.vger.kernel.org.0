Return-Path: <linux-gpio+bounces-39042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HWDfFnGVPmoHIgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 17:06:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FD6CE4C7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 17:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="LGOxQI/O";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39042-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39042-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C7E30C3106
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A000735CB6A;
	Fri, 26 Jun 2026 15:02:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809734E764
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 15:02:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486123; cv=none; b=kWwWkYUFyDi0qurKB2ZFkL3GFYUgla8lA9C79B4g6O8B8+3brzROxW8Z/Ae5n1uYBfDJNx3o0ELg6eU934+DAAOZwJ625Eb3muUI5P4gGqNzdlu+zaldeze3eaXoVxif0qDeqG2+YJlJIWx59IcgztC/LR4uT23JCrd0QNAZ54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486123; c=relaxed/simple;
	bh=ftlUNNlpKzAUfZrtNzLb9QiJaU1CcIMuoebOi9UpcE0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5gRzpnK85JzloaA96j7r6IKXC35YUbJq3+eC8W5Hyhs9tsJM/DhBQO7dMiCx9IUzOyd/6io+pCUJ/vryJEVOnkROxXSPEgn/tM9KRrburIMWL6p9D36KI8bRre5BFzy/GYUKju+7MmVHfe1uYQ1YMhEMly7vFIgpy2CVLf2V7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGOxQI/O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20C11F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782486119;
	bh=2M3/dhcHypRoDMmOlgNYAmiMTmUReoTtADf6M6SzpP4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LGOxQI/OOYjyDQFJ2+bfO91MG6+ldr2pktHxTsGRAyA9V1zCq1Gj3KMYQLiOJCBuq
	 qKYDc+WS4daRh7hU1Gx0dACBHprBNvw4HM+YSCV+qmqpfadTK/v7YvW6/e0vV2gX+g
	 IfoQxno9I/oEF+iIG4jwrcif0X0JXbFH9vw8hQGtBlzpmwjZZVBvkyDRgVLSYktRgQ
	 pwYY/savWCBNKc3H7tU1iMeiopasNQ9g5PLCPhZcKSelwsduHFLx8PRibFW17j2V+X
	 oKcr30zquQYB7oWugAswMKvhvDNgK2XSkRxYiJmABhl/Rru8eD8HaCNtgHhmGu336d
	 ZvOfq9OyEOdaQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39669bcaadfso11450431fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 08:01:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDjjnjpz2/MxB6NIGVQhzPdqxMrcLNT/RXkNZq7UCuLbfHHG98OnnjdJB6OL3HueRqry67f/fpgynx@vger.kernel.org
X-Gm-Message-State: AOJu0YzonfDFzDKXJ48ABm3VxUExmsLW0P2TowFq3ROfBjJZ/MOP/uMx
	M6ujJ070+2zr5Dopj3U/KOuqP6nEr3z7EYTyrW8Rd5+0PmHd4H3uE4ey4pyTTDVGGMdI/lx3Gvc
	sneR3i/Om8h91udWn5ZCRB/IZUBERw32nCsShd1WDTQ==
X-Received: by 2002:a05:6512:4408:b0:5aa:6d0e:9d2d with SMTP id
 2adb3069b0e04-5aea1f3c218mr2391832e87.20.1782486118352; Fri, 26 Jun 2026
 08:01:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 15:01:57 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 15:01:57 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625115718.1678991-2-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
Date: Fri, 26 Jun 2026 15:01:57 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc1Kq0gtYMEzpnufw-hx30ivYWpESekEJWXahuAc8z4aeEAOf2sx5m3ETc
Message-ID: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39042-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,baodeep.com:email,samsung.com:email];
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
X-Rspamd-Queue-Id: A46FD6CE4C7

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

This looks good to me. Linus: do you want me to take patch 2/2 as well? I'll
send it for v7.2-rc2.

Bart

