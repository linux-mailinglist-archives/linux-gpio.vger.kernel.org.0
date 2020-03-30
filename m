Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8990D197762
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 11:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbgC3JDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 05:03:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34984 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbgC3JDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 05:03:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id d5so20650958wrn.2;
        Mon, 30 Mar 2020 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itMFx+Y5RC59vxmAtpIknjJLoebwe9CMvealShIhysA=;
        b=P4sTuf/zJUrFrKMvpqEru0y2E56hNWkMzi2owqRBwRDE5dC8n95nuxE99Pi3+IEtso
         jI8kDvMRZ48Yb3GRcLITDOtFmxGhMys/BTlSeiUne6xfx+DHQGHxpJYL2TNa3v3UxcLg
         uDbes+7YW9Oz5npxUq00mNchDq17xLocAa/yDiU9qa06R1B0wbhNKMXIuRCLKLny/x/O
         omRcsuaOnMNsnxVXF/Id7pVa1t5Dp1Xu0GPk1QF3dpzB837mU2TE3gY+WX7OEuCQEjFh
         k8Iat2OpQqBpJU97tYujmvTHq9h7FSm4C4W9fmRJpw6hPvW9CCUMI8+erTabIbp00ERW
         VwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itMFx+Y5RC59vxmAtpIknjJLoebwe9CMvealShIhysA=;
        b=FXOBzxEDWaqegw9HqETkwhsNHtGXNXQjkPI5MfY7IMF3AQ+++FM7TbHPQZjUYzvBNy
         wLuyyBtF7ONbeEAGPQ1zC38h+sWYpjZ4aawheOYeAgHwNWLxkhPvNeaxE8xrzv5MscUF
         DGa6l/UhRAloJKvOoj6zR9h0QBhnhM0jmV8ILMu9g3rZg9tSpWBi+EkVj/j2W7hDGdT9
         eTmkWfJ+bONI0QCGeUAhaARPYTR1k8AvXlS3ZTIT82Q0FqRunx5NXUFaLw2EXUsBBU8O
         ZN7+0bBy3ErhG51IvEPd591MTB9F6M1q3VJwfo93sOy2Nfz/BrB6ajNccksm9FKQILce
         RDKw==
X-Gm-Message-State: ANhLgQ3OZOKQxnmnV/dcqXkn+1eQ5C+eItQvZOV6KX0oclMPgqtZXPFi
        JY8d6obc/cfyQjB9qoerLD0=
X-Google-Smtp-Source: ADFU+vvceW2d9DhwAfvPuGThL4ku8hoyxLRUxnWSxW5bODnVsppkI3QFE5Vmatmqh0iLJ+kPmmugdg==
X-Received: by 2002:a05:6000:108c:: with SMTP id y12mr13563108wrw.211.1585558983966;
        Mon, 30 Mar 2020 02:03:03 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id d13sm10763114wrq.11.2020.03.30.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 02:03:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] gpio: Avoid using pin ranges with !PINCTRL
Date:   Mon, 30 Mar 2020 11:02:57 +0200
Message-Id: <20200330090257.2332864-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Do not use the struct gpio_device's .pin_ranges field if the PINCTRL
Kconfig symbol is not selected to avoid build failures.

Fixes: d2fbe53a806e ("gpio: Support GPIO controllers without pin-ranges")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e6f9def09f55..5c245883c9c5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2753,10 +2753,12 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
  */
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
 {
-	if (!list_empty(&chip->gpiodev->pin_ranges))
-		return pinctrl_gpio_request(chip->gpiodev->base + offset);
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&chip->gpiodev->pin_ranges))
+		return 0;
+#endif
 
-	return 0;
+	return pinctrl_gpio_request(chip->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
-- 
2.24.1

