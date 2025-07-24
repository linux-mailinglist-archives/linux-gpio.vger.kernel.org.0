Return-Path: <linux-gpio+bounces-23794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C3B10C0F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 15:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227BD3B3805
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFC22E2F08;
	Thu, 24 Jul 2025 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/IhEq/P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83312DE6E9;
	Thu, 24 Jul 2025 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365027; cv=none; b=RRdZXQSnj1tVhdVCN6s+DuAb3WROp/ktccPXJie3OHh7yMcNu43GfjU/NqNrJcpUuTxLGuVVogONEtaW/vs6b4EzfJsDqDUDzMhQbD5MbVaL8L6rfKIoAfMJEjUFvREFYxZqBiyx/S8MXsbsYMqSVpMmwbUROIv8brM7DPnuAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365027; c=relaxed/simple;
	bh=fXRkp9tkBw6fJ60VIZeOBOecvw7Vr9jECqm8Xl4Zdsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMING7O2INkHyxNPOWchfmFOq1Bmmx0AmisVQMRIoA3A2iYSm8LCbsWVwPdqanaIU9qC/ozbWlH6o6m7/Gfc9fVEQ/rSchUUf64X05+TAWzg4l1VkQLmYIQ6q9ewY1C/beFCDIbGb/rhow24ppl0Rf//9sKgGexRJ6/2gdJC+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/IhEq/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E8FC4CEEF;
	Thu, 24 Jul 2025 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365026;
	bh=fXRkp9tkBw6fJ60VIZeOBOecvw7Vr9jECqm8Xl4Zdsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/IhEq/PiqLK01qExpI5aOvQ+DpYYmUDVDbEw0mLq1miQ3Y8Cj+nVVtGRIb0PM4Bt
	 vO3vORB3POrs+uQ6xPWHDHsF0Pfcn82583m4LhZG4r07/WG7q8DtYE8GSGWokZ9Ofx
	 ZA0kyefW9eYF4iXGPKruH5n3d4hZbixh56aN/WD4sdx6CkXDp1pfSEUAL6T3GCjMCX
	 V6qputJonc5eloBanaE2rjsa8/1dRSimA5xUMwtJu8sfZalh7PbMEuO5Xj71ZDZi5R
	 r5jj88mYeGf55eTP2/rUDKDpwYAY9b6bc6tZlJisg7aKJKMUHuM3Ayp1SIyMj4WI4H
	 K7pNfKrCOkThw==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v5 06/10] pinctrl: meson: Fix typo in device table macro
Date: Thu, 24 Jul 2025 15:49:43 +0200
Message-ID: <c47f5e1ab68248cbc4d51dcd822829da8857ea00.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
because the macro was defined only if the module was built as a separate
module.

Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 385cc619df13..95525e66e5c0 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -1023,7 +1023,7 @@ static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
+MODULE_DEVICE_TABLE(of, aml_pctl_of_match);
 
 static struct platform_driver aml_pctl_driver = {
 	.driver = {
-- 
2.50.1


