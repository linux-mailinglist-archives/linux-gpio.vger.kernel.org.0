Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C038F50A0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 17:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHQHw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 11:07:52 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35942 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHQHv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 11:07:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id c22so6785556wmd.1;
        Fri, 08 Nov 2019 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwWgP/MNOhEz5ufCbsw4V77uL0IyMaSXQVGN4RuCrSY=;
        b=LlaC4oqTeuKPvEqNcqwu9cHHtPDasTQRScMSkObqZV0n6nBwCLQ7DxNBi/IvXqLmBV
         Yj9AmK7BnuRwu1gzBla4edDMlZzVm8MtxEcOznsOzb1x8nMlU+myOk4Zz0bufqK1ntv8
         65SfhR58oNCxi73hBnkLy6Ad5tNpYbJLRzY0oWHKUZuovWW7lceZQIdIf8ydFIOVy/f+
         eK1xL5zSxOGD1a8UjY1ovTXOYZIq+fgZJHpczxUcf6HtKbErKDvgXrh4mvC7u80pdar5
         oU4xx1cKcc+rNM3Zi7tBaoMAYg074thhsHhy0duDd9cyIhDPcHkRko+8eRg967uBJEm8
         gUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwWgP/MNOhEz5ufCbsw4V77uL0IyMaSXQVGN4RuCrSY=;
        b=CCRxOieOErKjzxJ8JjMgfZZHpxt/8BdOQkWy2oZ+q2ZK8YEYxaF16KJ51kQddv8UC2
         0BHglvaM4HteHRvh5fJOS/lN+8aicvEF4GbSXySq6jAg/YQdPkBaxXDobK65osJzo6Vm
         IEWga0QQzYROraIKNxoD+4+QMTnFMY9do3qNJws993ktR4pz3KzKCevqHmSGW7E6LatH
         mxCrgrgLvXj6XYQrR6tFNry33kpK27gAZQTBdjcyOZ4llxG5goWTUpUuj+HMjZjmVKn7
         Po/AYf3+At3c+vD1D7mvb8cpCnqHnFm1Ivkrv7+asG6miQ1owTGrxrYnEQm/Hmy5swqt
         rQKA==
X-Gm-Message-State: APjAAAVmKwI1BT5qrxzU5+LyuFhJPaqs4X5dNqwz+7MSobf4sDCzBm9k
        IFERKDVuN0yHXykH2FIFRZQ=
X-Google-Smtp-Source: APXvYqyO8I4pBhKQgwQAu5jc3LZRb1iJrhuy1UsmJnTFJns2I/1hjmKM6d4+WWGi+F8IYKPk9WwPlg==
X-Received: by 2002:a1c:106:: with SMTP id 6mr8561333wmb.33.1573229269372;
        Fri, 08 Nov 2019 08:07:49 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n1sm6682214wrr.24.2019.11.08.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 08:07:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Pavel Machek <pavel@denx.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: max77620: Fixup debounce delays
Date:   Fri,  8 Nov 2019 17:07:46 +0100
Message-Id: <20191108160747.3274377-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When converting milliseconds to microseconds in commit fffa6af94894
("gpio: max77620: Use correct unit for debounce times") some ~1 ms gaps
were introduced between the various ranges supported by the controller.
Fix this by changing the start of each range to the value immediately
following the end of the previous range. This way a debounce time of,
say 8250 us will translate into 16 ms instead of returning an -EINVAL
error.

Typically the debounce delay is only ever set through device tree and
specified in milliseconds, so we can never really hit this issue because
debounce times are always a multiple of 1000 us.

The only notable exception for this is drivers/mmc/host/mmc-spi.c where
the CD GPIO is requested, which passes a 1 us debounce time. According
to a comment preceeding that code this should actually be 1 ms (i.e.
1000 us).

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index c5b64a4ac172..313bd02dd893 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -198,13 +198,13 @@ static int max77620_gpio_set_debounce(struct max77620_gpio *mgpio,
 	case 0:
 		val = MAX77620_CNFG_GPIO_DBNC_None;
 		break;
-	case 1000 ... 8000:
+	case 1 ... 8000:
 		val = MAX77620_CNFG_GPIO_DBNC_8ms;
 		break;
-	case 9000 ... 16000:
+	case 8001 ... 16000:
 		val = MAX77620_CNFG_GPIO_DBNC_16ms;
 		break;
-	case 17000 ... 32000:
+	case 16001 ... 32000:
 		val = MAX77620_CNFG_GPIO_DBNC_32ms;
 		break;
 	default:
-- 
2.23.0

