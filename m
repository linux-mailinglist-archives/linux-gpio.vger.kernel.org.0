Return-Path: <linux-gpio+bounces-8303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB4937950
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 16:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC8A1C21FA0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 14:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6267481211;
	Fri, 19 Jul 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9OBJytD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC831B86D6;
	Fri, 19 Jul 2024 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721400268; cv=none; b=L8jZCsrJmrdT105g88zRmTWbzsPO7NetpQGJCtuhxLX7qY15+wFyI1wuxIUI0tkq2QyqOGJZXC7F2Y9odlNSvTZotCceu1K0aB56fgImOk49wc4g3hubGiB2aQof1L7FLCtE9auf6/IQgCUBggVLM6zsvaVEMjMh34kpLb01ROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721400268; c=relaxed/simple;
	bh=7Uwer+uc6drSXe/I1J0kZc+yIHVn2PCgJx++GUkKvkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pCYrrc8fal2H732Gikcs4mDxUhXP8wiD/mLF2f+AGfC/OetyXKbK6L6Ih/FwCnIhPw/kN1z365DsIs7X6a3rwD7os4VJZxd+pPgLdehEzTGZrBHJBBTRUNReOIf5kK8+PWuK3jRGKItr4eBrJ1P/1ThYuosHMoFRxewIM7P8y7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9OBJytD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471ADC32782;
	Fri, 19 Jul 2024 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721400267;
	bh=7Uwer+uc6drSXe/I1J0kZc+yIHVn2PCgJx++GUkKvkY=;
	h=From:To:Cc:Subject:Date:From;
	b=J9OBJytDVv0iqSBIgiRna9sj96nQ6P/f1nuByllnrRbjzAOYnJNsihFQ72KQMlY1v
	 LwceSnQwfsGVp1mtW/1R3IVZAVETp5bTvISuVy/NGVl1Y24Gz+neIyyqhfBVlFhnOf
	 VjIoNsaMuGof5/8ugBOcL2M0cJcdcnZ4nFmpZs6MxpWr9wMyrhqQC2hrDVzyLu7LXi
	 nb5jnJLLImlnVxjF0MaxpaehH2kmVKTxEuFH7WEwoKOfiFaGvOUbBb4G3JRsJgTXSg
	 zpf6yB/HuU/uRtzdLTad1s3CGcqdA8wxflWIqhlwN8ZwR2PXLyO2VrxkIDDJLgFP44
	 R4DWhOhPYwOYg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] gpio: virtuser: avoid non-constant format string
Date: Fri, 19 Jul 2024 16:44:10 +0200
Message-Id: <20240719144422.2082394-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using a string variable as an sprintf format is potentially
dangerous, and gcc can warn about this:

drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_dbgfs_init_line_attrs':
drivers/gpio/gpio-virtuser.c:808:9: error: format not a string literal and no format arguments [-Werror=format-security]
  808 |         sprintf(data->consumer, id);
      |         ^~~~~~~

Change it to a simpler strscpy() instead to just copy it and check
the destination buffer size.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-virtuser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 0e0d55da4f01..ccc47ea0b3e1 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -805,7 +805,7 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 		return -ENOMEM;
 
 	data->ad.desc = desc;
-	sprintf(data->consumer, id);
+	strscpy(data->consumer, id);
 	atomic_set(&data->irq, 0);
 	atomic_set(&data->irq_count, 0);
 
-- 
2.39.2


