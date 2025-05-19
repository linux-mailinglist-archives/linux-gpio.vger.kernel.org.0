Return-Path: <linux-gpio+bounces-20282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE25ABBC0F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 13:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355BF17A698
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 11:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56180269AFD;
	Mon, 19 May 2025 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gdf5miCN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC2274674
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653051; cv=none; b=T1w1lOE1Z6H0RKAwjw6tBuvcQTiaZ7EVXxarPiIF/2q4jSDlQRXrxQf+HfnPslZMqk6o9wfhhLGci8BkkuIzkoy/nYG//qX+3/NmHHpaiqFSCvaWd/S7aiAVNdFsAO07cHlRV70HiVzg6i+CKJ4vxrfQfFHnG86KHf+awBq8MYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653051; c=relaxed/simple;
	bh=PJ9tOqE7DCqTj6Xu6T4vmNVqp3QO/g286vSHPwSVK3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJSMzPDCccev/+ZMmJahRv5oEw3esfG3aQRzrq+bzNn3y5e/26S5oCi9/XaK/Ef3dGSRAoQhUjLUKWkTBOqD7ZuSLclEIlz6YaHnZliuDk7Atw651wqZn8nuTJhP5lId5qqJBFbspDVGRhZv6Xh/aUI7Cnpms5a7JVDzpn1TgDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gdf5miCN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so33364025e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653047; x=1748257847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6LSc5lez/Eu//rcIMT09wjishlMs/MOyRm/EiJltuk=;
        b=gdf5miCNZU5Mqbiy5odTkcPxhxf/y9ZfyRps1vkJmswndjGTo2rPjBWDmLZG9KhNNO
         RiOcOVdBNZ8vA3ua+8D/HhEoGXztdGySSXfuneeLuaRTTHq20LRQcU6fq7bLOSaHcFmV
         RfxCB7ma1TQyNQmHCaF5EGQ7/XvEeh1zpAUF+qE+/6kIzYkrGAt1jI/xC6RyX7mMkm43
         9wHMmZa7wADcfi/yz/dng1vE9o03HMo6h6OxSu+7VmWPqPq3lKP99pm71FqPRVy9dSi8
         R0wGaB8YDsA9RxS9D/oDVNi0alluV3kbhPkrt/HSBOL3XPftNpuwmVT6a/413uOn9oZh
         rtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653047; x=1748257847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6LSc5lez/Eu//rcIMT09wjishlMs/MOyRm/EiJltuk=;
        b=lGVfQ2ZZRMvggjDvQqRwDq1FjrKe0D5fgIdDuNo3NeZ1/2QO+WNfScW4qtV84bUKlv
         iWE7pqKceOPFjkBuYA/92bw+ptGj34rqv+siR3STvYPM0scbgWVKSQpPgZOk9K2APMUE
         /AtK2vqTJeHvdLs8NC50RaipM5CKsFJc7sW0ppvlOZTbnXULp6gLr+B2q6Y4TLPFXYkh
         k55Sv5Mk+SnVYoaE3brztHW7hlSjpCMsmOhuC6OFZDDVuaUMfffrIhcIl4lCvEWjcNfM
         TBvgJwqOqbBQP5f7I9NID7NZ4q+WTrBjESnbOhG9HxjYPW6vYSJBFxysqEw985mabefJ
         Aq8A==
X-Gm-Message-State: AOJu0YzzCWtLixffCLsroVe94UgsbMEDmcCT0yn+j9fhrFXsFIcw37C2
	1d2KoOrlZBh70QLGWN5rUoMLZ8G2vDNXWq7WjjinsJTXCQPi/Z5fVwiGHRWo/l20rLi9U8RZPFE
	kq5P5
X-Gm-Gg: ASbGnct8HqMMnaTN4gPJA9I1tE+6VOUSsoGOtb17vT6IVQju9APJ/y1h2Gpou4q2d0i
	0H49nSEQH1GcfDHDEwG95bUSDwWGUD11VKB4DXVcV03Aec4/gYvPyPR2/kygbEiF8EL93YlXwU3
	QiV/OKyh6wZ/7JLpO3ah1poT+9bOntrUFqb7Lzc0inIegRwJHtVtx/nUCLJQXlWfhTZqQV301wa
	dpndp0MuAhxZ5KybrSsf8CB7+08yHY+JHSIG4raHReTYXu2wfMDeW1liRbAFmmIsdczhxfI0iom
	65idbhNBPqQtJKy8kRxLplM8+t8rbeo9ydZe5csLb+eje5f+LrhK10o=
X-Google-Smtp-Source: AGHT+IF7h+zBMscgpauGlKG/YNnBlXL88ytZxqLJwFBN3aVaOn08DNTB4RwfSEtUz8teJYzBRcHiHg==
X-Received: by 2002:a05:6000:184d:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a35c84bda9mr9754134f8f.37.1747653047174;
        Mon, 19 May 2025 04:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:10:42 +0200
Subject: [PATCH 2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J1gK/1Ye8x0phnZQJskolGjNM5MRLOhPlwkZK2TChYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxG08O1LyetUkEWSaaE94TbrHPAvaydgRNsU1
 7f6GEMUSSKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRtAAKCRARpy6gFHHX
 cj5DD/0f3k8G3pCagvCcw3+ypFtHH4C3qpYAZJTuYRroxQ1smGi8n+tEbGMBHNUYL2qmClAIPEx
 hY7ZqNbt9CJoVhcs7NN8svxvdJdEAv79JiN2cwlFryZHSA8ET4DhQ6cxTb5n0VUpiZfzGDfw+70
 wEvX4CXuCUl9orIUhx2GI0jlL8PNXW5TgxSUq7zNceePAy9MdUoNBc6z+uywpA0W14FrHAXKWzF
 Y734Cs0icu5M3/Qlu2jlG9SSrO3Fo8kip3uZqZKlyLkdaNsYpNFb9dDYsOgyFtrmK16ewn3rgeb
 ipod39G+byoAubGgAXSVGdN2hBw0XFTsOuuK4b/AMJmo+sieGU740qnkPtCZueNciv5Q71p/gpO
 JhXDml/+J4N3zjsiGpN6XXSkb75bqqTaqcVgFXaOjIwMsM2OIoXml0qntSSlOzKlBDaKwkUKhDZ
 Cve6MHQuO2EIsQDrrfzKjtvlgTJu7S6eb7xtnib6JdpS3+Siy1s3yBhNmminMhLcM+xSWn4G+zw
 HdCidvKcxgGHpDYKDaEnWZ2YHgWkSzmwwJFHMVH/wa1yKKU0lce6t7ghIDSaRnmyL8LPpXxPaMB
 cIXlAOvo3tvx09z3POknCmYiOXGP27+KPBbpNONHz6ctJokGUH4rWWjjaKiRyFm6A7KJitakZ3a
 HCl2e3xHYiEtVCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 7688a54d5b53 ("gpio: mpc8xxx: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505180309.1nosQMkI-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index dbf503d8228673013d4b58693152e7e21436fef5..a559d5bb824932d07e5a11b4457c1d5fe457b8e8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -479,7 +479,7 @@ config GPIO_MPC8XXX
 		   FSL_SOC_BOOKE || PPC_86xx || ARCH_LAYERSCAPE || ARM || \
 		   COMPILE_TEST
 	select GPIO_GENERIC
-	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.

-- 
2.48.1


