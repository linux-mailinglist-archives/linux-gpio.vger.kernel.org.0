Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547EA54DEBF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 12:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiFPKPa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jun 2022 06:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiFPKNd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2022 06:13:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0DA313A1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 03:13:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u12so1845865eja.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=yEmii/VYdbmNW8vwjvzUxn++J0ns1klpMAkL64h6Ugo=;
        b=m7nNByzr3Ei8zaYNHETPvU9b366jgGxdxeIsDFyMFVZ+8lKq28zfDTlrsJ08ad/0WY
         OBFTOR+iCqvKJoOhkFFHk9HMmxyNSbfRequM/50xJFT2ZNOMoI7zLSKh0ERUxYlYodiR
         B+Dfts592xluMJoXLM4/aMgYPEMM9Qt57P1OSZNFFOXBjjHjX635I6qCgYysDKqsiMmT
         ng1pbttc9QyGdplzkK4ZWH9q5SKt0U2HW4WyvHrQcN881lVVE0aVNwXiGo21TcKjY6HS
         IZKaPNO9OGlW5FbWYTjfQAjs/WuVQiSM9L1mZv60H0VRMFB6fQ7b64USxyrOPo4bjKP5
         +E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yEmii/VYdbmNW8vwjvzUxn++J0ns1klpMAkL64h6Ugo=;
        b=WbGA9gA78k3odnvs0bIPtbKL0Ya3WrKlapvnLvKKniR4RTfSvlte9niWEhtclx4KYz
         tkeyxLx5IpppCG8P++QQIOheV1J2gwONkTBqKgmpnthXH1CuUlRjBDuvqx8vrVDlY6sM
         fAmAqBW2FiBJ94WL00mFRsJnURZret3BJoHckifSLNRwbPQY+Q41PaBEhqxMjYgzSFTj
         SpJ4f0Likk5LjMxeGTi6UzfdRMok+vpKaweS/ZlUNnXYFZ1xW2RaoW5UDAqW+3jYQ3VW
         riwyf6yTx77tEbslwqpZ16NFif0lc02G4F/u9rNu/qP8GkQ8873Clz67DESy+huPFOFo
         8iUw==
X-Gm-Message-State: AJIora925PNZ2NvEUZDjgHfjCtrERT3gf/ndyQDsTAEeB8n+SkzQLGSX
        19ORKKrXthP1wxyFtRi63jjTJxVTRtf9eA==
X-Google-Smtp-Source: AGRyM1vbN509fe2izdcQoPy1quegywHO3XF2XgOOZmADVn/PNZAJOhKxGcCUvKvygWc0WrCf5/4gYw==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr3819335ejc.64.1655374409629;
        Thu, 16 Jun 2022 03:13:29 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id kz24-20020a17090777d800b00715a02874acsm602431ejc.35.2022.06.16.03.13.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jun 2022 03:13:29 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-gpio@vger.kernel.org
Cc:     brgl@bgdev.pl, Yegor Yefremov <yegorslists@googlemail.com>
Subject: [libgpiod][PATCH v2] treewide: fix typos found with codespell
Date:   Thu, 16 Jun 2022 12:13:22 +0200
Message-Id: <20220616101322.3644-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes
  v1 - >2: apply codespell to the next/libgpiod-2.0 branch

 NEWS                                     | 6 +++---
 bindings/python/tests/gpiomockupmodule.c | 2 +-
 include/gpiod.h                          | 6 +++---
 lib/line-config.c                        | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/NEWS b/NEWS
index c843c3c..0e173f8 100644
--- a/NEWS
+++ b/NEWS
@@ -52,7 +52,7 @@ New features:
 
 Improvements:
 - constified function arguments where applicable in libgpiomockup
-- fixed the name of the test exeucutable displayed at build time
+- fixed the name of the test executable displayed at build time
 - improved the function pointer casting in Python bindings to avoid warnings
   emitted by GCC8
 - switched to using the KERNEL_VERSION() macro in tests instead of handcoded
@@ -65,7 +65,7 @@ Improvements:
   using it to set the pull of dummy lines
 - add several new test cases
 - improved Python example programs (made gpiomon's output similar to the
-  original tool, make gpioset wait for an ENTER pres by default)
+  original tool, make gpioset wait for an ENTER press by default)
 - fixed the major:minor number comparison between the device and sysfs
 - deprecated the gpiod_line_needs_update() function and removed the logic
   behind it from the library
@@ -233,7 +233,7 @@ Bug fixes:
   gpioget
 - fix a line test case: don't use open-drain or open-source flags for input
   mode
-- fix the flags passed to ar in order to supress a build warning
+- fix the flags passed to ar in order to suppress a build warning
 - set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
   can't be found
 - fix checking the kernel version in the test suite
diff --git a/bindings/python/tests/gpiomockupmodule.c b/bindings/python/tests/gpiomockupmodule.c
index 761d431..46737c2 100644
--- a/bindings/python/tests/gpiomockupmodule.c
+++ b/bindings/python/tests/gpiomockupmodule.c
@@ -61,7 +61,7 @@ static PyObject *gpiomockup_Mockup_probe(gpiomockup_MockupObject *self,
 		return NULL;
 	} else if (num_chips == 0) {
 		PyErr_SetString(PyExc_TypeError,
-				"Number of chips must be greater thatn 0");
+				"Number of chips must be greater than 0");
 		return NULL;
 	}
 
diff --git a/include/gpiod.h b/include/gpiod.h
index 5595ff2..75e5b39 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1076,7 +1076,7 @@ size_t gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
  * @brief Get the list of overridden offsets and the corresponding types of
  *	  overridden settings.
  * @param config Line config object.
- * @param offsets Array to store the overidden offsets. Must be sized to hold
+ * @param offsets Array to store the overridden offsets. Must be sized to hold
  *		  the number of unsigned integers returned by
  *		  ::gpiod_line_config_get_num_overrides.
  * @param props Array to store the types of overridden settings. Must be sized
@@ -1338,7 +1338,7 @@ int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
  * @return On success returns the number of events read from the file
  *	   descriptor, on failure return -1.
  * @note This function will block if no event was queued for the line request.
- * @note Any exising events in the buffer are overwritten.  This is not an
+ * @note Any existing events in the buffer are overwritten. This is not an
  *       append operation.
  */
 int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
@@ -1434,7 +1434,7 @@ unsigned long gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event);
  * @note If capacity equals 0, it will be set to a default value of 64. If
  *	 capacity is larger than 1024, it will be limited to 1024.
  * @note The user space buffer is independent of the kernel buffer
- *	 (::gpiod_request_config_set_event_buffer_size).  As the user space
+ *	 (::gpiod_request_config_set_event_buffer_size). As the user space
  *	 buffer is filled from the kernel buffer, there is no benefit making
  *	 the user space buffer larger than the kernel buffer.
  *	 The default kernel buffer size for each request is 16*num_lines.
diff --git a/lib/line-config.c b/lib/line-config.c
index 979b4c5..07db6a6 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -44,7 +44,7 @@ static const int override_flag_list[] = {
 
 /*
  * Config overriding the defaults for a single line offset. Only flagged
- * settings are actually overriden for a line.
+ * settings are actually overridden for a line.
  */
 struct override_config {
 	struct base_config base;
-- 
2.17.0

