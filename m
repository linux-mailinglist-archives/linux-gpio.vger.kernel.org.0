Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D262F76BA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbhAOKbI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAOKbI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:08 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39805C061796
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id 6so1426836wri.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K978Q+Zz3j+Ep8/Uus6KKWiJCPCwFwBlfmjBNAegZK4=;
        b=mgq/yfCIhakUh1HCW53ByEHhTuyOYzm82GQOar6SR6MBu+l/0bPOeCrn1WjlMmLxHG
         5YWW9guCMfzQgpeiEF7znZmjx9QlBxgifGFNV2EroUZ7nXcw/idBEoBVsXO96CTeSyQD
         6zobPjaQAHCO1ex3mwbb9ZQ2H59TWZ6VM9BVWGJSJ5t0ROFgHxVp4hNINhh0VexmhCRS
         fhfh0xDft1PloTauk3rufzN+NN7I13mJrxzQshG9WldygCCFIOwAZs4nc0R3Jfco4xAD
         TJI5dTM1De5UcGuWLnooRPsXQrGEB2VE+hsxRXHHWeMeN9UmOyv4YoHH89kPm2Iwv8lS
         jMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K978Q+Zz3j+Ep8/Uus6KKWiJCPCwFwBlfmjBNAegZK4=;
        b=hndyAV3W89P0JmhvL8ztll4zPl3DyGP1w3zpq6EoTe8sIibNaFdvZr7cAE0C2SlYd7
         zHXfV7GvdbLRB67L8qjvevAr4cEu029/nDKFm8xPZK0F+O6cMDlQtExyBomM0h6Xpff3
         mo8wWPju2uf9gQbKZFKsvDDih0wAP1oAfinVY8p7vFVvUtqwRyrgLulgfiXsT4pG/Mri
         6uo5FPk7qLE/wmcG2mWRrd1Am0cwuaxeGplj0tQGpUygvDBKFlsWihny4iPFocDVLN2Q
         XfNy6f//FmpWfxfeuJK6YXh1/+jyueEuqo2tKa5t4DblHkMJBaudRYPxCW7BWn0N/V5D
         UlGA==
X-Gm-Message-State: AOAM531QCaRoxRhyf9+Sy+oN7EQd6F7voNpWjhonEazipmM86xZR5XRH
        RswRc+DD+sNkBhYAT2OiGHa8Pg==
X-Google-Smtp-Source: ABdhPJxgWt+W550rQHJf49832z522Ng86sW8dHx4I+QvzwlvN9SXuKkeeYkppvnJpXxMKwT2ONXFXA==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr12578160wrb.194.1610706625817;
        Fri, 15 Jan 2021 02:30:25 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 6/7] bindings: cxx: line: reorder bias mapping entries
Date:   Fri, 15 Jan 2021 11:30:17 +0100
Message-Id: <20210115103018.27704-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reorder the definitions so that they match the order in which they're
declared in the class. This is cosmetic only.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/line.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index df75c8c..bf4a3eb 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -20,10 +20,10 @@ const ::std::map<int, int> drive_mapping = {
 };
 
 const ::std::map<int, int> bias_mapping = {
+	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
+	{ GPIOD_LINE_BIAS_DISABLED,	line::BIAS_DISABLED, },
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
-	{ GPIOD_LINE_BIAS_DISABLED,	line::BIAS_DISABLED, },
-	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
 };
 
 } /* namespace */
-- 
2.29.1

