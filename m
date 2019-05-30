Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABAE2F61F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 06:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbfE3DKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 23:10:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728155AbfE3DKh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 23:10:37 -0400
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net [67.88.213.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8E49244D2;
        Thu, 30 May 2019 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559185836;
        bh=pVWxZxbNvKqIRiN5qwRTrLrmotdfRvBhYgFWEWGfkok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wni6xMvg4wVCLshHAmgIEDjYjwqIZBOdN3p4r1YEXCDBe/qMEeLyveQ9QTggqzsFa
         7O9DWM6GvUJk68gpupw5OTaYb72axxtHbic4rSgpR/4xSlmyALW/BowKthSwkkQTWc
         sOU7jDvxcVQwGfOZuY0VkGcwlfFzEa23GfnBuTsE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Wen Yang <wen.yang99@zte.com.cn>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.1 149/405] pinctrl: samsung: fix leaked of_node references
Date:   Wed, 29 May 2019 20:02:27 -0700
Message-Id: <20190530030548.677494978@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030540.291644921@linuxfoundation.org>
References: <20190530030540.291644921@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[ Upstream commit 44b9f86cd41db6c522effa5aec251d664a52fbc0 ]

The call to of_find_compatible_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/pinctrl/samsung/pinctrl-exynos-arm.c:76:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
./drivers/pinctrl/samsung/pinctrl-exynos-arm.c:82:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 44c6b753f692a..85ddf49a51885 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -71,6 +71,7 @@ s5pv210_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 	}
 
 	clk_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!clk_base) {
 		pr_err("%s: failed to map clock registers\n", __func__);
 		return ERR_PTR(-EINVAL);
-- 
2.20.1



