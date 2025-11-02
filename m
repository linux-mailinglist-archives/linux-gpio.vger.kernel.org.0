Return-Path: <linux-gpio+bounces-27926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E4C28F48
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 13:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6EB3B06F5
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16927FB1F;
	Sun,  2 Nov 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJfZmQna"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5921D555
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762087236; cv=none; b=i19YIuApuHBalcIm+mqvTUEzkpVy27bkv0bnDKOVDPW7L7F7NEBEug5Ix+CDIzEjX8pcL/IPGsu4TtchqKlUMyetwAIJm/gjVr3Sh+Ho5oUXzznigNzUy8aKr8GtflDWyL+PjAzD9cFfp6R6kkcu2QmvfQ3DErGeuLnsx76teD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762087236; c=relaxed/simple;
	bh=Nelf+f4cE/KpgdhbdIrmHKijZX/mGmhSZtP/EDsRUqo=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=tdxfSpeUdV1JaC3/uQ/DpHx7IevJfiUP7BRWomekpVoicdWdQ1+w18qx7rkxHTQ25z9Yci7aWVRr/3amT+OOGRtB+w+UETGIYzotRdJ7Z+cVoeMv/e6kToTvH35QAfHBVdtH0/CYehwP1/8D4qu7aIK+ymxu989uMAtAUfqOUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJfZmQna; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C46C4CEF7
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762087235;
	bh=Nelf+f4cE/KpgdhbdIrmHKijZX/mGmhSZtP/EDsRUqo=;
	h=From:Date:To:Subject:From;
	b=pJfZmQnapp8J4WFoTL8Ttp7phz1L10NiF8fcrwTom3K3BAbYtwysuh9/B1aDCRrpe
	 TfxPnAthq5h//8aBRtUzprzVbcb0if4C7qRpbrIXh8npmCHtfdwldxnqCZL0zs1ks9
	 H7tE2D/uiMaPmuIOX6qBuTYRkVJz1fATGBAVTt8i7Q6KaR/YH+YY8AovBcljjVR2rI
	 mtAvuwOe32x8TwImIQB1w1mVsRSFCCHv4Mm3n5k/j1xmZ0erzomv13/GXTENJJF4UO
	 IWb1zcXFCz+vJ/RjRFwZFvZ+u1533e/RlLHsnSv+7KRBpLukvNdWzY+bmkQfcoXYpN
	 rHuXcBASPbBwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 327293809A00
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:12 +0000 (UTC)
From: linux4all via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 02 Nov 2025 12:40:09 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251102-b220734c0-8824a4f6fe88@bugzilla.kernel.org>
Subject: amd_gpio AMDI0030:00: iomux not supported
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

linux4all writes via Kernel.org Bugzilla:

OS: openSuSE Leap 15.3

Hardware:
  Board Info: #2
    Manufacturer: "ASRock"
    Product: "A300M-STX"
    Serial: "M80-CA020800030"
    Type: 0x0a (Motherboard)
    Features: 0x09
  SMBIOS Version: 3.2
  BIOS Info: #0
    Vendor: "American Megatrends Inc."
    Version: "P3.70"
    Date: "11/02/2020"
    Start Address: 0xf0000
    ROM Size: 16384 kB
    Features: 0x0d03000000013f8b9880
      PCI supported
      BIOS flashable
      BIOS shadowing allowed
      CD boot supported
      Selectable boot supported
      BIOS ROM socketed
      EDD spec supported
      1.2MB Floppy supported
      720kB Floppy supported
      2.88MB Floppy supported
      Print Screen supported
      8042 Keyboard Services supported
      Serial Services supported
      Printer Services supported
      ACPI supported
      USB Legacy supported
      BIOS Boot Spec supported
  Processor Info: #16
    Socket: "AM4"
    Socket Type: 0x31 (Other)
    Socket Status: Populated
    Type: 0x03 (CPU)
    Family: 0x6b (Other)
    Manufacturer: "Advanced Micro Devices, Inc."
    Version: "AMD Ryzen 5 3400G with Radeon Vega Graphics"
    Serial: "Unknown"
    Asset Tag: "Unknown"
    Part Number: "Unknown"
    Processor ID: 0x178bfbff00810f81
    Status: 0x01 (Enabled)
    Voltage: 1.5 V
    External Clock: 100 MHz
    Max. Speed: 4200 MHz
    Current Speed: 3700 MHz
    L1 Cache: #13
    L2 Cache: #14
    L3 Cache: #15
  32bit-Memory Error Info: #17
    Type: 0x03 (OK)
    Granularity: 0x02 (Unknown)
    Operation: 0x02 (Unknown)

dmesg 
[    0.000000] Linux version 6.17.6-jk (root@Cirrus7) (gcc (SUSE Linux) 12.2.1 20220830 [revision e927d1cf141f221c5a32574bde0913307e140984], GNU ld (GNU Binutils; SUSE Linux Enterprise 15) 2.39.0.20220810-150100.7.40) #1 SMP PREEMPT_DYNAMIC Thu Oct 30 10:35:02 CET 2025
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.17.6-jk root=/dev/mapper/2Tb-root splash=silent resume=/dev/8Tb/swap quiet mitigations=auto amdgpu.noretry=0 mem_encrypt=off

[    0.384543] io scheduler bfq registered
[    0.384712] amd_gpio AMDI0030:00: iomux not supported
[    0.384716] amd_gpio AMDI0030:00: try to register 183 pins ...

View: https://bugzilla.kernel.org/show_bug.cgi?id=220734#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


