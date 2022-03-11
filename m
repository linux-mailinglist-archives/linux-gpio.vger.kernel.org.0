Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54694D5CA1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347253AbiCKHmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346564AbiCKHmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:42:09 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F751B7615
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:57 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t187so6838998pgb.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lD3lPUL3L5wZgzHfxV7zkrJ3wVLatrhq9Qk76pXVyXI=;
        b=oeaUB5bQ9Dr1mk9F6qb/SUXcJhOkbOgSh0ZpsGLmieoFrNatgX9qedPTpVPcfXCvA8
         eAnugwXtohHgSnfVKpAMzwm4lqkKzCi10qz5UzxFFS+qqvSRkbAMdHU5DPbjukE51qAb
         JnIK+mqhKYxf90nGsZd3H9TqxKUHHCC4I4eggIYeOhtmwP/RivnpasqjXNutL2DXbk73
         EfO+j5Y4t0p7GO97bO2ifaqOCC+pX4nzUvJ7TIS5LRjkxiasB0ikKCcwZ5xJz5+hWhED
         Yppdirrntfe9Ig/6YeypVWzo2qwdtuB+fbp9R8UUaYw1HoCVa/3b4VY6k+OP0Y4+IUYR
         4mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lD3lPUL3L5wZgzHfxV7zkrJ3wVLatrhq9Qk76pXVyXI=;
        b=VZ1JO01CxRULwGkAU6o03//2J5k+LVbsrAZo1LkFii0Zcjp9xLTf9fJZ2ORI1c6ZVs
         A7Z4pD2B4uf9Q0Jw/NhiwR2Wb2nINvr50A8Vv7fSUtsnWUoWxYjhDCpiE+L5xq/Z5lhO
         oNoTcT7VyYWjqss7F7M//cns7CrmRSbewehT2MFWsElosHlKK1w7+fyd0n/RY341ssTH
         Bm+ofMNnKE0cc6zzKoJ1KSQF/D9egrsbtvjK0CKdAnA9TYUnzqB6grzDWDXsw4KD3V6F
         KlEJs/TIg81jsY7gXzcJVqTzjWgZ/3aV/4IRzKnyIZUfpZs0DBFTtT+tX8/fBCBgVHkK
         bw3g==
X-Gm-Message-State: AOAM532nlZlsYjTHAJ2eGbOVKx7wajNb74jy7QpUYDzj75VZp4KZd8W0
        Hf/ssh1eN7Ny0qpbRgd7s4SFTJUBa/1cxw==
X-Google-Smtp-Source: ABdhPJykuyX9z92NwN3IiYQD68z7p+W+qp6I/WJ6S/zK0us86FOkVu5niVdnw59zJpeVja8MiroNjw==
X-Received: by 2002:a62:55c4:0:b0:4f6:b396:9caa with SMTP id j187-20020a6255c4000000b004f6b3969caamr8848739pfb.19.1646984456841;
        Thu, 10 Mar 2022 23:40:56 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:40:56 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 4/6] line-config: rename num_values to num_lines
Date:   Fri, 11 Mar 2022 15:39:24 +0800
Message-Id: <20220311073926.78636-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
References: <20220311073926.78636-1-warthog618@gmail.com>
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

Other functions, such as gpiod_line_request_set_values_subset()
use num_lines to indicate the size of the set, so change
num_values to num_lines in gpiod_line_config_set_output_values()
to be consistent.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h   | 4 ++--
 lib/line-config.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 8fb70ee..3f4bedd 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -935,13 +935,13 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 /**
  * @brief Override the output values for multiple offsets.
  * @param config Line config object.
- * @param num_values Number of offsets for which to override values.
+ * @param num_lines Number of lines for which to override values.
  * @param offsets Array of line offsets to override values for.
  * @param values Array of output values associated with the offsets passed in
  *               the previous argument.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-					 size_t num_values,
+					 size_t num_lines,
 					 const unsigned int *offsets,
 					 const int *values);
 
diff --git a/lib/line-config.c b/lib/line-config.c
index 31fc1b3..0361a32 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -671,13 +671,13 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 
 GPIOD_API void
 gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-				    size_t num_values,
+				    size_t num_lines,
 				    const unsigned int *offsets,
 				    const int *values)
 {
 	size_t i;
 
-	for (i = 0; i < num_values; i++)
+	for (i = 0; i < num_lines; i++)
 		gpiod_line_config_set_output_value_override(config,
 							    offsets[i],
 							    values[i]);
-- 
2.35.1

