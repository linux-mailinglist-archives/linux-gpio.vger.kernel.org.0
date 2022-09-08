Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1205B1AC2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 12:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiIHK6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 06:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiIHK6q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 06:58:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9001814086
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 03:58:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A421B8207D
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 10:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F164C433C1;
        Thu,  8 Sep 2022 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662634722;
        bh=49jEeNsIKQoe/Dx0yaIkSCvAc5oDN3iWQSfhKBoPbqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qiRynBjVkZgLcSlAmEC0sG3H832NG2XxGy5AtuYB/WnmkXs06wIhMN6McDmmydctx
         YQSHiRhb0wFw79FTz3C0158OdQpJZ1CecoWMuZx5G3vC8P9fxYHAZdc8cpnU1Fdw9Q
         90nX0FZSSS4TWRA5+595HDlkATqYkzDJNWeT2Girz8AUHeVRYFm7l8ZQIPKEmsFvDH
         JgMtDrjrtgLWzRsJ7drFyGqVTB3qzuTfRQntc7HVRxjCJnKz9AdYSVNViJupa6Cxi9
         1DbEP+2/q0Oz+1y4dps5C73RWS/NOFyf9jw3v6OrsEzsTF6NzDunO/6Jv+YaNm+Uti
         jkljPyEM2jGGA==
Date:   Thu, 8 Sep 2022 11:58:36 +0100
From:   Lee Jones <lee@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <YxnK3LeyfacKssLT@google.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 01 Sep 2022, Russell King wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.
> 
> The initial RTKit backend adds support for Apple Silicon Macs (M1 et
> al). We hope a backend for T2 Macs will be written in the future
> (since those are not supported by applesmc), and eventually an x86
> backend would allow us to fully deprecate applesmc in favor of this
> driver.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/platform/Kconfig           |   2 +
>  drivers/platform/Makefile          |   1 +
>  drivers/platform/apple/Kconfig     |  49 ++++
>  drivers/platform/apple/Makefile    |  11 +
>  drivers/platform/apple/smc.h       |  28 ++
>  drivers/platform/apple/smc_core.c  | 249 ++++++++++++++++
>  drivers/platform/apple/smc_rtkit.c | 451 +++++++++++++++++++++++++++++
>  include/linux/mfd/macsmc.h         |  86 ++++++
>  8 files changed, 877 insertions(+)
>  create mode 100644 drivers/platform/apple/Kconfig
>  create mode 100644 drivers/platform/apple/Makefile
>  create mode 100644 drivers/platform/apple/smc.h
>  create mode 100644 drivers/platform/apple/smc_core.c
>  create mode 100644 drivers/platform/apple/smc_rtkit.c
>  create mode 100644 include/linux/mfd/macsmc.h
> 
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index b437847b6237..5f8b9bcdb830 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -13,4 +13,6 @@ source "drivers/platform/olpc/Kconfig"
>  
>  source "drivers/platform/surface/Kconfig"
>  
> +source "drivers/platform/apple/Kconfig"
> +
>  source "drivers/platform/x86/Kconfig"
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index 4de08ef4ec9d..3e5d5039a28c 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
>  obj-$(CONFIG_GOLDFISH)		+= goldfish/
>  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
>  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> +obj-$(CONFIG_APPLE_PLATFORMS)	+= apple/
> diff --git a/drivers/platform/apple/Kconfig b/drivers/platform/apple/Kconfig
> new file mode 100644
> index 000000000000..42525aa9fbbe
> --- /dev/null
> +++ b/drivers/platform/apple/Kconfig
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Apple Platform-Specific Drivers
> +#
> +
> +menuconfig APPLE_PLATFORMS
> +	bool "Apple Mac Platform-Specific Device Drivers"
> +	default y
> +	help
> +	  Say Y here to get to see options for platform-specific device drivers
> +	  for Apple devices. This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if APPLE_PLATFORMS
> +
> +config APPLE_SMC
> +	tristate "Apple SMC Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default ARCH_APPLE
> +	select MFD_CORE
> +	help
> +	  Build support for the Apple System Management Controller present in
> +	  Apple Macs. This driver currently supports the SMC in Apple Silicon
> +	  Macs. For x86 Macs, see the applesmc driver (SENSORS_APPLESMC).
> +
> +	  Say Y here if you have an Apple Silicon Mac.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called macsmc.
> +
> +if APPLE_SMC
> +
> +config APPLE_SMC_RTKIT
> +	tristate "RTKit (Apple Silicon) backend"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	depends on APPLE_RTKIT
> +	default ARCH_APPLE
> +	help
> +	  Build support for SMC communications via the RTKit backend. This is
> +	  required for Apple Silicon Macs.
> +
> +	  Say Y here if you have an Apple Silicon Mac.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called macsmc-rtkit.
> +
> +endif
> +endif
> diff --git a/drivers/platform/apple/Makefile b/drivers/platform/apple/Makefile
> new file mode 100644
> index 000000000000..79fac195398b
> --- /dev/null
> +++ b/drivers/platform/apple/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/apple
> +# Apple Platform-Specific Drivers
> +#
> +
> +macsmc-y				+= smc_core.o
> +macsmc-rtkit-y				+= smc_rtkit.o
> +
> +obj-$(CONFIG_APPLE_SMC)			+= macsmc.o
> +obj-$(CONFIG_APPLE_SMC_RTKIT)		+= macsmc-rtkit.o
> diff --git a/drivers/platform/apple/smc.h b/drivers/platform/apple/smc.h
> new file mode 100644
> index 000000000000..8ae51887b2c5
> --- /dev/null
> +++ b/drivers/platform/apple/smc.h
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC internal core definitions
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#ifndef _SMC_H
> +#define _SMC_H
> +
> +#include <linux/mfd/macsmc.h>
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
> diff --git a/drivers/platform/apple/smc_core.c b/drivers/platform/apple/smc_core.c
> new file mode 100644
> index 000000000000..daf029cd072f
> --- /dev/null
> +++ b/drivers/platform/apple/smc_core.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC core framework
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mfd/core.h>

Please refrain from using the MFD API outside of drivers/mfd.

If you need an MFD driver, please separate it out.

If not, please replace it with the platform_*() API instead.

Thanks.

-- 
Lee Jones [李琼斯]
