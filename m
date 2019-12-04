Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FA7112F62
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfLDQB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 11:01:58 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53826 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbfLDP7Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:25 -0500
Received: by mail-wm1-f66.google.com with SMTP id u18so247446wmc.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=90rmEcHqIRhcxzdKSYRA7QCcxU0JzYE9Vo2kuWKmjpQ=;
        b=mmTkweyBNsjrZtAgXPBok8OBhgsfAz3TFza+xoR1riA3xSrtbkIcz4fwWBJ/evT10f
         /poQc8k9UAEHBjWrIG0kZDOEq2fAvw3NG25cCuJWNSBepJOfMLXyiHt9Ef6VKw7lzHZY
         7wbf4NnnNz+RhwliSS/B5oFDjr0QxZxPyZ47zxk9+bxAzQaYTks0BfCWjHRAQ6KOq1WN
         6iML7GugNGjIRV3a8Rk8a8cJ3SkvwPrvDoimoncTzbeti5BFPQq82SpmrUzN+6iWQmpj
         g7MKCUPuE6o78C+t6DtYIt20enxGcn9BOIZ/Z5LEZfI8ZlVMlY7iFjyFtu3vvWxbuNOG
         AepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=90rmEcHqIRhcxzdKSYRA7QCcxU0JzYE9Vo2kuWKmjpQ=;
        b=GhlDubej3/CrUfR2z1EJ0CQDNyEAqOykdd1eORJHFDR1aBmsOrnwZ57UWxzFxe+Eir
         RLpuptxe5yOOB5bouJsRtl0cpaqTy/h1dZhcb91sjdXFEld6fJHscdFkElyukrFbSplx
         pQah+sSG3h7xos3ZZCE+jPOFfvy5YnGiFlsz9f3Hi4tgFc9UW/sAx1jJRBMniTyvKusn
         /2n9JNoR4cTY7rXqJ5NZq5gRUr5PeHoHib6u7M6NsPaEkfa5ekPh1RviJRQHMGpdQ8R+
         CIa7ZCnhpqGjKyDfNUhzSXV97GLKMy+3+qu2H5LSPX+RElRYRl8a78okTU9NSYgnD+BE
         +EAw==
X-Gm-Message-State: APjAAAXxB5ue3883atX2/f/FBsRYv/V+zsKJuq3X+yIMkhTAkvCN7MRY
        L0m9uEdB5G6n1kmsSGhKcIbNHA==
X-Google-Smtp-Source: APXvYqxDar3z8bnynnE1xVqsig1swJfibpNd7XiIpnAOj0XSqrF4GPSvryLVKQdkUNIUq44PQyRyaw==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr193843wma.144.1575475163325;
        Wed, 04 Dec 2019 07:59:23 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 04/11] gpiolib: use gpiochip_get_desc() in linehandle_create()
Date:   Wed,  4 Dec 2019 16:59:07 +0100
Message-Id: <20191204155912.17590-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
checking its return value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b3ffb079e323..6ef55cc1188b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -678,14 +678,13 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	/* Request each GPIO */
 	for (i = 0; i < handlereq.lines; i++) {
 		u32 offset = handlereq.lineoffsets[i];
-		struct gpio_desc *desc;
+		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
 
-		if (offset >= gdev->ngpio) {
-			ret = -EINVAL;
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
 			goto out_free_descs;
 		}
 
-		desc = &gdev->descs[offset];
 		ret = gpiod_request(desc, lh->label);
 		if (ret)
 			goto out_free_descs;
-- 
2.23.0

