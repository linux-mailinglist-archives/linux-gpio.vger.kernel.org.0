Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8D039F9F1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 17:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbhFHPJJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 11:09:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:39322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233354AbhFHPJI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Jun 2021 11:09:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72DAD60231;
        Tue,  8 Jun 2021 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623164835;
        bh=lajIHORbgJ+gWe5oTfc6aVhrXAeM6lou0+BZHByrUtU=;
        h=From:To:Cc:Subject:Date:From;
        b=IPLsSo+lStgbkrGD95c1N+i4o+7icKQaErXt7eVH8HXyDaZXinWmoIm3jT4lcLunS
         pUFVHW+VAfY2UfAba1pD9AO5lQAQhI+pn+PLdOj2a1H+iIf0uYf7Qb6SwIvSAAfhkx
         hNky0noLcyfwBcCra0jFW7uyAQW5XC/vbEB4T//mxqmdddWdvHXkTc+sudcAKRhaMq
         LHrusek43suRFhaSbD21Pz0x8TRSEjl1Uhq3o0crVH1xrXr/Gz7j7kNvBGlewioi9P
         7CdAOV9XMSby4QsVxMME0OVFdSMb8R4gLCLcZoxMGGfK8TUHoVwlCURTVcfY3Heu/B
         PDM1RrxCKmX/A==
From:   matthias.bgg@kernel.org
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Wang <sean.wang@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>,
        Fabien Parent <fparent@baylibre.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] pinctrl: mediatek: fix mode encoding
Date:   Tue,  8 Jun 2021 17:06:56 +0200
Message-Id: <20210608150656.29007-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

Pin modes are encoded in the SoC data structure. Use that value to set
IES SMT.

Cc: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-mediatek@lists.infradead.org
Fixes: 696beef77521 ("pinctrl: mediatek: move bit assignment")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 525b1aa7f7a6..5f7c421ab6e7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -134,13 +134,13 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			pin, pctl->devdata->port_align, value, arg);
 	}
 
-	bit = BIT(pin & 0xf);
-
 	if (arg == PIN_CONFIG_INPUT_ENABLE)
 		offset = pctl->devdata->ies_offset;
 	else
 		offset = pctl->devdata->smt_offset;
 
+	bit = BIT(offset & pctl->devdata->mode_mask);
+
 	if (value)
 		reg_addr = SET_ADDR(mtk_get_port(pctl, pin) + offset, pctl);
 	else
-- 
2.31.1

