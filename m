Return-Path: <linux-gpio+bounces-37972-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BtKgKwQhImpaSwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37972-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:06:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD56443F5
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 03:06:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=xz+fwOG4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37972-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37972-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4EE305E375
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 01:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FC6308F0A;
	Fri,  5 Jun 2026 01:00:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE952472A2
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621242; cv=none; b=uXxsUt9rv0eXSBBEnEf5Hv0xfc76cqJ0giArVMwaKWlno2Sk+XaCxhtUIWrH8uNsNtyM1v5o6TCi8Ij+7TKzNWmvStGAKAhycHLGKH85h0v7S7zHARrf06Z6oUpqOixn0ZjwAbVuI2v2Whxp/7oUyp8YB1pJ5wz9OS+nXZRvBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621242; c=relaxed/simple;
	bh=W29pTaZXmRQCy8zecxMQOvUhWVemZ1uTRB6lBfDis6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufSDlK6vCRJjS/fWHfOoryXZfG6xMUt7xPjunyFdd4caqgXea9RZOt8duv5oGgAOCWKek2NOCmx8NvvePfsxi2TAlhNBChrd77DCsHnb3MrVO42UHdelENMRWe0PPwmatt49I6C0xP64C9hDKJjDt7Xp1hf7FdlrgPE7pSwkldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xz+fwOG4; arc=none smtp.client-ip=209.85.167.179
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-48657fc84a3so1039579b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621229; x=1781226029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqbmcXSAlAGCA27gHjydvmcFDD6CfDKTo92atFvy+XY=;
        b=xz+fwOG4pycobLAgfxkU4KLBJINw1D8hoqQHn2Ti4KNirWS5Aymo3xd5KBgbv5ob84
         cjxU7eNuMZoM/58qeaETz1287QeOB++jCtTAvKLaKqZDhuRR2fXxZ3zI63EuLB9d8ey0
         fM9T96jf4KO8vNhS1nX8ONubY3d2+tQXwAEjZTvb52XfI+IBGAB1HUeWUWNhF8WJOcEE
         niwMUznmzQEdOse2E4oUt3hN4zKwqcZif+3LPR5iOzcIHy1FPYmun3O3KSt8qdDTbb9y
         43sBtJqCWjPxo8lPVWlXVNRurKILPj1nCjsBX/QCbwzoubn08J9jHa241mixlxy/iKDr
         R3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621229; x=1781226029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqbmcXSAlAGCA27gHjydvmcFDD6CfDKTo92atFvy+XY=;
        b=e7FOVkssXR0HVE0uk8+x06tw+bENYwrbpGVelqXHHacv0nkYhhl3ns/OvB5WrIiqZi
         Mu9AzzvmbgpXj+vSx4nPz1b/M2ntaMqX3987Ewti5rQ3emn7P2bIUIeEEwhbPRMZ7t9S
         /CpEuqvsa4od2p7GaI40nIZ8EGePegxP6DoFQpWo5eB/rIpTNmDTRF9jdQhuKrNaNQ9U
         UYx5mzTj/jRYwGBy5k7AwC8NDE2H8vLFmKM4apmyHwP10ArXQu4KR2HOwIxcCn44SkoT
         bXt6ywHF3uDm0S5nUIV0kPpxGPQYOnhJODIkXwHqppYUwQLlbPfYcifSDwl4LnGtIncx
         Bb0A==
X-Forwarded-Encrypted: i=1; AFNElJ/YXD6cz0M3Fh7O90EugSz3fGi0PWazgDBHdmz7We7EvV8GZajMFBYUSAkYLKEfY+u5ClQ1cLnuMeVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBjJWeAKRSSj4J36ubpfbEBaxnmGnX0FvDB1WminExxYiOnDs
	mxT9JrIlV4c0hhf2r/VqKEjMuCkDUDH4GDefcrXqqZoJpHlOwbulh+lbohgjNuGaW4I=
X-Gm-Gg: Acq92OHBkSzoCTcxwlbYfF04NR6r3VKfXpwutV7Ub1M0T08KM8Z5Gwn6KBkX2H+mTYx
	+xpP5G2G6MvwfzSZPVLWFr4c8MJNBmVfUPfuvamu4AjEFb/R8oB5biGTJzZcaEY+nY3md3jQ5DC
	/gEMYf1gJOyVNvBMjbFAEjMpnMg9rrUcfRmuw3mvCa028f20kQAtqeTV4ERSpKG8QVkphtU8egS
	tz6Zjo6fEdOsMcbLR+u+/KzfBaIayhTLR2F9qRD0hj63k9UQGvFtfWvLvgYBYviAF0eUL21X1Yd
	ZGrr7xhUZk7P1GIthuH+0rh8za1jGrQ/RyiIiYkOn/88+GbOMjs0fCRKBrgwPpTQfV3fvp7hbXH
	FOzx9OLKptM3Cu1CkWq7P4TokrIKVnjjcUhzxA6ou+69+jdnKvuRBfL+bWb6zaTGrNUHw3ik8DF
	fnRM+r5q5qFCfeAHMWHzEL8OMicQIkbQbhHA+m3Q==
X-Received: by 2002:a05:6808:2508:b0:485:4c7a:898f with SMTP id 5614622812f47-4868ddf9d5dmr723329b6e.17.1780621228591;
        Thu, 04 Jun 2026 18:00:28 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:28 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 00/14] net: enable TC956x support
Date: Thu,  4 Jun 2026 20:00:07 -0500
Message-ID: <20260605010022.968612-1-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37972-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:elder@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@k
 ernel.org,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51CD56443F5

(A fairly detailed list of changes since v1 is included below.
Because there are so many changes listed, they are not repeated
in the individual patches that follow.  Note also that this
series depends on two prerequisite commits, as explained below.)

This series introduces stmmac driver support for the Toshiba TC9564
(also known as Qualcomm QPS615).  This is an Ethernet-AVB/TSN bridge IC
that provides a high-speed connection between a host SoC and Ethernet
devices on a network.  It incorporates a PCIe switch, and implements
two 10 Gbps capable Ethernet MACs (along with other IP blocks), and
is essentially a small and highly-specialized SoC.  The TC9564 is a
member of a family of similar chips, and the driver code uses "tc956x"
to reflect this.

TC956x chips incorporate a PCIe gen 3 switch, with one upstream and
three downstream ports.  Its PCIe functionality is already supported
upstream, including a power control driver that performs some early
configuration of the PCI ports ("pci-pwrctrl-tc9563.c").

One of the PCIe switch's downstream ports has an internal PCIe endpoint,
which implements two PCIe functions, each of which has an Ethernet MAC
(eMAC) subsystem. The eMAC is composed of a Synopsis Designware XGMAC
combined with an XPCS and PMA.  Each MAC is capable of operating at
10M/100M/1G/2.5G/5Gps and 10Gps.  The initial target platform is the
Qualcomm RB3gen2, which supports a 10Gbps Marvell PHY on port A, and
a 2.5Gbps Qualcomm PHY on port B.  (The Marvell PHY is not populated
on all RB3gen2 boards, and only the 2.5 Gbps Qualcomm PHY is supported
initially.)

TC956x chips also implement several other blocks of functionality,
including a GPIO controller, interrupt controllers (MSIGEN), I2C
and SPI, a UART, and an Arm Cortex M3 CPU with 128KB SRAM.  The GPIO
interface exposes several lines to manage external resets.  The
interrupt controllers are used internally by the eMAC functions.  The
UART, SPI, microcontroller, and SRAM are currently unused.

              ----------------------------------
              |              Host              |
              ------+...+----------+........+---
                    |i2c|          |  PCIe  |
    ----------------+...+----------+........+------
    | TC956x        |I2C|          |upstream|     |
    |               -----        --+--------+---  |
    |  -----  ------  -------    | PCIe switch |  |
    |  |SPI|  |GPIO|  |reset|    |             |  |
    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
    |                 -------    ---++--++--++--  |
    |  -----  ------     downstream//    \\  \\   |  downstream
    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
    |  -----  ------   //PCIe port 3       \\     |
    |                  ||                   \======= downstream
    |  ----+-----------++-----------+----         |  PCIe port 2
    |  | M | internal PCIe endpoint | M |         |
    |  | S |------------------------| S |  ------ |
    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
    |  | G |function 0|  |function 1| G |  ------ |
    |  | E |----++----|  |----++----| E |         |
    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
    --------+.......+------+.....+-----------------
            |USXGMII|      |SGMII|
          --+.......+--  --+.....+--
          |  ARQ113C  |  | QEP8121 |
          |    PHY    |  |   PHY   |
          -------------  -----------

The primary objective for this series is to support the Ethernet
functionality provided by the TC956x.  The code providing this
support has been structured into three distinct modules.
  - A "chip" driver, associated with the PCIe functions
  - A driver for the GPIO controller
  - Code enabling the TC956x-specific eMAC/MSIGEN hardware

To manage the common functionality (including configuring address
translation and controlling internal reset and clock signals), a
"chip" driver is implemented.  The chip driver binds to PCI
functions 0 and 1, and creates a shared data structure describing
the common chip elements shared by the two driver instances.  PCIe
function 1 defers probing until after PCIe function 0 has created
this shared data structure.

Common/shared functionality is handled by PCIe function 0.  This
common code uses PCIe function 0's mapped BARs to configure the
hardware.  If the TC9564 GPIO controller is needed (i.e., defined
in a node in devicetree), it is created as an auxiliary device
when PCIe function 0 is probed.

Both PCIe function 0 and function 1 implement an Ethernet
controller as well, though one or the other might be unused on
a given platform.  If a PCIe function node defines an ethernet
subnode in devicetree, the corresponding eMAC is enabled, and
the PCIe function driver will create an auxiliary device to
represent it.

The GPIO driver is implemented separately because in some hardware
configurations, these GPIO lines are used to manage resets for
external Ethernet PHYs.  We describe these PHYs via devicetree,
where the GPIO-based reset signals are defined using phandles.

The code for eMAC and MSIGEN consists of a new source file that
populates hardware-specific details about the two MACs, and integrates
with the existing stmmac driver.  This also required implementing some
enhancements to the core stmmac driver, described further below.

The version of the Synopsys MAC IP is 3.01, which is largely compatible
with version 2.20.  The core stmmac driver required several changes to
enable support for the TC956x.
  - A change to dwxgmac2 support changes the interrupt mode when
    multi_msi_en is enabled.
  - While most support for version 3.01 simply uses the 2.20 code,
    an erratum related to the RX ring length is implemented for
    3.01 DMA operations.
  - Having the PCIe device be separate from an auxiliarly device
    implementing the eMAC required allowing a distinct DMA device
    to be maintained for an stmmac interface.

In addition:
  - A new source file provides memory-mapped access to XPCS using
    regmap.  The alignment of the TC956x MDIO registers aren't
    suitable for using simple MMIO.
  - Two additional XPCS changes are implemented that provides
    support for the XPCS as implemented in the TC956x.

NOTE:
    This series is based on net-next/main, but depends on these
    two commits found in linux-next/master:

	68d801eabda52 gpio: regmap: Support sparsed fixed direction
	806e7acf7f331 gpio: regmap: Don't set a fixed direction line
       
					-Alex (and Daniel)

This series is available here:
  https://github.com/riscstar/linux/tree/tc956x/stmmac-v2

Changes between version 1 and version 2:

NEW
  - The qca808x.c PHY driver now supports enabling up to four optional
    regulators

GENERAL
  - The order of patches has been rearranged a bit.  One consequence
    is that the TOSHIBA_TC956X_PCI Kconfig symbol is now defined
    before it's used.

PATCH 00/12
  - MAINTAINERS entries have been added for all new files

PATCH 01/12
  - devm_xpcs_regmap_register() now ensures the xpcs_destroy() is
    called when the device is unbound (suggested by Sashiko).

PATCH 02/12
  - Reworked how the quirky behavior was handled.  Now:
    - A soft reset is issued in xpcs_pre_config() *before* calling
      xpcs_switch_interface_mode() calls txgbe_xpcs_switch_mode().
      It does this now for an SGMII interface, not just if the
      need-reset flag is set
    - xpcs_switch_interface_mode() calls txgbe_xpcs_switch_mode(),
      preserving previous behavior
    - For other (non-Wangxun) platforms, if the XPCS supports
      10Gbase-R, xpcs_switch_interface_mode() programs the interface
      operating mode to use a reserved value rather than the default

PATCH 03/12
    - This change has been removed; the default_an_inband platform
      data flag is set instead (in what was previously patch 10)
      
PATCH 04/12
    - Two issues were pointed out by Sashiko, both of which were
      problems related to DMA handling.  They were pre-existing
      issues, and I plan to send separate patches to address
      them.
    - A mask local variable (to shorten a long line) is no longer
      created.  Checkpatch no longer complains about that line.

PATCH 05/12
    - The description was clarified a bit in response to a comment
      from Andrew

PATCH 06/12
  - No comments received, no changes

PATCH 07/12
  - Sashiko suggested that exporting some symbols from the stmmac
    core might not be desirable, and suggested using the standard
    DMA API to accomplish the same thing.  For now we are igoring
    this suggestion--not finding a way to do what was suggested.

PATCH 08/12
  - The description has been revised to focus on the hardware and
    not the "node".
  - The ASCII art (copied from below) has been incorporated into the
    binding
  - The file name has been changed to "toshiba,tc9564-dwmac.yaml" and
    the $id value matches the file name
  - Only one example is provided now
  - The references and unevaluatedProperties have been moved later
    in the file
  - We no longer reference "pci-bus-common.yaml".  We are describing
    a device, not a bridge.
  - Subnodes have been added to represent the GPIO controller (on
    PCIe function 0) and the Ethernet interfaces (possible on PCIe
    functions 0 and 1).

PATCH 09/12
  - The GPIO controller is now implemented using regmap-gpio
  - The Kconfig entry for the GPIO driver has been updated to select
    GPIO_REGMAP, and to define its default value as "m" unconditionally
  - The Kconfig entry is now defined in the memory-mapped GPIO section
  - The regmap use has been adjusted so it's clear it is MMIO-based,
    which normally does not require error checking.
  - We no longer call drv_get_drvdata()

PATCH 10/12
  - The name of the IRQ domain now includes the MAC ID (0 or 1)
  - SP_SEL_SGMII_2500M is now named SP_SEL_2500BASEX
  - A typo in the commit has been fixed, and the error check after creating
    the RX IRQ mapping now checks the right pointer for an error
  - The Kconfig entry now selects GENERIC_IRQ_CHIP
  - The PHY interface is now taken into account in the fix_max_speed
    callback
  - We now check the correct pointer for an error when creating the RX
    IRQ mappings
  - We are not implementing a shutdown driver callback
  - Xilin has other discussion related to WoL, which we should save
    and use, but we're not acting on it now.
  - In four function, Sashiko noted that a 32-bit dma_addr_t can't hold
    TC956X_SLV00_SRC_ADDR, so the type of local variable has been changed
    to be u64: tc956x_dma_init_rx_chan(), tc956x_dma_init_tx_chan(),
    tc956x_desc_set_addr(), and tc956x_desc_set_sec_addr().
  - tc956x_mac_disable() is now called if stmmac_dvr_probe() fails;
    suggested by Sashiko.
  - Sashiko noted the MDIO device tree node was being leaked.  This
    has been resolved.
  - Sashiko also pointed out that IRQ mappings were not being freed,
    and this too is fixed.

PATCH 11/12
  - The reset and clock functions are no longer defined inline
  - The REFCLK clock name has been renamed REFCLKO, and a comment
    has been added to explain it is an (unused) output clock.
  - If the PCI device has no DT node it is reported with dev_err().
  - <linux/bitfield.h> is now included, to avoid errors in various
    non-Arm64 builds.
  - The devicetree Ethernet node is no longer leaked in adev_device_add()
    (noticed by Sashiko).
  - The Kconfig entry now depends on ARM64 or COMPILE_TEST
  - The Kconfig entry now selects REGMAP and REGMAP_MMIO
  - Sashiko reported that the reference count on the PCIe slot
    for function 0 was being leaked.  This has been fixed.
  - Sashiko questioned whether the cleanup action to delete
    a created device link was associated with the wrong device.
    It was, and this has been fixed.
  - Sashiko also suggested that the allocated PCI IRQ vector
    was not properly getting removed.  It now is.
  - Sashiko suggested that function 1 might proceed with probing
    even though there was still a chance that function 0's probe
    failed.  The platform_data pointer that function 1 uses to
    decide it's OK to probe is now assigned later.

PATCH 12/12
  - The PHY interrupt is now defined as a level interrupt.
  - A typo in the PHY name has been corrected in the patch description

Here is the initial version of the series.
  https://lore.kernel.org/netdev/20260501155421.3329862-1-elder@riscstar.com/

Alex Elder (3):
  net: stmmac: dma: create a separate dma_device pointer
  misc: tc956x_pci: add TC956x/QPS615 support
  gpio: tc956x: add TC956x/QPS615 support

Daniel Thompson (11):
  dt-bindings: net: qca,qca808x: Add regulator properties
  net: phy: qcom: qca808x: Add regulator management
  net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
    regmap
  net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
  net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
  net: stmmac: dwxgmac2: Add multi MSI interrupt mode
  net: stmmac: dwxgmac2: Add XGMAC 3.01a support
  net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
  dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
  net: stmmac: tc956x: add TC956x/QPS615 support
  arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081
    phy

 .../devicetree/bindings/net/qca,qca808x.yaml  |  14 +
 .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 +++
 MAINTAINERS                                   |  12 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  48 +
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-tc956x.c                    | 130 +++
 drivers/misc/Kconfig                          |  12 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc956x_pci.c                     | 741 ++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
 .../net/ethernet/stmicro/stmmac/chain_mode.c  |  12 +-
 .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  12 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  79 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   |  12 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  58 +-
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
 drivers/net/pcs/Makefile                      |   4 +-
 drivers/net/pcs/pcs-xpcs-regmap.c             | 219 +++++
 drivers/net/pcs/pcs-xpcs.c                    |  93 +-
 drivers/net/phy/qcom/qca808x.c                |  30 +
 include/linux/pcs/pcs-xpcs-regmap.h           |  20 +
 include/linux/stmmac.h                        |   1 +
 include/soc/toshiba/tc956x-dwmac.h            |  84 ++
 29 files changed, 2478 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
 create mode 100644 drivers/gpio/gpio-tc956x.c
 create mode 100644 drivers/misc/tc956x_pci.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
 create mode 100644 include/soc/toshiba/tc956x-dwmac.h

base-commit: 07c4bca9d92e51ab6b46797a86c6ea559812351a
-- 
2.51.0


