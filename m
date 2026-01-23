Return-Path: <linux-gpio+bounces-30966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBIfDBw/c2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC479734DA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D85F30238FE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA79133F8B8;
	Fri, 23 Jan 2026 09:26:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03E29B76F;
	Fri, 23 Jan 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160399; cv=none; b=YI3GFeZQVH2C+KXB5sdtjFm2iIS8luxyBZcqEEVIP1DznfDkS1e8RA2HoUV8ilwiVjQkNtYoGdSKcW3VRpaPj+SU+WSWEpaFgwZ7kzxmjZkcYmHYkL+vlO9byj8WFchN1DhXY8aVbIQmYSUFRRXlUCQP+1V9wwRBvvv8jrm/hoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160399; c=relaxed/simple;
	bh=GhxpaNbciIaCWw72u2Iibpyx+V9XGyJ6u4X/43gCPWI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KXOiO4VrLVDANlBIeNNvHIhW9+ppzBLuftk+RzBgV6CjURu6tZOmeaAx6yu+ymVEO9re80PGpU824pGAh2lnaf+u3Ys9mnSXl8scUbmES+LQfchlZOUtP3apTOpA4ME+eRnZ3EJ+jQOT9TsRaNzO6lNs5Ej2ttKpQWMHuuiag0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/6] Add Aspeed G7 sgpio support
Date: Fri, 23 Jan 2026 17:26:25 +0800
Message-ID: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAME+c2kC/13Myw6CMBCF4Vchs7amU+SiK9/DEFPLFGYBbVokG
 tJ3t7B0+Z/kfBtECkwRbsUGgVaO7OYc6lSAGfU8kOA+NyipKlSqFG8fl0B6esbBsxON7FusTH3
 ReIV88oEsfw7w0eUeOS4ufA9/xX3dqVoiNv/UikKKtpJkS2tfdSvvOnqifiEzno2boEsp/QB37
 HVnsQAAAA==
X-Change-ID: 20251223-upstream_sgpio-70d815c64a19
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=1733;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GhxpaNbciIaCWw72u2Iibpyx+V9XGyJ6u4X/43gCPWI=;
 b=ha0IbVquhucHyhVDOj7Ik/OXkimaaMGrNIIgmEHWVcXtkMlFT8YWsrZpZun6A/6r2OrwYLp2p
 +c/MUBgaX6/DJhz3EpuHv5ijNQ47OZCitYyPv5W1+HSOefr3kae3Oh6
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30966-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: CC479734DA
X-Rspamd-Action: no action

The Aspeed 7th generation SoC features two SGPIO master controllers: both
with 256 serial inputs and outputs. The main difference from the previous
generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for SGPIO registers making it easier to extend the driver
to support different hardware register layouts.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Split the IRQ-related llops conversion into a separate patch to keep changes logically scoped.
- Minimized unrelated changes (such as variable renaming) to reduce diff noise and ease review.
- Clarified the llops design intent and semantics.
- Link to v1: https://lore.kernel.org/r/20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com

---
Billy Tsai (6):
      gpio: aspeed-sgpio: Change the macro to support deferred probe
      gpio: aspeed-sgpio: Remove unused bank name field
      gpio: aspeed-sgpio: Create llops to handle hardware access
      gpio: aspeed-sgpio: Convert IRQ functions to use llops callbacks
      dt-bindings: gpio: aspeed,sgpio: Support ast2700
      gpio: aspeed-sgpio: Support G7 Aspeed sgpiom controller

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   4 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 362 +++++++++++++--------
 2 files changed, 227 insertions(+), 139 deletions(-)
---
base-commit: 39d3389331abd712461f50249722f7ed9d815068
change-id: 20251223-upstream_sgpio-70d815c64a19

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


