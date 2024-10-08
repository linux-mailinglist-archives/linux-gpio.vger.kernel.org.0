Return-Path: <linux-gpio+bounces-11037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11899492A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B88CEB21B2A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 12:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA701DE8BD;
	Tue,  8 Oct 2024 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="pwUIxftX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060431D12EA;
	Tue,  8 Oct 2024 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390000; cv=none; b=Yo8v49aqsvkjsAYoxp+QWY0GkXWEsPgyOdhQw7ezK0qsGlTrmHRErUaAdJztUEdwamusQrY2RevcV1UlBwPoxIWVojz5du+fVxyACY3M+6hvCh4e+hBTHaagn20QuTuKD5TC8oFv4k7/hwhXnkyQz3FSibvzDFA0DsHpdACZTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390000; c=relaxed/simple;
	bh=c4BHYJvWUQYE6LoO0flq5esmA5WZr5DYIqfhtUFQetw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glyL4FDNfOJy42jS/MqVcZELZIJGi8l5MlS54xnJVHDC932CNMycMmb+HX9LwqVngY4+P+XTeGfzY7+/LN4n/8U0EACX6NVeg+RqcwFiw2srvP6vUxzymAuWyApmSB4VUitpsE87h2Sa9UMZU5y2gIFMiYrm4ekoMlRu2UQRtTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=pwUIxftX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB6DC23E90;
	Tue,  8 Oct 2024 14:19:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQSHw2jR1W4o; Tue,  8 Oct 2024 14:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728389994;
	bh=c4BHYJvWUQYE6LoO0flq5esmA5WZr5DYIqfhtUFQetw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pwUIxftXm7MWh9BUVzD7w3V5AZssvvyCB/LCjMXmhQpoFxbpC1fqzXsSY3LOobAaJ
	 TtvMVdXwWNhusrnF8Nw20h0RrDQJgEN0twlzzf2rT6Vkr98vKBhfGwTersI5Ecqlj3
	 ggcS7NcEtE+KiBRN9+62To5Uuw8CjKmiPbGqmY/WcFjKxKLMs6eoH48m+PDGbOhmXe
	 4IXrO7bJ3kWcSuHSAKkpJfPQ/LfxpJ0jkaoRGNBy5oFUp/iSJ2TuLkFFy/udYu6S66
	 fjt9/P0srikA2DZJkNqX3pcw4hjwRGPtQ3AN4X2/2flFDPQctlEC2z1M11CLHxvvVp
	 CrXGeplWmJn9Q==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linus.walleij@linaro.org
Cc: andersson@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	exxxxkc@getgoogleoff.me,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	sboyd@kernel.org,
	will@kernel.org
Subject: Re: Re: Re: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Tue,  8 Oct 2024 20:18:19 +0800
Message-ID: <20241008121819.16242-1-exxxxkc@getgoogleoff.me>
In-Reply-To: <CACRpkdaPBH1CE0YXGMKUDQWyJQTZvkYgnW=UTO2uxWmBvecu9g@mail.gmail.com>
References: <CACRpkdaPBH1CE0YXGMKUDQWyJQTZvkYgnW=UTO2uxWmBvecu9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=0D
=0D
I found a uboot for ipq5018 qcom reference boards https://git.codelinaro.or=
g/clo/qsdk/oss/boot/u-boot-2016 .Considering my router is quite similar to =
one of those boards so the uboot should workon EA9350 i think?=0D
=0D
Let me compile and try to chainload it from the stock uboot.(Btw I have nev=
er tried chainloading on qcom platform but i did try that on amlogic platfo=
rm.)=0D
=0D
=0D
U-Boot 2016.01 (Dec 06 2021 - 10:08:47 +0800)=0D
=0D
CBT U-Boot ver: 3.2.08  ([IPQ5018].[SPF11.3].[CSU2])=0D
=0D
DRAM:  smem ram ptable found: ver: 1 len: 4=0D
512 MiB=0D
NAND:  QPIC controller support serial NAND=0D
ID =3D 22c822c8=0D
Vendor =3D c8=0D
Device =3D 22=0D
Serial Nand Device Found With ID : 0xc8 0x22=0D
Serial NAND device Manufacturer:GD5F2GQ5REYIH=0D
Device Size:256 MiB, Page size:2048, Spare Size:64, ECC:4-bit=0D
SF: Unsupported flash IDs: manuf 00, jedec 0000, ext_jedec 0000=0D
ipq_spi: SPI Flash not found (bus/cs/speed/mode) =3D (0/0/48000000/0)=0D
256 MiB=0D
MMC:   sdhci: Node Not found, skipping initialization=0D
=0D
PCI Link Intialized=0D
PCI1 is not defined in the device tree=0D
In:    serial@78AF000=0D
Out:   serial@78AF000=0D
Err:   serial@78AF000=0D
machid: 8040001=0D
eth0 MAC Address from ART is not valid=0D
eth1 MAC Address from ART is not valid=0D
=0D
Updating boot_count ... done=0D
=0D
Hit any key to stop autoboot:  3 =08=08=08 0 =0D
=0D
Net:   cmbblk is stable 5=0D
MAC1 addr:0:11:22:33:44:55=0D
athrs17_reg_init: complete=0D
S17c init  done=0D
eth0=0D
Warning: eth0 MAC addresses don't match:=0D
Address in SROM is         00:11:22:33:44:55=0D
Address in environment is  00:03:7f:ba:db:ad=0D
=0D
IPQ5018# =0D=0D
IPQ5018# =0D=0D
IPQ5018# usb start=0D=0D
starting USB...=0D
USB0:   Register 2000140 NbrPorts 2=0D
Starting the controller=0D
USB XHCI 1.10=0D
scanning bus 0 for devices... 2 USB Device(s) found=0D
IPQ5018# fatload usb 0 ${loadaddr} u-boot.bin=0D=0D
reading u-boot.bin=0D
419816 bytes read in 261 ms (1.5 MiB/s)=0D
IPQ5018# go ${loadaddr}=0D=0D
## Starting application at 0x44000000 ...=0D
prefetch abort=0D
pc : [<44000004>]	   lr : [<4a92891b>]=0D
reloc pc : [<44000004>]	   lr : [<4a92891b>]=0D
sp : 4a822840  ip : 0000001c	 fp : 00000002=0D
r10: 00000000  r9 : 4a822ea0	 r8 : 4a97d300=0D
r7 : 4a9288f1  r6 : 00000002	 r5 : 44000000  r4 : 4a828b74=0D
r3 : 44000000  r2 : 4a828b74	 r1 : 4a828b74  r0 : 00000001=0D
Flags: nzCv  IRQs off  FIQs off  Mode SVC_32=0D
Resetting CPU ...=0D
=0D
resetting ...=0D
=0D
=0D

