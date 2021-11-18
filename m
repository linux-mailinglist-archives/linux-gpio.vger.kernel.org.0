Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE03455775
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 09:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243517AbhKRI7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 03:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244880AbhKRI61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 03:58:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5EBC0613B9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 00:55:18 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u18so10054576wrg.5
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 00:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dSP+w0ULKXB14fx0Qg6uZmQEgEDOZqwyyo7QWe1WeRA=;
        b=ydGmwL4bJDWdRowxUjZt8fkHicYan+sgcnHB3CDDWdrWIZ8SfGCvjnttvQl6Av5vlr
         s6PrLg6WG4iAClWRg4ABvIUY5CoPtZ1J8dPHr9UUowjjMD4oV4y3F/fStxNQWSI7JIhu
         Wl17LV+jYNskvi1g3OB4pI+WRDya+Ni66dYqqj1oORgx93UMAo4F6oQHfWVjY0kjzNOF
         b0a/2g4B9e0VFYvtAFTw52qfI+9oxP11ske5S/1xGpCj0YjTW5PflN3gXSTlO9I4Lhdl
         o5dbw2PJfgAiIgVp0fOOzgRhSj1XSewWVex+fR/7KOeHmaWcgDV5BBO2HSumFII0Xmav
         S53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dSP+w0ULKXB14fx0Qg6uZmQEgEDOZqwyyo7QWe1WeRA=;
        b=ERsQtoMYMYAa6MiXyVjsXUZ3RUC5r+zqZtSCcTOnz0M+P5GR5AhKdINxDtFaeWHGsC
         FaYLAX8RaBMt03OCWwdzskRXYL68dT411fz7ll5YahsX6B6OnoGa5N3W4ocE0Ub6MdxK
         KqXlw8pL+naLjhZ9kOaV0Zya2FhfeRyBMzGcIBd/iVqFDQQ/UCPexmuI/7gPuxe/avzJ
         KnfYS8PCqFldF9yYLdahfal9bTgy9yELvdLda5OQhVOBHhYqfnifvoyzDKTdvoEkuOeT
         UwfmvaS8M4O8pCrnGNDCsBPm34328zPNfW74/QbIYPd2oTSx0XpuENdjPyo66tZ/OwoF
         3EvQ==
X-Gm-Message-State: AOAM5330IIeVVjuhXODjjszBK1f2fU9JYsQ6EmT4rGqUsW40tVVwj1nQ
        9mV3Uni+JbASsfTdsQGHfISAFA==
X-Google-Smtp-Source: ABdhPJxCrYvy/KHbOLzaUjVIo3pWbsYkJIUI9dO/1fGCACLzErizkkHVQ37qGCEiCScVrzOKly2AKQ==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr30566144wrd.33.1637225717048;
        Thu, 18 Nov 2021 00:55:17 -0800 (PST)
Received: from google.com ([95.148.6.231])
        by smtp.gmail.com with ESMTPSA id n129sm2279008wmn.36.2021.11.18.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 00:55:16 -0800 (PST)
Date:   Thu, 18 Nov 2021 08:55:14 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH RESEND 0/4] Drop ROHM BD70528 support
Message-ID: <YZYU8hzZyzcPHCTT@google.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com>
 <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
 <CAMRc=Mc-+ZR1PR9p=cXkfMWdKn1d1VCxmhBknSzNaDjepfpV-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc-+ZR1PR9p=cXkfMWdKn1d1VCxmhBknSzNaDjepfpV-g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 16 Nov 2021, Bartosz Golaszewski wrote:

> On Tue, Nov 16, 2021 at 7:41 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> >
> > On 11/16/21 18:10, Andy Shevchenko wrote:
> > > On Tue, Nov 16, 2021 at 2:52 PM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > >>
> > >> Drop ROHM BD70528 support
> > >>
> > >> Unfortunately there has not been a big demand for ROHM BD70528
> > >> IC. The few users I know control PMIC from separate M4-core,
> > >> which is not running Linux. I am not aware of any users of this
> > >> Linux driver.
> > >>
> > >> While I did really like this IC and writing the drivers for it,
> > >> seems like these drivers are becoming useless burden. So, I see
> > >> no point in maintaining them. Let's just drop the drivers if
> > >> there is no objections to this series. :(
> > >>
> > >> The regulator, WDG and power-supply drivers were already dropped.
> > >>
> > >> The RTC and clk drivers remain in use by few other ROHM IC drivers.
> > >> Nevertheless, they are already converted to not depend the BD70528
> > >> defines during previous cycle.
> > >>
> > >> This series cleans the remaining pieces, GPIO, MFD, dt-bindings and
> > >> MAINTAINER entries. The GPIO code uses defines from MFD - but the GPIO
> > >> part is also depending on MFD KConfig entry - so there should be no
> > >> breakages even if the patches were applied to respective subsystem trees
> > >> and were not carried via single tree.
> > >
> > > FWIW, no objections from me.
> >
> > Thanks Andy!
> >
> > I see acks from Andu, Bartosz, Lee and Rob. It'd be nice to see ack from
> > Linus W too - but other than that - I guess this is good to go. Any
> > preferences regarding the tree(s) that could carry the patches? All via
> > MFD or each patch merged to the subsystem it fits the best?
> >
> > Best Regards
> >         Matti Vaittinen
> 
> Normally Lee takes MFD patches together with those touching relevant subsystems.

Yep, it's on the list.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
