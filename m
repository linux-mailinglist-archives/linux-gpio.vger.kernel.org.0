Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61BA35246C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 02:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhDBAVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 20:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233677AbhDBAVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 20:21:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D645C0613E6;
        Thu,  1 Apr 2021 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=tK9RRSfqusQgz1icEOJWsLA3SmIH83lmC2fpYvSB7vo=; b=QAjP6bAQ9Hq+lEU0VSIQIUO1Cs
        Epjo3LNjWvaRuAh6ijqjM65onjn5vEFdC0hMRj2UsUPKlbJkzkX0zueq1sLr6R1+XnZpfLQ6HAF4b
        cdbGSklvqN9VjKExUNzjg+g61I7GTC/ViTNNqESoZ6QiLmVV0FNHeGj0+KP/drlyTn7VZnPsHvm+V
        Ed4ETCBtqzSQLqNKThMTM5bDg7ykQHOC2vPK74OrAiAgpuBgEDkp5CVYnto2Sq12zEEGslROuJ0f4
        U4+d+gjYUtO9keXXjSHp9r4R6EK53fk+45eNNV/I5y8fOAUVoOy0+6kRw/e7Ez8QFeDs2UQkyCF3M
        NxiUOMIA==;
Received: from [2601:1c0:6280:3f0::e0e1] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lS7Z3-006xwF-Tu; Fri, 02 Apr 2021 00:21:35 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
Subject: [PATCH -next] gpio: GPIO_SCH: depends on PCI same as LPC_SCH
Date:   Thu,  1 Apr 2021 17:21:24 -0700
Message-Id: <20210402002124.17207-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since LPC_SCH depends on PCI, GPIO_SCH must also depend on PCI
to prevent kconfig warning and build errors:

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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Denis Turischev <denis@compulab.co.il>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210401.orig/drivers/gpio/Kconfig
+++ linux-next-20210401/drivers/gpio/Kconfig
@@ -860,7 +860,7 @@ config GPIO_IT87
 
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on (X86 || COMPILE_TEST) && ACPI
+	depends on (X86 || COMPILE_TEST) && ACPI && PCI
 	select GPIOLIB_IRQCHIP
 	select MFD_CORE
 	select LPC_SCH
