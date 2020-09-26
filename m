Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7359E279D01
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgI0AFV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:22724 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728580AbgI0AFV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:21 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjx5nYBzc8;
        Sun, 27 Sep 2020 01:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164757; bh=uMRVWVBG1Z+A3OIeVUCDbEDNzEgxLJlsjWfFkOCe9zw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=omVwFkZi3ZCahiHcVV3f4vO/nTr6+fvrDqyvW3Kr4aMX7ia0sk8/1osuWb/bK8PAw
         YTW2xKt0SolJvtvurmGcPFSLb1OWNok5zfN/XYP3EsFhxY7uv24r5+1SG8Dj71qo4y
         WSqvTa7JZRP18uOsSBHC9baTHQ26Zgh89ARSQf0Vv61IFahXdl8JFEckHBSVEYci87
         tdIBtQGJN9MnFN3Ookc2LtDmCzVVE41Svxgw13YU3PfDMjvWCv+JxUXQI2znzAb/nE
         fazs2E1j9LJsSMJ+FMJ71m3C+mqucsJnP8fvUTM6YMMyPI//x98U/sxr03l0YvU9O3
         uLg4HxJDVsvdA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:17 +0200
Message-Id: <3c37cdd9a0f23157e56ada0e2f15aa7370661ef4.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 3/5] mfd: tps65911-comparator: use regmap accessors
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

Use regmap accessors directly for register manipulation - removing
one layer of abstraction.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/mfd/tps65911-comparator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index 2334cd61c98d..8f4210075913 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -69,7 +69,7 @@ static int comp_threshold_set(struct tps65910 *tps65910, int id, int voltage)
 		return -EINVAL;
 
 	val = index << 1;
-	ret = tps65910_reg_write(tps65910, tps_comp.reg, val);
+	ret = regmap_write(tps65910->regmap, tps_comp.reg, val);
 
 	return ret;
 }
@@ -80,7 +80,7 @@ static int comp_threshold_get(struct tps65910 *tps65910, int id)
 	unsigned int val;
 	int ret;
 
-	ret = tps65910_reg_read(tps65910, tps_comp.reg, &val);
+	ret = regmap_read(tps65910->regmap, tps_comp.reg, &val);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

