Return-Path: <linux-gpio+bounces-4874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408B891FD0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 16:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 886041C25292
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621B613AA5D;
	Fri, 29 Mar 2024 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="6M0J4Hqj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4912F398
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.103.80.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711721902; cv=none; b=InlAeM85SCkCUgVwEl1cTPN3BbfYEOF3wzuCTbDZyjru/GUB3WNDMcyNibLtmJs6sKqEniv0UACTA7KaXHs7/hVPeFawb24tXiQhSLl/UZ3WgxoqTUuRBGEX660J873U+1tN8VttSjm0dnQoWH3GF5JXQ+R4O9S8NjzCT+hMuQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711721902; c=relaxed/simple;
	bh=3NlsxYtosk0WPuUBqcwIZ7OHIZbN2Dhs7T4wfMl/XkM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=i2n9k2DXBrJSxuR/fHj8sDA1ZFfl8d/wgciArlSDE5yx/wt85hpOBfYI6dPOyWdBTQYaFf4d911lhQsoUBGQbIplVzk0A0xCmAHCIk211JiTJyQBaC//XnvSw5QaBkiJZNPEGEueLRg/FkiQh6Eqy/3GXO858pLJb1YBZsJR7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hansg.org; spf=pass smtp.mailfrom=hansg.org; dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b=6M0J4Hqj; arc=none smtp.client-ip=212.103.80.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hansg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hansg.org
Received: from localhost (unknown [127.0.0.1])
	by mx.kolabnow.com (Postfix) with ESMTP id EA6C920827A9;
	Fri, 29 Mar 2024 15:11:24 +0100 (CET)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	content-transfer-encoding:content-type:content-type:subject
	:subject:from:from:content-language:mime-version:date:date
	:message-id:received:received:received; s=dkim20160331; t=
	1711721483; x=1713535884; bh=z1rRyXy6eyjP9uDEkSq62UvgYlMmwdDHwut
	HLKmbRQQ=; b=6M0J4HqjRROo/LbV+U4kKN+I1+/kQMv7zIAFvmSgJFMlSJI4TGl
	cfM72uKgh0CWtZ/QLna6yGg/B81WxpGCIWb1Pgp9wIU3J4r5/CWrmx8+bLiWVUwz
	X+Vy1d86BZMR6CcXSQdEg5MasWf5dnhRO4MdIbdvOyruMbcmxCHsu5qEuP6c4nwO
	rU5cdxKKQXe6wN5tqlj/XvoMTXjbVir+qJ8jmjZVV3fjS76I4BraIti2PYxVYiVq
	YmaAhspOI3FNtit67865v21ZG9PMTrcDkExH3pxWDLM1Kw6ccoK7KxN2WLCB4fKC
	FAbwDY2V6va9D4bqcW/Q6SkCn3vRMlF9s2ALCd5khojsw4ksdq8duA0TyZ2EdLID
	dZ8QDUalSGSwvjxQtT3fBGc5XPp8vvE829k0I5NlSHg/DCwsoGPzEkjK1LFKL2++
	oX86IcSIFVaw7xPkiuGXkQ8L2MJdZ6L+x9kKqqFWMTHuYz4oiODm20VMRYDc6PTN
	BkVZX56uCSBq82OCOmsAZkhtIFfxynD5C0EZnASoITtccAA+9hw+aTEzl0ldKGrm
	9vK6TDzro+6DoMJpw1FfrD5Lll9LEwbHO7gQqGi4YrgASLzqlRBV4gkKUTfPcJTP
	PZoiPoRJzi6dzEXUcElrMTDUP9CtVVfCTQHQWp185GYOpCx6HCsdystQ=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level:
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id J_KfW7A_RblQ; Fri, 29 Mar 2024 15:11:23 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
	by mx.kolabnow.com (Postfix) with ESMTPS id 7F2892095C0F;
	Fri, 29 Mar 2024 15:11:21 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
	by int-mx011.mykolab.com (Postfix) with ESMTPS id CD76930ED5C9;
	Fri, 29 Mar 2024 15:11:21 +0100 (CET)
Message-ID: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
Date: Fri, 29 Mar 2024 15:11:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, nl
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From: Hans de Goede <hans@hansg.org>
Subject: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX' is
 not, initialized, yet kobject_get() errors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,

I've already tried to fix this, so let me just copy and paste my half fin=
ished patch
to explain the problem.

I was planning on submitting this as a RFC patch at least, but there are =
also some
other new issues with 6.9 on this tablet and I'm not sure how this intera=
cts
with those issues and I don't have time to work on this any further this =
weekend.

Anyways below is the patch / bug report.

I'm wondering if a better fix would be to add a "ready" flag to gdev
and may gpiochip_find ignore not yet ready chips (we need them on
the list before they are ready to reserve the GPIO numbers) ?

Regards,

Hans



=46rom 78e1bdf439e42a7346c01e0817b05b854ac8e16f Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 29 Mar 2024 14:44:27 +0100
Subject: [PATCH] gpiolib: Fix triggering kobject: 'gpiochipX' is not
 initialized, yet kobject_get() errors

When a gpiochip gets added by loading a module, then another driver may
be waiting for that gpiochip to load on the deferred-probe list.

If the deferred-probe for the consumer of gpiochip then triggers between
the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
see the chip and the gpiochip_setup_dev() later then gpio_device_find()
does a kobject_get() on an uninitialzed kobject since the kobject is
initialized by gpiochip_setup_dev() calling device_initialize().

To fix this move the device_initialize() from gpiochip_setup_dev()
to gpiochip_add_data_with_key(). This also allows removing the weird
if (gdev->dev.release) in the error-exit cleanup handling.

As noted in the added "HACK" comment this patch is not complete
yet, the scru_init needs to be moved to before the device_initialize()
to avoid the need for the cleanup_scru_on_release bool flag hack.

This is why I've marked this as a RFC for now, I don't have time
to finish this atm but I wanted to get this out there to let others
know about the issue and think about the proposed fix.

Here is the backtrace of the problem triggering:

[   30.408904] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
[   30.422987] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
[   30.456477] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
[   30.619517] ------------[ cut here ]------------
[   30.619580] kobject: 'gpiochip5' (00000000241466f2): is not initialize=
d, yet kobject_get() is being called.
[   30.619664] WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0=
x43/0x70
[   30.619685] Modules linked in: rmi_core(+) lenovo_yoga_tab2_pro_1380_f=
astcharger(E) cs_dsp industrialio gpio_arizona(+) extcon_lc824206xa(+) ar=
izona_micsupp(+) lp855x_bl bq27xxx_battery_i2c pn544_mei bq27xxx_battery =
phy_tusb1210 mei_phy dwc3 pn544 hci nfc snd_soc_sst_bytcr_wm5102 udc_core=
 mei_hdcp ulpi mei_pxp gpio_keys intel_rapl_msr intel_soc_dts_thermal int=
el_soc_dts_iosf brcmfmac_wcc intel_powerclamp coretemp kvm_intel bq24190_=
charger x86_android_tablets(E) brcmfmac kvm snd_sof_acpi_intel_byt snd_so=
f_acpi snd_sof_intel_atom brcmutil punit_atom_debug snd_sof_xtensa_dsp cf=
g80211 intel_cstate snd_sof atomisp(C) snd_sof_utils atomisp_gmin_platfor=
m(C) ipu_bridge pcspkr v4l2_fwnode v4l2_async snd_intel_sst_acpi videobuf=
2_vmalloc snd_intel_sst_core videobuf2_memops snd_soc_sst_atom_hifi2_plat=
form videobuf2_v4l2 intel_bytcrc_pwrsrc(E) videodev snd_soc_acpi_intel_ma=
tch videobuf2_common snd_soc_acpi snd_intel_dspcfg mei_txe snd_intel_sdw_=
acpi snd_hdmi_lpe_audio mei mc snd_soc_core lpc_ich dwc3_pci hci_uart btq=
ca btrtl
[   30.620209]  btintel snd_compress ac97_bus btbcm snd_pcm_dmaengine int=
3401_thermal processor_thermal_device processor_thermal_wt_hint bluetooth=
 processor_thermal_rfim snd_seq processor_thermal_rapl binfmt_misc intel_=
rapl_common soc_button_array snd_seq_device int3406_thermal snd_pcm proce=
ssor_thermal_wt_req processor_thermal_power_floor int3403_thermal process=
or_thermal_mbox dptf_power int340x_thermal_zone int3400_thermal acpi_ther=
mal_rel ecdh_generic rfkill_gpio intel_int0002_vgpio(E) snd_timer rfkill =
arizona_spi arizona_ldo1 snd arizona acpi_pad regmap_spi soundcore vfat f=
at loop nfnetlink zram i915 crct10dif_pclmul crc32_pclmul mmc_block crc32=
c_intel ghash_clmulni_intel sha512_ssse3 sha256_ssse3 wdat_wdt sha1_ssse3=
 i2c_algo_bit drm_buddy ttm drm_display_helper cec video sdhci_acpi wmi s=
dhci spi_pxa2xx_platform mmc_core i2c_hid_acpi i2c_hid dw_dmac pwm_lpss_p=
latform pwm_lpss ip6_tables ip_tables i2c_dev fuse
[   30.620662] CPU: 3 PID: 42 Comm: kworker/u18:0 Tainted: G         C  E=
      6.9.0-rc1+ #9
[   30.620675] Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FF=
D8, BIOS BLADE_21.X64.0005.R00.1504101516 FFD8_X64_R_2015_04_10_1516 04/1=
0/2015
[   30.620685] Workqueue: events_unbound deferred_probe_work_func
[   30.620708] RIP: 0010:kobject_get+0x43/0x70
[   30.620722] Code: 0f c1 43 38 85 c0 74 39 8d 50 01 09 c2 78 1f 48 89 d=
8 5b c3 cc cc cc cc 48 8b 37 48 89 fa 48 c7 c7 00 b5 b1 a9 e8 ed 1a 0b ff=
 <0f> 0b eb c8 be 01 00 00 00 e8 ef 47 82 ff 48 89 d8 5b c3 cc cc cc
[   30.620733] RSP: 0000:ffffb743401b7b88 EFLAGS: 00010296
[   30.620749] RAX: 000000000000005f RBX: ffff9ea156b13800 RCX: 000000000=
0000000
[   30.620758] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000f=
fffffff
[   30.620767] RBP: ffff9ea156b13800 R08: 0000000000000000 R09: ffffb7434=
01b7a30
[   30.620776] R10: ffff9ea1adbe2fa8 R11: 0000000000000003 R12: 000000000=
0000000
[   30.620785] R13: ffff9ea148d8f830 R14: ffff9ea156b13e80 R15: ffffffffa=
8947926
[   30.620794] FS:  0000000000000000(0000) GS:ffff9ea1b9580000(0000) knlG=
S:0000000000000000
[   30.620805] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.620814] CR2: 00007f67ea538478 CR3: 0000000004850000 CR4: 000000000=
01006f0
[   30.620824] Call Trace:
[   30.620834]  <TASK>
[   30.620849]  ? __warn.cold+0xb1/0x13e
[   30.620867]  ? kobject_get+0x43/0x70
[   30.620885]  ? report_bug+0xe6/0x170
[   30.620910]  ? handle_bug+0x3c/0x80
[   30.620927]  ? exc_invalid_op+0x13/0x60
[   30.620943]  ? asm_exc_invalid_op+0x16/0x20
[   30.620957]  ? gpio_device_find+0x16/0x260
[   30.620997]  ? kobject_get+0x43/0x70
[   30.621016]  ? kobject_get+0x43/0x70
[   30.621029]  gpio_device_find+0x216/0x260
[   30.621047]  ? __pfx_gpio_chip_match_by_label+0x10/0x10
[   30.621120]  gpiod_find_and_request+0x33a/0x480
[   30.621140]  ? __pfx_device_match_name+0x10/0x10
[   30.621170]  gpiod_get+0x41/0x60
[   30.621191]  snd_byt_wm5102_mc_probe+0xfd/0x500 [snd_soc_sst_bytcr_wm5=
102]
[   30.621231]  ? __pfx___device_attach_driver+0x10/0x10
[   30.621247]  platform_probe+0x40/0xa0
[   30.621269]  really_probe+0xde/0x340
[   30.621282]  ? pm_runtime_barrier+0x50/0x90
[   30.621304]  __driver_probe_device+0x78/0x110
[   30.621324]  driver_probe_device+0x1f/0xa0
[   30.621343]  __device_attach_driver+0x85/0x110
[   30.621364]  bus_for_each_drv+0x78/0xc0
[   30.621389]  __device_attach+0xb0/0x1b0
[   30.621413]  bus_probe_device+0x94/0xb0
[   30.621435]  deferred_probe_work_func+0x99/0xf0
[   30.621452]  process_one_work+0x222/0x5a0
[   30.621470]  ? move_linked_works+0x70/0xa0
[   30.621502]  worker_thread+0x1d1/0x3e0
[   30.621526]  ? __pfx_worker_thread+0x10/0x10
[   30.621539]  kthread+0xee/0x120
[   30.621554]  ? __pfx_kthread+0x10/0x10
[   30.621572]  ret_from_fork+0x30/0x50
[   30.621587]  ? __pfx_kthread+0x10/0x10
[   30.621602]  ret_from_fork_asm+0x1a/0x30
[   30.621652]  </TASK>
[   30.621661] irq event stamp: 11481
[   30.621669] hardirqs last  enabled at (11487): [<ffffffffa81b9ccd>] co=
nsole_unlock+0x10d/0x140
[   30.621683] hardirqs last disabled at (11492): [<ffffffffa81b9cb2>] co=
nsole_unlock+0xf2/0x140
[   30.621695] softirqs last  enabled at (11330): [<ffffffffa81143eb>] __=
irq_exit_rcu+0x9b/0x100
[   30.621708] softirqs last disabled at (11325): [<ffffffffa81143eb>] __=
irq_exit_rcu+0x9b/0x100
[   30.621720] ---[ end trace 0000000000000000 ]---

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib.c | 34 ++++++++++++++++++++--------------
 drivers/gpio/gpiolib.h |  1 +
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ce94e37bcbee..2dbd1183d35c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -697,13 +697,15 @@ static void gpiodev_release(struct device *dev)
 	struct gpio_device *gdev =3D to_gpio_device(dev);
 	unsigned int i;
=20
-	for (i =3D 0; i < gdev->ngpio; i++)
-		cleanup_srcu_struct(&gdev->descs[i].srcu);
+	if (gdev->cleanup_scru_on_release) {
+		cleanup_srcu_struct(&gdev->srcu);
+		for (i =3D 0; i < gdev->ngpio; i++)
+			cleanup_srcu_struct(&gdev->descs[i].srcu);
+	}
=20
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
-	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
=20
@@ -729,8 +731,6 @@ static int gpiochip_setup_dev(struct gpio_device *gde=
v)
 	struct fwnode_handle *fwnode =3D dev_fwnode(&gdev->dev);
 	int ret;
=20
-	device_initialize(&gdev->dev);
-
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -927,6 +927,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, =
void *data,
 	gdev->ngpio =3D gc->ngpio;
 	gdev->can_sleep =3D gc->can_sleep;
=20
+	device_initialize(&gdev->dev);
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -941,7 +943,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, =
void *data,
 			if (base < 0) {
 				ret =3D base;
 				base =3D 0;
-				goto err_free_label;
+				goto err_gpio_device_put;
 			}
=20
 			/*
@@ -961,7 +963,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, =
void *data,
 		ret =3D gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_free_label;
+			goto err_gpio_device_put;
 		}
 	}
=20
@@ -1045,6 +1047,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *g=
c, void *data,
 		if (ret)
 			goto err_remove_irqchip;
 	}
+
+	/*
+	 * HACK instead initializing all the scru structs should be moved
+	 * to above the device_initialize(&gdev->dev) call, and their cleanup
+	 * on error should be moved accordingly and skipped with the
+	 * goto err_print_message; when error-exiting after device_initialize()=
=2E
+	 */
+	gdev->cleanup_scru_on_release =3D true;
 	return 0;
=20
 err_remove_irqchip:
@@ -1067,13 +1077,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *g=
c, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
-	if (gdev->dev.release) {
-		/* release() has been registered by gpiochip_setup_dev() */
-		gpio_device_put(gdev);
-		goto err_print_message;
-	}
-err_free_label:
-	kfree_const(gdev->label);
+err_gpio_device_put:
+	gpio_device_put(gdev);
+	goto err_print_message;
 err_free_descs:
 	kfree(gdev->descs);
 err_free_dev_name:
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index f67d5991ab1c..199b9c49974e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -64,6 +64,7 @@ struct gpio_device {
 	int			base;
 	u16			ngpio;
 	bool			can_sleep;
+	bool			cleanup_scru_on_release;
 	const char		*label;
 	void			*data;
 	struct list_head        list;
--=20
2.44.0


