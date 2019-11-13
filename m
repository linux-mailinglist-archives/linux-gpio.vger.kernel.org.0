Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE91FA39F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 03:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbfKMCK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 21:10:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730189AbfKMB7G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 20:59:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E74982245C;
        Wed, 13 Nov 2019 01:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610345;
        bh=5ZZg/xigrTA2+oyrMBGTOMx97kcHllNc7EFKeSaV/nQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F2wlO7nX42rkhdsh5Tcqz6SaRMPhupdg/d15Oxzo7UQd0uMBQkGVsH7kombVhMYRB
         8rWLg8DSVdk9jiPBt4HcTLZS1iYKhLlCW9OFkInDm2K6WDlZHxqBsn3PAeHtb1mboS
         FufOOeSijuyMmEkdhkbRmg/02s9jV25mkULuS7eY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 098/115] pinctrl: gemini: Mask and set properly
Date:   Tue, 12 Nov 2019 20:56:05 -0500
Message-Id: <20191113015622.11592-98-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit d17f477c5bc6b4a5dd9f51ae263870da132a8e89 ]

The code was written under the assumption that the
regmap_update_bits() would mask the bits in the mask and
set the bits in the value.

It missed the points that it will not set bits in the value
unless these are also masked in the mask. Set value bits
that are not in the mask will simply be ignored.

Fixes: 06351d133dea ("pinctrl: add a Gemini SoC pin controller")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index 39e6221e71000..05441dc2519d2 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -2164,7 +2164,8 @@ static int gemini_pmx_set_mux(struct pinctrl_dev *pctldev,
 		 func->name, grp->name);
 
 	regmap_read(pmx->map, GLOBAL_MISC_CTRL, &before);
-	regmap_update_bits(pmx->map, GLOBAL_MISC_CTRL, grp->mask,
+	regmap_update_bits(pmx->map, GLOBAL_MISC_CTRL,
+			   grp->mask | grp->value,
 			   grp->value);
 	regmap_read(pmx->map, GLOBAL_MISC_CTRL, &after);
 
-- 
2.20.1

