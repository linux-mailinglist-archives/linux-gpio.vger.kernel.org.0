Return-Path: <linux-gpio+bounces-1655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144E8187FF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 13:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E014928BA5A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 12:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F62018E39;
	Tue, 19 Dec 2023 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="I8Jx34W/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382D1BDE4
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3365f1326e4so3204925f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 04:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1702990314; x=1703595114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89XT99hJVnEcS+sHYOhRqbpwmFtfYct0kRlYAqq/VFI=;
        b=I8Jx34W/5PgZGXsFA+8277gYgrAbe8P9xt5rlp/hsn4UnOcA7qLK7jZcMDP7D06sJJ
         GkZ4SNq94plmQbpXKp3/IElH9kU+lrYhuqaXVfi82rIOnWdirJtyizDuB4xjx5WjyJ4O
         YRvN3RWQ8z8RxLpstjugUzjHXZwnoWZZbFXue//LVGWkiEyUzKNLQrkoKxifAPv0ZUHO
         dmXUvP+LiI8tCxJuladrpGRASm6x6cunxjx/NLuTOlKe17zbcZmYpJB6WvxCj5r/Z6Tb
         V4fdma2jbz5+ffGJPPQPyii46bQCOGdWlaOHrDu7fWqg3J3wnTsLclg1Rrot82xDAQZT
         jRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702990314; x=1703595114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89XT99hJVnEcS+sHYOhRqbpwmFtfYct0kRlYAqq/VFI=;
        b=pf1J7tHKMszZKvYZBWU/o7eqGp66isFqeuHvbVq3wFT8KqLE/HfkijbgmpDwOoQ8C/
         uKczhXC84eewqZ/eiWOsxxykrtlzEatcsuDA1Ax3h5/dVtYq7hZTAK4ixtJy51kx/8Xw
         oDgdhxgy77pEYsaHzHfFB73iJUA17R8blHbh9xBvuLk3V9C7K/oWQ/RGs1oVM4/VDHZz
         d31KPOQgY8QrEN4An9p/0BH5oyByavwOktIRaRDYzSmCE5VawY2tZedk7oM29Lpbx23Q
         U+oNawBXiNsHGiE6oP2GMM3GH1I9I6kXorlW/N7VNz9ReZdCHFNNI2Da34NzKdGLAYRT
         T9dQ==
X-Gm-Message-State: AOJu0Yx46Lvu2UpeTtwSKWFnNlVGKhBZoL5Hp2D5jD7OfWts/uBlP5Iv
	M0m2+q5gofH30b0ocAFEVcAZ0g==
X-Google-Smtp-Source: AGHT+IF9zPFk92wnwSf/2JwHoY2rUwTiBDTbmKyXzbr2XhyiQz5K4F93RGLQXpZo5d3x6wz+F5rVag==
X-Received: by 2002:adf:fec3:0:b0:336:6519:9a2b with SMTP id q3-20020adffec3000000b0033665199a2bmr1869182wrs.56.1702990313755;
        Tue, 19 Dec 2023 04:51:53 -0800 (PST)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d4bd1000000b00336607f6630sm8311579wrt.47.2023.12.19.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:51:53 -0800 (PST)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: cy8c95x0: Fix regression
Date: Tue, 19 Dec 2023 13:51:17 +0100
Message-ID: <20231219125120.4028862-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219125120.4028862-1-patrick.rudolph@9elements.com>
References: <20231219125120.4028862-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1fa3df901f2c ("pinctrl: cy8c95x0: Remove custom ->set_config()")
removed support for PIN_CONFIG_INPUT_ENABLE and
PIN_CONFIG_OUTPUT.

Add the following options to restore functionality:
- PIN_CONFIG_INPUT_ENABLE
- PIN_CONFIG_OUTPUT_ENABLE

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index a8c7f00cceef..b925789a035f 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -308,6 +308,9 @@ static const char * const cy8c95x0_groups[] = {
 	"gp77",
 };
 
+static int cy8c95x0_pinmux_direction(struct cy8c95x0_pinctrl *chip,
+				     unsigned int pin, bool input);
+
 static inline u8 cypress_get_port(struct cy8c95x0_pinctrl *chip, unsigned int pin)
 {
 	/* Account for GPORT2 which only has 4 bits */
@@ -727,6 +730,7 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
 	unsigned long param = pinconf_to_config_param(config);
+	unsigned long arg = pinconf_to_config_argument(config);
 	unsigned int reg;
 	int ret;
 
@@ -765,6 +769,12 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 	case PIN_CONFIG_MODE_PWM:
 		reg = CY8C95X0_PWMSEL;
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		ret = cy8c95x0_pinmux_direction(chip, off, !arg);
+		goto out;
+	case PIN_CONFIG_INPUT_ENABLE:
+		ret = cy8c95x0_pinmux_direction(chip, off, arg);
+		goto out;
 	default:
 		ret = -ENOTSUPP;
 		goto out;
-- 
2.43.0


