Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0905072C90B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238092AbjFLO5D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237856AbjFLO5B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:57:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6324191
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:59 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30c2bd52f82so4395850f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686581818; x=1689173818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X+XArBw9XslkkI9g9PL4NuFJW02L20jew7XH3g8jZI=;
        b=L8I0IqqmA8xYTjE6EYg2W4m9Ywa69DJb9SzD/hFhrbXpr1tvJjP9Uh4QnT7AeDgNp6
         19NxKfOuIJXaNzD4OAvydhF1+t2pzQxoZrGRnCWMx0qAvpHkICPQExjtZBJkvUPVyAde
         8yiHXRfsLN/UYUlF5+aOrfBOfrZ/ybFRcaWw0OZKuO/QXr6QsxUfqZAb4nNcYROFknLb
         UTjHQl3GBaeaZuTbl8zMmNqZml3mZ4NcaRXkj1/qgcUf/kXN6YgVD0wvKJye3ia2GY6G
         5UX5SSpvY45CKQCdTzsXbRqvAKpQBGgwthAeSSi8EMRvGX7Hy3x4/RkB4rEDG4KgLkEc
         BPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581818; x=1689173818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X+XArBw9XslkkI9g9PL4NuFJW02L20jew7XH3g8jZI=;
        b=eRFLJNpg1mV8IozOvvBs17+CyHo0oWPDLb0HVdkLLiBwVPEWFXYfAi6ZVZRfGHTEKy
         ONvNsqElAAmGdZkaFX4ZIcwXgDAIF1IgmUaO8jVoPjhDbPni77i8Ga7X1ckBBNs8tb+g
         p3ew7pIefyalFxn+0XHC8z7fLebJ94cTGT4QiySEao+ZXIvNPGf3yJDB8ch0cgfEiG9k
         N3dJFrBvcCMw+t87uYRNv6Scq4x9seyLnZtdHR8Gq8AVES+eiOFA2Hr2KORRWSZxDzte
         o3xIXIK4Ez77ZDPgPTa6TAQ9e9bTWNJ0HZx1EgjVgP/wKtS1r8LFoSxSSUGKVhKWKmfI
         VzFA==
X-Gm-Message-State: AC+VfDwCGuH83UfpLgUZJxGI1n3z0mdafkWajpzJFLq+KEu+nCEUTPXL
        f9t/pPrxBHRrnPL6CRI6fQHrxw==
X-Google-Smtp-Source: ACHHUZ4J4CBhXh+UwPztvEyKYFklbY5t6+fKgviArwgdk2JB8jUHi9wMIo1QrOXaVHM38dSYR47WMA==
X-Received: by 2002:adf:e305:0:b0:30e:3d28:ba75 with SMTP id b5-20020adfe305000000b0030e3d28ba75mr4290030wrj.28.1686581818043;
        Mon, 12 Jun 2023 07:56:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d48c4000000b0030903d44dbcsm12653262wrs.33.2023.06.12.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 07:56:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] bindings: cxx: examples: fix potential glitch in gpiosetcxx
Date:   Mon, 12 Jun 2023 16:56:53 +0200
Message-Id: <20230612145653.138615-3-brgl@bgdev.pl>
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

gpiosetcxx requests lines without setting their output value, and so
sets them all inactive, and subsequently sets them to their requested
value. This can result in glitches on lines which were active and
are set active.

As this is example code, it is also important to demonstrate that the
output value can be set by the request itself.

Request the lines with the correct output values set in the request
itself.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/examples/gpiosetcxx.cpp | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index dde5379..f46cb85 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -44,10 +44,9 @@ int main(int argc, char **argv)
 			::gpiod::line_settings()
 				.set_direction(::gpiod::line::direction::OUTPUT)
 		)
+		.set_output_values(values)
 		.do_request();
 
-	request.set_values(values);
-
 	::std::cin.get();
 
 	return EXIT_SUCCESS;
-- 
2.39.2

