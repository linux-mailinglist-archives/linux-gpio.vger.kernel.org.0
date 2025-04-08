Return-Path: <linux-gpio+bounces-18496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B8A80AFB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA8527B28E1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6EB27D767;
	Tue,  8 Apr 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T9dcfhNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B2127D76D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117152; cv=none; b=aBuFJ4pzgBB/t+7iD76ap+VS9KFFC0MGNFRUYKQfx/tBoJBUZkYM2P+G19U+zdtiltWjwLR24Or24tw04V3eXWe3yzPYjUaW+c5Oxk8+apXtlwEDI+OrZBgu3iWe97Q00TP2obhV+Y+uvlCXzxlplvMjCfuiG1gNF5rWJp5/5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117152; c=relaxed/simple;
	bh=QnesBRa0WSAs95Uou1Xi4HXjzghqvVxXglehOL5UiM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzYi2Y9vDTnYV060KoebDgoQt2fvSpXL9oMOhABb8gryWG6uwkYgzFnN0Hcv3ephryuA3J78HHaP1isHcOByJztBEhXLmB8s8AmdHE+/SrewUdjdEGKfYngGsPG73A85O0ZBMApRssjBLiql8yswCIo72WIIwJsXmgNVcMDcoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T9dcfhNv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso30916375e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117149; x=1744721949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwIunhe/KsNz54vKj5pRAXm+itFBWVpZZOSQqZEzaVA=;
        b=T9dcfhNvpYG+hddAr1pgMmdGoM56Cc2aXof19eZDWzCGI3LA439lL8MVH1s6LRFBcn
         abDEBjNT2yCKMrFG1VwxrfOxwrdBpGrA5fmW8uRp0CMrAgFZJL90U2d9E5WUNNQtDdyX
         ZMfg2I8WSvrBuF2QRWN4CHK6b+vY+Hha8GqzqzXDINpTOZZCoGwdyGzWxO2MtnhXvRup
         uu0IIGKNNIKcBUnFGy3yVsjid/5rtrSPo7s/dLIuONYxX47Wv33ZNhYzomwrZScsOWVf
         8bgGGwo0sCBHaA7WDQwBJMm1Kb7KjCe9QsUoSXonsJXRyjIJN74NEr5ZEq3/fCUmIA6K
         q7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117149; x=1744721949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwIunhe/KsNz54vKj5pRAXm+itFBWVpZZOSQqZEzaVA=;
        b=FIcH/z3u8DmX6m2rCRmM0u73T2gOu3Vz9yKIaorg7G/n/8+M9nmjpOi/xYLrTCe9ej
         FDtz/JjUAePIi39Y4Dvo+uT3xVUPfr7cFXf4BS4nX3W2RxYs1W+5wunD2JBErPKIWqn9
         xoiNUdPq2vqgMTnyl8aFtcK5y7q0C8NByf0xdrHCNvMJflEGjJy7cnJFefcDEXq0r/Ls
         sYgfjZvpAMlklvx0mRn1xj7M/Pp/R6lsp5yvKbiO/LBA4GOvSKvuXl6P67qKLuakjVoH
         QGOxa1x+GzznzHzDa6LJeOg7jqYfxPbo7nnrwc6hrL2azof4i7CPTyj6+eEhTKItZXcx
         Fagg==
X-Gm-Message-State: AOJu0YxuOPNN3zlEs0okrrq1eXKFJsbI8i7JZi/O9YJkYlwIor1+ofmz
	16AEAJnbfq+VG9nmGZcZNPPO1dvS/IoPbCE3ODyQx/DrAfuKMSA8I42hg51S0sk=
X-Gm-Gg: ASbGncveZsLPx/rjIp/VQf8OujipESPOJLY/yGqQRfQlFn3+qZ5TE5MOYULvzifdcPP
	ib1VFAKSuNW6eXSSzZOpAGRdpWhiv4idzILvCCLwz87eRGgrpow4HJvq7/7oV20L1XA8rUhjfci
	oGkpjRGhj4HBW8vf+KDcZoXHzhphOOAolZBV17TPewL0cJojYEr2B+XZk2fLcRaFYn8mUCXrKAn
	1P2vt5R2nCu9T5pvbWvJl0oKSC+L3FWEtZvA8TlXKLiSkCFTdeKzT6qJg4R0bbjYRVZw/Puy+91
	6jmnAtkFSOQnrAVTzg3BMJpJUHc7ekKcMhAlKQ==
X-Google-Smtp-Source: AGHT+IEZ/exiaRDbRC+OXIlR10TczPnWpltHQQ+BI25L09kSe7g4fqCrmv9HEfsMKN77kxhMJnnrcA==
X-Received: by 2002:a05:600c:5785:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43ee0783d96mr114439545e9.30.1744117148542;
        Tue, 08 Apr 2025 05:59:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:01 +0200
Subject: [PATCH 1/6] gpio: zynq: enable building the modules with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-1-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=n7wE+9zKpINqIkLpQ292GmYbnaL+Wacp3q8TmXzfb0E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2aEoaLNiyRCzH4nDi7w2N/4pMXFKXh4eVBr
 W/aqf/qnt6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 coz/D/0Qj6Rg2dKYqgBla2QmmE5NFN/dzyCIqMgrqaM6VViz1lSzH+s5JE+RkjWVgS8M1DxUETO
 A3vXcZ2n6JK5ZKBMZLjEp3F2uV2YvWD5ELJXsPp2Q2KKAJu13YGttg/AD2p8USkvN8G3bv0QdbQ
 +gZ0bcpqXLqDNMZuJ6Dq0DKGVt7lcdUpliYkQ0t2Ujd8MwxI1upCKxVuT35fNeBTBs4ixx8iqug
 Y3hWba3nLfrfefX7tH5nA0yZCOJANMmvjARCq1e1E4kjTNY6pR8+hwWTurYiesXj0cf75a9kkOm
 qTNDf2oSSti6Sk9YBC7AUYfZNyiZwoaYdpY++lHe9KMCkfSsdt8/hCiSs3qoH/0pnRF6G10vhOT
 nUYSdzYTN1FSSV2CIvA+Amv6TIwCRAqrafqvv4SDCtJfaC2tbuFrUCZeccDGy4g3cuVVNWa0Wcc
 HuFDlGTb8tWsmMeylGKGLB2ol0SS1DjARh9uEKJsqNOx8iBTQFDmwJs9kfgWVX2bROqrpgPuBkN
 aaO8Y/7kUxS19o1klGsCoD5LMcwQW7H13aQLku5AyzlHHxDF+LPj7NToqFgS+jBAdx4eo6YSRxN
 YuEXYwmPmoyyTyS3R1Rs2OHKeiN9X3rY5/3sGqfMgLI3Yml//sm+nAPKdW9vIA5MiO9G7aMDyO1
 BYlSPYvtpgqaV5A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the modules with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a..f76d08880fe5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -830,14 +830,14 @@ config GPIO_ZEVIO
 
 config GPIO_ZYNQ
 	tristate "Xilinx Zynq GPIO support"
-	depends on ARCH_ZYNQ || ARCH_ZYNQMP
+	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
 
 config GPIO_ZYNQMP_MODEPIN
 	tristate "ZynqMP ps-mode pin GPIO configuration driver"
-	depends on ZYNQMP_FIRMWARE
+	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
 	default ZYNQMP_FIRMWARE
 	help
 	  Say yes here to support the ZynqMP ps-mode pin GPIO configuration

-- 
2.45.2


