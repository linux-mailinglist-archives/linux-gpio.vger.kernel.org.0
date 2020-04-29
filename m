Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30B31BD101
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 02:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgD2AYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 20:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgD2AYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 20:24:05 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F57C03C1AD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:24:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f8so163515plt.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sHtxZdT0wI1goo5Pdu5mOhzBJD4geRWltIkc91pB48=;
        b=SFyoKw5brVEtpGCyhtXkkCmAoKTge7h/OfRJ/dgPsd+wFkvgV9zBoAa5hmhgDH2m4c
         ml6QcgWYpZOPgzOi6QWV4bwPsiDP0E2AuQ6qsOHh18jxuzoEzIdmN6keeTpvrkvYJd41
         JY8hLdf9wvVPtAAn6Ki2W+j3BOuicznR97Mr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sHtxZdT0wI1goo5Pdu5mOhzBJD4geRWltIkc91pB48=;
        b=HBqjhvt8NPBbyoCKDndsLFljMCShF9JY5HYmfeWG/TeSIVaLP82uQjL9gNkJWoE5UT
         1Ltr/vqJISWoep8sf4tpe7i7kGnfbVsobXCYhM6p7Xq53CGGB2iPAenyIEzFZfRFeAhZ
         Pa7ia6daNHwmuMsR5emEf8/QLDB40kNVkhu3gaU0HEeK/xM9ApZtNLV6bO/udCJt5tii
         7ce/bwOcxRa3/UBWZn2RRuKTlIsuadHOs7XtRffbKPII6xcpyz/0VYVZ3rVsWFDXoJTh
         m1dwXYrvbJXOHAiMLDsCHrRC0/Il0/JTu76zxrDXNxDm9brtTVQZX0sPWiQ+SNOj63gC
         CFFQ==
X-Gm-Message-State: AGi0PuaTEjsHHTud1PPO7cDRpJdCP973sSGdTYPaCzFlnU32dNeBSGOL
        KpTo0i6HxHUb7GBctkDJJe+CtA==
X-Google-Smtp-Source: APiQypKY7h/Fyc2zt79ZV85Mae8EDg1UcACG9PeCPGLt4r7q/EMMLU2+bZVZ+z07SHdA2ygPjFm8/g==
X-Received: by 2002:a17:90a:fa8d:: with SMTP id cu13mr28009pjb.27.1588119843473;
        Tue, 28 Apr 2020 17:24:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g6sm3102818pjx.48.2020.04.28.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:24:03 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just "unsigned"
Date:   Tue, 28 Apr 2020 17:23:28 -0700
Message-Id: <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When I copied the function prototypes from the GPIO header file into
my own driver, checkpatch yelled at me saying that I shouldn't use use
"unsigned" but instead should say "unsigned int".  Let's make the
header file use "unsigned int" so others who copy like I did won't get
yelled at.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/gpio/driver.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 7b5f5681b7e4..8c41ae41b6bb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -349,30 +349,30 @@ struct gpio_chip {
 	struct module		*owner;
 
 	int			(*request)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 	void			(*free)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 	int			(*get_direction)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 	int			(*direction_input)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 	int			(*direction_output)(struct gpio_chip *gc,
-						unsigned offset, int value);
+						unsigned int offset, int value);
 	int			(*get)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 	int			(*get_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
 	void			(*set)(struct gpio_chip *gc,
-						unsigned offset, int value);
+						unsigned int offset, int value);
 	void			(*set_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
 	int			(*set_config)(struct gpio_chip *gc,
-					      unsigned offset,
+					      unsigned int offset,
 					      unsigned long config);
 	int			(*to_irq)(struct gpio_chip *gc,
-						unsigned offset);
+						unsigned int offset);
 
 	void			(*dbg_show)(struct seq_file *s,
 						struct gpio_chip *gc);
@@ -459,7 +459,7 @@ struct gpio_chip {
 };
 
 extern const char *gpiochip_is_requested(struct gpio_chip *gc,
-			unsigned offset);
+			unsigned int offset);
 
 /* add/remove chips */
 extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
@@ -657,9 +657,9 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
 }
 #endif /* CONFIG_LOCKDEP */
 
-int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
-void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
-int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config);
 
 /**
-- 
2.26.2.303.gf8c07b1a785-goog

