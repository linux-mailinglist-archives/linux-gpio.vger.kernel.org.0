Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A86373DC7F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 12:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjFZKwB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 06:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjFZKv7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 06:51:59 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74218E6E
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:51:49 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fa9850bfd9so6395165e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687776708; x=1690368708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C7/K6UMPeVaKpc2goBpmmg0EXH2ya0lTsBtqVi0Iz4=;
        b=EyWp5pTsXcQ3RAKuVlxtDdUZaCb2z7h/iHFNEv3ZfNVsKS7JN8IYn/zPINcG+/S5Vt
         Fvl+p+7VTnD7EnA4CiTVnTyK/7vASQ6AJq3Ou476r9uxHbh6I6CskxksN5pjCJvw8n4t
         L3H5t7+do4s8gza231MYkTzM+BeEcgomugjcAqPtPtULaTeRmZu/J9QBcDGB8CeLNCK6
         9UO2BB7V40iEOvT7gVJh2K4d6W+3vYlF4LgY8r7inO9caS5pJ6zYPAxZbhj5tW887YqA
         FXVDsi20U4bu6H0D7+nj09I5dw2tdvlZEOkvsPD72ana8k+tsja41cHnptBTK5q54eys
         VF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687776708; x=1690368708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C7/K6UMPeVaKpc2goBpmmg0EXH2ya0lTsBtqVi0Iz4=;
        b=DYEg2Yeo5dqvNz5p+8tFUxTrJrmUHOQCg+3+GGo307wchhl1YnHTGED3FvGjTqIQrF
         86C6wQM8PMoqKCOe2KSv5Q/paxdzXcHV0qh9T/YmZLUC/XwCRMMlLzCyd8jz3CMTsGxx
         1qisWDxNTIl01HCFzwsxPnN4Ef1Bxjo8c2AUN0H02RIg4sCRN8diZaompAZKy0GpbpbQ
         ZJRF7kiFrlLTJ7XbqBcWTnbz+4JDorSXASyPegkSxOxSwvofyKUZhgBlNIrCY2vMj6JC
         cU6GUGAZNAlL8UpiO6z/aLhOxRNQjBFb8L0D5/N8SY1YUbvg9kksoRfL4qMFBFjhUGKU
         MVyA==
X-Gm-Message-State: AC+VfDzEf4khM74pYGaX1Sczn5+Yz//o/OY+f4fqB+eoGlUe3EMpReJO
        SSwqWM5LJOtgbGRgOhUyJ++kLg==
X-Google-Smtp-Source: ACHHUZ6za9tYr1T7x1BWm/keU55U5xRqJz+VPBVKx5Gr3IiCONro5T6X6jMD0gcapiLRy7G62azY1Q==
X-Received: by 2002:a7b:c4ca:0:b0:3fa:8028:3863 with SMTP id g10-20020a7bc4ca000000b003fa80283863mr4551551wmk.8.1687776707653;
        Mon, 26 Jun 2023 03:51:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:35b3:b235:7c12:5f36])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0030fb828511csm6948824wrz.100.2023.06.26.03.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 03:51:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] bindings: cxx: use () instead of (void) in line_settings::reset()
Date:   Mon, 26 Jun 2023 12:51:44 +0200
Message-Id: <20230626105144.242168-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626105144.242168-1-brgl@bgdev.pl>
References: <20230626105144.242168-1-brgl@bgdev.pl>
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

While () and (void) are synonymous in C++, we use () everywhere else so
fix the only exception. This DOES NOT change the ABI as the generated
symbol is the same (at least as verified on gcc and clang).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/line-settings.hpp | 2 +-
 bindings/cxx/line-settings.cpp          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
index b043167..bacf359 100644
--- a/bindings/cxx/gpiodcxx/line-settings.hpp
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -70,7 +70,7 @@ public:
 	 * @brief Reset the line settings to default values.
 	 * @return Reference to self.
 	 */
-	line_settings& reset(void) noexcept;
+	line_settings& reset() noexcept;
 
 	/**
 	 * @brief Set direction.
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 272a848..30d7899 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -179,7 +179,7 @@ GPIOD_CXX_API line_settings& line_settings::operator=(line_settings&& other)
 	return *this;
 }
 
-GPIOD_CXX_API line_settings& line_settings::reset(void) noexcept
+GPIOD_CXX_API line_settings& line_settings::reset() noexcept
 {
 	::gpiod_line_settings_reset(this->_m_priv->settings.get());
 
-- 
2.39.2

