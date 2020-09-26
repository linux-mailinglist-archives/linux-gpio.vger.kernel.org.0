Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F75B279D04
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgI0AFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:22 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:14783 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgI0AFV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjz0hnZzjx;
        Sun, 27 Sep 2020 01:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164759; bh=NIuh/lK92fim30F3SinZhziQenIzdH4Nck3dt31fXrE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=RrRIv+6gk0Efhi5EQN9GGcmgUhhzQv1fl6sXa5ScG85IunYRoBWjnIZp2EahVob20
         ItnubAXLtcBrfANltJotam7JjvO2fiwD2R6XiR6Mzybw/hfvMIkBrw8Fkp8kTRP8f3
         lhCn1aL72s5fQKGrFthn3yW1EdB8516eW7xqvzGh80dhKxmqRTuXVgJwSuxZazzRGa
         JDREnKtchXrC4hJRrzprrHcVUVLD57Oj2r+GhMvnVIYs2/qMID079iVvaxll54S0jG
         YrMMeXlh3UryN+Y1M5cVPHvC0dImZHVbAEy6p6U5L0clbTjuhcUPqIlPEYRo64XrcL
         iJnDFQbSHgYig==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:18 +0200
Message-Id: <2843e1c8a4e469762559b92bf9c0107f67aa83f0.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 5/5] mfd: tps65910: remove unused pointers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Client pointers in tps65910 data are not used in the drivers.
Remove those fields.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 include/linux/mfd/tps65910.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps65910.h
index f7398d982f23..701925db75b3 100644
--- a/include/linux/mfd/tps65910.h
+++ b/include/linux/mfd/tps65910.h
@@ -890,11 +890,6 @@ struct tps65910 {
 	struct regmap *regmap;
 	unsigned long id;
 
-	/* Client devices */
-	struct tps65910_pmic *pmic;
-	struct tps65910_rtc *rtc;
-	struct tps65910_power *power;
-
 	/* Device node parsed board data */
 	struct tps65910_board *of_plat_data;
 
-- 
2.20.1

