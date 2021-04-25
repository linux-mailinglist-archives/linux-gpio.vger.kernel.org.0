Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8F036A72D
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Apr 2021 14:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhDYM1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Apr 2021 08:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhDYM1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Apr 2021 08:27:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41486C061574;
        Sun, 25 Apr 2021 05:26:36 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso3710483pjn.3;
        Sun, 25 Apr 2021 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Q7owk5I/h07ZR9RenvZgNntZV/8AwXDtuPUVeIWpklw=;
        b=pRz0l7oBO6FtwOfvsLCp3Sidezt3fCH+ojSHWrry3APSCneGlpxrA6PEKMxcbk2qzh
         KQOxiKsrLb9dnTLpfqEKkE8Us6ALirJIweZLTpUTrrpXDVcKm2MmMPa6c7i9esjSNs9G
         ogLFlWM4iy4AMRL/N0tJUiI4gflasVm/kol8aVm/4iglSJSSXlg72bHBh84wzpSDvmg9
         tKMygsxycBjUnurIBrqEmpzaVsgK4XI00+VBKCb2f8CCt3w1C/+fy6E0yOo869DRVAmi
         8lUpwbXtp8oKCpXDA/Dt1J4QVXYDqBShIjBGIx7yel7mFur5uhUEJ3xjRATxu83hU7yN
         yaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q7owk5I/h07ZR9RenvZgNntZV/8AwXDtuPUVeIWpklw=;
        b=abGXcv7Y/FlhJ5rlcN+zQz/M92XFf6OdheVoK8WRqMfp5d4FCu4jTENtC99FQCll3T
         quoVaDwTY7J3YSz8Ll8gx6cDYStFq0Vxq0JAiXEt+FU4Xlnd5UliGTJpLtRRIRvqx0uX
         dYZHips0xM+4WRdkL995HDpyi3MlhCo1HZnzEQp84dQ9o0z0ua0otmtiSsjU3EwhQGff
         WaQOAaSwnL8ihRJJz+5bq9NdSEbXIi6Q3JriHCLhvuBlBDSd68ph7kou/sB23xGLv7x8
         8/ZrH126y7Jvymj1ep58brYEB54mqv34cbJ/TenuamIDiSz7BwdM3U0M5IlcG/Rz6acj
         30Ig==
X-Gm-Message-State: AOAM533yGQ9mwBQisbAaCF0l4v4A0w6ySQG/EShWFyr0qiOGQDWf/ef0
        jPAHT8PBBj0iPd4Iw+Q6kOA=
X-Google-Smtp-Source: ABdhPJyA4qBnZ0a7f1/UsEw+YIdSkmMmpLnxCfTeSt7ZilQ33L2out6vc8cXFAwOyMKEehZzLcUS7A==
X-Received: by 2002:a17:90a:a081:: with SMTP id r1mr5108610pjp.101.1619353595209;
        Sun, 25 Apr 2021 05:26:35 -0700 (PDT)
Received: from localhost.localdomain ([49.37.83.82])
        by smtp.gmail.com with ESMTPSA id ir3sm11695075pjb.42.2021.04.25.05.26.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 05:26:34 -0700 (PDT)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     andrew@aj.id.au, linus.walleij@linaro.org, joel@jms.id.au
Cc:     linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] pinctrl: aspeed: Fix minor documentation error
Date:   Sun, 25 Apr 2021 17:56:24 +0530
Message-Id: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel test robot throws below warning ->

drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c:2705: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2614: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinctrl-aspeed.c:111: warning: This comment
starts with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
drivers/pinctrl/aspeed/pinmux-aspeed.c:24: warning: This comment starts
with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

Fix minor documentation error.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 3 ++-
 drivers/pinctrl/aspeed/pinmux-aspeed.c     | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 996ebcb..4c0d266 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2702,8 +2702,8 @@ static int aspeed_g5_sig_expr_eval(struct aspeed_pinmux_data *ctx,
 }
 
 /**
- * Configure a pin's signal by applying an expression's descriptor state for
- * all descriptors in the expression.
+ * aspeed_g5_sig_expr_set() - Configure a pin's signal by applying an
+ * expression's descriptor state for all descriptors in the expression.
  *
  * @ctx: The pinmux context
  * @expr: The expression associated with the function whose signal is to be
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5c1a109..eeab093 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2611,8 +2611,8 @@
 };
 
 /**
- * Configure a pin's signal by applying an expression's descriptor state for
- * all descriptors in the expression.
+ * aspeed_g6_sig_expr_set() - Configure a pin's signal by applying an
+ * expression's descriptor state for all descriptors in the expression.
  *
  * @ctx: The pinmux context
  * @expr: The expression associated with the function whose signal is to be
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c65d56..9bbfe5c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -108,7 +108,8 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 }
 
 /**
- * Disable a signal on a pin by disabling all provided signal expressions.
+ * aspeed_disable_sig() - Disable a signal on a pin by disabling all provided
+ * signal expressions.
  *
  * @ctx: The pinmux context
  * @exprs: The list of signal expressions (from a priority level on a pin)
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 57305ca..894e2ef 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -21,7 +21,8 @@ static inline void aspeed_sig_desc_print_val(
 }
 
 /**
- * Query the enabled or disabled state of a signal descriptor
+ * aspeed_sig_desc_eval() - Query the enabled or disabled state of a signal
+ * descriptor.
  *
  * @desc: The signal descriptor of interest
  * @enabled: True to query the enabled state, false to query disabled state
-- 
1.9.1

