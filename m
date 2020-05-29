Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325061E85F2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 19:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgE2Rzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 13:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgE2Rzt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 13:55:49 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B399CC08C5C8
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 10:55:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h4so4455655wmb.4
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 10:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6J2LRvMRChPeCdpbTJYD/igAVIirIPWDEckATQIMU5c=;
        b=Kn8HUVNb6TQFA887srH/WgE/1pgbgNiZnDNoW8PedPYXs8q4QsaaFdAqkQaqy7kHG4
         J5K9VUZtKuKwxpNZ0XWfYsyspUPwaCraDbFFjCnQwlmRX8s1X/2pqK5h+GFscXpOHWQS
         N9jkdikBaJ1d2n0nENE9j0eec6dyqqJ7BMvWW4OYYGosiOkLk95mv22YuqDeebZ1QYpm
         X026ufiJITOpeh0dd5PuCtUeLBjSY7CwU2hfvbbiH3MGzRO0DocMmu4TwEVo3t1GCNzb
         5gJMAgXhqkCVRk33gMCRhxiyLkFwDHHF3AJAWJI9jyKJWCFUc4UJXW9muIWjJ7rARWtE
         cmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6J2LRvMRChPeCdpbTJYD/igAVIirIPWDEckATQIMU5c=;
        b=qtMZXmaVWiSmAYIe602GqVBE5aH7ZU3izmnumw8h3qdfKJd4slErcQv5qnXa2RqTMG
         9b2JzV8xVdW/2W9g4MSL/1Sv9yOBIevRXCjta8ybfyTMaY5dLiK/rsyaCqPaB1kvYFAk
         TWVCNoFtrobhkAj9ykM1v1R9CxPqU5NP1VmahiRnmva3ibIkt9qdZoKCvllOf9bwpnkh
         uHEHCwQVdgck0VeebTb1I1As2pyn8QKMctmg6JfLOpZovzfPbrzbf83M7cW+rP06I3wb
         GwQ1AbP97epC05pt0xbfvzQTOzk+eB0UZtXk9+Nv1coiUOYCWbWm/DOgQ4/XO8jQoI8s
         tc5w==
X-Gm-Message-State: AOAM530v2uN9nbZcbDVTLMIhDsRhzPH+29DSLL/gXxHJ88dPGdNOoLUf
        w5eOo3rZ4OEMxq0Re+ID+x+5pQ==
X-Google-Smtp-Source: ABdhPJzfoDNhcD1ZZea1hzzZ5j+fNlihF9vXv8Q9A9AA3J5hEULE5Bgv6f+2kHiM4VFu1AIrzWzkqw==
X-Received: by 2002:a1c:b0c8:: with SMTP id z191mr9939603wme.165.1590774946902;
        Fri, 29 May 2020 10:55:46 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id g82sm329403wmf.1.2020.05.29.10.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:55:46 -0700 (PDT)
Date:   Fri, 29 May 2020 19:55:44 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200529175544.GA3766151@x1>
References: <20200526122133.GA1454440@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526122133.GA1454440@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 02:21:33PM +0200, Drew Fustini wrote:
> Hello Haojian and Linus,
> 
> For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> 
> 1057         if (PCS_HAS_PINCONF && function) {
> 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> 1059                 if (res)
> 1060                         goto free_pingroups;
> 1061                 *num_maps = 2;
> 1062         } else {
> 1063                 *num_maps = 1;
> 1064         }
> 1065         mutex_unlock(&pcs->mutex);
> 
> git blame shows me that came from 9dddb4df90d13:
> "pinctrl: single: support generic pinconf"
> 
> Would you be able to provide any insight as to num_maps needs to be 2
> when pinconf is enabled?
> 
> thank you,
> drew

The BeagleBone fails to boot when I change the am33xx_pinmux compatible
from "pinctrl,single" to "pinconf,single":

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 5ed7f3c58c0f..b5bedd776ee6 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -276,7 +276,7 @@ scm: scm@0 {
                                ranges = <0 0 0x2000>;
 
                                am33xx_pinmux: pinmux@800 {
-                                       compatible = "pinctrl-single";
+                                       compatible = "pinconf-single";
                                        reg = <0x800 0x238>;
                                        #pinctrl-cells = <1>;
                                        pinctrl-single,register-width = <32>;


From the full dmesg output [0], these lines seem the most relevant:

[    2.974958] pinctrl-single 44e10800.pinmux: 142 pins, size 568
[    3.847475] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x160 value: 0x2f
[    3.855556] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xfc value: 0x30
[    3.863520] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf8 value: 0x30
[    3.871483] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf4 value: 0x30
[    3.879444] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf0 value: 0x30
[    3.887404] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x104 value: 0x30
[    3.895455] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x100 value: 0x30
[    3.903505] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x1a0 value: 0x2c
[    3.911583] pinctrl core: add 2 pinctrl maps
[    3.915976] pinctrl core: failed to register map default (1): invalid type given
[    3.923594] omap_hsmmc: probe of 48060000.mmc failed with error -22
[    3.930403] omap_hsmmc 47810000.mmc: GPIO lookup for consumer cd
[    4.440389] Waiting for root device /dev/mmcblk0p1...

The error message:
"pinctrl core: failed to register map default (1): invalid type given"

comes from drivers/pinctrl/core.c:

1387 int pinctrl_register_mappings(const struct pinctrl_map *maps,
1388                               unsigned num_maps)
1389 {
1390         int i, ret;
1391         struct pinctrl_maps *maps_node;
1392 
1393         pr_debug("add %u pinctrl maps\n", num_maps);
1394 
1395         /* First sanity check the new mapping */
1396         for (i = 0; i < num_maps; i++) {
<snip>
1416                 switch (maps[i].type) {
1417                 case PIN_MAP_TYPE_DUMMY_STATE:
1418                         break;
1419                 case PIN_MAP_TYPE_MUX_GROUP:
1420                         ret = pinmux_validate_map(&maps[i], i);
1421                         if (ret < 0)
1422                                 return ret;
1423                         break;
1424                 case PIN_MAP_TYPE_CONFIGS_PIN:
1425                 case PIN_MAP_TYPE_CONFIGS_GROUP:
1426                         ret = pinconf_validate_map(&maps[i], i);
1427                         if (ret < 0)
1428                                 return ret;
1429                         break;
1430                 default:
1431                         pr_err("failed to register map %s (%d): invalid type given\n",
1432                                maps[i].name, i);
1433                         return -EINVAL;
1434                 }
1435         }


The invalid type error occurs when maps[i].type does not match any of
the case statements.

I have determined the system will boot ok [1] when num_maps is forced
to be 1.  Here are the related dmesg lines:

[    3.920484] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x160 value: 0x2f
[    3.928420] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xfc value: 0x30
[    3.936224] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf8 value: 0x30
[    3.944026] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf4 value: 0x30
[    3.951826] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf0 value: 0x30
[    3.959627] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x104 value: 0x30
[    3.967515] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x100 value: 0x30
[    3.975403] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x1a0 value: 0x2c
[    3.983318] pinctrl core: add 1 pinctrl maps
[    3.987653] pinctrl-single 44e10800.pinmux: found group selector 4 for pinmux-mmc0-pins
[    3.995723] pinctrl-single 44e10800.pinmux: request pin 88 (PIN88) for 48060000.mmc
[    4.003434] pinctrl-single 44e10800.pinmux: request pin 63 (PIN63) for 48060000.mmc
[    4.011141] pinctrl-single 44e10800.pinmux: request pin 62 (PIN62) for 48060000.mmc
[    4.018847] pinctrl-single 44e10800.pinmux: request pin 61 (PIN61) for 48060000.mmc
[    4.026633] pinctrl-single 44e10800.pinmux: request pin 60 (PIN60) for 48060000.mmc
[    4.034351] pinctrl-single 44e10800.pinmux: request pin 65 (PIN65) for 48060000.mmc
[    4.042065] pinctrl-single 44e10800.pinmux: request pin 64 (PIN64) for 48060000.mmc
[    4.049774] pinctrl-single 44e10800.pinmux: request pin 104 (PIN104) for 48060000.mmc
[    4.057662] pinctrl-single 44e10800.pinmux: enabling (null) function4

Here is the patch for num_maps:

diiff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1e0614daee9b..78a93336c711 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1058,7 +1058,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
                res = pcs_parse_pinconf(pcs, np, function, map);
                if (res)
                        goto free_pingroups;
-               *num_maps = 2;
+               *num_maps = 1;
        } else {
                *num_maps = 1;
        }

I am trying to understand why num_maps is supposed to be 2 when
PCS_HAS_PINCONF, and I would appreciate any comments.

Is there a bug somewhere in the code?

Or, is it supposed to be invalid to enable "pinconf,single" compatible
for the am33xx_pinmux node?


thank you,
drew

[0] https://gist.github.com/pdp7/293716fe98d90f031bb75950803952a1
[1] https://gist.github.com/pdp7/fc5186f46e34c3acc1b1a169be85d3a9

