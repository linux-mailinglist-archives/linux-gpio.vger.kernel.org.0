Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA72C1BDC89
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgD2Mng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726426AbgD2Mnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:43:35 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B551C03C1AD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:43:35 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so1872517wmh.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tnR1B8VyMyVXV2WpzULwTu0hoKkRrNdfBDnYJYmJgAw=;
        b=x8PmZ4+IAlCdyAF2UxAxQQn2kwebhXdej2brfpQAyeKvox2XW7xe4K7YuEVj7pm4cQ
         D1wPR1nKVCG4j3daNdkU4KjN0d7Q7lflqBjA2rEMDbHdy9Lh+Tt8OfDBP8IcZAW84GMD
         G+XpOhlttV2voPxAz9LhpBk2yJoskrKKvDq/RmF85l7qsMHdEB1WcXf6CKw0qQRNacHT
         LZ6ZevSpv18CRswlhXQcLI9MGj3k27yFyU1DT6onfuqfyTwt91Y/sAMEqf1F6WOvQfA3
         d7gjdwq7CzL4/p9lNwT5GCN4psL27ehKZ9I2WSCjJkPqD1P4HEL/QkS/gw6sV8x3UluF
         y4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tnR1B8VyMyVXV2WpzULwTu0hoKkRrNdfBDnYJYmJgAw=;
        b=c4GUo3+kUM/oKdJr5+RqU1MPUb1Cr7BXo2hH+4eJ1ryJGWRpwamuo4kt380MCAqu+R
         FE23fcGEzoHW0gdJalLcY+JxYHuRtkogUw79BK2XdAp41Q0HxcXMQbJsf9gvG5YtQDxF
         M6sg2dF3dq5EI9Ai4PYbE+GfwWPdAXrBIKqKus0MqZwx6/Tkk+rttPBp6vFWFdecTsVu
         XsVKGtWlN5Vl0d1CAp6hm+o8uCWymbu2c0BPX4FAHbyRQoVuItLsFUZNzkZTk6gnewgH
         0hgh9SkQ48GA/ZK6bAvduRMY1iE/9GDUCeP8dSvH5IOqwfYnfiW1RM9s7RlmyXo0nRBe
         jAOg==
X-Gm-Message-State: AGi0PubKSBTUHSQizbFXVpIEuzbyTk/b25DpkXjDg2djBvNdEn0MLxwo
        DLS6kRH4xmZBvx3cZb+m1lDEyQ==
X-Google-Smtp-Source: APiQypKFSf2WMkm059bLT5a/8gxBGHpMksq/Vz3bGj/8cGzIcFti6nDyf2PxjPLNaAhu9JzlOFZGMg==
X-Received: by 2002:a1c:dc55:: with SMTP id t82mr3336070wmg.12.1588164213822;
        Wed, 29 Apr 2020 05:43:33 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id u12sm7865433wmu.25.2020.04.29.05.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 05:43:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH] gpioinfo: print bias flags if set
Date:   Wed, 29 Apr 2020 14:43:30 +0200
Message-Id: <20200429124330.15400-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When printing line information: check the bias configuration and include
the current value in the 'flags' column of output.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tools/gpioinfo.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 6f94b4e..67be379 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -21,6 +21,21 @@ struct flag {
 	is_set_func is_set;
 };
 
+static bool line_bias_is_pullup(struct gpiod_line *line)
+{
+	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_PULL_UP;
+}
+
+static bool line_bias_is_pulldown(struct gpiod_line *line)
+{
+	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_PULL_DOWN;
+}
+
+static bool line_bias_is_disabled(struct gpiod_line *line)
+{
+	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLE;
+}
+
 static const struct flag flags[] = {
 	{
 		.name = "used",
@@ -34,6 +49,18 @@ static const struct flag flags[] = {
 		.name = "open-source",
 		.is_set = gpiod_line_is_open_source,
 	},
+	{
+		.name = "pull-up",
+		.is_set = line_bias_is_pullup,
+	},
+	{
+		.name = "pull-down",
+		.is_set = line_bias_is_pulldown,
+	},
+	{
+		.name = "bias-disabled",
+		.is_set = line_bias_is_disabled,
+	},
 };
 
 static const struct option longopts[] = {
-- 
2.25.0

