Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5692ED1E0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 15:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbhAGOSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 09:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729366AbhAGOSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 09:18:47 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05965C0612F6
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 06:18:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so14865794lff.9
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 06:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WWdGOoyElKTAIa/MsUJRr8gfTIrASkheJYHyIrrUlZU=;
        b=Y7xvknu3uIQbVmMO/lfSBQwQJvR8qyy2EJr2uGB7oXxD84HpEYu3BEwSE3FEh6uysa
         2luFHBLbyOffWvRJAn+BvvVuzQKUvlEJRGpqnwTKraPOVc/1iGFx4S0c2fVuaHcqVlh5
         raVYWSZZ7M3Yq+xs+aEVEyIjKN30OHW11XF7G6OyC8U+eYUZ695RE0NnbKQSdVUq7Fo5
         N8UHJSolOE/7ReESAmJ6fqWxGgCAOCXpL8NDSCIdlmwFXopmk46ip8gSTQWmT8V2OhRd
         lWCIE0Jg24P4TTEpWdhCopEJyAdNZ7AJIEjcbIgawQp95lQsaPFiB4Iu8ZHHgdVTJnf5
         axVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WWdGOoyElKTAIa/MsUJRr8gfTIrASkheJYHyIrrUlZU=;
        b=CT26WfgASNGG0mAOzv3POHK0wayDxkQwSKAfoTA9p817qROo014cKML+FDlv96s20r
         zeSXigaFPFrDREZV1Q4RNymTWqYvp2rO07pe52+xWNcq79/EcfsxRzuWrBC7Wwd7EPVa
         WhSKBASj3PW3Vkr635lg+Gz8GAfeCXNfBqqJ68SJMmdxIw9bK8CnpdpRy3QzHi/c3cpH
         cX6IWHggeV/WEL2rnpBhnWk29Q8SMOF/9pv3GpxgulRJrHLgVqavN8+kr0AaIiQhv4GO
         gZk1qjh+4J8PZoYL24+xd/8Uga4z/M4bef2z6I0aGpA96fcwmHa4KnBuff2EMbJj7ZlB
         TcLg==
X-Gm-Message-State: AOAM533DsteFthVfRl304vjaYhTDx4zrIaALxSDvAOCQHpGh+Z0rugnU
        MV4xF3rE0FTsNBD+FAib4v6vKDsw4WcSxjJW46f8aA==
X-Google-Smtp-Source: ABdhPJw0vT/va3bVsMxFijWgSTwF09HnaC5Sdtu2dTbMahKK0smI1io+PZxPmKfjl63eZqv2CkBfba+WbrxfH3DaZJU=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr4250570lja.200.1610029085432;
 Thu, 07 Jan 2021 06:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20201230214918.17133-1-festevam@gmail.com> <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
 <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
In-Reply-To: <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 15:17:54 +0100
Message-ID: <CACRpkdYtjXMOv+G3_hXAiS4J51FKC4kcuDCmqr_kivuh61udPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
To:     Fabio Estevam <festevam@gmail.com>
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

On Thu, Jan 7, 2021 at 1:16 PM Fabio Estevam <festevam@gmail.com> wrote:

> The driver drivers/net/phy/mdio_bus.c and the yaml description says
> that it only supports one bus level PHY GPIO reset via reset-gpios
> property.

I suppose it's this binding:
Documentation/devicetree/bindings/net/ethernet-phy.yaml

> On the imx6ul-evk, there are two KSZ8081 PHYs in the same mdio bus, so
> this is how I described it in dts:
>
> https://pastebin.com/raw/xLjYUHdN
>
> but the 'reset-gpios' properties are not found in this case. I think
> we need to let drivers/net/phy/mdio_bus.c to search for 'reset-gpios'
> also inside the mdio children.

This driver gives me headache.

The bindings say that it should populate devices from the compatible
of the subnodes with names like "ethernet-phy-id0141.0e90"
and stuff like that.

Indeed, but I don't understand why the phy in this example does not
have a compatible string?

There is some hackery going on to probe the driver from the bus
level since
commit 46abc02175b3c246dd5141d878f565a8725060c9
"phylib: give mdio buses a device tree presence"

But as far as I read the code this driver should be probing
devices inidividually for ther reset-gpios, I think the problem is
maybe that no proper devices (mdiodev) are added for these
devices, does mdiobus_register_device() even get called
for them? Does of_mdiobus_register_phy() get called?
If this is the problem I think you need to add
compatible for your phy devices and make sure there is
some code to probe them as well?

of_mdiobus_register() must be called by the MDIO bus master/host
driver. This is what traverses the children with
for_each_available_child_of_node().
Does your host driver properly call this function?

Sorry if I sound a bit confused.

Yours,
Linus Walleij
