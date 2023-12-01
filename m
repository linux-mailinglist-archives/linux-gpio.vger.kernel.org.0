Return-Path: <linux-gpio+bounces-826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABE800B3A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 380EB1C20DA1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 12:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B76125D7;
	Fri,  1 Dec 2023 12:42:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9D310DE
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 04:41:55 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by laurent.telenet-ops.be with bizsmtp
	id H0ht2B00M0rKVV8010htPG; Fri, 01 Dec 2023 13:41:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92pq-00ARdR-GS;
	Fri, 01 Dec 2023 13:41:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92q9-00CVOe-53;
	Fri, 01 Dec 2023 13:41:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.8
Date: Fri,  1 Dec 2023 13:41:52 +0100
Message-Id: <cover.1701434258.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.8-tag1

for you to fetch changes up to dc99d4c8ac46bf533b9519a53795c4cd6ff0fa39:

  dt-bindings: pinctrl: renesas: Drop unneeded quotes (2023-11-27 11:12:12 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.8

  - Add support for interrupt affinity to the RZ/G2L GPIO driver,
  - Drop unneeded quotes in the RZ/A2 Pin controller DT bindings.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Enhance driver to support interrupt affinity setting

Rob Herring (1):
      dt-bindings: pinctrl: renesas: Drop unneeded quotes

 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

