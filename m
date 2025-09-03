Return-Path: <linux-gpio+bounces-25451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FFB4179A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A842189BE11
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA492EACFE;
	Wed,  3 Sep 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sUTFkEE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4F2E974E
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886431; cv=none; b=GtDWKXk5OpUw+22LgAFZkeUDcMKB5Vd5IkjLPB4HW7jsdMSuPpet7Sf2Lq26IWkWiMH2O5gRFG6lAEqGPOSOG85MMTd6jgm0qaOObjdf0hBFmgD2yX4oH/J9//tMLscnXqyTAoSauAGnlFyR9QB4FtU0LpUR1axUf+/OhVjSzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886431; c=relaxed/simple;
	bh=7YQruYTKMSzeRLMD776kbtwhLsZf6wQSro2METsYqRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuZsM7ZucQyzjMmxzdVh4P8NEFvLemzAaRBA5PoZq//5fHA5HSBnv4XOyvnsCVQhVp74n8cxKFRoyWSi0hZgRlpJC3xcrmuC9D470TDwBXaN2YCkJwI4lFSz/6RQhO/221FymdN5rmt9JrZ95Mm69SaUPDTmFBtQ0NTLnArF3jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sUTFkEE0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so21091385e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886427; x=1757491227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTuRpSb/cqzor7io9mL/6axrUs4fHV3EPX6PfmfRG/o=;
        b=sUTFkEE0t7+jfrhvTNx7kKrjGCfNrlQu2Sm8rGl656liiGAc8khUK9RisQQo8aTrrB
         RqljN03Bq90y6IuRlHcI42/DNvi/Xsm5Z0Ke0MFOxlNR7CdSVF/sMu0GHNbvR+nHFQMv
         hiSOyY7qz8iVyp4lzta/1ab1JblgWjnfJPjt1lijN+w12dNVgP65s2ysaw3NCEByIpPJ
         vlt6BJQxnFC2LTcrbMsUC3XbMrY7qOTAb76m4NchqQR+eCwsX+5Ym7rqD2bGiCTL5rpM
         vu1NqBVJTSGr7KdTw9JjQeEQI1dhcCcIrj9RGlipuRzrp52+rHrh8xMv7Q95vsYHoaWP
         0dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886427; x=1757491227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTuRpSb/cqzor7io9mL/6axrUs4fHV3EPX6PfmfRG/o=;
        b=j+0by89FP5gEIQlOAfPiqP+A8PWLUSB0GQQ27FH22liMxTCvExWUYvz47ebJ0h2y2g
         EbsMP/RHeuxAexxsXtUJTvmpOGAw8Tk43Bo1/7VrPfpexychHvHOof26XrnNaDrgdMTk
         8A6AK6WwQPdn2ylaJg2wmprduLcZL/wDlHTpIkIg9xGoT3NfkNq1TCDaBVElEN5Rumji
         qpR/zsTNbkUz6SK86XzNNaCRxj3zXObcuyb8BPzMDl220JrSiRftx4YP99qJZyzNAkC9
         361eCmOV/IU+YZ4dWDBSauYgwf19eZiYHd9vSWHG4Y4ECB0Zg3b+QMGG75Sv3ZnJlqBV
         qsYQ==
X-Gm-Message-State: AOJu0YxL2h07JGx/WMfDzQERv2hQXj4z0IK4yEGlPe2CjrnEBbcHO0aC
	l7pMdvWAc4gwYfoG63Ca3tg+OU28jf1P6NBeP82rV/k3i46gzi1l1LIwbUWcl/CXKkk=
X-Gm-Gg: ASbGncvfYNyu4fR5/rKtx5S9S615rW+Tdb5kFniA3cCkvqp23XYZBdQHBfFxtb7X0BK
	aT3U2A1hwND4Myv3IUW928hSKNOsJ9c/PyDlgl6Ef5TVN5ejqclm760Auu8azP6ucz/lFMORDY4
	qzNGa+beJcySriAunbhp1Dx0j16RkxsjuCpPwMG0GN0SMcgZu3efWhXbqK6frxthOixHXbWM9XM
	NFUheTag6xWYvEIIPqb/w35Iz9GQ95RimHgEE4QwrhdnLSIGqKo+LPPlRQ8tV6p+xbgJvYvSomN
	SqrVAYO/u49gWU9E69eM8f+zLdeKUVmOV9oNbyzFqcZR6KbXXRoDfW1dY+6lySRpjMetIaivboO
	olMsHA1oK8ZS2X+Nmt7foBXHCqMc=
X-Google-Smtp-Source: AGHT+IEEDQfAylHCOtfbDJfAjy6O++lSjcwcu62QI8WIck14KRu39Vhmu2za0cVtvDIlQTaXtZ5IFw==
X-Received: by 2002:a05:600c:1d1f:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45c055e1774mr27463845e9.37.1756886426610;
        Wed, 03 Sep 2025 01:00:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:10 +0200
Subject: [PATCH 06/12] gpio: tb10x: allow building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-6-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KKi5iBWXbZE+HQVIiNlH30Zpf3I7GR7YN3wH//ihyCk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WRSZbQN81jQTxh6MrWPRLLtHDK0Efr6Qker
 rgp9pyu1VqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 ctddD/9w00XQmxkA4UbvnoqaIlfr7D/wppS64eGYxPzqjHvGw3IkU8d3roaKZGJMxSTP5deq4XF
 w6FBq5C2OJCqIehX1vMSwcQrKGh/nb5BOf6dqUIb2eN4exlRLIITgszMDJQiONRB5N9i5F17hdR
 zKUWoJwzBmPSaD9kxblKle0/wVP2FTg81Xtfa+4rMAna/YgbNYkkwOXUUFa2csQcORy5zAUmw9c
 SX7lKoJzIeLOdayzSxDxZkNe1R0sKDKEbKO5nrfDiQCVMwvP662f3z6VeKkidRSda4+qz6m1BQ/
 JMXa10H3A3oedqoufmB7tihVaQmOXTLiy260HEUhY1mDZiyn9+/JOlXer9YU3Vs7qJ1p+QveleD
 +wrD58nySpKLxYjyIygyXNbVgDlll3jd4Pd7Chs3+jOt5ByNmTGduUYG1g1uZGcWbzUjyeEOfXR
 jEXa+KqoVCFQskb/UiNXrOS9vOHce6mi6KaQhPJozeTrtzrurBXCtbq5/s4HQY9nQSs7MH69dFJ
 7yK/3c8Oxwp5PvcfKvMFtK83TBpFAqsxkRs3hyJphw6BWvCR6WJazuknDwF2fWpmZhIx+Sr6HHi
 WyXgujybN/txaCIugikN3gYBNJYra6I6brjZ/vclUUJLZJUspKhkXdiYjuyQdqALuGG/lH8e44J
 2ljwHxU9L8t39JQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y. We need an actual prompt entry in this case so add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0fd5b09c499ac8468269b62a306f9ec03c3f7a9b..2fb77eff3b1f2e862a81eb77f2d4d8f14c27873d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -734,7 +734,8 @@ config GPIO_TANGIER
 	  If built as a module its name will be gpio-tangier.
 
 config GPIO_TB10X
-	bool
+	bool "Abilis Systems TB10x GPIO controller"
+	depends on ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO

-- 
2.48.1


