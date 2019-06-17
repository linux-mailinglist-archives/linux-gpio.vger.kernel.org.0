Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB6448825
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbfFQQAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:00:15 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33497 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfFQQAO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:00:14 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2ep5-1hdAtn34bX-0049gR; Mon, 17 Jun 2019 18:00:12 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] drivers: gpio: amd-fch: make resource struct const
Date:   Mon, 17 Jun 2019 18:00:10 +0200
Message-Id: <1560787211-15443-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:wPmsjFPvebemUVprhSzRT4STymfnNwj1UR1GNgnCTPj0XnZqwUf
 RSve1vtC+hi9EJZMgSynkJq5lj2du8LuYPTF1ceFOYnaUXGTrdGrLcCSSz7ZnF8cDUcsKvi
 dox7mLCobE4tHBxhFSGoBXL07fGdxYxv2STKerKecFEmO+dVUyjstS3ftteosnsFPC4tscY
 pl3ACAV8swfvcaHAxpJUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yv0UDtaIzwQ=:7qZTJQFySO87zUpQPfb7bP
 zUPkotlha+hCzPX6zuCsEcebCqVaks/4JuWN+92DrX6jOtXl6uk2PKGVNCFLE7rAeYuuHLW6N
 fOxU2R32h0eXvuAzuY5hhlSFc6M/U5a8XBCBCtUPuOyf3U6mW6M9OJb3vTDf2ktTIPdufHshQ
 RXs/b3O8C9mWkq09nBg6Nci2ptMkl7cKpb9WrL870bALHHzRvQggmpx+qTiVmK7bmKe0QsGD/
 7xlFmFUrF+9DBZ1XQlin9FiY2Qz0htrn91PvAiSr7iIk3hmW7repCzzGEkG2ISZwYZlbqVSa1
 1W/j35qg53zuvG61ifHTrhiJMHYbbP2/lp9XVEma7gWp7fLxsCP0axipYwPhnCp63W3LzGpH4
 c9THyl7Hf5ErwqqTaHZJ/Ww7QdGn3kKpl0WvzmTVokkE+GUd766aZsfhMhwDc6pgbUZcpG114
 bf2ayO74TlpfmtML+etqCC5s5G+pue/Nn3cCSadIB2Ny8WoxRydrpEN26RDb7lDTQ/2Cqzerh
 LstkTgx5ouHTb2kcCIceeKU8OrUHCQAQExQ33IxpNYlaikiLRlyBzjTHIjf9JX9mllkF5DC52
 M6GblW+0fbftoUoyy1S6rOeTO/BHq9G4Q8yMN4w10BcrDMOsCWY0HIx4MKK8dtjXqcUukibhS
 EowV/iVanB3WYG0ns/OjLbmYeoAW5Upn/UCmZ4CC79ZdKg8GA84gxZWEPUfpHR3q864Y53UPe
 mi2QJgpLGzJuWqeZAQ+Bogp8ihBk1V77i/vRxg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The struct resource field is statically initialized
and may never change. Therefore make it const.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-amd-fch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 38c3f4a..390a8b8 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -25,7 +25,7 @@
 #define AMD_FCH_GPIO_FLAG_WRITE		BIT(22)
 #define AMD_FCH_GPIO_FLAG_READ		BIT(16)
 
-static struct resource amd_fch_gpio_iores =
+static const struct resource amd_fch_gpio_iores =
 	DEFINE_RES_MEM_NAMED(
 		AMD_FCH_MMIO_BASE + AMD_FCH_GPIO_BANK0_BASE,
 		AMD_FCH_GPIO_SIZE,
-- 
1.9.1

