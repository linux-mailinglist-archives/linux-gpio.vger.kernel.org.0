Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D3F254686
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgH0OML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgH0OLf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:11:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF846C06123E;
        Thu, 27 Aug 2020 07:01:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id v15so3432980pgh.6;
        Thu, 27 Aug 2020 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=X93zKjVYRnLK3psJe1vnn68ETkVRT4vIcLP2HBNDAktT48Qg1xuowyW6pTbBck/UjW
         jmjaNCONBHJmKyJFOC1d/v0PWCZOclDrul9x/y9FrpZKSNm3Iqgqtb//j2vbQCLfSdXe
         2jAew+Ar6MfKFLQaYIA8NHMVXYCi3BgXceXQ8lCdjkDHg1NHsdNyEUF7UMlY92Dymrum
         9ScW9HRWsbIVf+YUUe3mjl6H9ZVd41mE4yRhF+iRN0D89nJXYvt+pSHcBiD+aIRHwa52
         Dy4PX+1KUVGBn0mT0EiJUL3vzB/lxhCjzCqjfkLoGPXnDXl/UvxLg3W92upwWYyKPJz+
         IvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4z3c80rW1f77SHZ1DJfS7Y59f6hWqfux6WtIWEmMvU=;
        b=Jr0aNN6jQjrxMb0sJb8DMTuS5tQp3CzaGZvwAMhfmm0c+VVgiEXwMJIRxMSQ2s0WJY
         jT5H9nUnrIA53OmOFJXvo5ep3NCv7PFQHozioD0AZFHUuRhlbS0EoT6AoqXUZmpkq8yn
         F6hLdHS01PxJN6x9eynxEf3CNliIdLfhY1Dq3QxEl0UjIj994eIqZalmlWJ7cg3EHHCR
         DAxzRakO1oE5JWUWzyrvqS2RKOrXZJyaqF/lwZkBH97YMD5BbsMkdHrz67EVIHDKOHf9
         jnA9MGAuxjfMDAjAuskDcxDn6aNx5dhCpCn2iuubTLA+wrxn+HanZ0UH5aGTmswNsTWo
         G7bA==
X-Gm-Message-State: AOAM530JXFD7nN6MYOE9cOuIdpYZ1tMT2HPMzoLiWHmDiXLY9iUnPQmy
        NHX65/438L6NJHFhp1H+bUHwLV15LxM=
X-Google-Smtp-Source: ABdhPJwPnpQN034nDDdIUP2fdcgrGE+q4nVyC368/LyurQ/TC81WFM3bdjVMQ16PJTv3uR8TaMv7jA==
X-Received: by 2002:a17:902:8646:: with SMTP id y6mr16133410plt.19.1598536891908;
        Thu, 27 Aug 2020 07:01:31 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:01:31 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Thu, 27 Aug 2020 22:00:03 +0800
Message-Id: <20200827140020.159627-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace constant array sizes with a macro constant to clarify the source
of array sizes, provide a place to document any constraints on the size,
and to simplify array sizing in userspace if constructing structs
from their composite fields.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 9c27cecf406f..285cc10355b2 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -14,6 +14,11 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+/*
+ * The maximum size of name and label arrays.
+ */
+#define GPIO_MAX_NAME_SIZE 32
+
 /**
  * struct gpiochip_info - Information about a certain GPIO chip
  * @name: the Linux kernel name of this GPIO chip
@@ -22,8 +27,8 @@
  * @lines: number of GPIO lines on this chip
  */
 struct gpiochip_info {
-	char name[32];
-	char label[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 };
 
@@ -52,8 +57,8 @@ struct gpiochip_info {
 struct gpioline_info {
 	__u32 line_offset;
 	__u32 flags;
-	char name[32];
-	char consumer[32];
+	char name[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE];
 };
 
 /* Maximum number of requested handles */
@@ -123,7 +128,7 @@ struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
 	__u32 flags;
 	__u8 default_values[GPIOHANDLES_MAX];
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	__u32 lines;
 	int fd;
 };
@@ -182,7 +187,7 @@ struct gpioevent_request {
 	__u32 lineoffset;
 	__u32 handleflags;
 	__u32 eventflags;
-	char consumer_label[32];
+	char consumer_label[GPIO_MAX_NAME_SIZE];
 	int fd;
 };
 
-- 
2.28.0

