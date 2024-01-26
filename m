Return-Path: <linux-gpio+bounces-2599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5336083D8B2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868871C2505A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2DE17C6D;
	Fri, 26 Jan 2024 10:56:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC012E57
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266616; cv=none; b=biumg8PXFBgxgriPu5czHAcIeX5p83Eh6myNws6pU9rOP1adrxv6inPfm4KoYbnlA5zf2oABzK3N7uZTICpKkM19mjkT8YIHxm7F53+KWaibzgRYXsP+P3iR+CTxVZHrSbJ+SdbCw8rPNl/hs8ENbj2ScEVeAWcF0U79eTDw9Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266616; c=relaxed/simple;
	bh=lRt42MNJjD/g5ZyL5oWsuIV1Re3nDffjLc0RdDdLCIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qwdSDJQbjLCtQMUF18hXV6D8ycDkDZFK2dGSvCxidNEeLd+yvyZBs3tFxt6CL9icTVVicKj4YWbeyklvZgGiMxA24/IAaatLa0weGJfQTd1tIwuMUV+A6BeAC5n/r8404OmdBsj06h6HDQD/k4ZdPSmXH0mdYDum6TgOTBPKiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TLvlN5X3wz4wx7s
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 11:56:48 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by michel.telenet-ops.be with bizsmtp
	id fNwo2B00B1AdMdB06NwoJS; Fri, 26 Jan 2024 11:56:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsM-00GWkf-6w;
	Fri, 26 Jan 2024 11:56:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJgz-00G5Sk-WB;
	Fri, 26 Jan 2024 11:44:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/14] pinctrl: renesas: Add support for R-Car V4M
Date: Fri, 26 Jan 2024 11:43:58 +0100
Message-Id: <cover.1706264667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds pin control support for the R-Car V4M (R8A779H0)
SoC.

Some, but not all, of this has been tested on the Gray Hawk Single
development board.

There are also a few unresolved questions:
  - According to the documentation, using I2C requires setting
    SEL_S{CL,DA}[0-3]_1 instead of SEL_S{CL,DA}[0-3]_0 in the MOD_SEL
    register.  However, I2C works regardless of this setting, just like
    on R-Car V4H (see commit 42cbd16e7c547499 ("pinctrl: renesas:
    r8a779g0: Fixup MODSEL8")),
  - Using i2c-gpio instead of i2c-rcar for I2C0 does not work, even
    when using a similar scheme like on R-Car S4 and V3U (see e.g.
    commit 8bdd369dba7ff2f8 ("pinctrl: renesas: r8a779f0: Fix GPIO
    function on I2C-capable pins").

For testing, I have updated [1] accordingly.
Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4m-gray-hawk-single-v2

Cong Dang (13):
  pinctrl: renesas: Initial R8A779H0 (R-Car V4M) PFC support
  pinctrl: renesas: r8a779h0: Add Ethernet AVB pins, groups, functions
  pinctrl: renesas: r8a779h0: Add SD/MMC pins, groups, functions
  pinctrl: renesas: r8a779h0: Add QSPI pins, groups, functions
  pinctrl: renesas: r8a779h0: Add SCIF pins, groups, functions
  pinctrl: renesas: r8a779h0: Add SCIF_CLK pins, groups, functions
  pinctrl: renesas: r8a779h0: Add HSCIF pins, groups, functions
  pinctrl: renesas: r8a779h0: Add I2C pins, groups, functions
  pinctrl: renesas: r8a779h0: Add MSIOF pins, groups, functions
  pinctrl: renesas: r8a779h0: Add PWM/TPU pins, groups, functions
  pinctrl: renesas: r8a779h0: Add CANFD pins, groups, functions
  pinctrl: renesas: r8a779h0: Add PCIe pins, groups, functions
  pinctrl: renesas: r8a779h0: Add Audio pins, groups, functions

Geert Uytterhoeven (1):
  dt-bindings: pinctrl: renesas,pfc: Document R-Car V4M support

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779h0.c        | 3967 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |    1 +
 6 files changed, 3981 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779h0.c

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

