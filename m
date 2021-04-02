Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725CA352DA0
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 18:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbhDBQSY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 12:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhDBQSW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 12:18:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC18C0613E6
        for <linux-gpio@vger.kernel.org>; Fri,  2 Apr 2021 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=4OCCkGPMdgRBcpF4HRaT8MGa50RN3tbL9JmNslXSYeQ=; b=SGOL55eI+AxVD/PjS2cx/MVpgU
        rx92dJo98sJorRq/oeVceB6WwInO4Xk6tiOJxK1jj5jdQ4nX8CwHr8dudtY3ALMLPySfZc/W7Nlwz
        /UsfTvzQwohh6BIjNwaMCR56VZBwJRNra1oGq3n1D/My5g24i65QDgWJM1SWdgBZ8hiu704LBXhZC
        rpmhLixiiNUk+/3jMQw4TG/oa4x57hOv0fg48fAiSQ7sFe9TXIQ4CNMzW1eOidtyo+/mJpkdJlHK1
        jSbGcGkQU5bsKxWg/U3W7i3PM7HQkRGVUqKiCL0WvqZrYzGMlvP/tiBYwFfOuKMqFx4bpJVbf/Km+
        yVriHPgQ==;
Received: from [2601:1c0:6280:3f0::e0e1] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lSMUd-007r79-0h; Fri, 02 Apr 2021 16:17:57 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
Subject: [PATCH -next v2] gpio: GPIO_SCH: depends on LPC_SCH
Date:   Fri,  2 Apr 2021 09:17:51 -0700
Message-Id: <20210402161751.7683-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since LPC_SCH provides GPIO functionality, GPIO_SCH should depend on
LPC_SCH to prevent kconfig warning and build errors:

WARNING: unmet direct dependencies detected for LPC_SCH
  Depends on [n]: HAS_IOMEM [=y] && PCI [=n]
  Selected by [y]:
  - GPIO_SCH [=y] && GPIOLIB [=y] && X86 [=y] && (X86 [=y] || COMPILE_TEST [=n]) && ACPI [=y]

and

../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or storage class
 module_pci_driver(lpc_sch_driver);
 ^~~~~~~~~~~~~~~~~
../drivers/mfd/lpc_sch.c:204:1: error: type defaults to ‘int’ in declaration of ‘module_pci_driver’ [-Werror=implicit-int]
../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types) in function declaration
../drivers/mfd/lpc_sch.c:197:26: warning: ‘lpc_sch_driver’ defined but not used [-Wunused-variable]
 static struct pci_driver lpc_sch_driver = {
                          ^~~~~~~~~~~~~~

Fixes: 6c46215d6b62 ("gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Denis Turischev <denis@compulab.co.il>
---
v2: change to "depends on LPC_SCH" as suggested by Andy

 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210401.orig/drivers/gpio/Kconfig
+++ linux-next-20210401/drivers/gpio/Kconfig
@@ -861,9 +861,9 @@ config GPIO_IT87
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
 	depends on (X86 || COMPILE_TEST) && ACPI
+	depends on LPC_SCH
 	select GPIOLIB_IRQCHIP
 	select MFD_CORE
-	select LPC_SCH
 	help
 	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
 	  Intel Tunnel Creek processor, Intel Centerton processor or
