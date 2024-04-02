Return-Path: <linux-gpio+bounces-5011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCF8956A8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5F11F22C77
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0986B86ACC;
	Tue,  2 Apr 2024 14:30:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E886652
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068203; cv=none; b=kBDJZT3Rr5LP/c/wiZOza/cVL5SMRTu37Dst0ejNZlAErGQIF9QmQ0E9CzEz/b8bX1QWgfO1RAIlQiVGhEWIT7hZybyGAWIvKcImcpwNQd6KcRJIA5XNITOUwPelq8Cd/yF2/xhExUlXA5WIJU/9FaZou0S9sZtpFIrjqzbrh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068203; c=relaxed/simple;
	bh=QvzrPHZ1SrSjuYLatIYldVAuS9qqdVLXvpXnuacOUc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cvs5pPVo7dcVrzVa2e5oQtlSB0VtzyNhNRzOlk3YsZo2fm1DfDLvetj1xLRWX6ZdxYqQvGjJBYDS+KtRsSMu+Dx72voHGvZVkAfPtozGg4b+PU2BUmEYRkbZ/VfxrA3gC+r0gof1Ds3XuTGGFS/X9Zip6bYCVCnSsZLxOyOz7To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lo2gJgocSDC5nvE9g/CS0A==
X-CSE-MsgGUID: 4tSv6teBR1m6L9B0JPmI1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10205485"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="10205485"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915142916"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="915142916"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:29:59 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rrf9B-00000000pid-2tHz;
	Tue, 02 Apr 2024 17:29:57 +0300
Date: Tue, 2 Apr 2024 17:29:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
Message-ID: <ZgwWZRMnMxtS-7gr@smile.fi.intel.com>
References: <20240402134334.173409-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240402134334.173409-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 02, 2024 at 03:43:34PM +0200, Hans de Goede wrote:
> When a gpiochip gets added by loading a module, then another driver may
> be waiting for that gpiochip to load on the deferred-probe list.
>=20
> If the deferred-probe for the consumer of gpiochip then triggers between
> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
> does a kobject_get() on an uninitialzed kobject since the kobject is
> initialized by gpiochip_setup_dev() calling device_initialize():

> [   30.408904] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
> [   30.422987] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
> [   30.456477] arizona spi-10WM5102:00: cannot find GPIO chip arizona, de=
ferring
> [   30.619517] ------------[ cut here ]------------
> [   30.619580] kobject: 'gpiochip5' (00000000241466f2): is not initialize=
d, yet kobject_get() is being called.
> [   30.619664] WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0=
x43/0x70
> [   30.619685] Modules linked in: rmi_core(+) lenovo_yoga_tab2_pro_1380_f=
astcharger(E) cs_dsp industrialio gpio_arizona(+) extcon_lc824206xa(+) ariz=
ona_micsupp(+) lp855x_bl bq27xxx_battery_i2c pn544_mei bq27xxx_battery phy_=
tusb1210 mei_phy dwc3 pn544 hci nfc snd_soc_sst_bytcr_wm5102 udc_core mei_h=
dcp ulpi mei_pxp gpio_keys intel_rapl_msr intel_soc_dts_thermal intel_soc_d=
ts_iosf brcmfmac_wcc intel_powerclamp coretemp kvm_intel bq24190_charger x8=
6_android_tablets(E) brcmfmac kvm snd_sof_acpi_intel_byt snd_sof_acpi snd_s=
of_intel_atom brcmutil punit_atom_debug snd_sof_xtensa_dsp cfg80211 intel_c=
state snd_sof atomisp(C) snd_sof_utils atomisp_gmin_platform(C) ipu_bridge =
pcspkr v4l2_fwnode v4l2_async snd_intel_sst_acpi videobuf2_vmalloc snd_inte=
l_sst_core videobuf2_memops snd_soc_sst_atom_hifi2_platform videobuf2_v4l2 =
intel_bytcrc_pwrsrc(E) videodev snd_soc_acpi_intel_match videobuf2_common s=
nd_soc_acpi snd_intel_dspcfg mei_txe snd_intel_sdw_acpi snd_hdmi_lpe_audio =
mei mc snd_soc_core lpc_ich dwc3_pci hci_uart btqca btrtl
> [   30.620209]  btintel snd_compress ac97_bus btbcm snd_pcm_dmaengine int=
3401_thermal processor_thermal_device processor_thermal_wt_hint bluetooth p=
rocessor_thermal_rfim snd_seq processor_thermal_rapl binfmt_misc intel_rapl=
_common soc_button_array snd_seq_device int3406_thermal snd_pcm processor_t=
hermal_wt_req processor_thermal_power_floor int3403_thermal processor_therm=
al_mbox dptf_power int340x_thermal_zone int3400_thermal acpi_thermal_rel ec=
dh_generic rfkill_gpio intel_int0002_vgpio(E) snd_timer rfkill arizona_spi =
arizona_ldo1 snd arizona acpi_pad regmap_spi soundcore vfat fat loop nfnetl=
ink zram i915 crct10dif_pclmul crc32_pclmul mmc_block crc32c_intel ghash_cl=
mulni_intel sha512_ssse3 sha256_ssse3 wdat_wdt sha1_ssse3 i2c_algo_bit drm_=
buddy ttm drm_display_helper cec video sdhci_acpi wmi sdhci spi_pxa2xx_plat=
form mmc_core i2c_hid_acpi i2c_hid dw_dmac pwm_lpss_platform pwm_lpss ip6_t=
ables ip_tables i2c_dev fuse
> [   30.620662] CPU: 3 PID: 42 Comm: kworker/u18:0 Tainted: G         C  E=
      6.9.0-rc1+ #9
> [   30.620675] Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FF=
D8, BIOS BLADE_21.X64.0005.R00.1504101516 FFD8_X64_R_2015_04_10_1516 04/10/=
2015
> [   30.620685] Workqueue: events_unbound deferred_probe_work_func
> [   30.620708] RIP: 0010:kobject_get+0x43/0x70
> [   30.620722] Code: 0f c1 43 38 85 c0 74 39 8d 50 01 09 c2 78 1f 48 89 d=
8 5b c3 cc cc cc cc 48 8b 37 48 89 fa 48 c7 c7 00 b5 b1 a9 e8 ed 1a 0b ff <=
0f> 0b eb c8 be 01 00 00 00 e8 ef 47 82 ff 48 89 d8 5b c3 cc cc cc
> [   30.620733] RSP: 0000:ffffb743401b7b88 EFLAGS: 00010296
> [   30.620749] RAX: 000000000000005f RBX: ffff9ea156b13800 RCX: 000000000=
0000000
> [   30.620758] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000f=
fffffff
> [   30.620767] RBP: ffff9ea156b13800 R08: 0000000000000000 R09: ffffb7434=
01b7a30
> [   30.620776] R10: ffff9ea1adbe2fa8 R11: 0000000000000003 R12: 000000000=
0000000
> [   30.620785] R13: ffff9ea148d8f830 R14: ffff9ea156b13e80 R15: ffffffffa=
8947926
> [   30.620794] FS:  0000000000000000(0000) GS:ffff9ea1b9580000(0000) knlG=
S:0000000000000000
> [   30.620805] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   30.620814] CR2: 00007f67ea538478 CR3: 0000000004850000 CR4: 000000000=
01006f0
> [   30.620824] Call Trace:
> [   30.620834]  <TASK>
> [   30.620849]  ? __warn.cold+0xb1/0x13e
> [   30.620867]  ? kobject_get+0x43/0x70
> [   30.620885]  ? report_bug+0xe6/0x170
> [   30.620910]  ? handle_bug+0x3c/0x80
> [   30.620927]  ? exc_invalid_op+0x13/0x60
> [   30.620943]  ? asm_exc_invalid_op+0x16/0x20
> [   30.620957]  ? gpio_device_find+0x16/0x260
> [   30.620997]  ? kobject_get+0x43/0x70
> [   30.621016]  ? kobject_get+0x43/0x70
> [   30.621029]  gpio_device_find+0x216/0x260
> [   30.621047]  ? __pfx_gpio_chip_match_by_label+0x10/0x10
> [   30.621120]  gpiod_find_and_request+0x33a/0x480
> [   30.621140]  ? __pfx_device_match_name+0x10/0x10
> [   30.621170]  gpiod_get+0x41/0x60
> [   30.621191]  snd_byt_wm5102_mc_probe+0xfd/0x500 [snd_soc_sst_bytcr_wm5=
102]
> [   30.621231]  ? __pfx___device_attach_driver+0x10/0x10
> [   30.621247]  platform_probe+0x40/0xa0
> [   30.621269]  really_probe+0xde/0x340
> [   30.621282]  ? pm_runtime_barrier+0x50/0x90
> [   30.621304]  __driver_probe_device+0x78/0x110
> [   30.621324]  driver_probe_device+0x1f/0xa0
> [   30.621343]  __device_attach_driver+0x85/0x110
> [   30.621364]  bus_for_each_drv+0x78/0xc0
> [   30.621389]  __device_attach+0xb0/0x1b0
> [   30.621413]  bus_probe_device+0x94/0xb0
> [   30.621435]  deferred_probe_work_func+0x99/0xf0
> [   30.621452]  process_one_work+0x222/0x5a0
> [   30.621470]  ? move_linked_works+0x70/0xa0
> [   30.621502]  worker_thread+0x1d1/0x3e0
> [   30.621526]  ? __pfx_worker_thread+0x10/0x10
> [   30.621539]  kthread+0xee/0x120
> [   30.621554]  ? __pfx_kthread+0x10/0x10
> [   30.621572]  ret_from_fork+0x30/0x50
> [   30.621587]  ? __pfx_kthread+0x10/0x10
> [   30.621602]  ret_from_fork_asm+0x1a/0x30
> [   30.621652]  </TASK>
> [   30.621661] irq event stamp: 11481
> [   30.621669] hardirqs last  enabled at (11487): [<ffffffffa81b9ccd>] co=
nsole_unlock+0x10d/0x140
> [   30.621683] hardirqs last disabled at (11492): [<ffffffffa81b9cb2>] co=
nsole_unlock+0xf2/0x140
> [   30.621695] softirqs last  enabled at (11330): [<ffffffffa81143eb>] __=
irq_exit_rcu+0x9b/0x100
> [   30.621708] softirqs last disabled at (11325): [<ffffffffa81143eb>] __=
irq_exit_rcu+0x9b/0x100
> [   30.621720] ---[ end trace 0000000000000000 ]---

Ouch, please, reduce this in accordance with
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#back=
traces-in-commit-messages

--=20
With Best Regards,
Andy Shevchenko



