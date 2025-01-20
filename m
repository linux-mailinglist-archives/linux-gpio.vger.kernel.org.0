Return-Path: <linux-gpio+bounces-14950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E255A174AD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 23:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB14E1885C42
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 22:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6811F03EF;
	Mon, 20 Jan 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLMZHNHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B01E32A2
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737412523; cv=none; b=JPMf7fDvR8U44uyVDey7J6oF3KNFrMQPL07EpqIdHXZ0RqUQgTpjrfoN7UxbUNxK34lRBQKajCpYl78eC518K56ZX+8x+0nqNNZCXW8pus9widyfpTfYzhy6y/ov7WJfPFE4Ie74qWmWDye73jQE4Wc2OEz3Zz4Db4Ql8dFJZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737412523; c=relaxed/simple;
	bh=OTgu1eeecPnibK4nEqALRH95vt4XupUV9oBpcr4zl04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1rUsevIrcfpVsbJb28tgkaFDnJ8k+kl06iTqk1sMvPblPWZDNxAaLKuwlGZncODUQ+WC97+Qa+3DyZ7v4EFxcmIaC+YqmNbH/iYZKAJ6jtFxDj4BvoiizkHep19Pxw7O6m9NP4cWUqQcY4o3lOuhw+U2ooq3UWCT78DvKzLexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLMZHNHl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2599334f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2025 14:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737412520; x=1738017320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFKR440s3LWuGnK2J4EjocaQAsaEQa3uahLvYStfmOM=;
        b=iLMZHNHlSHJZTlK4kS4D8FLsXwaRfQpg97zRvyv8HbHsRREP6nJoS3sjmJgigeTsXk
         pJyZ4+XU9khxk1bkknRO5KMOiMJmKABrWt0LS1xdqC4FAfhOvvajsDn/uCEyVGJ8217i
         ksQy5W4N4f9/BtfxcN7FUHL4xcTtSxIFRoWuSxzmqR9HvCA42rdaRHorNlKMiKmby8/Q
         igdGNRRaSHRJwdk1AsegtIcFhRnWgyXcjz9MKWhWgwPwYkwgbotbNqeyyLmZnh1iC4xk
         SOf0koYblCiggFMjx+n2sdGClf1b36Q3Vkvp3nOYbM13S6qqaUPczJe7/2g5P48T7rLd
         DCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737412520; x=1738017320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKR440s3LWuGnK2J4EjocaQAsaEQa3uahLvYStfmOM=;
        b=ZMcPtkOSgchMqox8DzVaSVdsVX9GbS6CDXA3iXuDF//3bPHUn9si44FPIAOJ7zq5FE
         A10YwJLX4uK8HZ5NW2q6cOrxuScIqUVznO+CPCN2t4XhxQpssAvHsEITmPkQgnlb9EY7
         QN3a/eVFTM6QQA6SEYDt/X7RqWOZtHBuBMhJaeqnoIdKe1GqdRt+bhOJbaCiFXV3CdYw
         TPZQmIWXuMHDt7mD/dpHr9mruasIIG8htjFHaUxW1oQFiqHvsQo9uqI5xVL/8n7AaCix
         ECKpJZCxFVbod4zyvTyTfCgGM0kSOs8V1WtPznsybb7NmHH2v1p95Vt4aqlAkeo/uqlx
         O5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA9V6EZcTb4A/1m7pkzS+uNlbNPch5oxpGoZ/NBr8fW01AxskBikz7Ke6VvXBiy/AsD8JweDw30JmY@vger.kernel.org
X-Gm-Message-State: AOJu0YyKe9hflplOfU+SD/YIt4asGESKXx1Cx9emArR7NJ0LMZBftjci
	w/nFMJ4Pn5vbPO/zGbto0czkz6UzHeV5+jJjcpPfCQBXU/zR+l6Bdb5PmiOydEA=
X-Gm-Gg: ASbGncsrx1wHvkR7ffi+kSE0Nr74udhcj1AjJM3AFM8j8pTpww5oaHe0rVwCBCsnUu1
	ZmNsceNp7Uu9N3s2DGIGHQYymmjkCEof2NmbgRT8LZhPAVEiYkHbx2aWbL8ULUfo5ECRjLWH8D6
	9T8HnslDpTONMo2DAdjkqoAewTBZObGFcyrmLgUDLEQlRr8coybXY30ZClLzawRsHrYApqcB3CN
	vxXrpjGvHNGCc2JfrAQrdS/44s13QCAlCQw0VMa04oWGSnhoBjr8LPYJ/QCK9BtWEmCZDl1qaBa
	+XnalMyWIlVy2fc2rIOYh6Q=
X-Google-Smtp-Source: AGHT+IG3xjcBGVX4T+M0qnnYkAjTmptNXBkHKLQdgDh0mSE9fCGY7i6+u5vwYUbqxZS1Liw68SeAmw==
X-Received: by 2002:a05:6000:1fa4:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38bf59f00bemr13493102f8f.46.1737412519669;
        Mon, 20 Jan 2025 14:35:19 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e19fsm11889267f8f.93.2025.01.20.14.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 14:35:19 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 22:34:53 +0000
Subject: [PATCH 1/3] pinctrl: samsung: add support for eint_fltcon_offset
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10839;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=OTgu1eeecPnibK4nEqALRH95vt4XupUV9oBpcr4zl04=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnjs+jvDXgrkVgkwReGxvQJoucsPfDQYLIJE4xa
 FMoj08U0fuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ47PowAKCRDO6LjWAjRy
 ut3OD/sFEq0U13QOCuGUL9OjVOlcuHbicL5JXWjyDZ8e3ONrqKDgsr1sgndw7mY7BNiHJ/3FhLT
 UMjy90J571pvt2QtFaTkjhkGuJYl/s0EFUrBLdLOhkhOrD8sk9oFTY4OG2vvXBv+q5NN5JuyE6l
 /8mPRqU58v9QqbJ8x1A5jSw/jFrIqvX5nMBaWKti72rW5+Jgh7Q91o4tNj0+wczwEkos7BJntJA
 cjgTThj4SEOs/HMmhBFv0ZNeGJNM0b7o3HsHe5rvlxcL779e759MYhvyJsdoZt95C5Syw+RvvyV
 QzL85WN6eERSJq5u3d9QJcFDmFdfWs7ZE4MRFrCpblCjv7qVDXoLBqZximQyP453AWidgqrdwMD
 0n9ZXVilxZ3WpIKFBnPhstmRWR1zoEHqM29O3KpFD51fLOOv2+2EBy6yTkvmOk8IXhuFnvAQ2UE
 nLZ+IILl06pkDMV+beyUsX2zsHK3CA4MeiwuZ5y4DSEZfqTUIbvI0M1oanKkJYukxZn/TI53AN4
 oPLPKbR+jJhU+MH8CsEU5iygxMUBMWPESyOAZBfmnjXAxe7VbEQJ4IsbHMPEjz+rX4OsC8s7MKV
 e0NWmeLvwcRmZvi3Tgo8MzU7HXVfWu93YnEhtyb8Q8Qhv5SqtJQO9e0hnUwIn2xVqb3m6iEbMPq
 weUCo8WiKMybg7w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

On gs101 SoC the fltcon0 (filter configuration 0) offset
isn't at a fixed offset like previous SoCs as the fltcon1
register only exists when there are more than 4 pins in the
bank.

Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
macros that take an additional fltcon_offs variable.

This can then be used in suspend/resume callbacks to
save and restore the fltcon0 and fltcon1 registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 98 +++++++++++++-------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       | 22 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  4 ++
 4 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce5ea..e28fe8177646 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1370,83 +1370,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 
 /* pin banks of gs101 pin-controller (ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
 };
 
 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
 };
 
 /* pin banks of gs101 pin-controller (GSACORE) */
 static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
 };
 
 /* pin banks of gs101 pin-controller (GSACTRL) */
 static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
-	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+	GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
 };
 
 /* pin banks of gs101 pin-controller (PERIC0) */
 static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+	GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
 };
 
 /* pin banks of gs101 pin-controller (PERIC1) */
 static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+	GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
 };
 
 /* pin banks of gs101 pin-controller (HSI1) */
 static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of gs101 pin-controller (HSI2) */
 static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
 };
 
 static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7b7ff7ffeb56..33df21d5c9d6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -175,6 +175,28 @@
 		.name			= id				\
 	}
 
+#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type			= &exynos850_bank_type_off,	\
+		.pctl_offset		= reg,			\
+		.nr_pins		= pins,			\
+		.eint_type		= EINT_TYPE_GPIO,	\
+		.eint_offset		= offs,			\
+		.eint_fltcon_offset	= fltcon_offs,		\
+		.name			= id			\
+	}
+
+#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{								\
+		.type			= &exynos850_bank_type_alive,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_WKUP,		\
+		.eint_offset		= offs,				\
+		.eint_fltcon_offset	= fltcon_offs,			\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd4ca..963060920301 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1230,6 +1230,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_con_offset = bdata->eint_con_offset;
 		bank->eint_mask_offset = bdata->eint_mask_offset;
 		bank->eint_pend_offset = bdata->eint_pend_offset;
+		bank->eint_fltcon_offset = bdata->eint_fltcon_offset;
 		bank->name = bdata->name;
 
 		raw_spin_lock_init(&bank->slock);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52ea0..371e4f02bbfb 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -144,6 +144,7 @@ struct samsung_pin_bank_type {
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -158,6 +159,7 @@ struct samsung_pin_bank_data {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 };
 
@@ -175,6 +177,7 @@ struct samsung_pin_bank_data {
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -201,6 +204,7 @@ struct samsung_pin_bank {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 	u32		id;
 

-- 
2.48.0.rc2.279.g1de40edade-goog


