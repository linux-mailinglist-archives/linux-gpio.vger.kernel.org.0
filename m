Return-Path: <linux-gpio+bounces-32639-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPGbJv2IqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32639-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:57:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33A21CB6F
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830A0308F810
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C66C37A4AF;
	Fri,  6 Mar 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wh24hjK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E60374748;
	Fri,  6 Mar 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783731; cv=none; b=nTlvF5Sf6fe4Pb09uIKbiqCiSz/ZXGD+qE8f8qY9jLzwYAaErIXwqnRqsuTtTG29GlNZZGWdGTwjih2vqIuK4OvgAweGCrr6drIvg9A/ubZ5amXtL5aDelSeAaRT92GetXzCaVYNdO+/9rMb2qauBlkrihESjmMTzmV3ZpEwKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783731; c=relaxed/simple;
	bh=zLU921ZFhF9f56oSiA8DEdFlhZLlCAc64EjM8o4e5RE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xgk/XZWHB/UCmS4cIC/2LuBE82cVOofjCQOJeeTwCZWKrYB7QCZyjqdkmIxjE2jYuNFcDWVftcoAxWoYA4aKDmMkxTdqmWcMJLaSS05kAzlCQs86XPxQRkAhryTPiNB9ikRkQDfIGVH81SgSflCfAP2Z1hpXC0Wwlq5VXJwbiAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wh24hjK6; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qjPgB2977146, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=UvHj03h/I8V3RUfnYlEIf/a5TXOtj70U30QVaTzHzeU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=wh24hjK662OtagrS9+2N4beB0XgB1RyFamThbEqSxYgOu2OqJ8NoxH5RgfEcWy5kR
	 A75lGQfbyHovj4lwSLh7e2ohjw3APkiK1F+Jg5YxjgWxZc9nMj51BAPneKaXnyRj8E
	 OwFPYxNg1tFvIFw0Y2v/wGH06CQe7+2msM8DHko5o56X++nMKCzeYu+5RD2Tb2ZNdu
	 HSFfBr6yO/jb2TFVgYhvkeWqsdIMq6UtNrecwq+eBL3WRZfQU2pNovKj6hlwZRwtgm
	 AnxNipMGe4bhQR+KdSv1EBXDlX9sQYg/maNaYCBMV7Q/uXB2UYRnRPSsNz9H+AWqt5
	 4EwHNY+I1IgPA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qjPgB2977146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:44 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:44 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 00/14] pinctrl: realtek: Core improvements and RTD1625 support
Date: Fri, 6 Mar 2026 15:52:30 +0800
Message-ID: <20260306075244.1170399-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 2A33A21CB6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32639-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series introduces pinctrl support for the Realtek RTD1625 SoC and adds device
nodes for the platform.

In addition to the new SoC support, this series improves the common Realtek pinctrl
library by:

1. Cleaning up license strings and correcting grammar error in error messages.
2. Simplifying error handling in probe() and switching to devm functions.
3. Adding support for slew rate, input voltage parameters, and system
suspend/resume.
4. Fixing return values for unsupported configurations to ensure proper interaction
with gpiolib.
5. Introducing the generic 'input-voltage-microvolt' property to pincfg and
pinconf-generic.
6. Refactoring existing properties (renaming 'realtek,duty-cycle') to improve
clarity.

Best regards,
Yu-Chun Lin
---
Changes in v2:
- Add relevant mailing lists to CC.
- Add a grammar fix in error messages.
- Move the "support system suspend and resume" patch after the fix patches.
- Introduce the generic 'input-voltage-microvolt' property.
- Add patches for renaming property 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.
- Improve realtek,rtd1625-pinctrl.yaml description and properties.
- Add RTD1625 pinctrl device nodes to the DTS.

Yu-Chun Lin (14):
  pinctrl: realtek: cleanup license string
  pinctrl: realtek: Fix return value and silence log for unsupported
    configs
  pinctrl: realtek: Switch to use devm functions
  pinctrl: realtek: Simplify error handling with dev_err_probe()
  pinctrl: realtek: Fix grammar in error messages
  pinctrl: realtek: support system suspend and resume
  dt-bindings: pincfg-node: Add input-voltage-microvolt property
  pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Rename 'realtek,duty-cycle' to
    'realtek,pulse-width-adjust'
  pinctrl: realtek: Rename 'realtek,duty-cycle' to
    'realtek,pulse-width-adjust'
  dt-bindings: pinctrl: realtek: add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    4 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   39 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |  205 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   50 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3148 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3709 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1


