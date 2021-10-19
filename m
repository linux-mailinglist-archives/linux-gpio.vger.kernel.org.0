Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488BF432BA9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 04:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJSCHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 22:07:51 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45648 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJSCHv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 22:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=Nd+6samNzQY+DVw53kP6OH3tIFdDWZQMzF2DxiLi2NE=; b=vAQ7YlBtr+peudAqEn0PEHBH2w
        zBBoZOFoTQo71V5C5xAnphQVrQEl8UovCvfRncG9Q0rSYedebU/p7EFbiA3Ve7zp58YpgnDSRGOK6
        pVfeBaliMVbK/ZpsCQHeDQ7GR+vLViGleNLJQGAIPV5nKOTFGzAjzXwighM4t+v+QzVY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1mceVS-00B1pE-KX; Tue, 19 Oct 2021 04:05:34 +0200
Date:   Tue, 19 Oct 2021 04:05:34 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <YW4n7hUIEB320dFv@lunn.ch>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr>
 <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org>
 <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > > > +  GPIO controller module provides GPIO-s for the SFP slots.
> > > > +  It is split into 3 controllers, one output only for the SFP TX disable
> > > > +  pins, one input only for the SFP present pins and one input only for
> > > > +  the SFP LOS pins.

Late to the conversation, so i might be asking questions already
asked...

So the PLD has restrictions? You have a collection of GPOs and a
collection of GPIs? You don't have an GPIOs?

> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - delta,tn48m-gpio-sfp-tx-disable
> > > > +      - delta,tn48m-gpio-sfp-present
> > > > +      - delta,tn48m-gpio-sfp-los

Do these names have any real significant? Are you really forced to
connect the SFP cage in this dedicated manor? Is there any reason why
i cannot use a GPO to control an LED? A GPI for a button?

	Andrew
