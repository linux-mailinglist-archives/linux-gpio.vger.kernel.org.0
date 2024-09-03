Return-Path: <linux-gpio+bounces-9618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5FA96971C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3A91F22530
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5102D2101AA;
	Tue,  3 Sep 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Svn1LfzB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49253.qiye.163.com (mail-m49253.qiye.163.com [45.254.49.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899561D04BF;
	Tue,  3 Sep 2024 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352334; cv=none; b=cfML9T++tg7AshDnQTPOYD9iIShCU8YF7g+vn8EQO/M6SwnrB2SiyTTmxMTFZ4LYp63j/Us+K3u8042YDVXPCkm9vZkipNXzlTBX9QBXf7pg4C/mnf9VnBjVpoiWOtcEnBLnZ9t6KTvL6ypMFGpQkxT51NJOgV7S1Bu1fjs3QFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352334; c=relaxed/simple;
	bh=rokfXuQadyjLoCc3SWEWRYyyosm0wNj7VcB5kkZNzZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C10lx6X3SWXxI/2DQ6pxpoQv1B/SGLFcBXczcCbxl+13ziwYdlU0v5QaftUHo/iRHBJE2jQtLMAhjJdQkMtV6QMORYpGHf7Nq14RKmLacsS7XSdsocLDQXHceqGo1XyH1j8fDSiAeh4ZPycLpCzrb2eYcZlr/iY24UMGQ7R/IAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Svn1LfzB; arc=none smtp.client-ip=45.254.49.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=Svn1LfzBXD6+X08id4l9jK0W/Cla+KEeOVEdn7IGloLESmycgijpufkzijYmggBJ5spOLgBeGqUeFSEdc0N8UlAFTvIqp68PCaGCfjsXywmzn++Iqemx3up6RQA/vZiX/g/OcB5IoGskpHPuAtgVuDEJZXxxFi84o9UnXIZdCwY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mgSI3a/7dMdZbLCNsqhcURBOepC3DqKjtYsqMJY17gk=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 68C3B7E0292;
	Tue,  3 Sep 2024 15:37:18 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v3 12/12] gpio: rockchip: replace mutex_lock() with guard()
Date: Tue,  3 Sep 2024 15:36:49 +0800
Message-Id: <20240903073649.237362-13-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903073649.237362-1-ye.zhang@rock-chips.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUwaTFYZTkIZGUlCGh5JTR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d10c2209cfkunm68c3b7e0292
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pk06Qzo6GjI1FklRLBEfFQgt
	Qw1PCTpVSlVKTElOSE9CS0hCTUNIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEtNQjcG

Replacing mutex_lock with guard() simplifies the code and helps avoid
deadlocks.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 73e57efb46fc..d5c57617fc86 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -765,20 +765,19 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = rockchip_get_bank_data(bank);
-	if (ret)
-		goto err_disabled_clk;
-
 	/*
 	 * Prevent clashes with a deferred output setting
 	 * being added right at this moment.
 	 */
-	mutex_lock(&bank->deferred_lock);
+	guard(mutex)(&bank->deferred_lock);
+	ret = rockchip_get_bank_data(bank);
+	if (ret)
+		goto err_disabled_clk;
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
 		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
-		goto err_unlock;
+		goto err_disabled_clk;
 	}
 
 	while (!list_empty(&bank->deferred_pins)) {
@@ -805,14 +804,11 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		kfree(cfg);
 	}
 
-	mutex_unlock(&bank->deferred_lock);
 
 	platform_set_drvdata(pdev, bank);
 	dev_info(dev, "probed %pOF\n", np);
 
 	return 0;
-err_unlock:
-	mutex_unlock(&bank->deferred_lock);
 err_disabled_clk:
 	if (bank->manual_clk_release)
 		clk_disable_unprepare(bank->clk);
-- 
2.34.1


