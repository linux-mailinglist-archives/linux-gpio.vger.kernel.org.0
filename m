Return-Path: <linux-gpio+bounces-5411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 393458A2CD2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9111F22C4A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBEC535BF;
	Fri, 12 Apr 2024 10:49:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF443AC0
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918947; cv=none; b=KgMjufAepI12WTvQiloCuEfS8aS2lvb9GWG5oPFtHySwEijOErAfbPo4kCozik0SvKAb+aIWEYyUOJuj1zASB63OxzJS9kqa/ZqnKrsP3uEK9G7JeyhgodehfC1sysidOsU/PL0K7ATzAPm4kb92Pd1GaJ5M769UO4p7GkSgqYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918947; c=relaxed/simple;
	bh=c7uGBSgj4i54t4cuUVmXTwG47NlFc+8aGQoUG+2Uv9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MtU7qAwyMccYhzha6GXEdBYKGS1QooIgitV4ZKao9kDODqjtG7Xb58TD0l+/ImzMnKTDvoxjy8ylD/whuyC7M8OpX5bXojG78D9B/rmCIERvbFPFi7dmwhB+4PYhJ6gW0JmljFsNmitIVblJhDk/YNNM3OEG6Ccaed0vf3Dds20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id AAox2C00G0SSLxL01AoxX9; Fri, 12 Apr 2024 12:48:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESF-00GpBe-KB;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDjV-004eRm-Vf;
	Fri, 12 Apr 2024 12:02:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v6.9
Date: Fri, 12 Apr 2024 12:02:07 +0200
Message-Id: <cover.1712915891.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v6.9-tag1

for you to fetch changes up to aa43c15a790cf083a6e6a7c531cffd27a5e1fd4f:

  pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration (2024-03-26 09:42:37 +0100)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v6.9

  - Fix a dtbs_check warning on RZ/G3S,
  - Fix a lockdep warning on RZ/G2L.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration

Lad Prabhakar (1):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow 'input' and 'output-enable' properties

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  2 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c                       | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

