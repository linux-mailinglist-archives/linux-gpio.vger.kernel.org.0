Return-Path: <linux-gpio+bounces-22900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D30AFBC74
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 22:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B0AF7A8CC5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 20:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0C21B8E7;
	Mon,  7 Jul 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="pgNHVJSp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.olsak.net (unknown [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52111C5D55;
	Mon,  7 Jul 2025 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751919580; cv=none; b=YKl1zd9bLDmrBuLInPOxejItYvD2/w4SSB4iTSe6//LlROZNddnd+vre0ex0BnykbOohEeKo2HFDiupweGB+bS7AAPzxgYgo3kjZaYiKFy8MEC/MaPjJT77zqQdLNTSkZidg9h1VMjI6Sh9b39HgAEsU7IzFuX61ABtksKQ01fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751919580; c=relaxed/simple;
	bh=k2MHhgPjfUDLsGEEH67EpKvSCmfi9RUC7fUdRelYLkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QN+GMvmrlveIFkMAtUInVBeImsfoXWhXg8zvrz6d7hQTNIZMYZM3FbP7nlDtEeCuiZ0cVVNt/Ac2GnNdHu1s+jzb7mEj0Ngiq8kJjS70AqmARXEHKBTnJPNdjl2flvJ1Kgeyint12RSb1pxCb8ibIGFNAC9mIYfArqwiyJo022o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=pgNHVJSp; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=fHH6v5yGNVwg8uMoTuKvnyh2VkMrVbbrie/9BKZs8WU=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1751918643; v=1; x=1752350643;
 b=pgNHVJSpO+4a34f+EgFX8ByNKF3dBwRptZimjNRgVRZqH5invAlB3+V9UYM2anUrPQBUnkXw
 NyYgBEykvI/4f5jZ9Prvsj25EbKSjiOnbLjJbJi5flZgT/YGrs7a1VNG0/HziEt2Pzt1goYUm86
 MAe/QZA5soJ3+0UpfugXPYGpwRF8kViFjvjE8lg0iL6b1Ev9wEd2MVFLs5G87flEzyar3dIqv8B
 mNCW3RIpi5Z3a42pHPhDJVBXrRDVLHWj+OrNYv2MPGaktgizoRa+4YSXddslh5bLfMmOnre/OQP
 nBkXkUwuyXFsxS7QZ8ACnSBdet2+8+NFUBe3Y9t1auD/w==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id f8bc91aa; Mon, 07 Jul 2025 22:04:03 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Karel Balej <balejk@matfyz.cz>
Subject:
 [REGRESSION] samsung,coreprimevelte oops and lockup while probing SM5504
Date: Mon, 07 Jul 2025 22:04:02 +0200
Message-ID: <3367665.aeNJFYEL58@radijator>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi,

After rebasing my samsung,coreprimevelte patchset to v6.16-rc5 (from v6.14), I 
found that the board would not successfully boot. Through serial I managed to 
extract this oops (stack trace decoded):

[    1.281921] Unable to handle kernel paging request at virtual address 
00676e6965657246
[    1.281927] Mem abort info:
[    1.281930]   ESR = 0x0000000096000004
[    1.281933]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.281938]   SET = 0, FnV = 0
[    1.281941]   EA = 0, S1PTW = 0
[    1.281944]   FSC = 0x04: level 0 translation fault
[    1.281948] Data abort info:
[    1.281950]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    1.281953]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.281957]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.281961] [00676e6965657246] address between user and kernel address 
ranges
[    1.281968] Internal error: Oops: 0000000096000004 [#1]  SMP
[    1.281974] Modules linked in:
[    1.281995] Tainted: [S]=CPU_OUT_OF_SPEC
[    1.281998] Hardware name: Samsung Galaxy Core Prime VE LTE (DT)
[    1.282003] Workqueue: events_unbound deferred_probe_work_func
[    1.282018] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.282025] pc : try_module_get (kernel/module/main.c:883 (discriminator 
2)) 
[    1.282035] lr : gpiochip_irq_reqres (drivers/gpio/gpiolib.c:4131 
(discriminator 1) drivers/gpio/gpiolib.c:1929 (discriminator 1)) 
[    1.282044] sp : ffff8000811d3280
[    1.282047] x29: ffff8000811d3280 x28: 000000000000001c x27: 
0000000000000002
[    1.282057] x26: ffff800080ce3c50 x25: ffff800080700e08 x24: 
ffff00000341f800
[    1.282068] x23: ffff000002ea6c00 x22: 000000000000001c x21: 
0000000000000000
[    1.282077] x20: 0000000000000000 x19: ffff000002f03880 x18: 
0000000000000000
[    1.282087] x17: 0000000000000000 x16: 000000009e839b88 x15: 
ffff0000025ec490
[    1.282097] x14: ffff800080f6ae78 x13: 0000000000000001 x12: 
000000004c68655d
[    1.282107] x11: 0000000000000180 x10: 0000000000000a70 x9 : 
ffff8000805a6fd4
[    1.282116] x8 : ffff0000025eced0 x7 : ffff0000025ec400 x6 : 
00000000cbc1e127
[    1.282126] x5 : ffff000002c5b328 x4 : 0000000000000000 x3 : 
0000000000000000
[    1.282136] x2 : ffff0000025ec400 x1 : 20676e6965657246 x0 : 
20676e6965657246
[    1.282146] Call trace:
[    1.282150] try_module_get (kernel/module/main.c:883 (discriminator 2)) (P)
[    1.282159] gpiochip_irq_reqres (drivers/gpio/gpiolib.c:4131 (discriminator 
1) drivers/gpio/gpiolib.c:1929 (discriminator 1)) 
[    1.282167] __setup_irq (kernel/irq/manage.c:1341 (discriminator 1) kernel/
irq/manage.c:1529 (discriminator 1)) 
[    1.282177] request_threaded_irq (kernel/irq/manage.c:2126) 
[    1.282186] regmap_add_irq_chip_fwnode (drivers/base/regmap/regmap-
irq.c:923) 
[    1.282197] devm_regmap_add_irq_chip_fwnode (drivers/base/regmap/regmap-
irq.c:1085) 
[    1.282206] devm_regmap_add_irq_chip (drivers/base/regmap/regmap-
irq.c:1123) 
[    1.282215] sm5022_muic_i2c_probe (drivers/extcon/extcon-sm5502.c:714) 
[    1.282225] i2c_device_probe (drivers/i2c/i2c-core-base.c:591) 
[    1.282235] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657) 
[    1.282243] __driver_probe_device (drivers/base/dd.c:799) 
[    1.282252] driver_probe_device (drivers/base/dd.c:829) 
[    1.282260] __device_attach_driver (drivers/base/dd.c:958) 
[    1.282269] bus_for_each_drv (drivers/base/bus.c:462) 
[    1.282277] __device_attach (drivers/base/dd.c:1031) 
[    1.282285] device_initial_probe (drivers/base/dd.c:1079) 
[    1.282294] bus_probe_device (drivers/base/bus.c:537) 
[    1.282301] device_add (drivers/base/core.c:3699) 
[    1.282308] device_register (drivers/base/core.c:3775) 
[    1.282316] i2c_new_client_device (drivers/i2c/i2c-core-base.c:1022) 
[    1.282325] of_i2c_register_device (drivers/i2c/i2c-core-of.c:77) 
[    1.282332] of_i2c_register_devices (drivers/i2c/i2c-core-of.c:104 
(discriminator 1)) 
[    1.282339] i2c_register_adapter (drivers/i2c/i2c-core-base.c:1594) 
[    1.282347] i2c_add_adapter (drivers/i2c/i2c-core-base.c:1670 drivers/i2c/
i2c-core-base.c:1650) 
[    1.282356] i2c_add_numbered_adapter (drivers/i2c/i2c-core-base.c:1703) 
[    1.282366] __i2c_bit_add_bus (drivers/i2c/algos/i2c-algo-bit.c:659) 
[    1.282373] i2c_bit_add_numbered_bus (drivers/i2c/algos/i2c-algo-bit.c:683) 
[    1.282380] i2c_gpio_probe (drivers/i2c/busses/i2c-gpio.c:432) 
[    1.282387] platform_probe (drivers/base/platform.c:1405) 
[    1.282397] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657) 
[    1.282405] __driver_probe_device (drivers/base/dd.c:799) 
[    1.282413] driver_probe_device (drivers/base/dd.c:829) 
[    1.282422] __device_attach_driver (drivers/base/dd.c:958) 
[    1.282430] bus_for_each_drv (drivers/base/bus.c:462) 
[    1.282438] __device_attach (drivers/base/dd.c:1031) 
[    1.282446] device_initial_probe (drivers/base/dd.c:1079) 
[    1.282455] bus_probe_device (drivers/base/bus.c:537) 
[    1.282462] deferred_probe_work_func (drivers/base/dd.c:124) 
[    1.282471] process_one_work (arch/arm64/include/asm/jump_label.h:36 
include/trace/events/workqueue.h:110 kernel/workqueue.c:3243) 
[    1.282479] worker_thread (kernel/workqueue.c:3315 (discriminator 2) 
kernel/workqueue.c:3402 (discriminator 2)) 
[    1.282487] kthread (kernel/kthread.c:464) 
[    1.282494] ret_from_fork (arch/arm64/kernel/entry.S:863) 
[ 1.282506] Code: a9bd7bfd 910003fd b4000260 aa0003e1 (b9400000)
(disassembly omitted since the script treated it as x86 for some reason)
[    1.282512] ---[ end trace 0000000000000000 ]---
[    1.298926] mmc0: new HS200 MMC card at address 0001
[    1.331699] mmc2: SDHCI controller on d4280800.mmc [d4280800.mmc] using 
ADMA
[    1.333834] mmcblk0: mmc0:0001 QN1SMB 7.28 GiB
[    1.368613] mmc2: new high speed SDIO card at address 0001
[    1.373418]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 
p16 p17 p18 p19
[    1.688785] mmcblk0boot0: mmc0:0001 QN1SMB 4.00 MiB
[    1.693415] mmcblk0boot1: mmc0:0001 QN1SMB 4.00 MiB
[    1.697474] mmcblk0rpmb: mmc0:0001 QN1SMB 512 KiB, chardev (248:0)
(dmesg ends here, display freezes, no further signs of life)

I went through recent commits to sm5502, gpiolib and finally gpio-pxa to check 
whether any of them could be causing issues. Eventually I stumbled upon 
20117cf426b6 ("gpio: pxa: Make irq_chip immutable") and reverted it locally, 
after which the board started booting again.

#regzbot introduced: 20117cf426b6

Regards,
--
Duje



