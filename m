Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0392E2DA2A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 12:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfE2KOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 06:14:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44450 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfE2KOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 06:14:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id w13so1288407wru.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2019 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l67SUiLhnHbZC+GGf53I8mLvwJKgD1LNbRPrFrC0N7s=;
        b=DVai3SyHuj37o+9DQ9ge6eqxTqMJXJ1dPA/pexA/z3yFqx209mZbdR5Dv6CnhStwnX
         BUGJltoZAKQtmmPSCvH6oSiM6/I3ag9LVeyOJ1sfCYHTtb6Z7wNPHdVOT+XS9lso6mFs
         sG2Vl811ndRPbP8vtxe4BlAEMOx1lnv2wYE8SrLBX2G0ZwsSnM2nlpstISt9tbMdx82v
         u8XEH70Jd/36jB+mavgmK/MAPGxOOX6uvkSclphdbZhoV+A7lWmAryOCF4GHH5GONHkV
         8k9CbnKk76/fLlrvaDUQanuzAg3WWFaDnbb5fZe7c642o4dHDGiOfSfMUfdG1CW1umcp
         5+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l67SUiLhnHbZC+GGf53I8mLvwJKgD1LNbRPrFrC0N7s=;
        b=LZAccDTU8mR1bqnvhx3LA7GwVX4HHeHUKtAYUOybKnI/0tNzJ44bGyn3bR8yGvp25X
         qmseEXOLzhb99wkkw4IfLAM+XgMxbTCHwBFYcVAj+cXU/lSh1I/91AoVBOSCEiYaasHG
         90EOhbmN9L8VqewdXTUCUY9B+NDXq29q30OldDPifsAD8R68zQqvlOTi0aic52k0KtP6
         Xb71kp+ZKbDVez9TbXjwN6pNOLwEKMbfotVDLFhNaR4d6waTnvbqPlhNT6EOQx7s9jGU
         zJ7OTj0ErHoKM3GPA0FXVYWTMvu6fd+qKoqJVuBP/c56W6+sujdWQ/mJN1pgr8yxr3Mc
         x4gQ==
X-Gm-Message-State: APjAAAVyiCxMPzemml+iyqMBbW8BCYf/xGY01e05YdAabFEXv9jR8LNO
        8W2pNGfurPYtXQcf2rGgEOcmL72FAzItYQ==
X-Google-Smtp-Source: APXvYqwrOP3EZE28AyFzSuo4GcLTHFsGvn7K5QnexTH7EjOf0oJ/UD2EeyvLEC+ZRpersH/t52qM4A==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr43828118wri.190.1559124842396;
        Wed, 29 May 2019 03:14:02 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:c225:e9ff:fe2e:ea8])
        by smtp.gmail.com with ESMTPSA id f18sm2028040wrt.21.2019.05.29.03.14.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 03:14:01 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     linux-acpi@vger.kernel.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        rjw@rjwysocki.net, jarkko.nikula@linux.intel.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RFC PATCH] gpio/acpi: set direction for ACPI OpRegion GPIOs
Date:   Wed, 29 May 2019 12:13:42 +0200
Message-Id: <20190529101342.30673-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ACPI GPIO OpRegion code never sets the direction for GPIOs that
it configures from scratch, leaving unconfigured GPIOs to be left
at the default direction, which is typically input not output.

So set the direction and default value explicitly.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c9fc9e232aaf..02a2bc7fe18b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -966,6 +966,12 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 				goto out;
 			}
 
+			if (function == ACPI_WRITE)
+				gpiod_direction_output(desc,
+						       !!((1 << i) & *value));
+			else
+				gpiod_direction_input(desc);
+
 			conn->pin = pin;
 			conn->desc = desc;
 			list_add_tail(&conn->node, &achip->conns);
-- 
2.20.1

