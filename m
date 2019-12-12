Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C5611C5F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 07:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbfLLGff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 01:35:35 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39551 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfLLGff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 01:35:35 -0500
Received: by mail-lf1-f68.google.com with SMTP id y1so783777lfb.6;
        Wed, 11 Dec 2019 22:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hm/O+8iLvUpIN7zAOCeaNWnmTVwhDTl6QvgdqsBbH9s=;
        b=XAB6FCv57L78E1iIGJ3IPdh2HaaT9PQsoGjUozln9qScCDvV6N/geOkA6AtgR63e3B
         axPYgz2FHbyBADNSRy26XJIS9gfm4BR0fViIjzyFUX3jaYTGAntmmKhAkzIz0mAG4TyK
         4utbaDAmotmhzsqZmLOcDemhiLMMi6upOBLfBh0fh+FzDbjXF0A7iZtbsxTL/r4X3J0e
         3cAkSf9Y1mIMYq+Y7+HNsabFml55sdRtXTFBHuYD8jK8ipvWVBS3Mv5svebZh2Nal+Rq
         zajh1wHYaB7hp+SclkuzkI8Am1OaxZcLbN2TIK6lA+1res3cLeWFBz0EJjTcHigbFHC+
         RGbQ==
X-Gm-Message-State: APjAAAVUKcifNd3ai/ayjDGrNafLMIwcMRIVZtOB+VtkkRMj4lZbV/ni
        KmsqCGdkYTgYzuJoCbOyOAw=
X-Google-Smtp-Source: APXvYqxNi8/Kpm3AwGj2j1bDb7P73QrEP+IeNBj1OPWrAiPOaK6R7yE1YE1kwHflhH2bYr5VImshIw==
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr4584538lfq.176.1576132532549;
        Wed, 11 Dec 2019 22:35:32 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id m15sm2414125ljg.4.2019.12.11.22.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:35:32 -0800 (PST)
Date:   Thu, 12 Dec 2019 08:35:19 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] pinctrl: pinctrl-cherryview: Use GPIO direction
 definitions
Message-ID: <78255e34b3542b57955565bcf1b518b1369dd541.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
returning GPIO direction to GPIO framework.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 582fa8a75559..7f049c17fce3 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1287,7 +1287,10 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	direction = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	direction >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
 
-	return direction != CHV_PADCTRL0_GPIOCFG_GPO;
+	if (direction == CHV_PADCTRL0_GPIOCFG_GPO)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
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
