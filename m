Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A65279C54
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Sep 2020 22:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgIZUXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 16:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgIZUXx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Sep 2020 16:23:53 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34547C0613CE;
        Sat, 26 Sep 2020 13:23:53 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 77so6669071lfj.0;
        Sat, 26 Sep 2020 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MPEzNOA663F2rbjDyQib41GdeOlEXoHbEZvlfAz7eM=;
        b=RQzNrdvY6AYSPQcJGWRfkOM6T2i/eaj9EGcRCa0kEzvG1P50i4qXD9mvIarbsDRRtf
         SJz2sYkmsOE4Z7294LlKo0QuC+4y71IUr2XBDjYT0rCXRhmZ8IXjr+nsdW8r5kdseA7H
         d3Cf6HPYZ8El9qA2M/zJp85aKxc6lDQ/lqpH0rsQR7ACnf0au6YhRZoP14Csg8+l3eBn
         N9AMjc8X4VpP2aa9vS0642DNQZiGpWOUcL7jKkJlAErXP05y2IbVdz2ivUbY9WeINNkk
         GQMLKkDgwBt5tT3+lWK7hM4M7BE7mVze8e4HSbOWALy1h9iCR2wYeTVo1WhErVhiNho7
         N/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MPEzNOA663F2rbjDyQib41GdeOlEXoHbEZvlfAz7eM=;
        b=fBGy9/AmboYUbuhpLhQKTkmH3g7NDw3ta+Xux7SBmOgSzOku1JQKijlM5lzwvg/Yuf
         49XgkjqAuN6V589jLwKZSzZS9vjPo8pthd8zyjYi78sGTCBixANVqItUUXTF2lsV2HJ6
         AUSYFDuwkBZsCb1jdcON9ae73kMBizLgSSvu51v9huHaEGY5LBT9Iba3hbZgtrnFsNil
         dZo0Fn5mRnSmkVYqOerPYYOC41l6nV4ruyDU5UvrbvevdJgDS6QfRx+hvCUFh9Rbev5u
         qC2Cm2E6AfxM98rxVxnel1BPWYNN5zxeMcoPcrO/mdyZ2nN3AfwrzHCeBDE+eCFYsKEa
         u7OA==
X-Gm-Message-State: AOAM533IHkXefqPe2Gve+RrLdYCh8fFtm/VJrL6w+mMdHQ47byUGPSNZ
        wEA5uyuF5ma9KihKFHi9ZHo+XjVWzmU=
X-Google-Smtp-Source: ABdhPJwvlM+PuoX2Ouzgz9XavCdjxvsRaA1aV0KE5QcQDoUGGnRIhnb+WJZFgPn01LVFSPzbmotHkg==
X-Received: by 2002:a19:560a:: with SMTP id k10mr1427446lfb.599.1601151831498;
        Sat, 26 Sep 2020 13:23:51 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id s20sm2108883lfs.135.2020.09.26.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 13:23:50 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] pinctrl: nuvoton: npcm7xx: Constify static ops structs
Date:   Sat, 26 Sep 2020 22:23:42 +0200
Message-Id: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only usage of these structs is to assign their address to various
ops fields in the pinctrl_desc struct, which are const pointers. Make
them const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index a935065cdac4..6de31b5ee358 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1601,7 +1601,7 @@ static void npcm7xx_dt_free_map(struct pinctrl_dev *pctldev,
 	kfree(map);
 }
 
-static struct pinctrl_ops npcm7xx_pinctrl_ops = {
+static const struct pinctrl_ops npcm7xx_pinctrl_ops = {
 	.get_groups_count = npcm7xx_get_groups_count,
 	.get_group_name = npcm7xx_get_group_name,
 	.get_group_pins = npcm7xx_get_group_pins,
@@ -1701,7 +1701,7 @@ static int npcm_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops npcm7xx_pinmux_ops = {
+static const struct pinmux_ops npcm7xx_pinmux_ops = {
 	.get_functions_count = npcm7xx_get_functions_count,
 	.get_function_name = npcm7xx_get_function_name,
 	.get_function_groups = npcm7xx_get_function_groups,
@@ -1842,7 +1842,7 @@ static int npcm7xx_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	return 0;
 }
 
-static struct pinconf_ops npcm7xx_pinconf_ops = {
+static const struct pinconf_ops npcm7xx_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_get = npcm7xx_config_get,
 	.pin_config_set = npcm7xx_config_set,
-- 
2.28.0

