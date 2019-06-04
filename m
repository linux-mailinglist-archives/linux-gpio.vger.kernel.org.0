Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9EA34A1B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 16:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfFDOTC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 10:19:02 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52500 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfFDOSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 10:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=H6oI0955g5OwBziZY2JIsVDVZT27HDY0T4qKzfaJNc0=; b=ucmBl3bxSSFbrrNTNO7ei2TrgS
        QwvBg4iR11/XKuSobf17m4vaMSiPWBbHPXZAGS+vShib7UUZHikrJXgdWbEprcw57k3KzA3K+XNFc
        x3Cn/DVPuCi60MX3cbClwu+0YpqoRUu12BEaWE6g4j0tZNHCeGzAdUBkG8UY2LGT5xpyCyZh5NxYq
        Y4SA5cLvzMc4QUhkY/7kbd/a1mApWBKDkaUEKWO7ByZuLirrrWT0bieQtQ4YXWSAJdb7i+PGl9C3b
        kqpX+K6tJOHa2wRe/HCKEbpnhu5ZMXanE/R9bA/Nw5ZaiCqmt9ygurlGqEDel8PNjZ0XIdjezRwZH
        I82PlnbA==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYAGH-0001Ro-UF; Tue, 04 Jun 2019 14:18:01 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hYAGE-0002lN-Q3; Tue, 04 Jun 2019 11:17:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
Date:   Tue,  4 Jun 2019 11:17:46 -0300
Message-Id: <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With ReST, [foo]_ means a reference to foo, causing this warning:

    Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".

Fix it by using a literal for the name.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 58036c2d84d2..4af9aae724f0 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -418,7 +418,7 @@ symbol:
 
 If there is a need to exclude certain GPIO lines from the IRQ domain handled by
 these helpers, we can set .irq.need_valid_mask of the gpiochip before
-[devm_]gpiochip_add_data() is called. This allocates an .irq.valid_mask with as
+``[devm_]gpiochip_add_data()`` is called. This allocates an .irq.valid_mask with as
 many bits set as there are GPIO lines in the chip, each bit representing line
 0..n-1. Drivers can exclude GPIO lines by clearing bits from this mask. The mask
 must be filled in before gpiochip_irqchip_add() or gpiochip_irqchip_add_nested()
-- 
2.21.0

