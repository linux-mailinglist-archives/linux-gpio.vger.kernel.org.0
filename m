Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25851FAFB2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 14:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgFPL76 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 07:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgFPL74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 07:59:56 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7DCC08C5C4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 04:59:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so14037868edq.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vFt52X6ZxnjFhdInzqPTsBTf0H25///Yw0La+Ewwi+o=;
        b=qU3gGhZyPmAH6X7JfnyHrsDU+7oTdpbz1YAthn1buJ0jnK49tJAfpCusTt5I70ATYx
         0gOBtgEnf4sVLHiZlKm5pnuNYAZtL3Rzzi/83WU03/jW4uF8lW9YNQSmsWMMziU6Y5Oa
         Vuklbd5Nus9ElENtzXUkbsmUVT2wjmPP0OAH/Y/CSj1EikMdGljd0ewAMOv1mYeWNWlH
         wWbdevHWLvxK7U1mqSRRgn8dttBSzPxRw43NT4YSLoheKQwtucMJZQi8WrsliV+pL26W
         o/2l97fOVDL2+ac20rcG45UJaUaMel5v7Q/2zi5OE6fbzCPP+ehhpmoPCeirYewIILwz
         KvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vFt52X6ZxnjFhdInzqPTsBTf0H25///Yw0La+Ewwi+o=;
        b=DE2ap7F0PkvbeW/iYATe2YovR88dzfJVxX6zCPDpLangqXwmvilG10AV9zkpZOhUIV
         O1XebRA75/qGmeownXuqUnslcq657cmhvrynKFUa83xtAEsuUDua3PYkF7/zlhqjevXR
         ut6gO01KGbhMpOesZH8KDv0/Kr90GUhITWXFO8+tobUTcU8LX2YVtXhdoWYOtWt8H3mo
         0i34WfJOjx4tXRdOEDTShSuncWcJh2tRBkzBuG6V3n9FT+zeKs7aA4rRP3vRqW2YUc67
         YYpRGBiQwLQLTf0FBCVw7T58ge5BXs1JDfV0u8VKi2SLAF8m/9qx3OnOZ6ijU2MXzRIK
         sM2g==
X-Gm-Message-State: AOAM530qbh5USoGSMaDWLfUMoSUQ0sCL/rhRZVCo2wxKCZe2z8kvZNgl
        uglL+CgTtgYCsVU1m/EM91keFQ==
X-Google-Smtp-Source: ABdhPJyF1u1ezjdAA2rWPEYtw/dAw4UYwl9b/mgLDaDmMHfOk/h17IkWVgv5p5leHslveVvEwX3McQ==
X-Received: by 2002:aa7:d698:: with SMTP id d24mr2252260edr.56.1592308793605;
        Tue, 16 Jun 2020 04:59:53 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id lw11sm10833271ejb.58.2020.06.16.04.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 04:59:52 -0700 (PDT)
Date:   Tue, 16 Jun 2020 13:59:51 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2] pinctrl-single: fix pcs_parse_pinconf() return value
Message-ID: <20200616115951.GA3976568@x1>
References: <20200608125143.GA2789203@x1>
 <CACRpkdZupnetd29aehw4HF3isGgRHbqxWZuTkPBusm_EmvjZ4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZupnetd29aehw4HF3isGgRHbqxWZuTkPBusm_EmvjZ4g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 10:31:54AM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2020 at 2:51 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > This patch causes pcs_parse_pinconf() to return -ENOTSUPP when no
> > pinctrl_map is added.  The current behavior is to return 0 when
> > !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> > incorrectly assumes that a map was added and sets num_maps = 2.
> >
> > Analysis:
> > =========
> > The function pcs_parse_one_pinctrl_entry() calls pcs_parse_pinconf()
> > if PCS_HAS_PINCONF is enabled.  The function pcs_parse_pinconf()
> > returns 0 to indicate there was no error and num_maps is then set to 2:
> >
> >  980 static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
> >  981                                                 struct device_node *np,
> >  982                                                 struct pinctrl_map **map,
> >  983                                                 unsigned *num_maps,
> >  984                                                 const char **pgnames)
> >  985 {
> > <snip>
> > 1053         (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> > 1054         (*map)->data.mux.group = np->name;
> > 1055         (*map)->data.mux.function = np->name;
> > 1056
> > 1057         if (PCS_HAS_PINCONF && function) {
> > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > 1059                 if (res)
> > 1060                         goto free_pingroups;
> > 1061                 *num_maps = 2;
> > 1062         } else {
> > 1063                 *num_maps = 1;
> > 1064         }
> >
> > However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
> > !nconfs.  I believe these conditions should indicate that no map was
> > added by returning -ENOTSUPP. Otherwise pcs_parse_one_pinctrl_entry()
> > will set num_maps = 2 even though no maps were successfully added, as
> > it does not reach "m++" on line 940:
> >
> >  895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
> >  896                              struct pcs_function *func,
> >  897                              struct pinctrl_map **map)
> >  898
> >  899 {
> >  900         struct pinctrl_map *m = *map;
> > <snip>
> >  917         /* If pinconf isn't supported, don't parse properties in below. */
> >  918         if (!PCS_HAS_PINCONF)
> >  919                 return 0;
> >  920
> >  921         /* cacluate how much properties are supported in current node */
> >  922         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> >  923                 if (of_find_property(np, prop2[i].name, NULL))
> >  924                         nconfs++;
> >  925         }
> >  926         for (i = 0; i < ARRAY_SIZE(prop4); i++) {
> >  927                 if (of_find_property(np, prop4[i].name, NULL))
> >  928                         nconfs++;
> >  929         }
> >  930         if (!nconfs)
> >  919                 return 0;
> >  932
> >  933         func->conf = devm_kcalloc(pcs->dev,
> >  934                                   nconfs, sizeof(struct pcs_conf_vals),
> >  935                                   GFP_KERNEL);
> >  936         if (!func->conf)
> >  937                 return -ENOMEM;
> >  938         func->nconfs = nconfs;
> >  939         conf = &(func->conf[0]);
> >  940         m++;
> >
> > This situtation will cause a boot failure [0] on the BeagleBone Black
> > (AM3358) when am33xx_pinmux node in arch/arm/boot/dts/am33xx-l4.dtsi
> > has compatible = "pinconf-single" instead of "pinctrl-single".
> >
> > The patch fixes this issue by returning -ENOSUPP when !PCS_HAS_PINCONF
> > or !nconfs, so that pcs_parse_one_pinctrl_entry() will know that no
> > map was added.
> >
> > Logic is also added to pcs_parse_one_pinctrl_entry() to distinguish
> > between -ENOSUPP and other errors.  In the case of -ENOSUPP, num_maps
> > is set to 1 as it is valid for pinconf to be enabled and a given pin
> > group to not any pinconf properties.
> >
> > [0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/
> >
> > Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Patch applied as non-critical (for-next) fix.
> 
> If there is no hurry let's merge it this way with lots of testing
> along the way.
> 
> Yours,
> Linus Walleij

Thanks, I agree more testing is a good idea.

In particular, do you have a way to followup with Haojian Zhuang within
Linaro?

Haojian added the generic pinconf support back in 2013, so it would be
good to get his review.

Also, neither Tony or I have the Hikey hardware to test.

The most important to test would be those which include a .dtsi with
"pinconf-single" compatible.  I do plan to add pinconf-single to the
AM3358 BeagleBone (which is what I am testing on), but the current
mainline users are:

arch/arm/boot/dts/hi3620.dtsi
|- arch/arm/boot/dts/hi3620-hi4511.dts

arch/arm/boot/dts/pxa3xx.dtsi
|- arch/arm/boot/dts/pxa300-raumfeld-common.dtsi
   |- arch/arm/boot/dts/pxa300-raumfeld-connector.dts
      arch/arm/boot/dts/pxa300-raumfeld-controller.dts
      arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dts
      arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dts
      arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dts
      arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dts

I am cc'ing Daniel Mack and Robert Jarzmi as they are listed as
maintainers for the pxa300 related dts files.

Those platforms using compatible = "pinctrl-single" should not be
effected by this patch:

arch/arm/boot/dts/am33xx-l4.dtsi (I have changed to pinconf for test)
arch/arm/boot/dts/da850.dtsi
arch/arm/boot/dts/dm814x.dtsi
arch/arm/boot/dts/dm816x.dtsi
arch/arm/boot/dts/hi3620.dtsi
arch/arm/boot/dts/keystone-k2g.dtsi
arch/arm/boot/dts/keystone-k2l.dtsi
arch/arm/boot/dts/omap3-gta04.dtsi


Thanks,
Drew
