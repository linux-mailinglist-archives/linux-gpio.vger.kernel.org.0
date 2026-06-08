Return-Path: <linux-gpio+bounces-38070-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkOwL3x1JmocWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38070-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:55:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FF653BAA
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:55:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=BLwk8Er3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38070-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38070-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C680E304BE73
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32487346E40;
	Mon,  8 Jun 2026 07:51:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5063988E2;
	Mon,  8 Jun 2026 07:50:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905059; cv=none; b=fHOov/WrhJaEOO0y44/CUiWWbk5n/T2QR9GiS2Q22ptLglL4N9G5J6pX9ngjTurH/AcTPQShpi7tXL78VCP0hpcCW9IMkVir7m25N4i05Uv2Ipp1QHlHZ2qqh3DO1BrdS0RptnASuXCdpf+DIx/BDSVm9yN5qI3zJQPRhnE8qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905059; c=relaxed/simple;
	bh=TR9EWDnFRajz+fp+F/iDS8YxrKo4rRALNNn3rqlhyus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f/jYr+X3g5rPGRTLfuJ14gXNz+sDzZLQR5EQ50TsIzWFzTGemIxG1TYEYQ1txSil7pmWkWR3j0at0IqKuBbY6C90GtJ9uorMrTdOGZy6E71N5rCfhBfPLvl50asnGE9iQEPNHtY/4bwL/e0y3ulMOTVgDUM1BzrsZyUGzH2gFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLwk8Er3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A135EC2BCB0;
	Mon,  8 Jun 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780905058;
	bh=TR9EWDnFRajz+fp+F/iDS8YxrKo4rRALNNn3rqlhyus=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BLwk8Er3PJYVbDjCktl6f2XO5Celly9mLzxmC/1CWRqV7dBWZBPU03ZxtWdECAef9
	 4j5Y0+U7yu1Q4gYQgMyWd3YWhG38WW2Wv4HM4XEFanIOKPeXb5Jb56hmdYlLYk3VAY
	 rvZMid90zwZGtVRGu2wIXSqqr0AmZykPQZuaVbCU87GBY9EJOLYfSkA9pkggAfqanN
	 r9BLYehrA52a6Dsdu1ADVk1mYur5Sw3C3WicVzELgxZjfSAECjOOv7Fmxpn7blcUez
	 KiB5c6Zvm5pGpuFKjxAbN/PtO+K8LVONbubG+VOGG9Vb1gJGksY726Nsn8TBJF7IRP
	 ZeYbdsB4S3L+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D407CD8C9D;
	Mon,  8 Jun 2026 07:50:58 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v3 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
Date: Mon, 08 Jun 2026 15:50:47 +0800
Message-Id: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFd0JmoC/23N3QqCMBwF8FeRXbfYh1vaVe8RXcz5Nxemss1Ri
 O/eplAQXh4453dm5MAacOiczchCMM4MfQz8kCHdqv4O2NQxI0aYJJxKPHXeKmucxqPptbcdhkZ
 JYLnOC8JR3I0WGvNazetty26qHqB9glKjNc4P9r2eBpp6my+o2PEDxQRXjRClKEpQhbp8O0c9P
 FH6COynSEL3FBYVclJaUE5UKet/ZVmWD3hde9kOAQAA
X-Change-ID: 20260316-ultrarisc-pinctrl-efa6e24c4803
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780905056; l=2879;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=TR9EWDnFRajz+fp+F/iDS8YxrKo4rRALNNn3rqlhyus=;
 b=52L1j+tu4EAMXhYMbjEnV3zO3aWz6RKfCRTMg6KPewwxGj4m5UZT/yh2PmOSWhvMqSp2ZH6h+
 nexCdcSwoB7DWa43VmbM+sMWspvrs0k+LhyxjbcsgAkcFr5tmegPdZq
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38070-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 293FF653BAA

This series adds the devicetree schema and the pinctrl driver for the
DP1000 controller using generic pinctrl bindings.

Compared with v1, this series is narrowed down to the pinctrl binding
and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
CPU/SoC bindings, DTS files, and defconfig update) are not included in
v2 and will be sent separately.

Note:
- ARCH_ULTRARISC support is being reviewed separately:
  * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/

Testing:
- dt_binding_check and yamllint
- Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
  Rongda M0)

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v3:
- Re-add the DT binding header and use numeric pin IDs in the binding.
- Replace instance-specific mux names with generic function names.
- Tighten the schema constraints for A-D and LPC pins.
- Switch the driver to pinctrl_generic_pins_function_dt_node_to_map()
  and resolve mux routes from the pins + function combination.
- Link to v2: https://patch.msgid.link/20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com

Changes in v2:
- Split the vendor prefix, CPU binding, SoC binding, DTS, and defconfig
  patches out of this series for separate submission.
- Drop the legacy DT node format from both the binding and the driver,
  and switch to the generic pinctrl interface with
  pinconf_generic_dt_node_to_map_all().
- Drop the DT binding header from the series.
- Replace the generic func0/func1 mux names with named hardware functions
  in the binding and driver.
- Wire the driver through CONFIG_PINCTRL_ULTRARISC and add COMPILE_TEST
  coverage.
- Restrict function selection to valid pins in the driver.
- Link to v1: https://patch.msgid.link/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com

---
Jia Wang (2):
      dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl controller
      pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver

 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 131 ++++++
 MAINTAINERS                                        |   7 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/ultrarisc/Kconfig                  |  21 +
 drivers/pinctrl/ultrarisc/Makefile                 |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 168 +++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 503 +++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  63 +++
 .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  63 +++
 10 files changed, 962 insertions(+)
---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



