Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3822D0EFE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 12:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgLGL01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 06:26:27 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47763 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgLGL01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 06:26:27 -0500
Received: from orion.localdomain ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzyi6-1jyNnJ1PQk-00x1YA; Mon, 07 Dec 2020 12:23:55 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2] drivers: gpio: put virtual gpio device into their own submenu
Date:   Mon,  7 Dec 2020 12:23:54 +0100
Message-Id: <20201207112354.13884-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:vXs3ufNNxVIBLADw+fS7GRAFOKyDWCH5wh6co6se6r2Eh9pELot
 7Bz11dU9v4IqaYUGgsNTmNSlL1gCmInj4kNmev9MGf+goPe/tPVfDfKHQ+2/4llRDIOOOyX
 IpKlD+aFPgCxtBp4jtnrYF4j0UghEL/huTXZSbrNDeVqmhCOg4UrQXrcgKhptdnt/rfbyQL
 FDv5GH5dzbA0hoAI6pzcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:75VhAbi4Upw=:Szu1c02QnxJ1kAFb8gW0F7
 y2Df3OTq3/HLX6eNOwLv0FwQ4uAsBMJyc0mVqLf+9cHyQhTkPm4c0WIfdTElDdEHyFcdivTzJ
 hZALmLIM7x0I+A37BaMTxUBPM/4LLe2vjSeJ4ZE91euLw0zEipgoKUHR0AEb2EacvAnsvLL05
 ObKVdo4/7tptWnin6s1Gq8sh6E7NtqicPTqmigyi8QAlYH9aks5CBWgAG+AKsndgVye/Nira4
 a1KGOsO5+vZxcgbGlJmFXqUVNBxIdh4zXjyBnRRnMaGQbb1SCuqrh2dUB5ftvKfvFfYsjLCSy
 lYlZnrn4ECd1kGM2U3mXWrsefvvHBVgpCVsXOMQeDE0qNQl/X3Nqcngb+An3d+paW9IM2m1si
 DpLV2rQeMOhhnVRoyG4OjIDAeaRliNyRVw+OAIPEuKT/pSvsaldx+QURSG1Pb
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we already have a few virtual GPIO drivers, and more to come,
this category deserves its own submenu.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..8596f9320971 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+menu "Virtual GPIO drivers"
+
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
 	help
@@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+endmenu
+
 endif
-- 
2.11.0

