Return-Path: <linux-gpio+bounces-8968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310D95B143
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 11:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7034DB235D0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 09:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507E5170A37;
	Thu, 22 Aug 2024 09:14:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA91791ED
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318070; cv=none; b=sXu8F2vLOYbYbUUUjOoytGb4+xIDBHxP83a1DGPkWKc33vP9U6rCBOrpaRslgfqcGtdHGjICz67Q27S25ah3Pdb7Cod4y5QyKLGYFd9HnQsULyr2FCMqlZM+EbABnPL6nz1lltc6+ffgtkAIUbdlg1O8Kjh99+fZga6NrvQjWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318070; c=relaxed/simple;
	bh=wF+QAyOQ4VctccZePXj/y/9c7mRs6JICPakmiDpZJcc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mqbDkU4oRjCxYbaD3qOPYRMBbX0ZHukmCdYcGYTfDZqpejkSrdz8CEIrMCBpLeXui2Jr5mcFwXtaIRlwBe8h0Mh6VpZExrZDT+TIBhuWATbhhnjJgDbJgvZJA9ipkU5dt44xIUePrE8UULykC4/Kh/yzbQD0mtwdrPiAlgWH7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by xavier.telenet-ops.be with bizsmtp
	id 2xEL2D00L22R5AR01xELho; Thu, 22 Aug 2024 11:14:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3ta-000VYT-4N;
	Thu, 22 Aug 2024 11:14:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3tc-002LLB-D6;
	Thu, 22 Aug 2024 11:14:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.12
Date: Thu, 22 Aug 2024 11:14:19 +0200
Message-Id: <cover.1724317862.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.12-tag1

for you to fetch changes up to f73f63b24491fa43641daf3b6162d2a451bd8481:

  pinctrl: renesas: rzg2l: Use dev_err_probe() (2024-08-02 11:26:03 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.12

  - Document support for the Renesas RZ/G2M v3.0 (r8a774a3) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Use dev_err_probe()

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Return -EINVAL if the pin doesn't support PIN_CFG_OEN

Oliver Rhodes (1):
      dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC support

 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |  1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 45 +++++++++-------------
 2 files changed, 20 insertions(+), 26 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

