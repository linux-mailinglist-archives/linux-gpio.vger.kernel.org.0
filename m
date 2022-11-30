Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED31463D5D3
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbiK3MnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234906AbiK3Mmv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:51 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAC125C5B
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:45 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id f18so4823878wrj.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weGqkWA9ZBLYNtzC4z0klFxDaB+1uLR2rJS1OFLA65M=;
        b=rIaNxBcVcmlrsZJNHAsyCAf5pYFk7L+yOW5LWbcYkCn3iKwRNT3fiWK5vmMtVPj9/C
         YXfJKeMDgAQE1zU0RuMqoEk4nWescYtEfBAih1gPE0WhxQMjLraUbX2bU3AFgTQ0UrvA
         jDlhu0IWM3ZTCIlNzONn/2HFzA3REtCtKRbafep7i1e9dulZtjZFf0/2OtLjlCw/AgPE
         iwN0x/eZp9Bp0DlY2WOXtyYdLZXhcXg9q+vOlIMMa4VQkzyLOdL2PF6NUjQM2v7PV5CC
         jCpEb0MLuPuEz21YOngDQM5VpGJ6vkmG8DLV24J1tS6tVVGSm33e6okNCiFOs5N0ikL9
         YE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weGqkWA9ZBLYNtzC4z0klFxDaB+1uLR2rJS1OFLA65M=;
        b=5JBy7tNOklzFl/R1c5oqoQQrgN9mElvKYwQFct4kGue9kOmwjcrdCellypFdLSP6MM
         JL65V3w1Z37cXUhfgd8zmsrbjr9hwvhPmRFvOhK0X83xpThu6vX79DjYeqRZj6rdBcmU
         LiAkxgeaMpcEketawxEuWiGhAKWiNRZnOz5zjlJPNw0Do6RIkS3q2NcGOwLUUN5Rep1+
         mbIzG9ty3RfX3wJBeYlLfj3JU7r8g0ZkYVQ6G8KTbt7P5hiPNUvJGtUVz84KgH2rriRN
         lSYcShNAsmZanngIJHjwcmQl5HrYINzdJQQnCB4xPa8vchxA6HUnpmij2E4huBuY7jDp
         BZCQ==
X-Gm-Message-State: ANoB5pkcoljEvubhe21jwqcz5lh6r/vGT54yArUoAzRTyK2FiTeQ19/f
        nGW3y+D+mi1JK0Sh0gprPlR0yQ==
X-Google-Smtp-Source: AA0mqf7izS41XH8nGzln6ePzLdXxwZeGfwHep+2twCrrohdel9rv2WVHIW9gyruHyufFenofVWH6cQ==
X-Received: by 2002:a05:6000:1702:b0:241:ffc4:dd1c with SMTP id n2-20020a056000170200b00241ffc4dd1cmr19403344wrc.538.1669812164236;
        Wed, 30 Nov 2022 04:42:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 10/11] bindings: python: fix the GPIOD_WITH_TESTS build flag
Date:   Wed, 30 Nov 2022 13:42:30 +0100
Message-Id: <20221130124231.1054001-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

Currently in order to disable test the variable needs to be explicitly
set to GPIOD_WITH_TESTS= in the environment or setup.py will crash.

Assume tests should not be built if the variable is not set at all.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/setup.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 2a8481c..c90d7d7 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -28,8 +28,7 @@ gpiosim_ext = Extension(
 )
 
 extensions = [gpiod_ext]
-with_tests = bool(environ["GPIOD_WITH_TESTS"])
-if with_tests:
+if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
 
 with open("gpiod/version.py", "r") as fd:
-- 
2.37.2

