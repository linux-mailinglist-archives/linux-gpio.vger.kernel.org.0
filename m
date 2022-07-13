Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD463573FF0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jul 2022 01:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiGMXJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 19:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiGMXJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 19:09:55 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE46219030
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 16:09:54 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id n9so49001ilq.12
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0U8OihvUY0SUbsVhJMk93wvVq/MDQBMWuuGkfgcpJNI=;
        b=ri0V2YOeCjfvOqrmWJm+IrvBhxy7ZpYljxqJxXFDrx+TLfSH2ULzrf1+YpV7n5U0em
         iwMXY/EZbIj5OVlzxT7/CWWsbBMsnXkqnAi9+GmaO/Jb1t37ykdOPGzL3oHsf+VZC81X
         NujbuvTTmvMr+fnAyRNLtx2BqbZA1LZyjylj+08U1bUReZxdzWeJR9NiTV8334QPFxE8
         6mbHS2Hl1YrEOOJukegyUiMPtzhqY6BUMJxCklmEp0Fdp7K4V889RhPtoRKpk4OY54kf
         VG703BPqtRDoZL1Dznu644MPt9bY3soG++Ly7F62P3S7jaAN3S8DAGOHn0e6asgo10ab
         M7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0U8OihvUY0SUbsVhJMk93wvVq/MDQBMWuuGkfgcpJNI=;
        b=nfu9RaqAHY9Yp8bh5IMInFgFhpNYBsAGSocC/pZ6h9fuQHTvjC1EUocHORKqwaSCNb
         hRmlhjHNpLHfGUyJXvl3oQA0HXjZt97IRQ03VBHZQSLDx193HgdMTu5NAbruqr4PhX67
         LKzKDII3XWwsFZQDJ4MBhiInAYjj00aYmET1mslZQnFeXpjn3UTQi55w5W8GuZBzIi/g
         OMIlWoZNL/XUic/uOZOPByZaJdO68aREBSkYNn4KgWVJYAJHt0ealbPBZOrRtTcA+qJp
         VetqJPc+yaDP3o18rrlTY/cqG4FzmV6mhR3Jsp2dq2Cpq+ey60DK7lu5zlDUSsZw3B5N
         Y+3A==
X-Gm-Message-State: AJIora/qWVpLD6v1du3JOwrLOu4aE74w21yRV8Ihvjv2VVK+oGNoLmV+
        //s0jC0SU5GvHH/4xpvHuO9wiH4D0B7JtU3pBbJ6ahrOXWabDoPf
X-Google-Smtp-Source: AGRyM1sCXX1XB9VLVVGYYAYQMVYbA92oX/a1DOBsoCiqzI3zDdpGUemzbG6CEYUj+XfriHOeJgnVRqezKEXiJuswAOw=
X-Received: by 2002:a92:cda2:0:b0:2dc:7060:ef14 with SMTP id
 g2-20020a92cda2000000b002dc7060ef14mr3104693ild.56.1657753794115; Wed, 13 Jul
 2022 16:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220713225151.1476041-1-robert.marko@sartura.hr>
 <20220713225151.1476041-2-robert.marko@sartura.hr> <Ys+xTubC2iwetqYS@COLIN-DESKTOP1.localdomain>
In-Reply-To: <Ys+xTubC2iwetqYS@COLIN-DESKTOP1.localdomain>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 14 Jul 2022 01:09:43 +0200
Message-ID: <CA+HBbNGyA_+KqBWTpz+NMKs__UkB7Td-_w3aafQfYqnpW8N18g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ocelot: fix pinconf
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 1:01 AM Colin Foster
<colin.foster@in-advantage.com> wrote:
>
> Hi Robert,
>
> On Thu, Jul 14, 2022 at 12:51:51AM +0200, Robert Marko wrote:
> > Commit "pinctrl: ocelot: convert pinctrl to regmap" moved to using
> > regmap_read/write, however it neglected to also carry out alignment
> > to register stride of 4.
> >
> > This would cause the following error:
> > [    1.720873] pinctrl-ocelot 6110101e0.pinctrl: pin_config_set op failed for pin 34
> > [    1.728110] sdhci-sparx5 600800000.mmc: Error applying setting, reverse things back
> >
> > So, regmap_read would return -EINVAL as it was being passed address
> > of the pin without stride, so for example pin 34 would end up being
> > 0x22 in hex.
> >
> > Fix this by accouting for the stride in register address.
>
> Sorry for the bug. Horaitu found this as well and recently submitted
> patches:
>
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20220713193750.4079621-3-horatiu.vultur@microchip.com/
>
> The second patch in his set fixes both of these issues (reg_stride and
> max_register).

Yeah, I noticed his patch only after sending this.
Sorry for the noise.

Regards,
Robert
>
> >
> > Fixes: 076d9e71bcf8 ("pinctrl: ocelot: convert pinctrl to regmap")
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/pinctrl/pinctrl-ocelot.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> > index 84bfbe649b67..a71145367b15 100644
> > --- a/drivers/pinctrl/pinctrl-ocelot.c
> > +++ b/drivers/pinctrl/pinctrl-ocelot.c
> > @@ -1327,7 +1327,9 @@ static int ocelot_hw_get_value(struct ocelot_pinctrl *info,
> >       if (info->pincfg) {
> >               u32 regcfg;
> >
> > -             ret = regmap_read(info->pincfg, pin, &regcfg);
> > +             ret = regmap_read(info->pincfg,
> > +                               pin * regmap_get_reg_stride(info->pincfg),
> > +                               &regcfg);
> >               if (ret)
> >                       return ret;
> >
> > @@ -1359,14 +1361,18 @@ static int ocelot_pincfg_clrsetbits(struct ocelot_pinctrl *info, u32 regaddr,
> >       u32 val;
> >       int ret;
> >
> > -     ret = regmap_read(info->pincfg, regaddr, &val);
> > +     ret = regmap_read(info->pincfg,
> > +                       regaddr * regmap_get_reg_stride(info->pincfg),
> > +                       &val);
> >       if (ret)
> >               return ret;
> >
> >       val &= ~clrbits;
> >       val |= setbits;
> >
> > -     ret = regmap_write(info->pincfg, regaddr, val);
> > +     ret = regmap_write(info->pincfg,
> > +                        regaddr * regmap_get_reg_stride(info->pincfg),
> > +                        val);
> >
> >       return ret;
> >  }
> > --
> > 2.36.1
> >



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
