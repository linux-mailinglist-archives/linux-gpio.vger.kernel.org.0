Return-Path: <linux-gpio+bounces-39011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nbnmBkIUPmpu/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:55:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 678046CA860
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=INZlesZF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39011-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39011-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5649C30893E1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 05:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3503C3CD8A4;
	Fri, 26 Jun 2026 05:54:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BEB3CB8F1
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 05:54:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453262; cv=none; b=MJ0GF3zyYPVU+oR+0uSvTH+WWBzMH5/yUd4FDSNqfbsQj/Qpl308Dtj66QJmj6LCzKdcIxiT8xUDZo3mtWnMW/8NS0bvP0rp/pQ/Oyq0Q5qjZtT0h6yx/YALil0diEbZibhBjXjpdYpDYhYcO4fUBB+/+ah+JYiifkuh2PRF6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453262; c=relaxed/simple;
	bh=gSkYdwqlTGiT8ukX/gS2wKIpTu+nQIX2SyyTwl/D86g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=aJmlEpHU3la1nsPjfIsKRFxhdubFI2i5d1TIRISY7s6Rb7IQgIJ5Lts/65ztQiOckHpD3v4nY/Go37vfWpbjiqbxymamvf/P7ceKZlCDbF4uY1MTrBPMtU98Ni1dCctca/rM80h+X7J3yxYhYjEhHNXL8Ay91j3QYrWR2c+T458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=INZlesZF; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260626055410euoutp02caf3654d2be271fb0e4e5fb9d87faf85~8i8mdr-1s1791717917euoutp02S
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 05:54:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260626055410euoutp02caf3654d2be271fb0e4e5fb9d87faf85~8i8mdr-1s1791717917euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782453250;
	bh=QU9UUDIK6247cPDa+cwUVHsc1/gzZpOJAbSJDcml44I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=INZlesZFR/mN0zqsAnxGcb3NEk3Ey+tnlNOqROxyE/ijWPN4jEtNXasZqAzr4yjRE
	 UDqxXbutmBQUEHFWZNTBdus0TrvHh2P/OWQ2lU9eoM5GjQ8necsp/sWtlr4/TZ5a1X
	 UBgtcR+pz0h7KZV0H5C2nlHo7CeKp17OZp6qZdmw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260626055409eucas1p160d74a47e1ee0d16a738f48c40f1e6de~8i8ltmpLI0513105131eucas1p1p;
	Fri, 26 Jun 2026 05:54:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260626055409eusmtip23fedbfd2064e4857e35e7ab5dbdb2184~8i8lEXEMB3229032290eusmtip2V;
	Fri, 26 Jun 2026 05:54:09 +0000 (GMT)
Message-ID: <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Date: Fri, 26 Jun 2026 07:54:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy
	<robin.murphy@arm.com>, Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260625115718.1678991-2-v@baodeep.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260626055409eucas1p160d74a47e1ee0d16a738f48c40f1e6de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9
X-EPHeader: CA
X-CMS-RootMailID: 20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9
References: <20260625115718.1678991-1-v@baodeep.com>
	<CGME20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9@eucas1p1.samsung.com>
	<20260625115718.1678991-2-v@baodeep.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-39011-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baodeep.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 678046CA860

On 25.06.2026 13:57, Viacheslav Bocharov wrote:
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


Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


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
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret = 0;
>  
> -	gpio_shared_lockdep_assert(shared_desc);
> +	lockdep_assert_held(&shared_desc->mutex);
>  
>  	if (value) {
>  	       /* User wants to set value to high. */
> @@ -89,7 +91,7 @@ static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
>  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	proxy->shared_desc->usecnt++;
>  
> @@ -105,11 +107,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
>  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
>  	int ret;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (proxy->voted_high) {
>  		ret = gpio_shared_proxy_set_unlocked(proxy,
> -			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
> +			gpiod_set_value_cansleep, 0);
>  		if (ret)
>  			dev_err(proxy->dev,
>  				"Failed to unset the shared GPIO value on release: %d\n", ret);
> @@ -129,7 +131,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt > 1) {
>  		if (shared_desc->cfg != cfg) {
> @@ -157,7 +159,7 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int dir;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt == 1) {
>  		dev_dbg(proxy->dev,
> @@ -187,7 +189,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  	struct gpio_desc *desc = shared_desc->desc;
>  	int ret, dir;
>  
> -	guard(gpio_shared_desc_lock)(shared_desc);
> +	guard(mutex)(&shared_desc->mutex);
>  
>  	if (shared_desc->usecnt == 1) {
>  		dev_dbg(proxy->dev,
> @@ -222,13 +224,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
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
> @@ -237,29 +232,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
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
> +	guard(mutex)(&proxy->shared_desc->mutex);
> +
> +	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
> +					      value);
>  }
>  
>  static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
> @@ -302,20 +283,25 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
>  	gc->label = dev_name(dev);
>  	gc->parent = dev;
>  	gc->owner = THIS_MODULE;
> -	gc->can_sleep = shared_desc->can_sleep;
> +	/*
> +	 * Under the descriptor mutex the proxy may call
> +	 * gpiod_set_config()/gpiod_direction_*(), which can reach pinctrl
> +	 * paths that take a mutex (e.g. gpiod_set_config() ->
> +	 * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent
> +	 * of the underlying chip's can_sleep. So the descriptor lock must be a
> +	 * mutex and the proxy gpiochip is therefore always sleeping; drive the
> +	 * underlying GPIO through the cansleep value accessors, which are valid
> +	 * for both sleeping and non-sleeping chips.
> +	 */
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
> index 15e72a8dcdb1..bbdc0ab7b647 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -3,10 +3,7 @@
>  #ifndef __LINUX_GPIO_SHARED_H
>  #define __LINUX_GPIO_SHARED_H
>  
> -#include <linux/cleanup.h>
> -#include <linux/lockdep.h>
>  #include <linux/mutex.h>
> -#include <linux/spinlock.h>
>  
>  struct gpio_device;
>  struct gpio_desc;
> @@ -42,35 +39,12 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
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
> -DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
> -	if (_T->lock->can_sleep)
> -		mutex_lock(&_T->lock->mutex);
> -	else
> -		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
> -	if (_T->lock->can_sleep)
> -		mutex_unlock(&_T->lock->mutex);
> -	else
> -		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
> -	unsigned long flags)
> -
> -static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
> -{
> -	if (shared_desc->can_sleep)
> -		lockdep_assert_held(&shared_desc->mutex);
> -	else
> -		lockdep_assert_held(&shared_desc->spinlock);
> -}
> -
>  #endif /* __LINUX_GPIO_SHARED_H */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


