Return-Path: <linux-gpio+bounces-24261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE9B223E4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369205601CB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F3A2EB5A6;
	Tue, 12 Aug 2025 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2LZQKdWC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AE2EB5CB
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992696; cv=none; b=OhTxSj4cKnuDUZV1uyXPemYaGpmbygmlydqdvj1ViEOEcznVi+RUIEuhRwcyBqTy3Jje4mScPGuQKQD/1gxPEV9Rqj6MhJ0s8acwBaQpb25jwOXUPyM7yCKZQKRYfXt2DN67LFLoaGZYdLaNzp9S5/2sWieAwVADwa6Vw0sMGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992696; c=relaxed/simple;
	bh=gsmPjfJ2QmHUYm2T6GbsR3/AGbz0mExN80EXjsadE2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVZt7ne9fL0UiOKaUbIGdYeqrkq1/Sx1VOCNf4s2+ChCh/iMrItfNqfjmx5WgMsj38P1m+M82ZLpyFEu6Z6MGgj3mUABjOONJZmo7yKF9g2sm0lwCsSeG7TCPsTox/lqkuF7+yJDfxpMyeYhj1FHg9QaFgk7zPmJ0frL0WvWbdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2LZQKdWC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459d62184c9so31147365e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992693; x=1755597493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=2LZQKdWCzYwBTfA00AoaoF8T8YQt25e5vJ20kgCZa9erVbXnPwuHtsKmNMjxcnKmtq
         USxbgvoqpB3JPgXVAPuCLUk+9FSCt+SMCodburgzdHvT+pj/Fvc3ttsRXYWIOblGFBbR
         dFzUN5wQQFU+U34D8aGVmC2hw7g1BUclyBNvq/85EG3QtgXe7K9fh+lTNgHJyXES3xdb
         NtXgJxSkXI5vnP1VgEcntz46YPE4/YbPk9V32bogSZGbgMzjTu4CUWsRMOB+jD+B7BZy
         gL/GiNPRQ+9Lel3MA31m+kQcsg9LV4L/b+YRjqIyaH7l10tw0YvnvLDTWJq54tLGi4X6
         JIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992693; x=1755597493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=X0SxFQ47fFEV9CZJs9AewPi5cjrvNl2yHqXk1PY70+KEe3OUp+QA+kBRVkEnJwbX7t
         /H2ago81YRvmmDw4ruvo/zDPF7cSl+Gt3o+dpX6k8YkMX3wyztgIZ1lHcC21ykfvd+IU
         ZwS112UmuXviMTEUSlvIF3/thpucZ63rPi5n8cVSDkij7fDQLeOhDBe1XYKT4/OqkTZy
         fcY0UtvojCNpROYqkY051lOQ77qjQhSkEZydJewYWLqaY2c2Kd4fcc/Iy1il2BeVfI+a
         n5yC2ZDCGShhW7I5yK2m36SCc5cn1R4WgNx+NydMq3uCGBdBYtj+FhDhjWfqTIBJZjyy
         Wmig==
X-Gm-Message-State: AOJu0YytmCcWLneuIB8zA8ljcZskzzioWWMYV8+qZPGXF2AVOjioYQ0+
	8gtjoVSFoLVRKxDHbu0GeMtki0PaEpeTGfvxUaJ6ermy4NqRsA/+kjyOs+/aSb9xzxWyAFl3p0J
	uRnf4
X-Gm-Gg: ASbGnctumxzniqJ80pb4/Bglcz/d78oV5UyLf3FegwK2gFNMayBpCnMueXTCmHCscX5
	nWI1grNg4qymbB/zv/r8KK+KWaCdfUr9lNtOJy3MPlL6qvJFINqk92TsXe0WHDKhghr2htuMSFi
	dpJTwqdd5fLHwKeAlCvFCsuSzdEj3+BKqHqOsW71/NaWrlHwZijrYucBxI5yI5KkreUxdJrj/d8
	LqmqpwW/EykZFDIKtT7usSP0EcFhL0834S9Jdk8u7dPZbr8BrPJkFS4Apb9GLfA1pZkz9N1Uuu0
	pjjIaESkk2XfqVzowM2zP9rMDrNvZDLcyuMWc3erRvJvBp4wRkIGf/tuXaSNpCdG4AALVe4GZio
	fKe6g0psw+NWZXVyWrQYInqmg
X-Google-Smtp-Source: AGHT+IHrrvfILBNWEhNV7XMQSmR0S8nHoKaZJjsiFHryRf1RqUPgUP6MkXc2ValXGBQCI1vagLTAeA==
X-Received: by 2002:a05:6000:40e1:b0:3b9:48f:1960 with SMTP id ffacd0b85a97d-3b91100f193mr2267978f8f.49.1754992693349;
        Tue, 12 Aug 2025 02:58:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:58 +0200
Subject: [PATCH RESEND 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR
 flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-3-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmHBp1qfofMqe+al1PpQUT2nv72TJvV/tSC
 dbDQW6TtPyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cuEuEACD9yCaDP2SiUwlOEFzSZLdWmr/Aao5dlNo1IQ84lWUR7l/e5LK6BN6YMzKATYfiioPgaz
 4V3/DFMPo9kfYdzp0l/orxKzYWGpveBtOuL1FXuCL/boOBtikj9G7FXzp0iRcdHd9bTyUr+c/uT
 SXRr2wsbX0eY8bSrjfDBbmTKDLs9tFlKrSZVW8SXzj2TqXqiL2KopwLFHRBMXKGtqdRG7cEthcc
 7nkB6HQ2h1y9Kl4HNngUVJVCIDBRj3ujuAQrxGgiLxN2m3ENkf3y4DjqpM3S+XolGf3Y3Om84/D
 CnqLQGvSVp4I2xLC36GHRf48xuo6EirL+ttZlCyQyEDQoeHYU17c+3osUGC3oi94llnqYMndyey
 vpUZTS/6mKzIC84s2vsOBoLHYytFwAWfDj6Ox/fLDJagdB6tFI0rcPaSd6smM0E5weHAKuNu1fU
 smjz0mME1HDeRVATjQ59yY/ADLm5eSifkk0ABGIEqaWvJSa0+33NEL27OPWz3PMJ1twrCcOKCF8
 4WJVuzyRaM1nSm2RB2Nm+jKBf0xuEQFFaCljw2FYqF6mV9zBYEwbrb5XebrAb4rnFpG6B/Xb54U
 cwJqAmYkYB2S3utN0Fq2KpJ/W48akbXxxUT/4fDFjtsSMcLs/Bm8sVq/o0T76d2zoxDiXdpnv29
 C29VhwWunWo/dIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


