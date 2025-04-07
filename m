Return-Path: <linux-gpio+bounces-18310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F3A7D5E8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E44A7A837B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2E823099F;
	Mon,  7 Apr 2025 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2v+8ql8o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB482288CC
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010664; cv=none; b=YrtSEnv+xc7P5y3ORfpmcZy/eQKpzi/mu08LE0hOFIfF1UeNpg4Md77zkMvjCB4TZcjCCZ2Bw8HZa/YfeLQawrz/LUWs3wBt0cNaLknZbahBc4UFxY23q3t6f0JfitEvsvVf/T3sYPFmqRY3TxqrzIKst13Lc1ltr8Q+Smv4Ubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010664; c=relaxed/simple;
	bh=46TsQHfMfuus2Y4N2Ujc0pUgsSG71cEeMP6rCE2Iukk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc8aux29Hf8So+QVMR8pdcAPWgpSPumb3Ncfp1vAULuMw0v2EvrwL9wYZGJQhJIkhuy5LHxdoWzTn2KniBtwqH2lL0Smervtgirk9lGfHL83EP1z7yQWouIHZFL2n/szEQEO9EO+KrfhlJ5YQL6VOe93qDjtt3yiGiwKMd4XiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2v+8ql8o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so39851615e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010661; x=1744615461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KkROuiXkCDKpcqyvio/9J/+1//CP2e3LnZSKP6f61Y=;
        b=2v+8ql8oa3C67rgEkAb3uEji66pP+rOQdUZjUm99XaFfBimxo5sTy303A2tPQAxdqB
         mOeYBsepcQXgoF1PM5GgK6pPp+DHg2Er8aMfOttnIAZPCAD8L84SmYMKxA/DYEGIjqa5
         Mf5F3O3KIw//xUpqT79kXkruB+EoDIIVqVprur5QbBlzyIz4/c4zwG7xxlJDJ2Dmlo4q
         6cR5h9jMIkj1pbJhuq6wZh30O6zmnu7PEskvvBckolCxy0qG13BI/Xln4WR5PzK1VRlN
         EwGULIc3HBskwfZ+iywbRPYW7I2N3x1B0GT07IVPxHsvJViSP5jWUOO/7xYBkJULtWli
         Aa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010661; x=1744615461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KkROuiXkCDKpcqyvio/9J/+1//CP2e3LnZSKP6f61Y=;
        b=VFzgl9y4Cb2aAK9CYU8nU3tJi72LZ+sDgL/yFJ94kuK7H2ZXplG19kLgpU5cSQ8Efx
         Psi+U/19a/lSmZ5i1dB3ChvpB55pl6vC8JH1XVFsKkSkDJ6WmsAZMwtxGA6c4xsZVNdq
         fqTiyNC1agNxRgaqIZcbLhAN0EFBpGfi1bmtDt60cF36lYdtWldQ+emK5d2/kTSQCoU8
         HdEoliWHOfEmx1xUgy11LlVVWJ+jqh4zfu3IKxBnYHGmpDliuxTedWlY9DoqVvKBC/ra
         ISoD6PpTBFEle+MKxKiir0q1I5PurPHP90gjiUwnQAFz2vNenCMqNWe2Ci4fN/GOUS30
         wNHA==
X-Forwarded-Encrypted: i=1; AJvYcCXw9vVH8ASH9cC8ZNPoJHpVCdiAECc3MdIgvsxYUg74WukdV+KuZSiN9dmWUr/CwJm9ogBoqhxeYyei@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4l+WZL7QjbxqUqHExoPvKoQhT+1UqQzqX/d0+LMBLLgomaief
	iPXazt6IMwhnmix2vdErQAtLqtUoB61mQ/fAnVzXe5oEl6eyKP+/WoIVG83yS0o=
X-Gm-Gg: ASbGncvsE3bpgy8CeA7myxcS+/uQzk8fdgPbVjUdFuXUpK+/8CYJYQoZro2CFrUjiQG
	yTs0t2WXGI/Z+9iu+6n7YChH2xYK/5T+ncxiBU+1AHBYQT8JZk6GBwgrPtLCW8G/Mecl/yRDzMu
	wBmQGi81XTFHZEvBbJpTETSaxZwcYIWdsnl6rReBjaKsP3LhQl2sUFnlxCu99gEZbKDIQkN/IEO
	soa6L20dmpNmZTopGLeAqkn63BGcrouiNTIZZS/609ZAL10tA1pLjzG6W95tl7kfR8mPP2YKlQ1
	xZeKeGCN66lX1p656vFt7P9sktUe56Go/PHxTQ==
X-Google-Smtp-Source: AGHT+IFtNLoH7gdKr+kyVE/8qt5O8vviG3nWzND179kXjnQR6oK2QV4EUTBGcSAr6Wgx1MkzEzIGiQ==
X-Received: by 2002:a05:600c:1ca4:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43ecf842872mr94232465e9.7.1744010660778;
        Mon, 07 Apr 2025 00:24:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm119855255e9.24.2025.04.07.00.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:24:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:24:15 +0200
Subject: [PATCH 3/3] mfd: ucb1x00: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mfd-v1-3-43f4d86d01d1@linaro.org>
References: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TF+EFt7bi6NiJtGjUB3SG25pVoTiUVHr1riDXGIMQcI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn832ggGtmHWHRB0jo82i+GFL3aUN1MFDemCit1
 rR5kPzXsraJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N9oAAKCRARpy6gFHHX
 ch7JD/4sIxMbN+qp3taFnSwWjK3XqAYEI3jwbJqEC21sIokHaETEU9SdplBDszdGntVuqAxHbUV
 GF1tgivckvWyBcOQHnZAwz9CnlAdgPb70BfWpi/yyOokfzHmFFWIVPUvrag1Qo1g17T293SMn0r
 0aj4x6AFrqDCfzEl3bxTQpZjcKa1qCThwmfF5DugUm+x30NiRmuQg0aZasa12aSnZ7lz+oqZxaE
 I4av90UzKS/bkcNz0B/fmlUrRE4RRxQxqTpvk56Nv+QykP9P+M68sH6mZ2DMgvjFYihYTNoDB/O
 G7ne/MHSp2NIlJRHislM657eqQYp1Gylr0OezdpE+i716faf3TKkqJonj/SlckwfnkqWsNpHR7T
 HwhWVd8f3E2L/gpOnDBd9IfT3TP/ncztWW6D5RXp87f5oUY8Jg6QNkmS/9PnJaL0HUO8kLZDDj4
 Tp/FCPeUc491T+ynmZH5X3Nr4bjAr1PPeG1jEyLazqcE7vUd8fBWZoFTqqCn51CnKJ6FgLlmAUZ
 8hd+/ILdLNsvUQJeLr/YPJ2sY5ItODk+iPhkTjwZqHtzhh4NCh24hH2qDBp0uVJfhJ8fcTbAW89
 ZAECjTGyBcnxSTYOlQcNsQpMFy9t1gdTwQnn6LIg6VRzMUxhsIRqgFgX8xzPxoXmvP5LTKirWug
 H7mkyD0SRy4m5iw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/ucb1x00-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index fc4d4c844a81..fd71ba29f6b5 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -104,7 +104,8 @@ unsigned int ucb1x00_io_read(struct ucb1x00 *ucb)
 	return ucb1x00_reg_read(ucb, UCB_IO_DATA);
 }
 
-static void ucb1x00_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int ucb1x00_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ucb1x00 *ucb = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -119,6 +120,8 @@ static void ucb1x00_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	ucb1x00_reg_write(ucb, UCB_IO_DATA, ucb->io_out);
 	ucb1x00_disable(ucb);
 	spin_unlock_irqrestore(&ucb->io_lock, flags);
+
+	return 0;
 }
 
 static int ucb1x00_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -567,7 +570,7 @@ static int ucb1x00_probe(struct mcp *mcp)
 		ucb->gpio.owner = THIS_MODULE;
 		ucb->gpio.base = pdata->gpio_base;
 		ucb->gpio.ngpio = 10;
-		ucb->gpio.set = ucb1x00_gpio_set;
+		ucb->gpio.set_rv = ucb1x00_gpio_set;
 		ucb->gpio.get = ucb1x00_gpio_get;
 		ucb->gpio.direction_input = ucb1x00_gpio_direction_input;
 		ucb->gpio.direction_output = ucb1x00_gpio_direction_output;

-- 
2.45.2


