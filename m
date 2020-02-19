Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5315B1640C1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgBSJrG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:47:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46345 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgBSJrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:47:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so27351598wrl.13
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZSaOE1Qu/PM45Zep27V+i+rAGmMBianqxHPUxijGniA=;
        b=RoGEQR6+uEBeEhZkN+YFjpt4d7LT6G0ht2pkOT2ruGlhJI+dbNRYMwBlFGHQ1YUzIs
         +viyQVEKmxvuXb8EbXWEmstpROHR/KznqnVK9El5RKd8sIcfMP9Jhpq5mG+cVSig80WM
         y3NTwylBFmXRdWl9oSFmfpg60/n8LBwfcuG3hgNSohre8WBIscoFX+YJcROQ5qr98Snr
         kW1EHZGljfVf+OrgXOK7c83BZSw1CZKDKdCuxYj9lTIHkH4fCqdI187fPDoHaFE7A/JQ
         yRVgIJJZceLiqbS57laRbM/plKasZUaD/utPVUstGzjriP/5SMTg1EA4l6x/O6Wu+hjD
         qK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZSaOE1Qu/PM45Zep27V+i+rAGmMBianqxHPUxijGniA=;
        b=NnWKqUiZd71JXazrbvz27XE7VTytRZA7OcNpCBsGmJNRKhA03pDcaCMunJbBz4Qjpo
         doqv4S8kpEvXD4o0zmfqt/i+PlmI/iy2vD3b/6i1IjZPxO6C6uBvk4EqTEgzpmR7wlKv
         fwebmo7haKJtASqKdsQtB260g53DN91E3dIEtsxAg5Ttdkf9Pv4GjxNq4cLwp8ikVKcu
         UJBL9vLSh8WAXV+Qb8TTvpl0vhoLkgk6U+H5OBbKMq/DhAGykJy6KDMCtAR2Uu6D4RS2
         /RSVoLLCTdFO5y9zudBd1mYEC491IgjOfnKR6b3DNfuuUpCEXisczBY6ZfFOzAIClOo5
         3tTg==
X-Gm-Message-State: APjAAAWmzC4h0wCHPeozeq2BSnDzBETe3ZseDVtfD+4w/T3xWqmJZ+Kl
        AsobQqJY1E7TFPstktDreFwgjw==
X-Google-Smtp-Source: APXvYqxE8JIxqFn+JsIZXr2z1XTvUwEMzRNPle7Eb2m5gt9NpGFBroR3+Wsds7aTN91RKZGXNlgutQ==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr23976923wrr.354.1582105624478;
        Wed, 19 Feb 2020 01:47:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s8sm2320308wmf.45.2020.02.19.01.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:47:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: use gpiochip_get_desc() where applicable
Date:   Wed, 19 Feb 2020 10:47:02 +0100
Message-Id: <20200219094702.6463-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Whenever retrieving a descriptor from a gpiochip: use the provided
helper which checks for errors.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..5c761a738065 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2953,7 +2953,9 @@ const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
 	if (offset >= chip->ngpio)
 		return NULL;
 
-	desc = &chip->gpiodev->descs[offset];
+	desc = gpiochip_get_desc(chip, offset);
+	if (IS_ERR(desc))
+		return NULL;
 
 	if (test_bit(FLAG_REQUESTED, &desc->flags) == 0)
 		return NULL;
-- 
2.25.0

