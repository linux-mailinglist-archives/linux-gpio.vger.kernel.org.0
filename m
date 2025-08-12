Return-Path: <linux-gpio+bounces-24262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E22B223E9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42373B8E0D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A8D2EBB9A;
	Tue, 12 Aug 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NMII0P6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EA2EBB8A
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992700; cv=none; b=bDjD0lCyVXsCyt141YrLiVoUpbj3uILn2jvZHUj2Jr+uWyXP1fzk8XEVDXHxZ0ntbsTj8uUpCRosPWo/3u7tZGAXuifZRfvutFNyUp2FekPaNgB+SLwn/sZ4RB/SCWltY77lPSySPZL5YlNjDTP5FhGUSOuBm8mnOKECn6ms2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992700; c=relaxed/simple;
	bh=CjOqg/tMVuGjCBjMfchIIOcWxbiHZ10GFFMMWZMqLdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tq5sq90h2f7dsaP4bWpfI8uHpWS7lqApgEOf8G+s+aiuxq9RYdjzn3S6G/3sZiNmsKKdn4Zg3YcB63WKircX/TZ1rsxlFehxMZSe/Qiwx0ay7VEB7bms1JsFbqc7Zfqw0xdMD2bFN1W1/Ey59jr81AmG6Bm4fLL7IqmbsWisgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NMII0P6/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9141866dcso167261f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992697; x=1755597497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=NMII0P6/jgh3/VwirNA4jHfKYNtf5UzprCkEpWAzpK4DvJ/DYWYe7wU0iPAiL6oSKy
         2dvEIwXYM0GlX+pgt8sjTYQ6mbu9PDIuD29tEPldxTXZez1C5wEo33+zZ+p0+wQ/J92M
         HVTnLknoc6yaHTaIt6SS4s7xmBmwX2THJVexsZ1AonuAWBj//StQ95HVyZyIlRH3L88u
         YF1ZEFaX7IrniX5VqqnulAXOPzbKaOJ6JBBq5t/PEPhcTWwRI8J+RtMNlmpqc0Fl4QMr
         XkeR7OmCO02wdOxpqCM/T92Cs6IHlsjdvtekRSFoiAfz0WmYXoJPbxhZ7PXzZbjSQz3U
         6XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992697; x=1755597497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=XZNJAog7aniOSWcGpMT9rzWBTxTS7331CEe7MimGJUTns9gpW0egQO8mA+mUUCTX4/
         bVy2RWoG5Bg5EGcJF/JItPT7pHO1VVWCCUWK9F5p4fO/ruIXjH1x0Jej9PHO/EDNXeqK
         tByKV+0o7W5/kwHO3CwugSIn4zClFUib+ypKwjcN4eV9QxO/0hKs339oeZHsDungkeFx
         nMxprxNyA6O9qPRw9XEH+YgTekW3NwtxnZ8CSzYWfqnYUCkPcR6UGdZkIOsh3fSeclD4
         j9OwBwLDHX0Hb91peBCzRqq6yn1JxrfwufWIk4gTzSXHu895th/TMSImEQMLrXcKq53t
         tMfg==
X-Gm-Message-State: AOJu0Yw/fxTg6qHggGiG3VPXDrolpphgWv1TxA2hQSnk2RISFs5Vm4dD
	1x1fY/b7GT8OpmF7eYU7rrfEsiuhuff/pq5Q8/cGeccCRwx/bHnjyRIqEOjOQxtQcSE=
X-Gm-Gg: ASbGncsKnrtWoJdAYPEbNBSwRixCDcj7ApRk1RgT5Q7tMV+flqGAXlzp83HhQ7k6W0w
	F1+ewOK/eCy6UK63FOKJyi4PaxSNen8qCEfE4ceD7rRAh3ROQpbL0030yWn9JAvJRDYPoFGAaPi
	J1Xxr6dhKxBlwk/zaAp9+gmedok6DKUHu5/2TuNTnMIEO2XirVMUq8skWQNZyYc0kXj0uXHTVB0
	nke2CH7BkqAE8VxNXHb5zyAti993l1ipXmhNopV15hZapUO6JsoYLbOav3xyCUzxsNMYCsMc1IY
	WyWrwLH3vHiwla/UWWNoXVtxWGb9nxIASEApn5ER7sKcaBilbz16qsrX6P0G17ATrwnAxLDNaRZ
	iSynIm4AsoTwj+g==
X-Google-Smtp-Source: AGHT+IHRuf9Zfi9PzGgyPVh37Xgjydvr8aSXzszpGWT41zFLYyVLO6nnKW/PTOyONBw+Zn1PxnpakQ==
X-Received: by 2002:a5d:5d0e:0:b0:3b8:b33c:b8b0 with SMTP id ffacd0b85a97d-3b910fcead6mr2198938f8f.7.1754992697329;
        Tue, 12 Aug 2025 02:58:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:59 +0200
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
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-8492f4a4c1e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmQ8VVYuLPJ+NvtCUKxwwpTeueQmO+apEl3
 9TV5OY00wCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cvc3EACcX7GU/Pwn1Ldl+Fkg7yiQq7EIoMITm0XQtBUjEbJIax7rXr4Dv7Sl+4dx+FGx7VTPaE2
 IgRMXoRuaiwrI2Yama71TDv/xC82l07VLOu/ep6S1/QlBq5KJxAB2tQ2+zhl/+8Y/3rMcIDkAuZ
 lFt3A7zioNi1u1zAczyHPhW+A7VmAXkCHowsbkKLhgDtJo7X757uodlPRQY7ri09NiAYFH+IjOb
 /Jz3W0Pz/9sz+57MM/npiFL4nFkOcFvSm9kQMpQJYLLrn76qTDsBXioSSSoh2qd5yjT5ifLKFRc
 8++qj2iSLg4fF20xtFmvXxnBB9bllu6oEk4FsRRa3jGq+ow22c7ECKOFd+Rxx4aDmcSATsbL6wG
 F/Y1aBcNanJA+sY9ZVOWRvL+w2YiP/bD1PzHoDOSr2+x4KslWYMwMs0PaZjXQLJKGmRyxAxD/U3
 n+zho8Kh4R8ll/O3gG4rg0EoIxIERPJH81JR4Kxjf7gWgswVFRzUlZJA6yDI8MLYT7ybKE/ZEEv
 VDlqD0Fhbeajkc2AfxcxshGQyTNHG3W7V4Q6v9gKWoREOfr8Wt4WCbkYUT/1UTceTe80uGIBioS
 9gMmlinP1g7ZxzDtKx/GOvC3JRkQ26l1jjk82a1WkrYJ3xeoSLRYhA1kulgQo1QBrsH8CLKHyLq
 GIG305w3i1K9fYA==
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


