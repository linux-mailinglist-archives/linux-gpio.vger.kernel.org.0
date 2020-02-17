Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADD5161BFF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbgBQTzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:55:09 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38921 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729618AbgBQTyp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so21192761wrt.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ibj9ygukPb9JYTU3mvyTkp2n0e9w9M7BBgYCc3RsiE0=;
        b=AfUrW2gbRewzH09iwIz4mOgbGI6xRBf9V9DBjRYX99k7rC43NLrIJeL6iJOtP29bzB
         XCOotyERZgjri2cgQbwB4/Xo+gvADjygCIZtn+ulJDnkKEj4NAwMK5r1IX0RYRQSwLve
         7kxRgQI6sHIb0PzQ5N8S/BuHDaQ4vkSwMm5wASgU/fuzdt7pY6b52pbEA92AZc/sI+0A
         mcwUlZB5A/LUknqRjE0c/UFaDX4boKsYsSjzLplgC/LBi17NNk5lWG11u5m0oBrTCoe4
         WLUWqiiC1tiNhiMhs3bf0+mvd9Hd6ZQemDM8+sGDb5uKBs9miGLRl065Hzb1zNdfuAIY
         XrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ibj9ygukPb9JYTU3mvyTkp2n0e9w9M7BBgYCc3RsiE0=;
        b=Xt7SG4l4I/iykWupaQDS/48xnOtvAWjHYjZd3UQGw2zZ2pMSnngHPe/Fmo4DIxlFZp
         4BZGl93GZNxnd+0+oZ9oRVTRqi+HfrNtTv+nZAkEyKA4IMIWqbkk1O+FenFmCqwNnNMe
         /KoJkZ+HgGn3c/96H7Gi2DsiHa5609TUjJWFx2QSFroxuylLO/8ugZS/Hr48zwbrrqmx
         IvFw/0JSePZu/bgzyFPSXP1Vs8GDsE+VyCMfCVuYaQAfyE7HagVA8D+jKEK9oVjlSpbO
         T9iWMwzNsLfSbz967qWy90EM2kfbrx6qiL7igg0zQRqEjJ3hKv+FDjPrjZcDv5NSn30E
         /2fA==
X-Gm-Message-State: APjAAAUzY2EppXGc5gwKQas8qd1xyz6Unrk8kUyLNGjDEgRavaSMTpoU
        KL1kTn2tuv6ERQPioNXdY+Xh/A==
X-Google-Smtp-Source: APXvYqwlWIo4hBNxAnsgARfbUQqYYsyWocS3dL48hvcsR9M5AfzTmKuPqXmaiVFdJ0j+MGV16uBXqg==
X-Received: by 2002:adf:93c1:: with SMTP id 59mr24275455wrp.399.1581969284441;
        Mon, 17 Feb 2020 11:54:44 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/6] nvmem: add a newline for readability
Date:   Mon, 17 Feb 2020 20:54:33 +0100
Message-Id: <20200217195435.9309-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217195435.9309-1-brgl@bgdev.pl>
References: <20200217195435.9309-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Visibly separate the GPIO request from the previous operation in the
code with a newline.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 12e2991cdeef..07af9edea9cf 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -347,6 +347,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		kfree(nvmem);
 		return ERR_PTR(rval);
 	}
+
 	if (config->wp_gpio)
 		nvmem->wp_gpio = config->wp_gpio;
 	else
-- 
2.25.0

