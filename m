Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F247134CF42
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhC2LmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:42:06 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:41691 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhC2Llj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:41:39 -0400
Received: by mail-lj1-f177.google.com with SMTP id f26so15526705ljp.8;
        Mon, 29 Mar 2021 04:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uzzBZzKSh0uKl45q2UqHsjLSh2lEI+XdSkO4BJlUPus=;
        b=CntSlwy+2CwPDmM+89ZJNmfQz/tJjpp6z+1pS5km9BOW9IajVj3VpRrp48rSi3Zh73
         WIbMB2jLDpsSKP21p5jp1Zz65nEj4xdjmZbDFYCKusmm39qHrpKHmYEdfQcWGj4RgnQp
         I40rBBqFeZstHKkP/pwAo/Ce6i2JN6o6vbDJQxUqkUaWsh4En/bwll5diZPAUNfSzIyh
         rONjHvfg9ininLaY0mu+XoXDFZuCYhxqYpIBwnNREcSBDic8cPpc57FEqVUrpS3w6oI5
         puYXluUQWmfnZMjhcUuvlvJxxVcHV8jSAjimG+K8GM0S1+bmjDLVzfAbNIQ8+ZkSIyU+
         +/SQ==
X-Gm-Message-State: AOAM53003s1qpwO534a4YWU8SaQ2MzlLYxcfwXWGB+5ov8QVaiqEawKq
        ld2kp4+SVFVAH8j2r6vqquyOqMrp5DTeiQ==
X-Google-Smtp-Source: ABdhPJwBzTv/bSfcMTTjPl3RbfBy5JY0KZf+i3hKzVc/blLmEU44IQq/kRyZsQnQRLWoSJ4K13qucg==
X-Received: by 2002:a2e:7a11:: with SMTP id v17mr18071884ljc.403.1617018097908;
        Mon, 29 Mar 2021 04:41:37 -0700 (PDT)
Received: from dc7vkhyh15000m40t6jht-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id z13sm1809648lfh.144.2021.03.29.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 04:41:37 -0700 (PDT)
Date:   Mon, 29 Mar 2021 14:41:31 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from config
Message-ID: <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Make the gpiolib allow drivers to return both so driver developers
can avoid one of the checkpatch complaints.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6367646dce83..60d61a6314b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2134,7 +2134,7 @@ static int gpio_set_config_with_argument_optional(struct gpio_desc *desc,
 	int ret;
 
 	ret = gpio_set_config_with_argument(desc, mode, argument);
-	if (ret != -ENOTSUPP)
+	if (ret != -ENOTSUPP && ret != -EOPNOTSUPP)
 		return ret;
 
 	switch (mode) {
-- 
2.25.4


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
