Return-Path: <linux-gpio+bounces-14053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EB9F9041
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 11:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A358D1648A4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0501C07F8;
	Fri, 20 Dec 2024 10:31:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63551AA1FA
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690660; cv=none; b=UiwWTyVzUNHgvtOemrWN/6I+fD84iU2Jqz7evk9qiMVvkA8dTtfkgJL4Fob7iVljRI52hM32UbbQXyQmvbMUuh+awVmYIVbHe1fh3W3xBc4sMisJZoWUWG58tD9lN0y9Oi9H8MGfwL4tLhExZHj64uAWKqWv2No5pBK/6xIaxx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690660; c=relaxed/simple;
	bh=qIe+lColQq+8aCZKpPrUPx8KcreNFTRmVQQgi4TRyOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shCJufX1n83Ql24b/2uJhhvFs5iSP4dVyIelZEeS/QhmDCsLHB/4mPuIivGfnDY+tvlXg8sei7Q35QdnjK4tw6ERYLQgurHOCgL6qaZ7OE8eZAPmeIeCT/vCLIZnSUofFuGpuk9HrWVE67dq/f6ov7j99hqfuNuuioRxkk6K1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by baptiste.telenet-ops.be with cmsmtp
	id qyWq2D00B5V3mYk01yWqK1; Fri, 20 Dec 2024 11:30:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3a-2f;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaG3-000gOf-0c;
	Fri, 20 Dec 2024 11:29:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.14
Date: Fri, 20 Dec 2024 11:29:18 +0100
Message-Id: <cover.1734690011.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.14-tag1

for you to fetch changes up to 03fc60cd8e7b7e6f330d0a48c54545740addd9d8:

  pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S (2024-12-20 10:58:46 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.14

  - Add audio clock pin support for the RZ/G3S SoC.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 1 file changed, 2 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

