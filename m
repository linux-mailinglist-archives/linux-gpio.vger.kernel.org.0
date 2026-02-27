Return-Path: <linux-gpio+bounces-32332-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPgwEZEQomleywQAu9opvQ
	(envelope-from <linux-gpio+bounces-32332-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:45:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF61BE41F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A845E3033E2E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BED2364942;
	Fri, 27 Feb 2026 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GJ80BY1f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A5229B38
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772228741; cv=none; b=JQM8/No7hQaBajvPtjvRJUKPIqwglMITDB2TbcBAvP+PzouIoJAx0YAtOAIidBPUMK1wOvJ5Vc5P9t1UwwS1QxgO5/T63tx1d4Y2oprLmB1FbAMPh2jnE/wfnLwB5vUr3GG5jzpeDqVqvx7kPr0/GtinDRFIhQhlL+yB/TBWSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772228741; c=relaxed/simple;
	bh=RXgP/ncAvAC7k2NR3kkGrAmjYvV2xBk9dSU+rl3d3H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=OVRVtInQGufy4wq6wUQJd7znM6w7jDwzzpihLiPxpvV6b1QFxvuXrpfdhFK/2KifPVHWS0CASI/IwJn35raL7ZvSyvJkPSEwkU4J13d0BNbpfVlOmcuWp75pgs4F1jIpfCc2A+rDf8edwYD8mjCfItq35RB8hW7J3tYxa7kGZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GJ80BY1f; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260227213613euoutp016aab4fda53a949760838d654451fc496~YOCJu2t_C1262512625euoutp01g
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260227213613euoutp016aab4fda53a949760838d654451fc496~YOCJu2t_C1262512625euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772228173;
	bh=jVdqOeAEV9uDfzyBfjcP3V/lNnLCEvJfQZbUitPnLig=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GJ80BY1fkMs4W8eY5HEBn2EYk5uDwyZTO+IDLRwiPlbuWo6GK3I3HL4DYdKMW1EMq
	 s7SpEcE/D+f1QFSFjHVjm8zHSHLQDAyUlvTKW0AnoPDdCjh46vzZhx176bEWeRMjGw
	 nWu/2UZlHFoqnUklkUxqukOSkt/qRYBUHc9ZL9nc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182~YOCJfJHAh2037320373eucas1p2O;
	Fri, 27 Feb 2026 21:36:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260227213613eusmtip1f96bbd47033b2e21b1b63ed0e34fbd63~YOCJIx-BM3100631006eusmtip1X;
	Fri, 27 Feb 2026 21:36:13 +0000 (GMT)
Message-ID: <506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com>
Date: Fri, 27 Feb 2026 22:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 4/6] gpio: Ensure struct gpio_chip for
 gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260223061726.82161-5-tzungbi@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182
X-EPHeader: CA
X-CMS-RootMailID: 20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182
References: <20260223061726.82161-1-tzungbi@kernel.org>
	<20260223061726.82161-5-tzungbi@kernel.org>
	<CGME20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182@eucas1p2.samsung.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	TAGGED_FROM(0.00)[bounces-32332-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72AF61BE41F
X-Rspamd-Action: no action

On 23.02.2026 07:17, Tzung-Bi Shih wrote:
> Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> checks for struct gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

This patch landed in today's linux-next as commit cf674f1a0c98 ("gpio: 
Ensure struct gpio_chip for gpiochip_setup_dev()"). In my tests I found 
that it triggers a warning on every test board I have, so I suspect that 
something is missing in the code. Here is an example of such warning:

------------[ cut here ]------------
WARNING: drivers/gpio/gpiolib-cdev.c:2735 at 
gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
Modules linked in:
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
Call trace:
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x68/0x88
  dump_stack_lvl from __warn+0x94/0x210
  __warn from warn_slowpath_fmt+0x1b0/0x1bc
  warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
  gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
  gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
  gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x5c
  devm_gpiochip_add_data_with_key from samsung_pinctrl_probe+0x8fc/0xbe8
  samsung_pinctrl_probe from platform_probe+0x5c/0x98
  platform_probe from really_probe+0xe0/0x424
  really_probe from __driver_probe_device+0x9c/0x1f4
  __driver_probe_device from driver_probe_device+0x30/0xc0
  driver_probe_device from __device_attach_driver+0xbc/0x180
  __device_attach_driver from bus_for_each_drv+0x84/0xdc
  bus_for_each_drv from __device_attach+0xb0/0x214
  __device_attach from device_initial_probe+0x3c/0x48
  device_initial_probe from bus_probe_device+0x24/0x80
  bus_probe_device from device_add+0x5c0/0x810
  device_add from of_platform_device_create_pdata+0xac/0x104
  of_platform_device_create_pdata from of_platform_bus_create+0x210/0x534
  of_platform_bus_create from of_platform_bus_create+0x27c/0x534
  of_platform_bus_create from of_platform_populate+0x90/0x150
  of_platform_populate from of_platform_default_populate_init+0xd0/0xe0
  of_platform_default_populate_init from do_one_initcall+0x70/0x3bc
  do_one_initcall from kernel_init_freeable+0x1c0/0x248
  kernel_init_freeable from kernel_init+0x18/0x12c
  kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xf082dfb0 to 0xf082dff8)
dfa0:                                     00000000 00000000 00000000 
00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 55167
hardirqs last  enabled at (55387): [<c01c3578>] __up_console_sem+0x50/0x60
hardirqs last disabled at (55398): [<c01c3564>] __up_console_sem+0x3c/0x60
softirqs last  enabled at (55352): [<c013c8fc>] handle_softirqs+0x32c/0x5c0
softirqs last disabled at (55419): [<c013cd3c>] __irq_exit_rcu+0x144/0x1f0
---[ end trace 0000000000000000 ]---


> ---
> v4:
> - To be consistent, rename `chip` -> `gc`.
> - Add lockdep checks.
>
> v3: https://lore.kernel.org/all/20260213092958.864411-5-tzungbi@kernel.org
> - Pass struct gpio_chip * only.
>
> v2: https://lore.kernel.org/all/20260203061059.975605-5-tzungbi@kernel.org
> - No changes.
>
> v1: https://lore.kernel.org/all/20260116081036.352286-10-tzungbi@kernel.org
>
>   drivers/gpio/gpiolib-cdev.c  | 14 ++++----------
>   drivers/gpio/gpiolib-cdev.h  |  2 +-
>   drivers/gpio/gpiolib-sysfs.c | 21 ++++++++-------------
>   drivers/gpio/gpiolib-sysfs.h |  4 ++--
>   drivers/gpio/gpiolib.c       | 24 +++++++++++++++++-------
>   5 files changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 73ae77f0f213..a154b04e9316 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2782,11 +2782,13 @@ static const struct file_operations gpio_fileops = {
>   #endif
>   };
>   
> -int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> +int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
>   {
> -	struct gpio_chip *gc;
> +	struct gpio_device *gdev = gc->gpiodev;
>   	int ret;
>   
> +	lockdep_assert_held(&gdev->srcu);
> +
>   	cdev_init(&gdev->chrdev, &gpio_fileops);
>   	gdev->chrdev.owner = THIS_MODULE;
>   	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
> @@ -2802,14 +2804,6 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
>   		return ret;
>   	}
>   
> -	guard(srcu)(&gdev->srcu);
> -	gc = srcu_dereference(gdev->chip, &gdev->srcu);
> -	if (!gc) {
> -		cdev_device_del(&gdev->chrdev, &gdev->dev);
> -		destroy_workqueue(gdev->line_state_wq);
> -		return -ENODEV;
> -	}
> -
>   	gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
>   
>   	return 0;
> diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
> index b42644cbffb8..4a9cb3335d99 100644
> --- a/drivers/gpio/gpiolib-cdev.h
> +++ b/drivers/gpio/gpiolib-cdev.h
> @@ -7,7 +7,7 @@
>   
>   struct gpio_device;
>   
> -int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
> +int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt);
>   void gpiolib_cdev_unregister(struct gpio_device *gdev);
>   
>   #endif /* GPIOLIB_CDEV_H */
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 1c25a7dd3db4..748a3eb1bf35 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -983,13 +983,15 @@ void gpiod_unexport(struct gpio_desc *desc)
>   }
>   EXPORT_SYMBOL_GPL(gpiod_unexport);
>   
> -int gpiochip_sysfs_register(struct gpio_device *gdev)
> +int gpiochip_sysfs_register(struct gpio_chip *gc)
>   {
> +	struct gpio_device *gdev = gc->gpiodev;
>   	struct gpiodev_data *data;
> -	struct gpio_chip *chip;
>   	struct device *parent;
>   	int err;
>   
> +	lockdep_assert_held(&gdev->srcu);
> +
>   	/*
>   	 * Many systems add gpio chips for SOC support very early,
>   	 * before driver model support is available.  In those cases we
> @@ -999,18 +1001,12 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
>   	if (!class_is_registered(&gpio_class))
>   		return 0;
>   
> -	guard(srcu)(&gdev->srcu);
> -
> -	chip = srcu_dereference(gdev->chip, &gdev->srcu);
> -	if (!chip)
> -		return -ENODEV;
> -
>   	/*
>   	 * For sysfs backward compatibility we need to preserve this
>   	 * preferred parenting to the gpio_chip parent field, if set.
>   	 */
> -	if (chip->parent)
> -		parent = chip->parent;
> +	if (gc->parent)
> +		parent = gc->parent;
>   	else
>   		parent = &gdev->dev;
>   
> @@ -1029,7 +1025,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
>   						    MKDEV(0, 0), data,
>   						    gpiochip_groups,
>   						    GPIOCHIP_NAME "%d",
> -						    chip->base);
> +						    gc->base);
>   	if (IS_ERR(data->cdev_base)) {
>   		err = PTR_ERR(data->cdev_base);
>   		kfree(data);
> @@ -1085,10 +1081,9 @@ void gpiochip_sysfs_unregister(struct gpio_chip *gc)
>    */
>   static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *data)
>   {
> -	struct gpio_device *gdev = gc->gpiodev;
>   	int ret;
>   
> -	ret = gpiochip_sysfs_register(gdev);
> +	ret = gpiochip_sysfs_register(gc);
>   	if (ret)
>   		gpiochip_err(gc, "failed to register the sysfs entry: %d\n", ret);
>   
> diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
> index fd5db5384681..d0998de043a2 100644
> --- a/drivers/gpio/gpiolib-sysfs.h
> +++ b/drivers/gpio/gpiolib-sysfs.h
> @@ -7,12 +7,12 @@ struct gpio_device;
>   
>   #ifdef CONFIG_GPIO_SYSFS
>   
> -int gpiochip_sysfs_register(struct gpio_device *gdev);
> +int gpiochip_sysfs_register(struct gpio_chip *gc);
>   void gpiochip_sysfs_unregister(struct gpio_chip *gc);
>   
>   #else
>   
> -static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
> +static inline int gpiochip_sysfs_register(struct gpio_chip *gc)
>   {
>   	return 0;
>   }
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d5070c538ba5..44635e9a29c3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -881,14 +881,14 @@ static const struct device_type gpio_dev_type = {
>   };
>   
>   #ifdef CONFIG_GPIO_CDEV
> -#define gcdev_register(gdev, devt)	gpiolib_cdev_register((gdev), (devt))
> +#define gcdev_register(gc, devt)	gpiolib_cdev_register((gc), (devt))
>   #define gcdev_unregister(gdev)		gpiolib_cdev_unregister((gdev))
>   #else
>   /*
>    * gpiolib_cdev_register() indirectly calls device_add(), which is still
>    * required even when cdev is not selected.
>    */
> -#define gcdev_register(gdev, devt)	device_add(&(gdev)->dev)
> +#define gcdev_register(gc, devt)	device_add(&(gc)->gpiodev->dev)
>   #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
>   #endif
>   
> @@ -896,8 +896,9 @@ static const struct device_type gpio_dev_type = {
>    * An initial reference count has been held in gpiochip_add_data_with_key().
>    * The caller should drop the reference via gpio_device_put() on errors.
>    */
> -static int gpiochip_setup_dev(struct gpio_device *gdev)
> +static int gpiochip_setup_dev(struct gpio_chip *gc)
>   {
> +	struct gpio_device *gdev = gc->gpiodev;
>   	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>   	int ret;
>   
> @@ -910,11 +911,11 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>   	if (fwnode && !fwnode->dev)
>   		fwnode_dev_initialized(fwnode, false);
>   
> -	ret = gcdev_register(gdev, gpio_devt);
> +	ret = gcdev_register(gc, gpio_devt);
>   	if (ret)
>   		return ret;
>   
> -	ret = gpiochip_sysfs_register(gdev);
> +	ret = gpiochip_sysfs_register(gc);
>   	if (ret)
>   		goto err_remove_device;
>   
> @@ -961,13 +962,22 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
>   static void gpiochip_setup_devs(void)
>   {
>   	struct gpio_device *gdev;
> +	struct gpio_chip *gc;
>   	int ret;
>   
>   	guard(srcu)(&gpio_devices_srcu);
>   
>   	list_for_each_entry_srcu(gdev, &gpio_devices, list,
>   				 srcu_read_lock_held(&gpio_devices_srcu)) {
> -		ret = gpiochip_setup_dev(gdev);
> +		guard(srcu)(&gdev->srcu);
> +
> +		gc = srcu_dereference(gdev->chip, &gdev->srcu);
> +		if (!gc) {
> +			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
> +			continue;
> +		}
> +
> +		ret = gpiochip_setup_dev(gc);
>   		if (ret) {
>   			gpio_device_put(gdev);
>   			dev_err(&gdev->dev,
> @@ -1225,7 +1235,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
>   	 */
>   	if (gpiolib_initialized) {
> -		ret = gpiochip_setup_dev(gdev);
> +		ret = gpiochip_setup_dev(gc);
>   		if (ret)
>   			goto err_teardown_shared;
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


