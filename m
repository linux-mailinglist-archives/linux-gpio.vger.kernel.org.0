Return-Path: <linux-gpio+bounces-3084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29C84DD9E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3AA2B221FE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98ED768F7;
	Thu,  8 Feb 2024 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LcvLjqIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2758763EC
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386388; cv=none; b=htNHxNrKNAQbaDSxF8MDXXqNMyH45H2oQ3pcaeDTAhpxPf8/pI7ds+DUhIYuFlH7624ln36J2tk52phoebL02dNLlXk1ea3S++xxjIYarKbmAu6sXHSjL1/BjgevxZOVGN9hw1MIMRfOsr1JuO40OhCiHIm4CTCLuQWd9zFmghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386388; c=relaxed/simple;
	bh=zyYRmke/1SCtbqMjlRvTGUpu/1RsBvW/3TjBpD2c1Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G4yA+IN2ODVDZBLaK3mLnsc+D93xYr1yBLHOlDtJGwDM8v23XzKRC92tGjHPg/UCSGsvIZBCE3xzroDmtDoKWqJVI/mGc4f1gLyqtCTkR4oDw1lNxdAqkSQfuQKeBgEIMj+csXHZVHfaTLSTIQzRL99/sxGn/w/PUDYQf9AkeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LcvLjqIA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fdc63f4feso15128545e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386384; x=1707991184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYIRlc5OkrwZx92ZtvrH7YghLqa9zERXf/+sLJWSs1w=;
        b=LcvLjqIARyhPHJeE+GFYZBV5UxQZzWZ0ij/9yf8Ngehd0w3F2g5D04+RrkJVTCqvBB
         RMB48xYbJWcgD4UK+JuFGYGWE4TjBiLX00L53ltF0fztELSUgrC4YN2cek7/GR1yxOjG
         f+kwbqUQA06VBoRHS3e5F1toEE2PwHyz9WoZWbNIVspTg+tT++K8y7Q0JDqsv3VecyMD
         a1UT4ARal0RrWdwmo/IAIA6peSyJtThQOxZ7xwlaMjVwev2Ry6J409fj3gRCWDz75lxn
         QhUBxzhlosS4Kg+K5nilCmrzcZtqIAErZmkOg2PqICPkmd36n3XAq3bcTtWfEBZg5Q9X
         gGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386384; x=1707991184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYIRlc5OkrwZx92ZtvrH7YghLqa9zERXf/+sLJWSs1w=;
        b=ikc2R6eqv8YDURUna2hr+OrESb98zCpHNNPXGB0zBo1vA9N32AdMPAgMfqbTK97nJ1
         JgEwYykg8YCDsciWiXT82QVZburRoW5bkk5BsAKZKzzu8ME3LXgHka9HEblDvDEPmQOP
         9U69gwald/tHMp+VOQl+btIq+XVWL+LZhTVg4RluJQU/DgPnRqwGbkAceRkmJLYSS9uH
         gK7unnK+YNnxFgMu9NcJzSqZMV8TBG+poce/XYnGnljPfTVxrIEwBUIz7nP8eFoYuuK4
         4j/12/ZbjurYSaKzH+pvOZyF4qT+AxrEah/4y86EI1cWvcaaCcl5kMKevBOlnp6GHjje
         37iQ==
X-Gm-Message-State: AOJu0YylRCe9SvsYPewRmhcuORSMvcZWoYRAu01p98Ge4n1iOvX7AV7G
	1CnxFmwRw48KYZ6bbgozzNgqtvZgaCkrWH0hOnGWB+4emVpfwGKw3kgulemGVhw=
X-Google-Smtp-Source: AGHT+IGmjI3oUCT6UGyEZLyHOIfrA6gY0gJbhE50NLpRBeSQx92Z/ddnY3cwTtLCzY6EZet+u3ke7g==
X-Received: by 2002:a5d:5905:0:b0:33b:28df:c370 with SMTP id v5-20020a5d5905000000b0033b28dfc370mr5240161wrd.14.1707386384098;
        Thu, 08 Feb 2024 01:59:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViQt0ORtUTwvgRsnwaxwfM9LU+1xPs52gzk/iVEXu3OHYomnxR4eYemcPqJP25T2cd28tqXed7sdF+8igZtyf/dHBDKXDm3jSYxaCQkQKqu1BfSc6k3hJvq+mDOwqfaX9jLa5S2pINY9+/dFo05YgavaF5YixHlIxhga+1Enjzw0YppwtRHXEX8B4Psmem6OjvYrTOaE2U2FiKmCWwXHwsh/oFxkTMsfS3YAJMCWvOBYjX8XDdc/taQNCOvcExbe5qj2Y1Jjrw0Nt1X4Xv7qvtvLNLshQkRchFXcYTpj+tDvQqiIZQ/jXnyKFbP9Dk1vkKtUzzOnGj+Hb81o1Cg+j9U+N/0pnI+A==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 18/24] gpio: reduce the functionality of validate_desc()
Date: Thu,  8 Feb 2024 10:59:14 +0100
Message-Id: <20240208095920.8035-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Checking desc->gdev->chip for NULL without holding it in place with some
serializing mechanism is pointless. Remove this check. Also don't check
desc->gdev for NULL as it can never happen. We'll be protecting
gdev->chip with SRCU soon but we will provide a dedicated, automatic
class for that.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6598960b29de..9be7ec470cc0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2257,19 +2257,12 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 {
 	if (!desc)
 		return 0;
+
 	if (IS_ERR(desc)) {
 		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
 		return PTR_ERR(desc);
 	}
-	if (!desc->gdev) {
-		pr_warn("%s: invalid GPIO (no device)\n", func);
-		return -EINVAL;
-	}
-	if (!desc->gdev->chip) {
-		dev_warn(&desc->gdev->dev,
-			 "%s: backing chip is gone\n", func);
-		return 0;
-	}
+
 	return 1;
 }
 
@@ -2345,12 +2338,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	/*
-	 * We must not use VALIDATE_DESC_VOID() as the underlying gdev->chip
-	 * may already be NULL but we still want to put the references.
-	 */
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 
 	if (!gpiod_free_commit(desc))
 		WARN_ON(1);
-- 
2.40.1


