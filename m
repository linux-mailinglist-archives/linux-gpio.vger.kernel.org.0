Return-Path: <linux-gpio+bounces-5557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE78A701E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 17:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EFE81F21D6B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 15:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432BB131BDE;
	Tue, 16 Apr 2024 15:47:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05291131751
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282461; cv=none; b=P6RCo7hZ3pkUxBJWS1dkvEOi/HoKOzJfFBEeM96xX/4i72xOXqvLSqIP5cPqYVWKt/B7Onin3bEwf+QRL78CdT/EhhgqrzKDZ73eUHwuunOfB16fwiiiX/zzhXMidvVpezVDm4u0tobu0dvRvWKvr6DYSC0RDpx2mxivDHWMuCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282461; c=relaxed/simple;
	bh=lB4xOGyIbV5YZiyW2VRXAdid5Ao74yqlZKUWlHVBDSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VkgniAmE8LQlVMss7ZV05iAdTmbTf29/ecaJDcX8GfLYjQEpEuLnYLhZfT2K1Oa+w+4L1CS28Zrr8AORojnFd3vAsethB9S1n75tqTUUZQ/INwTELOcXKkNArN8lDcEUq16yzGo2RkjDR7TDOeSwKCb41qQZddjw3BLS5e64iTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id BrnV2C00A0SSLxL06rnVYF; Tue, 16 Apr 2024 17:47:29 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl1J-008J5q-NN;
	Tue, 16 Apr 2024 17:47:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl1t-00Ebka-37;
	Tue, 16 Apr 2024 17:47:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: renesas: r8a779h0: Add INTC-EX support
Date: Tue, 16 Apr 2024 17:47:21 +0200
Message-Id: <cover.1713282028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for pin control for the Interrupt
Controller for External Devices (INTC-EX) on the Renesas R-Car V4M
(R8A779M0) SoC.

I plan to queue this in renesas-pinctrl for v6.10.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: renesas: r8a779h0: Fix IRQ suffixes
  pinctrl: renesas: r8a779h0: Add INTC-EX pins, groups, and function

 drivers/pinctrl/renesas/pfc-r8a779h0.c | 136 ++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 12 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

