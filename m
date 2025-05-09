Return-Path: <linux-gpio+bounces-19869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6A8AB174A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5581C433E0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B01214213;
	Fri,  9 May 2025 14:23:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD621322B
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800593; cv=none; b=reDKQKKZ75xaQJC7U7Or6dUAamKbvY70E553+HYg+vrMUHYODlaH3+6dsBWzztyV+xQZbAlGPshPDPg/CEhx1CIYaq6dmC+Nid/48gEriTQyYqkqAVGXxHfGe3j915v/hIhCn+TA/T/cAAoErCk9eycCH8NxJbYv+9nNJNiyvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800593; c=relaxed/simple;
	bh=obJkd9WGAuftSV+F1A8lyd3qbmAonWRx+gsKIOa+NlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+rgV/LbBDxsCEg87Okcaq9BkBa9jCEHJozAIer2Ky5mlUF/oBkFRFKWWNdS3D4p52zHwyOq0lOS1hOgSbs7CuNauiRosvGt3eSbt6COtA9ljX8eXI2Nd8DoUqdgg1nUj774eTIiV05KS0EonvK4w8jTS/9bXeGbz6kL+j0+9js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by michel.telenet-ops.be with cmsmtp
	id n2PB2E0093X0DE5062PBrH; Fri, 09 May 2025 16:23:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOcx-000000012O5-2q1y;
	Fri, 09 May 2025 16:23:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOd5-00000003AEw-13Kh;
	Fri, 09 May 2025 16:23:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.16
Date: Fri,  9 May 2025 16:23:09 +0200
Message-ID: <cover.1746798998.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.16-tag1

for you to fetch changes up to 5488aa013e9ef17c4c7aa8c4e6166dd89c69c3c6:

  pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC (2025-05-05 10:50:10 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.16

  - Add support for the RZ/V2N (R9A09G056) Soc.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC

 drivers/pinctrl/renesas/Kconfig         |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 299 ++++++++++++++++++--------------
 2 files changed, 170 insertions(+), 130 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

