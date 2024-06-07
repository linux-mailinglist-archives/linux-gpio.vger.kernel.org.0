Return-Path: <linux-gpio+bounces-7247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDA900072
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6324928978B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7876015B969;
	Fri,  7 Jun 2024 10:14:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A013F016
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755251; cv=none; b=mpOEj+B2eI35fV2t8aot7+hD+RDcyXgrBgkQO5YLaBWuUrUL7hv2T9d/OouNUiCsb7xUA+w0ocKlknLxr9d1RvRAS45b1wQH/7nUe7LG04iUrslROahgZis7AZt8QCHMnHHWcRnUeZk/1zOy2yNTez6dbdvtOwz+IOvmHzNC8RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755251; c=relaxed/simple;
	bh=4TY0fau/yTVqLJLKEXa5oVIqmFvR5rt54q0zSz91W20=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OL42Wm/xakhdi2Z/S21G6fiCsDOjwJEA7FXOFfdxxUJjBndfqrchG0rBcRzmtDBGlNi+7h9r37zk3KPv/f/VFUIk2HAsReNXyKhIcbVbR+1f7VBPOJ0xhWP5JD141cteEl3swuzw2wuJXr0tXE4yngXJgujAsczNI+A0QElCjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by xavier.telenet-ops.be with bizsmtp
	id YaDz2C00N45NznL01aDzVt; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWad-00ECgG-Ut;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200U-C8;
	Fri, 07 Jun 2024 12:13:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>,
	Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	CongDang <cong.dang.xn@renesas.com>,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] pinctrl: renesas: r8a779g0: Fix pin group suffixes
Date: Fri,  7 Jun 2024 12:13:47 +0200
Message-Id: <cover.1717754960.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

On R-Car SoCs, pin group names usually have a suffix ("_a", "_b", ...)
if and only if there are alternate pin groups for the same function.
At the time initial pin control support for the R-Car V4H (R8A779G0) SoC
was introduced, there were lots of ambiguities and inconsistencies in
the naming of pin groups in the documentation, violating this convention:
  1. Some alternate pin groups may be named identically, without any
     suffix to differentiate,
  2. In case of two alternate pin groups, the primary may not carry a
     suffix, while the alternate may carry an "_a" or "_b" suffix,
  3. A pin group without an alternate may have an "_a" or even a "_b"
     suffix.
So far the driver followed the documentation, except for case 1, where
an "_x" suffix was added to one of the alternates.  The plan was to
update the pin group names when they were clarified in the documentation.
As technically these names are part of the ABI, they were clearly marked
with "suffix might be updated" in the driver.

Unfortunately the pin group names are still not updated in the latest
revision (Rev.1.10) of the R-Car V4H Series Hardware User's Manual.
However, the newer R-Car V4M (R8A779H0) SoC is mostly signal-compatible
with R-Car V4H (they are not pin-compatible, as R-Car V4H has many more
pins).  Hence this series bites the bullet, and fixes the ambiguities
and inconsistencies by adopting R-Car V4M pin group naming (from Rev.0.51
of the R-Car V4M Series Hardware User's Manual), and following the
traditional naming convention.

Note that this does not affect any upstream DTS files.

Thanks for your comments!

Geert Uytterhoeven (8):
  pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
  pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
  pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
  pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
  pinctrl: renesas: r8a779g0: Fix IRQ suffixes
  pinctrl: renesas: r8a779g0: FIX PWM suffixes
  pinctrl: renesas: r8a779g0: Fix TCLK suffixes
  pinctrl: renesas: r8a779g0: Fix TPU suffixes

 drivers/pinctrl/renesas/pfc-r8a779g0.c | 712 ++++++++++++-------------
 1 file changed, 348 insertions(+), 364 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

