Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80436142868
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 11:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgATKqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 05:46:53 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35469 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgATKqx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 05:46:53 -0500
Received: by mail-pj1-f67.google.com with SMTP id s7so7000116pjc.0;
        Mon, 20 Jan 2020 02:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKQd08QDFRtvTj1ZwdqX1fz4cEVtWxEffFD2wFMazAQ=;
        b=VBmmPkLlsDnv1RuzEOTwTbhpAtnQ18ML5ejXF7Ua4r204fKO6OK871CoKSb2R/KvFJ
         vyy9OIe9n+KWIvvbIpgD1SDKiF9FCfbYWm48ElhtzDt+5N0JNQfUMiHIp0B+SewJ/WnQ
         aDOZsC2nhtcqQm6olu00E+Rv3YaJMKAkjNkTdaVCxZIIcGtviCs5dRqmj+J9A49Cjo1U
         8+O+o/zQX7r9Q46YJ++nkTNlglZEmZVqfi4HrK2OC8zoZe0YVv8fYoPFJMi/ZtwHFxjH
         Y8JZ1T/a8lQ3ogFI826bd3rQPE2DGcMfoXidEicEDYwBUOWArxnwFgZ1V4AkqNLbJhmX
         P6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKQd08QDFRtvTj1ZwdqX1fz4cEVtWxEffFD2wFMazAQ=;
        b=FrjiKsuLNxc0g04+Ox9DOkyg50dIxFfqKSPzf1Q9sGMz5lnoZPT5RmF/bqgAJrDISI
         SlwgfbADTnFlsiIge05qIcVdG1QF7eGVdy5Sl3NTeSgl0LuVMyLgdOMrKddKh9IW8bO/
         9xiBxC7kneL36hf7jDP88oc1XQKUcbCoZoKQ1+IVMjNedUsG81JxrNhMqbN3jasnG/C6
         nOYLMro3jcAHgwlzQGXyxAxYC+MunvSrLxU2S0pqzT15vqJRs2/AahzE3C/nIYeEDPP7
         nAtZDxVM8TPWx2YiXcya3R9llTxOL+Dw3IZOnIEmsJMkGfx/eyIcwwi+t2Zq1/1uTJuo
         pfMw==
X-Gm-Message-State: APjAAAX1Ibk9XrR9FALyTUvZLhmdQAVUxXiw7+KknXKeR3LWDQoHZdnO
        n2Dx0+cGUd/07urf1z8EyglpG133
X-Google-Smtp-Source: APXvYqwdtxa+6QbNdzRmdFDcJYkOSnikPgB0mblZVQ7Un9nKI1Jyfhjs7Vlm7VRJQljp8lJ5uf34DA==
X-Received: by 2002:a17:902:26a:: with SMTP id 97mr13945149plc.74.1579517212463;
        Mon, 20 Jan 2020 02:46:52 -0800 (PST)
Received: from sol.lan (220-235-85-249.dyn.iinet.net.au. [220.235.85.249])
        by smtp.gmail.com with ESMTPSA id d14sm40564927pfq.117.2020.01.20.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 02:46:51 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: remove unnecessary argument from set_config call
Date:   Mon, 20 Jan 2020 18:46:26 +0800
Message-Id: <20200120104626.30518-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove unnecessary argument when setting PIN_CONFIG_BIAS_DISABLE.

Fixes: 2148ad7790ea ("gpiolib: add support for disabling line bias")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

No argument is expected by pinctrl, so removing it should be harmless.

 drivers/gpio/gpiolib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 78a16e42f222..93d12fc9f82d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3057,7 +3057,6 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	unsigned arg;
 
 	switch (mode) {
-	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		arg = 1;
-- 
2.24.1

