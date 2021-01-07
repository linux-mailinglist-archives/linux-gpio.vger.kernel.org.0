Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EBD2ED2E3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 15:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbhAGOj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 09:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbhAGOj2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 09:39:28 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8681FC0612F4;
        Thu,  7 Jan 2021 06:38:47 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id a12so15052278lfl.6;
        Thu, 07 Jan 2021 06:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJS9/CNsxFahXO0MUi9+DuCRjAZn2AqFu2JrET2ceT8=;
        b=VCEfU+y6pCmU88hayZZQc8/tOi/+HcnnZzryU/WzmOERgMFE/BBVr635ayEcUwAE9P
         jNk8ce4HT3MZmbd6C41i9UEGVh2iXN132kgQGij/sy/drHgSnmcTxy+eSwCrDNMNIIW1
         2mn8RRhHEYk7ih3TYzpdbMO/76VMf+1p8esXcRWPhfrPgIZtG7BFFFmqdcBbJERJ43Pz
         HElAWOOHcUfOIalimSNfJjjOeitjM6D5b5SbJly8g0VCH9SyT9Yy1StP5e+lCTe2AYOz
         tbxHn4F0VMpALNJmBExpTdvqfjMrySR1OHgwK3B/32ijphUgjiGyDAHuOlQCwtAp331f
         /eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJS9/CNsxFahXO0MUi9+DuCRjAZn2AqFu2JrET2ceT8=;
        b=UT08LSSrhxvFZJ873CcgGaFdmtZ6H/PgHCcGyB05MYiGcTb8C2gO0rmsGkTq+1pcQI
         ujweFhRRTgBswbfafMTeA29N/dQyT37oFrcriPXRtHTCveM+8r9cgdxIuaUKJvoemYKC
         Uuw5EUG9IkpRlVmdUfkG6i1WG3hYaxmRdxQGQJd9NkSwb+3WErcj/idc/SYDH5WXJ7i8
         bVSSZ8Hn7Ssj0g+3NHXVgbSBtadT+9JQW5+CiX1HJ2DPyZVKMybgnf7dlGY8+QQI7JyR
         Hasiy0OsZVLSmOXSTHL4yYntaW5mPbmPyioBhgtRoqTcfZx5AHHQfywdhl722GOYbP+/
         GA7w==
X-Gm-Message-State: AOAM530YpCssUqjRZwrVJS9JctFQxGMcsVB2ODPaoRvKz2uw69MSTTCN
        V+reAiKg2KNtpXuixH7CGpepOP5mz8nTuwSJcciqu2Z3nLc=
X-Google-Smtp-Source: ABdhPJy/+R0QYAZeZjxNPLd24LCIjdCWhwnFPxzBElE2lugaT1hxZ+mqlHiqmXO7BgA3mpmu58svn409zo6e1agitEs=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr4485553ljg.347.1610030326063;
 Thu, 07 Jan 2021 06:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20201230214918.17133-1-festevam@gmail.com> <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
 <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com> <X/cZ6QguhQr3c2XH@lunn.ch>
In-Reply-To: <X/cZ6QguhQr3c2XH@lunn.ch>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 7 Jan 2021 11:38:33 -0300
Message-ID: <CAOMZO5Cd_UYm5qFQGCA7NOYznZKmPbae6ktJu0FDRTMbudzP-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sandor Yu <sandor.yu@nxp.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andrew,

On Thu, Jan 7, 2021 at 11:25 AM Andrew Lunn <andrew@lunn.ch> wrote:

> There are two different GPIO supported. There is the bus GPIO you have
> found, which is intended to reset all devices on the MDIO bus.
>
> And there is a per device GPIO reset and reset controller. However, in
> order to use these, you need to be able to 'discover' the PHY,
> potentially when the device is held in reset. Some devices will
> respond to MDIO while held in reset, some don't. If you PHYs don't you
> need to add a compatible of the form
> ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$ with the PHY ID. The PHY
> will then be probed, independent of if it can be found on the bus or
> not, and that probing will enable the GPIO.

It works after following your suggestion :-)

I will submit the dts patches shortly.

Thanks a lot for your help, really appreciate it!
