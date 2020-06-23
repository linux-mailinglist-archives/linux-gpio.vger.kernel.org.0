Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206FF204848
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732209AbgFWECw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:50 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E790C061573;
        Mon, 22 Jun 2020 21:02:49 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h10so9249278pgq.10;
        Mon, 22 Jun 2020 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MfouCEs1LOWMhDErPLn+ngDncUA2/8fktpuV5CRQ+/c=;
        b=Oyjbfo87mbdkE6JeBSm4Zt6EMW36Mal81fcDWvvpAQOI4DGAekO0/jjwti/A3QUav+
         7g6lcHMLvHp5fPiQ6lp4K94Wo04Itznv4BbBLgLUhnppa2WbCR51sMpH4QLvPPkDg8Qa
         bMLa0lQPqWJKJcaL/R6w0bNE+KuG95xIOXV2rhCTuQn0I6gpPfSj9gT4k7eqrWEoWHsY
         3BJ5h4aUEY6W3u4cB79a/45mMRgWgE1fCZcc3aCShv3YckA+ZVNs0R0lWkpklmvur8TR
         IFfecggy5C9hPOoBMzNsz5pxN1mt1B69VjQYOrWyDQSl6qZ8wGR6b5VQYk41bIcZtRW8
         4IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MfouCEs1LOWMhDErPLn+ngDncUA2/8fktpuV5CRQ+/c=;
        b=HBqXVY1x/y4sZSmU/P3gcsjmB3NgdTc2VqcFWFyNkL44TEf0ZdSRF9vteSk6NlRPWl
         XPy6Tzj79Y5LYbCRADvDapCAHooqx1unqi79QBl77ev4kUR07GnrVnXZN9CILZxe5lb6
         tEKRcRxu5SylipXdVAMSbcZ3gGaXAA/poFSSf3cb/UacTOGd24ZoxMpCGvhEoZEMotOO
         YC3prxHH/nV7VbftKScgN1u2zmP/PIU1zMtdrm/Ox0aro6278EOvX/sNwIwR/+jCKnbo
         a8pAZeZmxLg0P+Vo9tB/2rZ+Uj0vYjT0GFBAr3Z2NvsC8qX7+CF1ZVU1syPHkYvQA5D5
         p/2w==
X-Gm-Message-State: AOAM532HrJTq3J28K5MkpCtnnQaQHUbJ1ypSRybL0VSsojYeH2IbaqY2
        kIhLprMZIxxJMAYG4Jri4/oSbz8sUeI=
X-Google-Smtp-Source: ABdhPJxhvW+PNLHInG8dEj87bQjI+lEM5nSRKXr9ikY59c8n68hOwWU2T6yFVEPCc9CVFnQbYK8/1g==
X-Received: by 2002:a63:d0e:: with SMTP id c14mr15690364pgl.206.1592884968619;
        Mon, 22 Jun 2020 21:02:48 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:48 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 12/22] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
Date:   Tue, 23 Jun 2020 12:00:57 +0800
Message-Id: <20200623040107.22270-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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

This change is not terribly important for V1, but in adding V2 more
documentation for the usage of this value is appropriate.
As it is also used with V1 it warrants a separate patch.

 include/uapi/linux/gpio.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 0206383c0383..4e1139ab25bc 100644
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
2.27.0

