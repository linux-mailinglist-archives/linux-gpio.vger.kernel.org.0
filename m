Return-Path: <linux-gpio+bounces-2340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F96831D91
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 17:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13BB81C21F39
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 16:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AF224B3D;
	Thu, 18 Jan 2024 16:32:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE91E494
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705595577; cv=none; b=l53RYlQXlvuIKiavC4oNP66BAzC0h10skwLFnZuVFsonnk/d0TfWvTUqGAQFaDIv01FKTmw0t9pmzgCy1FXvy50a+l5oYf5JcZgIvPwKmz1jvn0OeN8JwqIk+x1KhxnkQG/serTcbxERElqdAB4hhfV/OY1oOelNkFUaOw5tNoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705595577; c=relaxed/simple;
	bh=QEjaNhBGKA3YyvmwXEl+cjtVAcdleNOs+cWk5nQanQo=;
	h=Received:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=lauD0iVda+ow1ap6giX7HwVN3cdRtD6x/JGvncqahlT6A0IhiqOCWV8tRMhIExHp7Li8a4fjxJJUV3BS6f7seruGqBAEADyJKxPZhHb3MKMjeKzM9V3fRW0yDxZ59Av1fgYnV3fyyski4By3b3dfjNhL/JgQgxpeUs0+EKmjoeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ba0a:9cd8:eeb4:49de])
	by baptiste.telenet-ops.be with bizsmtp
	id cGYl2B007041RrH01GYlnh; Thu, 18 Jan 2024 17:32:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rQVJ7-00FqQH-T6;
	Thu, 18 Jan 2024 17:32:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rQVJs-001nEd-VR;
	Thu, 18 Jan 2024 17:32:44 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Phong Hoang <phong.hoang.wz@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] renesas: r8a779g0: Add missing SCIF_CLK2
Date: Thu, 18 Jan 2024 17:32:35 +0100
Message-Id: <cover.1705589612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

R-Car V4H actually has two SCIF_CLK pins.
The second pin provides the SCIF_CLK signal for HSCIF2 and SCIF4.
The first pin provides the SCIF_CLK signal for the other (H)SCIF
instances.

This patch series adds the missing SCIF_CLK2 pin group/function to the
R-Car V4H pin control driver and to the R-Car V4H DTS file, and fixes
the HSCIF2 and SCIF4 DT descriptions to refer to the proper clock.

As SCIF_CLK2 cannot be used on the White Hawk development board, I could
not test proper operation of HSCIF2 and SCIF4.  I did verify that HSCIF2
and SCIF4 do not operate properly when trying to use (the first and thus
incorrect) SCIF_CLK as the clock source.

I plan to queue these in renesas-pinctrl resp. renesas-devel for v6.9.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: renesas: r8a779g0: Add missing SCIF_CLK2 pin group/function
  arm64: dts: renesas: r8a779g0: Add missing SCIF_CLK2

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 12 +++++++++---
 drivers/pinctrl/renesas/pfc-r8a779g0.c    | 14 ++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

