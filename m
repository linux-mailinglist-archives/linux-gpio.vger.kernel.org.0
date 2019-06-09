Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA89A3A670
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 16:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfFIOnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 10:43:31 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:27433 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfFIOnb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 10:43:31 -0400
X-Greylist: delayed 776 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 Jun 2019 10:43:30 EDT
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x59EhFnf030551;
        Sun, 9 Jun 2019 23:43:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x59EhFnf030551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560091395;
        bh=mhbD8S5r6Dd/oZAAnNntLyx9FTh4P/nE5CCP+9R0SRk=;
        h=From:To:Cc:Subject:Date:From;
        b=0M6RuL/KNuNRwWEfi7rYdXDE062I4Q5xbpSsJyxlTFqcefr/j3QhU7wkAzTXViEQJ
         +fCZ/BIOgqqosktM5zmO3dQ4aUVHpvn1TAw4Jt0XpCeor5hrDcTlmEkMCPGBXXSa8e
         YCIDrqR1EKMIWviXMaWJzzZcCOy5dA35wtuJrjzvFghJspu2rxMiqjeMzOHTXDYAuy
         vCaUK0cuK83cYj3ph88g6OLCF8g0gp8j4Bb6/vHq0r7zf9fnDigTORAE3ldYNVDhEY
         nrhQ54GhpYnYhz7C+NGI4omvB0qI2u41zHo4mlOD96oYI19bQVhMfJSdS9VviG9fRW
         +srL8MIPtNP7g==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: add include guard to pinctrl-state.h
Date:   Sun,  9 Jun 2019 23:43:13 +0900
Message-Id: <20190609144313.4842-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinctrl-state.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl-state.h b/include/linux/pinctrl/pinctrl-state.h
index a0e785815a64..635d97e9285e 100644
--- a/include/linux/pinctrl/pinctrl-state.h
+++ b/include/linux/pinctrl/pinctrl-state.h
@@ -3,6 +3,9 @@
  * Standard pin control state definitions
  */
 
+#ifndef __LINUX_PINCTRL_PINCTRL_STATE_H
+#define __LINUX_PINCTRL_PINCTRL_STATE_H
+
 /**
  * @PINCTRL_STATE_DEFAULT: the state the pinctrl handle shall be put
  *	into as default, usually this means the pins are up and ready to
@@ -31,3 +34,5 @@
 #define PINCTRL_STATE_INIT "init"
 #define PINCTRL_STATE_IDLE "idle"
 #define PINCTRL_STATE_SLEEP "sleep"
+
+#endif /* __LINUX_PINCTRL_PINCTRL_STATE_H */
-- 
2.17.1

