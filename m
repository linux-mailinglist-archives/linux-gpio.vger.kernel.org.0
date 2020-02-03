Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C7215066E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 13:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgBCM4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 07:56:07 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53940 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbgBCM4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 07:56:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so6311631pjc.3;
        Mon, 03 Feb 2020 04:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wwQg80xGz2lOdnpP3qB15WfTcQFWbRLekpggKB7uAVo=;
        b=FmkR43QFzWlvuGQsXZv/HeuXhfVsKTW2ePq3sWmBa6MfUDnrAfXmmTm1UYJjeQwysl
         FdHgZ7UztBe9F4uAp4wQ1yHgH2StIF8OUxy7mJ5VNXnO4S8YAyrU1cOW329J819DPW4K
         0q7Keg1SFrSMF2XH83K53b8+K5BQQoXZN7UEF191PAaozTfR6IZje2UjMqdnuI89H3ha
         h/YvUks2ICLr4RlXGBj31b81xqJrQD/xcUm3/plma6bJlDzKp53FqVetqtx9yJiY4gnQ
         xKFva4T7Xloq4MR2ZdjS765pPYBVguklbRytodTbOYavTqHY7lH2O396FC/Tpdji2NOE
         8bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wwQg80xGz2lOdnpP3qB15WfTcQFWbRLekpggKB7uAVo=;
        b=YmCFwrx0JD6iRqFWrfEwbUSunHu8HRLKXD4AER2p/TDbEhztT8zw2DjKlrutGumgVX
         en6qy8+QxS3K7uSGhO7ONGBBuGQhcvHAqZsP3eJccuhXu0E6o/Fge+w+8tHNrh8nwwb3
         mnTQsHwurlWmROECAkBAmrT6JIZKZC6yDwmwHEseFikekKPMBA850T0nNnShZ4vVldu7
         ylrMRsFcDbcmaeosQekWZl4tCkTa4XuXulwLck3OU0RyPfwYIFJEHP0XO5Bq7MYjSyJn
         GvSMUggaTovdPflLuZDxkcHAfI4REYXgPM7X5wowfs/cE0FWuckNI4hQB1dpYjt59cpe
         3N1g==
X-Gm-Message-State: APjAAAVbavBW5WLN4cXZMSXAJF/k3waEOmSNKdI/elj56mBJIGhY9b+2
        uAebMJb6l2t1J6+fjPsXCdw=
X-Google-Smtp-Source: APXvYqzf387HOU7SZD8zCQtXi6rSqqJaz23t9qWvrRgRb9Xmf15JEh9ADcM5w7T11OtPywY62+bp6w==
X-Received: by 2002:a17:90a:3603:: with SMTP id s3mr29582527pjb.61.1580734566613;
        Mon, 03 Feb 2020 04:56:06 -0800 (PST)
Received: from localhost.localdomain ([27.59.202.234])
        by smtp.gmail.com with ESMTPSA id r9sm1406979pfl.136.2020.02.03.04.56.03
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Feb 2020 04:56:05 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, asachin591@gmail.com
Subject: [PATCH 6/6] GPIO: it87: fixed a typo
Date:   Mon,  3 Feb 2020 18:25:51 +0530
Message-Id: <20200203125551.84769-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: sachin agarwal <asachin591@gmail.com>

we had written "IO" rather than "I/O".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index b497a1d18ca9..79b688e9cd2a 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -53,7 +53,7 @@
  * @io_size size of the port rage starting from io_base.
  * @output_base Super I/O register address for Output Enable register
  * @simple_base Super I/O 'Simple I/O' Enable register
- * @simple_size Super IO 'Simple I/O' Enable register size; this is
+ * @simple_size Super I/O 'Simple I/O' Enable register size; this is
  *	required because IT87xx chips might only provide Simple I/O
  *	switches on a subset of lines, whereas the others keep the
  *	same status all time.
-- 
2.24.1

