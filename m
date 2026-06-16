Return-Path: <linux-gpio+bounces-38586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UjmROWZHMWrgfwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 14:53:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3A68FA26
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 14:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JUrsC+XK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38586-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38586-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20129300CD94
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EA7369D6F;
	Tue, 16 Jun 2026 12:53:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73D3655F0
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 12:53:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614436; cv=none; b=OwjWiouF4Mmc5t9IWARMck8TNyAzDXu+zRjfa7R7ilFHeoqLnbUtAyHwxlV/6Uh1mvzOP32YNMM3zGQ7WRsyX0XzRoy537M238BR/l+HJPWvgd+o8iPA6UKdEPGnvk7oKNdGni65SJGJf2uyyPAmvfGuhDDD4V+1+1lVe/7OMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614436; c=relaxed/simple;
	bh=aTFNtkROMCSJt7Y8EHtNZbmnCb9m6B6kFDcMKFB6w0o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzIgOOWDMUmNqxPbhZ2IPrZQwMxTO54A1bvAck4sp+6jfrsXQsa3RRqPiXLrloGa0QKRmme01TXG9okzFy2TkTKyiFlYGzUjh0vKnv8OzjDz6wDgAeoH6Dr3so0F8SLBb9XOMr3yEfhhmnDeghnL1M6Qv7zaliydrU6j5iiG6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUrsC+XK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E781F00ADF
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781614434;
	bh=kp1syzW1srOQcyb+eZQpIHaaqzeGgItPN+sOMv5L2Hg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JUrsC+XKP0qscMP7HnDfrjRQ5ozuE9hbzBs0+iQMt0fT6UdRzpvOOtTYmVgwiQgo3
	 tl2PGkkWyGntRfGI47/vPqdpoKco0OMvD34hr7l5spnoO7bPndkY4IEu/XilC2eNnI
	 H9u2U7NpDdw5zdnWMcAx1ZThsxbefVoJN4ROv+nxQArO3IPIRGkf5hufb4ojt9SRgY
	 KyG0NvdvuQG7T1wBhhUfV/7A07FLTVvmyHUR6vZOpbBIg0ddZMDkGGYyGgKf7SGNMr
	 6uBVXZMLwgqVlT08MaZh5cM/DhT7JaR/sEh3tELaBROfyOPbrSSqSO7sTkHsksxhwA
	 8X9FwEViiLwVg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso5276417e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 05:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8rcMXI0rLkNdKEJ0Y6rmBHxxzCu/XjMgrKpR5bUZGMhSRHA6Eulw54DeY3XwZMUDUGTLPRYluUInjA@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHXuZQyeluES7w5qHDyCI9fGMUimhZkWaiXBHESmqMIMHyK4O
	fUZY60H/9K21+2vx0tnqLmpZN2fhuIqs9DfHo2s38wsXiXO6XhmribZtuobBziRBJ9q/r5GPm16
	t6aqGn9/qz1wyOmobKQaCXRGOVKFcQ46+VqLYehPSGw==
X-Received: by 2002:ac2:5df3:0:b0:5ad:3035:c2c2 with SMTP id
 2adb3069b0e04-5ad428bdd78mr855785e87.51.1781614433226; Tue, 16 Jun 2026
 05:53:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 12:53:51 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 12:53:51 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610153329.937833-2-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610153329.937833-1-v@baodeep.com> <20260610153329.937833-2-v@baodeep.com>
Date: Tue, 16 Jun 2026 12:53:51 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf-nMWzTiP3vZQSBW_NQQ6OFPmMGGG0-VE_iWs-B-Q4_A@mail.gmail.com>
X-Gm-Features: AVVi8CfI5Xcsmf9X5ZMB8tIz5JfgYHEL15SP9-TSKbR6tUfKWWLJo7jfpnDNBRA
Message-ID: <CAMRc=Mf-nMWzTiP3vZQSBW_NQQ6OFPmMGGG0-VE_iWs-B-Q4_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: always serialize with a sleeping mutex
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38586-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3A3A68FA26

On Wed, 10 Jun 2026 17:32:10 +0200, Viacheslav Bocharov <v@baodeep.com> said:
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

Sigh... Ok let's try this. This limits users of shared pins to using them from
process context exclusively but maybe there is in fact no need to do it from
atomic context. After all: bit-banging can't work if we're using the voting
mechanism.

>
>  drivers/gpio/gpio-shared-proxy.c | 43 +++++++-------------------------
>  drivers/gpio/gpiolib-shared.c    |  9 ++-----
>  drivers/gpio/gpiolib-shared.h    | 31 +++++++++--------------
>  3 files changed, 23 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 6941e4be6cf1..856e5b9d6163 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -109,7 +109,7 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
>
>  	if (proxy->voted_high) {
>  		ret = gpio_shared_proxy_set_unlocked(proxy,
> -			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
> +			gpiod_set_value_cansleep, 0);
>  		if (ret)
>  			dev_err(proxy->dev,
>  				"Failed to unset the shared GPIO value on release: %d\n", ret);
> @@ -222,13 +222,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
>  }
>
> -static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
> -{
> -	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> -
> -	return gpiod_get_value(proxy->shared_desc->desc);
> -}
> -
>  static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
>  					  unsigned int offset)
>  {
> @@ -237,29 +230,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
>  	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
>  }
>
> -static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
> -				    int (*set_func)(struct gpio_desc *desc, int value),
> -				    int value)
> -{
> -	guard(gpio_shared_desc_lock)(proxy->shared_desc);
> -
> -	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
> -}
> -
> -static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
> -				 int value)
> -{
> -	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> -
> -	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
> -}
> -
>  static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
>  					  unsigned int offset, int value)
>  {
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
>
> -	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
> +	guard(gpio_shared_desc_lock)(proxy->shared_desc);
> +
> +	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
> +					      value);
>  }
>
>  static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
> @@ -302,20 +281,16 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
>  	gc->label = dev_name(dev);
>  	gc->parent = dev;
>  	gc->owner = THIS_MODULE;
> -	gc->can_sleep = shared_desc->can_sleep;
> +	/* Always a sleeping gpiochip: see the lock comment in gpiolib-shared.h. */
> +	gc->can_sleep = true;
>
>  	gc->request = gpio_shared_proxy_request;
>  	gc->free = gpio_shared_proxy_free;
>  	gc->set_config = gpio_shared_proxy_set_config;
>  	gc->direction_input = gpio_shared_proxy_direction_input;
>  	gc->direction_output = gpio_shared_proxy_direction_output;
> -	if (gc->can_sleep) {
> -		gc->set = gpio_shared_proxy_set_cansleep;
> -		gc->get = gpio_shared_proxy_get_cansleep;
> -	} else {
> -		gc->set = gpio_shared_proxy_set;
> -		gc->get = gpio_shared_proxy_get;
> -	}
> +	gc->set = gpio_shared_proxy_set_cansleep;
> +	gc->get = gpio_shared_proxy_get_cansleep;
>  	gc->get_direction = gpio_shared_proxy_get_direction;
>  	gc->to_irq = gpio_shared_proxy_to_irq;
>
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index de72776fb154..495bd3d0ddf0 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -627,8 +627,7 @@ static void gpio_shared_release(struct kref *kref)
>
>  	shared_desc = entry->shared_desc;
>  	gpio_device_put(shared_desc->desc->gdev);
> -	if (shared_desc->can_sleep)
> -		mutex_destroy(&shared_desc->mutex);
> +	mutex_destroy(&shared_desc->mutex);
>  	kfree(shared_desc);
>  	entry->shared_desc = NULL;
>  }
> @@ -659,11 +658,7 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
>  	}
>
>  	shared_desc->desc = &gdev->descs[entry->offset];
> -	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> -	if (shared_desc->can_sleep)
> -		mutex_init(&shared_desc->mutex);
> -	else
> -		spin_lock_init(&shared_desc->spinlock);
> +	mutex_init(&shared_desc->mutex);
>
>  	return shared_desc;
>  }
> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> index 15e72a8dcdb1..5c725118b1af 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -6,7 +6,6 @@
>  #include <linux/cleanup.h>
>  #include <linux/lockdep.h>
>  #include <linux/mutex.h>
> -#include <linux/spinlock.h>
>
>  struct gpio_device;
>  struct gpio_desc;
> @@ -42,35 +41,29 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
>
>  struct gpio_shared_desc {
>  	struct gpio_desc *desc;
> -	bool can_sleep;
>  	unsigned long cfg;
>  	unsigned int usecnt;
>  	unsigned int highcnt;
> -	union {
> -		struct mutex mutex;
> -		spinlock_t spinlock;
> -	};
> +	struct mutex mutex; /* serializes all proxy operations on this descriptor */
>  };
>
>  struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
>
> +/*
> + * Under this lock the proxy may call gpiod_set_config()/gpiod_direction_*(),
> + * which can reach pinctrl paths that take a mutex (e.g. gpiod_set_config() ->
> + * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent of the
> + * underlying chip's can_sleep. A spinlock would run that sleeping call from
> + * atomic context, so the descriptor lock must be a mutex and the proxy
> + * gpiochip is therefore sleeping (can_sleep=true).
> + */
>  DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
> -	if (_T->lock->can_sleep)
> -		mutex_lock(&_T->lock->mutex);
> -	else
> -		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
> -	if (_T->lock->can_sleep)
> -		mutex_unlock(&_T->lock->mutex);
> -	else
> -		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
> -	unsigned long flags)
> +	mutex_lock(&_T->lock->mutex),
> +	mutex_unlock(&_T->lock->mutex))

Just drop these wrappers altogether then, let's open-code mutex locking in
the proxy.

>
>  static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
>  {
> -	if (shared_desc->can_sleep)
> -		lockdep_assert_held(&shared_desc->mutex);
> -	else
> -		lockdep_assert_held(&shared_desc->spinlock);
> +	lockdep_assert_held(&shared_desc->mutex);

Same here, move it to the proxy.

>  }
>
>  #endif /* __LINUX_GPIO_SHARED_H */
> --
> 2.54.0
>
>
>

Bart

