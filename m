Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDF02D913C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 00:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgLMXzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 18:55:36 -0500
Received: from aposti.net ([89.234.176.197]:48842 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727178AbgLMXzg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 18:55:36 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/2] kconfig.h: Add IF_ENABLED() macro
Date:   Sun, 13 Dec 2020 23:54:46 +0000
Message-Id: <20201213235447.138271-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
or 'm', NULL otherwise. The (ptr) argument must be a pointer.

The IF_ENABLED() macro can be very useful to help GCC drop dead code.

For instance, consider the following:

    #ifdef CONFIG_FOO_SUSPEND
    static int foo_suspend(struct device *dev)
    {
       ...
    }
    #endif

    static struct pm_ops foo_ops = {
	#ifdef CONFIG_FOO_SUSPEND
        .suspend = foo_suspend,
	#endif
    };

While this works, the foo_suspend() macro is compiled conditionally,
only when CONFIG_FOO_SUSPEND is set. This is problematic, as there could
be a build bug in this function, we wouldn't have a way to know unless
the config option is set.

An alternative is to declare foo_suspend() always, but mark it as maybe
unused:

    static int __maybe_unused foo_suspend(struct device *dev)
    {
       ...
    }

    static struct pm_ops foo_ops = {
	#ifdef CONFIG_FOO_SUSPEND
        .suspend = foo_suspend,
	#endif
    };

Again, this works, but the __maybe_unused attribute is required to
instruct the compiler that the function may not be referenced anywhere,
and is safe to remove without making a fuss about it. This makes the
programmer responsible for tagging the functions that can be
garbage-collected.

With this patch, it is now possible to write the following:

    static int foo_suspend(struct device *dev)
    {
       ...
    }

    static struct pm_ops foo_ops = {
        .suspend = IF_ENABLED(CONFIG_FOO_SUSPEND, foo_suspend),
    };

The foo_suspend() function will now be automatically dropped by the
compiler, and it does not require any specific attribute.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Only add IF_ENABLED() and don't verify that the argument is a
        pointer; since the second argument of the ?: ternary operator
    	is NULL, the compiler should issue an error if the other
    	argument is not a pointer.

 include/linux/kconfig.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 9d12c970f18f..e78e17a76dc9 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -72,4 +72,10 @@
  */
 #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
 
+/*
+ * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
+ * or 'm', NULL otherwise.
+ */
+#define IF_ENABLED(option, ptr) (IS_ENABLED(option) ? (ptr) : NULL)
+
 #endif /* __LINUX_KCONFIG_H */
-- 
2.29.2

