Return-Path: <linux-gpio+bounces-24965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E2B35910
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2E3171FB1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D3731AF36;
	Tue, 26 Aug 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ce1L/w+5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9A6318156
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200918; cv=none; b=Ya9G6dxWAc/5bDqr1kuOTuHuAK4APvTOQahhh7Z406q9CfcVHnhXoaTp3s1pDMUp8ysoyWY0w4xZL8uxl4kshp/OSBZH2+I+G9kFs0Lg5/rbkOFStmov2LYjXuorjDtPh/nQOEh4t5GF7JHGLkU81XUd5q6TQFNs5T2Mono70aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200918; c=relaxed/simple;
	bh=iMU0rNgXbMpWcmAeYjzIqLI52qcL5///qyanpfM4ZAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFtD8jYs2Yydo9uy+C7kpJ/JgWyy0nABniWz5u0oGgS2jJS100+xrdDXTlp9cAVcKE1DO3ogjkq5p6pQ9VnNAWHBlcFpMP3RYl+v3rIof83/lft6QuN2ZHuGSL06TaMp35fLQfcOGWLiMdSMR5s6kT87cpCe5+Xv09yxJ630mgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ce1L/w+5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c7ba6c2b2cso1657917f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200914; x=1756805714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=Ce1L/w+57cJ/aTToWGrOZWrtGU0LmVmsFKBuyoW+tdB+yJ2W/7V4qulvstDocWYb+k
         44qRY5W8Dajgv4T7X9G56V8+UVBrM5ZHQMRYFr082aKhW/r/luPKK+W0DRsMdSiJU6ew
         bLUYDqAjs6U1e2EblEe8nBLv298kk/PZnnbLRODzCNW/OGpk2ndM5ozgEd44YIC7on3s
         pEHbDRt5XBK0kTvx3K6b4PajT32IWNg2jvHjrDdNn3ty9afWJ3v7sETln/QJr0GEXxxR
         34OjvlQ7GgMjgI9qDeMTCg96uFg/Os6c8j+gdmBoi52GELdnx2G/rWvR8rO4hrtIoo//
         GUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200914; x=1756805714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=c4SMDgNdhQXfkvrtpPKNGgIBbbhPDI/UPeMsXfrXZlxNyX/qRbYyCKj6wwVrBBt9s0
         hcZLeK6T3/a1Rchre+0s/LZL0wJs7gkTmtK5TnrFVVIuEVJaZ59SZREbA+i05ssLdti9
         JRRYx8TaKZ3/s2aApg2aiDRBSB3mKgAFUql0lHF1fgSchOaGWh8CMpnHK1r5ZavOipfG
         tYtH3z/UbMmdLUmlS7etPlNkD5jMjBnwAJwWOIZJJEQYosdtQv7OWC21bv9s+Pbq9v7w
         CLaFQ7qzCsDhexOegEgRvPZj0Mx3MYio27hldRevYW5rLiXzIzxZnr9f8rHdx9USLkxp
         y5gw==
X-Gm-Message-State: AOJu0YzWWsW85MsbI2NmgFINjsWecrfFkRlATquv3wLU6HqdXuA4zXhx
	3p4EBN+LR9dOwm/eXaaYyhvTOuqOkK+lMo3KV7UCxef+F8wawK1vpd62YFMyc2qEPVY=
X-Gm-Gg: ASbGnct2qejd2/TdHOJRmJ48uikjy9PE0/m6oyhi/wOuQb6ztwyTHiT9W4h5UxPON+1
	0CSuP5zh9VRkkD/LM6I2nsktDIFgiS5KER5n+ry5ST03Dey7vAgjBkbs5dMncQQVeUP9tlkRSLL
	4JAISOzVHEI0e+KerDei623ufWISwGjhRbB+sBbyX1FLwWOkY0Txiijhi2Ggxxv7h1TRITrkQlk
	U/rsQkmcFktwl/ecjNfHQxFd4HsHJqRNzp//21b1cwLGz6E48L9iAHxMNAyEINqpVyvUpOsncfQ
	iCpeDU13MNcZwvmZeN4zgNXLSbm7mdjpS5GQVVFF27WNM0jbrhk3WN8Kjb+NPAr3asEzvQSsPdZ
	dcNf2xakXxo4spTAZ
X-Google-Smtp-Source: AGHT+IFCT8K43FmYf5m1ztIgvX2Fjw+GEW6Ck53Etdpp26KgnKp00bfzhvxPN07C+xOfaCd/tjuJQA==
X-Received: by 2002:a05:6000:43cc:20b0:3c6:aa87:d959 with SMTP id ffacd0b85a97d-3c6aa87dab1mr8425016f8f.26.1756200913910;
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:03 +0200
Subject: [PATCH 02/12] gpio: mxs: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-2-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/ZPycHZAJYq+cwPqjcUCTodGjlR5/fbPuBgY495SbXQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/MPuJ13oy7EJTZgd9B5mOUZ3BPJXtY/Ws7Y
 pBLB3iReFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cn8jEADiVhvactMnyVz0TLK/1lSYmKBQ0xCRvjBYVtCD5N/B1mqD/GKrYpGqbIw3KQrvl3LKs8A
 27a7sIyKR6tBNLoCkoHvIY3HtaZKYOs0wPuc5DMAtpCdJef3YJXOVijtKqzvIFxhcjOutGehOEv
 4hwpFsovmfK8YTOTUCr0blyP7zatckLDZsbIHo7WHlvlzAr1Pt53ZvH8Tq1HgiOmL7gVeJ/5UYN
 0GiilKgYrait3IrZKIRDqSfSpCcTOt7IYT3cEpWeKDVFfAm2pjkSpFa4/56RfzakYQ5uTbKT3xa
 jusqrQnLH5sdbPQ3DfbJizcsiy7j7bfQu+n49ak5dE3t1G4wX+BeUmUnI+d8PPm+YRdbhoXEllx
 BW1WnatXpWTjs9wUZ4ykXy6bPYjq1rXiqkoK2Rt8EEZFWcVO2TWSW7vxX0FNpJqPiLkbPX1ab/B
 dL6SxuxnPr462roWGxmp8yHz2Je8M20fwveLsi4Kth9CYuPQLdm3Wx7DLqlbwabVn4av+xuU+ip
 NPM0fLfjeUB41nXy+JOA+JXeoXkBSoJiourNZKsKLtWjKTKuW2nKHLGfGxnZo8+aqYGDXF3C346
 7yUTWG5BrVSV/lJqO7w0fretAVTMEcSorYpsFpSz2wQlii1NbmTe2MnyUgns+uG7Ja+/9ehF912
 y/G7Vqn+VCST8tA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For easier maintenance: put includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 0ea46f3d04e128bc8e70941e26c618c0378ab9ae..bf0c97f589c96a5dce37dc140babda5998d5e365 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -7,17 +7,17 @@
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio/driver.h>
-#include <linux/module.h>
 
 #define MXS_SET		0x4
 #define MXS_CLR		0x8

-- 
2.48.1


