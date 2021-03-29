Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3B134CE98
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhC2LRa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:17:30 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55158 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232039AbhC2LRU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 07:17:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 0768235D7;
        Mon, 29 Mar 2021 13:17:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lApW-tkxq7lu; Mon, 29 Mar 2021 13:17:18 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id CD2CA35D8; Mon, 29 Mar 2021 13:17:18 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Dahl <ada@thorsis.com>
Subject: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
Date:   Mon, 29 Mar 2021 13:16:46 +0200
Message-Id: <20210329111648.7969-2-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-1-ada@thorsis.com>
References: <20210329111648.7969-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Module probing with the parameter documented yielded this in kernel log:

        gpio_mockup: unknown parameter 'gpio_named_lines' ignored

The parameter documented did not match the parameter actually
implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
the lines") long before introducing the documentation.

Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/admin-guide/gpio/gpio-mockup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
index 9fa1618b3adc..e3cafb4451aa 100644
--- a/Documentation/admin-guide/gpio/gpio-mockup.rst
+++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
@@ -27,7 +27,7 @@ module.
         the second 16 and the third 4. The base GPIO for the third chip is set
         to 405 while for two first chips it will be assigned automatically.
 
-    gpio_named_lines
+    gpio_mockup_named_lines
 
         This parameter doesn't take any arguments. It lets the driver know that
         GPIO lines exposed by it should be named.
-- 
2.20.1

