Return-Path: <linux-gpio+bounces-21181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9FAD3678
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D1E178020
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6596C29824A;
	Tue, 10 Jun 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ETQA6UWi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C458296174
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558814; cv=none; b=pMrdUAMcQOBYImMgajzq+M765pe7oiJ9FdD7EQ/yboeKvgeJuUMX4tSK6yfMhFkHk3P6M230Kk/kRo0P1UjrK6bRAxYSROOlhBFUYJdGrT6KCcCxq8eTnpDnmwK3QtjDs+LdkVObaaC05hgPdNUJ8/O2Zp4a78QbYxx0rxZip80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558814; c=relaxed/simple;
	bh=0Q/v23KkvgGRE/jqhFxsdYJoykX4nfP6MLHY3t3sq1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpirofW+nMxJH7bM9wxah943m+GR0+yjQ54eKY5eMFbwLCmg8y+3UCuxVEG9k61MbMzsoxEWfzXlb1TkBs7H18zmyrKm74cU4f3XjkXhr7T5Zr1lg0VyRRt1isGaSqAtnMY9IWabXRZUMuj2jOAOrwDe1wY0xsX8Av9/If3L39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ETQA6UWi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5123c1533so3053028f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558810; x=1750163610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=ETQA6UWiKQEXG9Z+/FiRbYonJbwJ6P39Qm1fk+FCdfyRFmmIzNMLdSLFDRpVWEL2uM
         exQgN8W2UnqdUgBaN4Cuhou16qdcMuXfPuN1widJxYbeIHgSaYglMo9sHPW5FgazhUbv
         Gl7hJevfTuzpMjPVWuli8/zxmsNYQ1opGSG2W9SrtyGmUyVP/fWkQr1tA7MpVLHqA2TA
         BJhYGipMKvl0DZebSIV2GH/7S0ea0+pZFPFyrU+cIid/CxV8fEjd4Fd+sI/Zqu1YkRAd
         ygAFPvYmTdhZlLOMpvXKz9nmZmT+L2bSNVr87UBwlz5K38N17VZVGvAbXdrKyr85c8cm
         jkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558810; x=1750163610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=RIWljuT4qgnlCA+hjt/U541AJHGdosiOlbBMHvBx0SZM1ltLz2Gtmn5vFytf1DXAb1
         0PaY3YtBbYzrx/mFr4bGxCaBXxDPtVHF7PeGNbytPQssJsErI8n42z9RB9C6IBsxG9ie
         cRTRXrWIZSJWbe/Izg66hP77PlOluutRD+Ky8L/eY4wPYwIiNsjFf5zYLaiZB2517LLr
         FnQZ0G8yxDVL4+bH4IOUdb2wz3txvF59dzPwOYQXLRSw1akUSLmE9xFNqTOP1QVImczl
         VRjfI0WmT3GyCs8qwYVx3MC/r1IE6cxPvkinmM+PTIuyXVC+pDJXAbVpXqHqGoJkHRLd
         sAxw==
X-Gm-Message-State: AOJu0YwvAW7hg6VPNN7b2qRhxeajk4puSZEPuXPXW6oVLBbIuJhgjOeN
	Uh0x0Jpiq7BDDWWTIxXMpSGPTF6BmlWUihWUgZwQR4u3K8QU87DsYH6OufK1+JLXNx33Dp+GSSW
	t1Rg5
X-Gm-Gg: ASbGncsMK4dtAuS9Sth4OUi+sc5oDtv3Io5Ce2ciXirRgPpDPLeNs+a3K3EU8FPG1Mq
	6sfaGFrMHHao3yOasVYnIYLtaaKE/sIf3D5qFydWxuar1RQU1CSU9+bTk6QJq+sletXOv4kAyJI
	u0DDnvrN10o1PEq4eIEFYozOrHnzgyiuNnmzv9LlY5gkUof16uIwi551vgb6OYuKFuxyce5i8sG
	qANV8tPvE8nO0TotlMbFvc13o7cnYSfBuVCBVhjsRUBaGyozQ1EYzy/ziYMr86HNP1QvKf8hLuJ
	8qGgaejAJVC+del83ceCr+lBb2MUoudN+NN72oQTgDIEFIERk397tQ==
X-Google-Smtp-Source: AGHT+IGf24xBNhS/K1ZbKglpgFrm46LA9T2wVtmfcyS7odITVr/pCroc70/4xTfamtgoFjylllZKEA==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr13192942f8f.57.1749558810273;
        Tue, 10 Jun 2025 05:33:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:17 +0200
Subject: [PATCH 07/12] gpio: msc313: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmOs9Rn2Ofc7KtPnQgf3fHbIJejOw5G9OgMOgcVcOTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPS6rMr9JHakl/jEzS6gu3nnJM5OwNcNdkw
 pcSFpc7hKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cvrUD/9GpMmudRkoErJ8Jc3wJWG5D7s/6ppxZ4bAKfLPHuIf3cullW2xXMdGEisXFnYba5VEHpt
 VlXc3SJRZDpOEvM0F3v/+jUIZiuOD6pvawQnW/qxtq/Ozv1UfpKrpuN1fRrh7pL2XMWCAwwRnUw
 aBDKVyyJlBxP2MtvGqRaa982whCS2SZd6kG22Dddodz3o3nAzrh2kTO1S+fWFysy1uyhRTTIlpQ
 cXCVQ1wQMGQQOX44beuLfNlLd9SEPnqHDgf0Lj3MudgUqT22IGiNR10kwDiB3wQ1raD/uYBJnzl
 8vxKAn3c0fCywJcvMFP6K8S2ZAHGytispiNwpf8Pa9l06WV5vZCyzZswFKsDYk8zO45sEPi2IYK
 skKkUVLEkgJycvjqe9Z0PM21t3y0NVWKx5KjMcH6+hefemyBEzaHcFyl5ARdxki12GE3lCixf8f
 RHBvPI0sed+6K74ffsqTELAk4EffI6LaNvWOSEG6F6OvP91+rEkaHy/kCIJFTo7DMnnu+SKtCLB
 ghIRIU0nZmltloZYikzkZfcgB8uYVjw5f42C9UGksap9z2d2juN4inFBf0R8psL7OAHQB7occ8w
 nuAi7PvG6Lmjmnv+Hq6TmLCI75PEi8A9HehvhBXXbFG1lUF0a3ELPJqeFHbc8O3ZLGrwJsZY5KR
 oWc3lgWCenglKuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -486,7 +486,7 @@ struct msc313_gpio {
 	u8 *saved;
 };
 
-static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct msc313_gpio *gpio = gpiochip_get_data(chip);
 	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
@@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 		gpioreg &= ~MSC313_GPIO_OUT;
 
 	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
 }
 
 static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpiochip->direction_input = msc313_gpio_direction_input;
 	gpiochip->direction_output = msc313_gpio_direction_output;
 	gpiochip->get = msc313_gpio_get;
-	gpiochip->set = msc313_gpio_set;
+	gpiochip->set_rv = msc313_gpio_set;
 	gpiochip->base = -1;
 	gpiochip->ngpio = gpio->gpio_data->num;
 	gpiochip->names = gpio->gpio_data->names;

-- 
2.48.1


