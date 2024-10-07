Return-Path: <linux-gpio+bounces-10969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2899314E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8268283865
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 15:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8051D8E14;
	Mon,  7 Oct 2024 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="XUSdbYE/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0285125B9;
	Mon,  7 Oct 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315277; cv=none; b=hxxKPK3jcIBHJ/pBzLalPLuDZZ1xC+meLvsgyfPROH+JuMfCE60btEunMdkSoI1o+KoqdOn/U/i//aPK7EkI4rmx7LFNSFqBWGFxA2Djz3IBZP7nF+/62+3aS6s2po70PJBIyOIcnThqUDbWVsOGOlq8iiKxO72+B7zJHHLY/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315277; c=relaxed/simple;
	bh=8GMwkqkKcW/+VQjyMBni5YMGJslvG+i9TFyetnJVeSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SW8NlfUCaT3rsh15V3/IH4Z56gPl9SLoTfg0PnJ5jYW7vcgKBTiyv5JKIRD3iv+loXHbPPXW9z8K7xUiTfjPejvZlZ8kT9RLmzK6wGlxQ+lx9YbSk2WcbufxUGXusItRc/gmE5E5mZfekHJrSLzCxJx88S2g9BKO+tvzHrack3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=XUSdbYE/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 74B5023E90;
	Mon,  7 Oct 2024 17:34:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL0UiTgmvZOa; Mon,  7 Oct 2024 17:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728315264;
	bh=8GMwkqkKcW/+VQjyMBni5YMGJslvG+i9TFyetnJVeSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XUSdbYE/h5uP5gRvyn0Unu7VpQoMCF9S24mcv3HBGtKTFqQj6mOdKfGOwzspgEcmH
	 lvbWGCw6OTmYwoa7UHHpU2SN/nSFiiNHjHY4vODlcYCRKziMFv1ioVgLYvh3W+nHOt
	 1UoZgRdrmJoephEK+/kHXZOnO0fkzFoaxEj3lRiFy6yC6F2mULxDkrqp/D6nUTG6fC
	 FHfk9X7WJR1OLph5OmdoYkhdSVrHOTNqTMlB/boIfVNOqL3iT1cKvIQwXv65QZJ2cB
	 UJBFQ4RMJ5No3xUdcTD5jQKiPNpJd+x1ZoieAQpIlX++LrFMmvxZ5GTAKS/DLTh8fn
	 7H8RRtcpH6KYg==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Mon,  7 Oct 2024 23:32:52 +0800
Message-ID: <20241007153252.31449-1-exxxxkc@getgoogleoff.me>
In-Reply-To: <CACRpkdZnBBAEgHZ=HShwvaXaN-6icC5hzwHqDNWWy_PKJDh+Fw@mail.gmail.com>
References: <CACRpkdZnBBAEgHZ=HShwvaXaN-6icC5hzwHqDNWWy_PKJDh+Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=0DCBT U-Boot ver: 3.2.08  ([IPQ5018].[SPF11.3].[CSU2])=0D
=0D=0D
=0DDRAM:  smem ram ptable found: ver: 1 len: 4=0D
=0D512 MiB=0D
=0DNAND:  QPIC controller support serial NAND=0D
=0DID =3D 22c822c8=0D
=0DVendor =3D c8=0D
=0DDevice =3D 22=0D
=0DSerial Nand Device Found With ID : 0xc8 0x22=0D
=0DSerial NAND device Manufacturer:GD5F2GQ5REYIH=0D
=0DDevice Size:256 MiB, Page size:2048, Spare Size:64, ECC:4-bit=0D
=0DSF: Unsupported flash IDs: manuf 00, jedec 0000, ext_jedec 0000=0D
=0Dipq_spi: SPI Flash not found (bus/cs/speed/mode) =3D (0/0/48000000/0)=0D
=0D256 MiB=0D
=0DMMC:   sdhci: Node Not found, skipping initialization=0D
=0D=0D
=0DPCI Link Intialized=0D
=0DPCI1 is not defined in the device tree=0D
=0DIn:    serial@78AF000=0D
=0DOut:   serial@78AF000=0D
=0DErr:   serial@78AF000=0D
=0Dmachid: 8040001=0D
=0Deth0 MAC Address from ART is not valid=0D
=0Deth1 MAC Address from ART is not valid=0D
=0D=0D
=0DUpdating boot_count ... done=0D
=0D=0D
=0DSaving Environment to NAND...=0D
=0DErasing NAND...=0D
=0D=0DErasing at 0x5c0000 --  25% complete.=0DErasing at 0x5e0000 --  50% c=
omplete.=0DErasing at 0x600000 --  75% complete.=0DErasing at 0x620000 -- 1=
00% complete.=0D
=0DWriting to NAND... OK=0D
=0DHit any key to stop autoboot:  3 =08=08=08 2 =08=08=08 1 =08=08=08 0 =0D
=0Dstarting USB...=0D
=0DUSB0:   Register 2000140 NbrPorts 2=0D
=0DStarting the controller=0D
=0DUSB XHCI 1.10=0D
=0Dscanning bus 0 for devices... 2 USB Device(s) found=0D
=0Dreading boot-image.itb=0D
=0D16048071 bytes read in 8855 ms (1.7 MiB/s)=0D
=0D## Loading kernel from FIT Image at 44000000 ...=0D
=0D   Using 'standard' configuration=0D
=0D   Trying 'kernel' kernel subimage=0D
=0D     Description:  Kernel=0D
=0D     Type:         Kernel Image=0D
=0D     Compression:  uncompressed=0D
=0D     Data Start:   0x440000a8=0D
=0D     Data Size:    8249289 Bytes =3D 7.9 MiB=0D
=0D     Architecture: AArch64=0D
=0D     OS:           Linux=0D
=0D     Load Address: 0x41208000=0D
=0D     Entry Point:  0x41208000=0D
=0D   Verifying Hash Integrity ... OK=0D
=0D## Loading ramdisk from FIT Image at 44000000 ...=0D
=0D   Using 'standard' configuration=0D
=0D   Trying 'initrd' ramdisk subimage=0D
=0D     Description:  Initramfs image=0D
=0D     Type:         RAMDisk Image=0D
=0D     Compression:  Unknown Compression=0D
=0D     Data Start:   0x447ec43c=0D
=0D     Data Size:    7738968 Bytes =3D 7.4 MiB=0D
=0D     Architecture: AArch64=0D
=0D     OS:           Linux=0D
=0D     Load Address: unavailable=0D
=0D     Entry Point:  unavailable=0D
=0D   Verifying Hash Integrity ... OK=0D
=0D## Loading fdt from FIT Image at 44000000 ...=0D
=0D   Using 'standard' configuration=0D
=0D   Trying 'fdt' fdt subimage=0D
=0D     Description:  DTB=0D
=0D     Type:         Flat Device Tree=0D
=0D     Compression:  uncompressed=0D
=0D     Data Start:   0x447de10c=0D
=0D     Data Size:    58042 Bytes =3D 56.7 KiB=0D
=0D     Architecture: AArch64=0D
=0D   Verifying Hash Integrity ... OK=0D
=0D   Booting using the fdt blob at 0x447de10c=0D
=0D   Loading Kernel Image ... OK=0D
=0D   Loading Ramdisk to 4a0c0000, end 4a821658 ... OK=0D
=0D   Loading Device Tree to 4a0ae000, end 4a0bf2b9 ... OK=0D
=0Dfdt_fixup_qpic: QPIC: unable to find node '/soc/qpic-nand@79b0000'=0D
=0DCould not find PCI in device tree=0D
=0DUsing machid 0x8040001 from environment=0D
=0D=0D
=0DStarting kernel ...=0D
=0D=0D
=0Dundefined instruction=0D
=0Dpc : [<41208004>]	   lr : [<4a921f8f>]=0D
=0Dreloc pc : [<41208004>]	   lr : [<4a921f8f>]=0D
=0Dsp : 4a822838  ip : 00000001	 fp : 00000000=0D
=0Dr10: 4a83b914  r9 : 4a822ea0	 r8 : 00000000=0D
=0Dr7 : 00000000  r6 : 41208000	 r5 : 4a97d848  r4 : 00000000=0D
=0Dr3 : 644d5241  r2 : 4a0ae000	 r1 : 08040001  r0 : 00000000=0D
=0DFlags: nzCV  IRQs off  FIQs off  Mode SVC_32=0D
=0DResetting CPU ...=0D
=0D=0D
=0Dresetting ...=0D
=0D

