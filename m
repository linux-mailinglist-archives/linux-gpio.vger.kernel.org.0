Return-Path: <linux-gpio+bounces-18246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF30A7C91E
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Apr 2025 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B3FE7A7ECA
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Apr 2025 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5871DF727;
	Sat,  5 Apr 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="fqlzOnRL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9501DDC21;
	Sat,  5 Apr 2025 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743857361; cv=none; b=CWwAlLDUlXZZtnu8uEWfuf9pfUzRyZ7CGd2/pYAoP2Udv4f79K48tiYIhpRsae2nc820+SFm5XtRc9pzCHn4QPwKqVfJG/dGLj+P1jzNr9XTRdcJ2FkJipL2OqPqQplaXtuiUwKps560+HdjAPuRmAIMbDjtb5sVZef/dgvdOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743857361; c=relaxed/simple;
	bh=POHAFotKd8e1O+6O+b9w5tEhRIF3sEA2eTNlYAQuvOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sczQzC69iU6+lD7DcVVTWeZwWnaIsxH3iK4Lh/9fb8qaPMCvi2EnQqm1NvoSkESY7+zXEWU2rPlMPQxk3oIEEN8Ub4bkw8wZFPHD9IL6Z6mq8dGigStYyMU/mNXyVZ6/K1jW3hxLUop+jNgrkq925p+olDq46n5kOqEzkhGoN5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=fqlzOnRL; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type;
	bh=+lj06kP7F8HTAAzSL4UU5vQVmYs6pDrrt0YSXXnbsUM=;
	b=fqlzOnRLRyUuGGefktblktLzYyLfea5KMiTjVD1wykqt04dKGS3U8F/WoHWkTW8kgRjMaQRPeycvDE80NrfCHesWrcsCi7yLj5PsIkNIeedknZIodKPhAOdpWcBeJFFKKqLRspJzAXNHeiIj+VmMoItzRI58iV+HUuqJgcVaiXM=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sat, 5 Apr 2025 13:48:26 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [BUG] pinctrl_mcp23s08_i2c: mutex used in irq_bus_lock causes 'scheduling
 while atomic' with matrix_keypad
Date: Sat, 05 Apr 2025 13:48:25 +0200
Message-ID: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6148072.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6148072.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 05 Apr 2025 13:48:25 +0200
Message-ID: <5879304.DvuYhMxLoT@lukas-hpz440workstation>
MIME-Version: 1.0

Hi all,

I'm encountering a "BUG: scheduling while atomic" when using the MCP23017 GPIO 
expander with the `matrix_keypad` driver in IRQ mode on Linux v6.12.20

Hardware setup:
- MCP23017 connected via I2C
- 4x4 matrix keypad hooked to MCP23017 GPIOs
- SoC: Allwinner V3s SoC
- Using devicetree-overlay configuration for `microchip,mcp23017` and `gpio-
matrix-keypad`

When I press buttons on the keypad, after some amount of presses I get the 
following error from the Kernel:

[   92.820159] BUG: scheduling while atomic: kworker/0:2/46/0x00000002
[   92.826577] Modules linked in: bluetooth ecdh_generic ecc cfg80211 rfkill 
ipv6 af_packet evdev mcp251xfd can_dev matrix_keypad matrix_keymap 
gpio_pcf857x pinctrl_mcp23s08_i2c pinctrl_mcp23s08 hd44780 hd44780_common 
charlcd sun4i_ss libdes sun4i_codec sun8i_codec_analog sun8i_adda_pr_regmap 
snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd soundcore uio_pdrv_genirq 
uio [last unloaded: esp32_sdio(O)]
[   92.862336] CPU: 0 UID: 0 PID: 46 Comm: kworker/0:2 Tainted: G           O       
6.12.20 #1
[   92.862362] Tainted: [O]=OOT_MODULE
[   92.862368] Hardware name: Allwinner sun8i Family
[   92.862378] Workqueue: events matrix_keypad_scan [matrix_keypad]
[   92.862415] Call trace: 
[   92.862429]  unwind_backtrace from show_stack+0x18/0x1c
[   92.862469]  show_stack from dump_stack_lvl+0x68/0x74
[   92.862490]  dump_stack_lvl from __schedule_bug+0x5c/0x70
[   92.862518]  __schedule_bug from __schedule+0xab4/0xc94
[   92.862541]  __schedule from schedule+0x34/0x14c
[   92.862560]  schedule from schedule_preempt_disabled+0x24/0x34
[   92.862580]  schedule_preempt_disabled from __mutex_lock.constprop.
0+0x2e4/0x940
[   92.862605]  __mutex_lock.constprop.0 from mcp23s08_irq_bus_lock+0x20/0x30 
[pinctrl_mcp23s08]
[   92.862650]  mcp23s08_irq_bus_lock [pinctrl_mcp23s08] from 
__irq_get_desc_lock+0x84/0xa8
[   92.862682]  __irq_get_desc_lock from enable_irq+0x38/0xa8
[   92.862710]  enable_irq from matrix_keypad_scan+0x2e0/0x324 [matrix_keypad]
[   92.862738]  matrix_keypad_scan [matrix_keypad] from 
process_one_work+0x160/0x410
[   92.862763]  process_one_work from worker_thread+0x258/0x3f8
[   92.862782]  worker_thread from kthread+0x118/0x134
[   92.862801]  kthread from ret_from_fork+0x14/0x38
[   92.862817] Exception stack(0xc4989fb0 to 0xc4989ff8)
[   92.862829] 9fa0:                                     00000000 00000000 
00000000 00000000
[   92.862840] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[   92.862849] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   93.007968] BUG: workqueue leaked atomic, lock or RCU: kworker/0:2[46]
[   93.007968]      preempt=0xffffffff lock=0->0 RCU=0->0 
workfn=matrix_keypad_scan [matrix_keypad]
[   93.008051] CPU: 0 UID: 0 PID: 46 Comm: kworker/0:2 Tainted: G        W  O       
6.12.20 #1
[   93.008071] Tainted: [W]=WARN, [O]=OOT_MODULE
[   93.008076] Hardware name: Allwinner sun8i Family
[   93.008085] Workqueue: events matrix_keypad_scan [matrix_keypad]
[   93.008108] Call trace: 
[   93.008121]  unwind_backtrace from show_stack+0x18/0x1c
[   93.008158]  show_stack from dump_stack_lvl+0x68/0x74
[   93.008179]  dump_stack_lvl from process_one_work+0x40c/0x410
[   93.008202]  process_one_work from worker_thread+0x258/0x3f8
[   93.008221]  worker_thread from kthread+0x118/0x134
[   93.008240]  kthread from ret_from_fork+0x14/0x38
[   93.008256] Exception stack(0xc4989fb0 to 0xc4989ff8)
[   93.008267] 9fa0:                                     00000000 00000000 
00000000 00000000
[   93.008277] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[   93.008286] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   93.008300] BUG: scheduling while atomic: kworker/0:2/46/0x00000000
[   93.115583] Modules linked in: bluetooth ecdh_generic ecc cfg80211 rfkill 
ipv6 af_packet evdev mcp251xfd can_dev matrix_keypad matrix_keymap 
gpio_pcf857x pinctrl_mcp23s08_i2c pinctrl_mcp23s08 hd44780 hd44780_common 
charlcd sun4i_ss libdes sun4i_codec sun8i_codec_analog sun8i_adda_pr_regmap 
snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd soundcore uio_pdrv_genirq 
uio [last unloaded: esp32_sdio(O)]
[   93.151453] CPU: 0 UID: 0 PID: 46 Comm: kworker/0:2 Tainted: G        W  O       
6.12.20 #1
[   93.151483] Tainted: [W]=WARN, [O]=OOT_MODULE
[   93.151488] Hardware name: Allwinner sun8i Family
[   93.151496] Workqueue:  0x0 (events)
[   93.151525] Call trace: 
[   93.151537]  unwind_backtrace from show_stack+0x18/0x1c
[   93.151570]  show_stack from dump_stack_lvl+0x68/0x74
[   93.151589]  dump_stack_lvl from __schedule_bug+0x5c/0x70
[   93.151615]  __schedule_bug from __schedule+0xab4/0xc94
[   93.151640]  __schedule from schedule+0x34/0x14c
[   93.151659]  schedule from worker_thread+0x1c8/0x3f8
[   93.151681]  worker_thread from kthread+0x118/0x134
[   93.151698]  kthread from ret_from_fork+0x14/0x38
[   93.151713] Exception stack(0xc4989fb0 to 0xc4989ff8)
[   93.151725] 9fa0:                                     00000000 00000000 
00000000 00000000
[   93.151736] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[   93.151746] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000

Happy to test patches or provide further debugging info.

Best regards,  
Lukas Schmid
--nextPart6148072.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmfxGIkACgkQJnN+drMV
RtieUAf8CVbgPNCJYR+490fKHa8mOTrB03Mqkd1SXjfN0AMt+cbhmEQ/ELW7GYgG
DTTrUqpeyDzxc85HVHWA8wk2hWN4CTnPl7C855fiCHq7yy1yiG/VMGR5hEW0izPC
Fe4PZ6T1E6G7WigaamERePFcyqD79oAWyVYvBvGInY1MZHgIEJi82ZFw88dQpcaE
UtEbVyDFnCvMupueBs/40bIxfqqA43XhIEzlqJ5e6XeZlfODnT+xCG58Pd2N5QCB
jMsld05LWjEmRZSynXwHDXDUTrwRnYhxfCw0JSw4bOZeX+5FADJmF/0J+c5afXiS
GMRp1ld2id2V1zpucE2hZDj/jsJW6A==
=tCzG
-----END PGP SIGNATURE-----

--nextPart6148072.lOV4Wx5bFT--





