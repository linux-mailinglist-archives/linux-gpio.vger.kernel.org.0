Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CDE2ED29A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 15:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbhAGOek (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 09:34:40 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:55154 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728892AbhAGOej (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 09:34:39 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kxWMN-00GgXO-T7; Thu, 07 Jan 2021 15:33:55 +0100
Date:   Thu, 7 Jan 2021 15:33:55 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sandor Yu <sandor.yu@nxp.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
Message-ID: <X/cb0xhqTHV3eBdA@lunn.ch>
References: <20201230214918.17133-1-festevam@gmail.com>
 <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
 <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
 <CACRpkdYtjXMOv+G3_hXAiS4J51FKC4kcuDCmqr_kivuh61udPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYtjXMOv+G3_hXAiS4J51FKC4kcuDCmqr_kivuh61udPw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Indeed, but I don't understand why the phy in this example does not
> have a compatible string?

Normally, PHYs can be enumerated on the bus, in the same way USB and
PCI devices can be enumerated. The device itself then tells you what
it is campatible with, in the same way PCI and USB does. Having a
compatible string is then detrimental, because people get it wrong,
device tree says one thing, the device itself says something else,
which do we trust? There are also boards where different series of
have populated with different pin compatible PHYs. Enumeration just
works, having a compatible would be a problem.

But, there are some PHYs which you cannot enumerate, e.g they do not
respond to MDIO while held in reset, or the silicon is buggy and has
an invalid ID. In those cases, a compatible should be listed with the
correct PHY ID.

	Andrew
