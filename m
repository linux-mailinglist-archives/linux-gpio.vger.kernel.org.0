Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE048B2C1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 18:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243476AbiAKRAU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 12:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243374AbiAKRAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 12:00:20 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7F3C061751
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:00:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id k30so16602276wrd.9
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NNYB1fpSdHn1SGE7HC7Cip2W4Lcc56vdZ9X8IB1dR54=;
        b=aOqzxc9C+aJCvdJzMyIrucs6jYDzmqnuVKsanHQoRoQxCj0sDhDMCpqRdgOOqHjnlj
         phLFCGopg2BJRPWWsq0bPooZ03DjLJREZlL7NQyoYoD4KCBsUMlCMlqFj5O1e+e089ix
         qw7+db1uH+z/0WAXFHPDkeWDXg0HsKt799I1ix+rAS8LI1dvlIIb+f3E52QpsxJ6MB8c
         X1DwFLZTCu9tPmXfe0Nb+5p58e9Orh/R7mps6jIWiWahAZwjHC5NIP0e/ytdal7AovRX
         OsDsFwGcFc7ozETwrcKTw4rDqNgfkYNcIk+pgvJJVXMxGW9nebTff1jYQ7nsIPw2fsr+
         2m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NNYB1fpSdHn1SGE7HC7Cip2W4Lcc56vdZ9X8IB1dR54=;
        b=ir6zWzrCdsHPXfglalHU8cDHIzdorzSkZilLmM6jl35SOCEy5T0PMjkcrnMaouubNr
         t1m7Au/qwHiffn1bpGdP4NIsi+oRJU2X3hExzosuN1ZSOiAxxWaNSNOV5QWfh1jjKwDL
         l3KXMZkK9kicCvpU1+sO9VZuU9l56mjbXxR5uAscXdu+8Pa34ju7n8zEU9aTWvvsqolR
         Xu5jk43LVrKBGfnw9NrjPp4SjIlTn28m11U7mu3tWE4/B18Gv6dEbLxi78USD/3EPXp9
         8LCWkoCrShk+mJL7cc6laJGUBZEAZPHo8kjAsL0886ErWLLDnNyhJ3ZaiRlwiJ/UXR6m
         zTQg==
X-Gm-Message-State: AOAM530W9b6qZ85gSOiur77nnEch3MiAqrRpgVGzUe7SAz3tDgE0ft3k
        CNSxgm9n6UBJouoB6taySN7t3w==
X-Google-Smtp-Source: ABdhPJy6RMlYyuI8S6gD68ptMhcHpXTD34Zw9M9XEjFsj3szNMaN7iqz1e4cDJ93WEKeJptuXElpaQ==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr1872442wrv.12.1641920418599;
        Tue, 11 Jan 2022 09:00:18 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id az6sm1083597wmb.48.2022.01.11.09.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:00:18 -0800 (PST)
Date:   Tue, 11 Jan 2022 17:00:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
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
Message-ID: <Yd23m1WH80qB5wsU@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-2-colin.foster@in-advantage.com>
 <Ycx9MMc+2ZhgXzvb@google.com>
 <20211230014300.GA1347882@euler>
 <Ydwju35sN9QJqJ/P@google.com>
 <20220111003306.GA27854@COLIN-DESKTOP1.localdomain>
 <Yd1YV+eUIaCnttYd@google.com>
 <Yd2JvH/D2xmH8Ry7@sirena.org.uk>
 <20220111165330.GA28004@COLIN-DESKTOP1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111165330.GA28004@COLIN-DESKTOP1.localdomain>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 11 Jan 2022, Colin Foster wrote:

> Hi Mark and Lee,
> 
> On Tue, Jan 11, 2022 at 01:44:28PM +0000, Mark Brown wrote:
> > On Tue, Jan 11, 2022 at 10:13:43AM +0000, Lee Jones wrote:
> > 
> > > Unless something has changed or my understanding is not correct,
> > > regmap does not support over-lapping register ranges.
> > 
> > If there's no caches and we're always going direct to hardware it will
> > work a lot of the time since the buses generally have concurrency
> > protection at the lowest level, though if the drivers ever do any
> > read/modify/write operations the underlying hardware bus isn't going to
> > know about it so you could get data corruption if two drivers decide to
> > try to operate on the same register.  If there's caches things will
> > probably go badly since the cache will tend to amplify the
> > read/modify/write issues.
> 
> Good point about caches. No, nothing in these drivers utilize caches
> currently, but that doesn't mean it shouldn't... or won't. Any
> concurrency in this specific case would be around the SPI bus.
> 
> I think the "overlapping regmaps" already exist in the current drivers... 
> but actually I'm not so sure anymore.
> 
> Either way, this is helping nudge me in the right direction.
> 
> > 
> > > However, even if that is required, I still think we can come up with
> > > something cleaner than creating a whole API based around creating
> > > and fetching different regmap configurations depending on how the
> > > system was initialised.
> > 
> > Yeah, I'd expect the usual pattern is to have wrapper drivers that
> > instantiate a regmap then have the bulk of the driver be a library that
> > they call into should work.
> 
> Understood. And I think this can make sense and clean things up. The
> "ocelot_core" mfd will register every regmap range, regardless of
> whether any child actually uses them. Every child can then get regmaps
> by name, via dev_get_regmap. That'll get rid of the back-and-forth
> regmap hooks.

I was under the impression that MFD would not always be used?

Didn't you have a use-case where the child devices could be used
independently of anything else?

If not, why don't you just register a single Regmap covering the whole
range?  Then let the Regmap API deal with the concurrency handling.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
