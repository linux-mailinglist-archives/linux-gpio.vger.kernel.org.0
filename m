Return-Path: <linux-gpio+bounces-5841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01A8B1D5E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 11:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327251C22CE6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 09:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E9E84DE6;
	Thu, 25 Apr 2024 09:04:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA885281
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035855; cv=none; b=mBcl50v+BQrtqqHx8OyseeYnYRFV8jP0tydc5dNMcB+oT4FGghzAOWKVB/8CLnwsrW6rgwUTF1H5+uSsYL/ZjKVT118DK9sEtqmJu77hcofY3bAMXxM+ojD8GnmnkjrT8U/MkQiyNHcZp9KS+7NfSvUXawtkoksDnwJJyFviTMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035855; c=relaxed/simple;
	bh=uTh7GHlPpVnOmLcrpd8K4m3787VfhIOmjcsRrkwmdZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QrRYSTDNgnMAdtJZLShQ0acWSacK41z4ZLXA7xmLI8q3t+TSTBs3k8AXVP9Ehgpp/11AaKaQJJbHQ9W7tE86KOCSEhYy8H//DvzH1fZbn7bdTLXfWwheIdoSwwjLKvE9gKl+wwBETFGp/AREbskZKsrypzTBJ2TTMeUVw3nLnH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a8cf:a8c7:966f:f6c0])
	by laurent.telenet-ops.be with bizsmtp
	id FM412C00D4stinQ01M410C; Thu, 25 Apr 2024 11:04:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzv0h-0088ST-VD;
	Thu, 25 Apr 2024 11:04:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzv1N-00CHKK-2J;
	Thu, 25 Apr 2024 11:04:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v6.9 (take two)
Date: Thu, 25 Apr 2024 11:03:58 +0200
Message-Id: <cover.1714035703.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit aa43c15a790cf083a6e6a7c531cffd27a5e1fd4f:

  pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration (2024-03-26 09:42:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v6.9-tag2

for you to fetch changes up to 02cd2d3be1c31a3fd328ee83e576340d34bc57d9:

  pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-04-22 09:54:00 +0200)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v6.9 (take two)

  - Fix interrupt configuration on RZ/G2L after s2ram.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Configure the interrupt type on resume

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

