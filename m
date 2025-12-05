Return-Path: <linux-gpio+bounces-29282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16723CA70BF
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 11:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20F7328BA76
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 09:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD9F32F75D;
	Fri,  5 Dec 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixLgXaUP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7F288525;
	Fri,  5 Dec 2025 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928477; cv=none; b=juyHLRtHfRxt2adebR8IZJ4JuEhb8uR6nafxh8AURHHku9wIG7RqgD99icdnIEDKjcznDOoNxRNThvIxFTThftY1jL4eqULTsB6/yYE9Sebqya0U/aY0mYSS8YVsG0Yz5czEbMF1l+xyna7XlB2PgMqpVrq6/+LezJIWTECBjE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928477; c=relaxed/simple;
	bh=Xy5WM2ds05fRQ9SEHNUMSApbyaxp2zBHCy8jRKTl1vI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mEdoSxWZAZqYH02uKLLx6fIG0eWFGhU+57XQNVzatkAzJGIkhQ14Xy8BN9JURjSSciXFklAav83oPgI8UTwa7Y2olZ+czGo/u+HFSoCPEvSeegWmJUa33XlLJb44mmtBmz6nXz8mAlgXPpT6TzrErKiV2+jaXo3z8lvGJqVSQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixLgXaUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBF0C4CEF1;
	Fri,  5 Dec 2025 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764928474;
	bh=Xy5WM2ds05fRQ9SEHNUMSApbyaxp2zBHCy8jRKTl1vI=;
	h=From:To:Cc:Subject:Date:From;
	b=ixLgXaUPKe9kcVv4j011s9O4MBKpyQFB2oPv7Dnq43Lbe72Gf+HiVGKr3au2EL//B
	 NEo0DZU+iiDikYGNGd4JgS//Q+P/emNAw8Nif3KPzEaVZ0qywRf7GQW9OSRp4ETpEe
	 eV/++R7F1Dp3U47Hag5tjIvQUwOdAg3e9ncR/pMvWbK3ybe/4RrmvTwiFThqdgXbuC
	 IhiuXPaAc4XRIy8etpgxaqpca0WJt5F3BtOGZlva0vbcqtqyLqdykn3WSd2xjkdDbq
	 JxGHIXP1C+DW7q7EH//cS5h02CUhmo80Z2IJn+YnhqMpG+ajhu21zoD+V+XHgKJOOL
	 xPQb3CTk41xpA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] gpio: tb10x: fix OF_GPIO dependency
Date: Fri,  5 Dec 2025 10:54:09 +0100
Message-Id: <20251205095429.1291866-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting OF_GPIO is generally not allowed, it always gets enabled
when both GPIOLIB and OF are turned on.

The tb10x driver now warns about this after it was enabled for
compile-testing:

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

OF_GPIO is not required for compile-testing and is already enabled
when the driver is usable, so just drop the 'select' line.

Fixes: 682fbb18e14c ("gpio: tb10x: allow building the module with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 02099ef48f22..e9dc19ce3545 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -737,7 +737,6 @@ config GPIO_TB10X
 	depends on ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
-	select OF_GPIO
 
 config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
-- 
2.39.5


