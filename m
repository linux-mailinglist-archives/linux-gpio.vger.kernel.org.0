Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8AD2A6135
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 11:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgKDKJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 05:09:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgKDKJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 05:09:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB37C0613D3;
        Wed,  4 Nov 2020 02:09:54 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4CR2Sw2w6lz9sTK; Wed,  4 Nov 2020 21:09:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1604484592;
        bh=j+i1lX1PsZW/0GrkODpnzYhaB1+/DX2TTEqP93CyZjI=;
        h=From:To:Cc:Subject:Date:From;
        b=DzhLBdo2KgZz80mcMGk3llfgVqTCaBVr10DO2EwY/P9aygfMyHCNLOHYNR90M69XF
         XAWuLjk1+t0h+SQ2EQwqt8+bYpeF3DaWII6L8QXAU8hn9MBDqNIugLo+pQ2qYjhG5l
         HoYtUB/lC252+1TNIks5Nodvyz0CenE1aH6MPMSqWH8Ss2BVeeHRvuXDi/glFutY8+
         Sz6lZH2kd/Zdy5dgS5jiWNbS2yVjWMV00BysQ6VZaIb2fHz2IBoPPC9MvT+YACEEUi
         l1DmVB+epgTAzmEydaTpQXMgHcsRyTGlBdz1/e0LobiMG0YuS3qBWzf+TK/CCPf9Wp
         HC87f2yY/SmaA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/4] selftests/gpio: Use TEST_GEN_PROGS_EXTENDED
Date:   Wed,  4 Nov 2020 21:08:40 +1100
Message-Id: <20201104100843.660407-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use TEST_GEN_PROGS_EXTENDED rather than TEST_PROGS_EXTENDED.

That tells the lib.mk logic that the files it references are to be
generated by the Makefile.

Having done that we don't need to override the all rule.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/gpio/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 32bdc978a711..c85fb5acf5f4 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -11,22 +11,20 @@ LDLIBS += $(VAR_LDLIBS)
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_PROGS_EXTENDED := gpio-mockup-chardev
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-chardev
 
 GPIODIR := $(realpath ../../../gpio)
 GPIOOBJ := gpio-utils.o
 
-all: $(TEST_PROGS_EXTENDED)
-
 override define CLEAN
-	$(RM) $(TEST_PROGS_EXTENDED)
+	$(RM) $(TEST_GEN_PROGS_EXTENDED)
 	$(MAKE) -C $(GPIODIR) OUTPUT=$(GPIODIR)/ clean
 endef
 
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
-$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
+$(TEST_GEN_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
 
 $(GPIODIR)/$(GPIOOBJ):
 	$(MAKE) OUTPUT=$(GPIODIR)/ -C $(GPIODIR)

base-commit: cf7cd542d1b538f6e9e83490bc090dd773f4266d
-- 
2.25.1

