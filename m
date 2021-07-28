Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305E03D99B3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 01:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbhG1XqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 19:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbhG1XqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 19:46:14 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC8AC061757
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 16:46:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gs8so7280138ejc.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 16:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FufiaCVq0zn40Kq0fH9HFpSQRrBgdKIIUdPREtXG/JU=;
        b=Dc+Sou1FhxOAHF9ITdHgoa6woJh2TsAowa4i7v45fEOIwpgZtmsx8gy22mWWKVrrn0
         S1MiFq+Chwu7dCU1oBtD6BXIALuV7G1huKPZYT3Kh3rlOQARh2WXR96FFPN32qo/H2Pv
         5erm84Naf7mZZNLR7H9czcLKarWUpGu/rriKIlnQQGiBXCqC9DE87E34AI7FSx1udzAC
         DRjcKDaYsgqi0ylS2T9Zxj9fFbaJ2szWAQ6MDzFeHHIw6qqAlvRgHw7sKVCPiOsiUuWW
         3pJgsmxfIJNGIYimV/jnWL8pIoSWVphOC8rldU6APFOUkv0XANEqqTw2T825ujConolP
         jVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FufiaCVq0zn40Kq0fH9HFpSQRrBgdKIIUdPREtXG/JU=;
        b=UddPwGTDPe8+/7VmXgajSnLYp5Qnj/kVmPipK2r2jNI2pvrOo9R0i1Egyr03LVJGfR
         GxbTM/XSkMT96j20Q9Cb9ejFeNQyA0GfyjKHQQSW/+lMopVmxIFZHDU0ZaNEPcuPbjWI
         n+D/TSsDt1AOfTJo0GPvP3HcU9J5Lm+bdan2ycLCEZH+vSU/6Leq8qCwq0noQzpGTZ59
         q8GuP3P/DboYvSElT8JXpCiQRriJDIjQ5FmJt+3jfVjwhMBUoUMACrFXCjSm6wil6eNa
         YvFLutFvdyg+0zaKJrUHq1QnkIbGvzz7eVNCeSU8jr7q6x5YA65ynfExRLccWwfcd/52
         zRbA==
X-Gm-Message-State: AOAM533HZaKDlZwuMh8n0MDKaDDbBRf1X1SGVdUX5hGBvWzSZhuket36
        Dw3jIANlUb6j+qnLFrpX74jV5uSULjmwrA==
X-Google-Smtp-Source: ABdhPJzFoai2XYHHXZLsFkyeKhF6uTjx3mdBKjelgjJFxxrnGZxjZgVbCP0X64iMyra/54rimDzRig==
X-Received: by 2002:a17:906:7009:: with SMTP id n9mr1913114ejj.66.1627515969993;
        Wed, 28 Jul 2021 16:46:09 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id c6sm348307eje.105.2021.07.28.16.46.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 16:46:09 -0700 (PDT)
Date:   Thu, 29 Jul 2021 01:46:08 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod-v2] gpioinfo: Show edge detection and debounce
 period if enabled
Message-ID: <20210728234607.GC14442@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpioinfo shows most settings for each GPIO line, but currently misses
edge detection and debouncing.

* If edge detection is enabled, report it as an additional flag
* If debouncing is enabled, report the duration

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 tools/gpioinfo.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index cd2b9e4..ed0018c 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -44,6 +44,21 @@ static bool line_drive_is_open_source(struct gpiod_line_info *info)
 	return gpiod_line_info_get_drive(info) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
 }
 
+static bool edge_detection_is_rising(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_RISING;
+}
+
+static bool edge_detection_is_falling(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_FALLING;
+}
+
+static bool edge_detection_is_both(struct gpiod_line_info *info)
+{
+	return gpiod_line_info_get_edge_detection(info) == GPIOD_LINE_EDGE_BOTH;
+}
+
 static const struct flag flags[] = {
 	{
 		.name = "used",
@@ -69,6 +84,18 @@ static const struct flag flags[] = {
 		.name = "bias-disabled",
 		.is_set = line_bias_is_disabled,
 	},
+	{
+		.name = "edge-rising",
+		.is_set = edge_detection_is_rising,
+	},
+	{
+		.name = "edge-failling",
+		.is_set = edge_detection_is_falling,
+	},
+	{
+		.name = "edge-both",
+		.is_set = edge_detection_is_both,
+	},
 };
 
 static const struct option longopts[] = {
@@ -129,6 +156,7 @@ static void list_lines(struct gpiod_chip *chip)
 	const char *name, *consumer;
 	unsigned int i, offset;
 	int direction;
+	unsigned long debounce_period;
 
 	printf("%s - %u lines:\n",
 	       gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
@@ -142,6 +170,8 @@ static void list_lines(struct gpiod_chip *chip)
 		consumer = gpiod_line_info_get_consumer(info);
 		direction = gpiod_line_info_get_direction(info);
 		active_low = gpiod_line_info_is_active_low(info);
+		debounce_period = gpiod_line_info_is_debounced(info) ?
+			gpiod_line_info_get_debounce_period(info) : 0;
 
 		of = false;
 
@@ -166,6 +196,9 @@ static void list_lines(struct gpiod_chip *chip)
 		prinfo(&of, 13, "%s ",
 		       active_low ? "active-low" : "active-high");
 
+		if (debounce_period)
+			printf("debounce=%lu ", debounce_period);
+
 		flag_printed = false;
 		for (i = 0; i < ARRAY_SIZE(flags); i++) {
 			if (flags[i].is_set(info)) {
-- 
2.20.1
