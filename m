Return-Path: <linux-gpio+bounces-18316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D583A7D68A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D023B549B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F42225791;
	Mon,  7 Apr 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RYa1l+wL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B7221F12
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011489; cv=none; b=Wt5Qcje4ivJe6DLHvjOiOIaZCCbeE0QAX48OYFDAXjvpHYQVFABcnyEDyAxL+GM34IvIYU+wBxIO9iL2zbASUsoX0iGW7tgZrarBstjPIa0GDKnGABGgFiVzKqy5I+ZbydTpqh6Wg2R1OC5bPTX/WoA7WC3dVDH4zMeLCFL6YKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011489; c=relaxed/simple;
	bh=n3y5S+O7kQ6BuzA99tkggUIPSJO+2r1CKhEXkaomFp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2PzJ9EO5N9zl9LM7/lIbJ9/TodyRr88brmeF0HiHIrbIVs/Rp5tCMrnnvKpbIC5Hv9SOxFSakNZX52naliPuQ6Z8n61/mu7jBTDyA0A/UBPg8tvjB7isOY1aR4y4nOPbl1hZF0MFuk3Q/gBH+wwT7LHG1mYvk6ORmMWMZM5cyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RYa1l+wL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso416406066b.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744011486; x=1744616286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKdjaegSMAM/rqAxMCD9Qx149zQwzIx25XoQ9FIROmk=;
        b=RYa1l+wLBzgmaNKvb8FBqxT9BR9KcELWq+iuUf2F8T2BYpVrzsSc2qC9vtrVRSG66V
         fzBtzD5gIOrTbKoBzmyGoJvlMpbjG7N0Yttb6zMVydzd36TUitSLjRfkcTwaPOJLEsqL
         Kx9YA0+CJ995zBOaAaRIcMI4aNzfj9vzLCapx6lcZUnlGJkOCOcS1QaBf5wpym0dxSmb
         8/pMDjYlWBXHcBcIBGgVdMpqb4DkCOL+QlhFCIY4k7bnkDtZTYURGiLQFqlZe9jIbHgc
         x867yr8LCrRDNJqV1Cm3axXFulhz4vdyiA9y/OvMiKz81st3LOG5NHe+JXupienDokqf
         lKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011486; x=1744616286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKdjaegSMAM/rqAxMCD9Qx149zQwzIx25XoQ9FIROmk=;
        b=GCpHPgEt8oKhBbKdiOKa9S+bzIf+K5DUj8TogCRo1gYIbGz707BrOre0NmGuAnTiiz
         W2O4L1Q42IVhLez6ExzY3+3IHFJnhVfNyP+15i6y/EX9J45DNrhk6VlognGHWjY9kKzI
         YNm9XW6sBouZWfvADr0GiWU93aOVDEeVSRFEl8Evtw+auCNSlBuT9X3PZrP9k9E54H7P
         A5psb6XA8dFIidKz5KwKltKuPYwtm9kzUo/wPIkbKNzRt3WFgVxbtxvXlql1Xjvbemog
         kvIVdxL3+TZ4LIVZ41Bg7DTxpLcbeVEqfPP1kw03rXP9ZlRAFbvtSrRwCvchvwKr5ndW
         Rwfw==
X-Gm-Message-State: AOJu0YzTsH27T/T9Io4D/Ri8L3kClODNWxHhD/7UfNpiJFvC8HRyIvJ5
	df/SgUL7bQJ8EniIkOYs/g8ZqpiwdfQvDrlzdmteCP59IChVxvm+ZvZVweKCG3eh9Ytqu/rsqad
	OPYc=
X-Gm-Gg: ASbGncs/3dV61DGbETyTfBFuv5Xg8+5G8/jOU0OMSGC+1QrFj42f9lFnbRVY6RhRbnM
	Czul0rKqierS96810BIYKsFTlnaYGVrQZW8m4I2XKnkIkxQxWDsJOOVK9Lw8lmWEVXB3l2SIFV5
	CtzowkzksV59z1NIhDx+107RyhTSND+yoARR4zCejyIAAACSXI3R0PRgmsBMDwUhvfVlUa8WWbK
	2w7kWxnKdfMxqsU9wea4NmexxI5f8HBLllAnlwuQYDaO1QnsVqK87Nj9JZphIr4toUxGyGgu6lf
	+U9D4V62DhN2XRuOzgcwMfkzkAwEqzmfeCxIrzEeIqRZLKM8
X-Google-Smtp-Source: AGHT+IGVJL2F1/8I/lWwJ31vPm5jJXx6hPrzpL71kYNbYKzzALSjHc3IlX+0r79eE3W6Jj2Qgam/hA==
X-Received: by 2002:a05:600c:3ecb:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43ecfa06563mr113287175e9.31.1744010003499;
        Mon, 07 Apr 2025 00:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:18 +0200
Subject: [PATCH 09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KsRxiW0W4vPyxl96QeRBfnOsz6q4m3Ci9vZGWLs5JTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sJFjAf8szaIrgU5fOqH/7amZ26nGC766Hem
 EIDJGZEXr+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CQAKCRARpy6gFHHX
 cq6qEACSrOsrL/eTz+OWDhz4LW60zXJaDDg5Nuceeu5AW1ALzN/2p0KC/vTlpXXplL6RdF7BLRf
 2hgVRiqsLE5E03qR0u/5QvjgXLpcIZLvA/diAZ4XpZ4snRlDvtCxE0PjAFuOHG5bY3TD5oJXRHZ
 AYjngYn1l+FQwvCZbDR1pEgQdgx11SkyUGQduyHYyYrYL1JqGwJpe6wGTNUHAUxAHQL3FvVnVCI
 9kERiaMzIwJuLFc/Zl3M0+O67yijJGaMVWhLu4LuQ/lXL0WLApQGgc9ZfQJbflHt+N6v1ks4Hcn
 ckZx0oGiwVo2rrKoTI9s/LKhVzGqBocBtL6md2qZm/thsYmcxHiEAaoQyF1Hq28m7b6Nbd06T7L
 mPbAEcwvF66QinqBunjXweN2uCn4H2323sSgaQk2aD9ZCV17q72vySB1My7hgAGeylyutpAfM5y
 W7dYHtRhWpYpfdF0i0BVuv9A7TWKT6GoaWCKVezB9rGzX9a4JAniOrnnACa8w85M3GkxutuiqO1
 0TmbiI1/mcptGer4guYOBZkhxl/oDwmc0/GA5d6DfPnXP5Bzp7l4C7GjsovTpIFNyrgRhm8fDhS
 WzOqAEi4kuFxf/EW59WI5sce39+te4RlicHYmTDxAJWuSfpOE/mKC11EQughtuzgyvQHJ1bBLFM
 gdvtyhemCdzldcw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5bbc7f724a09..decd150810b7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1365,7 +1365,7 @@ config GPIO_DLN2
 
 config HTC_EGPIO
 	bool "HTC EGPIO support"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	help
 	  This driver supports the CPLD egpio chip present on
 	  several HTC phones.  It provides basic support for input

-- 
2.45.2


