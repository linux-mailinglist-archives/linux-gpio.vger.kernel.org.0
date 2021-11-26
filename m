Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B9B45E408
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244362AbhKZBgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbhKZBeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:34:02 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481CEC061746;
        Thu, 25 Nov 2021 17:30:50 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id o14so5643310plg.5;
        Thu, 25 Nov 2021 17:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dmiqxQnyLLH+43GiXgVIFJZdKgfxuAkHMKr4akk5uN8=;
        b=ZLO2e5wqXRtjeXchUK+/NokNKLyhivyHi2HxcFWY+yIcNXb3ksN/4ODQRIQMLan4JQ
         KNW2uYGWLBcF6QlNIQziKHAWylnOtGS2E74uVZ0xzMIK2Rbpuab1gEbiR4Db86/58Jcq
         gRbWcsGgQQLUHEqm0TucfDu1DVeHjY25NYSNqCT3oGANzgjYy/VoClohwnnJBnYKla7R
         xUYZtOSzdu/k37j06NMFJyYUZx29bBLRtffO7JEr61c7yS+mj/o87xRIJMncu7zF7iQy
         BMSyTtpfgdyF4XP2cN4IeU7LZ7eauuiLWP+WwubiAQVNRiBQPy4B6Em2zlp/26NHEEte
         yvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dmiqxQnyLLH+43GiXgVIFJZdKgfxuAkHMKr4akk5uN8=;
        b=UTApakImgItlkmAy4n3IA19nBkOTdqxjUgiZAo562MdN8JXAxgsMWvmLUz/q8x4rps
         yoa8HProBRfHh8GKmTrdnCg9i1WZwLTxbMGAv1Mbf28xRvILf0Yp+FeXXEiWSmC9PZph
         goB/c7Fbud8y3nBKo/zJaKlcJ9KDhWAXH51y1pyluufx9EOONhC8FQHWcPW5wwFEt1VC
         AxpyaYgQxU6FFjUjilj8JkP3Dwn6pNlvCsITjZyR2WUZ2nGtciIYZcDVrY8ubiLxQSb8
         +Z0g3hvCTEwDUouABOCUY9IGMeSZ+LFpucCcfKprE5/q74xFloT1jV8w5/ETgkQixKFF
         dO7w==
X-Gm-Message-State: AOAM5334bIze4iYZy09rzbvn7CkxumJ/tKC8Lm5CWWl6x6s4HjSDle1w
        WoCVG0Zatlsd8LvZ4wcsxCg=
X-Google-Smtp-Source: ABdhPJxwcOJzEZF3+5KmlsrWcAnudmTkBCBnWy/JODOvo46pLxA0b4zaKK+J7p91yVcrJun6ugNg6g==
X-Received: by 2002:a17:90a:1f45:: with SMTP id y5mr12237481pjy.138.1637890249150;
        Thu, 25 Nov 2021 17:30:49 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id h1sm3840957pfi.217.2021.11.25.17.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 17:30:48 -0800 (PST)
Date:   Fri, 26 Nov 2021 09:30:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC v3 02/12] drivers: Add hardware timestamp engine (HTE)
Message-ID: <20211126013041.GA10380@sol>
References: <20211123193039.25154-1-dipenp@nvidia.com>
 <20211123193039.25154-3-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123193039.25154-3-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 11:30:29AM -0800, Dipen Patel wrote:
> Some devices can timestamp system lines/signals/Buses in real-time
> using the hardware counter or other hardware means which can give
> finer granularity and help avoid jitter introduced by software
> timestamping. To utilize such functionality, this patchset creates
> HTE subsystem where devices can register themselves as providers so
> that the consumers devices can request specific line from the
> providers.
> 
> It provides below APIs for the provider:
> - devm_hte_register_chip -- To register the HTE provider.
> - hte_push_ts_ns() -- To push timestamp data into HTE subsystem.
> 
> It provides below APIs for the consumer:
> - devm_of_hte_request_ts() -- Request timestamp functionality.
> - hte_req_ts_by_hte_name() -- To request timestamp functionality by
> using HTE provider dt node.
> - hte_enable_ts() -- To disable timestamp functionality.
> - hte_disable_ts() -- To enable timestamp functionality.
> - hte_release_ts() -- To release timestamp functionality and its
> associated resources.
> - hte_get_clk_src_info() -- To query clock source information from
> the provider
> 
> The detail about parameters and API usage are described in each
> functions definitions in drivers/hte/hte.c file.
> 
> The patch adds compilation support in Makefile and menu options in
> Kconfig.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Changes in v2:
> - Removed buffer abstraction layer as well related APIs, HTE now will not store
> any data, instead will pass to consumer as soon as it is available.
> - Removed unnecessary dynamical allocations
> - Removed timestamp retrieve API
> - Removed release, unregister related APIs as their counterpart are resource
> managed.
> - Added kernel thread implementation if consumer indicates threaded callback
> during request API time.
> - Changed hte_req_ts_by_dt_node API to remove device node exposure from the
> interface, instead consumer will their device node with property name that
> indicates the provider it wants to use.
> 
> Changes in v3:
> - Addressed grammatical/spelling errors.
> 
>  drivers/Kconfig      |   2 +
>  drivers/Makefile     |   1 +
>  drivers/hte/Kconfig  |  22 ++
>  drivers/hte/Makefile |   2 +
>  drivers/hte/hte.c    | 907 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/hte.h  | 248 ++++++++++++
>  6 files changed, 1182 insertions(+)
>  create mode 100644 drivers/hte/Kconfig
>  create mode 100644 drivers/hte/Makefile
>  create mode 100644 drivers/hte/hte.c
>  create mode 100644 include/linux/hte.h
> 
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 0d399ddaa185..b3c8332bf5c7 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -236,4 +236,6 @@ source "drivers/interconnect/Kconfig"
>  source "drivers/counter/Kconfig"
>  
>  source "drivers/most/Kconfig"
> +
> +source "drivers/hte/Kconfig"
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index be5d40ae1488..087c08e846e6 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -188,3 +188,4 @@ obj-$(CONFIG_GNSS)		+= gnss/
>  obj-$(CONFIG_INTERCONNECT)	+= interconnect/
>  obj-$(CONFIG_COUNTER)		+= counter/
>  obj-$(CONFIG_MOST)		+= most/
> +obj-$(CONFIG_HTE)		+= hte/
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> new file mode 100644
> index 000000000000..1fcfe17cf28a
> --- /dev/null
> +++ b/drivers/hte/Kconfig
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig HTE
> +	bool "Hardware Timestamping Engine (HTE) Support"
> +	help
> +	  Hardware Timestamping Engine (HTE) Support.
> +
> +	  Some devices provide a hardware timestamping engine which can
> +	  timestamp certain device lines/signals in realtime. This provides a
> +	  hardware-assisted timestamp to generic signals like GPIOs or IRQs
> +	  lines. It comes with a benefit for applications like autonomous
> +	  machines needing accurate timestamping event with less jitter.
> +
> +	  This framework provides a generic interface to such HTE devices
> +	  within the Linux kernel. It provides an API to register and
> +	  unregister a HTE provider chip, configurable software buffer to
> +	  store the timestamps, push the timestamp from the HTE providers and
> +	  retrieve timestamps for the consumers. It also provides means for the
> +	  consumers to request signals it wishes to hardware timestamp and
> +	  release them if not required.
> +
> +	  If unsure, say no.
> +
> diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
> new file mode 100644
> index 000000000000..fc03bdf44427
> --- /dev/null
> +++ b/drivers/hte/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_HTE)		+= hte.o
> +
> diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
> new file mode 100644
> index 000000000000..ca91d48f48b9
> --- /dev/null
> +++ b/drivers/hte/hte.c
> @@ -0,0 +1,907 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 NVIDIA Corporation
> + *
> + * Author: Dipen Patel <dipenp@nvidia.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/mutex.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
> +#include <linux/hte.h>
> +#include <linux/delay.h>
> +#include <linux/debugfs.h>
> +#include <linux/kthread.h>
> +
> +#define HTE_TS_NAME_LEN		10
> +
> +/* Global list of the HTE devices */
> +static DEFINE_SPINLOCK(hte_lock);
> +static LIST_HEAD(hte_devices);
> +
> +enum {
> +	HTE_TS_REGISTERED,
> +	HTE_TS_DISABLE,
> +};
> +
> +enum {
> +	HTE_CB_RUN_THREAD,
> +	HTE_CB_NUM,
> +};
> +
> +/**
> + * struct hte_ts_info - Information related to requested timestamp.
> + *
> + * @xlated_id: Timestamp ID as understood between HTE subsys and HTE provider,
> + * See xlate callback API.
> + * @flags: Flags holding state informations.
> + * @hte_cb_flags: Callback related flags.
> + * @seq: Timestamp sequence counter.
> + * @hte_name: Indicates if HTE core has set name for this timestamp entity.
> + * @cb: Callback function provided by clients.
> + * @tcb: Threaded callback function provided by clients.
> + * @dropped_ts: Dropped timestamps.
> + * @slock: Spin lock.
> + * @thread: Thread task when tcb is provided.
> + * @req_mlock: Lock during timestamp request/release APIs.
> + * @ts_dbg_root: Root for the debug fs.
> + * @gdev: HTE abstract device that this timestamp belongs to.
> + * @cl_data: Client specific data.
> + */
> +struct hte_ts_info {
> +	u32 xlated_id;
> +	unsigned long flags;
> +	unsigned long hte_cb_flags;
> +	u64 seq;
> +	bool hte_name;
> +	hte_ts_cb_t cb;
> +	hte_ts_threaded_cb_t tcb;
> +	atomic_t dropped_ts;
> +	spinlock_t slock;
> +	struct task_struct *thread;
> +	struct mutex req_mlock;
> +	struct dentry *ts_dbg_root;
> +	struct hte_device *gdev;
> +	void *cl_data;
> +};
> +
> +/**
> + * struct hte_device - HTE abstract device
> + * @nlines: Number of entities this device supports.
> + * @ts_req: Total number of entities requested.
> + * @sdev: Device used at various debug prints.
> + * @dbg_root: Root directory for debug fs.
> + * @list: List node to store hte_device for each provider.
> + * @chip: HTE chip providing this HTE device.
> + * @owner: helps prevent removal of modules when in use.
> + * @ei: Timestamp information.
> + */
> +struct hte_device {
> +	u32 nlines;
> +	atomic_t ts_req;
> +	struct device *sdev;
> +	struct dentry *dbg_root;
> +	struct list_head list;
> +	struct hte_chip *chip;
> +	struct module *owner;
> +	struct hte_ts_info ei[];
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +static struct dentry *hte_root;
> +
> +static int __init hte_subsys_dbgfs_init(void)
> +{
> +	/* creates /sys/kernel/debug/hte/ */
> +	hte_root = debugfs_create_dir("hte", NULL);
> +
> +	return 0;
> +}
> +subsys_initcall(hte_subsys_dbgfs_init);
> +
> +static void hte_chip_dbgfs_init(struct hte_device *gdev)
> +{
> +	const struct hte_chip *chip = gdev->chip;
> +	const char *name = chip->name ? chip->name : dev_name(chip->dev);
> +
> +	gdev->dbg_root = debugfs_create_dir(name, hte_root);
> +
> +	debugfs_create_atomic_t("ts_requested", 0444, gdev->dbg_root,
> +				&gdev->ts_req);
> +	debugfs_create_u32("total_ts", 0444, gdev->dbg_root,
> +			   &gdev->nlines);
> +}
> +
> +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
> +{
> +	if (!ei->gdev->dbg_root || !name)
> +		return;
> +
> +	ei->ts_dbg_root = debugfs_create_dir(name, ei->gdev->dbg_root);
> +
> +	debugfs_create_atomic_t("dropped_timestamps", 0444, ei->ts_dbg_root,
> +				&ei->dropped_ts);
> +}
> +
> +#else
> +
> +static void hte_chip_dbgfs_init(struct hte_device *gdev)
> +{
> +}
> +
> +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
> +{
> +}
> +
> +#endif
> +
> +/**
> + * hte_release_ts() - Consumer calls this API to release the entity, where
> + * entity could be anything providers support, like lines, signals, buses,
> + * etc...
> + *
> + * @desc: timestamp descriptor, this is the same as returned by the request API.
> + *
> + * Context: debugfs_remove_recursive() function call may use sleeping locks,
> + *	    not suitable from atomic context.
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int hte_release_ts(struct hte_ts_desc *desc)
> +{
> +	u32 id;
> +	int ret = 0;
> +	unsigned long flag;
> +	struct hte_device *gdev;
> +	struct hte_ts_info *ei;
> +
> +	if (!desc)
> +		return -EINVAL;
> +
> +	ei = desc->hte_data;
> +
> +	if (!ei || !ei->gdev)
> +		return -EINVAL;
> +
> +	gdev = ei->gdev;
> +	id = desc->con_id;
> +
> +	mutex_lock(&ei->req_mlock);
> +
> +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> +		dev_info(gdev->sdev, "id:%d is not registered", id);
> +		ret = -EUSERS;
> +		goto unlock;
> +	}
> +
> +	ret = gdev->chip->ops->release(gdev->chip, ei->xlated_id);
> +	if (ret) {
> +		dev_err(gdev->sdev, "id: %d free failed\n", id);
> +		goto unlock;
> +	}
> +
> +	if (ei->hte_name)
> +		kfree(desc->name);
> +
> +	debugfs_remove_recursive(ei->ts_dbg_root);
> +
> +	spin_lock_irqsave(&ei->slock, flag);
> +
> +	atomic_dec(&gdev->ts_req);
> +	atomic_set(&ei->dropped_ts, 0);
> +
> +	ei->seq = 0;
> +	desc->hte_data = NULL;
> +
> +	clear_bit(HTE_TS_REGISTERED, &ei->flags);
> +
> +	spin_unlock_irqrestore(&ei->slock, flag);
> +
> +	if (ei->tcb) {
> +		kthread_stop(ei->thread);
> +		put_task_struct(ei->thread);
> +	}
> +
> +	ei->cb = NULL;
> +	ei->tcb = NULL;
> +	ei->thread = NULL;
> +	ei->cl_data = NULL;
> +
> +	module_put(gdev->owner);
> +unlock:
> +	mutex_unlock(&ei->req_mlock);
> +	dev_dbg(gdev->sdev, "release id: %d\n", id);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hte_release_ts);
> +
> +static int hte_ts_dis_en_common(struct hte_ts_desc *desc, bool en)
> +{
> +	u32 ts_id;
> +	struct hte_device *gdev;
> +	struct hte_ts_info *ei;
> +	int ret;
> +	unsigned long flag;
> +
> +	if (!desc)
> +		return -EINVAL;
> +
> +	ei = desc->hte_data;
> +
> +	if (!ei || !ei->gdev)
> +		return -EINVAL;
> +
> +	gdev = ei->gdev;
> +	ts_id = desc->con_id;
> +
> +	mutex_lock(&ei->req_mlock);
> +
> +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> +		dev_dbg(gdev->sdev, "id:%d is not registered", ts_id);
> +		ret = -EUSERS;
> +		goto out;
> +	}
> +
> +	spin_lock_irqsave(&ei->slock, flag);
> +
> +	if (en) {
> +		if (!test_bit(HTE_TS_DISABLE, &ei->flags)) {
> +			ret = 0;
> +			goto out_unlock;
> +		}
> +
> +		spin_unlock_irqrestore(&ei->slock, flag);
> +		ret = gdev->chip->ops->enable(gdev->chip, ei->xlated_id);
> +		if (ret) {
> +			dev_warn(gdev->sdev, "id: %d enable failed\n",
> +				 ts_id);
> +			goto out;
> +		}
> +
> +		spin_lock_irqsave(&ei->slock, flag);
> +		clear_bit(HTE_TS_DISABLE, &ei->flags);
> +	} else {
> +		if (test_bit(HTE_TS_DISABLE, &ei->flags)) {
> +			ret = 0;
> +			goto out_unlock;
> +		}
> +
> +		spin_unlock_irqrestore(&ei->slock, flag);
> +		ret = gdev->chip->ops->disable(gdev->chip, ei->xlated_id);
> +		if (ret) {
> +			dev_warn(gdev->sdev, "id: %d disable failed\n",
> +				 ts_id);
> +			goto out;
> +		}
> +
> +		spin_lock_irqsave(&ei->slock, flag);
> +		set_bit(HTE_TS_DISABLE, &ei->flags);
> +	}
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&ei->slock, flag);
> +out:
> +	mutex_unlock(&ei->req_mlock);
> +	return ret;
> +}
> +
> +/**
> + * hte_disable_ts() - Disable timestamp on given descriptor.
> + *
> + * The API does not release any resources associated with desc.
> + *
> + * @desc: ts descriptor, this is the same as returned by the request API.
> + *
> + * Context: Holds mutex lock, not suitable from atomic context.
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int hte_disable_ts(struct hte_ts_desc *desc)
> +{
> +	return hte_ts_dis_en_common(desc, false);
> +}
> +EXPORT_SYMBOL_GPL(hte_disable_ts);
> +
> +/**
> + * hte_enable_ts() - Enable timestamp on given descriptor.
> + *
> + * @desc: ts descriptor, this is the same as returned by the request API.
> + *
> + * Context: Holds mutex lock, not suitable from atomic context.
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int hte_enable_ts(struct hte_ts_desc *desc)
> +{
> +	return hte_ts_dis_en_common(desc, true);
> +}
> +EXPORT_SYMBOL_GPL(hte_enable_ts);
> +
> +static int hte_simple_xlate(struct hte_chip *gc,
> +			    const struct of_phandle_args *args,
> +			    struct hte_ts_desc *desc,
> +			    u32 *id)
> +{
> +	if (!id || !desc || !gc)
> +		return -EINVAL;
> +
> +	/*
> +	 * For the providers which do not have any internal mappings between
> +	 * logically exposed ids and actual ids, will set both
> +	 * the same.
> +	 *
> +	 * In case there is a internal mapping needed, providers will need to
> +	 * provide its own xlate function where con_id will be sent as
> +	 * args[0] and it will return xlated id. Later xlated id will be
> +	 * used for any future exchanges between provider and subsystems.
> +	 */
> +
> +	if (args) {
> +		if (gc->of_hte_n_cells < 1)
> +			return -EINVAL;
> +
> +		if (args->args_count != gc->of_hte_n_cells)
> +			return -EINVAL;
> +
> +		*id = args->args[0];
> +		desc->con_id = *id;
> +	} else {
> +		*id = desc->con_id;
> +	}
> +
> +	if (desc->con_id > gc->nlines)
> +		return -EINVAL;
> +
> +	desc->hte_data = NULL;
> +
> +	return 0;
> +}
> +
> +static int _hte_wait_for_ts_data(struct hte_ts_info *ei)
> +{
> +	for (;;) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +
> +		if (kthread_should_stop()) {
> +			if (test_and_clear_bit(HTE_CB_RUN_THREAD,
> +			    &ei->hte_cb_flags)) {
> +				__set_current_state(TASK_RUNNING);
> +				return 0;
> +			}
> +			__set_current_state(TASK_RUNNING);
> +			return -1;
> +		}
> +
> +		if (test_and_clear_bit(HTE_CB_RUN_THREAD,
> +				       &ei->hte_cb_flags)) {
> +			__set_current_state(TASK_RUNNING);
> +			return 0;
> +		}
> +		schedule();
> +	}
> +}
> +
> +static int _hte_threadfn(void *data)
> +{
> +	struct hte_ts_info *ei = data;
> +
> +	while (!_hte_wait_for_ts_data(ei))
> +		ei->tcb(ei->cl_data);
> +
> +	return 0;
> +}
> +
> +static int _hte_setup_thread(struct hte_ts_info *ei, u32 id)
> +{
> +	struct task_struct *t;
> +
> +	t = kthread_create(_hte_threadfn, ei, "hte-%u", id);
> +	if (IS_ERR(t))
> +		return PTR_ERR(t);
> +
> +	ei->thread = get_task_struct(t);
> +
> +	return 0;
> +}
> +
> +static int ___hte_req_ts(struct hte_device *gdev, struct hte_ts_desc *desc,
> +			 u32 xlated_id, hte_ts_cb_t cb,
> +			 hte_ts_threaded_cb_t tcb, void *data)
> +{
> +	struct hte_ts_info *ei;
> +	int ret;
> +	u32 con_id = desc->con_id;
> +
> +	if (!try_module_get(gdev->owner))
> +		return -ENODEV;
> +
> +	ei = &gdev->ei[xlated_id];
> +	ei->xlated_id = xlated_id;
> +
> +	/*
> +	 * There is a chance that multiple consumers requesting same entity,
> +	 * lock here.
> +	 */
> +	mutex_lock(&ei->req_mlock);
> +
> +	if (test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> +		dev_dbg(gdev->chip->dev, "id:%u is already registered",
> +			xlated_id);
> +		ret = -EUSERS;
> +		goto unlock;
> +	}
> +
> +	ei->cb = cb;
> +	ei->tcb = tcb;
> +	if (tcb) {
> +		ret = _hte_setup_thread(ei, xlated_id);
> +		if (ret < 0) {
> +			dev_err(gdev->chip->dev, "setting thread failed\n");
> +			goto unlock;
> +		}
> +	}
> +
> +	ret = gdev->chip->ops->request(gdev->chip, xlated_id);
> +	if (ret < 0) {
> +		dev_err(gdev->chip->dev, "ts request failed\n");
> +		goto unlock;
> +	}
> +
> +	desc->hte_data = ei;
> +	ei->cl_data = data;
> +
> +	atomic_inc(&gdev->ts_req);
> +
> +	ei->hte_name = false;
> +	if (!desc->name) {
> +		desc->name = kzalloc(HTE_TS_NAME_LEN, GFP_KERNEL);
> +		if (desc->name) {
> +			scnprintf(desc->name, HTE_TS_NAME_LEN, "ts_%u",
> +				  con_id);
> +			ei->hte_name = true;
> +		}
> +	}
> +
> +	hte_ts_dbgfs_init(desc->name, ei);
> +	set_bit(HTE_TS_REGISTERED, &ei->flags);
> +
> +	mutex_unlock(&ei->req_mlock);
> +
> +	dev_dbg(gdev->chip->dev, "id: %u, xlated id:%u", con_id, xlated_id);
> +
> +	return 0;
> +
> +unlock:
> +	module_put(gdev->owner);
> +	mutex_unlock(&ei->req_mlock);
> +
> +	return ret;
> +}
> +
> +static struct hte_device *of_node_to_htedevice(struct device_node *np)
> +{
> +	struct hte_device *gdev;
> +
> +	spin_lock(&hte_lock);
> +
> +	list_for_each_entry(gdev, &hte_devices, list)
> +		if (gdev->chip && gdev->chip->dev &&
> +		    gdev->chip->dev->of_node == np) {
> +			spin_unlock(&hte_lock);
> +			return gdev;
> +		}
> +
> +	spin_unlock(&hte_lock);
> +
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static struct hte_device *of_hte_dev_get(struct device *dev,
> +					 struct device_node *np,
> +					 const char *label,
> +					 struct of_phandle_args *args)
> +{
> +	struct hte_device *gdev = NULL;
> +	int index = 0;
> +	int err;
> +
> +	if (label) {
> +		index = of_property_match_string(np,
> +						 "hardware-timestamp-names",
> +						 label);
> +		if (index < 0)
> +			return ERR_PTR(index);
> +	}
> +
> +	err = of_parse_phandle_with_args(np, "hardware-timestamps",
> +					 "#hardware-timestamp-cells", index,
> +					 args);
> +	if (err) {
> +		pr_err("%s(): can't parse \"hardware-timestamps\" property\n",
> +		       __func__);
> +		return ERR_PTR(err);
> +	}
> +
> +	gdev = of_node_to_htedevice(args->np);
> +	if (IS_ERR(gdev)) {
> +		pr_err("%s(): HTE chip not found\n", __func__);
> +		of_node_put(args->np);
> +		return gdev;
> +	}
> +
> +	return gdev;
> +}
> +
> +static int __hte_req_ts(struct device *dev, struct hte_ts_desc *desc,
> +			hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb, void *data)
> +{
> +	struct hte_device *gdev = NULL;
> +	struct of_phandle_args args;
> +	int ret;
> +	u32 xlated_id;
> +
> +	gdev = of_hte_dev_get(dev, dev->of_node, desc->name, &args);
> +	if (IS_ERR(gdev))
> +		return PTR_ERR(gdev);
> +
> +	if (!gdev->chip) {
> +		pr_debug("requested id does not have provider\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = gdev->chip->xlate(gdev->chip, &args, desc, &xlated_id);
> +	if (ret < 0)
> +		goto put;
> +
> +	ret = ___hte_req_ts(gdev, desc, xlated_id, cb, tcb, data);
> +	if (ret < 0)
> +		goto put;
> +
> +	return 0;
> +
> +put:
> +	of_node_put(args.np);
> +
> +	return ret;
> +}
> +
> +static void __devm_hte_release_ts(void *res)
> +{
> +	hte_release_ts(res);
> +}
> +
> +/**
> + * devm_of_hte_request_ts() - Resource managed API to request the HTE facility
> + * on the specified entity, where entity is provider specific for example,
> + * GPIO lines, signals, buses etc...
> + *
> + * The API allocates necessary resources and enables the timestamp. So calling
> + * hte_enable_ts is not needed. The consumer does not need to call
> + * hte_release_ts since it will be called upon consumer exit.
> + *
> + * @dev: HTE consumer/client device.
> + * @desc: Pre-allocated timestamp descriptor. HTE core will fill out necessary
> + * details. Optionally the consumer can set name field of desc, if not
> + * specified HTE core will set it as ts_con_id. It will be the consumer's
> + * job to free any allocation related to this structure as well name field
> + * in case it has set that field.
> + * @cb: Callback to push the timestamp data to consumer.
> + * @tcb: Optional callback. If its provided, subsystem will create
> + * thread. This will be called when cb returns HTE_RUN_THREADED_CB.
> + * @data: Client data, will be sent back during cb and tcb callbacks.
> + *
> + * Context: Holds mutex lock.
> + * Returns: Returns 0 on success or negative error code on failure.
> + */
> +int devm_of_hte_request_ts(struct device *dev, struct hte_ts_desc *desc,
> +			   hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
> +			   void *data)
> +{
> +	int err;
> +
> +	if (!dev || !dev->of_node || !desc || !cb)
> +		return -EINVAL;
> +
> +	err = __hte_req_ts(dev, desc, cb, tcb, data);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, __devm_hte_release_ts, desc);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_hte_request_ts);
> +
> +/**
> + * hte_req_ts_by_hte_name() - Request entity to timestamp realtime by passing
> + * property name that contains HTE provider phandle, meaning of the entity
> + * is HTE provider specific, for example lines, signals, GPIOs, buses etc...
> + *
> + * This API is designed to address below uses cases:
> + *
> + * 1) For the consumer device which acts as a central device for secondary
> + * consumers. For example, GPIO controller driver acts as a primary consumer
> + * on behalf of in kernel and userspace GPIO HTE consumers. The GPIO controller
> + * driver specifies HTE provider that it supports/wants and it becomes opaque
> + * for the secondary consumers requesting GPIO and hardware timestamp through
> + * that GPIO controller.
> + *
> + * 2) For the providers which are dependent on other hardware modules. In that
> + * case it forces consumers to go through other subsystem or driver making them
> + * secondary consumers. Same example as above applies here as well.
> + *
> + * The API allocates necessary resources and enables the timestamp. So calling
> + * hte_enable_ts is not needed.
> + *
> + * @dev: HTE consumer/client device.
> + * @propname: Name of property holding a HTE provider phandle value
> + * @desc: Pre-allocated timestamp descriptor with con_id set by the consumer.
> + * HTE core will fill out the rest. Optionally the consumer can set name
> + * field of desc, if not specified HTE core will set it as ts_con_id. It will
> + * be the consumer's job to free any allocation related to this structure as
> + * well name field in case it has set that field.
> + * @cb: Callback to push the timestamp data to consumer.
> + * @tcb: Optional callback. If its provided, subsystem will create
> + * thread. This will be called when cb returns HTE_RUN_THREADED_CB.
> + * @data: Client data, will be sent back during cb and tcb callbacks.
> + *
> + * Context: Holds mutex lock, can not be called from atomic context. The mutex
> + * lock is used to serialize multiple consumers.
> + * Returns: returns 0 on success or negative error code on failure.
> + */
> +int hte_req_ts_by_hte_name(struct device *dev, const char *propname,
> +			   struct hte_ts_desc *desc, hte_ts_cb_t cb,
> +			   hte_ts_threaded_cb_t tcb, void *data)
> +{
> +	struct hte_device *gdev;
> +	struct device_node *np = NULL;
> +	int ret;
> +	u32 xlated_id;
> +
> +	if (!dev->of_node || !propname || !desc)
> +		return -EINVAL;
> +
> +	np = of_parse_phandle(dev->of_node, propname, 0);
> +	if (!np)
> +		return -ENODEV;
> +
> +	of_node_put(np);
> +
> +	gdev = of_node_to_htedevice(np);
> +	if (IS_ERR(gdev))
> +		return -ENOTSUPP;
> +
> +	if (!gdev->chip || !gdev->chip->ops)
> +		return -ENOTSUPP;
> +
> +	ret = gdev->chip->xlate(gdev->chip, NULL, desc, &xlated_id);
> +	if (ret < 0) {
> +		dev_err(gdev->chip->dev,
> +			"failed to xlate id: %d\n", desc->con_id);
> +		return ret;
> +	}
> +
> +	ret = ___hte_req_ts(gdev, desc, xlated_id, cb, tcb, data);
> +	if (ret < 0) {
> +		dev_err(gdev->chip->dev,
> +			"failed to request id: %d\n", desc->con_id);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(hte_req_ts_by_hte_name);
> +
> +/**
> + * hte_get_clk_src_info() - Consumer calls this API to query clock source
> + * information of the desc.
> + *

                               ^^^^^^^^^^
Get the clock source information for a ts descriptor.

> + * @desc: ts descriptor, same as returned from request API.
> + * @ci: The API fills this structure with the clock information data.
> + *
> + * Context: Any context.
> + * Returns: 0 on success else negative error code on failure.
> + */
> +int hte_get_clk_src_info(const struct hte_ts_desc *desc,
> +			 struct hte_clk_info *ci)
> +{
> +	struct hte_chip *chip;
> +	struct hte_ts_info *ei;
> +
> +	if (!desc || !desc->hte_data || !ci) {
> +		pr_debug("%s:%d\n", __func__, __LINE__);
> +		return -EINVAL;
> +	}
> +
> +	ei = desc->hte_data;
> +	if (!ei || !ei->gdev || !ei->gdev->chip)
> +		return -EINVAL;
> +
> +	chip = ei->gdev->chip;
> +	if (!chip->ops->get_clk_src_info)
> +		return -ENOTSUPP;
> +
> +	return chip->ops->get_clk_src_info(chip, ci);
> +}
> +EXPORT_SYMBOL_GPL(hte_get_clk_src_info);
> +
> +/**
> + * hte_push_ts_ns() - Used by the provider to push timestamp in nano
> + * seconds i.e data->tsc will be in ns.
> + *
                         ^^^^^^^^
Push timestamp in nanoseconds.

> + * @chip: The HTE chip, used during the registration.
> + * @xlated_id: entity id understood by both subsystem and provider, usually this
> + * is obtained from xlate callback during request API.
> + * @data: timestamp data.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
> +		   struct hte_ts_data *data)
> +{
> +	hte_return_t ret;
> +	int st = 0;
> +	struct hte_ts_info *ei;
> +	unsigned long flag;
> +
> +	if (!chip || !data || !chip->gdev)
> +		return -EINVAL;
> +
> +	if (xlated_id > chip->nlines)
> +		return -EINVAL;
> +
> +	ei = &chip->gdev->ei[xlated_id];
> +
> +	spin_lock_irqsave(&ei->slock, flag);
> +
> +	/* timestamp sequence counter */
> +	data->seq = ei->seq++;
> +
> +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags) ||
> +	    test_bit(HTE_TS_DISABLE, &ei->flags)) {
> +		dev_dbg(chip->dev, "Unknown timestamp push\n");
> +		st = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = ei->cb(data, ei->cl_data);
> +	if (ret == HTE_RUN_THREADED_CB && ei->thread) {
> +		if (test_and_set_bit(HTE_CB_RUN_THREAD, &ei->hte_cb_flags))
> +			goto unlock;
> +		else
> +			wake_up_process(ei->thread);
> +	} else if (ret == HTE_CB_TS_DROPPED) {
> +		atomic_inc(&ei->dropped_ts);
> +	} else if (ret == HTE_CB_ERROR) {
> +		dev_dbg(chip->dev, "cb error\n");
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&ei->slock, flag);
> +
> +	return st;
> +}
> +EXPORT_SYMBOL_GPL(hte_push_ts_ns);
> +
> +static int hte_register_chip(struct hte_chip *chip)
> +{
> +	struct hte_device *gdev;
> +	u32 i;
> +
> +	if (!chip || !chip->dev || !chip->dev->of_node)
> +		return -EINVAL;
> +
> +	if (!chip->ops || !chip->ops->request || !chip->ops->release) {
> +		dev_err(chip->dev, "Driver needs to provide ops\n");
> +		return -EINVAL;
> +	}
> +
> +	gdev = kzalloc(struct_size(gdev, ei, chip->nlines), GFP_KERNEL);
> +	if (!gdev)
> +		return -ENOMEM;
> +
> +	gdev->chip = chip;
> +	chip->gdev = gdev;
> +	gdev->nlines = chip->nlines;
> +	gdev->sdev = chip->dev;
> +
> +	for (i = 0; i < chip->nlines; i++) {
> +		gdev->ei[i].gdev = gdev;
> +		mutex_init(&gdev->ei[i].req_mlock);
> +		spin_lock_init(&gdev->ei[i].slock);
> +	}
> +
> +	if (chip->dev->driver)
> +		gdev->owner = chip->dev->driver->owner;
> +	else
> +		gdev->owner = THIS_MODULE;
> +
> +	if (!chip->xlate) {
> +		chip->xlate = hte_simple_xlate;
> +		/* Just a id number to monitor */
> +		chip->of_hte_n_cells = 1;
> +	}
> +
> +	of_node_get(chip->dev->of_node);
> +
> +	INIT_LIST_HEAD(&gdev->list);
> +
> +	spin_lock(&hte_lock);
> +	list_add_tail(&gdev->list, &hte_devices);
> +	spin_unlock(&hte_lock);
> +
> +	hte_chip_dbgfs_init(gdev);
> +
> +	dev_dbg(chip->dev, "Added hte chip\n");
> +
> +	return 0;
> +}
> +
> +/**
> + * hte_unregister_chip() - Used by the provider to remove a HTE chip.
> + * @chip: the HTE chip to remove.
> + *
> + * Context: Can not be called from atomic context.
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static int hte_unregister_chip(struct hte_chip *chip)
> +{
> +	struct hte_device *gdev;
> +
> +	if (!chip)
> +		return -EINVAL;
> +
> +	gdev = chip->gdev;
> +
> +	spin_lock(&hte_lock);
> +	list_del(&gdev->list);
> +	spin_unlock(&hte_lock);
> +
> +	gdev->chip = NULL;
> +
> +	of_node_put(chip->dev->of_node);
> +	debugfs_remove_recursive(gdev->dbg_root);
> +	kfree(gdev);
> +
> +	dev_dbg(chip->dev, "Removed hte chip\n");
> +
> +	return 0;
> +}
> +
> +static void _hte_devm_unregister_chip(void *chip)
> +{
> +	hte_unregister_chip(chip);
> +}
> +
> +/**
> + * devm_hte_register_chip() - Used by provider to register a HTE chip.
> + * @chip: the HTE chip to add to subsystem.
> + *
> + * The API is resource managed and  _hte_devm_unregister_chip will be called
> + * automatically when the provider exits.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int devm_hte_register_chip(struct hte_chip *chip)
> +{
> +	int err;
> +
> +	err = hte_register_chip(chip);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(chip->dev, _hte_devm_unregister_chip,
> +				       chip);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_hte_register_chip);
> diff --git a/include/linux/hte.h b/include/linux/hte.h
> new file mode 100644
> index 000000000000..f4dd5415a493
> --- /dev/null
> +++ b/include/linux/hte.h
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 NVIDIA Corporation
> + *
> + * Author: Dipen Patel <dipenp@nvidia.com>
> + */
> +
> +#ifndef __LINUX_HTE_H
> +#define __LINUX_HTE_H
> +
> +#include <linux/errno.h>
> +
> +struct hte_chip;
> +struct hte_device;
> +struct of_phandle_args;
> +struct device_node;
> +
> +/**
> + * enum hte_dir - HTE edge timestamp direction.
> + *
> + * @HTE_RISING_EDGE_TS: Timestamps is for rising edge.
> + * @HTE_FALLING_EDGE_TS: Timestamps is for falling edge.
> + * @HTE_DIR_NOSUPP: Direction is not supported.
> + */
> +enum hte_dir {
> +	HTE_RISING_EDGE_TS,
> +	HTE_FALLING_EDGE_TS,
> +	HTE_DIR_NOSUPP,
> +};
> +

Your tegra194 driver doesn't support direction - it always reports
HTE_DIR_NOSUPP.  Do you have an example of hardware that does support
direction?

This might be better as a raw line level rather than an edge direction.
See my related comments on patch 09.

And the third option should be "unknown", rather than "not supported" as
this is a reading being returned, not a feature being requested.
It may be unknown because the feature is not supported, but that is a
separate issue.

> +/**
> + * struct hte_ts_data - HTE timestamp data.
> + * The provider uses and fills timestamp related details during push_timestamp
> + * API call. The consumer uses during retrieve_timestamp API call.
> + *

What push_timestamp() and retrieve_timestamp() calls?

General comment:
Documenting how a struct is used in an API, rather than what it is for or
what it represents, is a maintenance nightmare.  If it is subsequently
used elsewhere or names are changed then the user is now obliged to update
your documentation.
And they will forget to, or overlook it, as you yourself have done here.

Descriptions of what the API calls do should be in the documentation of
the API calls themselves, not the structs they use.

> + * @tsc: Timestamp value.
> + * @seq: Sequence counter of the timestamps.
> + * @dir: Direction of the event at the time of timestamp.
> + */
> +struct hte_ts_data {
> +	u64 tsc;
> +	u64 seq;
> +	enum hte_dir dir;
> +};
> +
> +/**
> + * struct hte_clk_info - Clock source info that HTE provider uses to timestamp
> + * The provider uses hardware clock as a source to timestamp real time. This
> + * structure presents the clock information to consumers during
> + * hte_get_clk_src_info call.
> + *
> + * @hz: Supported clock rate in HZ, for example 1KHz clock = 1000.
> + * @type: Supported clock type. CLOCK_* types.
> + */
> +struct hte_clk_info {
> +	u64 hz;
> +	clockid_t type;
> +};
> +
> +/**
> + * enum hte_return- HTE subsystem return values used during callback.
> + *
> + * @HTE_CB_HANDLED: The consumer handled the data successfully.
> + * @HTE_RUN_THREADED_CB: The consumer needs further processing, in that case HTE
> + * subsystem will invoke kernel thread and call secondary callback provided by
> + * the consumer during devm_of_hte_request_ts and hte_req_ts_by_dt_node call.
> + * @HTE_CB_TS_DROPPED: The client returns when it can not store ts data.
> + * @HTE_CB_ERROR: The client returns error if anything goes wrong.
> + */
> +enum hte_return {
> +	HTE_CB_HANDLED,
> +	HTE_RUN_THREADED_CB,
> +	HTE_CB_TS_DROPPED,
> +	HTE_CB_ERROR,
> +};
> +typedef enum hte_return hte_return_t;
> +

Wrt HTE_CB_TS_DROPPED, why is the client dropping data any of hte's
business?  It is also confusing in that I would expect the dropped_ts
gauge, that you increment when this code is returned, to indicate the
events dropped by the hardware, not the client.  But then you have no
indication of events dropped by hardware at all, though you could
determine that from gaps in the sequence numbers.
Anyway, the client can do the math in both cases if they care to, so not
sure what its purpose is here.

Similarly HTE_CB_ERROR, what can hte do here other than log it - and the
client can do that themselves if they have the need.

> +/**
> + * typedef hte_ts_cb_t - Callback provided during devm_of_hte_request_ts and
> + * hte_req_ts_by_dt_node APIs call.
> + *
> + * The callback is used to push timestamp data to client.
> + * @ts: HW timestamp data.
> + * @data: Client supplied data.
> + */
> +typedef hte_return_t (*hte_ts_cb_t)(struct hte_ts_data *ts, void *data);
> +
> +/**
> + * typedef hte_ts_threaded_cb_t - Threaded callback provided during
> + * devm_of_hte_request_ts and hte_req_ts_by_dt_node APIs call.
> + *
> + * @data: Client supplied data.
> + *
> + * It will be called when client return HTE_RUN_THREADED_CB from hte_ts_cb_t.
> + * The callback will be called from thread context.
> + *
> + */
> +typedef hte_return_t (*hte_ts_threaded_cb_t)(void *data);
> +
> +/**
> + * struct hte_ts_desc - HTE timestamp descriptor, this structure will be
> + * communication token between consumers to subsystem and subsystem to
> + * providers.
> + *
> + * @con_id: This is the same id sent in request APIs.
> + * @name: Descriptive name of the entity that is being monitored for the
> + * realtime timestamping. The consumer can set any name it likes. If null
> + * HTE core will construct name as ts_con_id. It will be the consumer's
> + * job to free any allocation if name is set by the consumer.
> + * @hte_data: Subsystem's private data relate to requested con_id.
> + */
> +struct hte_ts_desc {
> +	u32 con_id;
> +	char *name;
> +	void *hte_data;
> +};
> +
> +/**
> + * struct hte_ops - HTE operations set by providers.
> + *
> + * @request: Hook for requesting a HTE timestamp. Returns 0 on success,
> + * non-zero for failures.
> + * @release: Hook for releasing a HTE timestamp. Returns 0 on success,
> + * non-zero for failures.
> + * @enable: Hook to enable the specified timestamp. Returns 0 on success,
> + * non-zero for failures.
> + * @disable: Hook to disable specified timestamp. Returns 0 on success,
> + * non-zero for failures.
> + * @get_clk_src_info: Hook to get the clock information the provider uses
> + * to timestamp. Returns 0 for success and negative error code for failure. On
> + * success HTE subsystem fills up provided struct hte_clk_info.
> + *
> + * xlated_id parameter is used to communicate between HTE subsystem and the
> + * providers. It is the same id returned during xlate API call and translated
> + * by the provider. This may be helpful as both subsystem and provider locate
> + * the requested entity in constant time, where entity could be anything from
> + * lines, signals, events, buses etc.. that providers support.
> + */
> +struct hte_ops {
> +	int (*request)(struct hte_chip *chip, u32 xlated_id);
> +	int (*release)(struct hte_chip *chip, u32 xlated_id);
> +	int (*enable)(struct hte_chip *chip, u32 xlated_id);
> +	int (*disable)(struct hte_chip *chip, u32 xlated_id);
> +	int (*get_clk_src_info)(struct hte_chip *chip,
> +				struct hte_clk_info *ci);
> +};
> +
> +/**
> + * struct hte_chip - Abstract HTE chip structure.
> + * @name: functional name of the HTE IP block.
> + * @dev: device providing the HTE.
> + * @ops: callbacks for this HTE.
> + * @nlines: number of lines/signals supported by this chip.
> + * @xlate: Callback which translates consumer supplied logical ids to
> + * physical ids, return from 0 for the success and negative for the
> + * failures. It stores (0 to @nlines) in xlated_id parameter for the success.
> + * @of_hte_n_cells: Number of cells used to form the HTE specifier.
> + * @gdev: HTE subsystem abstract device, internal to the HTE subsystem.
> + * @data: chip specific private data.
> + */
> +struct hte_chip {
> +	const char *name;
> +	struct device *dev;
> +	const struct hte_ops *ops;
> +	u32 nlines;
> +	int (*xlate)(struct hte_chip *gc,
> +		     const struct of_phandle_args *args,
> +		     struct hte_ts_desc *desc, u32 *xlated_id);
> +	u8 of_hte_n_cells;
> +
> +	struct hte_device *gdev;
> +	void *data;
> +};
> +
> +#if IS_ENABLED(CONFIG_HTE)
> +/* HTE APIs for the providers */
> +int devm_hte_register_chip(struct hte_chip *chip);
> +int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
> +		   struct hte_ts_data *data);
> +
> +/* HTE APIs for the consumers */
> +
> +int hte_release_ts(struct hte_ts_desc *desc);
> +int devm_of_hte_request_ts(struct device *dev, struct hte_ts_desc *desc,
> +			   hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
> +			   void *data);
> +int hte_req_ts_by_hte_name(struct device *dev, const char *propname,
> +			   struct hte_ts_desc *desc, hte_ts_cb_t cb,
> +			   hte_ts_threaded_cb_t tcb, void *data);
> +int hte_enable_ts(struct hte_ts_desc *desc);
> +int hte_disable_ts(struct hte_ts_desc *desc);
> +int hte_get_clk_src_info(const struct hte_ts_desc *desc,
> +			 struct hte_clk_info *ci);
> +
> +#else /* !CONFIG_HTE */
> +static inline int devm_hte_register_chip(struct hte_chip *chip)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int hte_push_ts_ns(const struct hte_chip *chip,
> +				 u32 xlated_id,
> +				 const struct hte_ts_data *data)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int hte_release_ts(struct hte_ts_desc *desc)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int devm_of_hte_request_ts(struct device *dev,
> +					 struct hte_ts_desc *desc,
> +					 hte_ts_cb_t cb,
> +					 hte_ts_threaded_cb_t threaded_cb,
> +					 void *data)
> +{
> +	return -ENOTSUPP;
> +}
> +

Rename threaded_cb to tcb to be consistent with other functions.

> +static inline int hte_req_ts_by_hte_name(struct device *dev,
> +					 const char *propname,
> +					 struct hte_ts_desc *desc,
> +					 hte_ts_cb_t cb,
> +					 hte_ts_threaded_cb_t tcb, void *data)
> +{
> +	return -ENOTSUPP;
> +}
> +

Make line wrapping of hte_req_ts_by_hte_name() consistent with
devm_of_hte_request_ts().

Cheers,
Kent.

