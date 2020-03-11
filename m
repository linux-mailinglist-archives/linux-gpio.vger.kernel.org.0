Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9880718140D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 10:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgCKJGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 05:06:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:40472 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728708AbgCKJGq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Mar 2020 05:06:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1C44AAF5B;
        Wed, 11 Mar 2020 09:06:45 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:06:44 +0100
Message-Id: <20200311090644.20287-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3ee8086f5e55..3853ec3a2a8e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -611,7 +611,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
 		pullen = 0;
 	}
-	len += snprintf(buf + len, bufLen - len,
+	len += scnprintf(buf + len, bufLen - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
 			gpio,
 			pinmux,
@@ -625,10 +625,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += snprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
 			r1, r0);
 	} else {
-		len += snprintf(buf + len, bufLen - len, "\n");
+		len += scnprintf(buf + len, bufLen - len, "\n");
 	}
 
 	return len;
-- 
2.16.4

