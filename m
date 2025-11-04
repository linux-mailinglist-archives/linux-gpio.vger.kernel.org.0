Return-Path: <linux-gpio+bounces-28036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D8C32339
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 18:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2794631D7
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 17:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE1F338592;
	Tue,  4 Nov 2025 16:59:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E3285060;
	Tue,  4 Nov 2025 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275594; cv=none; b=A9Vn+38CSBYcbaOM3C+KVMIr4YU9sXYdAhwNyIGH3c48m51w5A3DxWPz+V7eTpNG3Q9XZnxldcyzzPcZR+7WiR39qTLpfQOuJ9YB9/UYRuSDTP0Wup6PKQTQZ6kU4TkGjSP9zt/AXSj7x1dQC5p4mtI1acZf7f6QTJznBZylz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275594; c=relaxed/simple;
	bh=eMd7EkAQneD9lc7vyabvpXecKr0O34QKMqKJdmzrgRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OhOQ/+dueyys4XgPLvDoAa66F9sgKS6cAH3E4sUDFBthYTqKcA+8nNz0l6uPjd6y+iM/cQ8/MeEBvgocGBaNSUgvAnZzqJNWBtjeaVoDU+ZqN0mn8l5/nkqUe/8zVzIhMLH0qQIiLVasdzqYcQ/k2fq+HHi0a6zxMdXP169ESwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17FEC4CEF7;
	Tue,  4 Nov 2025 16:59:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] pinctrl: renesas: rcar-v4x: Remove removed signals
Date: Tue,  4 Nov 2025 17:59:42 +0100
Message-ID: <cover.1762274384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series removes descriptions of several signals that are
further unused and were removed recently from the R-Car V4H and V4M
Hardware User's Manuals.

I plan to queue this in renesas-pinctrl for v6.19.
After that, the corresponding files in U-Boot can be synced with Linux.

Thanks for your comments!

Geert Uytterhoeven (1):
  pinctrl: renesas: r8a779h0: Remove STPWT_EXTFXR

Thanh Quan (1):
  pinctrl: renesas: r8a779g0: Remove AVB[01]_MII

huybui2 (3):
  pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
  pinctrl: renesas: r8a779g0: Remove STPWT_EXTFXR
  pinctrl: renesas: r8a779h0: Remove CC5_OSCOUT

 drivers/pinctrl/renesas/pfc-r8a779g0.c | 100 ++++++++-----------------
 drivers/pinctrl/renesas/pfc-r8a779h0.c |   6 +-
 2 files changed, 35 insertions(+), 71 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

