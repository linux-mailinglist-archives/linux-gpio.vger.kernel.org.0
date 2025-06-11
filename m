Return-Path: <linux-gpio+bounces-21324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A9AD4C95
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1B218966CA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 07:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13E1233708;
	Wed, 11 Jun 2025 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hgK24EF0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2663230BD8
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626884; cv=none; b=YKHbAAZGFVUu+8MKKmyU6uofxceLldVYt1SJ2oiujKulXFQlfYO2QhzlsfCnlRmoFsFIOmCsfAraWPXaAN2Py9zA8au/hRlLhMUVbEAntJcULu1X+Ytlw8Vs+Cssc0GGuHxbFmg9s5kQiVacg9ceV/HoYRPPfP4Ca1esqi5pKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626884; c=relaxed/simple;
	bh=PouxT8/wcx9ILpmSgxCQsoaBvGqYtSxNMtkiY0xxIg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2UPau1lBLsePlkKFhcz+jzySrTZbgnzhI3mUEphkC0670wW7vhao3gLXhURWe/sEaH+uYhJGnZGZNtr7w4oVInbpvqw9auhEB4U2M50a7LEx9ZuVcWcSquVgm5s/F1f3CqqboAaOKhLPGU/my/bYzqblnhK94dMg4XqA8iChjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hgK24EF0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3875229f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626881; x=1750231681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDQFUaBpcFdo7BAW9qKIWqwPursqxpHgccCnfB4M+2g=;
        b=hgK24EF0RsEUdXBpvRzgiQrkEMKiMnKpsipXzNNcD/ISCBNnebUjErKbgQ3EoqkRfp
         TWU6VSVMIbiWH6kFPIILKxwbJgISB1eOUe4OOUBmKlcj4V2PcQuF71qkNFxstn8nZytp
         JUuWykBYT36uPNlw+/3WFgVUsHz4PgfD/5GLGdekgrzoD7NMIqJe6+xcXAJ5mikIT508
         HEP27zm8lezs4KtrTJJdW586tYDaxqQEsbjqTUBDGi6j7EDSOEu+DlzjRFMS0s1D2I0R
         ZV5+AaeOPjaKGaxuN366orgGEKWTtFUCwVAEBQwJ90+dfVX0sNxzLNjPOJnsIrBntZHc
         zq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626881; x=1750231681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDQFUaBpcFdo7BAW9qKIWqwPursqxpHgccCnfB4M+2g=;
        b=OhmhlxNP+DDFQo9nrE5HcUghccWoKWJl3tU2e4UwfgHmvC6aIVZtj4gY4ycNMZintk
         W7K8qt1BQoKdiEP2XKnik174U+zg2GKbyhQMuv7d/y05epNI/c7m6kQiQFsYWuueezAA
         smOPPr1W7PBaF/dOgGejwAfA9ff2P3il89ozdGRuqXSfqt2CWRHa4cDXSOYqV+KdfFRN
         ozpdb6V49olsCUSFSzKV9tbfTanGpd/qIY7GckJyt1aZUucCYoL2qa4jhQFu9BZcjffx
         ZxqapYZbrL6LyB8kGS72/q+LDDbkSY67nvXrvUAchcZ776sHWm2NMBmGZHhGm8Fy1dj9
         bgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNGcOq+5m8diqVXq7IoADYLUHhq6EMImtsKLQi+4tHJhLzTTLLc4o2VQgV3RIOKRNZsEV1fA/0/tha@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LqUneNBTV4zvmdxmOe3a+f+q/NgV4/lmCyjTRvhn7cinv3sE
	kk3//iVXA0O49nTGs4TMVzkTw8WBYyklMJQaYi+BoPdpCRzw2CgkIYlW8BxMHCPuJlA=
X-Gm-Gg: ASbGncvqY579p5ySgPuZE9sUHTkZ3+8tBaE+Bl0hnS/pbuFAButqRZwCNizz/lJVGJT
	mBqexWG4bSxM38r8VuO474dvbCr2L55hk6aHrCg7bqIKL8ieC5FYEFUjseLV8RjNwb3RaYkunQP
	EXc7dWBRyYfHrSS+rEnqd7h2Mb7N8U6/ucQep+GOGChTQ6Ahis3nzbrHNBrkvnJ7ROF98X17OtA
	yYXIaUztHWPOEKlrwjzgq3I0No/q3xcxuVIDwAv5/Rx3UUy7x10qQ5ghVeihu4tPMQQRhG2VqCZ
	HvLBSNc2bOFOOkKPqSFPK59xh1IM3u7qjKZ5GPybR/8wN/GhihQncGy0
X-Google-Smtp-Source: AGHT+IGiG3fUAwJmIC1zqW77bGn7Xb/Gq/+0n8hUHLUeOeWmdrObhllcG2HUigHyXHPea5oo+7hzkw==
X-Received: by 2002:a05:6000:4284:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a5586cb11fmr1345439f8f.37.1749626880804;
        Wed, 11 Jun 2025 00:28:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:27:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:53 +0200
Subject: [PATCH 2/5] pinctrl: rzg2l: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-2-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3MTlx7bJZQmY6Yu79zWoCYOs6t3uBUPc+M/VIDm8O/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/8wL1M+vhrKvglFzNWwTSc2zr2YkUb4nqEO
 U9Vdlv+7m+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/AAKCRARpy6gFHHX
 cqv+D/4g+kmGgMV5yOgvtDSnqNsCXfU7NI0BaNvcapUfhMWzXh9jSOsDHaFIZbyq+r3NA9/jjlE
 QO9uYscsRYFCYMZdIB4Fh9TtXQ0DroAsXX4iAKOFn6DIMNgxgKYTo/MJd8kKBipHsQFlgrCnQIj
 bJyXgXYOMsJxCUhj7D743jsxnHmV9rwTg85ixE7S8XbEHOWYFzx41DGnBOs/smbHyVIlWDCrbpA
 RJhw1BU2rPVNnMvw99gPos3sItuZQGWWTkrmt/gKkj9EIHdlHyjXAgfZvkLE8AQjpOEQuUT+Ytf
 /+Q1QWnZ3/8LWlEsH55HohpNcFdqYj99fkNQSyL4ocWZAmn9U70alxVUmfAo+gMxyYVma8UrtdO
 EvmcyQa06BU3KZUPTZFY8dMAqy3iL9cHk0MNxeQzwohKJoiuHLEvnvOlo02/ZQp+SIsvPyqrJhr
 rOHbSsMu/r7RkG1+hu1lbVnkiwUGP7aEbPDH1xr0rCOlYH3l7G2dnkBUWJZWx69cqVEvD5la1no
 P9q3BptGw0pe8jYJ/+IDyyrE5dVqnd/8zoVAnstC/+UHZH3EgT+5Oo31HKwT/UJebdobrHTm8oK
 oIHsaiNlHoeTCpepY8HL5mrV0dYJz/iQiB74/GqVrJcDQAg9RA2rh3D+bbBxP1sWTIAXx4iS1GI
 m9qGJtYhUH3UwhQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 78fa08ff0faa821d217c241aea116b0d6572380e..59c32a0d87f19b9ed62aadb698dfb1793882f91a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1758,8 +1758,8 @@ static int rzg2l_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
@@ -1779,6 +1779,8 @@ static void rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		writeb(reg8 & ~BIT(bit), pctrl->base + P(off));
 
 	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int rzg2l_gpio_direction_output(struct gpio_chip *chip,
@@ -2788,7 +2790,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->direction_input = rzg2l_gpio_direction_input;
 	chip->direction_output = rzg2l_gpio_direction_output;
 	chip->get = rzg2l_gpio_get;
-	chip->set = rzg2l_gpio_set;
+	chip->set_rv = rzg2l_gpio_set;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


