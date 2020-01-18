Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2B71141955
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 21:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgARUGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 15:06:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45997 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgARUGT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 15:06:19 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so13370225pgk.12;
        Sat, 18 Jan 2020 12:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWaeLDuJaWq3REpOKMxi5bJ9XNrVq6CSFIuVtDH3A=;
        b=R5DfwbEW3C93Yjtoi+w0EeqUDRNHZ4l2CTluImw4w3+4C3e7QVBteXi/7HmfAlIkH9
         smIB4peZ96uNzyt3vgOX4CDCaiABpen1VK/p08B4oIMn9XlA+Hkw4I2OU2uLL+3LsjLX
         Vdgpi19XIrRFh5v3mz0aMAynKmaXQGq3vqdt+p3DfPChEkicIbEts84QDHpTCIWks27l
         5f/jexM6e0Vjg4hzJGcWanRV28cWSwuYSoeiH4t8IQFeyvGOeyIoj7Twp2O1gw/gEyVg
         OPV7FfGfPz6TUzgW0rnsGz5++vYL5H6VTJknob6hvjXWcBXPwDaBy7UiWyNmo45QyGZq
         iIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWaeLDuJaWq3REpOKMxi5bJ9XNrVq6CSFIuVtDH3A=;
        b=KSUwbYdy7tNxSNuvVht9PWQtW2Pbuug0g2JdScQ4EdiaKPAlp3pnUfP2WQY4cAizRj
         zfaKBX5P+k8hYTxNXWzx3ItSg1ygTk4pDIiewIAT75Te1xaFjFbJkw4Kbqcb3V7f3cH4
         JghjhcwmaM1EwpNbF0PrAdrn+urvdwoRoxwK6+OoCfpqqIfYKlT/DDaHAoMXskR/gs0u
         m+F4s81V/sFf/X/u2VNdyQAcNIAPNreA0ZVFmtaDJtERAatBdlaqAyCXkngf4b0XDNS/
         1dqjUipj4IgSK6fuFNCqOcEN/Cl4Yl3VPyPxJoj7F8Glh3yFQYnzaLfXpjXgztBhQ955
         IzWA==
X-Gm-Message-State: APjAAAXFFk9lE+6zvNfRc/nhxM8XDyVvbvLIYs2pbMZUgN3kBTOGEivr
        k6tpiJSoUiLgsTFCZz+f9Wo=
X-Google-Smtp-Source: APXvYqwIjYmkUsNGLFzJm2cZUpe1ADOKkBEzcWqtdFs8dOfB1TZnfWX0dPSDryWKztYRppJfW6pb0A==
X-Received: by 2002:a63:1210:: with SMTP id h16mr51586662pgl.171.1579377979025;
        Sat, 18 Jan 2020 12:06:19 -0800 (PST)
Received: from localhost.localdomain ([103.110.147.194])
        by smtp.gmail.com with ESMTPSA id w5sm31883394pgb.78.2020.01.18.12.06.15
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Jan 2020 12:06:18 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     Eugeniy.Paltsev@synopsys.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        asachin591@gmail.com,
        sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
Subject: [PATCH 4/4] GPIO: creg-snps: fixed a typo
Date:   Sun, 19 Jan 2020 01:36:07 +0530
Message-Id: <20200118200607.68830-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

we had written "valiue" rather than "value" and "it's" rather than "its".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index ff19a8ad5663..1d0827e79703 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -64,11 +64,11 @@ static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
 	if (layout->bit_per_gpio[i] < 1 || layout->bit_per_gpio[i] > 8)
 		return -EINVAL;
 
-	/* Check that on valiue fits it's placeholder */
+	/* Check that on value fits its placeholder */
 	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->on[i])
 		return -EINVAL;
 
-	/* Check that off valiue fits it's placeholder */
+	/* Check that off value fits its placeholder */
 	if (GENMASK(31, layout->bit_per_gpio[i]) & layout->off[i])
 		return -EINVAL;
 
-- 
2.24.1

