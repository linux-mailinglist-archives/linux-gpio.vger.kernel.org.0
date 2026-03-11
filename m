Return-Path: <linux-gpio+bounces-33161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xh+IKNmHsWnkDAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:18:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A62664C6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7570305936F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EDF29DB86;
	Wed, 11 Mar 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhSHk6EY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8B3DD519;
	Wed, 11 Mar 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242272; cv=none; b=RwMDD3SxharMzD8JYWvtkZNSwVHVNiOJ0AovGVef3f0g9dLsHo++1l32cecnr7cjlQSk/qYVf9nFFz7yf5QrKaOSdyudyW2vqDcEpBwjza+SoidK3SXrpTVZSTo6p+9aLmQTxmzSK3yXi4opzu/rk6ojBL40vwdDvTogj/u4YF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242272; c=relaxed/simple;
	bh=baGI29/X7J6RtGJtVe0l5LK6JDkPCmJCS4gpO+nhxmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JSovphpTL6PHlbpDeT+mHty3KeI+Uh1xBTPETFuYnbwQib2TqP27F9osAoMO4itlLqY6tXMdR1SfqRhmHfE6Rh/tJSfk/wF/5FdtXX8KTDg9ZgZOtfCoG1gmzTahFzU/6HZhH42qNr3Pb32N6ITyvFJz2SD0xhmuNBNHgFgDfCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhSHk6EY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EFFC2BC9E;
	Wed, 11 Mar 2026 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242271;
	bh=baGI29/X7J6RtGJtVe0l5LK6JDkPCmJCS4gpO+nhxmg=;
	h=From:To:Cc:Subject:Date:From;
	b=hhSHk6EYTGzgb/xT8oW9SKKV7LScUDUABKlBuJvOlkZ2hyg70rUiebLevNzTl770j
	 Y9Tb0x9U7wijlBmywpTEtuIyHZ7qn/fQuoLB5IcYguvESex0nsKtSr6QhXm03MG9x4
	 +QazaXcRnlzim1W+ManE2DNq7mrERXGTBYGFWsVrWmURV14fclpqIz/CUDGOef61f1
	 ZjzvG19sQvgKvrM77A+HFVgPmjZ/XC4NPJtW2YKRdgHzi/LocIE+MWt2O7Hq1o8XTr
	 w10W12JoVs/NDIjMwFvYKNPLPJoG/hvlxyFTGhxKHr5njTtyPRm6yo7i/oZUnEXe5z
	 LKYLQH6786LjQ==
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
Subject: [PATCH v12 0/4] PolarFire SoC GPIO interrupt support
Date: Wed, 11 Mar 2026 15:17:37 +0000
Message-ID: <20260311-tasting-friend-eae39148fb96@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4646; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iroIE3VF1VJ9LtNRmplgK16+lCoduSIXkqDPMvxuhjA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkb26epBy3ZdvmJ4vckO/sz7IdSsnn2asl+VGO5XeU3N 0ksKVy7o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNRzmP4zRJnKy/k9bHr49+E id8mhm/dvFHigZEI5+4XBvqudc5pBowMP2MirqdMv35piZXQnPzD0ktuuDPfWbJzfvV0mWXr2+S W8QMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33161-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F7A62664C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

In 2024 I sent a v7 of adding support for the GPIOs on PolarFire SoC,
which relied on an irqchip driver for a mux sitting between the GPIO
controllers and the main interrupt controller on the chip:
https://lore.kernel.org/all/20240723-flatworm-cornflake-8023212f6584@wendy/

Some feedback I got from Thomas there ended up being a complete black
hole for time spent, and I never managed to make the change he wanted,
as a house of cards collapsed whenever I tried it. I eventually
abandoned my attempt to upstream the GPIO driver with interrupt support
and cut it out of the driver to make progress. I've been carrying what
Thomas deemed incorrect downstream since.

Recently Hervé upstreamed a patchset for a Renesas chip that deals with
a mux sitting between a GPIO controller and the platform interrupt
controller by way of interrupt-map. I saw the opportunity to copy what
he did, so have gone from an irqchip driver that read the mux setting
that firmware had configured, to trivial driver that reads the mux
configuration from devicetree and sets the hardware up to match.

This gets rid entirely of the irqchip driver, so resolves Thomas'
complaint, but I don't love how the GPIO side of things turned out quite
as much. The hardware has 41 interrupts but 70 GPIO lines. 38 of these
are 1:1, direct connections to a dedicated line on the interrupt
controller and 3 are shared.
With the parent mux driver, the GPIO driver's interrupt handler was only
called either for specific direct interrupt or for only the subset that
are fed into the shared interrupt for that controller. Without the
parent irqchip from mux driver, and using interrupt-map, I lost the
ability to use mux driver to selectively call the handler, so now the
GPIO controller attempts to handle interrupts on all lines.
Probably this is ultimately not a big deal, it just feels bad to do.

The mux driver has moved from irqchip to soc, since that's where Hervé's
ended up.

I assume the merging strategy is going to be the kinda expected split
into three, and it's worth noting that this may lead to some issues with
the gpio interrupt support, depending on how the existing devicetrees
are written. Of course, it'll come good in linux-next and in Linus'
tree.

Cheers,
Conor.

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

Conor Dooley (4):
  gpio: mpfs: Add interrupt support
  dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt
    mux
  soc: microchip: add mpfs gpio interrupt mux driver
  riscv: dts: microchip: update mpfs gpio interrupts to better match the
    SoC

 .../soc/microchip/microchip,mpfs-irqmux.yaml  |  77 ++++++++
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
 16 files changed, 632 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c

-- 
2.51.0


