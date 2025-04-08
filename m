Return-Path: <linux-gpio+bounces-18499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1FA80B75
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD35C501D69
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6764727E1B1;
	Tue,  8 Apr 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nQcBKYqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70527D785
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117154; cv=none; b=fp2UKPrMqfbbsSiIwiv34cwQYPLfGm0skbgpb2BeqGGAp6Sh+RJS9DqwyzOoBitlVb5g5n06W6qEEotUYYezv3Mk43Qe2M9DmiPdvKSNaWTQRUx32R5wZHdfU/X6NSvuYRKoOV/GptFpL+Me3NUsz1GPaPEvgEuBYx2teh8KS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117154; c=relaxed/simple;
	bh=ri4lakWjGaA6VRc8+M0gjfnaWC0bFCqg3RphFjcd+mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpDx9JVB1Pt1Szt5jGS1+qRgBsC5fKwDT17BicyiJvvNNH/QnhGUZo4JkoBte1J85w16XsxB9Gznvuy1CjjPjRPJocbxxH/PGBpJHhIcO96Qxii2DHGp2Tatyq1HDoWlp/TVUM4DXBEI2E0WMEsgiUDoJumU1MllOQ3tFAp2h6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nQcBKYqx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36726555e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117151; x=1744721951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNvTyyUxWe3Kjmcu3ioZ8/vy0nzapTFjSVjN/l2DrR0=;
        b=nQcBKYqxY7oVnC00H3IY4UnY3WuDUE7jRXmztkiR0PzGkZb89Hp5ICXlgwrsK7rNKf
         DtlSrXbcy6hmUh7NDLtcNyw+keFIJrnfqWV7pTKMF4W0twfoKQdgpgc3pMiJyNs7Zh67
         cDzNMj0De2mtzkojbEcYy3Py/pUPu/p9Ykl6Gi2Vt2YSSBtADcGkqZ7IX0Z4s2gxpGKl
         lBG6mue8l8L3c+VLZzXFjQbDbv1TrL1/Fl4nPRtN97MlUhhzWMElS9OwfbP9Tgwqx43o
         h4og/3L8nQcTu+49lJ4cFpvIPixcymR4Rm6QT9BjZk6r4+cU6CfvglMQ5rgx/leHFDYR
         Oyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117151; x=1744721951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNvTyyUxWe3Kjmcu3ioZ8/vy0nzapTFjSVjN/l2DrR0=;
        b=uFRCyHO18Gtpjywlf5GyWCMtrtI7lG/rUvGMILKj7TxkI5lfn4LGu5grjUT8NZSMqR
         D8ykJ+KHUX9guiF+UJ9oLYkEpnuTf3eaS33oncu0x9qgLhscoVTy+eEYBtKnZgJ/PIXn
         TUgIt39z6+06XS2EcFKbWTpSjFinKlKOv+A2MOXNoP7jGJhawYB1Awe/T/GnrROefG4J
         vOT+rk5b8VJQSx1e+B+huxwTQNXc0rTqow2c2eq1hnX331uPCG+vBuZTLgau/bBYwPtn
         c51fQaMIlyfYpAvJt6VHs2cf88m3THTJ0IybKuTLyrv9zpt1xRe+pQC+tDab+CwCd/4M
         Z8AQ==
X-Gm-Message-State: AOJu0Yz6x7dT/ZS3WK73OLu0WZLpqBpQCWFlBTHXXQ+uriMWKbv/WyLf
	CDkh1R5v4IoeZrm+ODC8KmtcNZIIOJ4j+KMbGN51brLtjA1OjmjNPY+Ar7HuE64=
X-Gm-Gg: ASbGncvRioGLlKhm7OZm8wJPcm3aTSomAYJ6t5e1KQ3WqfGIy5T7IrIxN2c24Bp7wHN
	Lz3GCBmPdKTB4S79NBVtXsohHUkfF6PYDdUDz3UBNyRmgc8/v9VFYK9rT9+qAG3sv6kFfqQRq+a
	YUmXF09NFos8IsEksvJWL+qoe0FVrzACWudsZ3snUIe1ejatql8Mi56XjniEMOpw0qyhMwF0H12
	qKzj7yHmr9QDyjk7KscfrMM3AV5LqGosKGhFCFSNRqTiEf9JEV0phC8FkKRfFEQ/dvUmzjl5ogY
	3DDX2O/vF3bE437Or2s8+VPFKVILH2m6qP/mGA==
X-Google-Smtp-Source: AGHT+IFGpRGP89KTwOSOhK64vHdp3B2vVXVKriVjZmU5NIgr7jj4CuM3gCxi6kGPgqMoXIjuT/Ht5g==
X-Received: by 2002:a05:600c:5494:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43ecfa04a99mr117103505e9.28.1744117150931;
        Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:03 +0200
Subject: [PATCH 3/6] gpio: pl061: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-3-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=634;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JIbwDoKsBxGEUaim33zYC4POpTW07Ns+JtH0JutKRRk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2ab4k43KhOouMqHn5tRtzBjnoz8iB7tFXAs
 ITH2ItMB2yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 cheoD/96ZiurytnX3MityD0u2QlZAWhecUGm6uZLWokC/ZL6gnLrccSKCEhKmeAMUMhNxZK8rgW
 maJxwakI8V/nEUuvLBL4LkvAsCGncKmWedp58SaeOivFMG2VnvHu3ploeKdY+cpwEBXSQiJsEcH
 QHypu6Urs583pclSdgTuJgI0i1cs3luubzfAQeS93YYq9xsSKfkWK4NqXjCOkg+jKfj7PUYmZVb
 oFHUUWOF1E1XXH7YaqpkTqir9dGzbVVy0uxgnIbOiAbD6NfteMxPGijDfRmxGMIe/9uC32J0Drp
 AsMLBeAt+r5+QYHiIiScxfqzs4OLsDr5Z+DYffGSWe0+tMhboA/aJ6tEjI5HWYhiIIpSDcfr7Je
 7F+9zpFtlBLPORibANJ/WNjcjdZR6ZVrc2zAr+zDQDfd3/CbBeGjPSSV5eIaT12wMqW1UpspTF7
 uA2SM2fYcJuevOE8SJ/45+9W71K4Hand5BiEjVTIO9y8SsXxf/XDf6XV/H/W4SOUtfD/dsLEgEk
 PNvu7l9+w3SgIVj+cH1UBtHNzF95y/SevHf8JrI9GCorjUiV59zh7OV1L/3zAq/uHnTJ0bFCE3T
 gopEvdjl5kTkg6NAHTeXd/np7OMcCLxmViHzgFrdM858KELNU08nooD7zdayutPKlyajm+Mf7LO
 0HEURhzQzORmVog==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9b25bd667b76..bb03457afa72 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -540,7 +540,7 @@ config GPIO_OMAP
 
 config GPIO_PL061
 	tristate "PrimeCell PL061 GPIO support"
-	depends on ARM_AMBA
+	depends on ARM_AMBA || COMPILE_TEST
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
 	help

-- 
2.45.2


