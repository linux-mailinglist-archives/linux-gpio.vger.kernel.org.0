Return-Path: <linux-gpio+bounces-30633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B0D2DD7F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 09:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A28AF3043F4A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822192F6918;
	Fri, 16 Jan 2026 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgDps4aM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6412F3630;
	Fri, 16 Jan 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551099; cv=none; b=BK7SINU0JNVTw0XVvgn6WCc/UWMbPkxxjOVkYRJ6ehNGOJ8HC7HqYTBOoEodikMWC+U0m40bSFxsEGZX9kaS0PpX+IPVHVB4pbZYF6KXmdcVW6fEiC6MFz0/TsQNCGIPZRScmXCjedDMosk8FTnw2C393taSsO3IqChotJAY6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551099; c=relaxed/simple;
	bh=OPIRJf1YwrkVeZCDiw5cYD1avfQuQ+qkgKtDS5RbR3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAF/m7Gb5KWQd3OgqzDiY4bal4mRFYzvBfPuVQpbju+8RMynuxkZEtpz5zUiQwMJdgF+nVb/UR5AvYUmnl8iN8EF4g2Uf96kjSjcpLpLrdRqamJaiu6BSx5hhDmTYsJr1kX3QWTaj/x7xuDNtweEkMgkLBWUZoSKC+hceON5Ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgDps4aM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DDFC19425;
	Fri, 16 Jan 2026 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768551097;
	bh=OPIRJf1YwrkVeZCDiw5cYD1avfQuQ+qkgKtDS5RbR3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QgDps4aMSBg1y6OQuez/d1/5NkxjAtfgjwwk0qQrrHjaxTkcFqI+7fwKxJBL2OiP/
	 +t41W14zTKi4GUBmcmOEDZGtNoRBu+o+6wBSVUuQi3weaKdy+cjEOknP7qgayAQ0bY
	 0i9BUrINFFfKiwDYKIbqo0ebESqXCp+DlsA6XPMU43u6rwPWJFynUJheVgDYm1Z88T
	 bfsz25wN+wdyrJBDjuMmYvT7o4BE5xBTaYoCjBw7psBehD2XP+SNmba571MkpjmsZg
	 i8g1ttd48cqRoaW2muuUnwxkvU4ZcV8cKk91Qh/ck8MDOTZXUd2cxVdiGX2LRObUQg
	 FuJNA0ohJDl0Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 10/23] gpiolib: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
Date: Fri, 16 Jan 2026 08:10:23 +0000
Message-ID: <20260116081036.352286-11-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260116081036.352286-1-tzungbi@kernel.org>
References: <20260116081036.352286-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's harmless even if: chrdev_open() and cdev_device_del() run at the
same time, and gpio_chrdev_open() gets called after the underlying GPIO
chip has gone.  The subsequent file operations check the availability
of struct gpio_chip anyway.

Don't check struct gpio_chip in gpio_chrdev_open().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/gpio/gpiolib-cdev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 24449bbe38c9..e42cfdb47885 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2689,13 +2689,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 						struct gpio_device, chrdev);
 	struct gpio_chardev_data *cdev;
-	int ret = -ENOMEM;
-
-	guard(srcu)(&gdev->srcu);
-
-	/* Fail on open if the backing gpiochip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
+	int ret;
 
 	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
-- 
2.52.0.457.g6b5491de43-goog


