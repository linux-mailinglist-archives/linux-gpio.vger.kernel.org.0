Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D9D1E94BA
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgEaART (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbgEaART (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:17:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3AFC08C5C9
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 17:17:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t18so7835001wru.6
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 17:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ERfHe8O2f5AsEJS2Vc94MJn95/iAy52SmJd8vrOgmW0=;
        b=E0063G9ROuWlVz3VEH7BRHUjivHgwGxNWqhCN2d3Pk7ACJAKB9F8+A2UiuG9ugTBy+
         +wCOm2SDjmQJwg4gQSXjSq7KK8LAsgOnhMAwvWQQSqap4mGSLpcPX4iEPNOa1/L5AcHt
         XqjlGn47oZsF1dvsQENm7eFMcGXCOpS0VTOlm7smcAZcyy+Xp01saJxKa3b7r15iVMTU
         g1bENyYCnTUstrhpGeBQEqcDCQn3ULtloqnnYaLiBi3Bl1pJJoHrhiW73N7PjZc1AQO5
         55Y1rJKp718Bcwa9oABrUUU4ebA7zHPC+3adnTAaiqfuWkE1ftZKt2rzwcgs75Pok6/X
         4KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ERfHe8O2f5AsEJS2Vc94MJn95/iAy52SmJd8vrOgmW0=;
        b=YksR77TDradVwzt4egoOz0UkuXogdVDd9TnydNn+3C4iB9s6AqLUqvi+iosKkezMiS
         MuT15RLpPO4byvEu8XWba8o+X9zVcatUSwnGTRKKTJ5ikmlDJODFek6NVjOOhoD3BI5p
         bgIbSGFFdx5G/TI+vYhRDFDTmDzcIcn4KOw5LASNfLu9hwvVrIHD+HyOLHMTyNq024b2
         r0Luwc4XLdZGrjB9mcY7S5AMxeu1RnKCy0xDgE3uZ7U8iBY3/mbEuUddsSxgiQl/TkrI
         PQkUQfcNwADjJ5/e5V5z257OmMIkugIIlwCAj4gnZUO4afk3LeMIY+iGW+tJcm4iBgR6
         RwCw==
X-Gm-Message-State: AOAM530+W+yq7oDMFc+XQ4GjeTgnjQxMjTC04mtUqKItbbOh+M6moqkt
        z0aPCmUpSAirct6//7KIEeQNwQ==
X-Google-Smtp-Source: ABdhPJzv+V7cDL7Po1TUV8nSbRvodubZsG03EQSH0OH7dsz6Prg0g4L2ICPgY5qsBjtm2rVBNdc21g==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr14534254wrq.385.1590884232376;
        Sat, 30 May 2020 17:17:12 -0700 (PDT)
Received: from x1 ([2001:16b8:5cba:6201:98fe:8f8:cce1:59e])
        by smtp.gmail.com with ESMTPSA id q11sm9428145wrv.67.2020.05.30.17.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:17:11 -0700 (PDT)
Date:   Sun, 31 May 2020 02:17:09 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200531001709.GA168774@x1>
References: <20200526122133.GA1454440@x1>
 <20200529175544.GA3766151@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529175544.GA3766151@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 29, 2020 at 07:55:44PM +0200, Drew Fustini wrote:
> On Tue, May 26, 2020 at 02:21:33PM +0200, Drew Fustini wrote:
> > Hello Haojian and Linus,
> > 
> > For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> > I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> > 
> > 1057         if (PCS_HAS_PINCONF && function) {
> > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > 1059                 if (res)
> > 1060                         goto free_pingroups;
> > 1061                 *num_maps = 2;
> > 1062         } else {
> > 1063                 *num_maps = 1;
> > 1064         }
> > 1065         mutex_unlock(&pcs->mutex);
> > 
> > git blame shows me that came from 9dddb4df90d13:
> > "pinctrl: single: support generic pinconf"
> > 
> > Would you be able to provide any insight as to num_maps needs to be 2
> > when pinconf is enabled?
> > 
> > thank you,
> > drew
> 
> The BeagleBone fails to boot when I change the am33xx_pinmux compatible
> from "pinctrl,single" to "pinconf,single":
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 5ed7f3c58c0f..b5bedd776ee6 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -276,7 +276,7 @@ scm: scm@0 {
>                                 ranges = <0 0 0x2000>;
>  
>                                 am33xx_pinmux: pinmux@800 {
> -                                       compatible = "pinctrl-single";
> +                                       compatible = "pinconf-single";
>                                         reg = <0x800 0x238>;
>                                         #pinctrl-cells = <1>;
>                                         pinctrl-single,register-width = <32>;
> 
> 
> From the full dmesg output [0], these lines seem the most relevant:
> 
> [    2.974958] pinctrl-single 44e10800.pinmux: 142 pins, size 568
> [    3.847475] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x160 value: 0x2f
> [    3.855556] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xfc value: 0x30
> [    3.863520] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf8 value: 0x30
> [    3.871483] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf4 value: 0x30
> [    3.879444] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf0 value: 0x30
> [    3.887404] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x104 value: 0x30
> [    3.895455] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x100 value: 0x30
> [    3.903505] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x1a0 value: 0x2c
> [    3.911583] pinctrl core: add 2 pinctrl maps
> [    3.915976] pinctrl core: failed to register map default (1): invalid type given
> [    3.923594] omap_hsmmc: probe of 48060000.mmc failed with error -22
> [    3.930403] omap_hsmmc 47810000.mmc: GPIO lookup for consumer cd
> [    4.440389] Waiting for root device /dev/mmcblk0p1...
> 
> The error message:
> "pinctrl core: failed to register map default (1): invalid type given"
> 
> comes from drivers/pinctrl/core.c:
> 
> 1387 int pinctrl_register_mappings(const struct pinctrl_map *maps,
> 1388                               unsigned num_maps)
> 1389 {
> 1390         int i, ret;
> 1391         struct pinctrl_maps *maps_node;
> 1392 
> 1393         pr_debug("add %u pinctrl maps\n", num_maps);
> 1394 
> 1395         /* First sanity check the new mapping */
> 1396         for (i = 0; i < num_maps; i++) {
> <snip>
> 1416                 switch (maps[i].type) {
> 1417                 case PIN_MAP_TYPE_DUMMY_STATE:
> 1418                         break;
> 1419                 case PIN_MAP_TYPE_MUX_GROUP:
> 1420                         ret = pinmux_validate_map(&maps[i], i);
> 1421                         if (ret < 0)
> 1422                                 return ret;
> 1423                         break;
> 1424                 case PIN_MAP_TYPE_CONFIGS_PIN:
> 1425                 case PIN_MAP_TYPE_CONFIGS_GROUP:
> 1426                         ret = pinconf_validate_map(&maps[i], i);
> 1427                         if (ret < 0)
> 1428                                 return ret;
> 1429                         break;
> 1430                 default:
> 1431                         pr_err("failed to register map %s (%d): invalid type given\n",
> 1432                                maps[i].name, i);
> 1433                         return -EINVAL;
> 1434                 }
> 1435         }
> 
> 
> The invalid type error occurs when maps[i].type does not match any of
> the case statements.
> 
> I have determined the system will boot ok [1] when num_maps is forced
> to be 1.  Here are the related dmesg lines:
> 
> [    3.920484] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x160 value: 0x2f
> [    3.928420] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xfc value: 0x30
> [    3.936224] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf8 value: 0x30
> [    3.944026] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf4 value: 0x30
> [    3.951826] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0xf0 value: 0x30
> [    3.959627] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x104 value: 0x30
> [    3.967515] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x100 value: 0x30
> [    3.975403] pinctrl-single 44e10800.pinmux: pinmux-mmc0-pins index: 0x1a0 value: 0x2c
> [    3.983318] pinctrl core: add 1 pinctrl maps
> [    3.987653] pinctrl-single 44e10800.pinmux: found group selector 4 for pinmux-mmc0-pins
> [    3.995723] pinctrl-single 44e10800.pinmux: request pin 88 (PIN88) for 48060000.mmc
> [    4.003434] pinctrl-single 44e10800.pinmux: request pin 63 (PIN63) for 48060000.mmc
> [    4.011141] pinctrl-single 44e10800.pinmux: request pin 62 (PIN62) for 48060000.mmc
> [    4.018847] pinctrl-single 44e10800.pinmux: request pin 61 (PIN61) for 48060000.mmc
> [    4.026633] pinctrl-single 44e10800.pinmux: request pin 60 (PIN60) for 48060000.mmc
> [    4.034351] pinctrl-single 44e10800.pinmux: request pin 65 (PIN65) for 48060000.mmc
> [    4.042065] pinctrl-single 44e10800.pinmux: request pin 64 (PIN64) for 48060000.mmc
> [    4.049774] pinctrl-single 44e10800.pinmux: request pin 104 (PIN104) for 48060000.mmc
> [    4.057662] pinctrl-single 44e10800.pinmux: enabling (null) function4
> 
> Here is the patch for num_maps:
> 
> diiff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 1e0614daee9b..78a93336c711 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1058,7 +1058,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>                 res = pcs_parse_pinconf(pcs, np, function, map);
>                 if (res)
>                         goto free_pingroups;
> -               *num_maps = 2;
> +               *num_maps = 1;
>         } else {
>                 *num_maps = 1;
>         }
> 
> I am trying to understand why num_maps is supposed to be 2 when
> PCS_HAS_PINCONF, and I would appreciate any comments.
> 
> Is there a bug somewhere in the code?
> 
> Or, is it supposed to be invalid to enable "pinconf,single" compatible
> for the am33xx_pinmux node?
> 
> 
> thank you,
> drew
> 
> [0] https://gist.github.com/pdp7/293716fe98d90f031bb75950803952a1
> [1] https://gist.github.com/pdp7/fc5186f46e34c3acc1b1a169be85d3a9
> 

I believe I may have found a bug in drivers/pinctrl/pinctrl-single.c

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
1065         mutex_unlock(&pcs->mutex);
1066
1067         return 0;

However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
!nconfs.  I believe these conditions should return non-zero.  Otherwise
pcs_parse_one_pinctrl_entry() will set num_maps = 2 even though no maps
were successfully added, as it does not reach "m++" on line 944:

 895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 896                              struct pcs_function *func,
 897                              struct pinctrl_map **map)
 898
 899 {
 900         struct pinctrl_map *m = *map;
 901         int i = 0, nconfs = 0;
 902         unsigned long *settings = NULL, *s = NULL;
 903         struct pcs_conf_vals *conf = NULL;
 904         static const struct pcs_conf_type prop2[] = {
 905                 { "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
 906                 { "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
 907                 { "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
 908                 { "pinctrl-single,low-power-mode", PIN_CONFIG_LOW_POWER_MODE, },
 909         };
 910         static const struct pcs_conf_type prop4[] = {
 911                 { "pinctrl-single,bias-pullup", PIN_CONFIG_BIAS_PULL_UP, },
 912                 { "pinctrl-single,bias-pulldown", PIN_CONFIG_BIAS_PULL_DOWN, },
 913                 { "pinctrl-single,input-schmitt-enable",
 914                         PIN_CONFIG_INPUT_SCHMITT_ENABLE, },
 915         };
 916
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
 941         settings = devm_kcalloc(pcs->dev, nconfs, sizeof(unsigned long),
 942                                 GFP_KERNEL);
 943         if (!settings)
 944                 return -ENOMEM;
 945         s = &settings[0];
 946
 947         for (i = 0; i < ARRAY_SIZE(prop2); i++)
 948                 pcs_add_conf2(pcs, np, prop2[i].name, prop2[i].param,
 949                               &conf, &s);
 950         for (i = 0; i < ARRAY_SIZE(prop4); i++)
 951                 pcs_add_conf4(pcs, np, prop4[i].name, prop4[i].param,
 952                               &conf, &s);
 953         m->type = PIN_MAP_TYPE_CONFIGS_GROUP;
 954         m->data.configs.group_or_pin = np->name;
 955         m->data.configs.configs = settings;
 956         m->data.configs.num_configs = nconfs;
 957         return 0;
 958 }

This patch solves the boot failure on the BeagleBone Black when pinmux
compatible is "pinconf,single":

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1e0614daee9b..18a02cd0c701 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -916,7 +916,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,

        /* If pinconf isn't supported, don't parse properties in below. */
        if (!PCS_HAS_PINCONF)
-               return 0;
+               return -ENOTSUPP; /* do not return 0 as no map added */

        /* cacluate how much properties are supported in current node */
        for (i = 0; i < ARRAY_SIZE(prop2); i++) {
@@ -928,7 +928,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
                        nconfs++;
        }
        if (!nconfs)
-               return 0;
+               return -ENOTSUPP; /* do not return 0 as no map added */

        func->conf = devm_kcalloc(pcs->dev,
                                  nconfs, sizeof(struct pcs_conf_vals),


Does this appear to be a reasonable solution?

I would appreciate any comments.


thank you,
drew
