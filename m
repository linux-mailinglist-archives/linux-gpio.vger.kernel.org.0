Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEC51F91F3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgFOInE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:43:04 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:41805 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729463AbgFOInE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 04:43:04 -0400
X-Greylist: delayed 872 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jun 2020 04:43:02 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05F8SOYi002760
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 10:28:24 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.53.252])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05F8SNgJ021930;
        Mon, 15 Jun 2020 10:28:24 +0200
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: pca953x: Add support for the PCAL9535
Date:   Mon, 15 Jun 2020 10:28:23 +0200
Message-Id: <b4548638f5eee6919f0a74f52c1a6ddba8fea678.1592209703.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592209703.git.jan.kiszka@siemens.com>
References: <cover.1592209703.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

The PCAL9535 [1] is compatible to the PCA9535. Additionally, it comes
with interrupt support and input latching. Other features are not
supported by the GPIO subsystem.

[1] https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..34d635e51dda 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1131,6 +1131,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
 	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pca9536", .data = OF_953X( 4, 0), },
 	{ .compatible = "nxp,pca9537", .data = OF_953X( 4, PCA_INT), },
 	{ .compatible = "nxp,pca9538", .data = OF_953X( 8, PCA_INT), },
-- 
2.26.2

