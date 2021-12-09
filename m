Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E548546E7E5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 12:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235715AbhLIMCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 07:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhLIMCZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 07:02:25 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3367AC061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 03:58:52 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id k64so5188694pfd.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 03:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ymNqwN7kNLPCsrBwYV7uGZavHoq6orVzHhH3eb0mfKE=;
        b=ShRKBjMa2Nvk0WgczltPRRe9qBJnKZCcihkp4DX+ISOZ0pUAduzTpyaGgkE1uz287n
         quKDI+H0/da4GklfW0KO+siAKgPTuAl8k23NgF2Ao5KkhcdjCpiZXKHNiRGz7oYSMSVv
         f42rV74aXEjvzbel46gvhgF/itIyeVShv77/9HDopzWZ3voBzECBmNzaK1ep3Yn25DuZ
         lFH2NsIGzm1DFvM7YRDc7O44088I+ZxWDlU7PBoLd9cY76g3LDkN1MHeZKANmVOFDZC0
         UOEwyPgLhzuQvmYbFYDDVOfsdx3Is1YxmvsVbknIuq6L+tfWFjCYa+KJeD/hMNJu4Cnl
         GkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ymNqwN7kNLPCsrBwYV7uGZavHoq6orVzHhH3eb0mfKE=;
        b=4uEEGuG9OCeqY9HioMQ7/h/McOW8rmuS3h/AyzaRD5JaDB0dfEK0DxnnIXetm4n417
         Km9reyW0Zrtr5NWWhETOM5y9eqwOaU+UCURYKXyvKwGlLALyFJqL8CiZxJLnbLi3iUnn
         9mk26u0xdqQl6EqakamfVQPH4wKnK15oXnl2k7rdzGVHVXwzvC1JQfphAF8rE1cpngJp
         3jjt/Kklse1lUh5Sm0InyRtoNkZt3LJ9ydCR5+zWm8I7v2XXMOuRyVcUa9eoxDq3EiiF
         B3wrQA50HkCRjYy4fYA7HeLicpYcxgjgoQm3uH/Yj+8Zn26S1y14+6jI3ecZkYze65df
         xRWw==
X-Gm-Message-State: AOAM533SRMhrkU5SSprTRQSBDq9ZIwxZyZO2eR7M8lCeD0VuY5gonW6r
        KLtHUplpIIppVfl/0Ch1uD2t5g==
X-Google-Smtp-Source: ABdhPJxDDZQk6syZRcPV0ymPAvmX+afpXmNFZV6dHWGy1f8qfku6Mym7FZbXBbSfRFJ9/R1h1V30Uw==
X-Received: by 2002:a63:dd47:: with SMTP id g7mr28982300pgj.181.1639051131709;
        Thu, 09 Dec 2021 03:58:51 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id q21sm7306375pfu.106.2021.12.09.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 03:58:50 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH V2] libgpiod: Fix build failure with musl
Date:   Thu,  9 Dec 2021 17:28:05 +0530
Message-Id: <eb08636b42e3bd8670ec7eaae1cbb4d80bb1ccea.1639050979.git.viresh.kumar@linaro.org>
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
V2-> Don't undef the macros for _GNU_SOURCE.

 lib/internal.h    |  1 +
 lib/musl-compat.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
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
index 000000000000..2c5ff1e6a6dc
--- /dev/null
+++ b/lib/musl-compat.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
+
+#ifndef __LIBGPIOD_MUSL_COMPAT_H__
+#define __LIBGPIOD_MUSL_COMPAT_H__
+
+#ifndef _GNU_SOURCE
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
+#endif
+
+#endif /* __LIBGPIOD_MUSL_COMPAT_H__ */
-- 
2.31.1.272.g89b43f80a514

