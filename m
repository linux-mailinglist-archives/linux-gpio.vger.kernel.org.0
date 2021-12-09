Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A3146E72D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 11:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbhLILCb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 06:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbhLILCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 06:02:31 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E1DC061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 02:58:58 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id l18so69497pgj.9
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 02:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nRV928gZ5l34/dx1SJLj3SbOrl5cMNdW6Ahyxk2pA8=;
        b=X7NzcWlTTqG28MznWlT6jqMNPi7G+duPSgCuNciL54rnBfELzOMthucKN5IoYjNF2U
         yOYFjC2KpQPivBvl0MOjZtnvUu1yyVtLfHLXUcwfsuQwTdCVwiZiC9ENWgvsAnyV8eaU
         0uWKweW2LDYNeGU7FvKNqZ7GWwIAadRvUqVC3LPluPeStu2wvqOd7hF8Utc8PFqOygjx
         Tr7f25pNKHNUZhxpnk0O8UzYVlsbXFSgufJklrGZtiukh/X2SY55REDS8e6WHtlC0wqJ
         3NjD1zrS1YXhglYLY681el331v7KkFsB8d/OptGHvrznwaedv+UsULGgZMqvuQyQF3x8
         OAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nRV928gZ5l34/dx1SJLj3SbOrl5cMNdW6Ahyxk2pA8=;
        b=SxMThRd6x0IG5/fM16fVZeE1D7iufZzPDuM3az7L33ejamYmwbc41tQ+lMyzbcvjOb
         P29Lh3bS5Rw5+bdD/EmgzsZONtvMnkjkgSV8wWCM7IdHcFsX9AZOyWp6U/NHNEDhI64Y
         qOIeqgJG82FD2gzpmsZqdqhczhblyYKP1zpgU2IL68WrmLy4U5NWGpJH82CPlKg008dC
         oo6Beid/c/eq6EdjMBB+tmSmGRyU/Pl+ggOmlxcirLz2j9oqf+lFv8DnTLlIN+qWWbs5
         3UnaUkP5bd786IqZKK4P+ZP5dQIAaXmeAZFA5mV9qm1cADWm5JEN03x2PDLiy0SshVLt
         9I4Q==
X-Gm-Message-State: AOAM5338fxi6vT3dO3Zj4eQ3SmyGyx6eKwNmy6PSJizs/2DXRVsZiMqe
        0QNlUVwjTyQo28hsJwnBTGueNQ==
X-Google-Smtp-Source: ABdhPJzKEc4obI2sBrm+kTBvnGC9j+hfUHs2rlrshXUqQ1AOS1JdywxUNmtTrSJe8KLjJ2GoijurLA==
X-Received: by 2002:a65:6799:: with SMTP id e25mr33789898pgr.293.1639047537020;
        Thu, 09 Dec 2021 02:58:57 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id d4sm6929954pfj.78.2021.12.09.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 02:58:56 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] libgpiod: Fix build failure with musl
Date:   Thu,  9 Dec 2021 16:28:53 +0530
Message-Id: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
and hence we get redefinition errors during build as <linux/ioctl.h>,
included via <uapi/gpio.h>, defines them again.

Fix this by undefining the macros between both the includes, document it
all in musl-compat.h as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 lib/internal.h    |  1 +
 lib/musl-compat.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 lib/musl-compat.h

diff --git a/lib/internal.h b/lib/internal.h
index 32f36b5cd4cf..89c94cdd8ef6 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -8,6 +8,7 @@
 #include <stddef.h>
 #include <stdint.h>
 
+#include "musl-compat.h"
 #include "uapi/gpio.h"
 
 /* For internal library use only. */
diff --git a/lib/musl-compat.h b/lib/musl-compat.h
new file mode 100644
index 000000000000..69787de86f7c
--- /dev/null
+++ b/lib/musl-compat.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
+
+#ifndef __LIBGPIOD_MUSL_COMPAT_H__
+#define __LIBGPIOD_MUSL_COMPAT_H__
+
+/*
+ * Musl's <sys/ioctl.h> (<bits/ioctl.h>) also defines below macros, un-define
+ * them before adding the ones via <linux/gpio.h> to avoid build failures.
+ */
+
+#undef _IOWR
+#undef _IOR
+#undef _IOW
+#undef _IOC
+#undef _IO
+
+#endif /* __LIBGPIOD_MUSL_COMPAT_H__ */
-- 
2.31.1.272.g89b43f80a514

