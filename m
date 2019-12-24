Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1D312A11E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfLXMII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:08:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51506 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLXMHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:23 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so2268034wmd.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v1DqF/dTLuCs5Z87qkvcT7Fr54LZA0AK0GHAIFk9wBw=;
        b=uE46gJYKyRsUUFjmpCZ4sZOGTvtj0ofO6r3wWU5hlYWDKGN16KYcHqGd6wDni4CqRN
         rswdF8E5TF8ik3/Y21p0v8UkjqL3Ket4z8y3EqtIdA5g/aONzERbJf3u7hm+Lk5QbVYN
         27YBD+thBMW8WSfyYnlitlfQExiKE9Gjdp02sKKtkkxd7x6yEWtFWPbOOF63xB4gTb5L
         rSotYkgQxFvGgUQb3ATbLXBG4n6Xmx/DPrTNC7iJSItw4h5cLDNJgOaPyyVdPiGlCtOP
         20KDJ5vEeuWDxONhkOVia/O+RHTYE755Vk3cI691OMsF0slrBXK5h7BEg8c/Zh5y0ugF
         QlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v1DqF/dTLuCs5Z87qkvcT7Fr54LZA0AK0GHAIFk9wBw=;
        b=P95aTX5yvQ+iKrcCpYPpa39XnuNKtee26P54u+bHty4RqvYo3W8UVyvrQjGwwc+gk1
         5HLbmBuJDpKapxl9Xnujg95rIFsNUOu28N9Ah4nHrmbzJC35QFI8mUqk+iECKwWsmsAh
         s6yzmoYOG7Fo10QjCC5/E6H1Uvh7oRaArnMMY4fRMP3QKPWHXjPSYcLXKhcXxCNbU3aU
         VY6FLYE15y4tMrUSpZhYnnpFLrxQI0i752GxySfSScyfVOq5nTQf9tlEi6ikFPZWT6VT
         TaxJ6Ar4IwFVCSYrU+ATQr9xAfkMEgTxuyUpb+dG3gGkRfMj6t/bb5a3KBBwJ7u1aMlv
         crXQ==
X-Gm-Message-State: APjAAAXmP9xRQWzlIJ/dx04KNkI0hTl0KGzaH1YGOuOel+IROnsjiCjf
        GvWthjSiMKSqcsQuq0P1vkpk5Q==
X-Google-Smtp-Source: APXvYqwugXFAdnC+IYeBEXuUgZf/SVzBxGb8GJ5l4WMawoAq+vKoVp0lk8rPEKM0YXq3d7xmkN+10w==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr4050459wma.62.1577189241474;
        Tue, 24 Dec 2019 04:07:21 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 04/13] gpiolib: use gpiochip_get_desc() in linehandle_create()
Date:   Tue, 24 Dec 2019 13:07:00 +0100
Message-Id: <20191224120709.18247-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 68adbd2179a0..fcec8b090677 100644
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

