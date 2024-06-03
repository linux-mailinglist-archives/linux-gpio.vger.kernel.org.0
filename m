Return-Path: <linux-gpio+bounces-7049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D638D7D94
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4792B240AD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37C377A1E;
	Mon,  3 Jun 2024 08:40:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E15F876
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404009; cv=none; b=Ao7fcTB4Abc+HlPKnTLu+5CmrA1rthqRVBhdXQh+PliCHyYIB9+aeapAwYMxBbM9EXmA+ZNGfVpgDnDNazt+zOteTvBtQb5hMuaFcXDilgyOsiyPKS29n/ZsO0hCGK/+O1LRfKDzneGTdbC2kMrGvllfm1enl4hCqQIx1jn1Aa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404009; c=relaxed/simple;
	bh=I5BA5kuAckXBqhTclyBljTci2NtDV43AARxaaykggWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H2X0VC34VGegokBQlN/NbStPPbJ/7SY2+yxrWMx3qPYJdM/xs7N1nGsnKaU2bQEomjZ6SR2LCs4lGUE02GOjBFS6/cmO8qs0gFunHbKN2OH1DwcFzq9dxRswZo3BXfDIge/wuu3xprPB0bnJxgvxYg2QeayrnTq1z5/F7gaeBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c27e:bdcb:87e1:8906])
	by xavier.telenet-ops.be with bizsmtp
	id Wwfz2C0020wctXj01wfzqU; Mon, 03 Jun 2024 10:39:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sE3DW-0088Vk-78;
	Mon, 03 Jun 2024 10:39:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sE3EV-00GpUt-26;
	Mon, 03 Jun 2024 10:39:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v6.10
Date: Mon,  3 Jun 2024 10:39:57 +0200
Message-Id: <cover.1717403902.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v6.10-tag1

for you to fetch changes up to a39741d38c048a48ae0d65226d9548005a088f5f:

  pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore} (2024-05-27 17:13:31 +0200)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v6.10

  - Fix PREEMPT_RT build failure on RZ/G2L.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

