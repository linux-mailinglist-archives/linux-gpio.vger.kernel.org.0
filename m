Return-Path: <linux-gpio+bounces-22566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A80AF0E52
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A495316A0E9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 08:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0D623E235;
	Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XSAmOdkb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B6523C4F3
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445945; cv=none; b=ISfpe5iiDt1fUnxjCAhhwrr3b3VJORy46R8HllBSKm14O0BNgFI4UMGmmURwD7Om4o3BaRDkAHRmVYz1k6OtXjOI/yKj0l9v70a+1TMeHAyIPo7k5e4LA2njden4kJksPel7pQ8on5oi9C+4FXkDxNFSPH1rZgxW6OUeRSpd00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445945; c=relaxed/simple;
	bh=4eNoEGYPEAvMXGMHyppT2sA734wCqZlMj9KGAuScq7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNA7SZnMjKB1dmnUwrpwIRABtbR4Z8y7hd8sgluV8ERdZHaHCKCnCIc5dpQdIVgYVIvyiNay2N6JrR00M3WDuHTRV9rKWPQWVSzmjrGzzcQPeCDPZL4NJmnRO3K/EB3Y41cMLef6K40ARUF7zSiuaAabd9un4NtZjCHkpLRpK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XSAmOdkb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a522224582so3427460f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445942; x=1752050742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=XSAmOdkb0iCHxvWPGS2+g3BI3AkPfSHOBj7vWe0K1/UBWGytU/A3dCCpPtmKZlU82X
         K2snVrjI87anyvoommt8K+D9vFb77d2qEs4Kd3JQC/Ci2Sy4ei97Ge2H2Ioh9SawaU6k
         RcBFogiwJZOn7xSaoNcOBvP1i6v2OLkA73e4gJblh94lTKVKGLDqJjnUECh0OMfWRW0c
         d67iomjCzXoW922hbad5Id6soVV3xRfuHVKuswFIx1sK3n7fyZfg4oVru69OsDWrMr5V
         OVvwPyrSU/moVrlT9EgU+SbfFt7pmr4Z1KhT5U/VIeQ6teN+zgpF/qY/AC6h7Q8eLMgx
         tA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445942; x=1752050742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=CAWwKuvzgGoh5f47XrxmSYqTulM+6Y/M3+Nn7rDVhDxdYQIyK3kqT1ZtNauXP1upAD
         qXsOxRjiNENl+zB2Q9WiRkaDmsUy/AT78LmXxYrFBRp9WPCc8AcCZ0E0dKre+hKspQ1x
         hdXyEZGA8QY6J4gyg6eL76Ofp9c3C8ErpJjtHx/sfHZxX5ROEEOe5fIBzTFUSVX2dGtV
         5oyZKNg/k83patwFUSRHD3Fw1FaQxXv5YaPhpKXRMkv4dqJVDihRTjq06/x7MHtXTPjn
         /e1NZUuy/eHq4mwwCirsPItYZusmlAOcZO/wUVl2fBe13sUwpiYDM6O0omg4IaAeSzjL
         pZ8Q==
X-Gm-Message-State: AOJu0YxpQLHTBcpZtGZICCuLZbLRcctK7rgUW+lt3oJlsebJmbZVTsHX
	W82zOhh1GT8Qj8mzLJtVv/J/d0Pyl1WOHDD0CY+T3TG5JUvGnYcZVrPp32Btd2TAwEA=
X-Gm-Gg: ASbGnctbPqcJcoB4lKL0lIOU5qmRyTEQFze0gR1HXjhVyDlnwU1cyrcxFCf0bdgy/R5
	/fh9L64ytPX2syZoNQYWxYXbHrVmoY6Qwhq7q1e/LRsq6vSpbbGp1dMV6KWPrW/GHOlWgnNm1ac
	3k91nOGIP4JwkfDsKQxcIjB0+aiG3rpN00QlKyBBlXwU8K+hLVtBZjBygDbMK93BircxYkFNdjG
	jfIt6cZ5J5tKkNJt3ik260K0fmfK8B2hBvnaMbRW4kvXZInOxOPASczUaJTtZcnaWkoE16h8Vu6
	0RYMXfNTgNWoxxfTWX2UohJDh2+oZeyD6yXRcGCTU8FbxWp6OZroWw==
X-Google-Smtp-Source: AGHT+IHJb3z8M860dK3fs2rS4Q0akrg1/3Gw8aQy4UrD9Q8p6MNxb6Rzpc3c2JwhJLChEPk7Vbp8pQ==
X-Received: by 2002:a05:6000:41f5:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3b1fdc22160mr1402479f8f.11.1751445941970;
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:33 +0200
Subject: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jRdYxCj7D4STZwFqPe35Zw19hML7V+rAMKmzg1nGymI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGwugmFNm2faShHzwUW2ioHIDM0QHXxYXhBQ
 cEfPt6JajyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 cqaHEADW2WyAalEo0uVymxsrwbmVC7EBQCEm3JVHFeIGx9KBJv00oeqEpBN3YGiOC8bx9sLcP+q
 SDZrt8xcnOoZJkZjp0jOzvRITM+KQUFCEH/IWbFZk8+IsdnooEI810bUnxK31paCbJQ3kB4GcxC
 yP0yGWKNAGjAqGeGUdteBQAFMkDt9MlYJqB7NGzy1pa/fzFICTkQzjO/LQ0RFiilIcYkTs3/N4u
 Zh8ZwKeZa1LGCBfHLOCqfP+Df2Kx9UmNveHuWjhBZ6a9w04mjwvXEoHMZ13wqr4pb0l0nBKmac/
 a9UsGe1TrPD8BaS3bM1Md3CRkah2qOmieCB2M3Q+Vs4wclifXFUTMtQ4U3ZxoY5tEGGmTa/oBWY
 u3zKgpVL6rXI3rOpLgc6nG53fvRNAqH1MbE1LVSL3AG/33CQd4lOlNE3rDKDfvMT7eNkRA/gd5P
 ksFKpwVo+uWhpt1JdOsPNMXmKRfJ0t+HpREgwF2SH39ga24cAkILm10b4RPp/FLW5U6C5Xk8UGB
 CIoQB6MLtMOLVL5TlULcuTNFdkF0hveBB9GgExczGYbVayh06LLJndx/xJcXYCFGQgsAJ49L3GA
 30rdLrtAwM7s2AhflMuez0Dnpx1p6sbCYhaG9y3MuoRcpnslNHsOQ11msg0Ovg5bnf46YMy6I+3
 Ca+EdcsC5CmCh6Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow pins muxed to the "gpio" function to be requested as GPIOs even if
pinmux_ops say the controller should be strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..4ab0e75079cd5dec1d86835dae30c9a09455c7f3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
 };
 
 static const struct pinfunction sm8650_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),

-- 
2.48.1


