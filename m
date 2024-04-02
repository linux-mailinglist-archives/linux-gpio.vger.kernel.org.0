Return-Path: <linux-gpio+bounces-5000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE418955B6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 15:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33B7CB2FF11
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 13:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EE685651;
	Tue,  2 Apr 2024 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKWkY6KC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1583CD5
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065434; cv=none; b=Q/AA8YwBCBiqm/mH40QRWokI6hF7xKRlmtZPwfuHVdwN9ERZR8S+E88JJJjv7QELi7+qoN7JV4wTEi3T0uf3hzAjoZCruMx7TsxR3ZguTmfTMyLVWgN1HhmB/y+ErB7w55is5m+vgObWD3KJ7ezKtnz4wRzkhTATSPmJmOko5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065434; c=relaxed/simple;
	bh=cWoMejZ3xWbtN+ESfCYF9Jt6aHq7P1nAhmPsZ7w3t1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mr3lnsA5WD0xrXphyjCRrbOoqD3JwcE3lWZvOIaoNLfIGuL8t1csyRSb6BqgHJzuQakfsZFx8wT8MebHrMAcmFAicC8nZDqvqpDxPu3wlWQMyv1wfmjWtBgaoc1LoLW+z2r3gQlu8P5XtHfAUOTB5w5DgwjFa8R41FnetZalJp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKWkY6KC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WMZ+q7dMlDkrsWIq5OgmwNKO76w3HBe7Du83IAJfask=;
	b=UKWkY6KC7oTHw7sYK4bhdVuVYe20BiRuADoU1+fyq1ooNh4xfe2G3YeQfu6nMpYnA+7veS
	eXAGZG+IdthaMrqtcHAeSArBuW+oae9BRKbZTq8BIfiLyd/+bJ0B25zvVXNT+76fGbiMwb
	dkZrKIUSnicj03mWu4A5bXzk2pFcGck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-qnXScMDFNcGUwdOX42D3Lw-1; Tue, 02 Apr 2024 09:43:48 -0400
X-MC-Unique: qnXScMDFNcGUwdOX42D3Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D02A803C84;
	Tue,  2 Apr 2024 13:43:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E34AFC017A0;
	Tue,  2 Apr 2024 13:43:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] gpiolib: Fix triggering "kobject: 'gpiochipX' is not initialized, yet" kobject_get() errors
Date: Tue,  2 Apr 2024 15:43:34 +0200
Message-ID: <20240402134334.173409-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

When a gpiochip gets added by loading a module, then another driver may
be waiting for that gpiochip to load on the deferred-probe list.

If the deferred-probe for the consumer of gpiochip then triggers between
the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
see the chip and the gpiochip_setup_dev() later then gpio_device_find()
does a kobject_get() on an uninitialzed kobject since the kobject is
initialized by gpiochip_setup_dev() calling device_initialize():

[   30.408904] arizona spi-10WM5102:00: cannot find GPIO chip arizona, defe=
rring
[   30.422987] arizona spi-10WM5102:00: cannot find GPIO chip arizona, defe=
rring
[   30.456477] arizona spi-10WM5102:00: cannot find GPIO chip arizona, defe=
rring
[   30.619517] ------------[ cut here ]------------
[   30.619580] kobject: 'gpiochip5' (00000000241466f2): is not initialized,=
 yet kobject_get() is being called.
[   30.619664] WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x4=
3/0x70
[   30.619685] Modules linked in: rmi_core(+) lenovo_yoga_tab2_pro_1380_fas=
tcharger(E) cs_dsp industrialio gpio_arizona(+) extcon_lc824206xa(+) arizon=
a_micsupp(+) lp855x_bl bq27xxx_battery_i2c pn544_mei bq27xxx_battery phy_tu=
sb1210 mei_phy dwc3 pn544 hci nfc snd_soc_sst_bytcr_wm5102 udc_core mei_hdc=
p ulpi mei_pxp gpio_keys intel_rapl_msr intel_soc_dts_thermal intel_soc_dts=
_iosf brcmfmac_wcc intel_powerclamp coretemp kvm_intel bq24190_charger x86_=
android_tablets(E) brcmfmac kvm snd_sof_acpi_intel_byt snd_sof_acpi snd_sof=
_intel_atom brcmutil punit_atom_debug snd_sof_xtensa_dsp cfg80211 intel_cst=
ate snd_sof atomisp(C) snd_sof_utils atomisp_gmin_platform(C) ipu_bridge pc=
spkr v4l2_fwnode v4l2_async snd_intel_sst_acpi videobuf2_vmalloc snd_intel_=
sst_core videobuf2_memops snd_soc_sst_atom_hifi2_platform videobuf2_v4l2 in=
tel_bytcrc_pwrsrc(E) videodev snd_soc_acpi_intel_match videobuf2_common snd=
_soc_acpi snd_intel_dspcfg mei_txe snd_intel_sdw_acpi snd_hdmi_lpe_audio me=
i mc snd_soc_core lpc_ich dwc3_pci hci_uart btqca btrtl
[   30.620209]  btintel snd_compress ac97_bus btbcm snd_pcm_dmaengine int34=
01_thermal processor_thermal_device processor_thermal_wt_hint bluetooth pro=
cessor_thermal_rfim snd_seq processor_thermal_rapl binfmt_misc intel_rapl_c=
ommon soc_button_array snd_seq_device int3406_thermal snd_pcm processor_the=
rmal_wt_req processor_thermal_power_floor int3403_thermal processor_thermal=
_mbox dptf_power int340x_thermal_zone int3400_thermal acpi_thermal_rel ecdh=
_generic rfkill_gpio intel_int0002_vgpio(E) snd_timer rfkill arizona_spi ar=
izona_ldo1 snd arizona acpi_pad regmap_spi soundcore vfat fat loop nfnetlin=
k zram i915 crct10dif_pclmul crc32_pclmul mmc_block crc32c_intel ghash_clmu=
lni_intel sha512_ssse3 sha256_ssse3 wdat_wdt sha1_ssse3 i2c_algo_bit drm_bu=
ddy ttm drm_display_helper cec video sdhci_acpi wmi sdhci spi_pxa2xx_platfo=
rm mmc_core i2c_hid_acpi i2c_hid dw_dmac pwm_lpss_platform pwm_lpss ip6_tab=
les ip_tables i2c_dev fuse
[   30.620662] CPU: 3 PID: 42 Comm: kworker/u18:0 Tainted: G         C  E  =
    6.9.0-rc1+ #9
[   30.620675] Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FFD8=
, BIOS BLADE_21.X64.0005.R00.1504101516 FFD8_X64_R_2015_04_10_1516 04/10/20=
15
[   30.620685] Workqueue: events_unbound deferred_probe_work_func
[   30.620708] RIP: 0010:kobject_get+0x43/0x70
[   30.620722] Code: 0f c1 43 38 85 c0 74 39 8d 50 01 09 c2 78 1f 48 89 d8 =
5b c3 cc cc cc cc 48 8b 37 48 89 fa 48 c7 c7 00 b5 b1 a9 e8 ed 1a 0b ff <0f=
> 0b eb c8 be 01 00 00 00 e8 ef 47 82 ff 48 89 d8 5b c3 cc cc cc
[   30.620733] RSP: 0000:ffffb743401b7b88 EFLAGS: 00010296
[   30.620749] RAX: 000000000000005f RBX: ffff9ea156b13800 RCX: 00000000000=
00000
[   30.620758] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000fff=
fffff
[   30.620767] RBP: ffff9ea156b13800 R08: 0000000000000000 R09: ffffb743401=
b7a30
[   30.620776] R10: ffff9ea1adbe2fa8 R11: 0000000000000003 R12: 00000000000=
00000
[   30.620785] R13: ffff9ea148d8f830 R14: ffff9ea156b13e80 R15: ffffffffa89=
47926
[   30.620794] FS:  0000000000000000(0000) GS:ffff9ea1b9580000(0000) knlGS:=
0000000000000000
[   30.620805] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.620814] CR2: 00007f67ea538478 CR3: 0000000004850000 CR4: 00000000001=
006f0
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
[   30.621191]  snd_byt_wm5102_mc_probe+0xfd/0x500 [snd_soc_sst_bytcr_wm510=
2]
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
[   30.621669] hardirqs last  enabled at (11487): [<ffffffffa81b9ccd>] cons=
ole_unlock+0x10d/0x140
[   30.621683] hardirqs last disabled at (11492): [<ffffffffa81b9cb2>] cons=
ole_unlock+0xf2/0x140
[   30.621695] softirqs last  enabled at (11330): [<ffffffffa81143eb>] __ir=
q_exit_rcu+0x9b/0x100
[   30.621708] softirqs last disabled at (11325): [<ffffffffa81143eb>] __ir=
q_exit_rcu+0x9b/0x100
[   30.621720] ---[ end trace 0000000000000000 ]---

Not only is the device not initialized yet, but when the gpio-device is
added to the list things like the irqchip also have not been initialized
yet.

So gpio_device_find() should really ignore the gpio-device until
gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
check to gpio_device_find() to ignore gpio-devices on the list which are
not yet fully initialized.

Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59ccf9a3e153..4c674a37bcfc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
=20
 		gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
=20
-		if (gc && match(gc, data))
+		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
 			return gpio_device_get(gdev);
 	}
=20
--=20
2.44.0


