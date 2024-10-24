Return-Path: <linux-gpio+bounces-11922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73A9AE079
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F32BB21D85
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A580D1B6D1D;
	Thu, 24 Oct 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEL23S80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646EC1AF0D6
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761661; cv=none; b=oqSZF75SmRmlEa98v9V6je2vwmjfoWaLhTaheIQqtNp1Gse4M+2d9u0UCsBjAOb3TV7T9+XgRXmuCvM1Wox++Eoj+WjeAgmnV41Y4vFhLbKiG2DeNUvPs+RMjEV5rAW5VB5dzc5xD9jLVy38wrul7zDzfEnGTxavg2wVq+cpxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761661; c=relaxed/simple;
	bh=vImzgiAtzKcG69XdgVcXBbPf3iD1rR7GcP6TJ5YcTR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmU5RrnpftUcDmTrVc+18UW11PSwPO+mnZiFyHqPWqYwtOmKxRs3lc+9sP8r7lRGaHGf5GqymWWWtj9xBbq/dFRA6iGJWAavYaLem4yyWkCETU9SLbGFhaTvsb+TIMKYl+D7ZnAFPjiIsbvEx1fH4D+WmGTHx562oXZwVjKAhvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEL23S80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F2AC4CECC;
	Thu, 24 Oct 2024 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729761661;
	bh=vImzgiAtzKcG69XdgVcXBbPf3iD1rR7GcP6TJ5YcTR0=;
	h=From:To:Cc:Subject:Date:From;
	b=WEL23S80V9b6YPrPks4ltbKqlQVvMYX5+SXsvvOKVz14rnsjppy35rL9nKw19/TIf
	 KpUv+P+kAPszY0yrlh9jzaPbouQfIm0oeJwAB9q4vPnmbFi0uFTMzSrK48VuPRhlhv
	 2jbBMFAtc3xL+q0B9k9e0ak304LBx//Q3lH5aq766UwPKzo/CJvnixOCe6PkQWu2pd
	 VPcFaqhX2l50459KK8Dzew/4RnjRQYzzqexF/8A1jh74jSsSvoeXcZaNFridXqHetc
	 I0V2yaaDZrvS/uFNXMWgwZ0VMRak8jRuDH7GLx96EhVxb0E+f/f8+iiIGXCznKvHyL
	 GE7nylwzzI8Rg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v8 0/1] Polarfire SoC GPIO support
Date: Thu, 24 Oct 2024 10:20:31 +0100
Message-ID: <20241024-tipping-browse-c0d582b16a47@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yOgnWNuK31tzY8e43/qWcNyNHPUylDi0ve510OJBB74=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSgvHhC+a37zwwM0vpciqfXZQ12x63A7dmtypMV6zt7 +GyNn7cUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIm07Gf4H7SieZbw2R4j+7BA y7DFKp+lZm5Kn7ckL4tB5ZV4YszJFYwMLb9S0yZ2vxK8OUciIzZf+e20xGuaL9gPNUw5Icr61+Q XLwA=
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

 drivers/gpio/Kconfig     |   7 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 178 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.45.2


