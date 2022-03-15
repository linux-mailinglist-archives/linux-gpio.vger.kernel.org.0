Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048414D93E9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 06:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242505AbiCOFeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 01:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344882AbiCOFeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 01:34:15 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF9125F7
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:33:02 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a5so17864255pfv.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpu4nip1Oxgtdtlw5drYbar1aq+6hwtm+1CnkHAnzpw=;
        b=CBTwuAlojoiHI2rfWruJaV5HvpFzVwB47jPaGF5tF0Vvr17pTAwbEBGCWBlcrChq5K
         C1PkfocQnOQIIwd0tzYQmCwbCuCGLTaPQx2jYjps06O8dau1LDBKYt8+pmIWDqW15eDg
         yu0o6+J0RpCAfEQRICn1roozfC/C/3YYFUdCbsrt8NQibM+yqZwso6TipsrRnmAc/EzW
         yY2inQag16uVbOPw8YhmoWg3SjHjdXZFlbrxnpgApAjxQz0vcqKc4Ezmjy9vHYtUJfW6
         w4oMJhUWVmh1XHEtfQXN9CqPA0XHBJqm+HEjKmnT1+swPa1tC2pr/70/lUFNzS2W/QeS
         bgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpu4nip1Oxgtdtlw5drYbar1aq+6hwtm+1CnkHAnzpw=;
        b=c9vsgKlcSd0jfyY7rGjq7x4LzrS8Vc+aY1T3LT5WtB2SFHhc7LSLTlPMQUKD3VGB1S
         2IFhD93VLikZaxGXjXF5wrMm7gN8gyyKOhK7y4ssrni2MvopdmruM7ud06a7BKcm7C1f
         Z3ww1+zunEG9fdQm8r7D3CN71siVNZXM24E20QTUlzTWq1N42Jf1srpovc0wxjwdsN+6
         msjBODw5ppMXOX+DApfPnXAUYt7It4K7ywPFVXEO6Z5hMWcS/AJfojdLSfpnv/v/ir8+
         uXNhUiA3r1MzlZ62fqLzwKDiHmJGIixiLoiNeQ+quwnMLX1CQlMjEMKI8wligbRE08jr
         72rA==
X-Gm-Message-State: AOAM533hrqbbdxOMxL1Xogsh1SD5S7itUsvqRoZ6BNzcMaIkcwJsYgf2
        SsLkXaOEEIZYXnHRLp6fAei3SsV+XAICIQ==
X-Google-Smtp-Source: ABdhPJx1jHPKTrqKBZmnjNOdiRaaKFDAcD8TMfCOVbhDakbMv4QToajL65qe2W4VTNT3fetaFeDLLQ==
X-Received: by 2002:a63:4b1e:0:b0:365:8bc:6665 with SMTP id y30-20020a634b1e000000b0036508bc6665mr23227398pga.445.1647322379789;
        Mon, 14 Mar 2022 22:32:59 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f7ba8b445asm8840631pfv.65.2022.03.14.22.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 22:32:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 3/3] line-info: rename infobuf to uinfo
Date:   Tue, 15 Mar 2022 13:32:20 +0800
Message-Id: <20220315053220.102934-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315053220.102934-1-warthog618@gmail.com>
References: <20220315053220.102934-1-warthog618@gmail.com>
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

The infobuf variable in gpiod_line_info_from_kernel() refers to the
uAPI version of the info, and the "buf" suffix doesn't really
emphasise that, so rename it to uinfo.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/line-info.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/line-info.c b/lib/line-info.c
index fc656f9..168fc86 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -106,7 +106,7 @@ gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info)
 }
 
 struct gpiod_line_info *
-gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
+gpiod_line_info_from_kernel(struct gpio_v2_line_info *uinfo)
 {
 	struct gpio_v2_line_attribute *attr;
 	struct gpiod_line_info *info;
@@ -118,47 +118,47 @@ gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
 
 	memset(info, 0, sizeof(*info));
 
-	info->offset = infobuf->offset;
-	strncpy(info->name, infobuf->name, GPIO_MAX_NAME_SIZE);
+	info->offset = uinfo->offset;
+	strncpy(info->name, uinfo->name, GPIO_MAX_NAME_SIZE);
 
-	info->used = !!(infobuf->flags & GPIO_V2_LINE_FLAG_USED);
-	strncpy(info->consumer, infobuf->consumer, GPIO_MAX_NAME_SIZE);
+	info->used = !!(uinfo->flags & GPIO_V2_LINE_FLAG_USED);
+	strncpy(info->consumer, uinfo->consumer, GPIO_MAX_NAME_SIZE);
 
-	if (infobuf->flags & GPIO_V2_LINE_FLAG_OUTPUT)
+	if (uinfo->flags & GPIO_V2_LINE_FLAG_OUTPUT)
 		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;
 	else
 		info->direction = GPIOD_LINE_DIRECTION_INPUT;
 
-	if (infobuf->flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
+	if (uinfo->flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
 		info->active_low = true;
 
-	if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
+	if (uinfo->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
 		info->bias = GPIOD_LINE_BIAS_PULL_UP;
-	else if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
+	else if (uinfo->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
 		info->bias = GPIOD_LINE_BIAS_PULL_DOWN;
-	else if (infobuf->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+	else if (uinfo->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
 		info->bias = GPIOD_LINE_BIAS_DISABLED;
 	else
 		info->bias = GPIOD_LINE_BIAS_UNKNOWN;
 
-	if (infobuf->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
+	if (uinfo->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
 		info->drive = GPIOD_LINE_DRIVE_OPEN_DRAIN;
-	else if (infobuf->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
+	else if (uinfo->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
 		info->drive = GPIOD_LINE_DRIVE_OPEN_SOURCE;
 	else
 		info->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
 
-	if ((infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_RISING) &&
-	    (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING))
+	if ((uinfo->flags & GPIO_V2_LINE_FLAG_EDGE_RISING) &&
+	    (uinfo->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING))
 		info->edge = GPIOD_LINE_EDGE_BOTH;
-	else if (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+	else if (uinfo->flags & GPIO_V2_LINE_FLAG_EDGE_RISING)
 		info->edge = GPIOD_LINE_EDGE_RISING;
-	else if (infobuf->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
+	else if (uinfo->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
 		info->edge = GPIOD_LINE_EDGE_FALLING;
 	else
 		info->edge = GPIOD_LINE_EDGE_NONE;
 
-	if (infobuf->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME)
+	if (uinfo->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME)
 		info->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
 	else
 		info->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
@@ -167,8 +167,8 @@ gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
 	 * We assume that the kernel returns correct configuration and that no
 	 * attributes repeat.
 	 */
-	for (i = 0; i < infobuf->num_attrs; i++) {
-		attr = &infobuf->attrs[i];
+	for (i = 0; i < uinfo->num_attrs; i++) {
+		attr = &uinfo->attrs[i];
 
 		if (attr->id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) {
 			info->debounced = true;
-- 
2.35.1

