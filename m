Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2732A119602
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 22:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfLJVYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 16:24:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:32930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727958AbfLJVKw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 16:10:52 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64F49246B8;
        Tue, 10 Dec 2019 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012252;
        bh=5h334oil8b9BE4AdJTlzTqznOyqxlcpwG2PSJfE1q/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pUCOdgqTth2aLjqeG59ORYdRBHUGC/PE6+VnOZ1R73MOUc8TXNwYgv7ke9BxHXsTt
         MulKs78mtWP+dYl18iw1l4DTtwvrm5tlWziT4z+P0GlLpMMxyZMDLuzlABGXLtTF+s
         HK03i+sFaXUKHlC2jdbT4945LOQg9Qc7W7nxm5k0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 199/350] pinctrl: amd: fix __iomem annotation in amd_gpio_irq_handler()
Date:   Tue, 10 Dec 2019 16:05:04 -0500
Message-Id: <20191210210735.9077-160-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>

[ Upstream commit 10ff58aa3c2e2a093b6ad615a7e3d8bb0dc613e5 ]

The regs pointer in amd_gpio_irq_handler() should have __iomem
on it, so add that to fix the following sparse warnings:

drivers/pinctrl/pinctrl-amd.c:555:14: warning: incorrect type in assignment (different address spaces)
drivers/pinctrl/pinctrl-amd.c:555:14:    expected unsigned int [usertype] *regs
drivers/pinctrl/pinctrl-amd.c:555:14:    got void [noderef] <asn:2> *base
drivers/pinctrl/pinctrl-amd.c:563:34: warning: incorrect type in argument 1 (different address spaces)
drivers/pinctrl/pinctrl-amd.c:563:34:    expected void const volatile [noderef] <asn:2> *addr
drivers/pinctrl/pinctrl-amd.c:563:34:    got unsigned int [usertype] *
drivers/pinctrl/pinctrl-amd.c:580:34: warning: incorrect type in argument 1 (different address spaces)
drivers/pinctrl/pinctrl-amd.c:580:34:    expected void const volatile [noderef] <asn:2> *addr
drivers/pinctrl/pinctrl-amd.c:580:34:    got unsigned int [usertype] *
drivers/pinctrl/pinctrl-amd.c:587:25: warning: incorrect type in argument 2 (different address spaces)
drivers/pinctrl/pinctrl-amd.c:587:25:    expected void volatile [noderef] <asn:2> *addr
drivers/pinctrl/pinctrl-amd.c:587:25:    got unsigned int [usertype] *

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
Link: https://lore.kernel.org/r/20191022151154.5986-1-ben.dooks@codethink.co.uk
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-amd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2c61141519f80..eab078244a4c3 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -540,7 +540,8 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i, irqnr;
 	unsigned long flags;
-	u32 *regs, regval;
+	u32 __iomem *regs;
+	u32  regval;
 	u64 status, mask;
 
 	/* Read the wake status */
-- 
2.20.1

