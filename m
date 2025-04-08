Return-Path: <linux-gpio+bounces-18501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB50A80B18
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 673717B55D4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB5D27EC74;
	Tue,  8 Apr 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PWEumJ1c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A127E1AF
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117156; cv=none; b=VJVggGvo4NnK7fSi1APqS8kVyhDeU0giZfVrjSGw4LeL394UsotlHd/6UI8/x1BlnuM05NM0negvrZ0qEynt36GPpw5r7FalgSFKG5cxGbzTs4FFEZjBKobsh3qUx61QhaBABEdL2tFG3lLsIE1oLqrys8Cm3yxtPNMm1Go8h0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117156; c=relaxed/simple;
	bh=ejtuJCa0gTW0tXr190QZed0rb7gM7fgmAdR6FsU9nWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+qefi98N4aixovgEaH1yIHyvVg2RdgZBRJX12hcmgcLEJ3Hh0y9BDtTDfPMjAqvzoUwdrMsJJUZgkdHFvEzp6mY8oPTcG2jG7klJ1Smy5+IUV8OfeSI0Iw0E0QahvDzb9SEQPcC2ddUknLKRwn6sLdnAxyhZ6e7OtlKJxNEU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PWEumJ1c; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso3195821f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117152; x=1744721952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+SiWjQ+JnAQGZbwkul5pJfeaQRJjod+LZoPfrsJ6EU=;
        b=PWEumJ1cs0M2NPYLHZCrmnVFIXL+tD+7fd9cLUGK4q6koMm+dR2hr8AU5s9iTUewAu
         /pgosGUiGoZl/kkly1ii4nAmaMpm+lyAeycwPNz9cR9aMzZ0MFsKzKTBeiwzUeFWX0xi
         28OU1h+8wR9mRg9mghPiTOXpl+eoN4eyNkQttFRI6f1D0gyb2LwlmBT1FJJKjCM7BMYZ
         9Yciq54GB0+ofWrB96QLrosj7UliX/8xNw3hZE2UIGFXc8VPCY0L6d9FRQuNxfc+JzfK
         QDR1PCCg4uM44dJMMyQkgJizzuz0Prb/pqjalelBWTd3zhyfvytWyw8GJ99R5yBkJR/O
         ti7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117152; x=1744721952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+SiWjQ+JnAQGZbwkul5pJfeaQRJjod+LZoPfrsJ6EU=;
        b=GYnefbyYa4duBSViESP2847xH0hHdYTgJB8xOykEPlXtVARkKXQIcVZHP3OQ9jdd1Q
         cbzu07VHmKXS3xHgFAiv+Ukioa8hzqyVy2zqqzy6+6lIHbBEoY0H7HbyihAfkWj+tRKM
         H4UiUy8DSdCNy1fz1w0cFgRSFN6PV7/LpNvPr5xoeh8EXyRnNqlHrTJAygcWvNsNovSu
         0B6IS4XEfvxyyH3AWUXMowbljk7pXjKphzJzAIXpSLUhDs0Wvi2VnE9aomJm+Kye78cL
         y4IOjVhTP5dGYOMTb5PCDBqm16aWs9wFuZup3TltiWBkXvPP0NxjXGkEHXZ9YdDahLwd
         OBnw==
X-Gm-Message-State: AOJu0Yww6PEWXr6JRIFMfDRr/PMoimEE/+dWnVF3v8bRwKeU8Z20L8Wv
	McNnyv1o5Hrg8RMAJPebpI+m4IDRl8e9hiysal4w3077VaKlJMgGaqgz/BJAhCU=
X-Gm-Gg: ASbGncsagJtV2zsyhHcJjUXBP6WMh4RY8GWFc0PButUQpAg5cZSbavR0dUCv9OY7WGo
	WQYpUzK8TIiS5eBx/+ElEzKvGMM4or4rTsmyET1LR6BMz3Zh7Oqe7tHugNMcoBlzFMSHwbHiRkM
	i8cdMS1bghdiPhUhktV1PUSq6W53bRJw6hQSUtkBdLFfUZcvmVsU6m23zdcFX8bOb5d6BBUAq+Y
	xFRcuJX04rFiCroYJOvOFVnqQ1nsS9c8R0xpDaA0JN8kr0DP9l4hr3ezFGcj4nNpfpXtaOYAqBG
	G5z1HyJSIQ7cV1xpOHmuANDou2GUgPlY/k0gRg==
X-Google-Smtp-Source: AGHT+IFgiAMsOYLmGlU9QgXS5YjQ0ISw+dlrLZc2GJlLWui+7TRanmCY0I74+DvCyIaOD8tPPSq/TA==
X-Received: by 2002:a05:6000:4616:b0:39c:30d8:32a4 with SMTP id ffacd0b85a97d-39d821109camr2677264f8f.26.1744117152632;
        Tue, 08 Apr 2025 05:59:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:05 +0200
Subject: [PATCH 5/6] gpio: tb10x: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-5-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VkZB9y+jqaXA9jJR471aKzUH9yG/lETqsuTgBAIjTEU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2aC1/NtIiado5HsB5LZmbSHSgKwg8Mhrhmn
 WWbdpKEEuWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 cmxXD/wJUQPQOJ+JDeEOcZrU+4t31HyhcWvSmSLWSiJRZZQQw9fD0ZJ1wK6YBSDAIzDlnVZvSCM
 sjE1ogpuRqbyOyf+f2pC08ypMKeq0Son4VnRsYxGg+mkfyUTfhbCmeqh1SkG3JsoYWLHW/wXY5v
 G700oec9Ie/JG4XYzXpHCkQL02jw6GpNjGpD9M9YckIq0Ntcx45Cq5UQrK3zKaV7gQUWltTCJxN
 6UC873Yp4nQ6q93tV9HaOctlnQv/MTUrsigEd7JP125nyg0U1JdlSrdUNj+XZyuKvAaiC4vsL/t
 OfR4+6DDpaAJ3PFYmGSUAk13uB/YpXRJZtDYYrXTuHdPasurdODkHRCZnd6sN33SC5Nmof2AJ/6
 KRffASjeGhmumnWZGA8vbJNlsni+8QAD+mYzP8Ho/Q0FEEUMy7U1daWLhV0LM/ZdteXLe7WcadP
 jemQa2rkYtoE9ws5y5Q0nsQ4DREpy83chsnwBLmu2s8iTa4C6VDXUmm2DO+e/JtUW18K/fx9DRB
 +wLVrEUaMToXV2XQ+lP6J6Lud1JkIBBKftLS+blVPA/xfj7QRxhzfcLHIPdEPTLkc07Lzni8+a7
 G6KaDfYDQ1/G8U+ozbJf2egGrNHMsRYwj1PNtscK+V3jq53fduWUHKZBqkENq7k5LmUjZrHli+E
 By8InxtIKz9PQMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled. Depend on the relevant machine symbol in order to
not pollute the Kconfig prompt needlessly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b0a689993bb3..5258f260b527 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -700,7 +700,8 @@ config GPIO_TANGIER
 	  If built as a module its name will be gpio-tangier.
 
 config GPIO_TB10X
-	bool
+	bool "TB10X GPIO support"
+	depends on ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO

-- 
2.45.2


