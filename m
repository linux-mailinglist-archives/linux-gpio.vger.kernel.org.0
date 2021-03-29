Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6806234D094
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbhC2Mzr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 08:55:47 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:34601 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhC2MzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 08:55:22 -0400
Received: by mail-lf1-f50.google.com with SMTP id i26so18219743lfl.1;
        Mon, 29 Mar 2021 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtTYC3Y2jaT3AOBBoCforFdwsVp/bbxeq6kYdIhJlRU=;
        b=n08g9mpHrcrhEvlna0GPgScJGSkOZm0HIspdYOCyL+YFvf/0mPu37im2DPKn4In6dZ
         HsDxwKbR9+qWECfvcaZ7gY0hjisEYvYHWpPAJhFmTJkQ+qPhlNnw9jq70iLOu06ajM0n
         LSKb1nabllNfDgas3q5FAreyxRTOpPKScbjvQa7wZiRujukHXmTMESgn9dfrvQWj5rN9
         wLFj2vGGTpKdWuT1X5bR5HOfNt+YXwH/4OQmHqIloMet7HT1D7zGWxYH83CxfOCSiiWU
         O+UUuNTI+ntvMPf127zPzraI+Lz/yWT9XVm18X1WejbB5mvXH9jQL2CIoej2M1MIHdKr
         K28Q==
X-Gm-Message-State: AOAM532fdapgAIHGgNH731dlv3P2krajnM0Zxn22zYIjyJU1gA4SpVl/
        yiz+cc4K1AYE+vhAE06K/5Q=
X-Google-Smtp-Source: ABdhPJycE2aOirWBR4efoFP92V6UmP7YeMLXiv4tMyVpbu+PWCRcUICKepXfC17fh0qq5z05n8zaDA==
X-Received: by 2002:a19:946:: with SMTP id 67mr17540614lfj.74.1617022520837;
        Mon, 29 Mar 2021 05:55:20 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id n25sm1828258lfe.86.2021.03.29.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:55:20 -0700 (PDT)
Date:   Mon, 29 Mar 2021 15:55:14 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v5 07/19] mfd: Sort ROHM chip ID list for better readability
Message-ID: <136a118258e9d3fa60ad2732de67d2d723ade1ab.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sort the ID list so it is easier to see which ICs are present.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Suggested-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v4

 include/linux/mfd/rohm-generic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index e107b4769101..9e2880e06950 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -8,13 +8,13 @@
 #include <linux/regulator/driver.h>
 
 enum rohm_chip_type {
-	ROHM_CHIP_TYPE_BD71837 = 0,
-	ROHM_CHIP_TYPE_BD71847,
+	ROHM_CHIP_TYPE_BD9571,
+	ROHM_CHIP_TYPE_BD9574,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71815,
 	ROHM_CHIP_TYPE_BD71828,
-	ROHM_CHIP_TYPE_BD9571,
-	ROHM_CHIP_TYPE_BD9574,
+	ROHM_CHIP_TYPE_BD71837,
+	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
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
