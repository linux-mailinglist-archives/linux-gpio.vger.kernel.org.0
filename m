Return-Path: <linux-gpio+bounces-12232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E619B3106
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332801F21DC6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E4F1DB375;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJe+s8kT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C71DA10B;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119857; cv=none; b=DyEBbbGQAyvJsYR2JfFhEglSZZlILAQkYTSx6HVE9F3MdducVRo2Q7ksLRNwoKet1dHGA44QDBDmWtDMUPjyZEkwGG7fdmUbS12rAMP9ntV/IX6wb6exQRbxJMbRIoIYwG0u/5sP4+XK1h9IAv0q9WfyAI3tr+8IGWIpxwEBfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119857; c=relaxed/simple;
	bh=ZWkrzQm10QvJ2T3sAn6epItT2KxYcYPw9jk27J4657w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHLhiLLClvD2Ytff8hCcIzk3Wvb6CX28+ypigzP1w9Q55vSpTosSEv5cqDxp1BziPLAMHN/Hbsm+xu01wf7NsM0s+KhZFnVUP/8nTzJ0l/oOhMUo9CV0xa/WeG9PokTE4po9sfQdcCdYKNAGmIGtP93v3EArStzKRQvUJaCZ3oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJe+s8kT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB4C4CEE7;
	Mon, 28 Oct 2024 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119857;
	bh=ZWkrzQm10QvJ2T3sAn6epItT2KxYcYPw9jk27J4657w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJe+s8kTUjuIvvmsiuLAzxeq59Hyg/U9Y6Fms9PEJYKrPlPbLW3M/brV5vi3+Gn7k
	 v3s1hMbuO9i1ZEAFqlFXsw4VM2a26kbSxgxLc5UTJPLtS6QLyzpTV0rvaCMWfYzdTy
	 g00gu+salOw1DKMKZvIB0XxzygUR39jwlevBRzSuBoSuUjvKkrEF14iUk98coLn+6r
	 JHfFVEx1N5U1C1PrCULYJWoiElkoWzTIjS0elLugWrGLrWyZDqAHf6aoSlkZezt+e0
	 aWl5yfWoXNs6CQiHVRoIrbqniDWEODQ8JuOhzTP6kKsAq/vTANTGQeixBLpm+zDULN
	 bJF1H7ybJZk4g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t5PDH-000000006IF-2PB8;
	Mon, 28 Oct 2024 13:51:15 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] gpiolib: fix debugfs dangling chip separator
Date: Mon, 28 Oct 2024 13:49:59 +0100
Message-ID: <20241028125000.24051-3-johan+linaro@kernel.org>
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

Add the missing newline after entries for recently removed gpio chips
so that the chip sections are separated by a newline as intended.

Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
Cc: stable@vger.kernel.org	# 6.9
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e27488a90bc9..2b02655abb56 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4971,7 +4971,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 
 	gc = srcu_dereference(gdev->chip, &gdev->srcu);
 	if (!gc) {
-		seq_printf(s, "%s%s: (dangling chip)",
+		seq_printf(s, "%s%s: (dangling chip)\n",
 			   priv->newline ? "\n" : "",
 			   dev_name(&gdev->dev));
 		return 0;
-- 
2.45.2


