Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AC12CDDB9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 19:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731619AbgLCSdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 13:33:23 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:49875 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgLCSdX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 13:33:23 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Macaw-1kAAe918IM-00c9lz; Thu, 03 Dec 2020 19:30:51 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] drivers: gpio: put virtual gpio device into their own submenu
Date:   Thu,  3 Dec 2020 19:30:50 +0100
Message-Id: <20201203183050.12102-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:6ibgEDAJK0D/xo8xKPUBaDw/5s3N3wc1VsqnovOAchlRehC8Akl
 77xjbRFqfNU7cALKoUnvw81vR4o6cZA2FApsk1k6sRp5HRwttLCRMu2S1S6oQHF+yLyiOsT
 zFAYAvdVjOUX6nXVpAyyCwZgrlRffJ6x4d4MJPiUvmQdyUqfxyOH4rWJANcBrgVLrF7EDLj
 6fkc0bRx7xzP5SRY5mfPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:co134w3i1Jc=:GAt7NmAsRXlk24YDYg/Syz
 Xq1Bu4nyIRVCMMcUJOmcx2Sbvp46bR9ZHkXmtdLkt+S7xp0P98Oc4mayfFHrjVsGE1gL0ytPZ
 OaRZr6gCKwsJHYICb2aR8zy6/fzxCvNMpVJd8RU8N5o3AQ3wFc+cajLStzRYVabaiRqLTYEWO
 0y7MPmzjz2qwGamBPnA5EIet34tbjBCHk4P2d+UZuRVDcEtM0XVd6n+UWM5DhpLeBFOcVM6GC
 xXoV4KIl2sJVrGf9jsCMro4cyO39giC7TrQFsFFLOzS5tq0sksgzpxh6EqR2lU0WoQxhHpoQS
 3pml0X+sD8H6xLDRUtT65rZXJofIglFHJNXgk6vRzdssMvvIjKEXbJzVPWl254xeeETuupWXM
 M0uMpaZ6TsdC8zrzHXU9uKCY1BNs30MQtChOkBQrWBZEYdJkXsb3RfIbTkWPi
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we already have a few virtual gpio devices, and more to come,
this category deserves its own submenu.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..01619eb58396 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+menu "Virtual GPIO devices"
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

