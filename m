Return-Path: <linux-gpio+bounces-18281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2212A7D538
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CF9D3B4A84
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0552288CB;
	Mon,  7 Apr 2025 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K2zfGrKA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83381226D1C
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010005; cv=none; b=gKyi1UrgQjkpWxPje/V2b63DRnoIEz59vofM5K6i1hyzFayLlOeVsk8vgYnOotp5j0OzVSRdWUQ6txhN2SvGoGGbvtaZPQOmuCYg6/gFcogx31ufir9jvATD1xsNsQU03jc8Kzt6Tv6xDLGRGNVe26hwrpmd2ch29U8l2qxdySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010005; c=relaxed/simple;
	bh=oI8jFuu+5ewRpLVvmH1QLq08rzgici9rugihnGgwO8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srrp2qMuCFaZkShzekTHK7I1e/Lp/erelNW87VXGgAXT+Dbu1UE9y374cyOtoROTcpkLFhJti72/g7E9/HmGZ2H4ZSynmR4IACfV/nYwKBbwwI71soLJWoegvQw6Y0iuNfLdzVJq7dGGCKxLJ5EFkc4HI85H2coOWEhYzwaUqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K2zfGrKA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso20520855e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010002; x=1744614802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB1zg5x6R3SiUZ85Ns06SDd5X1MvxEj0zH8XpRThS6M=;
        b=K2zfGrKAXfq9NcieZIw2LY8YgS+cIgn1g3lU47gra0WwfQOcDEQl5KBtiiLDUNpsdw
         W0/+OflitSQl9f9ot42059OvbNFyk9m2ndyItJXJNU5EWG6NTVOskmahrRFsU/qipLk1
         ncp3BLM6dUoaFMMJDntjlsYUpj2Y3mfnuAS4dNlzCCfJw0xWEv5FYV5scf/HxKzvAbOn
         FXOx+KJo7ynuzv5lrrH8qs9iyDHOVehoBg7tIN6pTRJ3HF/HDqFJfPuPW+sGwewZUk0r
         zX1VYLejLplYwGCnUNI9obXelGyT3W5nCPceyYgbc8PSvJbwCJT0KCfs/h3sKnjlLmwi
         K1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010002; x=1744614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB1zg5x6R3SiUZ85Ns06SDd5X1MvxEj0zH8XpRThS6M=;
        b=qfv+Daw+IsWpbrnw7vJBbB3WRoS9l7bAuDVG1w03hu5+SjhPZeY7zQ6PK+FQfhPTGH
         CA6+sAGzdAaCJDMaP/pjcw9/4fxaocQ6dhmGv2iIc6nCEN0haCMxNeIBtxAc64GfCaLZ
         rC8IuAYCaNY4t7JFBmsIxiWC9fFomGxc8PnKUWi22UKqjSzJgb0MIaWv3PqYdg1oF5Vf
         2hdV91O/sJx/wP3Q4R7W57D2fGfB8C3DhlBHfac3kMW82ZXHSwvEwDe/N9CaWfSxhXTv
         BXVKks+xgfvTs2qVpmyvvBANQ22v+nVgK6aTiafh/lys4Vr6qMZAMOrwKUR22rM3HDWx
         GdCw==
X-Gm-Message-State: AOJu0YwenG25jXyj6722rxpI0qPXvjets2lSx6rPOrDtgw1pVmpHgyxr
	MTm9IXAVEHkEjAe/zBNSXQWDwVFoY7DzNGSD2tJyxx1Jon6ytRH1kEYwHcPq+J4=
X-Gm-Gg: ASbGncuvPr3/BoanuNx/CpHZ6ZN3RREojDBwI5XOS0nH7bmfr0fyKY5eXsnxKBhSIqS
	hk05BYycTUJq2aidRfq6kyC8FZFpgHo5AMBUcgOs0Oo8/vvoZ2E6VkJAIV/d68D0QdyHNrdfhDY
	llXnOVcMnE5PwKJMoR6+QwTo86JrSZjaxqtG2r2JqUdtSqZDkstNS100dJtxI8u2++ndaHBNv6Y
	FMtjrKXdfnK92Z/w4Hy4NVPRwGZopqbQgAcp0v2UYIrTHczVqVsT0PV0x8YXdJmcsYmxb2cFnP+
	NK0KFEn/u1VplNv27TT/IG9P8w4ucbHbrYhFPGeRM8FDJy83
X-Google-Smtp-Source: AGHT+IG+8TMtVOLwysJgLXWutF3235lf6J36NhuS+eEkLI9eABLh7Z4hMkr4mZwyVMSe8Wd+f1kxIA==
X-Received: by 2002:a05:600c:a013:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43ee0616fedmr85970475e9.3.1744010001770;
        Mon, 07 Apr 2025 00:13:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:16 +0200
Subject: [PATCH 07/12] gpio: graniterapids: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-7-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dvZDsrn97I/vO7JgDNAuyR+iCv5I5MBwDV+ZdiZtp8A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sJG73Q4jjFPBt8Zb6Mg8jP4uTF4MLMf4ktG
 JGHxv+rP8GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CQAKCRARpy6gFHHX
 cok6D/4nVkIJvxYEpyAaRfeyiuHoCE/wuSo+VCjbRPlpk7Ik/pHTuiz6bPepiV2lQVNRiCCu1Rk
 NXx7IJKLAEmTWc87kA5J1j3hrh/y+i7hiXuRmrXrmzCkV5a7eEQHlOU5FYQZysRDpMUT25cLX9s
 SHs5mvJPGwn3JqLaB/iih/QRxfKdVCLksRqIOnIl8BN/vzGXJKV8wI2PG1sItwDf7VWCirfbOlT
 1gHRw2+U9MZdPvqagXGO/JAVEF+b3r3HBNeAmU8JUmw4AKSmxShpwZtbOnaHn9XoHVmhmSLzk+O
 VfHfhbF69znTkdOONBqlKh3xT5GYXh6lQo7fn9j7WUL5mWRCgU4baebZ1wpRdvm4OY+rFl6B2bp
 w+pNJH6K0Jrpg1zlDOxANl5p1GGdk/6Uwptk2SLDIuGY3yaTyYJO2kjZmoBMf+T+CoYDccBzZQB
 dddhPZGmobWvRwC6BPUVVPgLbMstcQJ8EvdxaBCZfNt/uNpqouCWIDPfACeWsSTt9VRfMK+lQ8a
 3B715SVRQrChiPP565MmQGrqv6ZOc45Wy0WYGywbNihzG6/H5AOfdIrglPTXpBfiL3lN/h1gdpG
 s39skJWR3Pg6SVZ7UjTdEx4mpWRMUIpGAK1yG6Oo9SiopvVZSTgbZ+Labjy2K+r3a2CoD82gKUG
 G0XWtfPtH/eVi3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-graniterapids.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index ad6a045fd3d2..f25283e5239d 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -116,7 +116,7 @@ static int gnr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(dw & GNR_CFG_DW_RXSTATE);
 }
 
-static void gnr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int gnr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	u32 clear = 0;
 	u32 set = 0;
@@ -126,7 +126,7 @@ static void gnr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	else
 		clear = GNR_CFG_DW_TXSTATE;
 
-	gnr_gpio_configure_line(gc, gpio, clear, set);
+	return gnr_gpio_configure_line(gc, gpio, clear, set);
 }
 
 static int gnr_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
@@ -159,7 +159,7 @@ static const struct gpio_chip gnr_gpio_chip = {
 	.owner		  = THIS_MODULE,
 	.request	  = gnr_gpio_request,
 	.get		  = gnr_gpio_get,
-	.set		  = gnr_gpio_set,
+	.set_rv		  = gnr_gpio_set,
 	.get_direction    = gnr_gpio_get_direction,
 	.direction_input  = gnr_gpio_direction_input,
 	.direction_output = gnr_gpio_direction_output,

-- 
2.45.2


