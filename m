Return-Path: <linux-gpio+bounces-37140-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ1LLCdFDGrQcQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37140-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:10:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494957D3E1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83CA631556D8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21353A9639;
	Tue, 19 May 2026 10:38:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F293A6418;
	Tue, 19 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187111; cv=none; b=pOdy4P03TAhwztUALfIv3vIXUe1h0/3r/AF9idkAaUtoLvvUDA1MFwJx+eo24p/itlH/UMAyB4c9sZZGXuWXZ4wgfQijmqOfgjPKw0EOXZCZTlIMQmIFiT3mbsMKCQiwLZESyeVBVzee9euolAK0bjAaVIDH2A9WF1mk/N31Npc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187111; c=relaxed/simple;
	bh=L1iLfDQrZwxvnw6/O3AJV6ahyxO2sv21yD4ZkfxrN4k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=r+e8dua0kZXwv6nuyhRc3GPhXRH+vSD8H0dC01UQUHLrhFAgNCvjys7fmn4M0824dLPxODtbDCDhel6QlCly/bmZBxR0LBMN81SwBjF3UzR4Kujw1zhR/nE6xfQ7SXEN1MgrMlmt77dt7WsunmUcldjC4l5kaBZ+5d56+zms22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 19 May
 2026 18:38:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 19 May 2026 18:38:20 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v4 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
Date: Tue, 19 May 2026 18:38:11 +0800
Message-ID: <20260519-pinctrl-single-bit-v4-0-5fe568a8ffde@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ9DGoC/23NTQqDMBCG4atI1k3JTPztqvcoXcQ40QGrkoi0F
 O/eVCgu6vL9YJ55i0CeKYhL8haeFg48DjHSUyJsZ4aWJDexBSrMFQLIiQc7+14GHtqeZM2zbAy
 CdliirTIRDydPjp8bervH7jjMo39tPxb4rj9OH3ELSCVtrhy6ulTk6qsJE1Ezk+3OdnyIr7ng7
 miVHzoYnaKqoLTO1HkKh47enQyyQ0dHh6qiMakGBJX+Oeu6fgAMHxhKSQEAAA==
X-Change-ID: 20260211-pinctrl-single-bit-da213f282c95
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187100; l=5847;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=L1iLfDQrZwxvnw6/O3AJV6ahyxO2sv21yD4ZkfxrN4k=;
 b=yZ+Y7S6UBimAwm6wBTS+wu7ylZooUUWR9axObgWXnkPI/Jy4ScwWNWwQ/oxN2gtcn+HpJoFaY
 ms+njnXKTm3CoP/9uIqxvjO8JBWuxqkTALyd4RU0IwVRomo0NoCI+tE
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37140-lists,linux-gpio=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3494957D3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Legacy ASPEED pin controllers have historically not had a coherent
register interface. Control fields often had no consistent mapping to
individual pins, and configuring a function frequently required
coordinating multiple control bits across several registers. As a
result, the existing ASPEED pinctrl drivers rely on complex macro
infrastructure to describe the dependencies between pins, functions,
and register fields.

The pin controller for SoC1 in the AST2700 breaks from this legacy
design.

For SoC1, each pin maps directly to a dedicated function field in the
SCU register space that determines the active mux function for that
pin. This results in a much more regular register layout compared to
previous generations.

While the behaviour is conceptually similar to pinctrl-single, the
register layout and configuration model differ enough that reusing
pinctrl-single directly is not practical. Therefore this driver is
implemented as a SoC-specific pinctrl driver using static data tables
to describe the register layout.

The binding reuses the standard pinmux and generic pin configuration
schemas and does not introduce any custom Devicetree properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v4:
- Fix SGMII0 mux register: SGMII0's control bit is at SCU47C[0],
  outside the contiguous pin-indexed MUX register range. Handle it as
  a special case in set_mux (analogous to PCIERC2_PERST) using
  field.mask = 0x1 to avoid clobbering adjacent bits in SCU47C.
- Use devm_pinctrl_register_and_init() and pinctrl_enable(): populate
  all groups and functions before enabling the controller, closing the
  race window where a consumer could observe zero groups/functions.
- pin_config_get: return -EINVAL when BIAS_DISABLE is not active; return
  -ENOTSUPP for BIAS_PULL_UP and BIAS_PULL_DOWN because the hardware
  has a single 1-bit enable/disable field per pin and pull direction
  cannot be read back from the register.
- Probe: preserve const qualification in the pinctrl_generic_add_group()
  pin array cast.
- Binding: retain additionalProperties: false for the state-node schema.
  The state-node properties block re-declares the four pincfg properties
  the hardware supports (bias-disable, bias-pull-up, bias-pull-down,
  drive-strength) and intentionally rejects all others.
  unevaluatedProperties: false was suggested as an alternative, but that
  would permit the full set of pincfg-node.yaml properties
  (input-schmitt-enable, slew-rate, etc.) even though the hardware does
  not support them. additionalProperties: false is the correct mechanism
  when the goal is to restrict the accepted properties to a known subset.
- Link to v3: https://lore.kernel.org/r/20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com

Changes in v3:
- Added pin configuration group support for AST2700 SoC1 by
  implementing `pin_config_group_get()` and `pin_config_group_set()`.
- Restricted AST2700 SoC1 `drive-strength` settings to the supported
  4/8/12/16 mA values in the pinctrl driver.
- Convert kernel-doc comment for aspeed_g7_soc1_drv_map to a regular
  comment to avoid kernel-doc warning reported by kernel test robot.
- Update the AST2700 SoC1 pinctrl binding to describe the `reg`
  property and require it.
- Allow standard pinconf properties in pin state nodes.
- Add a binding example for the AST2700 SoC1 pinctrl node.
- Add state-node description, function+groups dependency constraint,
  and oneOf groups/pins constraint to the binding, matching the SoC0
  binding style.
- Add pins enum (212 entries) to the binding to cover all physical pins
  that support per-pin configuration.
- Add UART modem-line signals as independent functions/groups:
  NCTS0/1/5/6, NDCD0/1/5/6, NDSR0/1/5/6, NDTR0/1/5/6,
  NRI0/1/5/6, NRTS0/1/5/6; remove those pins from UART0/1/5/6 groups.
- Add LTPI_PS_I2C0/1/2/3 functions/groups for I2C-over-LTPI;
  extend I2C0/1/2/3 functions with the new LTPI groups.
- Fix typo: rename RMII0RCKO/RMII1RCKO to RMII0RCLKO/RMII1RCLKO.
- Fix wrong index: rename DSGPM1 to DSGPM0.
- Kconfig: use "Aspeed G7 SoC1 pin control" to match neighbouring entries.
- pin_config_get: fix BIAS_DISABLE readback (val=!val must be skipped
  for BIAS_DISABLE since hardware bit=1 means pull disabled).
- set_mux: remove dead null check on grp; propagate regmap_update_bits()
  return value.
- gpio_request_enable: propagate regmap_update_bits() return value.
- Link to v2: https://lore.kernel.org/r/20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com

Changes in v2:
- Updated the series title to focus on AST2700 SoC1 support.
- Reworked implementation to use static SoC-specific layout tables
  instead of a generic packed-field model.
- Dropped the generic "pinctrl-packed" driver approach.
- Removed custom Devicetree properties.
- Updated binding to reuse standard pinmux and generic pin
  configuration schemas.
- Link to v1: https://lore.kernel.org/r/20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com

---
Billy Tsai (3):
      dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
      dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl
      pinctrl: aspeed: Add AST2700 SoC1 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |    1 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |  760 +++++++++
 drivers/pinctrl/aspeed/Kconfig                     |   14 +
 drivers/pinctrl/aspeed/Makefile                    |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    | 1754 ++++++++++++++++++++
 5 files changed, 2530 insertions(+)
---
base-commit: e532a5a81d0db872acd2c0a92d2639580ca3da44
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


