Return-Path: <linux-gpio+bounces-23077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9CEB000BA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 13:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F5A189DED5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC93242D83;
	Thu, 10 Jul 2025 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="OLD+qYWa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269691A841A;
	Thu, 10 Jul 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752147853; cv=none; b=SBWwtZ3L7DekhBDVR20T/la15eEtfnrrBsxZ/Hofq0d9Gfxf1YN9LEquJyPlOdmxc4k7VjQIJlcWr6Fe75b2FQp9HZbnNgN1zPzKEpn69aZnBjGNiC4oIt/JV5EJsWuG5NkZM0YTfiYE1TzkwCxZyp0UAqrW+q6Jmb5E2sk8YyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752147853; c=relaxed/simple;
	bh=87TGGmsveT7B1RYMNX+9uM/k958PjRkYA6zqMmJObt4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ouFLhlMEQMopWnODJvNOp4r5/gwOiPTv3Mx/cZIc5l6hArb8Ny7+l2jn4IyYn6AbXUP840Zxh0BS17Wwm+Yg9tARLCddYWZ+DITZKguxL7lZop7iA/r+qw9OSRbQaT8Srx06od2DsHHMJxnm5pN9Rcq7xsFIR5iAF1VQrhYBncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=OLD+qYWa; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type;
	bh=7+05M/IC9yw3ENVoiQK7kXBOotT7lwC0HHuno/gcwMM=;
	b=OLD+qYWaIK+dTpdDyr6qbz+3Qo6ZgmgCJ1KCdDn/MhWatazQi6UmTIz1zPsLNuLFjqRUw+A3JNOzAYSCAf4+i1dOgDrDXovGHrzAOPg7ojTCgQkanBvyNHkWdgwwon3M425d4Ixu7dlLXqze45tWEOKvT3HVIrtkqMfUP/elH28=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Thu, 10 Jul 2025 13:44:02 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 BUG: "scheduling while atomic" with MCP23008 + matrix_keypad IRQ mode on
 Linux 6.15.5
Date: Thu, 10 Jul 2025 13:44:01 +0200
Message-ID: <15509576.tv2OnDr8pf@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4308874.1IzOArtZ34";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4308874.1IzOArtZ34
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 13:44:01 +0200
Message-ID: <15509576.tv2OnDr8pf@lukas-hpz440workstation>
MIME-Version: 1.0

Hi all,

I'm encountering a "BUG: scheduling while atomic" when using the MCP23008 GPIO 
expander with the `matrix_keypad` driver in IRQ mode on Linux v6.15.5

Hardware setup:
- MCP23008 connected via I2C
- 4x4 matrix keypad hooked to MCP23008 GPIOs
- SoC: Allwinner T113-s3 SoC
- Using devicetree configuration for `microchip,mcp23008` and `gpio-
matrix-keypad`

When I press buttons on the keypad, after some amount of presses I get the 
following error from the Kernel:

[   81.921114] BUG: scheduling while atomic: kworker/1:4/383/0x00000002
[   81.921155] Modules linked in: esp32_sdio(O) bluetooth ecdh_generic ecc 
cfg80211 rfkill ipv6 af_packet evdev matrix_keypad matrix_keymap 
pinctrl_mcp23s08_i2c pinctrl_mcp23s08 sun8i_ce crypto_engine uio_pdrv_genirq 
uio
[   81.921287] CPU: 1 UID: 0 PID: 383 Comm: kworker/1:4 Tainted: G           O        
6.15.4 #1 PREEMPT 
[   81.921305] Tainted: [O]=OOT_MODULE
[   81.921310] Hardware name: Generic DT based system
[   81.921317] Workqueue: events matrix_keypad_scan [matrix_keypad]
[   81.921343] Call trace: 
[   81.921353]  unwind_backtrace from show_stack+0x18/0x1c
[   81.921381]  show_stack from dump_stack_lvl+0x68/0x74
[   81.921398]  dump_stack_lvl from __schedule_bug+0x5c/0x70
[   81.921423]  __schedule_bug from __schedule+0xb48/0xd24
[   81.921451]  __schedule from schedule+0x34/0x144
[   81.921472]  schedule from schedule_preempt_disabled+0x24/0x34
[   81.921494]  schedule_preempt_disabled from __mutex_lock.constprop.
0+0x308/0xaa4
[   81.921519]  __mutex_lock.constprop.0 from mcp23s08_irq_bus_lock+0x20/0x30 
[pinctrl_mcp23s08]
[   81.921553]  mcp23s08_irq_bus_lock [pinctrl_mcp23s08] from 
__irq_get_desc_lock+0x84/0xac
[   81.921584]  __irq_get_desc_lock from enable_irq+0x38/0xa8
[   81.921605]  enable_irq from matrix_keypad_scan+0x2b8/0x3ac [matrix_keypad]
[   81.921626]  matrix_keypad_scan [matrix_keypad] from 
process_one_work+0x160/0x410
[   81.921649]  process_one_work from worker_thread+0x25c/0x408
[   81.921668]  worker_thread from kthread+0x144/0x264
[   81.921685]  kthread from ret_from_fork+0x14/0x38
[   81.921699] Exception stack(0xc896dfb0 to 0xc896dff8)
[   81.921709] dfa0:                                     00000000 00000000 
00000000 00000000
[   81.921720] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[   81.921730] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000

Happy to test patches or provide further debugging info.

Best regards,  
Lukas Schmid
--nextPart4308874.1IzOArtZ34
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhvp4EACgkQJnN+drMV
Rtjt9Af/ZLO0pvV2QXisvWVdmeigrwh8pxhgc9HUlHHlSPzRo4KO/OHWMZ8RyIzg
0rho3uB+9vNwySANstD3uyzFVv/Wr5qrsbKmmTR3vAolpexJzVSnz/udmjXTOwdU
uWd7eMo44Q172/gCcvhzpJ0rLOP6Lz+cpyNnt2KqWsRMW+C6/HPZ1PTRoMIQx4pP
30cCYdavudi/KJuYCF4MVSqGGmUMxbDI487Y4BGIvi89GrZfFQD+fH+n0AsbKi1+
7Otlj0SuyppWZaQdY3o6GuM+sBWh4v8RoOuzMDWGD888IMZufVk97yFky5NWUNW5
OjGbAWbPltGVHiMVM+12N8SgJdHjbA==
=6sqo
-----END PGP SIGNATURE-----

--nextPart4308874.1IzOArtZ34--





