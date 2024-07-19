Return-Path: <linux-gpio+bounces-8296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0493774B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 13:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AB36B213BC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 11:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686F284D2C;
	Fri, 19 Jul 2024 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+h5zEK1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236062C1AC;
	Fri, 19 Jul 2024 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721389615; cv=none; b=O/NVrYa1I5w6Pq8qS1a2k3MPibSD/jyWU4U3tqczzG9/uVeWGbNwhxqlPPBpJQaV3IfmwX00aUfRyqawSBMpoYW/tdzpIlK3wySLmxg/XQOrKy96R6lJ0TguBGUvG0+5Xd8fKpiIT9jc8UpfVbSRpMnHejO29Y1kGk1yprkbwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721389615; c=relaxed/simple;
	bh=cy/jKQoAFYo2d5B57A3HlPZ319OKhB1eVdiRM7upigw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aHaSlAOrFvemAmQbAAiZTycpJ7swo6+YiiCwpBnWLyZS7nS95bheBWTRJgG2mshG1CgFsZn/NOgA07Hc0ss1DF1bGnaaAuQygYmL5QyVVmvqrt9VhoVJGZxcw7TFkKBoFgsEd0Ocr4DePq1yEK+5rv+MEzh7e+lfkZna3+aiwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+h5zEK1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0E5C32782;
	Fri, 19 Jul 2024 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721389614;
	bh=cy/jKQoAFYo2d5B57A3HlPZ319OKhB1eVdiRM7upigw=;
	h=From:To:Cc:Subject:Date:From;
	b=p+h5zEK1tEOsbLEct6HUsPOho+NnRcOcmjBo82aHu5IXeZXsL1OxoXD+aAJe219AD
	 6ww0nzPRvuGtalsHcW8ikKiV9GDrSEcobbPO//W9TmPUS0CC04ssk4M8cAaPvtMNjM
	 eOb2WrNwZo8cRnHiXy7y+Q4j5M8WMN1WGlwwRU2DzZWIiFPdL9rH04KfcHOqslgmK3
	 Frs69ArQ+uuwoo3d7Gcp2LATmKh4NBhtKeGypOU2b2pvzhGEt6RsQyLjnrV5xiRIb6
	 cq5rjUNMMxCK1LKhCfzXYvU6qk4KbmOvpTAzWqJKvwc+rLCYkmqxo9baJj06Hz1u1Y
	 T1MP7H6DHrE1Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: virtuser: avoid non-constant format string
Date: Fri, 19 Jul 2024 13:46:43 +0200
Message-Id: <20240719114650.1551478-1-arnd@kernel.org>
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

Change this instance to use a "%s" format instead to print the string
argument.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-virtuser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 0e0d55da4f01..c55b72e426c7 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -805,7 +805,7 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 		return -ENOMEM;
 
 	data->ad.desc = desc;
-	sprintf(data->consumer, id);
+	sprintf(data->consumer, "%s", id);
 	atomic_set(&data->irq, 0);
 	atomic_set(&data->irq_count, 0);
 
-- 
2.39.2


