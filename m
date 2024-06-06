Return-Path: <linux-gpio+bounces-7243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A78FE6FA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 14:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D89E286D9F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE2019643A;
	Thu,  6 Jun 2024 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="ybEJeoSA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D3195FF7;
	Thu,  6 Jun 2024 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678692; cv=none; b=Of1X3OOJjkZ11d5CejirB3q+8hzlrPxLfSMllC91VbI6S8WfUQJg6us5mh0aBN002J5rqP/OX/Xm5Rn9TPaQ3IKb1YOGd1MQ4vXGDfPHgm15XmDUdwYorc7S6kK5914iHh29CrgKUoxNclHJ45VYrDnE3K4v+Vfxqwky8Cm9vpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678692; c=relaxed/simple;
	bh=ujEPMM4MA25Q1mRmU9a/DJCxnW6ZZ2vURpgcPeEvVIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7mxalNwQWy9B6a04VbH/92eJaAqRugEs2oMSbTx0FiD0ZsucaxwaAUtrYWvSerwH3vhij2ZajUSUxUFJVuHZkTIg5fJeBTX/nrPPHVp0/m4hq19JTwIjYBYZDGM7biQzFqwvaO8Qw8y4wEDNyrl007xJkVRj718vKGLiCZ6tXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=ybEJeoSA; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717678689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aHzfbCHuap4cxwq/iZevfqON/k/0kct/7NXKtBKj9d4=;
	b=ybEJeoSAIAuQTp3QZIKYIgmz0J3/KIgn15jDFz/ErksFABXunAGcm8rVMNNZUZ9AEIzcwH
	D0ONwIX9BIEZtQ873j+zrFf46vaOCQ20+q5ZQdm1hV7uDlLCgyxvns+bYgdP5IAE/0UNoV
	YbVaE3NPqJq1FTPd6C4R0Dynk3A7WRU=
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH v2 4/4] pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
Date: Thu,  6 Jun 2024 20:57:55 +0800
Message-ID: <20240606125755.53778-5-i@eh5.me>
In-Reply-To: <20240606125755.53778-1-i@eh5.me>
References: <20240606125755.53778-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_pmx_set reset all pinmuxs in group to 0 in the case of error,
add missing bank data retrieval in that code to avoid setting mux on
unexpected pins.

Fixes: 14797189b35e ("pinctrl: rockchip: add return value to rockchip_set_mux")
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Huang-Huang Bao <i@eh5.me>
---
 drivers/pinctrl/pinctrl-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 24ee88863ce3..3f56991f5b89 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2751,8 +2751,10 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 
 	if (ret) {
 		/* revert the already done pin settings */
-		for (cnt--; cnt >= 0; cnt--)
+		for (cnt--; cnt >= 0; cnt--) {
+			bank = pin_to_bank(info, pins[cnt]);
 			rockchip_set_mux(bank, pins[cnt] - bank->pin_base, 0);
+		}
 
 		return ret;
 	}
-- 
2.45.2


