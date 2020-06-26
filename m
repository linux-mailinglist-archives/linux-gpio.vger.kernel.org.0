Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332AD20B941
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 21:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgFZTTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 15:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgFZTTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 15:19:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93618C03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 12:19:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g18so10553909wrm.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v3oOHqdeiilgAo1krqYM7ZW2FYPIuBxdWkBI8kNf8w4=;
        b=NQTltRUUQEyW33Cu2UEltV6GamFzrhZ94/moDjBBeDIWK+eLNpNbN3QnKUQZ633i2K
         SAsyOsZB2dkM/QqQzckArvwRNsGVVPcFsTY3EBvlYaR1TH2zFC+ToIUhC3weBqAwMNqY
         46WgvtmTea15ADPMKPKljDfRBsW1N6yeG9DPkIqCntAcs+IIAJ7Q3uhTiN9qATp6+4Gb
         uVNjVPK5U6YHPGAtTdvXUTqdLbqBuznHnSm7leob0E5rMqNAoLutVOjPOmoP1dyYLzT6
         CAjpfEhlqeTrl0rjehSk66/5E9syf5SYN3q29L41ioUbUusekaKJf+TwW8farRSItzlT
         /Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v3oOHqdeiilgAo1krqYM7ZW2FYPIuBxdWkBI8kNf8w4=;
        b=Q7Yoe3INumLr5lkW3t9dlYmMzGsEDmn/3VNQAhlWV8mBn9xbsqvDCusA+oY5hWh8yX
         0fkXr5tojvbN30PanvdGJm6LjHopGMUJyY6bipvXNEnc/ciKYflN9+u7lTJoFGHBjOIO
         fXeyCWix/7EnF7h1ilxmYtSSXJH6s7ZVzG73fFvJbaXb7ItScMOvVqR+DAyGPTf2Z9oo
         +M2887GhiOFcBjOFm6Vr8U5w/9tqLg7v4UlfYX7zCH0opT7jisc+VtWxoG3Kp1LhcMvY
         IK2LVgOBan3NpufYUzpoXfoeIjwErraGBrjzmntBbyOdtRlZd1qLQMmgicWUR8MFAaX6
         rf2w==
X-Gm-Message-State: AOAM530NesPfxCBwaWIu2EuKbnDJMFw7dbFOmP7LArs66jx3yaV6YWYS
        QBqohTBVIJfTHLXO+zhOqOWbXQ==
X-Google-Smtp-Source: ABdhPJyxppcg9yXdgcCtGmzUVM0Qhgol51JAPy/Ev0oDVmvT+dzG+dcduwYmDgiNPxITN/BSFtuOaA==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr5249137wrw.300.1593199189262;
        Fri, 26 Jun 2020 12:19:49 -0700 (PDT)
Received: from x1 ([2001:16b8:5c03:b001:3446:ed90:fece:8da5])
        by smtp.gmail.com with ESMTPSA id w12sm29179536wrm.79.2020.06.26.12.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 12:19:48 -0700 (PDT)
Date:   Fri, 26 Jun 2020 21:19:46 +0200
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
Message-ID: <20200626191946.GA97666@x1>
References: <20200608125143.GA2789203@x1>
 <CACRpkdZupnetd29aehw4HF3isGgRHbqxWZuTkPBusm_EmvjZ4g@mail.gmail.com>
 <20200616115951.GA3976568@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616115951.GA3976568@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 01:59:51PM +0200, Drew Fustini wrote:
> On Tue, Jun 16, 2020 at 10:31:54AM +0200, Linus Walleij wrote:
> > On Mon, Jun 8, 2020 at 2:51 PM Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > This patch causes pcs_parse_pinconf() to return -ENOTSUPP when no
> > > pinctrl_map is added.  The current behavior is to return 0 when
> > > !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> > > incorrectly assumes that a map was added and sets num_maps = 2.
> > >
> > > Analysis:
> > > =========
> > > The function pcs_parse_one_pinctrl_entry() calls pcs_parse_pinconf()
> > > if PCS_HAS_PINCONF is enabled.  The function pcs_parse_pinconf()
> > > returns 0 to indicate there was no error and num_maps is then set to 2:
> > >
> > >  980 static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
> > >  981                                                 struct device_node *np,
> > >  982                                                 struct pinctrl_map **map,
> > >  983                                                 unsigned *num_maps,
> > >  984                                                 const char **pgnames)
> > >  985 {
> > > <snip>
> > > 1053         (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> > > 1054         (*map)->data.mux.group = np->name;
> > > 1055         (*map)->data.mux.function = np->name;
> > > 1056
> > > 1057         if (PCS_HAS_PINCONF && function) {
> > > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > > 1059                 if (res)
> > > 1060                         goto free_pingroups;
> > > 1061                 *num_maps = 2;
> > > 1062         } else {
> > > 1063                 *num_maps = 1;
> > > 1064         }
> > >
> > > However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
> > > !nconfs.  I believe these conditions should indicate that no map was
> > > added by returning -ENOTSUPP. Otherwise pcs_parse_one_pinctrl_entry()
> > > will set num_maps = 2 even though no maps were successfully added, as
> > > it does not reach "m++" on line 940:
> > >
> > >  895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
> > >  896                              struct pcs_function *func,
> > >  897                              struct pinctrl_map **map)
> > >  898
> > >  899 {
> > >  900         struct pinctrl_map *m = *map;
> > > <snip>
> > >  917         /* If pinconf isn't supported, don't parse properties in below. */
> > >  918         if (!PCS_HAS_PINCONF)
> > >  919                 return 0;
> > >  920
> > >  921         /* cacluate how much properties are supported in current node */
> > >  922         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> > >  923                 if (of_find_property(np, prop2[i].name, NULL))
> > >  924                         nconfs++;
> > >  925         }
> > >  926         for (i = 0; i < ARRAY_SIZE(prop4); i++) {
> > >  927                 if (of_find_property(np, prop4[i].name, NULL))
> > >  928                         nconfs++;
> > >  929         }
> > >  930         if (!nconfs)
> > >  919                 return 0;
> > >  932
> > >  933         func->conf = devm_kcalloc(pcs->dev,
> > >  934                                   nconfs, sizeof(struct pcs_conf_vals),
> > >  935                                   GFP_KERNEL);
> > >  936         if (!func->conf)
> > >  937                 return -ENOMEM;
> > >  938         func->nconfs = nconfs;
> > >  939         conf = &(func->conf[0]);
> > >  940         m++;
> > >
> > > This situtation will cause a boot failure [0] on the BeagleBone Black
> > > (AM3358) when am33xx_pinmux node in arch/arm/boot/dts/am33xx-l4.dtsi
> > > has compatible = "pinconf-single" instead of "pinctrl-single".
> > >
> > > The patch fixes this issue by returning -ENOSUPP when !PCS_HAS_PINCONF
> > > or !nconfs, so that pcs_parse_one_pinctrl_entry() will know that no
> > > map was added.
> > >
> > > Logic is also added to pcs_parse_one_pinctrl_entry() to distinguish
> > > between -ENOSUPP and other errors.  In the case of -ENOSUPP, num_maps
> > > is set to 1 as it is valid for pinconf to be enabled and a given pin
> > > group to not any pinconf properties.
> > >
> > > [0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/
> > >
> > > Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > 
> > Patch applied as non-critical (for-next) fix.
> > 
> > If there is no hurry let's merge it this way with lots of testing
> > along the way.
> > 
> > Yours,
> > Linus Walleij
> 
> Thanks, I agree more testing is a good idea.
> 
> In particular, do you have a way to followup with Haojian Zhuang within
> Linaro?
> 

Linus - do you have a way to contact Haojian Zhuan?

I found them on Freenode but they have been idle since beginning of
June.  Last email I can find on the mailing list is from March.

Tony and I would both like someone familiar with Hisilicon to comment on
this patch as it is using pinctrl-single.

Thanks,
Drew
