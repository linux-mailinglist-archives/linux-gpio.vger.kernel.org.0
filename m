Return-Path: <linux-gpio+bounces-33623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG9bEZlBuWnq9wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:57:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B92A9579
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964B33039EF8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C263B6C1A;
	Tue, 17 Mar 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="jaTIJ6mv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3143B585B;
	Tue, 17 Mar 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748618; cv=none; b=fJ7AkRTEWOe1dw+ml6E7S40cQlGw4rgeQF0vllCLuw4qfDNWiDwuDCGVKGWc3rHK4U21pwQDhsqcGXhOGaurxcA2AwSspimUrvCZDFVOBdFeDdfI+2VDUh6vULaTWpyhc/5ceIU82qhj2t+cXZ+j4Gnon0yLZuA2hk/iifN0Ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748618; c=relaxed/simple;
	bh=dezsWorhfibkwlHjX73400AkFUuGSNlj/FFuYVrWAY0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H9wM4v0hOoSKyoL/klctBTamMBwl48IPgTIiL7X/EUmUxpI6UTQ0S4xaY2B4zbmprM79k84/i1ie1cvMxtUszYZWiACAJCxU49SnxbNkcDPdCvkeYEBOENbG7LDawK8ptAcD9y3rW9tJH9RJwNaLnuA6fDm7WsO5pZ2F27EEJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=jaTIJ6mv; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBcvD3851620, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=FTzoew/ZMvCMhjpr6otK/JMZgS+ZUn1dml7NawnXAH8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jaTIJ6mvYDvh6kBQuEgsfjpE3MXweheH8fPz7ML2iqBKfOTf4xBWeBqfQuz5RtXka
	 eMXVHLMCXFPzD3UhZh9f1B4M2bGZUQlM0ROA0HUcRjjsqLkJUZ+kvQY9W0hFb7OR3i
	 iX/GCweaIViD6zdINUoBs7DTUZu3MC3UC/MngbdaPy1vI8QNPIM9GRW8uGlOZtXdtt
	 3yNsnbEnfExQtSqhrm4eEd9fD2Oqjtewoi7kcXhASVa8RegKuMTGMckm70odjJZkPH
	 xh1QQRYlG51JefNgf75/gDOVgzLNvpTYmnbwDssKfCAsBMC3N76up1/4c2Jn3VPNBA
	 6G7msU3vzBE9g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBcvD3851620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 0/8] pinctrl: realtek: Core improvements and RTD1625 support
Date: Tue, 17 Mar 2026 19:54:02 +0800
Message-ID: <20260317115411.2154365-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
	TAGGED_FROM(0.00)[bounces-33623-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:mid];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE4B92A9579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces pinctrl support for the Realtek RTD1625 SoC.

Besides the new SoC support, this series improves the common Realtek pinctrl
driver and the generic pinctrl library by:

1. Introducing the generic 'input-threshold-voltage-microvolt' property to pincfg
and pinconf-generic.
2. Improve other Realtek pinctrl bindings's descrption.
3. Adding support for slew rate, input voltage parameters.

I welcome feedback and suggestions.

Best regards,
Yu-Chun Lin
---
Changes in v4:
- Add a new patch to fix the argument type in rtd_pconf_parse_conf().
- Rename property from "input-voltage-microvolt" to
"input-threshold-voltage-microvolt".
- Update pinconf-generic to reflect the property renaming.
- Add tag from Linus and Conor which received in v3.
---
Tzuyi Chang (5):
  dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt
    property
  pinctrl: pinconf-generic: Add properties
    'input-threshold-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver

Yu-Chun Lin (3):
  pinctrl: realtek: Fix function signature for config argument
  dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
    description
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    6 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   20 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   68 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   37 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3138 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3562 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1


