Return-Path: <linux-gpio+bounces-36876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMGzB2h0BmrpjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D005484F5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B8DE3050C9D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F41A36A03F;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFAX2C35"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740B28686;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=JNRiG8pEV34xo8+dtG0TNAVx2pFenFpIL6mf6bSVw4nXxyWVXzlvN7G0vvV0nmgU2JbqfP9CUhj89Su5mBsRc9b+ooLdYg8PFdDFeKcFyRtT+9nr/YrCQNCQnvEkyOq3XX/Z/xSPJcD+49v9BE6rSbVbsqURxUP4jzVLB5Moc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=CIzqu3iSXQE7WxLBaG2FjLAc8gxifDDaK5d1TURsWzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=huJQga2N+Fxmva/D31f4jvVQHpUX34cJ9jnijhtHY6rwJmTJgPW2hySq68nrWQvdXpQ7U9ZTavx6SuqSSH15s+/PP4RLIgWJ4gQ9oX73LK6p0PZEb7oVGsY0XVAKbS2EoZ4uaEOBrSdWhAa8LiVwyqC7bvkI7z/WdEntdEQCXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFAX2C35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0546C2BCB3;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=CIzqu3iSXQE7WxLBaG2FjLAc8gxifDDaK5d1TURsWzw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jFAX2C35WASpbW6IgltgDFQTonP7mjFkOe6XTQvVFgFtOpsPgk8NuXs0ix05a7iyc
	 B+H1ZiWSI/FS/lLCMntHpsCOdV3D/DeulHw1TTHwHdtQN5/G9rEyqQYJO0/S2WahMz
	 VGiaXnwTskSRUABEdq2cczZKsx3BfedV+VCn2oADWigrKLzYbG0NfrYbGF5LGWlODB
	 GqsEB6WUCS52aIxWjyuKGLgKQaUPB1QZpinZRME7yKlXF1Su/AISs+7dkVhTx0bXG/
	 YF3+ZVhs0j53TzUUJuldgICDI9n6WarWYjy2T1wIPLoYuINk0MqyfpCmjkckhJBfNq
	 /gBTIce2oa8xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB36CD37AC;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
Date: Fri, 15 May 2026 09:17:56 +0800
Message-Id: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAER0BmoC/yXMQQqEMAxA0atI1hZqlSJzlcFFjVEj0pGkiiDe3
 c7M8i3+v0BJmBRexQVCByt/YkZVFoBziBMZHrLBWedtXXmzr0mCsKLZOGKS1dAYPLkGm9bWkLt
 NaOTz93x3f+veL4TpO4L7fgAwkAmRdQAAAA==
X-Change-ID: 20260316-ultrarisc-pinctrl-efa6e24c4803
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=3939;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=CIzqu3iSXQE7WxLBaG2FjLAc8gxifDDaK5d1TURsWzw=;
 b=Dc3d8WwB4MLDtzdPDDLY4xc9u1QECszdJWuus/oTWcJL6qCseT8wQhfxrgPWTLdMqoNvJ2MJ9
 GoaIZaZQjVpC7juOougB38kb6ZoCx5T2PubrnD9nuZnupQ/FfpHQfw3
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Queue-Id: B4D005484F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36876-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:mid,ultrarisc.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds initial Devicetree support for the UltraRISC DP1000 RISC-V
SoC and two DP1000-based boards (Milk-V Titan and Rongda M0).

The series introduces the required DT bindings, adds the DP1000 pinctrl
driver, and provides the initial SoC/board DTS files.

Notes:
  - Clocks are configured and enabled by firmware before Linux boots. Linux
    does not manage clock rates or gating at runtime on this platform.
    Therefore the initial DT only models the fixed clocks required by
    standard drivers, and no clock controller/driver is provided.
  - The DP1000 pinctrl binding supports two child node styles under the same
    controller compatible:
      * legacy DP1000-specific nodes using phandle-array properties
        "pinctrl-pins" and "pinconf-pins"
      * generic pinctrl nodes using "pins", "function" and generic pin
        configuration properties
    The legacy form is kept for compatibility with existing vendor DTs.
  - The bindings for "ultrarisc,dp1000-uart" and "ultrarisc,dp1000-pcie" are
    being reviewed in separate series, since the DP1000 SoC DTS introduced
    here uses those compatibles:
    * Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/
    * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
  - ARCH_ULTRARISC support is being reviewed separately:
    * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/

Testing:
  - dt_binding_check and yamllint (all new/modified binding YAMLs)
  - dtbs_check and dtbs (RISC-V, including dp1000-milkv-titan.dtb and
    dp1000-rongda-m0.dtb)
  - Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
    Rongda M0)

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (9):
      dt-bindings: vendor-prefixes: add Rongda
      dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
      dt-bindings: riscv: Add UltraRISC DP1000 bindings
      dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
      riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
      pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
      riscv: dts: ultrarisc: add Rongda M0 board device tree
      riscv: dts: ultrarisc: add Milk-V Titan board device tree
      riscv: defconfig: enable ARCH_ULTRARISC

 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 ++++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  15 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 107 +++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 182 +++++
 .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++
 arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 851 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/ultrarisc/Kconfig                  |  23 +
 drivers/pinctrl/ultrarisc/Makefile                 |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 112 +++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 746 ++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  71 ++
 .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++
 21 files changed, 2577 insertions(+)
---
base-commit: 50897c955902c93ae71c38698abb910525ebdc89
change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



