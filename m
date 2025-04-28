Return-Path: <linux-gpio+bounces-19388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A787AA9EA15
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4B11890EBA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2B2224AE1;
	Mon, 28 Apr 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpGtpGtj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81721CA0F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826869; cv=none; b=sWZhsgCFYhtbXgG82QyOdmNdi/6PPHyRwiVN7uWnQ694AFWLODiIWQjcCzIMnb+nTxcNMEvBxHziq2jKA9MIUidR263gwWfcYgogrqucVCpCl8gzHd08OjTdDRlECOpcvoqMcHeqFrUNIVWEd1I5i8iLyjkNdpmOaqH5h/xpa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826869; c=relaxed/simple;
	bh=qCfaaFgK2N/H+XEzhCmDRQ+QqhMa4YrFwk74r1/Ixvg=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=nbzaJ6zNXv095CqmN87mhTbWsNW4rPbwrshp1sXx2xHoJNh0PPplOtgYukrqTud5JyWzy2dZlO9+co60BLOzK1toQZEyMfiPfy3Y3yWnGdE/A8aGDxatqHzd9Iof3z8KSGEN3/fUVQ88bmYSnqyLcKwkXXZGMoaY4lYwsd77jwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpGtpGtj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFB5C4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826869;
	bh=qCfaaFgK2N/H+XEzhCmDRQ+QqhMa4YrFwk74r1/Ixvg=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=SpGtpGtjJ1XwrS1zjG+qhXhldf+E4OU1znla8O8KrxIPIXJSN5y+pj6pCIaSIsdwO
	 GsgVyF3RzH7LDZxXIbRAfN5X4l9lJGCin0dh9wLWABIok9ZZvO3DH6VJSt4Z9njEwd
	 zAZyD35FqsM4CitrXWoJYNCrDYO76Qq0HcNEDNnWEbD0Q5y+btDG3IrhSiSl636rVx
	 /ZmMK95zfxxM94zPoPrT/AnVIrktHsFiyOk7+P/8s9aDtNlLDL7rWoG28SmJveakjy
	 p3+RCm1vO9Vx1gY2U/LACTVev+Ntpo4LWzFMbyM3FhH5NtC2OQyQIbFwoISSpsKevg
	 myBwg6ARAD0YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 378BC3806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:55:09 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 07:55:24 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c20-9d8165f52ab2@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

The chipset is Alderlake-P as already said in https://bugzilla.kernel.org/show_bug.cgi?id=220056#c12

The issue is resolved by applying the patch from Ariel or by using the Tigerlake pinctrl kernel module, although I believe the latter approach is the wrong solution.

Some relevant system information follows. Please provide the link to the relevant official Intel PCH I2C specifications.

[dmesg | grep PIXA] || [dmesg | grep input] ** with the patch applied **
input: PIXA3848:01 093A:3848 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-PIXA3848:01/0018:093A:3848.0001/input/input3
input: PIXA3848:01 093A:3848 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-PIXA3848:01/0018:093A:3848.0001/input/input4
hid-multitouch 0018:093A:3848.0001: input,hidraw0: I2C HID v1.00 Mouse [PIXA3848:01 093A:3848] on i2c-PIXA3848:01

without the patch applied or without the Tigerlake pinctrl kernel module the output of 'dmesg | grep PIXA' and 'dmesg | grep input' is blank
as the I2C PixArt touchpad device is not detected.

[cat /proc/interrupts] ** with patch applied **

 188:          0          0          0      58039          0          0          0          0          0          0          0          0 intel-gpio    3  PIXA3848:01

without the patch applied or without the Tigerlake pinctrl kernel module the output is blank, as the I2C PixArt touchpad device is not detected (see above).

[/sys/bus/acpi/devices/PIXA*/status]

cat /sys/bus/acpi/devices/PIXA3848\:0*/status
0
15

[acpidump | grep PIXA]

 71210: 0D 50 4E 50 30 43 35 30 00 12 1B 05 0A 1D 0A 68  .PNP0C50.......h
 71220: 0A 20 0D 50 49 58 41 33 38 34 38 00 0D 50 4E 50  . .PIXA3848..PNP
 71230: 30 43 35 30 00 12 16 05 0A 20 0A FF 0A FF 0D 45  0C50..... .....E
 71240: 54 44 30 35 31 38 00 0C 41 D0 0F 13 12 16 05 0A  TD0518..A.......
--
 71350: FF 0A FF 0D 45 54 44 30 35 32 32 00 0C 41 D0 0F  ....ETD0522..A..
 71360: 13 12 17 05 0A 2D 0A FF 0A FF 0D 50 49 58 41 33  .....-.....PIXA3
 71370: 38 34 38 00 0C 41 D0 0F 13 12 1A 05 0A FE 0A 15  848..A..........
 71380: 01 0D 45 4C 41 4E 30 35 30 34 00 0D 50 4E 50 30  ..ELAN0504..PNP0
--
 716E0: 50 30 43 35 30 00 12 1B 05 0A 1D 0A 68 0A 20 0D  P0C50.......h. .
 716F0: 50 49 58 41 33 38 34 38 00 0D 50 4E 50 30 43 35  PIXA3848..PNP0C5
 71700: 30 00 12 16 05 0A 20 0A FF 0A FF 0D 45 54 44 30  0..... .....ETD0
 71710: 35 31 38 00 0C 41 D0 0F 13 12 16 05 0A 21 0A FF  518..A.......!..
--
 71820: 0D 45 54 44 30 35 32 32 00 0C 41 D0 0F 13 12 17  .ETD0522..A.....
 71830: 05 0A 2D 0A FF 0A FF 0D 50 49 58 41 33 38 34 38  ..-.....PIXA3848
 71840: 00 0C 41 D0 0F 13 12 1A 05 0A FE 0A 15 01 0D 45  ..A............E
 71850: 4C 41 4E 30 35 30 34 00 0D 50 4E 50 30 43 35 30  LAN0504..PNP0C50

[lspci]

0000:00:15.0 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO I2C Controller #0 (rev 01)
	Subsystem: Acer Incorporated [ALI] Device 161d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 27
	IOMMU group: 10
	Region 0: Memory at 4017000000 (64-bit, non-prefetchable) [virtual] [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss

0000:00:15.1 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO I2C Controller #1 (rev 01)
	Subsystem: Acer Incorporated [ALI] Device 161d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 40
	IOMMU group: 10
	Region 0: Memory at 4017001000 (64-bit, non-prefetchable) [virtual] [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss

0000:00:19.0 Serial bus controller: Intel Corporation Alder Lake-P Serial IO I2C Controller #0 (rev 01)
	Subsystem: Acer Incorporated [ALI] Device 161d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 31
	IOMMU group: 13
	Region 0: Memory at 4017002000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss

0000:00:19.1 Serial bus controller: Intel Corporation Alder Lake-P Serial IO I2C Controller #1 (rev 01)
	Subsystem: Acer Incorporated [ALI] Device 161d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 32
	IOMMU group: 13
	Region 0: Memory at 4017003000 (64-bit, non-prefetchable) [virtual] [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: intel-lpss

0000:00:1f.4 SMBus: Intel Corporation Alder Lake PCH-P SMBus Host Controller (rev 01)
	Subsystem: Acer Incorporated [ALI] Device 161d
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 15
	Region 0: Memory at 601f27c000 (64-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at efa0 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c20
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


