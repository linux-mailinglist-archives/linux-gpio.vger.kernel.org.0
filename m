Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4A54DA7AD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 03:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349556AbiCPCGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 22:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiCPCGW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 22:06:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC495E742
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:09 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id p17so638559plo.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shPogJ7f9IzUSYn9HOTijUz5bww6Va0UQ0xxdoTkiUc=;
        b=eeNKYx5Jl/FCDqHfdnWG91eUHhiZYOg5T5cZzdYc7ah/KikYTLgo1qfeySg3M5ImCA
         4ZKB9rYr6E6Y3U/ZAGEUkI274uoeqqobjHkO1q5JKvYJ/hQzy/kLFUUFwlrEnftnoImE
         i1dTvIS0giqDvHss+5YaE3ISA29dQ6VigI9R/pzfUSdJvqRgi/tx2Av3ge/vLxBohGBe
         baOOaWRC9XmMwSnFMn4mPEEKYb0M5+VdZLdnFPnOqrUFb/lCtrTt68pQKlVvPPLqyLKs
         WbiqLB9MXE6LQ/UX1bSWJqUZZh3f6yXWPaTUd2YtrLgRih147IZvMhUe76rcRKtNLPKi
         qabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=shPogJ7f9IzUSYn9HOTijUz5bww6Va0UQ0xxdoTkiUc=;
        b=pNmOW+sDg38WjEakWVY+36ohGP7ij5N5b7H+6ZgUsNouAyG4zRr0Ll7mu4q9d2FD1q
         KzzkGhZkHMSmaJaSVU7KJvdLPkL8DESjbLrdw98ww/31sO1dowqxFxAZ1isoWmAUhGY3
         GXE1yOiqMEmCnbxk4OFy+qVoBQofHjkxOLWWwV4Cy/Pa/s/uipmxKz4mCa/Gp26lZPbZ
         SsUTAIb6DrqKR8jzDILR8gDDVPyH0YyHGbX388aHrm1bJ5i7gwIhHkOYazxcSgxYQeyb
         sEAdQAmrmaUb+E3QNWqTXM7m0tQMQPuvWgPMs3PFjVcooFA5X2BUO7XYCp9ljl4KedNq
         b9mQ==
X-Gm-Message-State: AOAM531ybyC7k1cLVqwf6AdJl0V1yJ54uxBQ9EyDT4sBu4/vyerYooSA
        V9uHgQ73B7FvfkooeYn3wfuKOOfWLZRS7Q==
X-Google-Smtp-Source: ABdhPJyCPqRLVnvQKToPp4yh2MeHMIF1a/ggRS9R8ffcoViTNVghE+aGeGYtLy+ACdGRyBrcadvgeA==
X-Received: by 2002:a17:90a:5802:b0:1b8:b737:a62b with SMTP id h2-20020a17090a580200b001b8b737a62bmr7790877pji.123.1647396308463;
        Tue, 15 Mar 2022 19:05:08 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm436885pfk.179.2022.03.15.19.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 19:05:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 1/3] doc: API documentation tweaks corrections
Date:   Wed, 16 Mar 2022 10:04:39 +0800
Message-Id: <20220316020441.30001-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316020441.30001-1-warthog618@gmail.com>
References: <20220316020441.30001-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The corrections to the doc tweaks patch 6, allowing for the omission
of patches 2 and 4.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 883c327..1f90be5 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -731,7 +731,7 @@ int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
  *	   in a request.
  */
 int gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
-			       unsigned int offset);
+				      unsigned int offset);
 
 /**
  * @brief Set the default drive setting.
@@ -986,12 +986,13 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 					    unsigned int offset, int value);
 
 /**
- * @brief Override the output values for multiple offsets.
+ * @brief Override the output values for multiple lines.
  * @param config Line config object.
- * @param num_values Number of offsets for which to override values.
- * @param offsets Array of line offsets to override values for.
- * @param values Array of output values associated with the offsets passed in
- *               the previous argument.
+ * @param num_values Number of lines for which to override values.
+ * @param offsets Array of offsets identifying the lines for which to override
+ *		  values,  containing \p num_values entries.
+ * @param values Array of output values corresponding to the lines identified in
+ *		 \p offsets, also containing \p num_values entries.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 size_t num_values,
@@ -1125,18 +1126,18 @@ void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 				       const char *consumer);
 
 /**
- * @brief Get the consumer string.
+ * @brief Get the consumer name configured in the request config.
  * @param config Request config object.
- * @return Current consumer string stored in this request config.
+ * @return Consumer name stored in the request config.
  */
 const char *
 gpiod_request_config_get_consumer(struct gpiod_request_config *config);
 
 /**
- * @brief Set line offsets for this request.
+ * @brief Set the offsets of the lines to be requested.
  * @param config Request config object.
- * @param num_offsets Number of offsets.
- * @param offsets Array of line offsets.
+ * @param num_offsets Number of offsets to set.
+ * @param offsets Array of offsets, containing \p num_offsets entries.
  * @note If too many offsets were specified, the offsets above the limit
  *       accepted by the kernel (64 lines) are silently dropped.
  */
@@ -1153,29 +1154,31 @@ size_t
 gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
 
 /**
- * @brief Get the hardware offsets of lines in this request config.
+ * @brief Get the offsets of lines in the request config.
  * @param config Request config object.
- * @param offsets Array to store offsets. Must hold at least the number of
- *                lines returned by ::gpiod_request_config_get_num_offsets.
+ * @param offsets Array to store offsets. Must be sized to hold the number of
+ *		  lines returned by ::gpiod_request_config_get_num_offsets.
  */
 void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
 				      unsigned int *offsets);
 
 /**
- * @brief Set the size of the kernel event buffer.
+ * @brief Set the size of the kernel event buffer for the request.
  * @param config Request config object.
  * @param event_buffer_size New event buffer size.
  * @note The kernel may adjust the value if it's too high. If set to 0, the
  *       default value will be used.
+ * @note The kernel buffer is distinct from and independent of the user space
+ *	 buffer (::gpiod_edge_event_buffer_new).
  */
 void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   size_t event_buffer_size);
 
 /**
- * @brief Get the edge event buffer size from this request config.
+ * @brief Get the edge event buffer size for the request config.
  * @param config Request config object.
- * @return Current edge event buffer size setting.
+ * @return Edge event buffer size setting from the request config.
  */
 size_t
 gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
-- 
2.35.1

