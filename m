Return-Path: <linux-gpio+bounces-12524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE69BB611
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 14:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75AB11C21CCD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2B0224FA;
	Mon,  4 Nov 2024 13:27:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E702339A1
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726828; cv=none; b=cq9UOAAJFlZd4CPPBoOUw2osQijf6m5z2OO5UWP+NTUEpj8PwMdqHopPasQk7WY6Wj3Jsmbo6iqMUwqo/2wKi1R2YoL8qgxr72jiJqftpgbmhTovxFP9V/ycq5Pngq8tosTJl2qyrwwWERERLS99uOeCRhirmVMrDBJ0HccRH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726828; c=relaxed/simple;
	bh=nlTx58DFDlY1Av3yU/9Yhpsqo9wyJPyQG/0BFfWnKWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NEm7Yp1E5Qwpj/0IhkfdRoOIEKf986fKMZv4JbXhZbcYPHr7YSjEwqPWrNAHwvX/JbibfkgpYnrpisoA7Zs8fDfOS5DaHyxZKFC63/Dnr6trsIo0RH7HJoUEwmbneinCksqbSNjrNLRYyv7bq0ZsoXJDwpqSpDrShVha2Y2ixKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by albert.telenet-ops.be with cmsmtp
	id YdT32D00C31l0Qj06dT3rD; Mon, 04 Nov 2024 14:27:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6R-006Fve-K7;
	Mon, 04 Nov 2024 14:27:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6l-000BLL-AT;
	Mon, 04 Nov 2024 14:27:03 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:27:02 +0100
Message-Id: <cover.1730726328.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 5dcde519a067ac5c85c273e550dde1873e2199bf:

  pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC (2024-10-14 10:02:13 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.13-tag2

for you to fetch changes up to f407af78c8d3b6035f81152b15ad67063f42514e:

  pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell helper (2024-10-25 10:43:18 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.13 (take two)

  - Use the gpiochip_populate_parent_fwspec_twocell() helper.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell helper

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

