Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC1D35846
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 10:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfFEICi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 04:02:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53714 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbfFEICh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 04:02:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5582aAr002082;
        Wed, 5 Jun 2019 03:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559721756;
        bh=hIv3m0nvpBJjbhu7oWIXqB0Efd9SLUjlr+sYX36ES7k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=D3t02seyF6o7j+EOEU1ftQ9sLXcCbyT83fDW/olIfVvlazszWNCPikl7O61y7sqDk
         ESAaVHHzyYxjUkQmmgVutQivlw0vndtwwj2iA8fVZC5vVGnjK3UbjAdjjnnpqNZE37
         ZcndVXuuN6OEWGQsDr0RDJRwYIPv4TYt0urYURhE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5582a01128510
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 03:02:36 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 03:02:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 03:02:36 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5582N7o041815;
        Wed, 5 Jun 2019 03:02:33 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <lokeshvutla@ti.com>, <linux-gpio@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] gpio: Davinci: Add K3 dependencies
Date:   Wed, 5 Jun 2019 13:32:59 +0530
Message-ID: <20190605080259.2462-4-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605080259.2462-1-j-keerthy@ti.com>
References: <20190605080259.2462-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add K3 dependencies to enable the driver on K3 platforms.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 62f3fe06cd2f..28dba62e2219 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -174,7 +174,7 @@ config GPIO_CLPS711X
 config GPIO_DAVINCI
 	bool "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
-	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE)
+	depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.17.1

