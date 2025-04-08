Return-Path: <linux-gpio+bounces-18426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982FA7F5F2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFED216B379
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E057262D0C;
	Tue,  8 Apr 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x4JwsQuf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D52620D3
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096802; cv=none; b=T7aqDJhuLMXpfmP7U2jrv6zhc4iqqyn9hQiyIPRIluYZCd5rLtqMuUw+W2A0BBWUzSXC2W4BjMBJy1UUwvPCDdvcRge1wyAnGKtc0lab5mYsmKKO666jVvSpZmJLfhsPwCA+guCOHMGDiGAf2g+dJC9BGAmIRUibPfkX9d8YEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096802; c=relaxed/simple;
	bh=sShqp1OG6UzQmWXPboB+sq77y980YHZYBmhVvusKcpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4e4+kqrvdwRFyK71tdk9EdofWgWj8tM8b1GxW0uIbsGtoXw3RnXumRpJqu+LzAlWnq+NH/rsAhd4XbsK+LgO9FakIzCe8vDyksVla2+TlDWshc4YNfWyQE5f36Mmrkveg2lEYdMj54GJM8pRzuieZFg71l6LIsriFQkt3h+Aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x4JwsQuf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3177739f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096799; x=1744701599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUcRoGUFSmoPY+d/cL7WrlmVp5gIPvEUp8G2THBFhMk=;
        b=x4JwsQufZe0nbQ6tzkAU0SU67UjxIC1dO7/k+pdErWeDO8+/iOxOO63bno3j45NrCf
         EWG49PWYXFMrTUJJ2r1HGBnvGpPONnDPK64x8/a7SlX3NreSRfJpncyzX/wV6mFRQpN/
         ybmJBydIKruBO8FYEpxQ4vmnBieXq7C8BdRO2TzW3f1dytpuVxXbDO8IHx3nsKJNExAF
         B4MtjHT9ZF7tBna+wYmau9qgNmp3WCn7fJfX7Bx6lV+vK6i3z2s09PmcEuO6W3SF8lGQ
         tLpjBccZLoKJ0Kx1MzuX2UmfNrcX+KgExsYcumwTKZVfuPVbjl01n7yTx/jeAFnkUHOe
         yxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096799; x=1744701599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUcRoGUFSmoPY+d/cL7WrlmVp5gIPvEUp8G2THBFhMk=;
        b=jfK4WvGr3EMeOokJKLK/Teo0reQ9+pipt1Di9gTrmlOmic+/xcwKIZufXsoIrhUJOV
         0BOxj832IiwI+xsiEYuvv3kvAKJvj9V+iAQ2qoy3ndkwV77CTHB9BLpfWO8UQAO0Na5T
         tTXY9IpG2hjf4eQIwUZamGAH5sGA6/dYaT0NnsbyOJgnfvjzLFv3yB3psl5uM7ctCNat
         iXK5mzg4VGfD2/E9NTXS9UoTVdheeSmL6ag0ACBTKMn0kgdQZ2JkJmDjdThO5A/XpNG5
         1BwX5JF4isxzBVc9xdMEskuazG+iJVZPlSlHJFdLf+n/9FOXTdDSl7xN3kZQAc8i6kT1
         H0bA==
X-Forwarded-Encrypted: i=1; AJvYcCXlxVVIkFuHZytaP3BUIu4DqvMUSq8vDeiUmI3Ru3t8KB7hipRBW5gJaD0kE5n/H+xAQMKZ8Sh4RHXR@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRXYDwiaUAUcO8UxLdr4hMenAYuctCpdQ9UDMwgLRsE8vz4/u
	oNMmAbwqo7l6jfyTsCmiOc8atZylRGIl+YufDnHPfxRGrOQWym/j1rPSpPtJBI8=
X-Gm-Gg: ASbGncsZNIZw4+0h06Rf7sewuzsZqNdHJzwcJUPhAoA5td9oQhTiD3sC9SGcCJQ76Jv
	zN2WIZdGbyy4b03isTXN5nt5XKp1EGzjiywsaEyjoM/UCofBe+O55aaFl/boUaYIhAHkIzVl+0/
	1LC3hIdc1CiLXkEVeeQp6GD90cD6C6Nt4Ak05ch2/yHbFgXpha3gH2HvcIHPGkLqURMKW+7PZvM
	ZorizQD8whUGEdBkP09rJ2D52p9eUrZ3shn7MxEDWvI5MVIB2/qI2l/XpBm0C/WaAj1Huc8Ng3D
	rqAhc59vb3XRb7WIIHFJrrbKkfHE+QlrAgSOWA==
X-Google-Smtp-Source: AGHT+IFcB4gkAeFTfcCzb/N2afVDgfBGxr70AKsKJJ8DDnRef5DxEbrBcldQtcrZ4UJzZfAJRHX5wA==
X-Received: by 2002:a5d:648a:0:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39cba9332b0mr12081546f8f.37.1744096798842;
        Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm13882872f8f.23.2025.04.08.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:19:55 +0200
Subject: [PATCH 3/3] platform/x86: silicom: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-platform-x86-v1-3-6f67e76a722c@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zGzPAe1FrCR6IAcgaEbtX/r63pSis90sCeIpOahYRzI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M4btWQhTbuIhjAMDruf4EOKZZYOjT+a4D7MB
 UwHgbNHUGSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOGwAKCRARpy6gFHHX
 crvwD/49t3tuCwiX8O3tRgTSTCK2a9xFiYLZ3C6/gcWXhMKuyPr3YytOWsKYqVE6s2d9XnNgcUK
 qIEuMJRsjFTzs36EKi7WVXNjbOU6GgE3evVJ2LUksfomsSaXY7jmfo10lhVZyj0ynyHIMKRbYaN
 SZF5AYIpcTPL5y9DMgDRx2T9U47ieLN6+x/+deywknXw4wpnURRAy0iCLhvVOiVXnfCTCEp1mdg
 3ZsIoSXyEn/HWl+zGGtiYKpwsqRygQhDBEmX06f6SYqElu8SKWLTYPLPXBENVRqye8sNQHxUo5K
 4MDoFeA6bgvbLSWUSnNvImNTCW2nASW17FgXqhmlRAjKE6JBDkSqZkr82jX9LWxKMUNcL2U/GSm
 UNKrSXn/ExP2CfnCnIz642iK+kfSzuTyAOaC4/Wu5MPxOJ1UiT/MWhO/aBPXi7zh3DNe5VQABOH
 EWDxa4at3ym9xhwk7Zkur59BQVtpoSDVKR1VhaMem+ODpQh5XKux23mdf4oPzBmJJG8LCkebjHc
 mNXd28+FhhlJ48ZH8Kg5NWtP7nemVeBMWrMd6dbrVsk9VWr4JrCGlDnv3/1VSa2z6ywZwiMxIBv
 Lq5hYQgf73NTRlOBr7V+WI1GaELL+9HjFKYKfntHiqTpFa9FX9EC3Ggm8nbdv6ns0TMzBcp0sTD
 WC/GqiKu2H4w3NQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/silicom-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index c0910af16a3a..021f3fed197a 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -245,18 +245,19 @@ static int silicom_gpio_direction_input(struct gpio_chip *gc,
 	return direction == GPIO_LINE_DIRECTION_IN ? 0 : -EINVAL;
 }
 
-static void silicom_gpio_set(struct gpio_chip *gc,
-			     unsigned int offset,
-			     int value)
+static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	int direction = silicom_gpio_get_direction(gc, offset);
 	u8 *channels = gpiochip_get_data(gc);
 	int channel = channels[offset];
 
 	if (direction == GPIO_LINE_DIRECTION_IN)
-		return;
+		return -EPERM;
 
 	silicom_mec_port_set(channel, !value);
+
+	return 0;
 }
 
 static int silicom_gpio_direction_output(struct gpio_chip *gc,
@@ -469,7 +470,7 @@ static struct gpio_chip silicom_gpio_chip = {
 	.direction_input = silicom_gpio_direction_input,
 	.direction_output = silicom_gpio_direction_output,
 	.get = silicom_gpio_get,
-	.set = silicom_gpio_set,
+	.set_rv = silicom_gpio_set,
 	.base = -1,
 	.ngpio = ARRAY_SIZE(plat_0222_gpio_channels),
 	.names = plat_0222_gpio_names,

-- 
2.45.2


