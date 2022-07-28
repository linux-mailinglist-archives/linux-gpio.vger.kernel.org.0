Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5283B58375D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 05:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbiG1DMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 23:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiG1DMt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 23:12:49 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79255C35F
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:12:44 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id o3so660765ple.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 20:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfiINRvqwol5e5vDERPOUvJj0CIlzOqenr299z9nHJg=;
        b=euGkHBdMgRaA4KENH+Om/NVqftFqASUkZI+pURJ7no/DISBDGj8vhgh/IHtnU65dHI
         I7JAxCx0fKAw4Wbi/PGf//WsIl39RusY9SFrd32W2x3sGiPo93iNPgKtMlFvk5KQ1Nzf
         SiC3PElTkcPCvBgXCxZg/C58aBTlZ/ixJbHqEt82GiZCKV9fZLIsuXld4sM/h5FOOivO
         pOahpOJyZEqyJuLISI5ozOJu6J5xD8m+uhEButR+Fp0lyuPl8rdP6bWni5I054MO3Xst
         9gAfFIXjfyLCxg9iW/s+jDr5lgTGEVfKxQT/RP6UIxEKQAcDTRPhTNNL5Kxi5bggfLd1
         POxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfiINRvqwol5e5vDERPOUvJj0CIlzOqenr299z9nHJg=;
        b=HW3c2N7Rd9Lbu9qcovPu4sHmvhv9dFYiHF5ETi8vyCJOWFOdQOHGQ0Fw+4OTjwI/pu
         56NMX6/j47pYJUug2unNDV6kE/d4Ku7ajIlXytiHn1pOHQQw6se00TJ/r7JpbU2iqZg3
         3X9mc7IvDhEJKdyGf92smwheMMCpQA7ihY4t5kIkG0KgiTSyKcWMk/1zUYllOtRhB/Di
         CwA9zgVNC4L/VSg6Zi5zRM8vP9J8Ih3YFrwZHdxeDQpENEX4n/KA7rgf4TGMIDSIn6pI
         lGzDYjR/S+suEONV0Bf3JTMWNuqPDUjQBxW7M3Vtggnb2aWcxtJs1XttZMLBmHNSWDHH
         x5Mw==
X-Gm-Message-State: AJIora/8rf8udwR8HGw6bRcf3gJdHnMqdranl0TWz/07+789hcBgmqqA
        rcmxYn3nTArweqLScCg0bd1GJRBvVz0=
X-Google-Smtp-Source: AGRyM1upy2f2WboHD9icKf+KkM+7tBfsAuHLZ/pDiF+Rp+WFROWbSaPckBZIICHXIWGifrnBJkfgDA==
X-Received: by 2002:a17:903:2308:b0:16c:58a3:638e with SMTP id d8-20020a170903230800b0016c58a3638emr24704855plh.100.1658977963690;
        Wed, 27 Jul 2022 20:12:43 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id j31-20020a63595f000000b0041b672e93c2sm261756pgm.17.2022.07.27.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:12:43 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH] core: more explicit pointer contracts
Date:   Thu, 28 Jul 2022 11:12:30 +0800
Message-Id: <20220728031230.16317-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

More explicitly define the contracts on returned pointers,
specifying both their validity and lifetimes.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
In some cases there is already a description of lifetimes at object
scope. This change makes it explicit at function scope in all cases.

 include/gpiod.h | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index cc24101..814d18a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -65,7 +65,8 @@ struct gpiod_edge_event_buffer;
 /**
  * @brief Open a chip by path.
  * @param path Path to the gpiochip device file.
- * @return GPIO chip request or NULL if an error occurred.
+ * @return GPIO chip object or NULL if an error occurred.  The returned object
+ *	   must be closed by the caller using ::gpiod_chip_close.
  */
 struct gpiod_chip *gpiod_chip_open(const char *path);
 
@@ -86,7 +87,9 @@ struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip);
 /**
  * @brief Get the path used to open the chip.
  * @param chip GPIO chip object.
- * @return Path to the file passed as argument to ::gpiod_chip_open.
+ * @return Path to the file passed as argument to ::gpiod_chip_open.  The
+ *	   returned pointer is valid for the lifetime of the chip object and
+ *	   must not be freed by the caller.
  */
 const char *gpiod_chip_get_path(struct gpiod_chip *chip);
 
@@ -208,14 +211,18 @@ void gpiod_chip_info_free(struct gpiod_chip_info *info);
 /**
  * @brief Get the name of the chip as represented in the kernel.
  * @param info GPIO chip info object.
- * @return Pointer to a human-readable string containing the chip name.
+ * @return Valid pointer to a human-readable string containing the chip name.
+ *	   The string lifetime is tied to the chip info object so the pointer
+ *	   must not be freed by the caller.
  */
 const char *gpiod_chip_info_get_name(struct gpiod_chip_info *info);
 
 /**
  * @brief Get the label of the chip as represented in the kernel.
  * @param info GPIO chip info object.
- * @return Pointer to a human-readable string containing the chip label.
+ * @return Valid pointer to a human-readable string containing the chip label.
+ *	   The string lifetime is tied to the chip info object so the pointer
+ *	   must not be freed by the caller.
  */
 const char *gpiod_chip_info_get_label(struct gpiod_chip_info *info);
 
@@ -362,8 +369,10 @@ unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info);
  * @brief Get the name of the line.
  * @param info GPIO line info object.
  * @return Name of the GPIO line as it is represented in the kernel.
- *	   This function returns a pointer to a null-terminated string
+ *	   This function returns a valid pointer to a null-terminated string
  *	   or NULL if the line is unnamed.
+ *	   The string lifetime is tied to the line info object so the pointer
+ *	   must not be freed.
  */
 const char *gpiod_line_info_get_name(struct gpiod_line_info *info);
 
@@ -383,8 +392,10 @@ bool gpiod_line_info_is_used(struct gpiod_line_info *info);
  * @brief Get the name of the consumer of the line.
  * @param info GPIO line info object.
  * @return Name of the GPIO consumer as it is represented in the kernel.
- *	   This function returns a pointer to a null-terminated string
+ *	   This function returns a valid pointer to a null-terminated string
  *	   or NULL if the consumer name is not set.
+ *	   The string lifetime is tied to the line info object so the pointer
+ *	   must not be freed.
  */
 const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info);
 
@@ -506,9 +517,9 @@ uint64_t gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event);
 /**
  * @brief Get the snapshot of line-info associated with the event.
  * @param event Line info event object.
- * @return Returns a pointer to the line-info object associated with the event
- *	   whose lifetime is tied to the event object. It must not be freed by
- *	   the caller.
+ * @return Returns a pointer to the line-info object associated with the event.
+ *	   The object lifetime is tied to the event object, so the pointer must
+ *	   be not be freed by the caller.
  */
 struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event);
@@ -558,7 +569,8 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
 
 /**
  * @brief Create a new line config object.
- * @return New line config object or NULL on error.
+ * @return New line config object or NULL on error.  The returned object must
+ *	   be freed by the caller using ::gpiod_line_config_free.
  */
 struct gpiod_line_config *gpiod_line_config_new(void);
 
@@ -1111,7 +1123,8 @@ gpiod_line_config_get_overrides(struct gpiod_line_config *config,
 
 /**
  * @brief Create a new request config object.
- * @return New request config object or NULL on error.
+ * @return New request config object or NULL on error.  The returned object must
+ *	   be freed by the caller using ::gpiod_request_config_free.
  */
 struct gpiod_request_config *gpiod_request_config_new(void);
 
@@ -1504,7 +1517,9 @@ bool gpiod_is_gpiochip_device(const char *path);
 
 /**
  * @brief Get the API version of the library as a human-readable string.
- * @return Human-readable string containing the library version.
+ * @return A valid pointer to a human-readable string containing the library
+ *	   version.  The pointer is valid for the lifetime of the program and
+ *	   must not be freed by the caller.
  */
 const char *gpiod_version_string(void);
 
-- 
2.37.1

