Return-Path: <linux-gpio+bounces-21216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B8AD384A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2405317C894
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2E12BD596;
	Tue, 10 Jun 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vs7g0i+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D382BD001
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560338; cv=none; b=Q4aJE/gHJD5bjBeh56AuqLCl3bCoPBk37okpNYFKd2gauJxJqarfRWYNmI3L2UHQOeI3dAgR3rP60UJsrcc6saQLoML5UjzJ/XiWAE0lSCVNBePu8Owvk5KSBXhZU1uB0HI5CDZEw4m9H7S2z8PxMWaBsHmKcBOS+TkMgULtt3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560338; c=relaxed/simple;
	bh=DdvAUUlpfYflNBsr++lX3Sffa6O7XE3YDx/EEjD7pcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XExWxDrp2rwQSDpQmHNmI/Ifl4737RHoO9TNlgaHg/xh2HWrQlwz8LAkbsggMkZqtIinGgh1zWd7K1D2BOvtTuHUXz1pMBtfe2a8i/JnBoxzkI2CrfHT3+iRZAJkQEfPxGOxdQvmoYBqkFLLbkLigaG5w7aNaVRsYl+ZO/eszk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vs7g0i+C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso34253855e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560335; x=1750165135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2fx/CQtVPLgqKAQGUIys9feEJNoyOh+nIa3K3QYL5w=;
        b=vs7g0i+C3no14+8TWVhnRCZw0NjYedJV1h73gUAkM4GlGdtj9SDZ/pHWo25vWVA5Bw
         VPUIbmVISTZ9Uo2vaOsJVdGrRz5i4590KWhr41mU+6dz5ce2M5QTs/SyPWIlc3ON3FUN
         RDRd3Kx7QEucZbb/+ke9xPEUQ9d+mdOlaI+6fSKGYPo9JLHBWsCA45F1Z2AcbErdNk80
         KcmEXy35iYyIc37u6dxmu8OOeKZHaoLdG2NVd7MHHs35bCoAyfgQ+3HX+rh68GCH1SqK
         OiWP4/mLVria9nLl17tcaRJ+CxS0F2hohqAOzBGHS3twJy8d+gieGMcCsEd7cksoXtBK
         E2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560335; x=1750165135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2fx/CQtVPLgqKAQGUIys9feEJNoyOh+nIa3K3QYL5w=;
        b=Z9AhaqpOtm631Pa0LUE/CpJ5YIWxxzToztdHpULjo6lP4jJ3uSwYyPeKoMLnpG7Bgi
         NAeWZ8mLVQQH9LZWSlJfwI1whul5v1HcWnge1DgwsuLP5o+1P0B/EiHrUYHwThfAigIn
         Ph3bgEmwzKSR8nBRen+jT/bNHV1HPd7VDKFghv0JHMp4EDu5K/AQNfY9BJzIz0WVtKpg
         7RZqK/9XNB+VYxpJ0zSusRC7iQwSGgrHO7pqlqvDBXqI5gfKF6A5KoBCCmwWKaflx9Vd
         9qLUMQ0ri/gTxL+ebLCtxoD4IuGjgFQol4FFpOo4i3ZHVcMzkEFPQ6iNTehtS61nP4bD
         CN4A==
X-Gm-Message-State: AOJu0Yy2qlysenwvf1b/9gVjhXt+LHPithQUQIM8aPM523YwcM/seKb/
	zHE8tbF6SZaNDEqoh93Q4DuKu2l7sYofCpQ/e/XHKSSjJJ22Jwgj1NOdF4YMk22rmYo=
X-Gm-Gg: ASbGnctvrD60pyEzWg+vbfG1kMhYN8Rb7U+vglXHdnIy6iKM2/CDD85jrmMp8GuAj7V
	DIe9CtaMptZSJwOggDp+CVoUTk9K4Ubeb6w6S1JmhcBqSZh0ncqrpzOL+tfQMCPfZJyODlzMOGh
	HO1VsVHtA25KdRs80Ho43NNfzZTkCjJ5agh5g6AeygN5HcT6nsNaVyKtBj+f2ziMHqePs9q12uy
	BXcpyys4Xl3Ldr41olrWBY3bREy3vB9B+kfBITdnvvDDYPm1hPdfK/WTRCqNt/KFKYM5cEk05Y9
	hTUl1dpYyVjkP4d0ooYf1porFX7mN8RlI+DTpDDpEjBi5sIuqM8yfA==
X-Google-Smtp-Source: AGHT+IF+VHD3s49e6mkIi7baJjgBta7jhRVW7T+zJTDwVWSyLkMtpH6WZvfsMNjwBe2x2P104McBsQ==
X-Received: by 2002:a05:6000:2287:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a53188e420mr12880272f8f.29.1749560334947;
        Tue, 10 Jun 2025 05:58:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:58:48 +0200
Subject: [PATCH 2/4] pinctrl: cherryview: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-2-d7a773ff864e@linaro.org>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sQCPPAeXHrozxhJ3sspmTsp1b+UMiXj/1Pgwkfb/eRo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwLNXY2X4JtFYzVdb+ziESNPH6YyzM7IUOtN
 gi3WIyKNViJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsCwAKCRARpy6gFHHX
 cgvCD/0ckNOwzxrinNTI5YFdtzkyxslAiEfJyvsHu8k75/3cSGjeB3N0HqgCdpkRegPYOWv5bP8
 biZ/vhKj1VICyiSmi4Q6P3VLtPntDEf4uEpw6MOAs3/naM3eil1xknCxKJcwXKoif8fk3hgkEaR
 pJccbUa0S4Btrnnti+eBFVaFr0Tip/g2t87GFizMMCYwWdbys/zV8whbXSRRpFpTIXV/lZYgtbf
 tOLzWZvAq+eKzI04mDzjFLyojb3Xb94JVq/pt7vMpKeW9GkPw0LSrPinfQFM5y2K4L/MNfZhRly
 3gtidAvCQsnWUYxlnUJwTflV7rdz2ZSxh0BInpTzKbk6XBxfQbE7mkk0AKErYiQBg5ILoYSMvYT
 zyM1+qOKOjm2d8Dobn+/q4J7TKLiOvSOW/FsCYE0hYu1a2uzO9lpKp//1Ls2k2BxeYRcv9mWts3
 7diBoyTJHjPSEsJXn4vXQ1+BYrSaWBivDoLpSrkepbNqmmHWK22ChQ3C94y5NWD2VCRGGGtms5U
 IN5zSBYEOdFu3R3g0S8phWT1XmSTnxZw6JLsVu9SVFoRlpIp48JcraDCvL9Sabl2CWeqUnJv51F
 Vq8NBEnZrAETtqNW6KE0Fjqm4ZnwVp8utlHbdS/umHpPeikbrcAqN0qdcjflobRx8od2Ew+S+zH
 MTvu+FEhDl88m0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 69b18ce0f68588db30f7954a141641116c9094db..769e8c4102a5f64479201bd8f791d3f155e949b0 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1112,7 +1112,7 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ctrl0 & CHV_PADCTRL0_GPIORXSTATE);
 }
 
-static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	u32 ctrl0;
@@ -1127,6 +1127,8 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 		ctrl0 &= ~CHV_PADCTRL0_GPIOTXSTATE;
 
 	chv_writel(pctrl, offset, CHV_PADCTRL0, ctrl0);
+
+	return 0;
 }
 
 static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -1166,7 +1168,7 @@ static const struct gpio_chip chv_gpio_chip = {
 	.direction_input = chv_gpio_direction_input,
 	.direction_output = chv_gpio_direction_output,
 	.get = chv_gpio_get,
-	.set = chv_gpio_set,
+	.set_rv = chv_gpio_set,
 };
 
 static void chv_gpio_irq_ack(struct irq_data *d)

-- 
2.48.1


