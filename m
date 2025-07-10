Return-Path: <linux-gpio+bounces-23078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C38B000DB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 13:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889191C44162
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916852494F0;
	Thu, 10 Jul 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YXhZDUkt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MhpX0a4k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D52222AB;
	Thu, 10 Jul 2025 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148547; cv=none; b=qIlOf06OGvRnpPVtwnW+jJvyV2grimhcQVl0nsigOObetz2bG2JYXGDDxw5cw9Rxr4CwJfL4sPNqXSdSwfwheQ1li02UpWrIjJQh0asR2DLAq71QpLHC8w5TT7oMAYk8WfO4tBT7i+GbyjHUZQU5NmwgogPoAeH4LYgIA53qMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148547; c=relaxed/simple;
	bh=3juJXtwRqTMRqGAqlCmyVvx+e7eoGT6bsJ70gv6r93M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxPWdvd6VlUUOK3y058MZS6RIQ39K2l5MIlb2nr/tZOZnOqjbzty9/SfQ/ZZp1twWoXiWKhPnjufxewF32Gp6uI81yaiBQucAQIL+YeO07nkAdJz8j3roH+o5MCSnYyJjunJXzH+hPeUlA/h/fzES5h7xT65N9vf0G3o7ppNObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YXhZDUkt; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MhpX0a4k reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1752148543; x=1783684543;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1M/8ZPDR+jqD9KgmK8AzTlm6VYkQ4n5iRWmdgmfKnjw=;
  b=YXhZDUktCbCDjEqyIhLHalAtlGyHojyxYJOClqsZKvuEc32+haz97EAG
   RCNkJsaEuwUkzG32p9W2pWmRXLbW3lFGY7UoyqpADhKyqWptjlv1JxOat
   xRbbyq1s+JsO8+7z0Otbq6d593RtE2ji2v3gLjUIgr9ezsgGqLqi0n7EP
   ZHeOZauqaa1Ar5siTQmDxenaMjOdiKdTfWxHcWA749KmTW88F9oOZbuKz
   9qqpx8L44YkgS3MXU4qUuEamYnf8s0MqcJRB6xMs8NHUVcH+FPjvQcIED
   4fk62zeMmywaSdhyWclab1opj3lpDA8AD7XXoIsfTTCFqUMbsqike0b8t
   g==;
X-CSE-ConnectionGUID: p3swa5/FQxurqVfx6Se2Tw==
X-CSE-MsgGUID: sZub9Ib2Rp+Q8uPhcjJ4rg==
X-IronPort-AV: E=Sophos;i="6.16,300,1744063200"; 
   d="scan'208";a="45137225"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jul 2025 13:55:34 +0200
X-CheckPoint: {686FAA35-26-A38CADE4-FD2ABC4A}
X-MAIL-CPID: 4B1FD4FB117D508654D687B6302666B6_3
X-Control-Analysis: str=0001.0A006397.686FAA49.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 816DE168182;
	Thu, 10 Jul 2025 13:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1752148529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1M/8ZPDR+jqD9KgmK8AzTlm6VYkQ4n5iRWmdgmfKnjw=;
	b=MhpX0a4krtgS/76DyMt/ZA3ruTx1AiGsyMjQRadoRYZTnpXZMlOT023OSX1rE7jwpvlMc4
	W12hqbjo4X7TK6eBbkTrn+/zNP1qs5CwSG52xcFoBxQDauH92P+Oub9EooaA0aOzotDfnh
	hs+GoALxaDL9BYeVUHt1H3kJ9OTTlyzKh54k7wdsjKz/W4nHXChfbZ0/9ciAgJwofulpkt
	oTvbAz2ljGCqvyT/tPPfA4wDF24ig14aw15YWkjWE7OXXBf+cAKnrZfa8yLEK/upv36RZ1
	aumvfjjhBVisolO02gYQA48hNa3xfxdR57PzWiqp9W0opZYMIIxM+N4md2ZETQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Schmid <lukas.schmid@netcube.li>
Subject:
 Re: BUG: "scheduling while atomic" with MCP23008 + matrix_keypad IRQ mode on
 Linux 6.15.5
Date: Thu, 10 Jul 2025 13:55:29 +0200
Message-ID: <6072675.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <15509576.tv2OnDr8pf@lukas-hpz440workstation>
References: <15509576.tv2OnDr8pf@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 10. Juli 2025, 13:44:01 CEST schrieb Lukas Schmid:
> Hi all,
>=20
> I'm encountering a "BUG: scheduling while atomic" when using the MCP23008=
 GPIO=20
> expander with the `matrix_keypad` driver in IRQ mode on Linux v6.15.5
>=20
> Hardware setup:
> - MCP23008 connected via I2C
> - 4x4 matrix keypad hooked to MCP23008 GPIOs
> - SoC: Allwinner T113-s3 SoC
> - Using devicetree configuration for `microchip,mcp23008` and `gpio-
> matrix-keypad`
>=20
> When I press buttons on the keypad, after some amount of presses I get th=
e=20
> following error from the Kernel:
>=20
> [   81.921114] BUG: scheduling while atomic: kworker/1:4/383/0x00000002
> [   81.921155] Modules linked in: esp32_sdio(O) bluetooth ecdh_generic ec=
c=20
> cfg80211 rfkill ipv6 af_packet evdev matrix_keypad matrix_keymap=20
> pinctrl_mcp23s08_i2c pinctrl_mcp23s08 sun8i_ce crypto_engine uio_pdrv_gen=
irq=20
> uio
> [   81.921287] CPU: 1 UID: 0 PID: 383 Comm: kworker/1:4 Tainted: G       =
    O       =20
> 6.15.4 #1 PREEMPT=20
> [   81.921305] Tainted: [O]=3DOOT_MODULE
> [   81.921310] Hardware name: Generic DT based system
> [   81.921317] Workqueue: events matrix_keypad_scan [matrix_keypad]
> [   81.921343] Call trace:=20
> [   81.921353]  unwind_backtrace from show_stack+0x18/0x1c
> [   81.921381]  show_stack from dump_stack_lvl+0x68/0x74
> [   81.921398]  dump_stack_lvl from __schedule_bug+0x5c/0x70
> [   81.921423]  __schedule_bug from __schedule+0xb48/0xd24
> [   81.921451]  __schedule from schedule+0x34/0x144
> [   81.921472]  schedule from schedule_preempt_disabled+0x24/0x34
> [   81.921494]  schedule_preempt_disabled from __mutex_lock.constprop.
> 0+0x308/0xaa4
> [   81.921519]  __mutex_lock.constprop.0 from mcp23s08_irq_bus_lock+0x20/=
0x30=20
> [pinctrl_mcp23s08]
> [   81.921553]  mcp23s08_irq_bus_lock [pinctrl_mcp23s08] from=20
> __irq_get_desc_lock+0x84/0xac
> [   81.921584]  __irq_get_desc_lock from enable_irq+0x38/0xa8
> [   81.921605]  enable_irq from matrix_keypad_scan+0x2b8/0x3ac [matrix_ke=
ypad]
> [   81.921626]  matrix_keypad_scan [matrix_keypad] from=20
> process_one_work+0x160/0x410
> [   81.921649]  process_one_work from worker_thread+0x25c/0x408
> [   81.921668]  worker_thread from kthread+0x144/0x264
> [   81.921685]  kthread from ret_from_fork+0x14/0x38
> [   81.921699] Exception stack(0xc896dfb0 to 0xc896dff8)
> [   81.921709] dfa0:                                     00000000 0000000=
0=20
> 00000000 00000000
> [   81.921720] dfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0=20
> 00000000 00000000
> [   81.921730] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>=20
> Happy to test patches or provide further debugging info.

The culprit is
> scoped_guard(spinlock_irq, &keypad->lock) {
> 	keypad->scan_pending =3D false;
> 	enable_row_irqs(keypad);
> }

Here a spinlock is held, while during enable_irq() call the function
mcp23s08_irq_bus_lock() is called. The latter one tries to lock a mutex
while holding a spinlock. This doesn'twork.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



