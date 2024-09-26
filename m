Return-Path: <linux-gpio+bounces-10453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542A987102
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA991F26FFC
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DC518E760;
	Thu, 26 Sep 2024 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jRW0hwMU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901717838D
	for <linux-gpio@vger.kernel.org>; Thu, 26 Sep 2024 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345232; cv=none; b=bYvqnj3Ya5fRanifSiG069Hf5lermsfTxFltRBQ4c+Haab11ETur6Kj0FA51FRsEB6xfQmJUrILolBjP1YxX8/lozBnL/uAJXf0XuE1V7PfTuPT4VoU2QsKf0b6j+ChLhOU+nJkIgFHmOytl4yP3Ncz/oehsVMZTRiGVCLesntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345232; c=relaxed/simple;
	bh=LoPQpTOriQJdSu4vmV3g09146e46VFNs93UkugRgVN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewWSl2ucKy2g7r329JHWhTb2e3z0wu8i8VnhBDQSqPcXNj0yRYu9jZJ17Pd/Sz/LR7llLJwBPLTlwHXNhDZv18q+mpIOz13ntIJrLw64QQohaPSm/OZ9KVisO97hXoAx9p8WtWXKnm/U+1BqYUKIA+mC2A//sHijqAHU83SF6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jRW0hwMU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=I//2n5gzqshCD+
	iGlaHBOXkSgVg15p4QKo+GuiHMZ+E=; b=jRW0hwMUYkoWLzgXClIXWfuzqAhVzy
	NzMZ1/0dGAbEYH9Mqm1glkoltQ1PsLuFR3zNGNezyoqW+Isi3sbqPiQdAorZKpZA
	O+oLVtdESIu2IjnGufyWYWNwhp0c6vY1uwaJcXH5Y71kddvzL2Tt//va5kqa7amm
	qqMjwerorr2ELZzKt5z9HYltOavM94HxlRcgvypF+gcuq7OAjxEyiHh4xvRYuBHf
	VjKL0cN1mkJHHvS3EuGt2F98faHJnRhnOmcp33DSJQY6w31edhyy1alSD5evpXof
	zjbLCwm6J8TZwAjkqGiSpilKb66rjMMBlt0hdnCncNV0l8iOv9ZLYOmQ==
Received: (qmail 942439 invoked from network); 26 Sep 2024 12:07:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:07:05 +0200
X-UD-Smtp-Session: l3s3148p1@kf6I5gIjorggAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: rza1: mark GPIOs as used
Date: Thu, 26 Sep 2024 12:06:54 +0200
Message-ID: <20240926100653.15015-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIOs showed up as unclaimed, so they could be muxed to something else
even though they were in use. Mark GPIOs as claimed to avoid that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 6527872813dc..797367ce5641 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -19,6 +19,7 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -750,6 +751,11 @@ static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
 static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct rza1_port *port = gpiochip_get_data(chip);
+	int ret;
+
+	ret = pinctrl_gpio_request(chip, gpio);
+	if (ret)
+		return ret;
 
 	rza1_pin_reset(port, gpio);
 
-- 
2.45.2


