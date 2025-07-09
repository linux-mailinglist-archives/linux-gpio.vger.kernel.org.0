Return-Path: <linux-gpio+bounces-22959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD614AFE056
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C6D1C413AB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138CD26E6F5;
	Wed,  9 Jul 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lfoCLKMX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9526E6E0
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043355; cv=none; b=LwD8hWS9Vlv/gcmG6YRVl3XdgD4DD2eq9Z8LNIb5DQv837Ha71e1854pDvLc6+UvUeWOi3tpu8nqhpkC/lWD+xuN+93HWnE4Cv/UzHncVAWRDiqKhcFjVKJ5YX05c9fyC4P2z5Illa3qTsTUtLgDGmmZn4MOvNuSLDNRWW+NijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043355; c=relaxed/simple;
	bh=6vWLxgEFqS4KTJDIuX6wLkk6F5oMpfGZvUfpEYMJ3MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrWlH9Xw68PE11CelnQ4qVb1D9qKmT2OiiDHY3tN9ptK87T1P48hJGaJBLtouhP3xK33ZUxz1hc1JYD5i/tQcPNmwBqnl1zLmS8ZsULsdEcZGiiWs3kpA5fCwdcnnKMgXQvFTjESPGaVwd9Gp+dFlRRKKkyJRhQ4efTswb83RTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lfoCLKMX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4021847f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043352; x=1752648152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxmgj9ZkJ5jurPImgmtTOMxeXOQfmg5em6Z870ZYXDo=;
        b=lfoCLKMXMsVIdfZCFZ11JJUiTpVATBv7eapdUq8rVtad++CgoW3hopB2x9Tp7ciGJq
         C13LHV3bbiYpwmJLQWwCRgAMcLhJe7zNIfuDpd52Tp53tFRuSTXtI46OmHiEfLhzNRA2
         0bI04fUzXXb/OCcgHPoZJo6SdqSHIJLZrGshwMp9g9XjNwiwyBjt4rSwaaE5EWjKhuxw
         b7dgnNPdlzca/WXlueshbbjNtJOQ9rOb35E0pM75gDyuc7GiOGqq2sRmoEvVYTK89Uzm
         S/cbQVSrLBJmQxywAiHvJdR/GlWGC5AM2LBDpF7X9a81UWBx8jE2/Co+IRvs/nC/jvd2
         ELRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043352; x=1752648152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxmgj9ZkJ5jurPImgmtTOMxeXOQfmg5em6Z870ZYXDo=;
        b=GXxrf1SEmshfh7Hj2mGffWARZiYd/Omk5v5YzCwv1qt5euNav6KsI8HJvwrRsJNOlI
         E3s6bfn4Dt35kNU+0ft6UYB1FUaDJ/udGUaOyIedYLrNOPLZSU7pM0G3YGJ7EoHH1ZOR
         WF5MEQFchjzL6k7ubS3o6N4ekgWMv+od9qtzZ0DBV1AVq2fFG+z2J5zF5nGHdGgk02D2
         FG3mHtcE7EgYLHbUP/JjSg7WsH/oN3hZd7taPjwglWtlLO7t/8frGJwYxK+w+ito0lCD
         EZQDhsPg97G8MGaujVlJSTdpYLsWa2tjzf527IgFFOEV4xPTbS7eYn0ypl848ApIsTDF
         WJBw==
X-Gm-Message-State: AOJu0Yz6AAY1GcW1e30A58MBrlmF9UeP0w3W80DNdmGxby2QhDhLdqYA
	7+FE3e9rDQxz8PD79t6LRQ+TKx725uM0TBbOKbuDW9CWOWFnwO72GJQ5MJxAv/IyQkE=
X-Gm-Gg: ASbGncuXjtWhz4/TZ7k1rxbTsUQLsi1r2xNiTLPceyDg4+SCEdTTMBXBfj5r3bSLEaJ
	CfML6AD2v6SFwsSmbk8c4SpTTcNx5wei5d8GyYccAmEcNoJ08QwzmR2i52sB797zcK/wvFNRGpz
	+R50l0E95NXNKqRCTIBo1blZpqT6/WlIeM0NSc62kSiwctmfytsHhOMvMLSgWVbf7DqjJwyJ/b/
	AUdVUqZOyWR8oXlKI2agnzT6LLOpnAxC3ckyjgAYJlUvBRQwQMYowT0cKkjrXOKT7SfmcNw8rqM
	jXs4RZyitC+GkTVUgqN0Dmc9AfafvysyktFKNMtFVynyNQ5iVxolRC33
X-Google-Smtp-Source: AGHT+IGa8OeT6Su0xQMb55IebOHa7FxZEnAgwgWyolIZA5g7MajlX06UmKPCAxL8NqmfqAXS3scFfQ==
X-Received: by 2002:a5d:5f8f:0:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3b5e45427d2mr865828f8f.55.1752043352510;
        Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:52 +0200
Subject: [PATCH 15/19] gpio: xtensa: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-15-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xOGYY5ENTKrRdSfcTsOuqSbkZ5L1bqtvDcfCIDUw09k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9ERYsDVKFTcLDqt6CETEM4apoSIwe8BI8yW
 ZZFc+MrCzGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 cpdED/0d/XUebBHliQqqKY5yPOQb6XQu6PvCh1bytyMvyLaMReMjHObOewAxXS7iyYPVRWIiNl9
 L3jwzjQvJUok7DM5ArSNPrQkIpbOAp0DN5bJCcjH9XHjwYvZmysbplGnzR3Ux53QQsVe/894eFy
 zviRyEFKISZ3jaEbe2mnDsJUBlzzL1tGIoAhlrbOApap5vTl0uzz706rnue574iw1dEoHuyeAIx
 Gmkjf+q1NRUtFFnQqw0j2l7F+4gdlq50vHiUYlXwSpeRQw1a3t5Y+GG0Q/8mEGxlcSsCFkW6DaG
 96+oo6gx7X11HBQn0qTNTuB/lXWcuPecqSnYF0exYLSGPOh40ykPRv2E79yCX6qCcYmtaiJytUu
 VP/hMQVlE79E0awK5+J+r2o8P36SfvUNdA1tNkrN6Z7f3DpXI9jqQqQ62qiypDiJIGwKPnG4tf2
 /wXqbJwRFEvoCQOr6u1plkbALucwzfmiqrcx8rIINEb8pcoYHSnekgvj0JT6gsReER07lt+AqzV
 GQbfrebKPTvkReF9qJuSOzPjt1CEX/7dxcJVLg5mBhv13iSpJTyMd8yBGVvqZdKrkP5e0MsbDPT
 bLVEwVRlRa7WZ3rsMqdypNzfPXsjLFbXbtw2BG33d0vOa1YMxZvl/AgNnSIFW+khgc6azrKH3wY
 a8StzwVcct8bC+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xtensa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 341b691ac2345b93320a6e8b933444d26dcf50e6..e7ff3c60324dcd11aa03348684bb4743a771729d 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -103,7 +103,7 @@ static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(expstate & BIT(offset));
 }
 
-static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
+static int xtensa_expstate_set_value(struct gpio_chip *gc, unsigned int offset,
 				     int value)
 {
 	unsigned long flags, saved_cpenable;
@@ -114,6 +114,8 @@ static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
 	__asm__ __volatile__("wrmsk_expstate %0, %1"
 			     :: "a" (val), "a" (mask));
 	disable_cp(flags, saved_cpenable);
+
+	return 0;
 }
 
 static struct gpio_chip impwire_chip = {
@@ -130,7 +132,7 @@ static struct gpio_chip expstate_chip = {
 	.ngpio		= 32,
 	.get_direction	= xtensa_expstate_get_direction,
 	.get		= xtensa_expstate_get_value,
-	.set		= xtensa_expstate_set_value,
+	.set_rv		= xtensa_expstate_set_value,
 };
 
 static int xtensa_gpio_probe(struct platform_device *pdev)

-- 
2.48.1


