Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DDE72C90A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234490AbjFLO5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238261AbjFLO5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:57:00 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE4F9
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30fbf253dc7so1008468f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686581817; x=1689173817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ninga9ecMn+VDcwzn0SeAdQV7fJ/3Wgutxyf25y6EeE=;
        b=UouTjDq2MsepMSBaw7wM0jnYHchLANtvfjXG6iAiNHrI3kfR9QIod9yyHsrd9DEvHj
         ZFXSTg5/iMG2meimJvfRkUorcuFqJh1MupaFvZU0t8pX5D2WLcf7GWqp5jBNFJeKK/Ap
         /ErbfW9bcnHJUW0saYqityqt+gpubSb6Mw+PFu6PkNd5Vz4BD05Mi6jcjwn/U4CfELrC
         EpTJDygWjJj2rGLiKQXEo77pxLaKib4O6hKXBElD5eODuJyfgCPi62Mu6oshr/Q+YlFt
         73OY0jyxU8g4yT6sjX9goG9BooF0ZPIX0754AbNdIyzbhdtqFCHiGSBAVlnQs9YYqmik
         LBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581817; x=1689173817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ninga9ecMn+VDcwzn0SeAdQV7fJ/3Wgutxyf25y6EeE=;
        b=hRNcbjryV4B99WcrpiisdgDy17zVPvz6bI7LluqWUSy8wqCenfJzaQlUpxZqU70WdW
         cqrAjP2qFveXjYQY42SpEe83OYsOnm/HcUQMna5aL3g8UwJobGGgDqbqxKhzekUu1y2s
         b7zeYS0HyaoxOZNlxhGHtOnTb9ElLi+74965HR5oZ7EVy8i4e7D3W+a30prFdWnbt9rb
         2WzCA4JmQFZPuwxx2Xiyk0wl8Fr1MWs/VAXNg4qGu7qmYEhl4MfrDdolLUaE2zO+Qchv
         myWgfU3tACjzeAhkEJiYdFXwD2JiDReoAoNG8GsX6Yf8helEQjsQSaIfQRKfoyghHCdg
         ENjw==
X-Gm-Message-State: AC+VfDwjMVGRSehfGM2PvssjyUDEqETjlqsiGBl1BeWoI94R+v3mRS1s
        /6u5SIVru22QJJxl9h1Fz36jIg==
X-Google-Smtp-Source: ACHHUZ4Ne4Oa9O/4/mtRFkM+QTQXQHp6N/gfYzcYl9KFyiTloVSfuXTUchBDNOQBdpbHUrSzHlzQ5w==
X-Received: by 2002:a5d:5265:0:b0:30f:b0de:f100 with SMTP id l5-20020a5d5265000000b0030fb0def100mr5488682wrc.23.1686581817038;
        Mon, 12 Jun 2023 07:56:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d48c4000000b0030903d44dbcsm12653262wrs.33.2023.06.12.07.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 07:56:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 1/2] bindings: cxx: provide request_builder::set_output_values()
Date:   Mon, 12 Jun 2023 16:56:52 +0200
Message-Id: <20230612145653.138615-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612145653.138615-1-brgl@bgdev.pl>
References: <20230612145653.138615-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement a new method in the request_builder class that allows to set
output values at request-time by calling the set_output_values() method
of the internal line_config object.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/request-builder.hpp | 8 ++++++++
 bindings/cxx/request-builder.cpp          | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/bindings/cxx/gpiodcxx/request-builder.hpp b/bindings/cxx/gpiodcxx/request-builder.hpp
index 3216216..90cc8f0 100644
--- a/bindings/cxx/gpiodcxx/request-builder.hpp
+++ b/bindings/cxx/gpiodcxx/request-builder.hpp
@@ -114,6 +114,14 @@ public:
 	 */
 	request_builder& add_line_settings(const line::offsets& offsets, const line_settings& settings);
 
+	/**
+	 * @brief Set output values for a number of lines in the line config
+	 *        stored by this object.
+	 * @param values Buffer containing the output values.
+	 * @return Reference to self.
+	 */
+	request_builder& set_output_values(const line::values& values);
+
 	/**
 	 * @brief Make the line request.
 	 * @return New line_request object.
diff --git a/bindings/cxx/request-builder.cpp b/bindings/cxx/request-builder.cpp
index 6a1a487..d11e47b 100644
--- a/bindings/cxx/request-builder.cpp
+++ b/bindings/cxx/request-builder.cpp
@@ -106,6 +106,14 @@ request_builder::add_line_settings(const line::offsets& offsets, const line_sett
 	return *this;
 }
 
+GPIOD_CXX_API request_builder&
+request_builder::set_output_values(const line::values& values)
+{
+	this->_m_priv->line_cfg.set_output_values(values);
+
+	return *this;
+}
+
 GPIOD_CXX_API line_request request_builder::do_request()
 {
 	line_request_ptr request(::gpiod_chip_request_lines(
-- 
2.39.2

