Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D0DEFAB9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbfKEKRh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:17:37 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45791 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388128AbfKEKRh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:17:37 -0500
Received: by mail-lf1-f68.google.com with SMTP id v8so14630787lfa.12;
        Tue, 05 Nov 2019 02:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1gKqrETxlCTjerlOYNB/e2kAmDwEVlVg6eTrg5Qnlsg=;
        b=ptZosCUqBDU03b9u/301FB5TTHdeg2powtFN8DXnJ/1Ov3zmN64lfDL0+1JJxjMUXW
         cU9OkNg3FAMIU6DJ6HxzLjGiU7LxAD7S0W2IAo95YMCQQK9y4QhDvYtyPCDvbHhS+P11
         OGDq2oKsIPPnrISZp57JLO0KaVETdvPJDdzcsIGAfnZC8ioGkXp89dfGh4OrpBE1qOa8
         eHe3TKgxmbP2KfzFZ/AwwGkAH2J1bIa2Rxw3yepX9dUfOm9iA4FAQagcGe+G8r4jGnCh
         hudyCP8CXVLG6h0hc3w+fQnDqw7bvRctuZ9/kJr7/86122F9c+ayQJ9zN5g4Rne9QFR/
         Z8oA==
X-Gm-Message-State: APjAAAX4MxxCc3W5y/ez/QzQBycQBKklLZ/ZKVZfv+M/GPKqxTxPoOHe
        AS21FZH+DRWOCRDR2zcfG7U=
X-Google-Smtp-Source: APXvYqyQ+LD8n5jB1J8ikqZ9zUoKuoBTytrgbBFHu1s46xTRaFGFpjzwqSv/CFsI2gGafR8gle4dcA==
X-Received: by 2002:a05:6512:1de:: with SMTP id f30mr19972306lfp.176.1572949054571;
        Tue, 05 Nov 2019 02:17:34 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id h12sm4934955lfp.62.2019.11.05.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:17:34 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:17:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 16/62] gpio: gpio-ich: Use new GPIO_LINE_DIRECTION
Message-ID: <6f826c5cf6108cd4381130fd67802181f73fc056.1572945771.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945771.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945771.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-ich.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 90bf7742f9b0..2f086d0aa1f4 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -159,7 +159,10 @@ static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
 
 static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
 {
-	return ichx_read_bit(GPIO_IO_SEL, nr);
+	if (ichx_read_bit(GPIO_IO_SEL, nr))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
