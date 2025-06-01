Return-Path: <linux-gpio+bounces-20841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87EAC9E63
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 12:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299B43B8B1E
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6631AE875;
	Sun,  1 Jun 2025 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDskuaOg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06D18D643
	for <linux-gpio@vger.kernel.org>; Sun,  1 Jun 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748775073; cv=none; b=t/pIbpEp0K44xAQ3yd6waJI2HqVz4WtS2FWBYzaDhwjNNGtgaEjvvD/Oq9js1u+wohfYAVlpjiJ3OoCIGQ7XtkZsuhp5XClqQ2ddfLf+t6DicFhrB7r3Fyx9b9iNVn3l2fIxt6jva0S6ObD3GwM0E7CT9JXVW07ptiJ7F7hP94k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748775073; c=relaxed/simple;
	bh=IedTI6y31Z9wfDQygWxGLOTQXuBtfOVSY0+G/3MDsxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dY1cmoMApezXmSVSlS/GLL7CHY1BlIFG5OnDGEI2PuuYExFtst0zOCClPo3d1jFmtG9y52YxirDEnmviezfV3GNRDUDafCgJFNHlROe+01ri8yF8RAaoOvowYfxG/MAy/6WoRpJDSqADUR57lvKCjCXrqZrU1GLUNnMBIGRg0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDskuaOg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a362e099cfso575356f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Jun 2025 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748775068; x=1749379868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nUpZNBlpikPmomyW++aVf1JU8CJ0XDbJuCOPljwsA0=;
        b=QDskuaOg1F+4eeToybGPmPfULxZNpZUcxChqLBJv+Gy4FF3AYyViqdxcZ9ZTvqkhNT
         0aQUkLcRa9j3FscAI7h683FlAq0tHO5NhO4VJgi6sjGWEFbAGbf+T24aOou+vqMNmN0j
         diOgTx6B5+sbd0mKgl/zyua97x1pI8vg5vtZTdVCMC3Oc78lCTdo3GgqmuxX3/oue4xt
         pvkMEWzZZdbTazvRK2iZllBAdxsbSoHn0S2PDnQDooH/H5Z1H0NN1lYeXRHvrnBD/n+G
         sTjGcOzeED6W9lmk5Kx7B22mJ1VpgrVtGf2WpfcVC9x8u7KrCMxi4s8rUIRwOWMmPPbu
         BmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748775068; x=1749379868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nUpZNBlpikPmomyW++aVf1JU8CJ0XDbJuCOPljwsA0=;
        b=DQAqQSo6txtTTjTt2RLN6AWes2GGTxW6N7ZrW5qSeaJ+oyc8hC7u6HczfR/f7ctTcR
         /jQldYCr+PQCsNEViEV4y04AtZOS28YnHRLoIvB1nu1JpmxdvTWl55utYeq1aJDuz6hH
         smr6TZBSe9pjLVNN6aL7K5lPRjX0GL9+QZTO6ZujbIBNVqRLA5h27zXSD+gZg1jT9WlA
         y0yBUvDWEOzG1tT9gnrRCF0L449Sn69OcZdCeW+0hzuHs5nsnpVUHjPC8ie8cvtUWQaa
         RfxHM1q1xEc6q+l3QakJtqTexr6uoyus7VkH+jq1qmp8w8XEZmFy6LulgRuemBKvNAdJ
         r4wA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Sxh5dKm502fiFKoJElq4dJLhErV8ANqM2ASt5JjtA2tE34yRlD6RTQxf913a4rftL1hTdyl8rwaw@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiK2JFWfVQ6TD6nCAVRqyG8JLCue3PDjXDl92HDE+sEYL+FzC
	/j8zBOgTPvIeRUqAeJd/M8CIE9jshl8M4ZHaHIKMAk8s9ri0ZxY+0QvV/s+eNW7C2DU=
X-Gm-Gg: ASbGncvgRtk/FVUP5Sm3oKuSaw9uAD9w3IJS8K/lQXLPQcFc738RoKAxIdd3Jma+7Gf
	5dOK7C/Ttn3mAToUQPTdbw3sDXGae8B+zF+1MWU8NWWgBoc9U45FnNmTjICefcYx4EP6K9w6Cnh
	xosX7m3eh2gTrihllnp1QAtAC1BPx9n7IYZotnw4NMU4Sd2Q4qizQSElM0gMdjlNEN4hb7Mw8xd
	XOBi47G2hv5Jk5I8xY2RLMOcSyZCVut0LsU8Tb74Lh7Zf2ZnMqhlYgv38L5gwItT5vyU/2mMp/V
	FpwP85/hKMaq9Y+hk1wBCkrCbyhM9cMcQ+c0+gzpaGpP1yPtQP4RPeK9zQskRw==
X-Google-Smtp-Source: AGHT+IFMEf+V7VynpC+46zXghcXGWiqK1ENHXMZzGZ9cm7VdWMxCLQgYHfpKM5q5fyapqZaKoZ3G/w==
X-Received: by 2002:a05:600c:1caa:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-450d7a7493dmr27209595e9.0.1748775067858;
        Sun, 01 Jun 2025 03:51:07 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm10918723f8f.26.2025.06.01.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 03:51:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: tb10x: Drop of_match_ptr for ID table
Date: Sun,  1 Jun 2025 12:51:01 +0200
Message-ID: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=IedTI6y31Z9wfDQygWxGLOTQXuBtfOVSY0+G/3MDsxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPDCUJSZf9oVpRH48R80uvcuxTee3SGaUU9J7T
 9Mi13CXgouJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDwwlAAKCRDBN2bmhouD
 11BaEACV5gqYXBoKx4pHWvXE/c/7/+RNcjZigQVTzqiAgB+2gpzUa2t4XF238EJhzHxIns+3SVR
 NFGlYisEqE+xv6ZZ9sfMHIoIXaXmulV59L8yGFOQ4RZwGCSGj/FpojztqFiVX0coWw19XcfffK3
 rISmvoV50afEbGhv7YFbIaxcpLUX8ps7O5JcPVzw1pmw4aNDl23Hz5Q/nG91fRZIkEGwMyfYZMN
 RJJLTgVKCLdBGfGcl2GumEaDKT++xTsWDAq2lwSq2vd3s40ZuhxdKA8YasREKHp2809y/lpwIHQ
 UAK8vmb/MFosIYeUBrRJ8WRo2ZNZASycIgb3K7Spu//la8sU/rqfGdUUP3kYpasuFPoTFCMdpo5
 TyGS7d3GM3h9gcFGAMDSxahbs/DQjs3Z8m3hQXA++hHmdRIfwMeoM7evd/Yt9mwafp5fPFLdkvE
 ZQfLRsTJLwVddY0uGY8BGcFvsWnYE0fkXUcBtQepdmiBU6fjsnnYKDxswZLK4STW63XC23kZ1Ar
 Mka0ba6Ta1E4PSXyjQ3tZ+RNEg9gfNh2CHK3L6lhbZZJ+pwYjizMNDahWlRPNZRQmEVnUOd9GAk
 dD3VTfgabMezJByDivzM/UipJHIpgUwech357T0OHtjjPLe4dkPbU/fWvZa9+ibYkyI0KCLjRH2 4PWo7u5mgD9O23A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF warning:

  pinctrl-tb10x.c:815:34: warning: unused variable 'tb10x_pinctrl_dt_ids' [-Wunused-const-variable]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505301317.EI1caRC0-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-tb10x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 2d2e9f697ff9..129fa51d13b1 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -823,7 +823,7 @@ static struct platform_driver tb10x_pinctrl_pdrv = {
 	.remove  = tb10x_pinctrl_remove,
 	.driver  = {
 		.name  = "tb10x_pinctrl",
-		.of_match_table = of_match_ptr(tb10x_pinctrl_dt_ids),
+		.of_match_table = tb10x_pinctrl_dt_ids,
 	}
 };
 
-- 
2.45.2


