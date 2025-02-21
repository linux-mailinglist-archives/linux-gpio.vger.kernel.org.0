Return-Path: <linux-gpio+bounces-16400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D287A3FCB3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 18:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB497A6B33
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C25C24396A;
	Fri, 21 Feb 2025 17:02:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2B23CEFB
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157334; cv=none; b=k7n89FD3XfAfxA/tdQ8tri4mNgogsew3XRPo+YB5oydsPaFQ3w0TaHgAxzfV94piJPVAS4Ri+EAosaaCFPynhVy6O+POO6vwWX6RkTdA7sMAxmDAOQrcUBA+y/GMH/XhEFo7TrEfkY8AH8txoQ/Atnn2qAOANIQpP9ljRxAlK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157334; c=relaxed/simple;
	bh=NmoUzmlc2gFy8DtJW0mf6WyAUDiPuHGXJ/F/L5mJS2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pp05KLlbLJwra7uFiDug8M6WyCABWdrF9rb4fwfhqyOBUt7D78BWgFDfKuE5ruejVLBrXvtJH2o9pY8yz7c4sgRqmvb/9WUG9wn84KgjNIqS27uASmmz8J4Ysyz/bdveSofsg0bOzxuJT/8dO1bVxzeaKH+omZMEv2R48rm56SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by albert.telenet-ops.be with cmsmtp
	id GH2A2E00D0y8aK506H2Ay4; Fri, 21 Feb 2025 18:02:10 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWPO-0000000BMt0-0Lpo;
	Fri, 21 Feb 2025 18:02:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWPi-0000000EP6Y-1sDL;
	Fri, 21 Feb 2025 18:02:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.15
Date: Fri, 21 Feb 2025 18:02:09 +0100
Message-ID: <cover.1740157176.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.15-tag1

for you to fetch changes up to ea4065345643f3163e812e58ed8add2c75c3ee46:

  pinctrl: renesas: rzg2l: Suppress binding attributes (2025-02-20 17:33:08 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.15

  - Add suspend/resume support for pull up/down on RZ/G3S,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Chenyuan Yang (1):
      pinctrl: renesas: rza2: Fix potential NULL pointer dereference

Claudiu Beznea (2):
      pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down
      pinctrl: renesas: rzg2l: Suppress binding attributes

 drivers/pinctrl/renesas/pinctrl-rza2.c  |  3 +++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 +++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

