Return-Path: <linux-gpio+bounces-26030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A495B547A5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6EE3A33A7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB132D6E5C;
	Fri, 12 Sep 2025 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGyzpvQi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B928642E
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669057; cv=none; b=indP2Y3q32G5ERC4wKB+IudPnosJ4Cf2F3/Sf+52AfjJHd7prnbe5HI0CbVXU2yYlF3N09g9IK0D0MMEAbfICohFu6tAs1zK6BNvcZgq3lpp5FvlFONAk0BiYNsS1FjCgixq2buoRwomurJpqY1BxyNuusfXVSsOuvIC0F8ORcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669057; c=relaxed/simple;
	bh=tRJzunUVe2K3c4/6UwQXO9iXv15BUdIvNnjbOzjw+oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwelbhmeDkF9YcuLEjgy/cOW7VtTUovglI0vL5zTk9gDvZ/lMp2dnuSlul9VCh1fPTOTeArYVTa0i/2RW/Q5bUTsdEGoUz5vJBusBhX/obOethDBDA6d7fKcWPC6EZV3L4S+WhAUgvhqtqFi6rTYR9N8o/NsC5iAnlqjrGKGhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGyzpvQi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45e05ff0c86so1876275e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669054; x=1758273854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOviwQVOZASYbKzQVeCxPKzOJy49KCwq9xAVTlkhfD0=;
        b=EGyzpvQimNSq5Y1cIanyFi8HtrkHB3RIIv/OLb60Hxn5mQJ/vWrcBnNlyb6bwNuBHD
         0M0Ehv4XplEqS7Xme5MKZi0KqN++B3PeGereHGeXL8Dd1HzQN5UclJM9UxXrzqXD7IpS
         QVSEqVa+yt4lh5G5YM2R/BmJ1+n7qKSJpNEj/O/zg5ZyMqXMMD2y76MFmv1Iwq3gBHPg
         8kG1bSVrSRJ4H2sDbbT7rdumzuo1uvsKRKDvccOKvjXYAaS5dnj0tYFMYxUq66RJXGzS
         OsnryTDUIt8Wnnq+HfHOlGdPZCRABn+9BHUxIkHin4yo40jzuArUd0y+qJZNIC3k3V1U
         44hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669054; x=1758273854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOviwQVOZASYbKzQVeCxPKzOJy49KCwq9xAVTlkhfD0=;
        b=bvzU+TBtgAnqO21cImDw/0WWjHhmAazLYHgfPlqVjuq+CQVjdoQWvKdPXkdH1PUL5Y
         PF6bc5dXVekxyHBbdWS5JBi+6kQ0W8sjx0POlMTvb1f7K7AZDIfZOh72mi0BT8lrMpId
         77DPJpEV9k1n3zisTgPrOa0Kw7X1RZY04Es4/3ADSZjKO7wppQZcgkv6qqOGwsMkdals
         eo3YfjSCN0GnyGYCFOBMqVTOsdGkQJTR+3Mk9UQJuFX+y9fcv/s6XEo7oV2stpA+tlTU
         ATirm6LPB4dSdGaOnzEDbUW5sjWbb6YRrzwcsIKm4E3OQsgPTQT7mYwQ0yhpuSTuc+3t
         GeMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEPLZBk3pDdqkfFFCatvFyJm4Vy1kDkTfJptxHzx+rlj9TOC/pk4cOc2tAogBgGan0O2+9QKi2qu/4@vger.kernel.org
X-Gm-Message-State: AOJu0YznTZ39NHUz5TnVxW+YDJwq+UDj3Fgvg+GpEWKhcUDylml/59Z7
	3kf9xiKmgJpJfPi4BHAES2ZGmVXEg+ps37RSJ3iyWkCNJhBPpxEQ/jgulqiP1G3SqC8=
X-Gm-Gg: ASbGncvLoh0ckk9cp5vq/OmwrCJnrbsuFjTiubzt0MMeGvz0pdaengmo49CCwV0WjT4
	0yC9kL4eMFYyRZij9U24E52TBOzLjtEl/GsDDnES+2MGoLpZm3HtqwcBRKu0pn7oCi3iEO/FMzg
	NQFKLRWJD5RGyb4YvOeGEPqQ0o6+3xsAo4wT3j9dPm19IL5cE7hLPvzXgfmXEjlKmX+BRg2CPYE
	IXy9bUnnT9oqpmsxkM+yYaos11+bbRkzEEuSVEylxDRBaIRN5nVj0FjksXIHoB87AzwoyRZQD5K
	2pjCdeKmMgFOCOoV/0FemuiIK1/3V/CTrl0wPPH/ewId19Kt4RTql0CymJ3o3cI2WFjyq4KTSsv
	FzMMPKsjJ4iZpCRHHzX0OtN4ksQCMC6kbRA+5/iXiAkrx
X-Google-Smtp-Source: AGHT+IF2RKjPHU5PyyMu6nXLRqroWat3tSIrw2IuPNtUNZFe81YtcX1shc8aVwj2VyT1I6rhWLSpow==
X-Received: by 2002:a05:600c:4691:b0:459:dfa8:b866 with SMTP id 5b1f17b1804b1-45f214afb6dmr12047775e9.2.1757669053738;
        Fri, 12 Sep 2025 02:24:13 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015ad780sm29696035e9.10.2025.09.12.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:24:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: of: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 11:24:10 +0200
Message-ID: <20250912092409.162426-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2855; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tRJzunUVe2K3c4/6UwQXO9iXv15BUdIvNnjbOzjw+oI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBow+a5cIPMku6YiL8z9OgIg+yldDDyqIzmeH9cC
 GJ+vyRmeBSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMPmuQAKCRDBN2bmhouD
 15oLD/9Vd4aatYqHVI+A/qBGNkv0k7CR9r+TT0RPFwYSBCvP/OVRLaG3QpPCl+5s5USMX3amPK3
 lBzwZ7bOBJYBoC02q0GV1evQJUO9qvoErzm6jLlKs1F//UJEjZef4iVu/y1YV6ah6A4GTVfPEfm
 ORLtAIqksjmI7bQ6tiWUW+z4UXROAzbf9w3TCsNKXI+ARdwv/3AczExXtVSrTd53ky4oooHGL4Q
 otjZe74jWZjYJ6S8eKxzkLUuEP5c8Xd3k7gU+w8XswafssszqNnSOXPgtDcMwuSQVABxphMQVR+
 DLO5urLYI2SuxAWlN9r4IkRRQjMJoodWYzQLrqoLNn8B20G1aLSPzENyQmOjOn/DEgJFaJ+qS9F
 WtWdx6QxGWGKRhTG70CbnHegjfkNPp+ldZEbOqx02c4y8PoYq6csaPHXzMZ0Q1oKscVTQ6BKq7D
 41gXOU6MhBEVCM9DxCMy0VgWaHoZsefybUvwYdHdacAs1jNmuRessEgWdII/UjGJkj6IT4TYseE
 v0k8K9Z1QQRXfIYLF1F739Ar2WX2vZBSMJYpTONdgYArCknQsQMxDfWXpx0eh3uQFQGrhRIKL4n
 ObcMi4UiCpsOqKoXWJ+aI6Um1eZ2OW/m/J7zB/2zjLNzztDCA1SRwgXJb+tZLe2NvGtAqCcSg46 kG75Q69AXQns6gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Print full device node name with %pOF format, so the code will be a bit
simpler.  Code already uses pOF in other places, so this also unifies
with the rest.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 37ab78243fab..bf17658623b9 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -160,14 +160,12 @@ static void of_gpio_quirk_polarity(const struct device_node *np,
 {
 	if (active_high) {
 		if (*flags & OF_GPIO_ACTIVE_LOW) {
-			pr_warn("%s GPIO handle specifies active low - ignored\n",
-				of_node_full_name(np));
+			pr_warn("%pOF GPIO handle specifies active low - ignored\n", np);
 			*flags &= ~OF_GPIO_ACTIVE_LOW;
 		}
 	} else {
 		if (!(*flags & OF_GPIO_ACTIVE_LOW))
-			pr_info("%s enforce active low on GPIO handle\n",
-				of_node_full_name(np));
+			pr_info("%pOF enforce active low on GPIO handle\n", np);
 		*flags |= OF_GPIO_ACTIVE_LOW;
 	}
 }
@@ -347,8 +345,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	    of_device_is_compatible(np, "reg-fixed-voltage") &&
 	    of_property_read_bool(np, "gpio-open-drain")) {
 		*flags |= (OF_GPIO_SINGLE_ENDED | OF_GPIO_OPEN_DRAIN);
-		pr_info("%s uses legacy open drain flag - update the DTS if you can\n",
-			of_node_full_name(np));
+		pr_info("%pOF uses legacy open drain flag - update the DTS if you can\n",
+			np);
 	}
 
 	/*
@@ -625,8 +623,8 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		legacy_id = gpios[i].legacy_id ?: gpios[i].con_id;
 		desc = of_get_named_gpiod_flags(np, legacy_id, idx, of_flags);
 		if (!gpiod_not_found(desc)) {
-			pr_info("%s uses legacy gpio name '%s' instead of '%s-gpios'\n",
-				of_node_full_name(np), legacy_id, con_id);
+			pr_info("%pOF uses legacy gpio name '%s' instead of '%s-gpios'\n",
+				np, legacy_id, con_id);
 			return desc;
 		}
 	}
@@ -660,8 +658,8 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 
 	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
 	if (!gpiod_not_found(desc))
-		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
-			of_node_full_name(np), legacy_id, con_id);
+		pr_info("%pOF is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			np, legacy_id, con_id);
 
 	return desc;
 }
@@ -687,7 +685,7 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 
 	desc = of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 	if (!gpiod_not_found(desc))
-		pr_debug("%s is used as a trigger\n", of_node_full_name(np));
+		pr_debug("%pOF is used as a trigger\n", np);
 
 	return desc;
 }
-- 
2.48.1


