Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212BE2FB2E6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbhASHWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:22:54 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:43701 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbhASHWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:22:40 -0500
Received: by mail-lf1-f52.google.com with SMTP id 23so27630012lfg.10;
        Mon, 18 Jan 2021 23:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kMmUEHo1YdO75Vo4Liuh33ii2ABpeUu85Fl1nNzLVBs=;
        b=fU/K0zT7fAt93c9YLpwnNfC1j7udNVsZnGlGFL4DCQlpKLoYI+RGmHQz4vpw8bGe2E
         Rp2qyS+XjX7WUIzpeqqG6ZXanKpGAxqGP7C9GHJoMfCSxLedTGRyNHsZMuvKEp4u5ire
         ZbsyR7yUtu0CWOqooOjg2srjc78wnylIIVSTj8hL1Kh83eMo2ACExHKNSmW3NbyV5pYI
         smep1nPOMUbJOPFMtk+6nd0YYjtriMgriXmY4xBRai8vqIcBV7cEgVeOmXpiQUwAhjE+
         WVrsXyQPKk6TetLwx/p/+mvJgoaiGYbTLfjUlhrfKMefqSHVC9x1ysz/K1ZzdSkp+aGS
         PI9A==
X-Gm-Message-State: AOAM532kW9coKJosivFXpGsI5Ing+vdAGmdw//fuVdbSx79Pj8kDgcJW
        9GwvL5231KOhUarufImAZtc=
X-Google-Smtp-Source: ABdhPJyU0SvHH3f8o2V/JmUpnkJIXjQ894KjiJ+6mO06nHuCzQXUqObkbI8qIXZbm84Z+qhz3aSvfg==
X-Received: by 2002:a19:4c06:: with SMTP id z6mr1407524lfa.284.1611040918121;
        Mon, 18 Jan 2021 23:21:58 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id r16sm1903407ljk.93.2021.01.18.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:21:57 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:21:50 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 08/17] mfd: Add ROHM BD71815 ID
Message-ID: <001e0b5da0d68366b6d61b810468646fc8e07153.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
this IC.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since v1.

 include/linux/mfd/rohm-generic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 2b85b9deb03a..bbf07a49823c 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -12,6 +12,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71828,
+	ROHM_CHIP_TYPE_BD71815,
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
