Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2193A222D7F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGPVNy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:13:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgGPVNy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 17:13:54 -0400
Received: from embeddedor (unknown [201.162.240.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E06DE20760;
        Thu, 16 Jul 2020 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594934034;
        bh=W/rnCJweoSroLPFc4qIJiZovV2xgzWULfomtSZCzpLY=;
        h=Date:From:To:Cc:Subject:From;
        b=tpxK0XQjI40X994VvpKDI8qWdJfXDo+L2E9a7aHlksE0YnI51yxxDzJCZG4hmE6kX
         dYBojpDBIKG/JEQXPfTcmfDA5XgsmfRKz7cHfErnCZMhgbwlAYpc2HHAWREiqKyoKQ
         d2ePqrl7hDE49IdUS0/LlOm1k7L0WWTDI7PGAIm8=
Date:   Thu, 16 Jul 2020 16:19:19 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] pinctrl: baytrail: Use fallthrough pseudo-keyword
Message-ID: <20200716211919.GA17378@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index a917a2df520e..d6e35cba3065 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1372,13 +1372,13 @@ static void byt_irq_unmask(struct irq_data *d)
 	switch (irqd_get_trigger_type(d)) {
 	case IRQ_TYPE_LEVEL_HIGH:
 		value |= BYT_TRIG_LVL;
-		/* fall through */
+		fallthrough;
 	case IRQ_TYPE_EDGE_RISING:
 		value |= BYT_TRIG_POS;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		value |= BYT_TRIG_LVL;
-		/* fall through */
+		fallthrough;
 	case IRQ_TYPE_EDGE_FALLING:
 		value |= BYT_TRIG_NEG;
 		break;
-- 
2.27.0

