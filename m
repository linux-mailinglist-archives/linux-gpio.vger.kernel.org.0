Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29751F925B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgFOI6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:58:04 -0400
Received: from thoth.sbs.de ([192.35.17.2]:38813 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728593AbgFOI6D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 04:58:03 -0400
X-Greylist: delayed 1772 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jun 2020 04:58:02 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 05F8SOU4018496
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 10:28:24 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.53.252])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05F8SNgI021930;
        Mon, 15 Jun 2020 10:28:24 +0200
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: gpio: pca953x: add nxp,pcal9535
Date:   Mon, 15 Jun 2020 10:28:22 +0200
Message-Id: <213b571eda0ac65a2605df83e60fc20a9b37070a.1592209703.git.jan.kiszka@siemens.com>
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

The NXP PCAL9535 is an extended variant of the PCA9535.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index dab537c20def..3126c3817e2a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -19,6 +19,7 @@ Required properties:
 	nxp,pca9698
 	nxp,pcal6416
 	nxp,pcal6524
+	nxp,pcal9535
 	nxp,pcal9555a
 	maxim,max7310
 	maxim,max7312
-- 
2.26.2

