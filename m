Return-Path: <linux-gpio+bounces-33729-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHjVLqiIumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33729-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:12:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4B2BA954
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29B203190241
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506913C5522;
	Wed, 18 Mar 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fi54/hpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE62135D7;
	Wed, 18 Mar 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831884; cv=none; b=lqxvOKrMY2HasIsT4hkpvnR521UprjB39xnvDMCPlC7BIgrBtyd8Env+FNdHdmLOjbsGs2V4hubjN88KQbu2pRdckfu3rXfzXHmW/c3AdKgjytPKrRgc+QLB/4c6xf3XyYoFQkEMg+I2CNdWvw4oK+t7AkSwj0GFpdre9/coX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831884; c=relaxed/simple;
	bh=BNq/aLjGiRsU/woSk9KXvzCzt9H8uG+UKL6Hc0amgqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ssMobaGhSDMehW2Dy0yjtRpLKBFJV6vpUdDJN/OjRqtoD7/fv/NvHn8itw3QCMO8uA07JUvvaRIZzupws5HvecmVrNWlSXE35g2T2NN8gO/r9UZD2CBpLt2uUaWEZ1OZyaXhT3647CYBUle0X8rPQRudNt4I+qc0X/C70I8Z/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fi54/hpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5F2C19424;
	Wed, 18 Mar 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831884;
	bh=BNq/aLjGiRsU/woSk9KXvzCzt9H8uG+UKL6Hc0amgqE=;
	h=From:To:Cc:Subject:Date:From;
	b=fi54/hpmBZjRTodk9ob7bkwP4VJX3bjuKqnaUMdcL1kbSj8bhDCgLdL0SzZxXvoMg
	 aXNaBNRFXr2A7WmmrtioF0KlnobKG5ohyzuhhb/WFj8qhI0TJjqpqN0RFtBzgt2uwG
	 qCUQK8Qg9mzM9g62Bo6B5L1ai5Arm4lby1DPq4XHcWFk1tJ0R5VqlySzJCVEAazewR
	 irXMbgEZZ7CnZ77smLdx+NwcXjOgRmz3x8uBHn21zPc13o7LUDU6BI9ODTUj06F4tF
	 3Vn18Zlu05cV36lJRRdjkft2dEMLlGBhHduK00ZXhlvxnUtkEQr8TmwZloi/maIRME
	 9wALt3QWZvTQg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Wed, 18 Mar 2026 11:04:31 +0000
Message-ID: <20260318-gift-nearest-fd3ef3e4819b@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+szdxvWDurJ/Utg3qh2x6m2C3UpR9hPCewe/zECfwsc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o5UTjx1t3mm8QWfjM6Llw32cOf9Opu/LfxZO08xd 5Gx8NSFHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI3FJGhmev9hYv2vHq7KWQ kgn7jl/WtrfR7L0Rev8in+y0nqkX9YMY/qc/e9eUbrncTaDr5uHPDXwSetWq8hGWTxcz7OlYkZO UwwgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33729-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DD4B2BA954
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

Here's a v3 with an extra patch updating the gpio binding from fished
out from my old branch, fixing the examples and setting the permitted
values of gpios for the controllers on polarfire soc and the existing
binding patch's example fixed.

Bartosz, you acked the gpio driver patch, are you expecting the whole
lot to go together via the soc tree or something?

Cheers,
Conor.

v13:
- fix the binding example
- add a new binding patch

v12:
- Implemented mux driver feedback from Hervé.
- Reworked the gpio interrupt stuff per Linus' feedback, so didn't pick
  up Hervés tag.
- Modified the binding description to cover the 6 always "direct mode"
  interrupts on gpio controller 1.

CC: Thomas Gleixner <tglx@linutronix.de>
CC: Herve Codina <herve.codina@bootlin.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org

Conor Dooley (5):
  dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
  gpio: mpfs: Add interrupt support
  dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt
    mux
  soc: microchip: add mpfs gpio interrupt mux driver
  riscv: dts: microchip: update mpfs gpio interrupts to better match the
    SoC

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  24 ++-
 .../soc/microchip/microchip,mpfs-irqmux.yaml  | 103 ++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 MAINTAINERS                                   |   2 +-
 .../boot/dts/microchip/mpfs-beaglev-fire.dts  |  29 +++
 .../boot/dts/microchip/mpfs-disco-kit.dts     |  43 +++--
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |  37 +++-
 .../boot/dts/microchip/mpfs-m100pfsevp.dts    |  41 ++--
 .../boot/dts/microchip/mpfs-polarberry.dts    |  29 +++
 .../riscv/boot/dts/microchip/mpfs-sev-kit.dts |  37 +++-
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts |  35 +++-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  37 +++-
 drivers/gpio/Kconfig                          |   1 +
 drivers/gpio/gpio-mpfs.c                      | 122 +++++++++++-
 drivers/soc/microchip/Kconfig                 |  11 ++
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs-irqmux.c           | 181 ++++++++++++++++++
 17 files changed, 673 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c

-- 
2.51.0


