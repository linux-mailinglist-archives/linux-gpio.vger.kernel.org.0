Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249245B1B62
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiIHL3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 07:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiIHL3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 07:29:06 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2636A4A4
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 04:29:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 8A4174203C;
        Thu,  8 Sep 2022 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662636542; bh=Gf+Vc3LMu+/P98tObzo911spVumaTP5jk1W7ju8dPNU=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=v093FjhPqaTwD/yFEQq6RJVVJSkx3xG1C9OLGuJRmuEEUPbLn9b3UMC5SBaW7r9T5
         b4BwRoG7bTeVI3PFYAYSisJpYvgbRL//3HGzeRpPL2x2vRSH0PHuOtBe+z4yk0Pd1L
         TM/+YcvKMc793d+FBx3465ZHc+i64/tN4Jga2hBku1UFH/3sYZ+lwV3O5LOvk6tRt/
         hPv46W1RfEyVtPktiFZ/NEBiQ90KTNub5ipswSwtwWTjiL+hoZHgu1eWtEtZof4d/u
         WN7A9q44gc7Q9IjWRJrdFFM0o4KfGSi9vI2LjOWXl9dWDahj+vORNad0pimdU5lbt6
         +UIwzqHs8pIAA==
Message-ID: <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
Date:   Thu, 8 Sep 2022 20:28:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Lee Jones <lee@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk> <YxnK3LeyfacKssLT@google.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <YxnK3LeyfacKssLT@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/09/2022 19.58, Lee Jones wrote:
> On Thu, 01 Sep 2022, Russell King wrote:
> 
>> From: Hector Martin <marcan@marcan.st>
>>
>> This driver implements support for the SMC (System Management
>> Controller) in Apple Macs. In contrast to the existing applesmc driver,
>> it uses pluggable backends that allow it to support different SMC
>> implementations, and uses the MFD subsystem to expose the core SMC
>> functionality so that specific features (gpio, hwmon, battery, etc.) can
>> be implemented by separate drivers in their respective downstream
>> subsystems.
>>
>> The initial RTKit backend adds support for Apple Silicon Macs (M1 et
>> al). We hope a backend for T2 Macs will be written in the future
>> (since those are not supported by applesmc), and eventually an x86
>> backend would allow us to fully deprecate applesmc in favor of this
>> driver.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>> ---
>>  drivers/platform/Kconfig           |   2 +
>>  drivers/platform/Makefile          |   1 +
>>  drivers/platform/apple/Kconfig     |  49 ++++
>>  drivers/platform/apple/Makefile    |  11 +
>>  drivers/platform/apple/smc.h       |  28 ++
>>  drivers/platform/apple/smc_core.c  | 249 ++++++++++++++++
>>  drivers/platform/apple/smc_rtkit.c | 451 +++++++++++++++++++++++++++++
>>  include/linux/mfd/macsmc.h         |  86 ++++++
>>  8 files changed, 877 insertions(+)
>>  create mode 100644 drivers/platform/apple/Kconfig
>>  create mode 100644 drivers/platform/apple/Makefile
>>  create mode 100644 drivers/platform/apple/smc.h
>>  create mode 100644 drivers/platform/apple/smc_core.c
>>  create mode 100644 drivers/platform/apple/smc_rtkit.c
>>  create mode 100644 include/linux/mfd/macsmc.h
>>
>> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
>> index b437847b6237..5f8b9bcdb830 100644
>> --- a/drivers/platform/Kconfig
>> +++ b/drivers/platform/Kconfig
>> @@ -13,4 +13,6 @@ source "drivers/platform/olpc/Kconfig"
>>  
>>  source "drivers/platform/surface/Kconfig"
>>  
>> +source "drivers/platform/apple/Kconfig"
>> +
>>  source "drivers/platform/x86/Kconfig"
>> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
>> index 4de08ef4ec9d..3e5d5039a28c 100644
>> --- a/drivers/platform/Makefile
>> +++ b/drivers/platform/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
>>  obj-$(CONFIG_GOLDFISH)		+= goldfish/
>>  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
>>  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
>> +obj-$(CONFIG_APPLE_PLATFORMS)	+= apple/
>> diff --git a/drivers/platform/apple/Kconfig b/drivers/platform/apple/Kconfig
>> new file mode 100644
>> index 000000000000..42525aa9fbbe
>> --- /dev/null
>> +++ b/drivers/platform/apple/Kconfig
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Apple Platform-Specific Drivers
>> +#
>> +
>> +menuconfig APPLE_PLATFORMS
>> +	bool "Apple Mac Platform-Specific Device Drivers"
>> +	default y
>> +	help
>> +	  Say Y here to get to see options for platform-specific device drivers
>> +	  for Apple devices. This option alone does not add any kernel code.
>> +
>> +	  If you say N, all options in this submenu will be skipped and disabled.
>> +
>> +if APPLE_PLATFORMS
>> +
>> +config APPLE_SMC
>> +	tristate "Apple SMC Driver"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	default ARCH_APPLE
>> +	select MFD_CORE
>> +	help
>> +	  Build support for the Apple System Management Controller present in
>> +	  Apple Macs. This driver currently supports the SMC in Apple Silicon
>> +	  Macs. For x86 Macs, see the applesmc driver (SENSORS_APPLESMC).
>> +
>> +	  Say Y here if you have an Apple Silicon Mac.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called macsmc.
>> +
>> +if APPLE_SMC
>> +
>> +config APPLE_SMC_RTKIT
>> +	tristate "RTKit (Apple Silicon) backend"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	depends on APPLE_RTKIT
>> +	default ARCH_APPLE
>> +	help
>> +	  Build support for SMC communications via the RTKit backend. This is
>> +	  required for Apple Silicon Macs.
>> +
>> +	  Say Y here if you have an Apple Silicon Mac.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called macsmc-rtkit.
>> +
>> +endif
>> +endif
>> diff --git a/drivers/platform/apple/Makefile b/drivers/platform/apple/Makefile
>> new file mode 100644
>> index 000000000000..79fac195398b
>> --- /dev/null
>> +++ b/drivers/platform/apple/Makefile
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Makefile for linux/drivers/platform/apple
>> +# Apple Platform-Specific Drivers
>> +#
>> +
>> +macsmc-y				+= smc_core.o
>> +macsmc-rtkit-y				+= smc_rtkit.o
>> +
>> +obj-$(CONFIG_APPLE_SMC)			+= macsmc.o
>> +obj-$(CONFIG_APPLE_SMC_RTKIT)		+= macsmc-rtkit.o
>> diff --git a/drivers/platform/apple/smc.h b/drivers/platform/apple/smc.h
>> new file mode 100644
>> index 000000000000..8ae51887b2c5
>> --- /dev/null
>> +++ b/drivers/platform/apple/smc.h
>> @@ -0,0 +1,28 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Apple SMC internal core definitions
>> + * Copyright (C) The Asahi Linux Contributors
>> + */
>> +
>> +#ifndef _SMC_H
>> +#define _SMC_H
>> +
>> +#include <linux/mfd/macsmc.h>
>> +
>> +struct apple_smc_backend_ops {
>> +	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
>> +	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
>> +	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
>> +	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
>> +		      void *rbuf, size_t rsize);
>> +	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
>> +	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
>> +};
>> +
>> +struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
>> +				  void *cookie);
>> +void *apple_smc_get_cookie(struct apple_smc *smc);
>> +int apple_smc_remove(struct apple_smc *smc);
>> +void apple_smc_event_received(struct apple_smc *smc, uint32_t event);
>> +
>> +#endif
>> diff --git a/drivers/platform/apple/smc_core.c b/drivers/platform/apple/smc_core.c
>> new file mode 100644
>> index 000000000000..daf029cd072f
>> --- /dev/null
>> +++ b/drivers/platform/apple/smc_core.c
>> @@ -0,0 +1,249 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Apple SMC core framework
>> + * Copyright The Asahi Linux Contributors
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/mfd/core.h>
> 
> Please refrain from using the MFD API outside of drivers/mfd.
> 
> If you need an MFD driver, please separate it out.
> 
> If not, please replace it with the platform_*() API instead.

There is precedent for MFD devices under platform/:

drivers/platform/x86/intel/int3472/tps68470.c

As well as other examples in the tree:

drivers/firmware/xilinx/zynqmp.c
drivers/iio/common/ssp_sensors/ssp_dev.c
drivers/misc/cardreader/alcor_pci.c
drivers/misc/cardreader/rtsx_pcr.c
drivers/misc/cardreader/rtsx_usb.c
drivers/soc/samsung/exynos-pmu.c
drivers/staging/nvec/nvec.c

Since it's a driver for a platform-specific firmware service, I thought
it made more sense in platform/ than mfd/. It's using the MFD API
because the firmware exposes multiple subsystems, and this maps very
nicely to the MFD model - NIHing that scaffolding would require a whole
bunch of custom matching/device creation code. But it's not exactly your
typical MFD device (it's not even a separate chip, it's part of the main
SoC), so I'm not sure if it really belongs in mfd/ from an
organizational standpoint?

- Hector
