Return-Path: <linux-gpio+bounces-26439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2FB8FDB1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 11:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27CF7421522
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 09:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B932F5A08;
	Mon, 22 Sep 2025 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PdI4FtyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA12D47EE
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534856; cv=none; b=WcFsgowSjH5NTJi0UIOqe1BmlvqVNdvEDSVnBGxdf9eFRiV3x4AfH2JiaOW+4Q1NqKJ0w9W2Nyzq7qfo3pbC9TAlTXXgqEJhRy+Xv7UxIgCSeKDKKn4HYbScLu/O+ZRLXQHs0M1S90XmmdH9RQd8BqvoJCv9TTzJLg0OKnYz56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534856; c=relaxed/simple;
	bh=aUR3ryu98yvbN2Nls9weWrK7nyd+VGsj3kYhVd11++M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjmxtn3Xqhy4eb9maJaxyapiYUqPZ5tCWUmm5UK8dzEBmARQfMBWhnbgd/+mCZ8mQ45gevmu1zDEwu0G3ztJaScCCR8Dv7DSBxaeNeHy+auOROeazlix5eop2LSGvWGbqhJ0iOW8NO31MElJK9ji4g5+mqIxv2XyRDYcORXMQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PdI4FtyC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so31339755e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758534853; x=1759139653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ago4AKKlVfbpDEKiW0UPe8e/tjpmgCVJcEoHQkKgzL4=;
        b=PdI4FtyCZ5A9DAeTVhgx+SdOMpaZLwF/kiowZa3PTYR/GVhARd9wGcVEzSI6rr42vN
         PjkSiUE74ejlUtuIHxSRyp4gAt94c2DcrGLYvdS29o/n1ZVUSPywOsS+ekqXRk/Ya3vj
         /CTUTZsx396UNq1NVCWVFUEXasZI+LL+iCmfyAEOqfc8nCMpfr6E+GXaOpvQ2dmRvwvu
         UuQO5fJWoOIWJcsp8OzGVqiUQ4/1mFRfUWrdEXFL3Eiv/MF3TzgVzIMbHy7abiJNRbHx
         tFOUp8tzp8aCA3HZCUsGB+Vbnh9MrrZPOfcEhU7MZNeKgVZ37U5HFtI7x07kTImg2B53
         mnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534853; x=1759139653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ago4AKKlVfbpDEKiW0UPe8e/tjpmgCVJcEoHQkKgzL4=;
        b=myVi2GIZLKLcJDn8c80sFJkRKnZEtCPIuwrV3O91Wf+Xay0xVa30mcUElbrkbOADpn
         jY+hIJAZ7CUy9ChemfED1qUsfnszJBk8sF01yBMHeT/2dAe6bf2Q6iHBo0KqwH/0DAjX
         XaO5jThlvBp0XSwKX7nnOOa4le491CbW/IfKdO2o1v12SStiL3stK4YUmWrARctVndzK
         RHMKU6kZFQWGlCQS3ZoaFp2U6xe/GgmyYo2M1X31Ou6yviPpRSdb2Gp5jXmGL1hgvzga
         BKYkKUmzdczf12ValBu75svFGU0SJvsFYj2SbBXDE9dXM2JvLVhWMgDTNIE1UERxoF8f
         MEwQ==
X-Gm-Message-State: AOJu0Yxdf0XQOlxQdRJdeSp3cnbvCgn5VipmBCRy5a+/FFD05v3bfVKW
	ZT1S0rYoPkuZv3r6EOYC9rFavLD3TXdIvwU1GqbSQR1DArMhEz5xDajLGxHJFpSw5lI=
X-Gm-Gg: ASbGncu7+n44PvwrO/NASJ6M6bhxA7zqs2sxlC4EsmIqh3HEz+Z8RXCespgcTa8IKqG
	MxxFUbwuSGenIyCMaNpkRT/79xlm4xYOqrBSmunHxK5A929GZ3O0xGI5Wr9Y2uFg2uRwDRpC3AN
	qOfCiaanD5QZkb/YKgDIZOejjZ5JmY9OR5OGLXHyVZ2csYtbhqQJ7p6ehmMoFnVyJWsvn03HZ5w
	EEOjMvhWXKXeDleXQzgoegBAdH5gNngjOq/ZrDbtSKc72Nxz0+4c31lbaOBOLZgkpHU8Qp+4Ypn
	Y5u2VQLXTVP+b2YFf+8EyVRZslMSC6VIPV3Gpn9x0Xmqkj5bUAdnxFrlTXdTv7Qyta1qJKBgyQo
	wk3ucHnRryMRDP1tq
X-Google-Smtp-Source: AGHT+IGh3+4GY7BhbXRdxHNtvWi9t58yhCV6fj1ZeJ2EY/lY+Lj/8g1ZLXUfA7F4qSMXbmVDAFnAzA==
X-Received: by 2002:a05:600c:4ec9:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-46e1a60cb3amr6850765e9.2.1758534852930;
        Mon, 22 Sep 2025 02:54:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-467fc818e00sm156496835e9.0.2025.09.22.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:54:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 11:54:02 +0200
Subject: [PATCH 1/4] gpiolib: remove unnecessary 'out of memory' messages
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-gpio-debug-macros-v1-1-d99739dff711@linaro.org>
References: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
In-Reply-To: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=470wYlbXCkRiYNRraDrehXz5hNEeC4YDOrpA6VC+LVI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo0RzBFF3Yf8N4TNzjAoMiMcdWI3dxJXCIyMLyl
 ziF/tqwlceJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNEcwQAKCRARpy6gFHHX
 cmOoD/wJF9VkxmGXKrAQrpAGdKrHwUEJvosyOhLKo94EUfTzoBFOJd601fAnI1XOmaPFWoKP12H
 ucXdb2eVM4z32Y4PcLV19lOmrsOZsQD6A9BK0Ol5rlsl96Ox70evEHPBxZ2+nkqvzjTjrxlfSeO
 EyfHJQ4QVvU/LhboIMKsK0TR4qSQNCnp6jlKhmU5uNbmkOatYC9Y+gmrVekGxqJCG9ah38am/pQ
 6LZdSvpeyT36A095VvzGH+L52zSMkhtlRcfqLWrSo96kSFR7ZD2t/Hv/icr4yic2COjidw3wbC7
 us+B3m5l0Ov9IjIQC7fLsJlT97p2luzAH+BE3bhRPPGLgyqynTpiHak6dM/umrWoSRVvtQ7BG2U
 k3PcZoout5Wg8lCJDV5sDixWuBJTxNff3cDVTLpzTraHDUW2iiy9mRvHdRXvoroniY/8LS8mZUT
 lgTS4Fg4EzZEmwOt5fNccDoL0VOzGMTtMr2k9dwfAbyyRCgW+IPzXqZEaPOx2TAd6BjIDMXVyV4
 ingDCUngOfPPixtb0iLgZUvi64jClk4DaFJ8ZZ5g6Q015wp0MQzIyvKY63UP/c/HVVTirnWjrWt
 +j+WzhWmstJ3R0IQUiGPx3p5IOpSymmeGcJ9QHGIZwQlFgzLh2w9lQR2luJGXTPcPxX5nQ0JpU7
 fxa1H9aGFAOYWyA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't need to add additional logs when returning -ENOMEM so remove
unnecessary error messages.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 01bdf8fad7cff6c507e79b8880e9335d7ee53173..0bc2363e71a488a9c21b3da59821e04bc08be69d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2316,10 +2316,8 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
-	if (!pin_range) {
-		chip_err(gc, "failed to allocate pin ranges\n");
+	if (!pin_range)
 		return -ENOMEM;
-	}
 
 	/* Use local offset as range ID */
 	pin_range->range.id = gpio_offset;
@@ -2379,10 +2377,8 @@ int gpiochip_add_pin_range_with_pins(struct gpio_chip *gc,
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
-	if (!pin_range) {
-		chip_err(gc, "failed to allocate pin ranges\n");
+	if (!pin_range)
 		return -ENOMEM;
-	}
 
 	/* Use local offset as range ID */
 	pin_range->range.id = gpio_offset;

-- 
2.48.1


