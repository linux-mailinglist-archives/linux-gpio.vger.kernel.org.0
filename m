Return-Path: <linux-gpio+bounces-22962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D19AFE059
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9E516A9D9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B3528312B;
	Wed,  9 Jul 2025 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lXfHQojA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D927FD71
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043360; cv=none; b=efK9SpLOI7isf7XUwe+OMeDKijtAPeZB5JopJMwImTrqz4JpNc6kPsEaQyBkIYC8NIWVkJIwGQtUcTh9aCdd958thLDYkw/8OwMrR/H8Hp8KbmNsjj+TnxJYi9AlOh3w7BF0876/1LyN0/HWyldBSsRcYSkp+OYmhQnxBsCIeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043360; c=relaxed/simple;
	bh=ue4Q4JSq5Ul2Rj1GyOmeAMlOMS9PP0+lWjHpADFV4S0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oE0fXqSAE/1cnlWeRKfLhZs1jCHgJxDM8LHUItH/CgXE97MiJFHNr76uz2OKcQgxXhdWKPYTA9uR/zq/svd5iXOe+R9HPIu59WU55RxCk9xc8cnlBjfadN7+9cFCuuT+TD2RjdCgt17Lyt95/ivAbxamiggLcO6fnqSByGp3pyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lXfHQojA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45363645a8eso35981245e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043356; x=1752648156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kni8rM9yohp8QWkfPh22xACO4uj977q/kgFbK4r1YI=;
        b=lXfHQojANU+XbBQ5yeRDkE3wxyF9v4fsmHNgYdJWxFjVYyVPbjBOVl9wu2ZaPbX69o
         4TVavaaGL1Il0NYpSkEaaiduj+eJqglvMWQv7Xr8kB7IFEgYBf+J/jCGbuhvpX6EphhL
         4yhM1SgzmciDCGHkJjWAr9sXS0wlb0W2R/Stk0yU2DtHAk7RfebuK40eOElMPAUkE6tB
         Ps31Nc2g8ZoY7urGx2ZiVvM8eGfiDKeUL2nlgKjoyTm7Dfwb7SYkVjAaxSNvE8CkIRaN
         Oalz0z4J2qRtnRrJhXLAwvirn2t6zTAt1Tcu6HTjYsY5+KqCQdYO1CtBZoC8s4kxdOu1
         oV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043356; x=1752648156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kni8rM9yohp8QWkfPh22xACO4uj977q/kgFbK4r1YI=;
        b=j4IvfhnZAjld29/kS85kBPu1qV4Feca2wx0pVxSTvAEX8SQGg4ohphGQ3lFkzwxi2B
         QtX1mcWAng413clVNtLrtcTmgD5YugnmGP6GHczlfQU9pSSYYxqnV+iRsivkazr+ZRoY
         5l8wkfmdXuU0X9Ck3wJyt0Uth+ZrM0OZEuhT4wVcXcnZTPHfNu6bIXnj7HOym8saQUgz
         K/mZHplIa3R5E/16fLibnYTP7O+j49scKGGfNYNAZpeojhuowdafESxUgWa2AI6NkvWu
         RwRf1/GsdvlJajadRCjyb/OdzawFQqwJsaNVU6TyJiNT+/Phf5GZD5EhYNOoUJxEGU0Q
         knYQ==
X-Gm-Message-State: AOJu0YzNRDaJ8mFzRGUsiTOwDfqq7WFxCz4m1dqiaTNjmBnPQ32lwQBh
	lN+t7TkjKBMfflG6nRoZRm38xpzjgBaZ+F8+YYmPY/aextpJmIfWfYTLmgVQsCQyN80=
X-Gm-Gg: ASbGncv7S3EMAQUcZA3GoSwX/RFgkDOS4+uHOGLkUrb0YdQgQpTDQOFaLgF5Cc5Jzh/
	JW8r5syk56bCtpFQNMM350X9mUvh2Q7C/rUSVIY6bi6vApSw++yK5GO0uqcwmtA+mBR2s3WlegT
	So1rdIr7ANh/DLS0z3lvSZkaxOE4Fi/Sl9Al1vE+1eUh8eLdQtL1tJ4p4K0ROkG/Az57X2kjnwO
	S4rkS4c8LZh6Iq0QUbxEUmnCilwKZbqbgilP5zEghE3r1d7o37M3+Cql2SND41qFTQG+hW4XVX+
	Pk9JQDjmJnQuRPREnFbMUygVvb0cHyQn3mYTtNQJ+lu8du5txnrMkOHb
X-Google-Smtp-Source: AGHT+IHIVDR8rddjy7RV7ZbbuRADNMRvR7rlZ3ZGeS34S5+8FSs5H/zQ9GNc4Gl4e4fKiYZOjpN+wQ==
X-Received: by 2002:a05:600c:a205:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-454d60d5911mr4376595e9.4.1752043356135;
        Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:55 +0200
Subject: [PATCH 18/19] gpio: zynqmp-modepin: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-18-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+dlpJ7MrL9mChGkl+8FCGhAb1GH2Nl9pZqi9frvclsY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EIIDF+vQFIBY/FkMRWNfVSiQi8ty3QWnmd
 cjFnFvQYtSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 clPBEACMBKXxXtSp4qeKszk2Sd0wYBkrTcQuFITgefg2aEjcU6z3wTea5FGrGxYLY1iEKuLKns+
 NjQeqCxgmAjXhA1LBhrBIDzgm3sYdDMmtr48b94aDG9ScZ7vJh7hgrN2kQc+EYMffrny5Wb8Rth
 QjNVwAvohyPCTbIftFeluuGA6qGfaJJqemgxG5epESDeFUpPdCl7K+VQlvnp6uhhJhYHCWIQ1Wp
 /ZJuc0OpW/BkN1iupYZbViczjN3FQkMF46nSIcDbKjNSuCSuOSylyQnwiFOF/UtvLyiYjVFj43D
 Rq6p6+XESNN9CWXhhZFqa0HjTzYFsxFvFe2vDDMZQ5V2j9eejb9loNSTvbhVHCFzjL1MsQ63a2a
 Gto8Oso+5bXhEQlisxE7NrdOuAh35t+CqaJQPGeIblmAXKV/NdsuDLGdC9JwcxwcGT9uvTf+JOB
 FhVvS9Y+w18azSeTEDk9+cFOJ880GEeFAv65KYFswQ7nThM3Lmuwp7VSDPao1oCxs8ONbOWN2ZM
 q5cLeddMK794+Ji2a9dTcSQeXysGXzKsFw/s12dVTglazmDEbQVLKZ19bCUnNoXEYtkBCEWm/bc
 4LcwaoW33Sjd4Nhz6QAkD2D52MJUAvbpEepkQL3tD+eX3w3KSeKZAoFv6GrWezD0W5SdgF8dWgV
 cE5aGyuT3IERIYw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zynqmp-modepin.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index 2f3c9ebfa78d1d6bc4624a614c316e4fbeae2aff..36a547d6fc5a5c100f81c72600e14d620a462cc5 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -57,8 +57,8 @@ static int modepin_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
  *
  * Return:	None.
  */
-static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
-				   int state)
+static int modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+				  int state)
 {
 	u32 bootpin_val = 0;
 	int ret;
@@ -77,6 +77,8 @@ static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
 	ret = zynqmp_pm_bootmode_write(bootpin_val);
 	if (ret)
 		pr_err("modepin: set value error %d for pin %d\n", ret, pin);
+
+	return ret;
 }
 
 /**
@@ -128,7 +130,7 @@ static int modepin_gpio_probe(struct platform_device *pdev)
 	chip->owner = THIS_MODULE;
 	chip->parent = &pdev->dev;
 	chip->get = modepin_gpio_get_value;
-	chip->set = modepin_gpio_set_value;
+	chip->set_rv = modepin_gpio_set_value;
 	chip->direction_input = modepin_gpio_dir_in;
 	chip->direction_output = modepin_gpio_dir_out;
 	chip->label = dev_name(&pdev->dev);

-- 
2.48.1


