Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E724DA7AE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 03:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349951AbiCPCGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 22:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiCPCGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 22:06:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788ED5E743
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:17 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id e3so985487pjm.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c88olSaYzoI6pzyS5wd13kl2WHwAbWnHPzt2pvEh670=;
        b=d3OdnY1ZE6nXDPq60CO8lcbDE03RZ/COsbG98AcedVcbGzNUi8sSSntCL4RTrWtbc2
         IFNeJV6MLs0dDzz9Xqz6/8vKm9b8vrssmpbp9yK4jw/oh5T/jegY9RYDH90e3WqHyDpz
         E9ziEHC54idBZgkEXUi7SsKjCSU4ZdplknvFFP71DKxYTlfrQ0QlxBrp661CGIrCVS6a
         84aOp9r4x8FH8btKnWHrqdIvXXk56lluYY95pAIFQPpB0irXQkU6ezYpjohmoZBc0s/g
         ZAMrMQYyrLTYEsgDYPDHV6QhX/zrxNTqexrH5RSEMDCmQ3GHmQxmGPqjJwI4Ijab0gZ6
         n/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c88olSaYzoI6pzyS5wd13kl2WHwAbWnHPzt2pvEh670=;
        b=KmlX4sqzPJ7j6h9cscTiAyrTz3J7EFT1Sm5OzuljaeiG1baanjIZv24GugvcFnQj6b
         6iVKbp1vqFM2QKixcTfHaCncGAwe5yen0TLRzMpPCrUYQ6lKazjqL1eCdsNR4EIcbTjW
         unphbMAgi07nBZq+eI4Bq1BSp/bXX/7wMYtALtYXwbtBojJjnX9tpl/kgVsTD/g/Oej+
         ZsRv5+fbjwJy9NH/hgEVbGqswoclxI/BfGhsz1iBncgGano6FflHXYQxQeMxELyJIrKC
         Q6BE0vta2G+QDEIpCvNgJ59S1J6pgVNJRSrFP7Pp52hMfKq7kDb63TYlLQeHJMAyFWwt
         fX4Q==
X-Gm-Message-State: AOAM530vIZktCW23/0nshMhNsljKH2VO3e9o8IOH/32iJ8mB1p+WV8ST
        R69ODgTVYGRs6PrutQgRAUAOSvso2T3Odw==
X-Google-Smtp-Source: ABdhPJw5PL6XL8jD4j0RMlWisjhi3kdOKEEZ3rfZCfTa/47AaJTBbfcxBtFnB537mMoOMd2qAmIZIw==
X-Received: by 2002:a17:903:124a:b0:151:8174:8cff with SMTP id u10-20020a170903124a00b0015181748cffmr30977575plh.38.1647396316517;
        Tue, 15 Mar 2022 19:05:16 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm436885pfk.179.2022.03.15.19.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 19:05:16 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 2/3] core: use num_values rather than num_lines when dealing with subsets of values
Date:   Wed, 16 Mar 2022 10:04:40 +0800
Message-Id: <20220316020441.30001-3-warthog618@gmail.com>
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

To be consistent with other usage, when getting or setting a subset of
requested line values, the array sizes should be named after the values
being accessed, not "lines" as that could be confused with the number of
lines in the request, not the subset.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h    | 14 +++++++-------
 lib/line-request.c | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 1f90be5..eaf6334 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1226,16 +1226,16 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
 /**
  * @brief Get the values of a subset of requested lines.
  * @param request GPIO line request.
- * @param num_lines Number of lines for which to read values.
+ * @param num_values Number of lines for which to read values.
  * @param offsets Array of offsets identifying the subset of requested lines
  *		  from which to read values.
  * @param values Array in which the values will be stored.  Must be sized
- *		 to hold \p num_lines entries.  Each value is associated with the
+ *		 to hold \p num_values entries.  Each value is associated with the
  *		 line identified by the corresponding entry in \p offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
-					 size_t num_lines,
+					 size_t num_values,
 					 const unsigned int *offsets,
 					 int *values);
 
@@ -1265,17 +1265,17 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
 /**
  * @brief Set the values of a subset of requested lines.
  * @param request GPIO line request.
- * @param num_lines Number of lines for which to set values.
+ * @param num_values Number of lines for which to set values.
  * @param offsets Array of offsets, containing the number of entries specified
- *		  by \p num_lines, identifying the requested lines for
+ *		  by \p num_values, identifying the requested lines for
  *		  which to set values.
  * @param values Array of values to set, containing the number of entries
- *		 specified by \p num_lines.  Each value is associated with the
+ *		 specified by \p num_values.  Each value is associated with the
  *		 line identified by the corresponding entry in \p offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
-					 size_t num_lines,
+					 size_t num_values,
 					 const unsigned int *offsets,
 					 const int *values);
 
diff --git a/lib/line-request.c b/lib/line-request.c
index 51b4ac1..31e82f8 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -85,7 +85,7 @@ static int offset_to_bit(struct gpiod_line_request *request,
 
 GPIOD_API int
 gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
-				     size_t num_lines,
+				     size_t num_values,
 				     const unsigned int *offsets, int *values)
 {
 	struct gpio_v2_line_values buf;
@@ -95,7 +95,7 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 
 	buf.bits = 0;
 
-	for (i = 0; i < num_lines; i++) {
+	for (i = 0; i < num_values; i++) {
 		bit = offset_to_bit(request, offsets[i]);
 		if (bit < 0) {
 			errno = EINVAL;
@@ -112,9 +112,9 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 		return -1;
 
 	bits = buf.bits;
-	memset(values, 0, sizeof(*values) * num_lines);
+	memset(values, 0, sizeof(*values) * num_values);
 
-	for (i = 0; i < num_lines; i++) {
+	for (i = 0; i < num_values; i++) {
 		bit = offset_to_bit(request, offsets[i]);
 		values[i] = gpiod_line_mask_test_bit(&bits, bit) ? 1 : 0;
 	}
@@ -138,7 +138,7 @@ GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
 
 GPIOD_API int
 gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
-				     size_t num_lines,
+				     size_t num_values,
 				     const unsigned int *offsets,
 				     const int *values)
 {
@@ -147,7 +147,7 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 	size_t i;
 	int bit;
 
-	for (i = 0; i < num_lines; i++) {
+	for (i = 0; i < num_values; i++) {
 		bit = offset_to_bit(request, offsets[i]);
 		if (bit < 0) {
 			errno = EINVAL;
-- 
2.35.1

