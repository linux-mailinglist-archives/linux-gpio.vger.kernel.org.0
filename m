Return-Path: <linux-gpio+bounces-30144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0036CF3637
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 12:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E9C306B6BF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 11:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC1A336ECE;
	Mon,  5 Jan 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nvPq1vb1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6A335BCD
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613828; cv=none; b=jDGRea+vvuVSU3cYlO66JtWz4OhU3wJBuU0yX+aA18oMf0h+rFKB7Z+kruz7xcqvc4J5i4XOjuIKOyGl/o9m2h7q1hfdOlfsw3fj4DRy256p92sKbGGOXI5FrqPntpt/n1z9u4Fnaf4jGSSoV8YfwHJCv4yX7tnw3OLvW3+e+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613828; c=relaxed/simple;
	bh=6ITkkQJLNdWwgpOC9lQ8ZVBnZ7+ra9EXGVC97kfhtkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=UTH239RWIToveCEsw+jrt16oKFidmIoSmHqFsBcnNy7Yyx+K8Y9LPPYqoL5MrR8UqlFffjQElQQRSJFonMZBDgRB2KcWvPvX4sGiRNLQTzDOyahxg/g5eDFF0l+GvUsGRCagHjceYCATy4gea+rwwE7GTQL8IM+hBGZGJW0y4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nvPq1vb1; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260105115023euoutp02e798bfba641048c73e6529a848ccbe1b~H02hNq9-q2630526305euoutp02C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 11:50:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260105115023euoutp02e798bfba641048c73e6529a848ccbe1b~H02hNq9-q2630526305euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767613823;
	bh=ayRRuIdvU3gDtRzcR6IADxipUxJx4ZZD8gn5L+gmOOM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nvPq1vb1ey4BHB9rHr0taPZQw2r2sC740WTt2TKaSRg5xXfTckELe8/JTBflydDEv
	 5daU3MH88EBH9eNoLRV/SbaBrKQaKXQ4i898y/Z1SwTTgGzHN7KiJBynO9icxsUMPQ
	 YpnYhUO8S8gcoT3M8p+QwgQ3TKX/2v4Y19RmJaX4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260105115023eucas1p1af1f8e80041f94843beb664966894fb9~H02g967i70384703847eucas1p1-;
	Mon,  5 Jan 2026 11:50:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260105115022eusmtip1c3c13dfe040736348faced777ff67ebb~H02gXND3Q1949419494eusmtip1O;
	Mon,  5 Jan 2026 11:50:22 +0000 (GMT)
Message-ID: <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
Date: Mon, 5 Jan 2026 12:50:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij
	<linus.walleij@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105115023eucas1p1af1f8e80041f94843beb664966894fb9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105115023eucas1p1af1f8e80041f94843beb664966894fb9
X-EPHeader: CA
X-CMS-RootMailID: 20260105115023eucas1p1af1f8e80041f94843beb664966894fb9
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
	<20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
	<CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>

On 22.12.2025 11:01, Bartosz Golaszewski wrote:
> We currently support sharing GPIOs between multiple devices whose drivers
> use either the GPIOLIB API *OR* the reset control API but not both at
> the same time.
>
> There's an unlikely corner-case where a reset-gpios pin can be shared by
> one driver using the GPIOLIB API and a second using the reset API. This
> will currently not work as the reset-gpio consumers are not described in
> firmware at the time of scanning so the shared GPIO just chooses one of
> the proxies created for the consumers when the reset-gpio driver performs
> the lookup. This can of course conflict in the case described above.
>
> In order to fix it: if we deal with the "reset-gpios" pin that's shared
> acconding to the firmware node setup, create a proxy for each described
> consumer as well as another one for the potential reset-gpio device. To
> that end: rework the matching to take this into account.
>
> Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

This patch landed in linux-next as commit 49416483a953 ("gpio: shared: 
allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my 
tests I found that it breaks booting and triggers warnings on some of my 
test boards. Reverting it on top of next-20260105 fixes those issues. 
Let me know if I can help debugging this issue.


Here are relevant logs from my 3 test systems:


1. Samsung TM2e - arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts

exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2 
device (lanes:4 bpp:24 mode-flags:0x6e0)
Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000000
Mem abort info:
...
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in: brcmfmac(+) panel_samsung_s6e3ha2(+) brcmutil 
backlight sha256 snd_soc_hdmi_codec cfg80211 phy_exynos5_usbdrd 
snd_soc_tm2_wm5110 s5p_mfc typec snd_soc_wm5110 hci_uart btqca 
s3fwrn5_i2c snd_soc_wm_adsp btbcm s3fwrn5 cs_dsp snd_soc_i2s nci 
bluetooth snd_soc_arizona arizona_micsupp s5p_jpeg exynos_gsc 
arizona_ldo1 nfc v4l2_mem2mem snd_soc_max98504 snd_soc_idma 
snd_soc_s3c_dma videobuf2_dma_contig max77693_haptic snd_soc_core 
ntc_thermistor ir_spi snd_compress videobuf2_memops ecdh_generic 
panfrost snd_pcm_dmaengine ecc videobuf2_v4l2 drm_shmem_helper videodev 
rfkill snd_pcm pwrseq_core gpu_sched gpio_shared_proxy videobuf2_common 
mc snd_timer snd soundcore ipv6 libsha1
CPU: 5 UID: 0 PID: 241 Comm: systemd-udevd Not tainted 6.19.0-rc1+ 
#16358 PREEMPT
Hardware name: Samsung TM2E board (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : gpiod_direction_input_nonotify+0x20/0x39c
lr : gpiod_configure_flags+0x23c/0x480
...
Call trace:
  gpiod_direction_input_nonotify+0x20/0x39c (P)
  gpiod_configure_flags+0x23c/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  samsung_dsim_host_attach+0x1c8/0x284
  mipi_dsi_attach+0x30/0x54
  s6e3ha2_probe+0x148/0x200 [panel_samsung_s6e3ha2]
  mipi_dsi_drv_probe+0x20/0x2c
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x60/0x128
  mipi_dsi_driver_register_full+0x5c/0x68
  s6e3ha2_driver_init+0x20/0x1000 [panel_samsung_s6e3ha2]
  do_one_initcall+0x64/0x308
  do_init_module+0x58/0x23c
  load_module+0x1b48/0x1dc4
  init_module_from_file+0xd4/0xec
  idempotent_init_module+0x188/0x280
  __arm64_sys_finit_module+0x68/0xac
  invoke_syscall+0x48/0x10c
  el0_svc_common.constprop.0+0xc8/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x50/0x2e8
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
Code: a90153f3 aa0003f3 a9025bf5 a90363f7 (f9400014)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x20c000,1061e001,00008000,0400421b
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception ]---


2. Raspberrry Pi 3B+ - arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts

reset_gpio reset.gpio.0: cannot find GPIO chip gpiolib_shared.proxy.4, 
deferring
------------[ cut here ]------------
WARNING: drivers/gpio/gpiolib-shared.c:493 at 
gpio_shared_add_proxy_lookup+0x15c/0x224, CPU#1: kworker/u16:1/40
Modules linked in: ecc reset_gpio snd gpio_shared_proxy(+) 
raspberrypi_cpufreq(+) raspberrypi_hwmon rfkill soundcore pwrseq_core 
bcm2835_thermal pwm_bcm2835 vchiq i2c_bcm2835 fuse dm_mod ipv6 libsha1
CPU: 1 UID: 0 PID: 40 Comm: kworker/u16:1 Not tainted 
6.19.0-rc4-next-20260105+ #11963 PREEMPT
Hardware name: Raspberry Pi 3 Model B (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : gpio_shared_add_proxy_lookup+0x15c/0x224
lr : gpio_shared_add_proxy_lookup+0x138/0x224
...
Call trace:
  gpio_shared_add_proxy_lookup+0x15c/0x224 (P)
  gpiod_find_and_request+0x200/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get+0x18/0x24
  reset_gpio_probe+0x4c/0x14c [reset_gpio]
  auxiliary_bus_probe+0x44/0x90
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x80/0xdc
  __device_attach+0xa8/0x1b0
  device_initial_probe+0x50/0x54
  bus_probe_device+0x38/0xa8
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x208/0x604
  worker_thread+0x244/0x388
  kthread+0x140/0x14c
  ret_from_fork+0x10/0x20
irq event stamp: 82552
hardirqs last  enabled at (82551): [<ffff8000813a1d60>] 
__schedule+0xc08/0x1204
hardirqs last disabled at (82552): [<ffff800081397194>] el1_brk64+0x20/0x60
softirqs last  enabled at (81674): [<ffff8000800c71b4>] 
handle_softirqs+0x4c4/0x4dc
softirqs last disabled at (81665): [<ffff800080010674>] 
__do_softirq+0x14/0x20
---[ end trace 0000000000000000 ]---


3. Khadas VIM3 - 
arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb

BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name: 
kworker/u25:3
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
irq event stamp: 46379
hardirqs last  enabled at (46379): [<ffff8000813acb24>] 
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (46378): [<ffff8000813abf38>] 
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (46330): [<ffff8000800c71b4>] 
handle_softirqs+0x4c4/0x4dc
softirqs last disabled at (46295): [<ffff800080010674>] 
__do_softirq+0x14/0x20
CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C          
6.19.0-rc4-next-20260105+ #11963 PREEMPT
Tainted: [C]=CRAP
Hardware name: Khadas VIM3 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_set_config+0x40/0xdc
  gpiochip_generic_config+0x28/0x3c
  gpio_do_set_config+0xa8/0x194
  gpiod_set_config+0x34/0xfc
  gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
  gpio_do_set_config+0xa8/0x194
  gpiod_set_transitory+0x4c/0xf0
  gpiod_configure_flags+0xa4/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get+0x18/0x24
  mmc_pwrseq_emmc_probe+0x40/0xb8
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x80/0xdc
  __device_attach+0xa8/0x1b0

> ---
>   drivers/gpio/gpiolib-shared.c | 182 ++++++++++++++++++++++++++++++------------
>   1 file changed, 129 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index f589109590c7c6bc9c0c1828ea15ab9003846523..baf7e07a3bb887dab8155078666a15779e304409 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -76,6 +76,56 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
>   	return NULL;
>   }
>   
> +static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode,
> +						    const char *con_id,
> +						    enum gpiod_flags flags)
> +{
> +	char *con_id_cpy __free(kfree) = NULL;
> +
> +	struct gpio_shared_ref *ref __free(kfree) = kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref)
> +		return NULL;
> +
> +	if (con_id) {
> +		con_id_cpy = kstrdup(con_id, GFP_KERNEL);
> +		if (!con_id_cpy)
> +			return NULL;
> +	}
> +
> +	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> +	if (ref->dev_id < 0)
> +		return NULL;
> +
> +	ref->flags = flags;
> +	ref->con_id = no_free_ptr(con_id_cpy);
> +	ref->fwnode = fwnode;
> +	mutex_init(&ref->lock);
> +
> +	return no_free_ptr(ref);
> +}
> +
> +static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
> +					 enum gpiod_flags flags)
> +{
> +	struct gpio_shared_ref *ref;
> +
> +	list_for_each_entry(ref, &entry->refs, list) {
> +		if (!ref->fwnode && ref->con_id && strcmp(ref->con_id, "reset") == 0)
> +			return 0;
> +	}
> +
> +	ref = gpio_shared_make_ref(NULL, "reset", flags);
> +	if (!ref)
> +		return -ENOMEM;
> +
> +	list_add_tail(&ref->list, &entry->refs);
> +
> +	pr_debug("Created a secondary shared GPIO reference for potential reset-gpio device for GPIO %u at %s\n",
> +		 entry->offset, fwnode_get_name(entry->fwnode));
> +
> +	return 0;
> +}
> +
>   /* Handle all special nodes that we should ignore. */
>   static bool gpio_shared_of_node_ignore(struct device_node *node)
>   {
> @@ -106,6 +156,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   	size_t con_id_len, suffix_len;
>   	struct fwnode_handle *fwnode;
>   	struct of_phandle_args args;
> +	struct gpio_shared_ref *ref;
>   	struct property *prop;
>   	unsigned int offset;
>   	const char *suffix;
> @@ -138,6 +189,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   
>   		for (i = 0; i < count; i++) {
>   			struct device_node *np __free(device_node) = NULL;
> +			char *con_id __free(kfree) = NULL;
>   
>   			ret = of_parse_phandle_with_args(curr, prop->name,
>   							 "#gpio-cells", i,
> @@ -182,15 +234,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   				list_add_tail(&entry->list, &gpio_shared_list);
>   			}
>   
> -			struct gpio_shared_ref *ref __free(kfree) =
> -					kzalloc(sizeof(*ref), GFP_KERNEL);
> -			if (!ref)
> -				return -ENOMEM;
> -
> -			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
> -			ref->flags = args.args[1];
> -			mutex_init(&ref->lock);
> -
>   			if (strends(prop->name, "gpios"))
>   				suffix = "-gpios";
>   			else if (strends(prop->name, "gpio"))
> @@ -202,27 +245,32 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   
>   			/* We only set con_id if there's actually one. */
>   			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
> -				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
> -				if (!ref->con_id)
> +				con_id = kstrdup(prop->name, GFP_KERNEL);
> +				if (!con_id)
>   					return -ENOMEM;
>   
> -				con_id_len = strlen(ref->con_id);
> +				con_id_len = strlen(con_id);
>   				suffix_len = strlen(suffix);
>   
> -				ref->con_id[con_id_len - suffix_len] = '\0';
> +				con_id[con_id_len - suffix_len] = '\0';
>   			}
>   
> -			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> -			if (ref->dev_id < 0) {
> -				kfree(ref->con_id);
> +			ref = gpio_shared_make_ref(fwnode_handle_get(of_fwnode_handle(curr)),
> +						   con_id, args.args[1]);
> +			if (!ref)
>   				return -ENOMEM;
> -			}
>   
>   			if (!list_empty(&entry->refs))
>   				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
>   					 entry->offset, fwnode_get_name(entry->fwnode));
>   
> -			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
> +			list_add_tail(&ref->list, &entry->refs);
> +
> +			if (strcmp(prop->name, "reset-gpios") == 0) {
> +				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
> +				if (ret)
> +					return ret;
> +			}
>   		}
>   	}
>   
> @@ -306,20 +354,16 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
>   	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
>   	struct fwnode_reference_args ref_args, aux_args;
>   	struct device *parent = consumer->parent;
> +	struct gpio_shared_ref *real_ref;
>   	bool match;
>   	int ret;
>   
> +	lockdep_assert_held(&ref->lock);
> +
>   	/* The reset-gpio device must have a parent AND a firmware node. */
>   	if (!parent || !reset_fwnode)
>   		return false;
>   
> -	/*
> -	 * FIXME: use device_is_compatible() once the reset-gpio drivers gains
> -	 * a compatible string which it currently does not have.
> -	 */
> -	if (!strstarts(dev_name(consumer), "reset.gpio."))
> -		return false;
> -
>   	/*
>   	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
>   	 * fwnode we stored in the entry structure.
> @@ -328,33 +372,56 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
>   		return false;
>   
>   	/*
> -	 * The device associated with the shared reference's firmware node is
> -	 * the consumer of the reset control exposed by the reset-gpio device.
> -	 * It must have a "reset-gpios" property that's referencing the entry's
> -	 * firmware node.
> -	 *
> -	 * The reference args must agree between the real consumer and the
> -	 * auxiliary reset-gpio device.
> +	 * Now we need to find the actual pin we want to assign to this
> +	 * reset-gpio device. To that end: iterate over the list of references
> +	 * of this entry and see if there's one, whose reset-gpios property's
> +	 * arguments match the ones from this consumer's node.
>   	 */
> -	ret = fwnode_property_get_reference_args(ref->fwnode, "reset-gpios",
> -						 NULL, 2, 0, &ref_args);
> -	if (ret)
> -		return false;
> +	list_for_each_entry(real_ref, &entry->refs, list) {
> +		if (!real_ref->fwnode)
> +			continue;
> +
> +		/*
> +		 * The device associated with the shared reference's firmware
> +		 * node is the consumer of the reset control exposed by the
> +		 * reset-gpio device. It must have a "reset-gpios" property
> +		 * that's referencing the entry's firmware node.
> +		 *
> +		 * The reference args must agree between the real consumer and
> +		 * the auxiliary reset-gpio device.
> +		 */
> +		ret = fwnode_property_get_reference_args(real_ref->fwnode,
> +							 "reset-gpios",
> +							 NULL, 2, 0, &ref_args);
> +		if (ret)
> +			continue;
> +
> +		ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
> +							 NULL, 2, 0, &aux_args);
> +		if (ret) {
> +			fwnode_handle_put(ref_args.fwnode);
> +			continue;
> +		}
> +
> +		match = ((ref_args.fwnode == entry->fwnode) &&
> +			 (aux_args.fwnode == entry->fwnode) &&
> +			 (ref_args.args[0] == aux_args.args[0]));
>   
> -	ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
> -						 NULL, 2, 0, &aux_args);
> -	if (ret) {
>   		fwnode_handle_put(ref_args.fwnode);
> -		return false;
> -	}
> +		fwnode_handle_put(aux_args.fwnode);
> +
> +		if (!match)
> +			continue;
>   
> -	match = ((ref_args.fwnode == entry->fwnode) &&
> -		 (aux_args.fwnode == entry->fwnode) &&
> -		 (ref_args.args[0] == aux_args.args[0]));
> +		/*
> +		 * Reuse the fwnode of the real device, next time we'll use it
> +		 * in the normal path.
> +		 */
> +		ref->fwnode = fwnode_handle_get(real_ref->fwnode);
> +		return true;
> +	}
>   
> -	fwnode_handle_put(ref_args.fwnode);
> -	fwnode_handle_put(aux_args.fwnode);
> -	return match;
> +	return false;
>   }
>   #else
>   static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
> @@ -379,12 +446,20 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
>   
>   	list_for_each_entry(entry, &gpio_shared_list, list) {
>   		list_for_each_entry(ref, &entry->refs, list) {
> -			if (!device_match_fwnode(consumer, ref->fwnode) &&
> -			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
> -				continue;
> -
>   			guard(mutex)(&ref->lock);
>   
> +			/*
> +			 * FIXME: use device_is_compatible() once the reset-gpio
> +			 * drivers gains a compatible string which it currently
> +			 * does not have.
> +			 */
> +			if (!ref->fwnode && strstarts(dev_name(consumer), "reset.gpio.")) {
> +				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
> +					continue;
> +			} else if (!device_match_fwnode(consumer, ref->fwnode)) {
> +				continue;
> +			}
> +
>   			if ((!con_id && ref->con_id) || (con_id && !ref->con_id) ||
>   			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
>   				continue;
> @@ -471,8 +546,9 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
>   			 entry->offset, gpio_device_get_label(gdev));
>   
>   		list_for_each_entry(ref, &entry->refs, list) {
> -			pr_debug("Setting up a shared GPIO entry for %s\n",
> -				 fwnode_get_name(ref->fwnode));
> +			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
> +				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
> +				 ref->con_id ?: "(none)");
>   
>   			ret = gpio_shared_make_adev(gdev, entry, ref);
>   			if (ret)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


