Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B5372915A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238915AbjFIHkL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239318AbjFIHkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:40:08 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E004518C
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:40:06 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-651f2f38634so1503600b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686296406; x=1688888406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBCdQYrpr47OLLHZj7Ukq4rq1bI3hy/qiWAm98qVBFI=;
        b=aT7WJc/qfox0M0WRsGlRn3BVhtEiTLPxYzSiqWFNiw7ML9XlZO9JzIAPd7DxnxUTOW
         PjqhvXa5asjK5pnALePg3wLrSkqLrtQduRbV/xhP+K2yz5UoqO5JYAkG06w31m0w/QS1
         vb1/glUTGEmnV6ea3QHI5Go/RBlX4i9hCa999Egf3Fe2YXVWWreY8C+5YJ3rA4VWz0nD
         6FBn7R1j7kOx0tQkl/rp+SZG70L1eFOpGIrXdFtfM0SYEbx3dg2vw/M9Y0QSz6qIVz8c
         afdP5vAn/V5sp5k1m6tUig8nS0yhlMePb9b6yrXjPzpxEzkKoefE3NteexNNgbbB+4C0
         Q7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296406; x=1688888406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBCdQYrpr47OLLHZj7Ukq4rq1bI3hy/qiWAm98qVBFI=;
        b=TPrNSL3Ss+w5L8FdGId1buDI1DTh8/BskUMxgR2Auaggjx4nt1HdF+PJK+Z2MvC1Yl
         3zrq7yxX4SX/2yq2tpy/Jbshz/lFw3rdwATzwwXfqz8WK8EPmUmce4vyQ/yhdxsagTbU
         BO7d/W4MC9P3/FfWCRV0Uo4H1lyb9BUDfuJl4xIH00DXISWW2Hz5jr7/+lW+4i1BJ9oJ
         w7FVHg0fuLs2PaAmsz2VobNvmc+NHY7Ljuho8vYgN66fHUztrFxW/JojW+rm+eHLgUM5
         3YCJQfXbhmXt7BWIZriG/OaERQ2LYSQ64I/eTcm0fNkb2WHkYp6OTOkdSIDQiico+sdj
         otCQ==
X-Gm-Message-State: AC+VfDxoyBpabuOBv5UvSJR+WI8xsSa6DAP1IyR4ztqtHCnM4x0CvfC8
        31GI0Je+S+4Mn0W4Rwgljdr0ym1sZu0=
X-Google-Smtp-Source: ACHHUZ7ntjYCjya7CJ585Y6/iJDLd751RwETcPxbs5hSEwXPj+fGNuIV/yZnLAmFiFURhZwmnCkqMw==
X-Received: by 2002:a05:6a21:6808:b0:118:b2e1:9adb with SMTP id wr8-20020a056a21680800b00118b2e19adbmr490665pzb.61.1686296406109;
        Fri, 09 Jun 2023 00:40:06 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id b123-20020a636781000000b0050f85ef50d1sm2348400pgc.26.2023.06.09.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 00:40:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] core: doc: add doc for opaque structs to link to the relevant page
Date:   Fri,  9 Jun 2023 15:39:57 +0800
Message-Id: <20230609073957.72418-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
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

The C doxygen documentation is difficult to navigate as the opaque types
do not get linked to anything.

Add doc for each opaque struct that references the relevant page.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

There might be a better way to do this, but this the best I've run
across so far.  At least the generated doc is navigable without having to
return to the modules page and perform mental gymnastics.

Along the way, also renamed the request_request group to line_request as
that makes more sense.

Haven't pushed this one to rtd yet, as this is a more significant
change - not just fixing a typo.

Cheers,
Kent.

 include/gpiod.h | 66 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index d1833de..d459151 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -44,15 +44,79 @@ extern "C" {
  * handling it, ignoring it or returning an error.
  */
 
+/**
+ * @struct gpiod_chip
+ * @{
+ *  Refer to @ref chips for functions that operate on gpiod_chip.
+ * @}
+*/
 struct gpiod_chip;
+/**
+ * @struct gpiod_chip_info
+ * @{
+ *  Refer to @ref chip_info for functions that operate on gpiod_chip_info.
+ * @}
+*/
 struct gpiod_chip_info;
+/**
+ * @struct gpiod_line_info
+ * @{
+ *  Refer to @ref line_info for functions that operate on gpiod_line_info.
+ * @}
+*/
 struct gpiod_line_info;
+/**
+ * @struct gpiod_line_settings
+ * @{
+ *  Refer to @ref line_settings for functions that operate on
+ *  gpiod_line_settings.
+ * @}
+*/
 struct gpiod_line_settings;
+/**
+ * @struct gpiod_line_config
+ * @{
+ *  Refer to  @ref line_config for functions that operate on gpiod_line_config.
+ * @}
+*/
 struct gpiod_line_config;
+/**
+ * @struct gpiod_request_config
+ * @{
+ *  Refer to  @ref request_config for functions that operate on
+ *  gpiod_request_config.
+ * @}
+*/
 struct gpiod_request_config;
+/**
+ * @struct gpiod_line_request
+ * @{
+ *  Refer to  @ref line_request for functions that operate on
+ *  gpiod_line_request.
+ * @}
+*/
 struct gpiod_line_request;
+/**
+ * @struct gpiod_info_event
+ * @{
+ *  Refer to  @ref line_watch for functions that operate on gpiod_info_event.
+ * @}
+*/
 struct gpiod_info_event;
+/**
+ * @struct gpiod_edge_event
+ * @{
+ *  Refer to  @ref edge_event for functions that operate on gpiod_edge_event.
+ * @}
+*/
 struct gpiod_edge_event;
+/**
+ * @struct gpiod_edge_event_buffer
+ * @{
+ *  Refer to  @ref edge_event for functions that operate on
+ *  gpiod_edge_event_buffer.
+ * @}
+*/
 struct gpiod_edge_event_buffer;
 
 /**
@@ -902,7 +966,7 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
 /**
  * @}
  *
- * @defgroup request_request Line request operations
+ * @defgroup line_request Line request operations
  * @{
  *
  * Functions allowing interactions with requested lines.
-- 
2.40.1

