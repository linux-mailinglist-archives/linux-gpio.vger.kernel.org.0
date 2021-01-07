Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0552ECF66
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 13:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbhAGMRZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 07:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbhAGMRZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 07:17:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C8EC0612F4;
        Thu,  7 Jan 2021 04:16:44 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x20so13972018lfe.12;
        Thu, 07 Jan 2021 04:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=85dPZRsP6nkC/1XbR301WH+ox0ge8wjI3oQ+jLKdIl0=;
        b=aXTqXEsMheCVQp9e+Q9VCYVzR6/M33UAl1014FiLwVQDmdubE+LjuCb98NsV6V9Vyg
         auWl1wkbflJ15nBdIKKCCjxcqvdXcr4d8xw6hay2um8Ccu5ILBOfuY/vuIXJr9CT6msZ
         dLYFL4Ksbj+EZRwt7l+jpncG5r+SmxK/B7XTQDqu6MMK387nKyOnFG83PpdnCqWyF6Ye
         ZGL4DSgCoaisgsVOrD3SfigIFl3kQNvgbnZLHNzgHWQuacoqnhxrQBeqVUswrJqQLivO
         +7222LRZKrbd5ZKNO5EsNSqORSndg5z3vpwhuU4fp9m+kvTPwxTWqHZDwkx9RQ0cDdOX
         yQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=85dPZRsP6nkC/1XbR301WH+ox0ge8wjI3oQ+jLKdIl0=;
        b=kPR6ty3ODy4jh2XS6MpDM3nuPeFkJ1kQAMaWMMSRUFye2xiswZupJn4q1g9UKQO5oq
         Y6SyHExTUrxG9aTDEDnCy6E6j4W29NgBHfDtbx+ITrSsYsFwAlLm1OJmXG64HzlY4Ntw
         eWy/OUkeRtjjMcevxw13JWVAgOy80OQ9ChK+zATKdGyD99qKEApEdX+dneRNQq/nK4qu
         lL0pgVCyd4LrXJIcUYFH9+GBQAm3wi/qzzElffJj2Qzo4SVIMncZh+zCWik9c2DFzLUK
         IVXWtqdtNjME+GjUEHa9jz7kIvpoQQNPsKLgQOvAyCP8z5nUUVSmpyhR68dQgbxgfGkh
         xr1g==
X-Gm-Message-State: AOAM530DqQj0nGG5sYj6YyaYad2bH1pak/YF1p4FAnThYtj41TfNi72H
        uvzhsyQJMVT3X9M0heij3U5Yop+t945Dqv2g7T4=
X-Google-Smtp-Source: ABdhPJwsY9fR4lt7JIppWjCYp2Sg7aO5ZqWcDWu4QheAChifwAhFJ3rcE/ZDtniFvnUnp1LKBuCAhT1/z2tB0c4yFEM=
X-Received: by 2002:a19:d93:: with SMTP id 141mr4059107lfn.229.1610021802821;
 Thu, 07 Jan 2021 04:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20201230214918.17133-1-festevam@gmail.com> <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
In-Reply-To: <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 7 Jan 2021 09:16:31 -0300
Message-ID: <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sandor Yu <sandor.yu@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Jan 5, 2021 at 12:35 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> So should the ethernet PHY not just have some reset-gpios
> that it obtain and de-assert as part of probing?
>
> For example drivers/net/phy/mdio_bus.c has this:
>
>         /* de-assert bus level PHY GPIO reset */
>         gpiod = devm_gpiod_get_optional(&bus->dev, "reset", GPIOD_OUT_LOW);
>
> Other drivers can do the same.
>
> Deferred probe should ascertain that this GPIO driver gets
> loaded before the ethernet phy driver.

Thanks for your review. I investigated this further and it seems to me
that the issue is in drivers/net/phy/mdio_bus.c, so I am adding some
netdev folks.

The driver drivers/net/phy/mdio_bus.c and the yaml description says
that it only supports one bus level PHY GPIO reset via reset-gpios
property.

On the imx6ul-evk, there are two KSZ8081 PHYs in the same mdio bus, so
this is how I described it in dts:

https://pastebin.com/raw/xLjYUHdN

but the 'reset-gpios' properties are not found in this case. I think
we need to let drivers/net/phy/mdio_bus.c to search for 'reset-gpios'
also inside the mdio children.

My understanding is that adding phy-reset-gpios under each fec node is
deprecated.

Any suggestions?

Thanks,

Fabio Estevam
