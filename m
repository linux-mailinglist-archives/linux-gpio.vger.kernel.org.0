Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6DA62798D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 10:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbiKNJxC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 04:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbiKNJwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 04:52:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82279DF33;
        Mon, 14 Nov 2022 01:52:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1AEE1B80DA1;
        Mon, 14 Nov 2022 09:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC30C433C1;
        Mon, 14 Nov 2022 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668419568;
        bh=OGA6btIf0O2nItkEUzMrs8IKbLFaQuZsMAW10U2DJxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b2MsAM3sANjbEmcebvNSjsfxpxp4TZcX05V3vHkWcndCtUNvp8RvEG84AJ0qwFeBj
         vAmhA5nNDs6OHDXOlerusXTu24xMuNGEqw73rKKFeCk8uO9PqPHCSpv4xlTlXiQd6z
         B2m/hQA34qydX8IGNbzquNDj6vLJ+BUcuUhviuNV9HGTizNDkos+zVWSpIcyux7ELq
         RoMzKjhaXZlyeYp01wb7ddAxuuiLje8P99hyynf5k+L5A5FbINs8yNaus5+p7CuPr2
         dLISTiDp89opsr6XgqDXr7DAGin1R7FG25cPUIfjh0fC7/TEtZBM5vDp+YDhfQPNul
         NRtXEqLsHy+kg==
Date:   Mon, 14 Nov 2022 09:52:41 +0000
From:   Lee Jones <lee@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 1/7] mfd: Add core Apple Mac SMC driver
Message-ID: <Y3IP6bmBdLL2LoHR@google.com>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 08 Nov 2022, Russell King wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.

Could we have Russell's ASCII simplified architecture model here please?

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/mfd/Kconfig        |   4 +
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/macsmc.c       | 239 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/macsmc.h | 104 ++++++++++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 drivers/mfd/macsmc.c
>  create mode 100644 include/linux/mfd/macsmc.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 8b93856de432..f73e098b7228 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -224,6 +224,10 @@ config MFD_CROS_EC_DEV
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called cros-ec-dev.
>  
> +config MFD_MACSMC
> +	tristate

Is this selectable?

Worth having a description?

> +	select MFD_CORE

Help section?

Copy / paste from the commit log should be enough.

>  config MFD_MADERA
>  	tristate "Cirrus Logic Madera codecs"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 7ed3ef4a698c..a5271b578d31 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
>  obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
> +obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>  
>  obj-$(CONFIG_HTC_PASIC3)	+= htc-pasic3.o
>  obj-$(CONFIG_HTC_I2CPLD)	+= htc-i2cpld.o
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> new file mode 100644
> index 000000000000..e5c3957efea4
> --- /dev/null
> +++ b/drivers/mfd/macsmc.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC core framework

"SMC (System Management Controller)"

Tiny nit: '\n'

> + * Copyright The Asahi Linux Contributors

Missing (C)

Would you like an Author(s) line here?

> + */
> +
> +#include <linux/device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/macsmc.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +

Would you be kind enough to add a header here to describe the
attributes please.  Some of them are non-standard.

> +struct apple_smc {
> +	struct device *dev;
> +
> +	void *be_cookie;
> +	const struct apple_smc_backend_ops *be;
> +
> +	struct mutex mutex;
> +
> +	u32 key_count;
> +	smc_key first_key;
> +	smc_key last_key;
> +
> +	struct blocking_notifier_head event_handlers;
> +};
> +
> +static const struct mfd_cell apple_smc_devs[] = {
> +	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
> +	MFD_CELL_NAME("macsmc-hid"),
> +	MFD_CELL_NAME("macsmc-power"),
> +	MFD_CELL_NAME("macsmc-reboot"),
> +	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
> +};
> +
> +int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
> +{
> +	int ret;
> +
> +	mutex_lock(&smc->mutex);
> +	ret = smc->be->read_key(smc->be_cookie, key, buf, size);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_read);
> +
> +int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
> +{
> +	int ret;
> +
> +	mutex_lock(&smc->mutex);
> +	ret = smc->be->write_key(smc->be_cookie, key, buf, size);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_write);
> +
> +int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
> +{
> +	int ret;
> +
> +	/*
> +	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
> +	 * final calls, so it doesn't really matter at that point.
> +	 */
> +	if (!mutex_trylock(&smc->mutex))
> +		return -EBUSY;
> +
> +	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_write_atomic);
> +
> +int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
> +		 void *rbuf, size_t rsize)
> +{
> +	int ret;
> +
> +	mutex_lock(&smc->mutex);
> +	ret = smc->be->rw_key(smc->be_cookie, key, wbuf, wsize, rbuf, rsize);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_rw);
> +
> +int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key)
> +{
> +	int ret;
> +
> +	mutex_lock(&smc->mutex);
> +	ret = smc->be->get_key_by_index(smc->be_cookie, index, key);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_get_key_by_index);
> +
> +int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info)
> +{
> +	int ret;
> +
> +	mutex_lock(&smc->mutex);
> +	ret = smc->be->get_key_info(smc->be_cookie, key, info);
> +	mutex_unlock(&smc->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(apple_smc_get_key_info);
> +
> +int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key)
> +{
> +	int start = 0, count = smc->key_count;
> +	int ret;
> +
> +	if (key <= smc->first_key)
> +		return 0;
> +	if (key > smc->last_key)
> +		return smc->key_count;
> +
> +	while (count > 1) {
> +		int pivot = start + ((count - 1) >> 1);
> +		smc_key pkey;
> +
> +		ret = apple_smc_get_key_by_index(smc, pivot, &pkey);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (pkey == key)
> +			return pivot;
> +
> +		pivot++;
> +
> +		if (pkey < key) {
> +			count -= pivot - start;
> +			start = pivot;
> +		} else {
> +			count = pivot - start;
> +		}
> +	}
> +
> +	return start;
> +}

Maybe a 1 or 2 line comment to provide an overview of what's happening
in here please.

> +EXPORT_SYMBOL(apple_smc_find_first_key_index);
> +
> +int apple_smc_get_key_count(struct apple_smc *smc)
> +{
> +	return smc->key_count;
> +}
> +EXPORT_SYMBOL(apple_smc_get_key_count);
> +
> +void apple_smc_event_received(struct apple_smc *smc, uint32_t event)
> +{
> +	dev_dbg(smc->dev, "Event: 0x%08x\n", event);
> +	blocking_notifier_call_chain(&smc->event_handlers, event, NULL);
> +}
> +EXPORT_SYMBOL(apple_smc_event_received);
> +
> +int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n)
> +{
> +	return blocking_notifier_chain_register(&smc->event_handlers, n);
> +}
> +EXPORT_SYMBOL(apple_smc_register_notifier);
> +
> +int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n)
> +{
> +	return blocking_notifier_chain_unregister(&smc->event_handlers, n);
> +}
> +EXPORT_SYMBOL(apple_smc_unregister_notifier);
> +
> +void *apple_smc_get_cookie(struct apple_smc *smc)
> +{
> +	return smc->be_cookie;
> +}
> +EXPORT_SYMBOL(apple_smc_get_cookie);

These parts seem like abstraction for the sake of abstraction.

Any reason why the caller can't use the blocking_notifier_* API and
look into the apple_smc for themselves.

> +struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
> +{
> +	struct apple_smc *smc;
> +	u32 count;
> +	int ret;
> +
> +	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
> +	if (!smc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	smc->dev = dev;
> +	smc->be_cookie = cookie;
> +	smc->be = ops;
> +	mutex_init(&smc->mutex);
> +	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
> +
> +	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get key count"));
> +	smc->key_count = be32_to_cpu(count);
> +
> +	ret = apple_smc_get_key_by_index(smc, 0, &smc->first_key);
> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get first key"));
> +
> +	ret = apple_smc_get_key_by_index(smc, smc->key_count - 1, &smc->last_key);
> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get last key"));
> +
> +	/* Enable notifications */
> +	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
> +
> +	dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
> +		 smc->key_count, &smc->first_key, &smc->last_key);
> +
> +	dev_set_drvdata(dev, smc);
> +
> +	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);

Please replace the -1 with the defines provided.

> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));

"Failed to register sub-devices"

> +	return smc;
> +}
> +EXPORT_SYMBOL(apple_smc_probe);
> +
> +int apple_smc_remove(struct apple_smc *smc)
> +{
> +	mfd_remove_devices(smc->dev);

devm_*?

> +	/* Disable notifications */
> +	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);

The same command enables and disables notifications?

> +	return 0;
> +}
> +EXPORT_SYMBOL(apple_smc_remove);
> +
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_DESCRIPTION("Apple SMC core");

SMC (System Management Controller)

> diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> new file mode 100644
> index 000000000000..99cfa23f27bd
> --- /dev/null
> +++ b/include/linux/mfd/macsmc.h
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC core definitions

SMC (System Management Controller)

> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#ifndef _LINUX_MFD_MACSMC_H
> +#define _LINUX_MFD_MACSMC_H
> +
> +struct apple_smc;

You can move the definition into here and omit this line.

> +typedef u32 smc_key;
> +
> +#define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> +#define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
> +
> +#define APPLE_SMC_READABLE BIT(7)
> +#define APPLE_SMC_WRITABLE BIT(6)
> +#define APPLE_SMC_FUNCTION BIT(4)
> +
> +struct apple_smc_key_info {
> +	u8 size;
> +	u32 type_code;
> +	u8 flags;
> +};
> +
> +int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
> +int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
> +int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
> +int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
> +		 void *rbuf, size_t rsize);
> +
> +int apple_smc_get_key_count(struct apple_smc *smc);
> +int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key);
> +int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key);
> +int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info);
> +
> +static inline bool apple_smc_key_exists(struct apple_smc *smc, smc_key key)
> +{
> +	return apple_smc_get_key_info(smc, key, NULL) >= 0;
> +}
> +
> +#define APPLE_SMC_TYPE_OPS(type) \
> +	static inline int apple_smc_read_##type(struct apple_smc *smc, smc_key key, type *p) \
> +	{ \
> +		int ret = apple_smc_read(smc, key, p, sizeof(*p)); \
> +		return (ret < 0) ? ret : ((ret != sizeof(*p)) ? -EINVAL : 0); \
> +	} \
> +	static inline int apple_smc_write_##type(struct apple_smc *smc, smc_key key, type p) \
> +	{ \
> +		return apple_smc_write(smc, key, &p, sizeof(p)); \
> +	} \
> +	static inline int apple_smc_write_##type##_atomic(struct apple_smc *smc, smc_key key, type p) \
> +	{ \
> +		return apple_smc_write_atomic(smc, key, &p, sizeof(p)); \
> +	} \
> +	static inline int apple_smc_rw_##type(struct apple_smc *smc, smc_key key, \
> +					      type w, type *r) \
> +	{ \
> +		int ret = apple_smc_rw(smc, key, &w, sizeof(w), r, sizeof(*r)); \
> +		return (ret < 0) ? ret : ((ret != sizeof(*r)) ? -EINVAL : 0); \
> +	}
> +
> +APPLE_SMC_TYPE_OPS(u64)
> +APPLE_SMC_TYPE_OPS(u32)
> +APPLE_SMC_TYPE_OPS(u16)
> +APPLE_SMC_TYPE_OPS(u8)
> +APPLE_SMC_TYPE_OPS(s64)
> +APPLE_SMC_TYPE_OPS(s32)
> +APPLE_SMC_TYPE_OPS(s16)
> +APPLE_SMC_TYPE_OPS(s8)
> +
> +static inline int apple_smc_read_flag(struct apple_smc *smc, smc_key key)
> +{
> +	u8 val;
> +	int ret = apple_smc_read_u8(smc, key, &val);

Nit: Please separate the declaration and assignment via function call
with a line break in between.

> +	if (ret < 0)
> +		return ret;
> +	return val ? 1 : 0;
> +}
> +#define apple_smc_write_flag apple_smc_write_u8
> +
> +int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n);
> +int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n);
> +
> +/* backend interface */
> +
> +struct apple_smc_backend_ops {
> +	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
> +	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
> +	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
> +	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
> +		      void *rbuf, size_t rsize);
> +	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
> +	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
> +};
> +
> +struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
> +				  void *cookie);
> +void *apple_smc_get_cookie(struct apple_smc *smc);
> +int apple_smc_remove(struct apple_smc *smc);
> +void apple_smc_event_received(struct apple_smc *smc, uint32_t event);
> +
> +#endif

-- 
Lee Jones [李琼斯]
