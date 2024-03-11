Return-Path: <linux-gpio+bounces-4246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BA877E87
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Mar 2024 12:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93BD1B2197E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Mar 2024 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6A7383B5;
	Mon, 11 Mar 2024 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlD5C2IF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81435381AA
	for <linux-gpio@vger.kernel.org>; Mon, 11 Mar 2024 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710154862; cv=none; b=ZzJ6jMjLoUBMak2FojU2nAQxfGcnV4xcXnQaHDg9SMdi/GE4mfbUynj18qh/nwBGld5rsk00M2BAgIIfZRCDRISDVZkKUy8FV2Pf+fuEkAe0QkOKm1Y42+T+FirfE9SHgCnUhCJITJmyKpKzPXUiJdb2sgSKgNLqPA6VkvmaPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710154862; c=relaxed/simple;
	bh=EJwC2X4/a4PrYYGENHc96zyVnf31IyxcNikfeTn9Iqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oo222N5qQajvPunDj/i/ZBmdIxYxsqeqE0BRobSaY7KjeltDssua47BTaD5OIkBfPXCMJK79NBCQYPSx8U+VUN1Ax21uAZL1wb/YAGm1jCFK1P7RqI6XzIDbjKZcN06PjO9QZyHnXkBO4QVe1VKsKjmcysjZko6m4XYnJbCf0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlD5C2IF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5133bd7eb47so4966457e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Mar 2024 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710154858; x=1710759658; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1M9CrsxURK9osAlAJKJLTrbinlvddAx/ivsJ1lbXFE=;
        b=ZlD5C2IFACJ4UPjCHpoXcXKQGOCuGcUFqTEzYM351C1VHdnybgaUGdlfwjcb/mGQJg
         HQ0bOQ9tKUyj+E/DbHyf3u8mGgzhjTPDRHE1sj1uUW372JSY4BMNe2AnS6CNX/A0Om9V
         qUZ/mE4o5mQm/49Mz8+AghmwUuZPvVHCeSrycuDPcEPgDtGgNvu2nJ9JLLv0d7yZ89Qq
         NMo5wb26tixOAuS/z5MJXdLv5G/1smmNDOjvnlz1c7CbS84JkbjwHMR/NapYewNyOKB3
         jnCvDbpZgMx5YJ09E/6ATgop3oLsc79hqQTAXMJ3vaZWFIedg4Z2K7BRar6XNvsAhTsb
         vQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710154858; x=1710759658;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1M9CrsxURK9osAlAJKJLTrbinlvddAx/ivsJ1lbXFE=;
        b=gQyMvi5SH2Bqmnj9P7/KbkabSISQFZ5tfZlEGwKSpBIUG5F4Ok0iTAYiu+RaOkDwjm
         x4tFPrDSdoa7Yfqkc8u+3eLl50S2Mqg3j/EBMJCanBKMe592TKiw38iIDDkCpk1v5DpP
         sIyyIIrHto+Tw7UJpe9KhOahhAPGtgPb0IwpyTI5APcMq4MV7W3lQ2XctyVmgxEfHlDw
         373LdONPzrFBAdvcDH8DaD80O+/Oi2u1YxZbvnLOanq2oZe/sUdTf+vWGdWRJMBG19DE
         pI7P2IjXjH9Qb+TPS5wkR+MCYSFfUVywYL1Sx0dq4LOU5JNuDp2k2sknURdX5vsPkgMl
         VYew==
X-Forwarded-Encrypted: i=1; AJvYcCXXhJq+Wb0tXYQyUsGz7orzWqWAy+thDKBJ+1uFz3W8h3EtOv5rftdnGbA3MJrB6dOqVlgO+41YuxpcOTYS7BsNZxuMSBXpTUWnTA==
X-Gm-Message-State: AOJu0YxUnrPXf3+AxxMVLIoLCyhvXok7GZCZ+3hMI4d2PY1Q74DJq44q
	62Pe/i/9zIAY5X40yXaVRqf4W4jU2hrc5F+kqGYsTmG4orlkrWCrrl+xEWq37iQ=
X-Google-Smtp-Source: AGHT+IFwCGdoVdTpdQaznB2idQvFXubh9UWyyPMuumHmhiYMoRkMnvTiGe/Fhx2f7ORUyE/itJx+5g==
X-Received: by 2002:a05:6512:ea2:b0:513:b0d4:da40 with SMTP id bi34-20020a0565120ea200b00513b0d4da40mr706289lfb.20.1710154857841;
        Mon, 11 Mar 2024 04:00:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id eo5-20020a056512480500b00513179f6c22sm1045933lfb.96.2024.03.11.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:00:57 -0700 (PDT)
Date: Mon, 11 Mar 2024 14:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: nomadik: remove BUG_ON() in nmk_gpio_populate_chip()
Message-ID: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Using BUG_ON() is discouraged and also the check wasn't done early
enough to prevent an out of bounds access.  Check earlier and return
an error instead of calling BUG().

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 463a765620dc..5e2f9b51ece3 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -533,6 +533,11 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
+	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
+		dev_err(dev, "populate: invalid id: %u\n", id);
+		platform_device_put(gpio_pdev);
+		return ERR_PTR(-EINVAL);
+	}
 	/* Already populated? */
 	nmk_chip = nmk_gpio_chips[id];
 	if (nmk_chip) {
@@ -606,7 +611,6 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
-	BUG_ON(nmk_chip->bank >= ARRAY_SIZE(nmk_gpio_chips));
 	nmk_gpio_chips[id] = nmk_chip;
 #endif
 	return nmk_chip;
-- 
2.43.0


