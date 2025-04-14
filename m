Return-Path: <linux-gpio+bounces-18786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21012A8823D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 15:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53A5A7AB05F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 13:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875D6275841;
	Mon, 14 Apr 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="md47AUYE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69623D2B9;
	Mon, 14 Apr 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637218; cv=none; b=KW8xq0KDwqUUCEC92q3oem7/UnthoOphaLFXXjsXvByoUpT7+I/zl8w66q+w9siDfeK5sQo6dTzp7hx9AuM1tk1JNR6zKG4syvn5IkJNTF0FaGD/Z+h0cyQDoJzQV9ltJif4tDZS7gNMvaynukT+FOA00seYL7UrcQw1Ksq3SyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637218; c=relaxed/simple;
	bh=XnD07pk/6ayreH2RF2D+WL2oa/0JbLWCPdWUdxtZWjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W4Id1vSCVdqBPKQjeK0OHzUxtIpx9BXPQDCtW4q88xVmrU9dnNcKUFlU/bttax22vXBA1y1YcbUPF7rUNU6ObwRvtITVPZEHkdVc04SJxGNyiMcTjkVLztd/RgoLyWmhRcWHlN8pIryzeYdPkI5sta/EMQx6iEzUekidIJmbq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=md47AUYE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2FDC4CEEE;
	Mon, 14 Apr 2025 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637218;
	bh=XnD07pk/6ayreH2RF2D+WL2oa/0JbLWCPdWUdxtZWjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=md47AUYEcsmjPAoTQ/yJ9bkiC612Rt81U3AHsnJjHCLy+1XXp/z9SWMG2RuCeHSp2
	 UmtbaHCcUniIUIbmQceh9MgR4YTNJbpZpDtTIS8nLcfxZpUJOFDDYhYgI10w0nnzmc
	 ZH36stsjnHN8vvC0wvfz8Vj2KXddV9+AyXr/F7jg+XAWxFVxirBMSAOgRTowzKEkxs
	 uIjczC4fhI3cDf/7kbb4n2bHL6wPjlVY7asIFzx1K/e1vbvgwxv0jzRZ4gVEki/68n
	 KJYbfN+Qd447sDmX6pohqSmEQ8SVRPUezSjtiaAnrbEKN4SaMITK2QZkwUsMgjCwK3
	 2IDhglojKSk9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 20/34] gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
Date: Mon, 14 Apr 2025 09:25:56 -0400
Message-Id: <20250414132610.677644-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit b8c7a1ac884cc267d1031f8de07f1a689a69fbab ]

The regulator comment in of_gpio_set_polarity_by_property()
made on top of a couple of the cases, while Atmel HSMCI quirk
is not related to that. Make it clear by moving Atmel HSMCI
quirk up out of the scope of the regulator comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250402122058.1517393-3-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e..f12ddb48909c0 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -257,6 +257,9 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		{ "fsl,imx8qm-fec",  "phy-reset-gpios", "phy-reset-active-high" },
 		{ "fsl,s32v234-fec", "phy-reset-gpios", "phy-reset-active-high" },
 #endif
+#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
+		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
+#endif
 #if IS_ENABLED(CONFIG_PCI_IMX6)
 		{ "fsl,imx6q-pcie",  "reset-gpio", "reset-gpio-active-high" },
 		{ "fsl,imx6sx-pcie", "reset-gpio", "reset-gpio-active-high" },
@@ -282,9 +285,6 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 #if IS_ENABLED(CONFIG_REGULATOR_GPIO)
 		{ "regulator-gpio",    "enable-gpio",  "enable-active-high" },
 		{ "regulator-gpio",    "enable-gpios", "enable-active-high" },
-#endif
-#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
-		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
 #endif
 	};
 	unsigned int i;
-- 
2.39.5


