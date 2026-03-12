Return-Path: <linux-gpio+bounces-33246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGbVI6mksmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:34:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFC271041
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9FE73032D04
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECC13BED5D;
	Thu, 12 Mar 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="YhVBDGMa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CC35836A;
	Thu, 12 Mar 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315219; cv=none; b=pVuNavaCFGeb8YMbASne8C7Bem/RK89zoIjcc82P3CZ6ZOhYvB90kL7Vmc/YjRsGCTjiyYlZqxBzay0LMHxfS6fcRyJztBZt0RJ6+hoLmUc7/HIl3+9bSYnh4Y/BESvDUQvxUnbUsEaSO8++P+NTdAO2yjyI9Em9NvVCZ0dslLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315219; c=relaxed/simple;
	bh=uuOFIXbsZc8RUSnQhyK6sM6PVeA1lGydO8tQwzBR9PU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AHFSPQG1d3WQbe8ZTXvvk1E4QVF3PWyC28mJ6/Vmkbd9zj+/REEpLvBXhirw7Ddv1DBdSrr3l+SxCr6hsVmM8PMBsPakjAwV8JHjawzUDwKAct2Wcy737RNPkDGCWT/8UkOk8CrtJMYHBR5OhyesU4MNrlgC21boRHncsJCqyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=YhVBDGMa; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfvxE2456770, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=DMgIm9fIXbYKG8k1PJkFxs34LxL8omdNAcHFlh8vTzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=YhVBDGMaZbvVFN3rtFbJwBWzgo2KL2YWhpTCeZKSEuGDKBfFYVC6gZxGzwH/EMz1c
	 aT3hs2mAQqiqTDhh6hsRi3k91hj6PREfRu84FV1Mx7sZ5osxBUUacWxeP9APx5oSFL
	 wlzCEfDNcz4CCH1N3/RbhLzcUx406WAj1jhqRnk+5Ovj7b/XPgW6w3BxwAolipXxqd
	 JfPUb7XbenJLAvSsazQ5cVd22/28FHbzniHtEaftJhZXd0DDqaL6dJZtOFPN/4qeOd
	 BudR10SCSr9YlLKNwimiGm/EzYvje6w/Lm5amhRM0nYVU+ZuZ8fJE1x6FnENWc2q1f
	 R6qPpAEGRK3Tg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfvxE2456770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:40 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 0/7] pinctrl: realtek: Core improvements and RTD1625 support
Date: Thu, 12 Mar 2026 19:30:33 +0800
Message-ID: <20260312113040.68189-1-eleanor.lin@realtek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33246-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,realtek.com:dkim,realtek.com:mid]
X-Rspamd-Queue-Id: 34FFC271041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces pinctrl support for the Realtek RTD1625 SoC.

Besides the new SoC support, this series improves the common Realtek pinctrl
driver and the generic pinctrl library by:

1. Introducing the generic 'input-voltage-microvolt' property to pincfg and
pinconf-generic.
2. Clarifying the 'realtek,duty-cycle' property semantics in Realtek-specific
bindings.
3. Adding support for slew rate, input voltage parameters.

I welcome feedback and suggestions.

Best regards,
Yu-Chun Lin
---
Changes in v3:
- Rebase onto the devel branch of the pinctrl tree.
- Revert realtek,pulse-width-adjust to realtek,duty-cycle.
- Fix binding example values from hexadecimal to decimal format.
- Change default value of realtek,high-vil-microvolt from 1 to 0.
- Sync driver with binding changes to handle PIN_CONFIG_SLEW_RATE as valid
numbers.
- Replace arch_initcall() with module_platform_driver().

v2: https://lore.kernel.org/lkml/20260306075244.1170399-1-eleanor.lin@realtek.com/

Yu-Chun Lin (7):
  dt-bindings: pincfg-node: Add input-voltage-microvolt property
  pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
    description
  dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    4 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   20 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   66 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   37 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3138 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3559 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1


