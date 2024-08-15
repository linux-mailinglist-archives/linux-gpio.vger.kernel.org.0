Return-Path: <linux-gpio+bounces-8753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5189529D8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8961C2113C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497C17ADF4;
	Thu, 15 Aug 2024 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="DgNw+pRk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m12825.netease.com (mail-m12825.netease.com [103.209.128.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8D179954;
	Thu, 15 Aug 2024 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706838; cv=none; b=Gj+eUA9MoSmZp7YnwjLW0QSTMJtQlfC//9bLBB2VNgbY0ocXNSpF1lkHBWBfK3r8jpRzM1vPMw+9YvU8Ejj5/XyxNkjIOAEzHD0IFU8V3kn5tE/n3GCjqmz2ThIzc8z9h0X0ppmk6zKoatbx2YgjfyrlEtM0eOS9LILVq6BJTkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706838; c=relaxed/simple;
	bh=/kIaJ3m/LwqVuoAH/nLD5kPfXo8ApnAOICo/Fqd3BQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qZA+edoU3TI7LK2MQryru4m8whovYbewqaoF8jSuY9ibinXB0cu3nH47c9XXS2T7fmGz8ZUu9MpoKmITZcDqORPJD68cRHKMLxSkVDxalBk/yN5jBOmOqNcOVcgjlTPt1u/Nmrard+GmsIwnBLYDA0pTi+EWTjzpHpe6loSO6fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=DgNw+pRk; arc=none smtp.client-ip=103.209.128.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=DgNw+pRkdgOlw0WYTsYkLCUfJF27FsQK3kjXHWc6Rqiyhv/VpdKYENw25+A2K0KgnEdcfI3jpmQeyz5vkJiEkwEURyVkRDxXkOizpX71bPXj5YyL5lCQ0GkIVi+dGsQ547A4eeCOYxV3YRxOSSmfwlfr0PZnCC9JxpTl6N2X2c0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YVjRyF8TOwBqY0iE8ZSoQBaiGaEUrU1NwRZ2EkrowHM=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 727A07E0336;
	Thu, 15 Aug 2024 15:17:23 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v1 4/5] gpio: rockchip: avoid division by zero
Date: Thu, 15 Aug 2024 15:16:50 +0800
Message-Id: <20240815071651.3645949-5-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh4aTFZITEofHUxCSRlDHhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e5fbfb09cfkunm727a07e0336
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6Qio6SjIzKUNWNCgWKEwp
	TTQaCxZVSlVKTElITEtNSU9PTU9CVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUlDSjcG

If the clk_get_rate return '0', it will happen division by zero.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 8949324ed816..03e949b0a344 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -212,8 +212,10 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
+		if (!freq)
+			return -EINVAL;
 		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
-		if (debounce > max_debounce)
+		if ((unsigned long)debounce > max_debounce)
 			return -EINVAL;
 
 		div = debounce * freq;
-- 
2.34.1


