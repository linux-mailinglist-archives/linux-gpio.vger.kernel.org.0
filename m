Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D43438E225
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 10:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhEXIGL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 04:06:11 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:55014 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbhEXIGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 04:06:10 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 651FE202DD8;
        Mon, 24 May 2021 10:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621843481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zthMGLj/pXuuAmBpsAdfxQUAV3dXK2ma/p3BTdy4UJg=;
        b=bBcAlQuyE7iw1bo+QlZo3ZV3bCvFu3AVrng3162CplZWCVGYLuNh1JADIc2GmaAx5ltoeX
        4EDHPkGtmKU3+8XnMuAbDEQcbjxQxlY2zq7J1VHwboyQ7dR29dl8MIawRdp/h85b5fyova
        rrlB+ueubYG4MlJeIxljY2aLI48vNaZrn2v6xf1i9SNZR2b8V4UuvJnQPjtq2E1k9juwu8
        3banQ6ynbGfyrpY3V3hpr3vjQRDzoQAEF2eKZPp63x6cHzn92atuZQdxd1Kq8mHj3LgC5E
        GdXwm54pARzq+P5enTivPcVl96CZItNtLqkp2uIeEevqnkSOspPDPSP5Och8lw==
Message-ID: <9bb05a58e24b6b200dfb31c264fcaa93b8a023c9.camel@svanheule.net>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Date:   Mon, 24 May 2021 10:04:38 +0200
In-Reply-To: <CAHp75VeVq31q6U+fXGi=ME0Bx5D7V+KiE70JZB4MLy+SbEJP4A@mail.gmail.com>
References: <cover.1621279162.git.sander@svanheule.net>
         <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
         <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
         <33eb043f2ef9d81bbe26876a1c73859f56a8abd9.camel@svanheule.net>
         <CAHp75VeVq31q6U+fXGi=ME0Bx5D7V+KiE70JZB4MLy+SbEJP4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 10:55 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 10:50 AM Sander Vanheule <sander@svanheule.net> wrote:
> > On Tue, 2021-05-18 at 00:18 +0300, Andy Shevchenko wrote:
> > > On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net>
> > > wrote:
> > > > +       err = regmap_read(map, RTL8231_REG_FUNC1, &v);
> > > 
> > > > +       ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, v);
> > > 
> > > If we got an error why we need a read_core, what for?
> > 
> > The chip has a static 5-bit field in register 0x01, called READY_CODE
> > according
> > to the datasheet. If a device is present, and a read from register 0x01
> > succeeds, I still check that this field has the correct value. For the
> > RTL8231,
> > it should return 0x37. If this isn't the case, I assume this isn't an
> > RTL8231,
> > so the driver probe stops and returns an error value.
> 
> Right. And why do you get ready_code if you know that there is an error?

This has changed in v3. I now check if there was an error reading the register,
and return if there was. Only if there wasn't an error, the code continues to
extract and verify the READY_CODE value.

Best,
Sander

