Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A771E9A59
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 22:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgEaUlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 May 2020 16:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgEaUlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 May 2020 16:41:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1711CC03E969
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2020 13:41:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j10so9437016wrw.8
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2020 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XPS7Wm2VWj6CUy+E0xjT/Rc+9g5GOp3P8FCBLIlwzJo=;
        b=AbeDd+VZXi3HG/DUD5MnzM0WkfA7pfoopzNQnkqPJVYXiC1x3Ge0puDCadq3xmZCOf
         sClqPFc5prhw5ggSaHNlWPUwwh7wF8oQVsS6z33KhK7luIW9/bhu7CZJ1TJTiCmc3adX
         H122u4+Vs6Mf4dH85DDPnxJi/K7hNSt8y6a23n83KKGDsNzbzgHX96UvwDATLCP/Qb7i
         kobyDYvnWucSKMSSZBg5kQFe1EjmWMdnoSjyW6hmfzMgPVhlo+15ogtdOu1Wf0APGegV
         egKw/l2UAp5uoBy3oBg+7Qqy9WQVfADYAGig/32FdrOKd+hn3SI9Z67KR+2yhWZwKsE/
         //EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XPS7Wm2VWj6CUy+E0xjT/Rc+9g5GOp3P8FCBLIlwzJo=;
        b=T2PX9Y1iStJ82xvRlXE4f7r/vD7wzJncgqSWe0PdDY0xTo8WqWBpdyXnIzP0dI1hVE
         621xigWjZLAChjWbaezXKjRhCZcmkDvo/J1mnC66KLv+PltRyuNuL1by9m/VAAVN6fva
         G4ucmhb27GHr0U4PYeKiBDBPY/y1uOwJovTzqfAtAJaVG8fOKZQIjRGoiy4YNQxJi1LO
         z4O0ASJ0HpkkDY/DLuHsS+3OBU4AjOgtx5/ppk1mrYiNZhP+kjzrJ0+hsK45D1Vfw9dD
         fRYtdgBw9/xtW3jM2MJIAHtvFpGM9u1q7KgNIslLBQLHULvrCjIcoOAZ1aqYxxjmmoHr
         A/3Q==
X-Gm-Message-State: AOAM532ysaIwm6keDEem02z5W3/23d8rlWeBCNH6+4XOJHNsZ1maX4QC
        FpHyWSjY8PqgcOpep63Jwq247/jXccMZmQ==
X-Google-Smtp-Source: ABdhPJx15g0vSZpLKQ1DQXGPeEz1sugYXvSvoWG4pgj2qP0JKlhM0zDTy5DuHXhyIA72bnpCctTB0w==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr18025369wrm.181.1590957710498;
        Sun, 31 May 2020 13:41:50 -0700 (PDT)
Received: from x1 ([2001:16b8:5c3c:c701:98fe:8f8:cce1:59e])
        by smtp.gmail.com with ESMTPSA id z206sm9940414wmg.30.2020.05.31.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 13:41:49 -0700 (PDT)
Date:   Sun, 31 May 2020 22:41:47 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: [PATCH] pinctrl-single: fix pcs_parse_pinconf() return val
Message-ID: <20200531204147.GA664833@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch causes pcs_parse_pinconf() to return an error when no
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
added by returning non-zero. Otherwise pcs_parse_one_pinctrl_entry()
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

[0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1e0614daee9b..18a02cd0c701 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -916,7 +916,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 
 	/* If pinconf isn't supported, don't parse properties in below. */
 	if (!PCS_HAS_PINCONF)
-		return 0;
+		return -ENOTSUPP; /* do not return 0 as no map added */
 
 	/* cacluate how much properties are supported in current node */
 	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
@@ -928,7 +928,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 			nconfs++;
 	}
 	if (!nconfs)
-		return 0;
+		return -ENOTSUPP; /* do not return 0 as no map added */
 
 	func->conf = devm_kcalloc(pcs->dev,
 				  nconfs, sizeof(struct pcs_conf_vals),
-- 
2.25.1

