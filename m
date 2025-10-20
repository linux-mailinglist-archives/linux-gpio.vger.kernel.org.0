Return-Path: <linux-gpio+bounces-27295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D225BBF0077
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4D0C4E5585
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0CE2EBB84;
	Mon, 20 Oct 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLghJxFb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003C1A4F3C;
	Mon, 20 Oct 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950332; cv=none; b=VB1dElU5xTqTosZO0WmPX6DCzNC9RBLDit/M2UDN54pMQ4WZchS4xBwRhf+DOzm+8QZsO5bGleTey04TCnsxR+NpZSwXMVJ5u3LjpWnVZsBkGgaE6nbyQJ10ivygL8CbXR7rcQSmpPrjtKtnbL9JtBOC5ss0JqQfMQe9DsqBxDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950332; c=relaxed/simple;
	bh=dvc6fYAioltejO7peNrfbDi7BiFRZGjjqEdY4mQmXGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n5i15/jf5fXH7xiSt5JvMixoP8fmnmd21+UNwLNwvpjYo8UEIvI6tyYSjcZXKyU1E9AIxGrtXxfldDaAzitgvolB47l3xznZkHYph6m1kTuh+KJJZl2bHU48oiTs4wJc4nQgFcpjoepQFwjXwQxZlkxWrRLfUvqqG1RGPYdN40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLghJxFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6233C4CEF9;
	Mon, 20 Oct 2025 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760950330;
	bh=dvc6fYAioltejO7peNrfbDi7BiFRZGjjqEdY4mQmXGs=;
	h=From:Subject:Date:To:Cc:From;
	b=sLghJxFbbY0pkoeIuiOzWtR6qZbpYUhB4lP2UJeqUKsrJEFjdv6VqehPDyw3TdI91
	 pWLfq2WMIqIkDCkJWdZVfnXBn76LQ9ci1myy15jJxOmwwax+7HWIoffvofamXrx8bi
	 S0jcu3TmtmH9KXnh8uHaEzgCIcETUeK3QnMn1ux0UkCOSPM4gcbNjBcM/lHdCTc5x9
	 UkCDZB2kfytbO3vEjnrvv6n8u3bIEZ40bBqGrDjJTbxDAHI/PCTKjQvOnxop0vvv40
	 5tNyI5nYRYcFjL/V6Ml7vRThN70ZBaI8Ni6jOThQOyg1g361xj+S4KY20G9gIVNLm+
	 KB6CVymXdBvJw==
From: William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v2 0/3] gpio: idio-16: Fix regmap initialization errors
Date: Mon, 20 Oct 2025 17:51:43 +0900
Message-Id: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/49WgC/4WNwQ6CMAxAf4X07My6CENP/ofhsIwyGpVhh0RD+
 HenHjx6afJe2r4FEglTgkOxgNDMieOQwWwK8L0bAiluM4PRpkSNVnX8UGHkmH0eWCmhcHWjQlM
 b3/qycriHfD0K5dXP51PzZaHbPQemn+w5TVGen/qMb/s/NKPSyllvUde6szt9PJMMdNlGCdCs6
 /oCfGximtQAAAA=
X-Change-ID: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Michael Walle <mwalle@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=wbg@kernel.org;
 h=from:subject:message-id; bh=dvc6fYAioltejO7peNrfbDi7BiFRZGjjqEdY4mQmXGs=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlff1jmMm64yHxt5w4LP6XA5Iz1V51ld1RwP56s9X0lZ
 9bVl6XCHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBEzF4z/NPLKbZlVPJ5KbGJ
 /VBng6TOFU3fxZy84hfPlh9vVXpxLYGRYfvipiUPIxTfRcobFkvG+q+zirirE+mf8eFp8gaRW/8
 F2QE=
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
utilize regmap caching and thus must set max_register for their
regmap_config, while gpio-idio-16 requires fixed_direction_output to
represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
regressions are provided by this series.

Link: https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.org
Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
Changes in v2:
- Pick up Reviewed-by tags
- Replace Link tags with Closes tags for fixes addressing bug reports
- Link to v1: https://lore.kernel.org/r/20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org

---
William Breathitt Gray (3):
      gpio: 104-idio-16: Define maximum valid register address offset
      gpio: pci-idio-16: Define maximum valid register address offset
      gpio: idio-16: Define fixed direction of the GPIO lines

 drivers/gpio/gpio-104-idio-16.c | 1 +
 drivers/gpio/gpio-idio-16.c     | 5 +++++
 drivers/gpio/gpio-pci-idio-16.c | 1 +
 3 files changed, 7 insertions(+)
---
base-commit: eba11116f39533d2e38cc5898014f2c95f32d23a
change-id: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>


