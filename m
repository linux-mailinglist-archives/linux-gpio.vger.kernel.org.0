Return-Path: <linux-gpio+bounces-39909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DKZYM0evUmpSSQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:01:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B054742E0F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=caKqo02X;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39909-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39909-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 172443013848
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46985314A9E;
	Sat, 11 Jul 2026 21:01:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009161D95A3;
	Sat, 11 Jul 2026 21:01:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803717; cv=none; b=q5LR4WJCWnReTqQ/zHyygM0CuAei+kdl656PJV+xnXPA6XwRUByct3ncREumJnfvo07/HVztGX9Ehhsx90eAuc456Aqmb3rSpohTjsTJGtI5YQone8q7ZP3CROP4b1FKBxpKvbjHiqO5L2T8UEL5ILbeCdu9BM3uTt4zkMDzWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803717; c=relaxed/simple;
	bh=d2TbjcNG+rAGinbwS7nExGx6R+2yw7dFXBna0/jmTW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6cQbI4WdUQPdp3zP0bH6UVW3bsubBa9gXpSaPeI3aaKX7HAGLT4ZffjCb7wtlPVw/LDU/BdeNxM4FYO30ug55bggxIBSk52qqFBUvz3vfIs+rVws532KD57G0+8+zpg5SjNMzGYhBkAb7yMLeTvq4/zMD2iNzjCau26LjoQzls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=caKqo02X; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0EDA11955F;
	Sat, 11 Jul 2026 23:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Rj799asYESt2ZmvriKsA91s4jrkLenTh+VOfuk6Qwy8=;
	b=caKqo02Xhwa5z3geI79f/1mpYhZ8RaxILEV+m24lrur9xhFIWkYGbtXT4N2ZDOi2WEihi1
	/eT3e4HNKMxb8p5u19XO0y0YQ/JCH8axaTWfEB+b8PWbIXHY7FgcNNg9qsjT880iVGupwj
	b7riLwpThRoOXlpF2ZaXBU+ZjKV8obL/lqBtQsyiD8DNlZLdbu5u7z6ej3EDqBZ8v0wQGE
	bkL9PvjjFUow6Gs9DNVVVMCTm44vKenFMxgC8GId2NH2UsYrUaT1woqq4Rf06cH6MLXhii
	gRqZGMOQfLjA3rlRIuOhhlfpB/3kE6cHXjC9mBdkXl5vu/+SrrS+q0a6AgZ0Zw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/10] arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Date: Sat, 11 Jul 2026 22:59:29 +0200
Message-ID: <20260711210131.236025-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39909-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[nabladev.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B054742E0F

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Marek Vasut (10):
  dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM
    and Breakout Board and DHSBC
  dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
  arm64: dts: st: Fix SDMMC1 indent on stm32mp231
  arm64: dts: st: Fix SDMMC1 indent on stm32mp251
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
  arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp251
  arm64: dts: st: Add OMM node on stm32mp231
  arm64: dts: st: Add pinmux nodes for DH electronics
    STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
  arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx
    DHCOS SoM and Breakout Board and DHSBC
  MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address

 .../devicetree/bindings/arm/stm32/stm32.yaml  |  18 +
 .../bindings/gpio/gpio-pca95xx.yaml           |   3 +
 MAINTAINERS                                   |   3 +-
 arch/arm64/boot/dts/st/Makefile               |  10 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  86 ++-
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp23xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    |  51 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 564 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  32 +-
 ...mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso | 111 ++++
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 189 ++++++
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp25xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    |  51 ++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 442 ++++++++++++++
 16 files changed, 1601 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi

---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

-- 
2.53.0


