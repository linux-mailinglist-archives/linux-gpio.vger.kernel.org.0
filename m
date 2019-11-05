Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995E0EFA84
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfKEKLZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:11:25 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42729 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEKLZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:11:25 -0500
Received: by mail-lf1-f67.google.com with SMTP id z12so14650135lfj.9;
        Tue, 05 Nov 2019 02:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NV7wUzVQeWdMxlMIouwKlaS4MIyZrdHN8UPQcESKct4=;
        b=md2Ei9KA5FnwbeCet5Zdloiwpn/OrhH/U940NqNo2H1nMHTTJMsB0fQ9VBD6oN+jbr
         CK58vnrbxNnorAMzu1MkpF5xRr5WLgostibqlJDlA0EUq4V0cJjQH+V20zk7BWLp+nH2
         5E/VBQxIMLeDwxqNgHCE4tnndEbTXFEezeACiRCyv0oh+TTVWwNsafNrMT8T35q5JtTw
         0nxuC2MDJQ0r+o1rSncD2WfNn/8OwQHgy0xAD5JxhUhAFVakYcnTGhgyeg41Oj3DwRsW
         +p/32x6D3PKdV5O4Lz8zlzMpuMeraWvVpDKnl/lVaDD5De7FKsNVTknpbuUlk2oVcdRx
         zj7w==
X-Gm-Message-State: APjAAAW4SKRqqsuCKwBEyCOkd5/yX+aMlS/Zpie/gRjpvW/MqZ3oxh+0
        Rm9TzVQR8fqocvd5B+0OKmw=
X-Google-Smtp-Source: APXvYqyCTHhlUYchh4oTZwNRKICJZGboQY8CA+H8n31ck4TtJr0IQxm0NgC7uxEODaqr0ARbIyZGrQ==
X-Received: by 2002:a19:c153:: with SMTP id r80mr19813941lff.83.1572948683449;
        Tue, 05 Nov 2019 02:11:23 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id x5sm10234451lfg.71.2019.11.05.02.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:11:22 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:11:14 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/62] gpio: gpio-104-idio-16: Use new GPIO_LINE_DIRECTION
Message-ID: <0abc74346803366d8407f231ed9544717ea13c9a.1572945633.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945633.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945633.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-104-idio-16.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 8d2f51cd9d91..5752d9dab148 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -51,9 +51,9 @@ struct idio_16_gpio {
 static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	if (offset > 15)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
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
