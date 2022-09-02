Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7AF5AB47A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236952AbiIBO4r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 10:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbiIBOzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 10:55:40 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054B765658;
        Fri,  2 Sep 2022 07:20:45 -0700 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4MJyHW0l8Cz9slX;
        Fri,  2 Sep 2022 14:42:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fcDlgJNWUSKR; Fri,  2 Sep 2022 14:42:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4MJyHS0804z9sl9;
        Fri,  2 Sep 2022 14:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E21D18B798;
        Fri,  2 Sep 2022 14:42:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id DUTLC8JVCdNe; Fri,  2 Sep 2022 14:42:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.39])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D777D8B792;
        Fri,  2 Sep 2022 14:42:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 282CgYaJ2141519
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 2 Sep 2022 14:42:34 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 282CgYrG2141518;
        Fri, 2 Sep 2022 14:42:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Keerthy <j-keerthy@ti.com>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Davide Ciminaghi <ciminaghi@gnudd.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, x86@kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 6/9] Documentation: gpio: Remove text about ARCH_NR_GPIOS
Date:   Fri,  2 Sep 2022 14:42:06 +0200
Message-Id: <3a1f82b079a57ea07351ad6e71d7964162a03070.1662116601.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1662116601.git.christophe.leroy@csgroup.eu>
References: <cover.1662116601.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662122527; l=1475; s=20211009; h=from:subject:message-id; bh=nMrWytdB4dtfJH5pitzlz2TRZRbRFDARsAY3M0xeb40=; b=nrOIc10OdOffIFYCwasvWrqQXePmi36vpW/sWCioLuTrxLCyE0m+9EX4aRa4jyQtGJNvmHhSerTx 4DtEXnYMAAR4fa3TG6FlIYSKwgENjTxNPdGncE6w6sOXlj+cvO30
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ARCH_NR_GPIOS have been removed, clean up the documentation.

After this patch, the only place when ARCH_NR_GPIOS remains is in
translations/zh_CN/gpio.txt and translations/zh_TW/gpio.txt.
I don't have the skills to update that, anyway those two files are
already out of sync as they are still mentionning ARCH_REQUIRE_GPIOLIB
which was removed by commit 65053e1a7743 ("gpio: delete
ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 Documentation/driver-api/gpio/legacy.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index 9b12eeb89170..e17910cc3271 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -558,11 +558,6 @@ Platform Support
 To force-enable this framework, a platform's Kconfig will "select" GPIOLIB,
 else it is up to the user to configure support for GPIO.
 
-It may also provide a custom value for ARCH_NR_GPIOS, so that it better
-reflects the number of GPIOs in actual use on that platform, without
-wasting static table space.  (It should count both built-in/SoC GPIOs and
-also ones on GPIO expanders.
-
 If neither of these options are selected, the platform does not support
 GPIOs through GPIO-lib and the code cannot be enabled by the user.
 
-- 
2.37.1

