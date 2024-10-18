Return-Path: <linux-gpio+bounces-11623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE69A3DD3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 14:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C141C234CD
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 12:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D496617578;
	Fri, 18 Oct 2024 12:05:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455E18028
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253147; cv=none; b=QZskUm3Mt5NR3KzTweBzNxof71opKwH0WR3RJfHxYJGQ6g+3zBZeoqVxlYpA2VgJIP/p255HU/wMhdDQT2WuGZMATaWag/MoMhF18oAUYwTr4r3lnCpKL159xmFwvjMRquPAcl3Kit4w7XI/GVz6+KKlOZWZ5mUwQVaBRWVfQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253147; c=relaxed/simple;
	bh=6SLyQebV0d6GYK6hramX27zfJgYHrC0bzotMF4gmXaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TTBCE/h4UOUXxffVOlQa5Y5y3P63wm4xwVIbn7yoELzolwY2kLrm+x4mIe+gxfmD5D2lc0zaUp5nyLV/SssaDFxIE9ZQ1egMTVMflUf873P2eGmW26q3B09UmcO6LqO2fiyS6KO0iQ02mp5E/Ca2JV8sVDf8NAEFGzrePD9wQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by michel.telenet-ops.be with cmsmtp
	id Ro5d2D0061MdCM206o5dFM; Fri, 18 Oct 2024 14:05:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljO-003zST-0j;
	Fri, 18 Oct 2024 14:05:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljc-005stZ-VV;
	Fri, 18 Oct 2024 14:05:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.13
Date: Fri, 18 Oct 2024 14:05:34 +0200
Message-Id: <cover.1729252708.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.13-tag1

for you to fetch changes up to 5dcde519a067ac5c85c273e550dde1873e2199bf:

  pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC (2024-10-14 10:02:13 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.13

  - Marks GPIOs as used on RZ/A1 and RZ/A2,
  - Add open-drain and schmitt-trigger support on RZ/V2H(P),
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Fix missing return in rzg2l_pinctrl_register()

Fabrizio Castro (1):
      pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX

Geert Uytterhoeven (1):
      pinctrl: renesas: rza2: Mark GPIOs as used

Lad Prabhakar (4):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow schmitt and open drain properties
      pinctrl: renesas: rzg2l: Add support for enabling/disabling open-drain outputs
      pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger
      pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC

Wolfram Sang (1):
      pinctrl: renesas: rza1: Mark GPIOs as used

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  4 ++
 drivers/pinctrl/renesas/Kconfig                    |  1 +
 drivers/pinctrl/renesas/pinctrl-rza1.c             |  7 +++
 drivers/pinctrl/renesas/pinctrl-rza2.c             |  3 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 51 ++++++++++++++++++++--
 5 files changed, 63 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

