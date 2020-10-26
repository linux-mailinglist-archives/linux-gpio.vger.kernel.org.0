Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF4E298F0A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781104AbgJZOSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:18:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53514 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780405AbgJZOSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:18:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id d78so11831317wmd.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=vxGqXy7wNCIUh9+OjOZz0S3AQIqHl536ZddiRstfn5wGdIygsNWwpFCy/DoUZ2hlvN
         vliRvdnj/+eHLFnmAZHHAI5NS2qIyzV+rpBhHhPLUFEcX3sQFs0Jbe5Oy11Jq0AnXemg
         4LpK+NKVrVxSPnR1d/ffl+aSHv6gq1GcnjJFCe2utDprdZ0eRfa9k+WiJypC271hSixj
         XS1lLFyV6HlCDrlwq8HcQsK6BT1aaCQduQhuTHGOlSJGmvZUwFnfEQvUTjpmZMZkKtCo
         tRt32noBkhsBCwmVa8xBjBTNLAoI6i7ebtthg34NJrN3Aq+CEHlwXLXa74at1WdtmjeG
         g0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=uQpLCoJ1PjWyq5WK81b9ibOPuD+U7SK/Iqf1S4zz/brLWYnqG4bbCfcDa3DnvpoY1E
         cFjn3AKDjK0ASS3wAt8wuNZQxWTvZ0eoQjWF8UNUo5krBsNwGaIczVLXWkQq0+n+up3o
         +XB8elMgsaX32RhPq4TFNze3uyyq2jWKH241H2jEnOc2CbBFWAGWZuo9CMbHXKOrpl3f
         9wAArDLc8mIYpsG9uUref4zmIureeA61uGnSpd5YSfupPk9WJS99nOSmvTgWiHDyZkch
         6Josf7fEKgOzKWdgYaW6lbAfpmFno2/qZu8pRYBdayZQrgenAqna777vvVVdpj9HU0ft
         GDuA==
X-Gm-Message-State: AOAM533iqOB3+jcKCeANFgyuNbkc20/ONfWGBcx5x1QxXMmFl/5TmFx6
        0P6Rz/hWxqg+MFq+MlDS9T71vg==
X-Google-Smtp-Source: ABdhPJyHzQu0rWuAi3N0Y1aO8jKTZys8Gp3U7BbMBnmufHm9Y0dWGIIgSKPumsGqk4x0JuxJNMOggw==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr16477484wmj.77.1603721931779;
        Mon, 26 Oct 2020 07:18:51 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/7] gpio: exar: include idr.h
Date:   Mon, 26 Oct 2020 15:18:34 +0100
Message-Id: <20201026141839.28536-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
References: <20201026141839.28536-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver uses IDA APIs but doesn't include the relevant header. This
fixes it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 4202dd363a11..1941ae533418 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.29.1

