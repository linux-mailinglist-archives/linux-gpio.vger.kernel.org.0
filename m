Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1BC45874A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 00:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhKVADA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 19:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhKVADA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 19:03:00 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A8FC061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:59:54 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bk14so34385024oib.7
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pyQ3tWC6YW67Z5HxDZuV/h0kQC89KuDjpnW/Po+26NY=;
        b=Opde6HITaluhndJaX5NK+LSNFelBHZqjGTzvWGOdyQ07fQdYHpH1w+D8Z2nTbN9rg1
         6ZjdJ5ovg6f0dZB7qtD5PvIIt5V5sZbTUoEkmvaExLhzNu4qriEAd41jenew3tmbicHd
         9tamJt+7aUpBzvFo5c9EzRT+mN0H4BaPfi2lKPgIiIGzoRSCuRh+Sfenf1MjmCCBxISP
         6yEHdlpkuWoXr/Hj6DyUUd3YW9nfVF3ftexEiP4ox9eQCRh/DtUBbZGbeoE2exjdlJH/
         TWhLIutuN1LtE50FOxhJp78xBK4wFBNVAsecNajdDtXmA/Jpt0e2w3BwZMl3V1a+Q6jF
         KWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pyQ3tWC6YW67Z5HxDZuV/h0kQC89KuDjpnW/Po+26NY=;
        b=xiNwq8t2qG3/xplJ6U6iUL6m9ahmScZeYoC8XwI2lQHa0+t1cHECT9BvAsRDZe34CR
         Ub10K2HWUHiAkUtNmnwoAs+4w7jmICCcrp+yhxLU7KpdXQF5aafXd1qjDd/2NGrI2Seq
         vAkGJ95aVJcHcNm4IxLRSbBmcLUA1YZSSH+NFsa1euSv9TFP7B8cQTBWu2iyodI+9Na2
         0nB07DnP5V13J/9CCJRyWpcmlwXNerMSVikO9UVBAT+GsS+MBVp6C0lPJ1j62shgTpXB
         ESdyHlLmiVBANh2h5wSPozCRJzsXxz9yyfe0SXAXm0GCQMUFiBP5s4091waZ/NKmSk4d
         Hz0g==
X-Gm-Message-State: AOAM530tr9nNnB2g3Zd9QUCYmPWCLpjdocqrlNKUUf1+6YhCFmuJWWUQ
        8PfcBl1IFLpAfDOANX/TXYohmKVPiNoL2Kwq+fWrEw==
X-Google-Smtp-Source: ABdhPJyvy8x2R4z62YjG8hVeSZVToJyPVfTZ27aSNlB3MmSpBEXOFHRZzclyuQBqgUeI4dzZjxtJ4qv7JkK4luEj3E0=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr17394320oih.162.1637539194181;
 Sun, 21 Nov 2021 15:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20211116062328.1949151-1-colin.foster@in-advantage.com>
 <CACRpkdaFmFFpYrreFsD6XRPAoivDPK1nSfAVKacNG8bWUR7rHQ@mail.gmail.com> <20211119021437.GA1155@DESKTOP-LAINLKC.localdomain>
In-Reply-To: <20211119021437.GA1155@DESKTOP-LAINLKC.localdomain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:59:42 +0100
Message-ID: <CACRpkdYpy0x0Eek2ir3Dc8-DF7LteESKuo9etWZzdUdDdbxLnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 net-next 00/23] add support for VSC75XX control
 over SPI
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 19, 2021 at 3:14 AM Colin Foster
<colin.foster@in-advantage.com> wrote:
> On Fri, Nov 19, 2021 at 02:58:47AM +0100, Linus Walleij wrote:

> > >   pinctrl: ocelot: combine get resource and ioremap into single call
> > >   pinctrl: ocelot: update pinctrl to automatic base address
> > >   pinctrl: ocelot: convert pinctrl to regmap
> > >   pinctrl: ocelot: expose ocelot_pinctrl_core_probe interface
> > >   pinctrl: microchip-sgpio: update to support regmap
> > >   device property: add helper function fwnode_get_child_node_count
> > >   pinctrl: microchip-sgpio: change device tree matches to use nodes
> > >     instead of device
> > >   pinctrl: microchip-sgpio: expose microchip_sgpio_core_probe interfa=
ce
> >
> > Can these patches be broken out to its own series and handled
> > separately from the DSA stuff or is there build-time dependencies?
>
> These should all be able to be a separate series if I did my job right.
> Everything should have no functional change except for this:
>
> > >   pinctrl: ocelot: update pinctrl to automatic base address
>
> Fortunately this was tested by Cl=C3=A9ment and didn't seem to have any
> ill-fated side effects.
>
> I assume this isn't something I wouldn't want to submit to net-next...
> is there a different place (tree? board? list?) where those should be
> submitted?

To the pinctrl maintainer i.e. me + linux-gpio@vger.kernel.org
then I can just apply them if there are no more review comments.

Yours,
Linus Walleij
