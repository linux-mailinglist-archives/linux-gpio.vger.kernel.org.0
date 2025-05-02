Return-Path: <linux-gpio+bounces-19565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C00AA7AF3
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 22:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5333A8516
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 20:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23921F1511;
	Fri,  2 May 2025 20:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHCQC3dy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB5A14BFA2;
	Fri,  2 May 2025 20:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218246; cv=none; b=nFznircMhmcBJNoLYmriuMWwnKdd5bnXlwqZmFWlmTVuJBcm8nRV/fakgEC17NCSnYYHDSGuCGiqGhXftLRUqklM5VAVVCkdc7RaQVnx+vqPMCzAJEN/ntlGkjNCK8xZeGHjO/TeEqXyPMQrnf+sU3GQ0cOK3NEylzqgdYE4Hg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218246; c=relaxed/simple;
	bh=stQodKNJPh75O/Bxldo7xJTk4UkT2CjGEElZCBFHLEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sz7c3tkrqXMZZBb3IYPB6k5ZVcxPLMcxHJOP7Yx6Y0qT5q0xmMH3CPmxfx3pEDDXZeuOsVFba9FFDT7mVD0NwY4WodXUDtcelA1L1AhugcdVWidB/9KRgaqqpkeRs/VCakHLyAc5+v6+hfSQp9HXjeuIDUc+pPF8xNnEpa6ABac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHCQC3dy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462E1C4CEE4;
	Fri,  2 May 2025 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218246;
	bh=stQodKNJPh75O/Bxldo7xJTk4UkT2CjGEElZCBFHLEk=;
	h=From:To:Cc:Subject:Date:From;
	b=JHCQC3dyZumSUfC3MvwLsnHI/yd5fF1vxl7qiUwd0VMZbULVax9fbNmY2fdFSSdwD
	 IKpC9oZfwk0F1Y+EexsZfiHv0cztYYvCrdDPva5CVZ9XMJhQspjKORxfx84yGQzlfA
	 24UmTS5plNpvl0NAu2KeJ6CFB8MLusJI5xPT5awJDl75wMlRRk6tkSy/rueNwxK0ph
	 uTpCkHM82U5DQ/vEfVgKefDi7gwJoDGk/X9pceAuvYsWxY/TC7nZkhd6eqzo7h1/lo
	 xInWuClz3NCuyslP7+EKIMXGbMfZ/ibioWZELacxmxK2FK/rjcDThe5gDuS7GsZtgH
	 SDaGPsF8QXUJw==
From: Arnd Bergmann <arnd@kernel.org>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: blzp1600: remove incorrect pf_match_ptr()
Date: Fri,  2 May 2025 22:37:07 +0200
Message-Id: <20250502203721.2117186-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The blzp1600_gpio_of_match is defined unconditionally and can always be referenced
by the driver, so don't use of_match_ptr() and avoid this warning:

drivers/gpio/gpio-blzp1600.c:263:34: error: 'blzp1600_gpio_of_match' defined but not used [-Werror=unused-const-variable=]
  263 | static const struct of_device_id blzp1600_gpio_of_match[] = {

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-blzp1600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 2760a13c0801..055cb296ae54 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -269,7 +269,7 @@ MODULE_DEVICE_TABLE(of, blzp1600_gpio_of_match);
 static struct platform_driver blzp1600_gpio_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(blzp1600_gpio_of_match),
+		.of_match_table = blzp1600_gpio_of_match,
 	},
 	.probe		= blzp1600_gpio_probe,
 };
-- 
2.39.5


