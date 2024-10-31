Return-Path: <linux-gpio+bounces-12361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 695069B7A36
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3CB28178B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C9119CC0F;
	Thu, 31 Oct 2024 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rP4A2to4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF319CC11
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730376282; cv=none; b=QlgnLPCSDyS56Q5lPxUi1TfW+83LB4M2d+8WOdJpV0Jxh1a/KQcYxzRmFinAqxkv1b5715b2rgcz3RYzm3b5jGtYVGmwJv7jPQp+ljOUQBi9cb0ne1h5h9J4rsUwD1BGIcF89SO5+9oYfC9WDx8FFCH9i5rBdvw72mH0jvKVkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730376282; c=relaxed/simple;
	bh=EmvrBFLW1hRGPyDWPbdJGvNnPSF/Gyv8kUGUW9kTW+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=edurWUBzhVeQynDmuKP7/U5L6XUUyNkGPfzGKKuAHHm07ouGu5WHjd2qvLItk7g5WwZWLX9VMEuu8qtM6QrHeGaBLG/ptlKcXNcaPp+/7fz3vIiDhcRZ9SHkqsbbhQ5My6mB+UYbExRqL9NulNtXHh4P3TcvqI7/1UmP3EyNwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rP4A2to4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32C0C4AF53;
	Thu, 31 Oct 2024 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730376281;
	bh=EmvrBFLW1hRGPyDWPbdJGvNnPSF/Gyv8kUGUW9kTW+c=;
	h=From:To:Cc:Subject:Date:From;
	b=rP4A2to46yLp3640XWlTkPvTx+58UR8J6eex5lmCrsD02XG6CDxkyuOXGNrXJ6lQe
	 qyAcgguOyvM2l21ySeF8JqPXf4IOHmPVS+pnKRrDlvu93L8WQ4MWWvKyQkMi84MTcN
	 BA8wLC8pW9tZzDVEfbEdy+Khh0DyBG6pn4YV9ZHViKX1gKlZ+rZrw/Ly4KKIOuZqYg
	 btCluDRGvETCO9ltnoWuvBRp+hlGjxkm5UJ06TijsvBX68wGkn8oKNZyWsVtC6825h
	 gue9jnNDimPuzJnRrwto+tO8Hnq4opFRkMQCWwaEtQFnOtlDnAhFLWWewiZtmvwT0M
	 eTK1SjFT9My8A==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v9 0/1] Polarfire SoC GPIO support
Date: Thu, 31 Oct 2024 12:04:25 +0000
Message-ID: <20241031-scouting-earmark-6b4dfc6bc6e2@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xaaardwIdf7HNpbphNwIJ30gMOaGQm9oyLRUtxPbk74=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnKRZ7zJRryIzMWvHohxnO1ifP8nhL+5sW+umuZltrLn vmWs0e6o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhOsnIcGFq1hRfkQ+zrk/R /bOK72Cr5qH9VQWyZfHqT9va38hP9GdkOHb7yU/rmyUXf884dLWb1+gQ+5L6fbF6T9r+17jsyuM X5QcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

Lewis is no longer at Microchip, so I've taken over the GPIO controller
patchset that he had been working on prior to that:
https://lore.kernel.org/linux-gpio/20220815120834.1562544-1-lewis.hanly@microchip.com/

One thing that was wrong with Lewis' series was that it could only,
depending on the iteration of the series, support GPIOs that had their
interrupts muxed or GPIOs that had dedicated interrupts at the
parent interrupt controller. I found that to be problematic, because the
hardware itself always has a mix of muxed and dedicated interrupts and
so there was always a controller rendered unusable for interrupts.
I attempted to fix this by remodelling how the interrupt hierarchy in
the devicetree is described, with a mux added between the GPIO
controllers and the platform's interrupt controller. v7 introduced an
irqchip driver for the mux between the GPIO controllers and PLIC to handle
that problem.

After some discussion with Linus on v7, I've opted to strip out the
interrupt handling entirely, in order to upstream this piecemeal.
Interrupt controller support will be added at a later date, when I've
sorted out the bits that Thomas did not approve of.

The binding for this GPIO controller is already upstream, so there's
just one patch here now.

Cheers,
Conor.

v7: https://lore.kernel.org/linux-gpio/20240723-supervise-drown-d5d3b303e7fd@wendy/

CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: valentina.fernandezalanis@microchip.com
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>

Lewis Hanly (1):
  gpio: mpfs: add polarfire soc gpio support

 drivers/gpio/Kconfig     |   6 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 170 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.45.2


