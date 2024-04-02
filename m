Return-Path: <linux-gpio+bounces-5006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC3895635
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD74A1F258E6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B76B8594C;
	Tue,  2 Apr 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p0LiQlT0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDC74262
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066929; cv=none; b=PYNxQ2AtPTxDwXZxh2FZRiLyCCL5tppuDWRuziJfs305HDBu9wD0hX4AqY96skohlFu86mVt1CvfDhxG7vAb1rAo2hZ1BBuzRgpExXVurtqENDf/qdIWWfeT0ycVQCUU540+rY6TIhmniagmNMqtBjMQpDk74D+uwC7gPXQ9IiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066929; c=relaxed/simple;
	bh=OfegeGTsuDo0Gr9lisUs3MR1SVlAPcGR7u4MXKa1G/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPMTK7v2xlrFUWbbtQejWOZKEcsRtCGaVSAfHd9DYk5Jq33ewtcnbUMwrdmRnjD6is+T2AensfshLVW2se8iGNR/lczx7lc129EfvK+Vb8LygIXL9xgFv4ASBKqGNme84qsCIbhrKKDxM/bzYrUNp/G8mhjWr8g6R7EtxdPN7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p0LiQlT0; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d68c6a4630so54286491fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712066925; x=1712671725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vX+0WXeHjydpf0hdk+Y+lBJHF757e6rNrDRH73PIDY=;
        b=p0LiQlT0cgGyhyK+cQGfoGPJ51E3S33oFRKYmuMfY4OpcVZF1RAkMR9omVAxoBIt6d
         0EwjHCC9PavNJdNSy9JOpCMRo8MMg8j0aQRpN12Qne+JSrw4jQTHPEa5w+efAWi+DS1u
         yeKDz5BcSWADY/hCx7Xt6v0Hd7vmTHEsnZZAChC5htv+DSJzUSw7XDYNKDWO5pxLwlSz
         zbEdmB5kOX+HbcKsboD86MkDsiDJpeJZGYrdeLGJHK52SboMhzypwYSH3kr2Tl5I2rzn
         VDQa5lwcAnPHFNQeDTAQPUSRQLPB9gf43eCPCVZ9KxCPtE7Uo1a0o4d8X3Nl/DKSdEuy
         wK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066925; x=1712671725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vX+0WXeHjydpf0hdk+Y+lBJHF757e6rNrDRH73PIDY=;
        b=jkKt/Kqwjm634cwc/P8Mxng97ojh7Xp0+vuoxrkNSt1mUG24KpR4XFmlgJzhTVrC3r
         dmvoN+45LtUGrFo4/d+M1H094A+YRFtgpax2CzZEahUEioHU99Rec23bIJBK3W8ENWDf
         XEFFT9uczP7USS/bv1gvshvDPn7e5DrP6y2PKgf4U+Ka5i1ajLvBACd2cyOuQmb6MUag
         ePXEgKvavtDiSdumw4RSXQAx5or0MxvA/OtI56vJsOhjQ0ctnH2f1BGUXcqq4qoJdcrW
         vh+G1Xi99n08cCK91c1IRDzc00mKkyyryv3tccBB3xLP1KHE/cWJPj/NbDD4zFHNCSyl
         plEw==
X-Forwarded-Encrypted: i=1; AJvYcCVOi48ndfJLyWhXAlOKe3K6ExqCQ/WPYowDBqgIC0n/FWKd27HS5Xz00df2neZdObUmuxfxwD31Ig3yFtsnbt9f6H7pfroBXwBVqg==
X-Gm-Message-State: AOJu0YzI3Ie6+KTghMCww+ToR9jS87IZXr99paEID72WZT5QFF4L7L49
	AGHSZ3M2yz+072VYHSBf78wzDcs4lLRzxTyyt/IF5WTvil7BtHqA0ETI9lv7bmkmFh4jnrHxOQG
	sdODIjfv2xQhgE5WTrtFnnwt8wFR0FgqS4ZIXFg==
X-Google-Smtp-Source: AGHT+IEjCOOKr1y2D8G2pH38sYIqKcHShA4fpYhtVjcPE5IZdZRWmcTtI44soPagnSb/QLrTGHK8g7GC9Bp3YAuOpqA=
X-Received: by 2002:a2e:b903:0:b0:2d2:dfd6:8335 with SMTP id
 b3-20020a2eb903000000b002d2dfd68335mr7931445ljb.22.1712066925002; Tue, 02 Apr
 2024 07:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402134334.173409-1-hdegoede@redhat.com>
In-Reply-To: <20240402134334.173409-1-hdegoede@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 16:08:33 +0200
Message-ID: <CAMRc=MciKFPrqSG0BbLr3oQmXXfDsJGiqukhjKryxUGNPg4KYw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 3:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> When a gpiochip gets added by loading a module, then another driver may
> be waiting for that gpiochip to load on the deferred-probe list.
>
> If the deferred-probe for the consumer of gpiochip then triggers between
> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
> does a kobject_get() on an uninitialzed kobject since the kobject is
> initialized by gpiochip_setup_dev() calling device_initialize():
>
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
>
> Not only is the device not initialized yet, but when the gpio-device is
> added to the list things like the irqchip also have not been initialized
> yet.
>
> So gpio_device_find() should really ignore the gpio-device until
> gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
> check to gpio_device_find() to ignore gpio-devices on the list which are
> not yet fully initialized.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 59ccf9a3e153..4c674a37bcfc 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *da=
ta,
>
>                 gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
>
> -               if (gc && match(gc, data))
> +               if (device_is_registered(&gdev->dev) && gc && match(gc, d=
ata))
>                         return gpio_device_get(gdev);
>         }
>
> --
> 2.44.0
>

Can you do what Andy suggested and move this check even before taking
the SRCU read lock? It doesn't protect the underlying kobject struct
in any way.

Bart

