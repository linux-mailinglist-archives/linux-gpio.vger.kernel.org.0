Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21AA1F191A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgFHMvt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgFHMvs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:51:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F873C08C5C2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 05:51:48 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so16391403wmc.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RQ9IkLJcPxxdwMnFNgYtyz5I6q1qTuVmz3PvLx350Z0=;
        b=zXeep99q/zbX8e2PLLd3XsP4HTRGYC1t27NxGAJMM2uonq6XDmzM0TsgQBTDiGBWKP
         g7You/eCsit/qWUBiHXrazPa9h0KXliXBIe0ct+XR1B2sVMxL2ZLEJj09X+f5tUBNQgr
         b0caMvDYzHLwVott4fOSJp4q6uBRwD5vJkC2ruqWHkkIbivcLu9SeGmX/Z1SYSPhDrWY
         D5rrKt3hmMIkskkc0R9CzAajVLtWyxUL0sYtfF3XFIPEVOj0isFom72JNqVkb+lqDaY0
         DjOKra/jBIPxsRlMPg93/AUhqxSCDCbQkTFgfl0rFrLOowS81RGfWyOQeNx7RArkxscL
         WcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RQ9IkLJcPxxdwMnFNgYtyz5I6q1qTuVmz3PvLx350Z0=;
        b=scJcJgzEDGF4VCRzsmXhZobak0MkQRpgSE6yhEEESgIE0YIiWTsErotBO+3SeK/FE9
         EvbUKxWRTjsIuXhG9s/A1QYAQHvDRhseNqsaA4v5TeLWhFcbvPjMyxJ8QdelgN42nMVg
         0QcBAwC6nfXaGKm9yc+OCYoh/8BVCnWUJKqpg46xfHEuESNRQdwk1+glCuBjeQJE5ety
         NtkaI/4+KCdxV+wFG4lJ9qmOjTOOyUpY3otchQqEpRv5/BBtncoc6t8X/1c6lQlLpycI
         BZ7sPaZuLFw0Tetl3bddHZVctKIycSX3AkZ/vOt+l0n6mu63kiQq/jvrindbR6Dk6kSU
         /iLg==
X-Gm-Message-State: AOAM532HNQ9kawexFSLF3/2XujAEqqeChh2R6z/u3Aus2otDkrwinGVd
        F7qRPvFnvx++h0POLymt6/00MA==
X-Google-Smtp-Source: ABdhPJy9T0TdAgpweJ8YNtjyu1W96KCySc0VhJEpsiNZJNGp3RqKAYy1y6XC1kHyqBYRgOyvbVWufQ==
X-Received: by 2002:a1c:2943:: with SMTP id p64mr15869799wmp.42.1591620706816;
        Mon, 08 Jun 2020 05:51:46 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z25sm22021479wmf.10.2020.06.08.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 05:51:46 -0700 (PDT)
Date:   Mon, 8 Jun 2020 14:51:43 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: [PATCH v2] pinctrl-single: fix pcs_parse_pinconf() return value
Message-ID: <20200608125143.GA2789203@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch causes pcs_parse_pinconf() to return -ENOTSUPP when no
pinctrl_map is added.  The current behavior is to return 0 when
!PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
incorrectly assumes that a map was added and sets num_maps = 2.

Analysis:
=========
The function pcs_parse_one_pinctrl_entry() calls pcs_parse_pinconf()
if PCS_HAS_PINCONF is enabled.  The function pcs_parse_pinconf()
returns 0 to indicate there was no error and num_maps is then set to 2:

 980 static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 981                                                 struct device_node *np,
 982                                                 struct pinctrl_map **map,
 983                                                 unsigned *num_maps,
 984                                                 const char **pgnames)
 985 {
<snip>
1053         (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
1054         (*map)->data.mux.group = np->name;
1055         (*map)->data.mux.function = np->name;
1056
1057         if (PCS_HAS_PINCONF && function) {
1058                 res = pcs_parse_pinconf(pcs, np, function, map);
1059                 if (res)
1060                         goto free_pingroups;
1061                 *num_maps = 2;
1062         } else {
1063                 *num_maps = 1;
1064         }

However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
!nconfs.  I believe these conditions should indicate that no map was
added by returning -ENOTSUPP. Otherwise pcs_parse_one_pinctrl_entry()
will set num_maps = 2 even though no maps were successfully added, as
it does not reach "m++" on line 940:

 895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 896                              struct pcs_function *func,
 897                              struct pinctrl_map **map)
 898
 899 {
 900         struct pinctrl_map *m = *map;
<snip>
 917         /* If pinconf isn't supported, don't parse properties in below. */
 918         if (!PCS_HAS_PINCONF)
 919                 return 0;
 920
 921         /* cacluate how much properties are supported in current node */
 922         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
 923                 if (of_find_property(np, prop2[i].name, NULL))
 924                         nconfs++;
 925         }
 926         for (i = 0; i < ARRAY_SIZE(prop4); i++) {
 927                 if (of_find_property(np, prop4[i].name, NULL))
 928                         nconfs++;
 929         }
 930         if (!nconfs)
 919                 return 0;
 932
 933         func->conf = devm_kcalloc(pcs->dev,
 934                                   nconfs, sizeof(struct pcs_conf_vals),
 935                                   GFP_KERNEL);
 936         if (!func->conf)
 937                 return -ENOMEM;
 938         func->nconfs = nconfs;
 939         conf = &(func->conf[0]);
 940         m++;

This situtation will cause a boot failure [0] on the BeagleBone Black
(AM3358) when am33xx_pinmux node in arch/arm/boot/dts/am33xx-l4.dtsi
has compatible = "pinconf-single" instead of "pinctrl-single".

The patch fixes this issue by returning -ENOSUPP when !PCS_HAS_PINCONF
or !nconfs, so that pcs_parse_one_pinctrl_entry() will know that no
map was added.  

Logic is also added to pcs_parse_one_pinctrl_entry() to distinguish
between -ENOSUPP and other errors.  In the case of -ENOSUPP, num_maps
is set to 1 as it is valid for pinconf to be enabled and a given pin
group to not any pinconf properties.

[0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
changes from V1 [0]:
- if pcs_parse_pinconf() returns -ENOSUPP, then set num_maps to 1 and
  proceed normally as it is valid for group to have no pinconf props
- added Fixes: tag thanks to Gustavo A. R. Silva

[0] https://lore.kernel.org/linux-omap/20200531204147.GA664833@x1/

 drivers/pinctrl/pinctrl-single.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1e0614daee9b..a9d511982780 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -916,7 +916,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 
 	/* If pinconf isn't supported, don't parse properties in below. */
 	if (!PCS_HAS_PINCONF)
-		return 0;
+		return -ENOTSUPP;
 
 	/* cacluate how much properties are supported in current node */
 	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
@@ -928,7 +928,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 			nconfs++;
 	}
 	if (!nconfs)
-		return 0;
+		return -ENOTSUPP;
 
 	func->conf = devm_kcalloc(pcs->dev,
 				  nconfs, sizeof(struct pcs_conf_vals),
@@ -1056,9 +1056,12 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 
 	if (PCS_HAS_PINCONF && function) {
 		res = pcs_parse_pinconf(pcs, np, function, map);
-		if (res)
+		if (res == 0)
+			*num_maps = 2;
+		else if (res == -ENOTSUPP)
+			*num_maps = 1;
+		else
 			goto free_pingroups;
-		*num_maps = 2;
 	} else {
 		*num_maps = 1;
 	}
-- 
2.25.1
