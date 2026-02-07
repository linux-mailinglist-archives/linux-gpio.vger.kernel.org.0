Return-Path: <linux-gpio+bounces-31504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kORTAB9Dh2keVgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:50:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC710612C
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1384301A708
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 13:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59092248F54;
	Sat,  7 Feb 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCVmOoQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D0199FB0;
	Sat,  7 Feb 2026 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770472200; cv=none; b=LM57A6aU/TQdMklNrGZ/4ITDWmkb8/GTA3axYLhzi20Mv5KSACfUJ049rUv/mH0cRRc2kgXWMr7UJePEZZDQA9KBRnEJIsoRn8KSVGCMjEHmfbRGNgweiISI2LjhABFTS6u1qasiV8ztx+rEb6aCYD5/0dn5ef/jzfOK6VG+q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770472200; c=relaxed/simple;
	bh=9qmzFkg/e4PTTWV+UWyUTHgES7PWvGAHvnLexXSdJf0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPceSj9ko4er0l9pfqDNREhUrjPaZnld67X+ddjhTb2L8BTDsNLOtDT6ASs6d6hfupAYCcqkXHEIWuvBdss1pOVJv4QNA8nNQPYe18FzxXgMhHDEaInjy8qu6/kWXGZ8DACD4ygGtSLPBfNoLPdrkFRFjO9p0vyq/6drgNw84fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCVmOoQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB41C19423;
	Sat,  7 Feb 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770472199;
	bh=9qmzFkg/e4PTTWV+UWyUTHgES7PWvGAHvnLexXSdJf0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rCVmOoQ29j/tpFCrXP5xoxyT19ji453tskMn66YeBMsWd4ebUuwLFb46uzRsHrDOl
	 mulqfiGIsGosUTdwKsf7wbS7WIeACdlc0mQYlK+3eGTv6PmY85S1A8mNgMBqVbDVst
	 7HgRA1PblhP2XhSlQBqoNdAIJVNHMWnclTh8t4qnGkUA8veUszV3R3uhfkIhY9yKSi
	 EA4LJIFjOGDwvopSIs8Tg61kqFdR5mDHglRfFhwxGGsUoCk6rMHB7kwXvRjrIdzsSV
	 MyYcXhSE97gdpyNs03TQ0RoSWv2O7Us4HVebxgmS+3sClIy1ZRfh9M5t2DIYXbJPIr
	 +7L79Oc2MMilg==
Date: Sat, 7 Feb 2026 13:49:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: 434779359@qq.com
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, liufulin
 <frank.liu@faiot.com>, Waqar Hameed <waqar.hameed@axis.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <20260207134950.0f064905@jic23-huawei>
In-Reply-To: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31504-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[faiot.com:email,st.com:url,qq.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EFC710612C
X-Rspamd-Action: no action

On Sat,  7 Feb 2026 17:42:35 +0800
434779359@qq.com wrote:

> From: liufulin <frank.liu@faiot.com>
> 
> This patch adds support for the vl53l4cx tof ic
> ICs used in Qualcomm reference designs
> 
> Signed-off-by: liufulin <frank.liu@faiot.com>
Hi Frank and welcome to IIO.

This is a massive commit.  Normally roughly speaking each commit should
be an absolute maximum of 500-1000 lines of code because this what
people can realistically review in one go.

I'll take a superficial look at what you have here but to make any
progress towards upstream it will need stripping back to a much more
minimalist base.  From that we we can then look at adding more features
in future patch sets.

Note the largest drivers for what I'd expect to be a lot more complex
than a time of flight sensor are not as large as this in terms of
lines of code.

Look at the other commits to drivers/iio/ and follow the naming style
there.  e.g. something like
iio: proximity: Add VL...


> ---
>  drivers/iio/proximity/Kconfig        |    10 +
>  drivers/iio/proximity/Makefile       |     1 +
>  drivers/iio/proximity/vl53l4cx-i2c.c | 18161 +++++++++++++++++++++++++
>  3 files changed, 18172 insertions(+)
>  create mode 100644 drivers/iio/proximity/vl53l4cx-i2c.c
> 
> diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> index 6070974c2c85..a2fcb39e444e 100644
> --- a/drivers/iio/proximity/Kconfig
> +++ b/drivers/iio/proximity/Kconfig
> @@ -255,4 +255,14 @@ config AW96103
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called aw96103.
>  
> +config VL53L4CX_I2C
> +	tristate "STMicroelectronics VL53L0X ToF ranger sensor (I2C)"
> +	depends on I2C
> +	help
> +	  Say Y here to build a driver for STMicroelectronics VL53L0X
> +	  ToF ranger sensors with i2c interface.
> +	  This driver can be used to measure the distance of objects.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called vl53l0x-i2c.
> +
>  endmenu
> diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
> index 152034d38c49..8a682bbed50b 100644
> --- a/drivers/iio/proximity/Makefile
> +++ b/drivers/iio/proximity/Makefile
> @@ -24,4 +24,5 @@ obj-$(CONFIG_SX9500)		+= sx9500.o
>  obj-$(CONFIG_VCNL3020)		+= vcnl3020.o
>  obj-$(CONFIG_VL53L0X_I2C)	+= vl53l0x-i2c.o
>  obj-$(CONFIG_AW96103)		+= aw96103.o
> +obj-$(CONFIG_VL53L4CX_I2C)	+= vl53l4cx-i2c.o
>  
> diff --git a/drivers/iio/proximity/vl53l4cx-i2c.c b/drivers/iio/proximity/vl53l4cx-i2c.c
> new file mode 100644
> index 000000000000..df9ae9786966
> --- /dev/null
> +++ b/drivers/iio/proximity/vl53l4cx-i2c.c
> @@ -0,0 +1,18161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Support for ST VL53L0X FlightSense ToF Ranging Sensor on a i2c bus.
> + *
> + * Copyright (C) 2016 STMicroelectronics Imaging Division.
> + * Copyright (C) 2018 Song Qiang <songqiang1304521@gmail.com>
> + * Copyright (C) 2020 Ivan Drobyshevskyi <drobyshevskyi@gmail.com>
> + *
> + * Datasheet available at
> + * <https://www.st.com/resource/en/datasheet/vl53l0x.pdf>
> + *
> + * Default 7-bit i2c slave address 0x29.
> + *
> + * TODO: FIFO buffer, continuous mode, range selection, sensor ID check.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
Follow include what you use principles for IIO drivers.
For instance I see this uses a mutex, so include the header for that.
Note that we only do an approximate version of IWYU as some headers
are guaranteed to include others by design - as opposed to coincidence.
  
> +
> +#include <linux/iio/iio.h>
> +#include <linux/miscdevice.h>

There should be no reason for an IIO driver to need this header.
An IIO driver does not normally register as other types of device
as well as an IIO one.  If that does make sense in the long run
(as opposed to using a bridge driver - of which we have several
already for crossing subsystem boundaries) then don't do it in the
initial driver. Propose it as a later enhancement.


> +#include <linux/of_gpio.h>

Whilst I haven't checked yet it would be very usual to need
to include of_gpio.h in an IIO driver. That may imply using wrong
level of interfaces or just a stray include.

> +#include <linux/input.h>

Should not need this one either.
> +
> +#define STMVL53LX_DRV_NAME	"stmvl53lx"

Driver names don't normally have the stm prefix.   Also I strongly
prefer to just see the string used inline as it is rare that there
is anything that requires the various places such defines are used
to have the same string and using such a define implies such a requirement.

> +#define STMVL53LX_SLAVE_ADDR	(0x52>>1)
This seems unlikely
> +
> +#define VL_REG_SYSRANGE_START				0x00
> +
> +#define MODI2C_DEBUG	0
> +
> +#if 0
> +#define DEBUG	1
> +#endif
> +#if 0
> +#define FORCE_CONSOLE_DEBUG
> +#endif
This sort of set of defines do not belong in a driver for upstream.
> +
> +extern int stmvl53lx_enable_debug;
This doesn't either. Particularly true as it's a single file, so extern

is not useful.

> +
> +#ifdef DEBUG
> +#	ifdef FORCE_CONSOLE_DEBUG
> +#define vl53lx_dbgmsg(str, ...) do { \
> +	if (stmvl53lx_enable_debug) \
> +		pr_info("%s: " str, __func__, ##__VA_ARGS__); \
> +} while (0)
> +#	else
> +#define vl53lx_dbgmsg(str, ...) do { \
> +	if (stmvl53lx_enable_debug) \
> +		pr_debug("%s: " str, __func__, ##__VA_ARGS__); \

We have dynamic debug in the kernel, use
dev_dbg() etc to replace all this and rely on standard runtime controls
to turn prints on and off.

> +} while (0)
> +#	endif
> +#else
> +#	define vl53lx_dbgmsg(...) ((void)0)
> +#endif
> +
> +#define WORK_DEBUG	0
> +#if WORK_DEBUG
> +#	define work_dbg(msg, ...)\
> +	printk("[D WK53L1] :" msg "\n", ##__VA_ARGS__)
> +#else
> +#	define work_dbg(...) ((void)0)
> +#endif
> +
> +#define vl53lx_info(str, args...) \
> +	pr_info("%s: " str "\n", __func__, ##args)
> +
> +#define vl53lx_errmsg(str, args...) \
> +	pr_err("%s: " str, __func__, ##args)
> +
> +#define vl53lx_wanrmsg(str, args...) \
> +	pr_warn("%s: " str, __func__, ##args)

None of these should be used in a driver for upstream. Use
the standard calls. Dynamic debug allows you to control
what is printed included function names etc.

> +
> +#ifndef STMVL53LX_LOG_POLL_TIMING
> +#	define STMVL53LX_LOG_POLL_TIMING	0
> +#endif
> +#ifndef STMVL53LX_LOG_CCI_TIMING
> +#	define STMVL53LX_LOG_CCI_TIMING	0
> +#endif
> +
> +#define modi2c_warn(fmt, ...)\
> +	dev_WARN(&i2c_data->client->dev, fmt, ##__VA_ARGS__)
> +
> +#define modi2c_err(fmt, ...)\
> +	dev_err(&i2c_data->client->dev, fmt, ##__VA_ARGS__)
> +
> +#if MODI2C_DEBUG
> +#define modi2c_dbg(fmt, ...)\
> +		pr_devel("%s "fmt"\n", __func__, ##__VA_ARGS__)
> +#else
> +#define modi2c_dbg(...)	((void)0)
> +#endif
> +
Having looked quickly through the defines that follow 90% of them
should not be here. Only have defines for
1) Register addresses
2) Fields in registers (typically masks, sometimes values for enumeration
   like field values).
3) Key constants that are used repeatedly.

> +#define VL_REG_SYSRANGE_MODE_MASK			GENMASK(3, 0)
> +#define VL_REG_SYSRANGE_MODE_SINGLESHOT			0x00
> +#define VL_REG_SYSRANGE_MODE_START_STOP			BIT(0)
> +#define VL_REG_SYSRANGE_MODE_BACKTOBACK			BIT(1)
> +#define VL_REG_SYSRANGE_MODE_TIMED			BIT(2)
> +#define VL_REG_SYSRANGE_MODE_HISTOGRAM			BIT(3)
> +
> +#define VL_REG_SYSTEM_INTERRUPT_CONFIG_GPIO		0x0A
> +#define VL_REG_SYSTEM_INTERRUPT_GPIO_NEW_SAMPLE_READY	BIT(2)
> +
> +#define VL_REG_SYSTEM_INTERRUPT_CLEAR			0x0B
> +
> +#define VL_REG_RESULT_INT_STATUS			0x13
> +#define VL_REG_RESULT_RANGE_STATUS			0x14
> +#define VL_REG_RESULT_RANGE_STATUS_COMPLETE		BIT(0)
> +
> +#define VL53LX_FIRMWARE_BOOT_TIME_US            1200
> +#define VL53LX_I2C_SLAVE__DEVICE_ADDRESS        0x0001
> +
> +#define VL53LX_NVM_PEAK_RATE_MAP_SAMPLES  25
> +
> +#define VL53LX_MAX_USER_ZONES                5

The blank lines in here don't seem to provide much benefit for
readability.  Group the types of define together in blocks with
blank lines only used to separate those blocks. 

> +
> +#define VL53LX_MAX_RANGE_RESULTS 4
> +
> +#define VL53LX_MAX_STRING_LENGTH 512
> +
> +#define VL53LX_RTN_SPAD_BUFFER_SIZE                   32
> +
> +#define  VL53LX_MAX_BIN_SEQUENCE_LENGTH  6
> +
> +#define  VL53LX_XTALK_HISTO_BINS        12
> +
> +#define VL53LX_MAX_XTALK_RANGE_RESULTS        5
> +
> +#define VL53LX_BIN_REC_SIZE 6
> +
> +#define VL53LX_MAX_OFFSET_RANGE_RESULTS       3
> +
> +#define VL53LX_TIMING_CONF_A_B_SIZE 2
> +
> +#define  VL53LX_HISTOGRAM_BUFFER_SIZE   24
> +
> +#define VL53LX_FRAME_WAIT_EVENT	6
> +
> +#define VL53LX_RANGE_STATUS__RANGE_STATUS_MASK          0x1F
> +#define VL53LX_RANGE_STATUS__MAX_THRESHOLD_HIT_MASK     0x20
> +#define VL53LX_RANGE_STATUS__MIN_THRESHOLD_HIT_MASK     0x40
> +#define VL53LX_RANGE_STATUS__GPH_ID_RANGE_STATUS_MASK   0x80
> +
> +#define VL53LX_INTERRUPT_STATUS__INT_STATUS_MASK            0x07
> +#define VL53LX_INTERRUPT_STATUS__INT_ERROR_STATUS_MASK      0x18
> +#define VL53LX_INTERRUPT_STATUS__GPH_ID_INT_STATUS_MASK     0x20
> +
> +#define  VL53LX_MAX_BIN_SEQUENCE_LENGTH  6
> +#define  VL53LX_MAX_BIN_SEQUENCE_CODE   15
> +#define  VL53LX_HISTOGRAM_BUFFER_SIZE   24
> +#define  VL53LX_XTALK_HISTO_BINS        12
> +
> +#define VL53LX_BOOT_COMPLETION_POLLING_TIMEOUT_MS     500
> +
> +#define VL53LX_BOOT_COMPLETION_POLLING_TIMEOUT_MS     500
> +#define VL53LX_RANGE_COMPLETION_POLLING_TIMEOUT_MS   2000
> +#define VL53LX_TEST_COMPLETION_POLLING_TIMEOUT_MS   60000
> +
> +#define VL53LX_POLLING_DELAY_MS                         1
> +
> +#define VL53LX_FIRMWARE__SYSTEM_STATUS 0x00E5
> +
> +#define VL53LX_GROUPEDPARAMETERHOLD_ID_MASK             0x02
> +
> +#define VL53LX_SYSTEM_CONTROL_I2C_SIZE_BYTES                5
> +
> +#define STMVL53LX_MAX_CCI_XFER_SZ	256
> +
> +#define FDA_MAX_TIMING_BUDGET_US 550000
> +#define L4_FDA_MAX_TIMING_BUDGET_US 200000
> +
> +#define WRITE_MULTIPLE_CHUNK_MAX	32
> +
> +#define VL53LX_POWER_MANAGEMENT__GO1_POWER_FORCE 0x0083
> +
> +#define VL53LX_DEVICEMEASUREMENTMODE_MODE_MASK          0xF0
> +#define VL53LX_DEVICEMEASUREMENTMODE_STOP_MASK          0x0F
> +
> +#define VL53LX_MAX_AMBIENT_DMAX_VALUES        5
> +
> +#define VL53LX_PATCH__CTRL 0x0470
> +
> +#define VL53LX_FIRMWARE__ENABLE 0x0085
> +
> +#define VL53LX_CUSTOMER_NVM_MANAGED_I2C_SIZE_BYTES         23
> +
> +#define VL53LX_GLOBAL_CONFIG__SPAD_ENABLES_REF_0 0x000D
> +
> +#define IGNORE_DIVISION_BY_ZERO                                0
> +
> +#define IGNORE_XTALK_EXTRACTION_NO_SAMPLE_FAIL                 0
> +#define IGNORE_XTALK_EXTRACTION_SIGMA_LIMIT_FAIL               0
> +#define IGNORE_XTALK_EXTRACTION_NO_SAMPLE_FOR_GRADIENT_WARN    0
> +#define IGNORE_XTALK_EXTRACTION_SIGMA_LIMIT_FOR_GRADIENT_WARN  0
> +#define IGNORE_XTALK_EXTRACTION_MISSING_SAMPLES_WARN           0
> +
> +#define IGNORE_REF_SPAD_CHAR_NOT_ENOUGH_SPADS                  0
> +#define IGNORE_REF_SPAD_CHAR_RATE_TOO_HIGH                     0
> +#define IGNORE_REF_SPAD_CHAR_RATE_TOO_LOW                      0
> +
> +#define IGNORE_OFFSET_CAL_MISSING_SAMPLES                      0
> +#define IGNORE_OFFSET_CAL_SIGMA_TOO_HIGH                       0
> +#define IGNORE_OFFSET_CAL_RATE_TOO_HIGH                        0
> +#define IGNORE_OFFSET_CAL_SPAD_COUNT_TOO_LOW				   0
> +
> +#define IGNORE_ZONE_CAL_MISSING_SAMPLES                        0
> +#define IGNORE_ZONE_CAL_SIGMA_TOO_HIGH                         0
> +#define IGNORE_ZONE_CAL_RATE_TOO_HIGH                          0
I have no idea why we have lots of defines to 0.  Drop all these.  There is
never any reason to define away errors.
> +
>
> +#define VL53LXDevDataGet(Dev, field) (Dev->field)
> +#define VL53LXDevDataSet(Dev, field, data) ((Dev->field) = (data))

These macros don't provide an obvious readability benefit over just
using the accesses to the relevant structures inline.  So please remove
them.


> +
> +#define VL53LXDevStructGetLLDriverHandle(Dev) (&VL53LXDevDataGet(Dev, LLData))
> +#define VL53LXDevStructGetLLResultsHandle(Dev) (&VL53LXDevDataGet(Dev,\
> +		llresults))
> +
> +#define VL53LX_SETPARAMETERFIELD(Dev, field, value) \
> +	(VL53LXDevDataSet(Dev, CurrentParameters.field, value))
> +
> +#define VL53LX_GETPARAMETERFIELD(Dev, field, variable) \
> +	(variable = VL53LXDevDataGet(Dev, CurrentParameters).field)
> +
> +#define VL53LX_SETARRAYPARAMETERFIELD(Dev, field, index, value) \
> +	(VL53LXDevDataSet(Dev, CurrentParameters.field[index], value))
> +
> +#define VL53LX_GETARRAYPARAMETERFIELD(Dev, field, index, variable) \
> +	(variable = VL53LXDevDataGet(Dev, CurrentParameters).field[index])
> +
> +#define VL53LX_SETDEVICESPECIFICPARAMETER(Dev, field, value) \
> +	(VL53LXDevDataSet(Dev, DeviceSpecificParameters.field, value))
> +
> +#define VL53LX_GETDEVICESPECIFICPARAMETER(Dev, field) \
> +	(VL53LXDevDataGet(Dev, DeviceSpecificParameters).field)
> +
> +#define stvm531_get_max_meas_err(...) 3
> +#define stvm531_get_max_stream_err(...) 6
> +
> +#define VL53LX_D_001    8
> +#define VL53LX_D_002    0xFFFF
> +#define VL53LX_D_008	0xFFFF
> +#define VL53LX_D_003	0xFFFFFF
> +#define VL53LX_D_007	0xFFFFFFFF
> +#define VL53LX_D_005	0x7FFFFFFFFF
> +#define VL53LX_D_009	0xFFFFFFFFFF
> +#define VL53LX_D_010	0xFFFFFFFFFFFF
> +#define VL53LX_D_004	0xFFFFFFFFFFFFFF
> +#define VL53LX_D_006	0x7FFFFFFFFFFFFFFF
> +#define VL53LX_D_011	0xFFFFFFFFFFFFFFFF
> +
> +
> +typedef uint32_t FixPoint1616_t;

Use kernel types u32 etc not uint32_t...


> +
> +#define VL53LX_FIXPOINT1616TOFIXPOINT44(Value) ((uint16_t)((Value>>12)&0xFFFF))

Define a mask for the fields if it adds clarity over
GENMASK(19, 12) being used inline in conjunction with FIELD_GET() / FIELD_PREP()

> +#define VL53LX_FIXPOINT44TOFIXPOINT1616(Value) ((FixPoint1616_t)((uint32_t)Value<<12))
> +
> +#define VL53LX_FIXPOINT1616TOFIXPOINT72(Value) ((uint16_t)((Value>>14)&0xFFFF))

> +
> +typedef uint8_t VL53LX_DeviceError;
> +
> +#define VL53LX_DEVICEERROR_NOUPDATE                   \
> +	((VL53LX_DeviceError) 0)
> +#define VL53LX_DEVICEERROR_VCSELCONTINUITYTESTFAILURE \
> +	((VL53LX_DeviceError) 1)
> +#define VL53LX_DEVICEERROR_VCSELWATCHDOGTESTFAILURE   \
> +	((VL53LX_DeviceError) 2)
> +#define VL53LX_DEVICEERROR_NOVHVVALUEFOUND            \
> +	((VL53LX_DeviceError) 3)
> +#define VL53LX_DEVICEERROR_MSRCNOTARGET               \
> +	((VL53LX_DeviceError) 4)
> +#define VL53LX_DEVICEERROR_RANGEPHASECHECK            \
> +	((VL53LX_DeviceError) 5)
> +#define VL53LX_DEVICEERROR_SIGMATHRESHOLDCHECK        \
> +	((VL53LX_DeviceError) 6)
> +#define VL53LX_DEVICEERROR_PHASECONSISTENCY           \
> +	((VL53LX_DeviceError) 7)
> +#define VL53LX_DEVICEERROR_MINCLIP                    \
> +	((VL53LX_DeviceError) 8)
> +#define VL53LX_DEVICEERROR_RANGECOMPLETE               \
> +	((VL53LX_DeviceError) 9)
> +#define VL53LX_DEVICEERROR_ALGOUNDERFLOW               \
> +	((VL53LX_DeviceError) 10)
> +#define VL53LX_DEVICEERROR_ALGOOVERFLOW                \
> +	((VL53LX_DeviceError) 11)
> +#define VL53LX_DEVICEERROR_RANGEIGNORETHRESHOLD       \
> +	((VL53LX_DeviceError) 12)
> +#define VL53LX_DEVICEERROR_USERROICLIP                \
> +	((VL53LX_DeviceError) 13)
> +#define VL53LX_DEVICEERROR_REFSPADCHARNOTENOUGHDPADS   \
> +	((VL53LX_DeviceError) 14)
> +#define VL53LX_DEVICEERROR_REFSPADCHARMORETHANTARGET  \
> +	((VL53LX_DeviceError) 15)
> +#define VL53LX_DEVICEERROR_REFSPADCHARLESSTHANTARGET  \
> +	((VL53LX_DeviceError) 16)
> +#define VL53LX_DEVICEERROR_MULTCLIPFAIL                \
> +	((VL53LX_DeviceError) 17)
> +#define VL53LX_DEVICEERROR_GPHSTREAMCOUNT0READY        \
> +	((VL53LX_DeviceError) 18)
> +#define VL53LX_DEVICEERROR_RANGECOMPLETE_NO_WRAP_CHECK \
> +	((VL53LX_DeviceError) 19)
> +#define VL53LX_DEVICEERROR_EVENTCONSISTENCY           \
> +	((VL53LX_DeviceError) 20)
> +#define VL53LX_DEVICEERROR_MINSIGNALEVENTCHECK        \
> +	((VL53LX_DeviceError) 21)
> +#define VL53LX_DEVICEERROR_RANGECOMPLETE_MERGED_PULSE \
> +	((VL53LX_DeviceError) 22)
> +#define VL53LX_DEVICEERROR_PREV_RANGE_NO_TARGETS      \
> +	((VL53LX_DeviceError) 23)
These are very long definitions.  Feels like an enum would be appropriate
but maybe I'm missing something.


> +#define VL53LX_OSC_MEASURED__FAST_OSC__FREQUENCY 0x0006
> +#define VL53LX_OSC_MEASURED__FAST_OSC__FREQUENCY_HI 0x0006

One define for the first register involved should be enough.
No need for repeats.  If larger reads are used and as such
only ever the first define, then don't have defines for the
_LO register at all. It brings no advantage.


> +#define VL53LX_OSC_MEASURED__FAST_OSC__FREQUENCY_LO 0x0007

> +#define VL53LX_PATCH__OFFSET_0 0x0476

For large sets of registers like this that are just numbers use
a define that takes a parameter to cover all of them.
If you want to range check that parameter, then can use a little
helper function.

> +#define VL53LX_PATCH__OFFSET_0_HI 0x0476
> +#define VL53LX_PATCH__OFFSET_0_LO 0x0477
> +#define VL53LX_PATCH__OFFSET_1 0x0478
> +#define VL53LX_PATCH__OFFSET_1_HI 0x0478
> +#define VL53LX_PATCH__OFFSET_1_LO 0x0479
> +#define VL53LX_PATCH__OFFSET_2 0x047A
> +#define VL53LX_PATCH__OFFSET_2_HI 0x047A
> +#define VL53LX_PATCH__OFFSET_2_LO 0x047B
> +#define VL53LX_PATCH__OFFSET_3 0x047C
> +#define VL53LX_PATCH__OFFSET_3_HI 0x047C
> +#define VL53LX_PATCH__OFFSET_3_LO 0x047D
> +#define VL53LX_PATCH__OFFSET_4 0x047E
> +#define VL53LX_PATCH__OFFSET_4_HI 0x047E
> +#define VL53LX_PATCH__OFFSET_4_LO 0x047F
>
> +
> +#define VL53LX_IOCTL_START			_IO('p', 0x01)
> +
> +#define VL53LX_IOCTL_STOP			_IO('p', 0x05)
> +
> +#define VL53LX_IOCTL_PARAMETER \
> +	_IOWR('p', 0x0d, struct stmvl53lx_parameter)
> +
> +#define VL53LX_IOCTL_ROI\
> +	_IOWR('p', 0x0e, struct stmvl53lx_ioctl_roi_t)
> +
> +#define VL53LX_IOCTL_MZ_DATA\
> +	_IOR('p', 0x0f, VL53LX_MultiRangingData_t)
> +
> +#define VL53LX_IOCTL_MZ_DATA_BLOCKING\
> +	_IOR('p', 0x11, VL53LX_MultiRangingData_t)
> +
> +#define VL53LX_IOCTL_CALIBRATION_DATA\
> +	_IOWR('p', 0x12, struct stmvl53lx_ioctl_calibration_data_t)
> +
> +#define VL53LX_IOCTL_PERFORM_CALIBRATION\
> +	_IOW('p', 0x13, struct stmvl53lx_ioctl_perform_calibration_t)
> +

An IIO driver should not have custom IOCTL.  Take these out for
now and once basic driver is in place we can discuss how to support
this sort of functionality.

> +
> +
> +struct stmvl53lx_register {
> +	uint32_t is_read;
> +	uint32_t index;
> +	uint32_t cnt;
> +	int32_t status;
> +	union reg_data_t {
> +		uint8_t b;
> +		uint16_t w;
> +		uint32_t dw;
> +		uint8_t bytes[256];
> +	} data;
> +};
> +
> +struct stmvl53lx_register_flexi {
> +	uint32_t is_read;
> +	uint32_t index;
> +	uint32_t cnt;
> +	int32_t status;
> +	uint8_t data[];

Use __counted_by() here.  I assume cnt?

> +};
> +


> +#define IMPLEMENT_PARAMETER_INTEGER(sysfs_name, info_name)\
> +static ssize_t stmvl53lx_show_##sysfs_name(struct device *dev, \
> +				struct device_attribute *attr, char *buf) \
Custom attributes need documentation in 
Documentation/ABI/testing/sysfs-bus-iio-vl53l4cx

However, note that custom attributes often mean unused code, so I am very
conservative about allowing them.   Most of the time we can find
an existing interface, or propose new general interfaces to cover particular
features.

> +{ \
> +	struct stmvl53lx_data *data = dev_get_drvdata(dev); \
> +	int param; \
> +\
> +	mutex_lock(&data->work_mutex); \
> +	param = data->sysfs_name; \
> +	mutex_unlock(&data->work_mutex);; \
> +\
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", param); \
> +} \
> +\

I skipped most of the rest of the defines as I'd expect the vast
majority not to be present in v2.  Maybe they will come back in future
patches adding additional features.


> +
> +struct stmvl53lx_data {
> +	int id;
> +	char name[64];
> +	VL53LX_DevData_t stdev;
> +	void *client_object;
> +	bool is_device_remove;
> +	struct mutex work_mutex;
> +	struct delayed_work	dwork;
> +	struct input_dev *input_dev_ps;
> +	struct miscdevice miscdev;

Drop the input device and misc device at least from initial patch.
If you do propose adding those in a future series, then you need
to cc linux-input.

> +	int is_first_irq;
> +	int is_first_start_done;
> +	int poll_mode;
> +	int poll_delay_ms;
> +	int enable_sensor;
> +	struct st_timeval start_tv;
> +	int enable_debug;
> +	bool allow_hidden_start_stop;
> +	int32_t timing_budget;
> +	int distance_mode;
> +	int crosstalk_enable;
> +	int output_mode;
> +	bool force_device_on_en;
> +	VL53LX_Error last_error;
> +	int offset_correction_mode;
Superficially I'd guess a log of the stuff in here is caching device
state.  Just read it back from the device registers.  Reading state
of devices is very rarely a fast path.

Perhaps regmap / regcache can be used here to reduce bus traffic
if that's a problem.

> +	int smudge_correction_mode;
> +	FixPoint1616_t optical_offset_x;
> +	FixPoint1616_t optical_offset_y;
> +	bool is_xtalk_value_changed;
> +	bool is_calibrating;
> +	struct range_t {
> +		uint32_t	cnt;
> +		uint32_t	intr;
> +		int	poll_cnt;
> +		uint32_t	err_cnt;
> +		uint32_t	err_tot;
> +		struct st_timeval start_tv;
> +		struct st_timeval comp_tv;
> +		VL53LX_MultiRangingData_t multi_range_data;
> +		VL53LX_MultiRangingData_t tmp_range_data;
> +		VL53LX_AdditionalData_t additional_data;
> +	} meas;
> +	uint32_t flushCount;
> +	int flush_todo_counter;
> +	struct list_head simple_data_reader_list;
> +	struct list_head mz_data_reader_list;
> +	wait_queue_head_t waiter_for_data;
> +	bool is_data_valid;
> +	bool is_delay_allowed;
> +	int reset_state;
> +	VL53LX_UserRoi_t roi_cfg;
> +};
>
> +
> +struct stmvl53lx_data *stmvl53lx_dev_table[STMVL53LX_CFG_MAX_DEV];
> +
> +struct stmvl53lx_module_fn_t {
> +	int (*init)(void);
> +	void (*deinit)(void *data);
> +	int (*power_up)(void *data);
> +	int (*power_down)(void *data);
> +	int (*reset_release)(void *data);
> +	int (*reset_hold)(void *data);
> +	int (*start_intr)(void *object, int *poll_mode);
> +	void (*clean_up)(void);
> +	void *(*get)(void *object);
> +	void (*put)(void *object);
This looks like a hardware abstraction layer (HAL).  Whilst sometimes
we do end up with a few callbacks as a driver is expanded to include
additional devices, we do this only as needed. For now remove this
and use direct calls to the relevant functions.

> +};

> +
> +static struct i2c_client *stm_test_i2c_client;
No idea what this is. But by the name it doesn't belong in a
upstream driver.

> +
> +static const int tunings[][2] = {
> +};
> +
> +int stmvl53lx_enable_debug = 1;
> +
> +static int force_device;
> +static int adapter_nb = -1;
> +static int xsdn_gpio_nb = -1;
> +static int pwren_gpio_nb = -1;
> +static int intr_gpio_nb = -1;
> +static int i2c_addr_nb = STMVL53LX_SLAVE_ADDR;
> +
> +static bool force_device_on_en_default = true;
> +
> +module_param(force_device_on_en_default, bool, 0444);
> +MODULE_PARM_DESC(force_device_on_en_default, "select whether force_device_on_en is true or false by default");
> +
> +module_param(force_device, int, 0000);
> +MODULE_PARM_DESC(force_device, "force device insertion at module init");

Drop all these module parameters.  Any device specific information should come
from firmware, not module parameters.

> +
> +module_param(adapter_nb, int, 0000);
> +MODULE_PARM_DESC(adapter_nb, "i2c adapter to use");
> +
> +module_param(i2c_addr_nb, int, 0000);
> +MODULE_PARM_DESC(i2c_addr_nb, "desired i2c device address on adapter ");
> +
> +module_param(xsdn_gpio_nb, int, 0000);
> +MODULE_PARM_DESC(xsdn_gpio_nb, "select gpio numer to use for vl53lx reset");
> +
> +module_param(pwren_gpio_nb, int, 0000);
> +MODULE_PARM_DESC(pwren_gpio_nb, "select gpio numer to use for vl53lx power");
> +
> +module_param(intr_gpio_nb, int, 0000);
> +MODULE_PARM_DESC(intr_gpio_nb, "select gpio numer to use for vl53lx interrupt");
> +static DEFINE_MUTEX(dev_addr_change_mutex);
> +static DEFINE_MUTEX(dev_table_mutex);
> +
> +static struct stmvl53lx_module_fn_t stmvl53lx_module_func_tbl;
> +static int _ctrl_stop(struct stmvl53lx_data *data);
> +static int reset_hold(struct stmvl53lx_data *data);
> +static void stmvl53lx_insert_flush_events_lock(struct stmvl53lx_data *data);
> +VL53LX_Error VL53LX_GetCalibrationData(VL53LX_DEV Dev, VL53LX_CalibrationData_t *pCalibrationData);

I haven't looked in detail, but I would not expect to see more than a very
small number of forwards definitions in a driver.  Also follow standard
kernel style for type names etc.  I want to see struct .... for these
not a typedef.

> +VL53LX_Error VL53LX_get_device_results(VL53LX_DEV Dev, VL53LX_DeviceResultsLevel device_results_level, VL53LX_range_results_t *prange_results);
I'm going to stop here for today as I have a large backlog of code and I think
the comments to this point should get you going on stripping this driver
back for v2.

Remember to target an absolute maximum of 1000 lines for each patch. Preferably
a lot smaller that that.

For the full series, stay under 2000 lines or in practice it won't get reviewed.

Jonathan

