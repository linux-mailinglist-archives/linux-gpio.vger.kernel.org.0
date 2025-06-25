Return-Path: <linux-gpio+bounces-22121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D68AE7977
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91062165A54
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B21C20299E;
	Wed, 25 Jun 2025 08:05:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0D1E5B95;
	Wed, 25 Jun 2025 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838752; cv=none; b=QCbNdHte/2HrS23h2A3DSzP2fmpbuLmm+kgYS5+qq4l+tC975ht64QUP9/nWpgCbz6cuMRINDRHSHNxaGGlcMazWO0mcxpkkxge/Xoi4S8KxyXUq9nk3QR/dkkTYhGFpYE1cWzO9uCAusx40HM/7gfcGxww1Nbwrw+bU0r858eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838752; c=relaxed/simple;
	bh=Y4bCsEI+ih9bRnJ1UnwcgedvEQOpokYbLokruvKgop4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOO0mPngoGBSwxHWIarFv3hW37FuAVCihvOsmHCsuLTh9dShI/Oh0LszpgOHyS9OlZCk9o73bqT0JmQIeKVmU4uttrvLblJLBiUfmgdpWeZQQgBGfzHmREufIc7K3ebU9/UWum3/uREt2Qyy7/UyaRrlZV26J4bjBPvN/9gEKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E32C4CEEA;
	Wed, 25 Jun 2025 08:05:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: rcar: Use new line value setter callbacks
Date: Wed, 25 Jun 2025 10:05:45 +0200
Message-ID: <cover.1750838486.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series converts the R-Car GPIo driver to the new line value
setter callbacks.

Changes compared to v1:
  - New patch "gpio: rcar: Remove checks for empty bankmasks".

Thanks for your comments!

[1] https://lore.kernel.org/b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  gpio: rcar: Remove checks for empty bankmasks
  gpio: rcar: Use new line value setter callbacks

 drivers/gpio/gpio-rcar.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

