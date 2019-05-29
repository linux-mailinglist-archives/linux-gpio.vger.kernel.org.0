Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2352E910
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 01:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfE2XYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 19:24:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49076 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfE2XYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 19:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jgwcv0yUHJkpC0RNxq8/GXr5590Xomrjfw0h2lyU8s8=; b=UX+BH7bxAGdPpgRPr+4Wfi/M/e
        gUSN0HtZRbzmEj3iknWkmt0iORwa9zyNrEnXdwCtLrrcjnsUf5e+vA3O5pL97m9ZGf7f6lHHb0seC
        /XJeuCtLfypo+nEl9jU3C5UFizNf4j7JgVug8TSApXwhbC4AgXFo53E3Ytu8POzgXkKwu1JSX5YYx
        vQ25Q+8KBN+TjFuEh77/K4SD9SKaHtbg0ov05JumZjNlyR5PKOIbdk/bRvIX4dzokj8NZXJ2L9e9W
        ZIGW1qVla9egUirg2uT6CbA5GTpCNhCxhEs37dRWCu9xtr9ZbPubyZlTngPQtIoyQBF0HwougulxC
        SerXiH2g==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hW7vL-0005Rp-Ah; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hW7vI-0007xk-T9; Wed, 29 May 2019 20:23:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 16/22] docs: gpio: driver.rst: fix a bad tag
Date:   Wed, 29 May 2019 20:23:47 -0300
Message-Id: <ab694e03ba6de8908d0a19a58408180eee3f795b.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
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
index 1ce7fcd0f989..25e2ddeb4f31 100644
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

