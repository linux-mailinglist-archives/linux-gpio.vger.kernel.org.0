Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED63F1B751B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 14:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgDXMa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 08:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbgDXMa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 08:30:58 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E5AC09B045;
        Fri, 24 Apr 2020 05:30:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so3666605plr.11;
        Fri, 24 Apr 2020 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=t9Lzyy5hmq/sWXwmK6V3xxvcVaLKMxmhplBn/KbogKU=;
        b=AkTXVEwSZkN0UrEMj153ZdmMhPBFg1AVBj5QcNAlNuSdnBDcTj15nb1h0DBAmpQCdl
         P45C+S/zE+jnY0f1syYEjoygUenKLDOMUOSpZnfewgHuhqB1Yc1JkRO3U0ChrYzaX5nB
         xJk6uVgor7q6NZKuCLA/Uw+3iKOaTRq01kLNPl5ZRQkwlgIOGalYwjsanYgaDBvePya7
         sS5CwgCc/SZ7UwfJH1AldjDcIt0BNnrSu070JHUFShdwM4kwbDPyyVpqrXuKx4wO0h7C
         xHxROMFrCoZEmjRjU6asoYWFsRQRg5poIx5BZ+/qxyoxDcCO5jLCTe4jxWB0TZaJrg3i
         MCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=t9Lzyy5hmq/sWXwmK6V3xxvcVaLKMxmhplBn/KbogKU=;
        b=Air+1juGzSxryn4xDht9ZIU2FCLV4pEDzZlf6O2C8VXZBlArteO1MWtqhv513Bk330
         5gEYBVLkWiYMT6EKlxjl93dIcFf1v9OEZG4FiWDbnWfRfID5OsutvubPVWqWGI2Rg8UI
         PqI9dh4s9J9PLKrtjnTB+XZ17ZprZjdZ69T/yFnGgYcpFCaObtSPa68si9uP8AFlOqOj
         kZL5bsQA+UBhUWIabNe3HGILA41soWLpn9zCIJf5bjOLSZhOF1uUULas8vjW+lrcurjI
         p0P/kWNOyLuHIAArbFj76vMW7YGGRmjM3VyFzzFWbwrtguntUguUlh3ALrg8UccZC/Fp
         hcgQ==
X-Gm-Message-State: AGi0PubhfHu1R+0hwG7VC9Isu159GWnJTEozshqnmPAnmp/8bJ44JhQV
        /HaXhuk0VJbGvyhzKtZAQKk=
X-Google-Smtp-Source: APiQypLWlblKpczKfwKO4MBHWH1VTc92fAppAaKzkMK9+L+S7l7hehZQG15Du2fyFvH2p9AybrXPVQ==
X-Received: by 2002:a17:90a:3441:: with SMTP id o59mr5344496pjb.185.1587731457833;
        Fri, 24 Apr 2020 05:30:57 -0700 (PDT)
Received: from syed ([106.223.101.26])
        by smtp.gmail.com with ESMTPSA id p62sm5560770pfb.93.2020.04.24.05.30.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 05:30:57 -0700 (PDT)
Date:   Fri, 24 Apr 2020 18:00:50 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <20200424123050.GA5653@syed>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the thunderx_gpio_set_multiple function in
drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
Instead of looping for each bank in thunderx_gpio_set_multiple
function, now we can skip bank which is not set and save cycles.

Cc: Robert Richter <rrichter@marvell.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-thunderx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 9f66dea..74aea25 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -275,12 +275,16 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 				       unsigned long *bits)
 {
 	int bank;
-	u64 set_bits, clear_bits;
+	u64 set_bits, clear_bits, gpio_mask;
+	const unsigned long bank_size = 64;
+	unsigned long offset;
+
 	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
 
-	for (bank = 0; bank <= chip->ngpio / 64; bank++) {
-		set_bits = bits[bank] & mask[bank];
-		clear_bits = ~bits[bank] & mask[bank];
+	for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, bank_size) {
+		bank = offset / bank_size;
+		set_bits = bits[bank] & gpio_mask;
+		clear_bits = ~bits[bank] & gpio_mask;
 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
 	}
-- 
2.7.4

