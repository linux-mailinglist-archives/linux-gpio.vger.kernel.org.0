Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A84611AD8C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbfLKOdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:33:39 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43711 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbfLKOdj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 09:33:39 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so24299303ljm.10;
        Wed, 11 Dec 2019 06:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nSud3KxVTjPZ5S9+InQuyPtOAwgEjLaqA66waQ2fitA=;
        b=BvTaXmX8doWnTyYaM04seO7jvtkzVEKjmuw/qFwpdWWFJlZhid/CJTDqMmyAXCcZci
         mEBBOlVSJAdO8qeUj8lEl6a/ncqbqleFAd0qifQBy7XQeZydoiXLTZrzDqIrm6PXJx/g
         fnQLOy21n6PgM5BRfEjd4ixopkICOaGNx+wdsuYqUqyTFTwf1L3PCHEQQhTotVqeZxQw
         weG+dYNcaxtDL/Zk8nysJ2OsacPStlZeMf7M9NVqW9+8sToZ87iTpQA60pjFbH2aEkD9
         syg46iB5AzOpQ2OntvcJAqe2EzMhRvct4Z+DJVl1998hTmYf3W3kl5DKvCd+/H5oXuGH
         eddA==
X-Gm-Message-State: APjAAAUQKO5D0sE3rsYiJhy2PBPe0Bhf1/kZi44fFJNt4s1BGYVs2lUZ
        TzxU/BXIe+1hr9wH1sx1tRQ=
X-Google-Smtp-Source: APXvYqxm9fkVaFvLVZgW7GqM26uh7DQlybHTZwDoCWQFQRpOs4GY5enBHNArqlbMdPKWLvBfi5H53w==
X-Received: by 2002:a2e:b007:: with SMTP id y7mr2335292ljk.215.1576074817104;
        Wed, 11 Dec 2019 06:33:37 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 144sm1305587lfi.67.2019.12.11.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:33:36 -0800 (PST)
Date:   Wed, 11 Dec 2019 16:33:25 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pinctrl: pinctrl-baytrail: Use GPIO direction definitions
Message-ID: <67cb73a927b2bf36d9d9f3dd7be5b46119cdbcbc.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
returning GPIO direction to GPIO framework.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9ffb22211d2b..362276ad5640 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1160,9 +1160,9 @@ static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	if (!(value & BYT_OUTPUT_EN))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 	if (!(value & BYT_INPUT_EN))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	return -EINVAL;
 }
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
