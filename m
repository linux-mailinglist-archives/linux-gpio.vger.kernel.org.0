Return-Path: <linux-gpio+bounces-18411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC3A7F563
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EFEA17AB2E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C5625FA07;
	Tue,  8 Apr 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P8xvML/F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0EC217F5D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095657; cv=none; b=kbKsOh6mcIHExw/p7irg95HmSFVHjiTsRm/fox0+wbq4LqpEfiEx1KWjeqA8ROKes0h+FX9X9zenrHejYbRP3w8N0jdDRGWr8x6EakskKradBDT0hqXdWXrBZtAeLZcU9bzM87E/iByv1PIuE+jjfcNQuzgG6kWIxZluYpuq89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095657; c=relaxed/simple;
	bh=NoUg2TnDHHEyk8qU/ZnZZqsQEG1Z4o006wd5jXnDuIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a+W0ZyOKBpvkeNPbN4E2i6w/Wv+GxNgPRKw/6tg6n79N+mhRHht4EthH+HVdcSDhP2Fp/5j852hvtbKruNUl+ExMeVgL47Nbi/QrVRE3+2EBcR7vx5Iv9af/57yY1gyvig2am3rAbzt//uwm0Yml2F/kU9LU60IcifM1vpu+1ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P8xvML/F; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-399737f4fa4so2760987f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744095654; x=1744700454; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umpvs4e0H8zbuLr+RetBO0tLGazgeKx6Q4Uu3VsrEyY=;
        b=P8xvML/FI9Zdqs5sr8WDHl1Qg/EnsmbWbLxV8ACJxp+y5J17dreSV1wRzllXAuvA9B
         vd6KoywV1eU3H6Nox0FLB5mFaH8xt+ZDHiXvVKBamudCRRTty8wGyWFTPMcvRY5NE4MS
         SX7jv+qOX3PwWSTP1LIB7xWO1hkLcz0pdq58LMuHozUEVnrFSQu273lJobJtR8VpZlrI
         kRpO4Vfdxoc66AF8E1c9TI7sVCXQjdJIYuLSOeNInxcB2J7q1XBnvy71CFrG8WkVavQ8
         LQAARV14Ivcesvxt0FMnavNkPDI339XYBX/1gUAPOt9dxU/QBBfDzbTwqOBCogsa0UAm
         aBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095654; x=1744700454;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umpvs4e0H8zbuLr+RetBO0tLGazgeKx6Q4Uu3VsrEyY=;
        b=VUHtkIFHf+MMv4sxl6tjxlJIHq62QASYIBtmsmnRW6TxFvbACewo2T3gn7yozB3DYs
         SB2+QzlKtSk2AyH4o7it9FPySwUrmXwX43pNFg4qbU7MxRuUkXohiZqkKaRqqAlQ7A7h
         2A9N+lBVx7qiO8KAPAXpA0uiGfU202h7unA23SrTK1Y7aVij1Rl7/6/o3mL5ijipTcH4
         iv655ubvtX2WQmsflAX6GsePWMOB5bNzi4GCQs3xdrjsdz3URYJBKISUvTt29M5ZEv03
         ZfLjbfhQYY9dsBCYTaIOBffoaE5FsJz9wAsC316rVMH5RRimhcvs283LKDBPM/HDd910
         RM3A==
X-Gm-Message-State: AOJu0YyEMtAiSl6+56HEusIzNVICgcwUtxdwFUz8UlHYVHBs4DVEFxaY
	AHAwKHz8WmmEXDgfcmvuo3vdD3qvKwjJSIzKwXT0Oq689f18a3102OxauRwrzJo=
X-Gm-Gg: ASbGncu7lj7trKOTfMq7/61KYpcGHTWZoNXkQg3vWNsm2pSX+bx8zQh36I4pUfAmVo7
	E/4TcijUID7l5IDbJsDWOk8g1cNLs8qaJr4Ym52VW8Glk/8ahMIwK/ZLdXNrOyFCljiGTyqcTyo
	NAraeImvDCjvGKTUi3X7mkoP6SipPcMBcu/Fmahcv4ck0i0TkhwQVVrBdb13B8zdmkYHu91KwNo
	MG3QMK7gUTFM4gi6/0WTIgFPNqQUMZ17uKBHcsc+ri571kN1h/vXgyoWjGX9vjQF2+dldoN2Zmv
	lcJ5l1oPItJKq6rfFfLpYUSmIYlZhyGI/sxptQ==
X-Google-Smtp-Source: AGHT+IGJtHt+1N2fHagU8IbWCqQRHDc7g0eJ0cG3FnbtRNZDgCzbwn8hanSEP+Tb37+n3Uy/BlN0aA==
X-Received: by 2002:a05:6000:4305:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-39d07ad547bmr11026967f8f.4.1744095653723;
        Tue, 08 Apr 2025 00:00:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm14383095f8f.98.2025.04.08.00.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:00:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:00:48 +0200
Subject: [PATCH] misc: microchip: pci1xxxx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-misc-v1-1-eb6345aea5cd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ/J9GcC/x3MQQqAIBBA0avErBtQQxddJVqEjTqLTJyIILx70
 vIt/n9BqDIJzMMLlW4WPnOHHgfwacuRkPduMMpYNRmHsfDpExcUurDeeLB4dMppr02w2jroaak
 U+Pm3y9raB+e2YZtmAAAA
To: "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>, 
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=V6OVxiSON07G8xZ20tcGRVPZRNprCBjB6wyZP9w4M7s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9MmhY0XUpIALivwn1nolJJjuSXs7HjSVjiXZy
 a5U1uOAdTCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TJoQAKCRARpy6gFHHX
 cg2/D/wIUnOEg6LiC/RTdw/khPfMPK5kdAq3vqOb/Kiwj9cMJXIyc10OoJ4DsZ3G2S989Ldp3Co
 90ODnTEdfPKCfs6k5gxOoJZx1Wc0Em9pU3fsFd96EqyZWuNnyJJi2N32RfN4p1iT0gMajZsYIQP
 B6VbNNZSa0eB9hVMTuc0RDzPcSXxFG6c1/4QQOG1hXDpTIcxakjU+HYN0CyXPb7MdWZXJRPaOBt
 40ajI7Xoh/VvyjO4vFdiiljhJZjD5ICE7iTByFqmlMrDgXHCyFAG7W6oPPPPnuMe+hiS/CDIZPL
 +guSKx0BscxJUyvz2Lv+xPWrUrQnMwhIfA7DWh2aDhv5Go8/04P+Dl8Wk3s9bcewbWme0Q5s14u
 7vNv+qbevcWGlOh27kHqLcToIoJX9/aUfeiELpSjrGfBZ4nDWaPmd2EtRxAk8GeJe/o2OVll7SB
 yLN3ErtRL+nows1/neer+sji3Yh1PNCwAn2DaVAiPv682UfqSV6dPDDNrGsY63Dkfp+EYUNweWl
 0hVeGwzhc8s4MLrozPnmZP5X07RFT+42PDZmC6scHYdbfPPEuVoM3K1MP9oLWUI68n8BcilQGVe
 Act7yTQ3RwCkm9lmDShqigL85cuSM/J8PHVw8lQmEopPljqi1FtSX2Ml/5HLCsUjHqCZsMQzKoF
 FqOyrhcj5Bh/ICg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 04756302b878..abb1901d3dc6 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -114,8 +114,7 @@ static int pci1xxxx_gpio_direction_output(struct gpio_chip *gpio,
 	return 0;
 }
 
-static void pci1xxxx_gpio_set(struct gpio_chip *gpio,
-			      unsigned int nr, int val)
+static int pci1xxxx_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct pci1xxxx_gpio *priv = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -123,6 +122,8 @@ static void pci1xxxx_gpio_set(struct gpio_chip *gpio,
 	spin_lock_irqsave(&priv->lock, flags);
 	pci1xxx_assign_bit(priv->reg_base, OUT_OFFSET(nr), (nr % 32), val);
 	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
 }
 
 static int pci1xxxx_gpio_set_config(struct gpio_chip *gpio, unsigned int offset,
@@ -345,7 +346,7 @@ static int pci1xxxx_gpio_setup(struct pci1xxxx_gpio *priv, int irq)
 	gchip->direction_output = pci1xxxx_gpio_direction_output;
 	gchip->get_direction = pci1xxxx_gpio_get_direction;
 	gchip->get = pci1xxxx_gpio_get;
-	gchip->set = pci1xxxx_gpio_set;
+	gchip->set_rv = pci1xxxx_gpio_set;
 	gchip->set_config = pci1xxxx_gpio_set_config;
 	gchip->dbg_show = NULL;
 	gchip->base = -1;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-misc-6061c12f5156

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


