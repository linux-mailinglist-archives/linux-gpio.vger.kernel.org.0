Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98A1FE929
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 04:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgFRC73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 22:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgFRC72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 22:59:28 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75975C06174E;
        Wed, 17 Jun 2020 19:59:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r18so2231659pgk.11;
        Wed, 17 Jun 2020 19:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=c+XBBSUJkbuSD8EzkachzbNQFLmI3baAWx8Tvz5SX9A=;
        b=ce2KN786GgRadse5m9yAoPlwSIL8pcph73/I//OEEO+UR3c+knDGQIQwQEMWusaoxR
         c7pEFVCQBTemK2twFjbMAprzclbJfSXlvxSwZEDK4NJZbg4jFJzsidCoszJm1akXutOb
         rBeEVOVOQRD8f6GCeckk6oBAjBoZwbCRaB99odubFDPTUCGyqe/N/9ls/xI2juTMYmth
         R+yaoAX6CqZQuUpynGvQ0vfBb4G7TFvCQGydsdX/oML2LpmHd6zFr82rEBqNOzbBhiZa
         AmwIQHb0fcd6R+jRtfplgvhLANX2HEniV8Nl6XyjIqgSE4/CqjpI5+DO9ALOVronKyJh
         SOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=c+XBBSUJkbuSD8EzkachzbNQFLmI3baAWx8Tvz5SX9A=;
        b=nlawB26dnHh8vgP3ywCP5tCNYY83JN5bqmeTudA1nEwUPS1MIyvu69BQPhANhFGxV7
         6iikmWkHeMA6OoPJgnznR90YU1KBSIOrXbWB14YDXX0OeP7JwiuqfTNzJwWjPPHF0/3z
         0nPqZCp+CLYjVDSOoImT9nnGzyh6lNWv+urywyLIGcIQ8tE5xl8zbV3vuG8B0TwBo6Wg
         tH1rHgNUQzfW+G5kxPfJ07J0mb9dktfNIElRwB90tzFkl1gOWUNoZ3J2Q02hbgMxHR1A
         PKHIylFdf6VmwgIjpxVbm243tKVoMgepkp4j1bTaMSZpSvkAD8s/9Y97noINQBHPzWNF
         7mVg==
X-Gm-Message-State: AOAM531fx4Dtwca95lJMwcwQSZ38/wvCeAh9L20vgEyPh5wsQx7QIJR6
        NHWGxCzHO2NFEZ44VTaFH9rUyv+UMBeKP86e
X-Google-Smtp-Source: ABdhPJxvua+/GIpND09OviVKdksZLCWgeWga/Ef+nBwx2A0d5tunbidPFHBYJKkdl+DxEaSXQcryAA==
X-Received: by 2002:a62:3582:: with SMTP id c124mr1694339pfa.298.1592449167930;
        Wed, 17 Jun 2020 19:59:27 -0700 (PDT)
Received: from home-desktop ([114.204.138.55])
        by smtp.gmail.com with ESMTPSA id j184sm1094045pfg.131.2020.06.17.19.59.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 19:59:27 -0700 (PDT)
Date:   Thu, 18 Jun 2020 11:59:22 +0900
From:   Hyeonki Hong <hhk7734@gmail.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>, khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH] [v2] pinctrl: meson: fix drive strength register and bit
 calculation
Message-ID: <20200618025916.GA19368@home-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
or more registers. However, when register and bit were calculated, the
first register defined in the bank was used, and the bit was calculated
based on the first pin. This causes problems in setting the driving
strength.

The following method was used to solve this problem:
A bit is calculated first using predefined strides. Then, If the bit is
32 or more, the register is changed by the quotient of the bit divided
by 32. And the bit is set to the remainder.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..bf116c2e45c0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -56,6 +56,10 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-meson.h"
 
+static const unsigned int meson_bit_strides[] = {
+	1, 1, 1, 1, 1, 2, 1
+};
+
 /**
  * meson_get_bank() - find the bank containing a given pin
  *
@@ -96,8 +100,9 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
 {
 	struct meson_reg_desc *desc = &bank->regs[reg_type];
 
-	*reg = desc->reg * 4;
-	*bit = desc->bit + pin - bank->first;
+	*bit = (desc->bit + pin - bank->first) * meson_bit_strides[reg_type];
+	*reg = (desc->reg + (*bit / 32)) * 4;
+	*bit &= 0x1f;
 }
 
 static int meson_get_groups_count(struct pinctrl_dev *pcdev)
@@ -314,7 +319,6 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
-	bit = bit << 1;
 
 	if (drive_strength_ua <= 500) {
 		ds_val = MESON_PINCONF_DRV_500UA;
@@ -441,7 +445,6 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
-	bit = bit << 1;
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
-- 
2.17.1

