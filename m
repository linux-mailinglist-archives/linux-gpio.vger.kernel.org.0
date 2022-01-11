Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE60D48AB2E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 11:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349072AbiAKKOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 05:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349295AbiAKKOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 05:14:00 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE14DC061763
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 02:13:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t28so25203893wrb.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 02:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6PCA+vRYUe/AduahtIfH11YxAjqrR5aT6yWf1P1UjKM=;
        b=xrnn7pfPtVk8GmZXH74suntUOfiJSbMkHTNai+3uNuBcbbzTXiKd42TVtluDU8+XvJ
         eJguqBRQB3yNfFCspuEeUxuaG6YnNk1ykZ+ErK52kqvbSO2THosjeqXIyu7roja9Jt3y
         MsDa3SCUlGcXd69wdtgbEgkZlmrL1rKbc/HyhQxseE8XYICgaXD/yt6QnZM+C/KPokj2
         PohuiVjL8E5sb3VTAoeQwHQzWsRceX7zawKB65yMb5Ur5wvbTbjj5yCK9nGBVA/TVu+K
         9sS3zrIT8iX5UtY2HUjey0tlfdUaQ3PfPub6AlX9ZaPMvLn4AzsfCh7pvQmGWEq+nCSQ
         yFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6PCA+vRYUe/AduahtIfH11YxAjqrR5aT6yWf1P1UjKM=;
        b=WpGo9wYg4x/t/+XqK1O1wganQZVhmPY/MQAt00xCwBb+yYgr177V2qaFdQ/mVRoMDP
         m4ZzVPJDOCiy2toM23gfLrj96RXXkgIs5O5eqeFNrqbqfAhm5QTS7Tdajlwo3JKv+yKB
         OrlF4rwmsitQCVfMyyXhWaIIxv417R56qlQmcPGoRpQO0YBJBBJM06NfyII1evWh6rjV
         Bj5lyIpQQTDHlPc8/0cgS8Ku2/qiw6lKX2yexDKR9QOQ0pW48FB6mHyKVbcJyUie0meo
         w++o6hX/5QqA/qbgHZYyHjwPBEH1V+JxyayLnWpKllEcRp4FG2MO2RDrJz1hWmSOtlrp
         uakw==
X-Gm-Message-State: AOAM531hUpUJfCRtTMubLSYJ/rcX5C9WJgvuww/Us6yt7fXdLLocH4dE
        RV6EG3D81/9Z0Qx2IBDx/e20iw==
X-Google-Smtp-Source: ABdhPJywTk9GhMWZxxqHvgfzFl2ehPAmWpoal5qpAaIBDxvx3IEGSmDLg3dQoXaJJEoI6VdA5mEzlQ==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr3048585wrw.591.1641896036277;
        Tue, 11 Jan 2022 02:13:56 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id d22sm9158677wrb.83.2022.01.11.02.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 02:13:55 -0800 (PST)
Date:   Tue, 11 Jan 2022 10:13:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     broonie@kernel.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC v5 net-next 01/13] mfd: ocelot: add support for external
 mfd control over SPI for the VSC7512
Message-ID: <Yd1YV+eUIaCnttYd@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-2-colin.foster@in-advantage.com>
 <Ycx9MMc+2ZhgXzvb@google.com>
 <20211230014300.GA1347882@euler>
 <Ydwju35sN9QJqJ/P@google.com>
 <20220111003306.GA27854@COLIN-DESKTOP1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111003306.GA27854@COLIN-DESKTOP1.localdomain>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > > > No magic numbers please.
> > > 
> > > I've gotten conflicting feedback on this. Several of the ocelot drivers
> > > (drivers/net/dsa/ocelot/felix_vsc9959.c) have these ranges hard-coded.
> > > Others (Documentation/devicetree/bindings/net/mscc-ocelot.txt) have them
> > > all passed in through the device tree. 
> > > 
> > > https://lore.kernel.org/netdev/20211126213225.okrskqm26lgprxrk@skbuf/
> > 
> > Ref or quote?
> > 
> > I'm not brain grepping it searching for what you might be referring to.
> > 
> > I'm not sure what you're trying to say here.  I'm asking you to define
> > this numbers please.
> 
> I'll define the numbers as you suggest.
> 
> The quote I was referring to is this:
> 
> > The last option I haven't put much consideration toward would be to
> > move some of the decision making to the device tree. The main ocelot
> > driver appears to leave a lot of these addresses out. For instance
> > Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt.
> > That added DT complexity could remove needs for lines like this:
> > > > +              ocelot->map[GCB][GCB_MIIM_MII_STATUS & REG_MASK],
> > But that would probably impose DT changes on Seville and Felix, which
> > is the last thing I want to do.
> 
> The thing with putting the targets in the device tree is that you're
> inflicting yourself unnecessary pain. Take a look at
> Documentation/devicetree/bindings/net/mscc-ocelot.txt, and notice that
> they mark the "ptp" target as optional because it wasn't needed when
> they first published the device tree, and now they need to maintain
> compatibility with those old blobs.

I wasn't asking you to put it in DT, just to define the numbers.

> > > There's yet another complexity with these, and I'm not sure what the
> > > answer is. Currently all regmaps are tied to the ocelot_spi device...
> > > ocelot_spi calls devm_regmap_init. So those regmaps hang around if
> > > they're created by a module that has been removed. At least until the
> > > entire MFD module is removed. Maybe there's something I haven't seen yet
> > > where the devres or similar has a reference count. I don't know the best
> > > path forward on this one.
> > 
> > Why are you worrying about creating them 2 different ways?
> > 
> > If it's possible for them to all create and use their own regmaps,
> > what's preventing you from just do that all the time?
> 
> There isn't really any worry, there just might be efficiencies to be
> had if two children share the same regmap. But so long as any regmap is
> created with unique names, there's no reason multiple regmaps can't
> overlap the same regions. In those cases, maybe syscon would be the best
> thing to implement if it becomes needed.
> 
> I have nothing against making every child regmap be unique if that's the
> desire.

Unless something has changed or my understanding is not correct,
regmap does not support over-lapping register ranges.

However, even if that is required, I still think we can come up with
something cleaner than creating a whole API based around creating
and fetching different regmap configurations depending on how the
system was initialised.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
