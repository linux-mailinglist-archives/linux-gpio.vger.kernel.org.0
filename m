Return-Path: <linux-gpio+bounces-12230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7C9B3105
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18872B222E1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CDE1DACBB;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBe1H09m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310D1D9320;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119857; cv=none; b=FBrhNxLiyn88oB75rTzAj0t6SAXF6QE8FGdXbqh1zjvJqm6rloRaQNh33jOpYU1llPoyEsUaCAYGCFRlxlEHOx4AdegSpZXSo9QBFk4G6xu/QkQqtdeRVQJNjUlbLZ3xnKFme+kv3hbBrv1dyDngA7GSR7Kcv3YmgSOH5HSTx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119857; c=relaxed/simple;
	bh=UTh5vV7NfMc9FOIu3v2qDvu0CdSUlmtOsGtomT83pU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmJTt9DVdihPvatJ3izXW2Qi2r5Qix/SO5pK8TKUDkTsTVC2toqvKRZvUJHqfsFSlZbFjcsgubFsGqLEGNMHRKXjRdvBBNedRV0INh0rwT0L4Ob6uUNd9AnO2R5Vvq7hWQTTjc2mcZJdH7+6SW0IU7Ej3UgY/kwR6g9G7QpSRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBe1H09m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574DFC4AF0B;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119857;
	bh=UTh5vV7NfMc9FOIu3v2qDvu0CdSUlmtOsGtomT83pU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gBe1H09mxFtoXhXNL3e2JfpzONznr68XNHim/2HgWOFyGLDmHkrjp1z7ircT/Y+S9
	 fBCbtcP2SUwFiIZYELOzoaCmmHjQemSSA7xzMyUBHuAsaXdGbd+d1MOjY89HUtKcoY
	 3UQAAHARZuHrbVnasJOxGq/yddiIdZ4AIauZWzC/xjIjdEigFw4019/jElScv8qqha
	 9x8FPgJUdgpOy90d1JFP5HYxhBA35xyHhbfpr3C0K/PJS8bxjJvS2BUKEy53CuVn0B
	 791308Pw1481VX6pC9OgVbvwmvp8mhkvCxZxXTgbM1uEi2yUDcJld87rV8S8pbAflT
	 QqZWn8Q47+9bQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t5PDH-000000006IH-2mfB;
	Mon, 28 Oct 2024 13:51:15 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/3] gpiolib: clean up debugfs separator handling
Date: Mon, 28 Oct 2024 13:50:00 +0100
Message-ID: <20241028125000.24051-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028125000.24051-1-johan+linaro@kernel.org>
References: <20241028125000.24051-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the newline separator before generating the gpio chip entry to make
the code easier to read.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpio/gpiolib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2b02655abb56..6da73a373d9b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4967,19 +4967,19 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	struct gpio_chip *gc;
 	struct device *parent;
 
+	if (priv->newline)
+		seq_putc(s, '\n');
+
 	guard(srcu)(&gdev->srcu);
 
 	gc = srcu_dereference(gdev->chip, &gdev->srcu);
 	if (!gc) {
-		seq_printf(s, "%s%s: (dangling chip)\n",
-			   priv->newline ? "\n" : "",
-			   dev_name(&gdev->dev));
+		seq_printf(s, "%s: (dangling chip)\n", dev_name(&gdev->dev));
 		return 0;
 	}
 
-	seq_printf(s, "%s%s: GPIOs %u-%u", priv->newline ? "\n" : "",
-		   dev_name(&gdev->dev),
-		   gdev->base, gdev->base + gdev->ngpio - 1);
+	seq_printf(s, "%s: GPIOs %u-%u", dev_name(&gdev->dev), gdev->base,
+		   gdev->base + gdev->ngpio - 1);
 	parent = gc->parent;
 	if (parent)
 		seq_printf(s, ", parent: %s/%s",
-- 
2.45.2


