Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9352766A55D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjAMVwW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjAMVwU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:20 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83111892EC
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:19 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso13157488wms.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRf2SFNNUkAMCj4FMHJWyVLMOnnDr1hVEaTrQOcK0nU=;
        b=UEP2lxy5YcwaP4ijTBG7ZiJkemlP+O4YiyjwFzSC6u5uIFdxXhCwBbKVcNdK9ZJd9y
         eTJAfykZCcjtDuB+QsfrbuPbWh4BOerAjJXXqMYMddlGcNs1kfTHIDip02rFyVrF4O++
         UJnJq0TnfIIwO5r+1ihpG3sLzEn/oubSQUa1PHnR3WKO+y6KgL0H+GnRbBnpi07dsoO+
         AWdZln88UbCWsui9eKzNU8UKF9+sZqLjDT2cB8t7JhWs+8K2VGWIAmeRSW7Gn9Yb4cV5
         kzjE64k/OEYsNxvFlsiEKTEsN7GkHibNflZS+kIwoN5N7qr/w7pvFlpmVolMalay+5nL
         PyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRf2SFNNUkAMCj4FMHJWyVLMOnnDr1hVEaTrQOcK0nU=;
        b=N03EHxmuJx4JBDAgQRMrX76Syl8kPTE0nYmEGasJHA4sgz95S0CiWbGrpmxJijRNBL
         WvZD21jU/epW4piYobxGqUGc2OosbsNXQrq+U3/NdD4RqxNQ+abPQXE50BSfIb7g6NkY
         XZiyYnQrEhD9Y8YAgt5ZzcKpzF0sPP5Zf60+HXmRqO9HeszkOKc8DSdPU99Db9T1s+sm
         dQrG54VF8C3/x73L0nj8xqBUiUgNAB4nnHdOOz/SWFOBxM/0qAsgBuN29MIEE4whgqnp
         2AD7YKUsE1/tY7jsjw6Hnhyif76asw/0g4/MxmXWrWApxR9/+G6+02CtPwrwPV6ot7JR
         rhxw==
X-Gm-Message-State: AFqh2koHJUzY6bqC/csYo7z+Veq+Wsucpj2xsVLyVSZZExVv5RcExCyX
        p3gaHVFCg9fD8pldTT/dBcDQ6w==
X-Google-Smtp-Source: AMrXdXuxrMdWUl7b7LtnT4dBtPH+HWdlRpqPW+ZnAL3m0MXd8Czm0nWeBHmx1nzU+xeJ5vZsDD5w7w==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id n19-20020a05600c3b9300b003d343ae4d10mr62444123wms.11.1673646738035;
        Fri, 13 Jan 2023 13:52:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 02/16] tests: avoid shadowing local variables with common names in macros
Date:   Fri, 13 Jan 2023 22:51:56 +0100
Message-Id: <20230113215210.616812-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name 'ret' if very common for local variables so change it to _ret
in test helper macros to avoid potential shadowing.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiod-test-helpers.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index 2d86345..b40b820 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -118,11 +118,11 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 #define gpiod_test_line_config_add_line_settings_or_fail(_line_cfg, _offsets, \
 						_num_offsets, _settings) \
 	do { \
-		gint ret = gpiod_line_config_add_line_settings(_line_cfg, \
-							       _offsets,  \
-							       _num_offsets, \
-							       _settings); \
-		g_assert_cmpint(ret, ==, 0); \
+		gint _ret = gpiod_line_config_add_line_settings(_line_cfg, \
+								_offsets,  \
+								_num_offsets, \
+								_settings); \
+		g_assert_cmpint(_ret, ==, 0); \
 		gpiod_test_return_if_failed(); \
 	} while (0)
 
@@ -147,9 +147,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 
 #define gpiod_test_reconfigure_lines_or_fail(_request, _line_cfg) \
 	do { \
-		gint ret = gpiod_line_request_reconfigure_lines(_request, \
-								_line_cfg); \
-		g_assert_cmpint(ret, ==, 0); \
+		gint _ret = gpiod_line_request_reconfigure_lines(_request, \
+								 _line_cfg); \
+		g_assert_cmpint(_ret, ==, 0); \
 		gpiod_test_return_if_failed(); \
 	} while (0)
 
-- 
2.37.2

