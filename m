Return-Path: <linux-gpio+bounces-24908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37315B33B9C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4072042A1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBF22D46D1;
	Mon, 25 Aug 2025 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sQuRLIXm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB462D1303
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115343; cv=none; b=EG7NOQBzzVLI/bMZtP72JsyRsY3UAEwKuCuAjU+9YDbGibIpM1NDajYYbz/g6YEJtIdX5OcFUNYY03112fhxIrF/qS5AviZv8T6nGTBaQCmos/EMGO25Dsoefywqw9O+QFCafzn+wi82YjJ892QsJHbhs9QAFTkFEPvrPTlyVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115343; c=relaxed/simple;
	bh=CjOqg/tMVuGjCBjMfchIIOcWxbiHZ10GFFMMWZMqLdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIsIg+lBZDAebUfQ6JOXoaJJPK2QEtYc7tWNvDI7PaITQohHiuyDN4wK+20/HXI9k19AlB3a3NvsyYuZjHfv8dwCItkZUqRBqHh32wf/c0d52Ml1FbrjhgJSGpnhSjfwMPfzf1yD7bFr0mXpJLlM6rW0RThJdPNkup1JVfKecfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sQuRLIXm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso20980405e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115334; x=1756720134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=sQuRLIXmWt3x+TJ8B0ldiG92yIBCc4kCCNVwRIjJ5hhGOcmcL21fNh097ZihPDWh9L
         y+pvhYMhanywRvQv/1Kwj7a1jrS79XVxKC4BEgWbzsddEm5IMIu/GFZzGUu6sFSr3IsQ
         sjB4UiTfCwztu4zOFcR62Ul4iiQJ3E1IQb4XDoaqoSNewT651JfGmP4lJBFkkBlCiWgr
         2gigDprCev7rt4r0Hjvvv1o/nDbi3Xsfh/2FJxw6tdnvUM8BOBThGtcb7rz9f6NsQPDG
         Ss2WT7BK8PG1y3jJcwE9LWNxELweQcO0m+V3DAgE1i+w764QR2m+xtGBKuv+GNUt8LDD
         JCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115334; x=1756720134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=ap63/O6AJZMwhxwk6fBPfmOCLBsj9cfi8Fgf2LEG37/8EVNFwSrqNusGf5qhC64nTQ
         LTd+9nPLMcpZ8wRNqVxSgvYtYJu6NGa50fMyzK85XfkI59R5hHh2XerAHkUexD7uM+0r
         J6ZUaxop4nv0e0w281mFBbZegZlcGTX3MGd/GcD5RxiKIc4lCC7VLTCK1+mo58UohRvX
         8GqwhzIedUdCr61Xg4T4oB7nujl9w7LP+TsWsWmzpw5oJ3hs35g3JiheRawymyRPh9VV
         gnRdUhDOSi6lVjRpsSSKgZhyFuJ9GrAuFyLMWfH7X062jX6bzX+vVkuIA+nvlkYs8pEg
         7erg==
X-Gm-Message-State: AOJu0YyFwa8gY2xnaCsizzyYO/hzV/bbr1CmPSIrmfH5D6XEHuBi7qrJ
	FfzVq92nRmC9VXuMqMRV5rvPWbp0FVmTchEJjvBTAbZul7nTAMNbxCq5GSvFWfJNkmg=
X-Gm-Gg: ASbGncuwhPZHY7CZgE5NjsUSIcuAKjPVQ0tbDKx8Cev9GWIsO4If2mw6dchQVIvYj19
	HEFWm6AhCpgepMj+sk+Joogt5Be4vrK0d+aq4rKm0zLWDAcBuyLwBpOzpPFtKa71rfdZTKsrIN+
	3CySZRdTtezdd0k1wznYVa4C3UAm1F3MNToqoONwiiriGYTrTNbKt89336pI2MZPwqlwI77g/Mu
	UHT9pCBk5BmTOLqkUzFpx154JcXMsvN5Dzz+83KixaEgA4nm6Q7jAmxXnHYnnLOspz367cGHx7U
	6D27XoBsfGrcCcZqTz1T6tF8BWAzxwxknsEeln+ii3G9kWQkwFBhHxjAtuoa6f2OCnFqtunkIAK
	tJ4T7taGBYRqqw2d9zA==
X-Google-Smtp-Source: AGHT+IG0krJTq4Jgt1IPZ/cibP+uYVb/N3x1kVGXAllB8t7somMdG/PDXIbNNQwFp+zoe9Zmdf1r8w==
X-Received: by 2002:a05:6000:420c:b0:3c9:59f7:ae7c with SMTP id ffacd0b85a97d-3c959f7b103mr2545040f8f.20.1756115334197;
        Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:45 +0200
Subject: [PATCH RESEND 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-4-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+dmaB6cWzgm2SX91hFFwqfh18cFEuENOte
 nL8RUAd71KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 cv1LD/92kRpIMtl2PZLTNmSBg/nbx4JFs5adi1jle8Ro6PoiveSkeouWOncXl7ZGS5367YmHXsm
 sVVjoeuol0qV685ZewLBky/Uh8Wc/i3mrR3YunQhN3fWnq3ZypbuHN+QSasKrtXzo5bKCJIubBX
 /arpVNk+o5r4co0IaZU5ZOBcNNzhkOkJ6KizZ2uYbA0zacx1D8765JmUpbPbVqyXTf3WmmDTz+r
 bNCSXq2TEgn37Bn2Qlg5K1UvtWeGl/Lhgw2DBezQboSRVARFq+2VHti/r/gzyoze2PXjOFFci2W
 U/PZQfbfow13027M7jD5UlSkWcdznjt1egU8aZtQwtYJFGxHa11FA1ozAeR2DAvPftb2WN1/4R7
 rzMIBUHtxstYWt6rbgdijl8YVgvPMmc6m7dxFyZkB5qMB8mNGhD4L/xGpC4LAP+P5N6wIdR+u7E
 0r8SoqCWuHo8D/kJPEz4UCXxXoLOlTLmx4LpZLUk7vGHRT/8RRvVJbaP1u34HdG103Q1k4xHFlW
 oyGIWH9nGCkrPeRSSIcelEJKZ9vMPO/pwzEBBlETXmG9K5DJRLHoxMj2gvxK8NTcFQ/9Ujz/vXu
 uwFVjwosz8GWkmTdng/1tY1TScUvLSBkhao3qKSnl7wpRttlC3GrAtnqGLd+0up1Vl9fWZiIQAT
 X4Zx4skN4CDLNxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no corresponding call to platform_get_drvdata() or
dev_get_drvdata(). Remove the call to platform_set_drvdata() from
.probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 4748e3d47106cd2db6a994928b20f76921540a60..86f7947ca9b2d23292c1e6660fe93c611e0cb837 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -51,8 +51,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	chip->ngpio = ngpios;
 
-	platform_set_drvdata(pdev, chip);
-
 	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 }
 

-- 
2.48.1


