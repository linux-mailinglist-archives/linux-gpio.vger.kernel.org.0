Return-Path: <linux-gpio+bounces-1544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB24814A5C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D5F1C20B9B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 14:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8A330FB3;
	Fri, 15 Dec 2023 14:20:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7A23159B
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:28e5:a835:e0b1:5291])
	by baptiste.telenet-ops.be with bizsmtp
	id NeLT2B00F29mzEW01eLTog; Fri, 15 Dec 2023 15:20:27 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE92o-00C71q-0j;
	Fri, 15 Dec 2023 15:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE7Bb-00GsNq-Sf;
	Fri, 15 Dec 2023 13:20:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.8 (take two)
Date: Fri, 15 Dec 2023 13:20:58 +0100
Message-Id: <cover.1702642700.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit dc99d4c8ac46bf533b9519a53795c4cd6ff0fa39:

  dt-bindings: pinctrl: renesas: Drop unneeded quotes (2023-11-27 11:12:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.8-tag2

for you to fetch changes up to 9e5889c68d992b65efd10aa0a4523c96fd07077f:

  pinctrl: renesas: rzg2l: Add input enable to the Ethernet pins (2023-12-15 11:34:34 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.8 (take two)

  - Add pinmux groups, power source, and input/output enable support for
    Ethernet pins on RZ/G2L SoCs,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (5):
      pinctrl: renesas: rzg2l: Move arg and index in the main function block
      pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups
      pinctrl: renesas: rzg2l: Add support to select power source for Ethernet pins
      pinctrl: renesas: rzg2l: Add output enable support
      pinctrl: renesas: rzg2l: Add input enable to the Ethernet pins

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 164 ++++++++++++++++++++++++++++----
 1 file changed, 145 insertions(+), 19 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

