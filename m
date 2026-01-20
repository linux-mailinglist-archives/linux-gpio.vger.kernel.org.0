Return-Path: <linux-gpio+bounces-30777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LJlHNUrcGniWwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 02:28:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB74F165
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 02:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E8C08289FC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1979742317D;
	Tue, 20 Jan 2026 11:43:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C2423172;
	Tue, 20 Jan 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909395; cv=none; b=pBu7yp39b9ZpERQd9Y9XK+xLD857hin4Oh9j1cfTvONHeh6uzLTMzv3HE7b3Jby5R0idkpDAeqEGaUn58DREisE/FpNgM8AzdHrBGj1gJ7nb+Z37IAlsD6gBq4YekGhde50uvrzgin+Fk5d0mPheAdahr7Qn8gMhpZxHK2RLQfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909395; c=relaxed/simple;
	bh=XQLWMm3YsOhtEHJ6iLz4rU8Uz2JmnALhlntXC1iQkvA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rJ3vu525KGPHnePfRHsoYbjMbv9qQ2V2gT+HM8o5eu6TzYYNSDO/iJZ3SxnHcPkP8PRvseEQ+8lCCsNb/L3br9DFwF9npJ6DMhNvlXiN+epAnwU8zanfuq9eMgw82ZwMHNa2vbCjmtSW1tggRfHf2b786PbVJOgj4eaf7BgaG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/3] Add pinctrl support for AST2700 SoC
Date: Tue, 20 Jan 2026 19:43:04 +0800
Message-ID: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhqb2kC/z3MQQ7CIBBA0as0s5YGaEmpK+9hTIN0kEloSwCNp
 undJS5cvsX/O2RMhBnOzQ4JX5RpWyu6UwPWm/WBjOZqkFwqIYViz5hLQrNMkVZbUmDaiVHNjpt
 xUFCzmNDR+7e83qpd2hZWfG3+Iz7yXvCu56LVWuqBCXanED5TyYYuJkfEuaD1rd0WOI4vfEq54
 KUAAAA=
X-Change-ID: 20251215-upstream_pinctrl-8f195df0a975
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=3007;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XQLWMm3YsOhtEHJ6iLz4rU8Uz2JmnALhlntXC1iQkvA=;
 b=Gxi0bOC2k4CwxLCGJ3+75SuENKeJa42aygju/Eb16ieiH0uqpGEPvIX1fxidn3KU7k4v7A5Ps
 XtN9gTyxx6EA2EG7f/Ajdtc5Z9m9A08NkB9awKP6WiVs6dQwixj8jxr
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.74 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : No valid SPF, No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-30777-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,aspeedtech.com:email,aspeedtech.com:mid]
X-Rspamd-Queue-Id: BEDB74F165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree bindings and a pinctrl driver for the
ASPEED AST2700 SoC.

AST2700 is composed of two interconnected SoC instances, each providing
its own pin control hardware. This series introduces bindings describing
the AST2700 pinctrl architecture and adds pinctrl driver support for the
SoC0 instance.

The bindings document the AST2700 dual-SoC design and follow common
pinctrl conventions, while the driver implementation builds upon the
existing ASPEED pinctrl infrastructure.

---
Changes in v3:
dt-bindings: pinctrl: aspeed: AST2700 pinctrl improvements
- Improved binding descriptions for SoC0 and SoC1 to better explain the
  AST2700 dual-SoC architecture with independent pin control blocks
- Switched from additionalProperties to patternProperties using the
  '-state$' suffix to restrict child node naming
- Removed per-binding examples based on review feedback
- Added additionalProperties: false at the top level for stricter schema
  validation
- Dropped the aspeed,ast2700-soc1-pinctrl binding, as the SoC1 pinctrl
  registers follow a regular layout and can be described using an
  existing generic pinctrl binding
- Updated the function and group enum lists to match the definitions
  used by the AST2700 pinctrl driver

dt-bindings: mfd: aspeed: Add AST2700 SCU example with pinctrl
- Added a complete AST2700 SCU0 example demonstrating pinctrl integration
- Example covers both pin function/group configuration and pin
  drive-strength settings
- Updated child node naming to use the '-state' suffix, following common
  pinctrl conventions

pinctrl: aspeed: AST2700 SoC0 driver improvements
- Refactored pin and signal declarations to use common ASPEED pinmux
  macros (SIG_EXPR_LIST_DECL_SEMG, SIG_EXPR_LIST_DECL_SESG, PIN_DECL_*)
- Added SCU010 register definition for hardware strap control
- Reworked code structure to better align with existing ASPEED pinctrl
  drivers

- Link to v2: https://lore.kernel.org/r/20250904103401.88287-1-billy_tsai@aspeedtech.com

Changes in v2:
- Update pinctrl aspeed binding files.
- Update the commit message for pinctrl binding patch.
- Link to v1: https://lore.kernel.org/r/20250829073030.2749482-1-billy_tsai@aspeedtech.com

---
Billy Tsai (3):
      Add compatible strings for AST2700 pinctrl to the SCU binding.
      dt-bindings: pinctrl: aspeed: Add support for AST27xx
      pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  28 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 ++++
 drivers/pinctrl/aspeed/Kconfig                     |   8 +
 drivers/pinctrl/aspeed/Makefile                    |   1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c    | 683 +++++++++++++++++++++
 5 files changed, 850 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-upstream_pinctrl-8f195df0a975

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


