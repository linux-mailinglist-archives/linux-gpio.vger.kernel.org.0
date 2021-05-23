Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43A938DD5C
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 23:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhEWVzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 17:55:14 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:43828 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhEWVzO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 17:55:14 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa] (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id B6A8F202A1F;
        Sun, 23 May 2021 23:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621806826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AzkPCPPIfezZcMXv2js+rl++GjaFc8NgXFsjTnm8VTA=;
        b=mZeBKFhqmJZoVfMAgnEBs6c2YLepERqP9xIjLQiyOaCWUJBZIVxsN1mO82b7C86Hy4nFUK
        ePcJ2mHpElMwLpygmkvDTfhm1d7VoGkaV8p/FbK+nZgNzQKigTngVQJ6RTwe7i4tGzObmf
        5P84JZF3EgJQ1AyHBu/w+7Gllc6pfpJdjCux1w8I0wtxtybK/jYua0fW4BXfdMXu068QG3
        i6dVyGErwaiMi73pOJinLI5fAQW7ohbSO11tPZC3gWY3Sg10Xm5qJiNsCTf6AhQkFkb1rR
        jqi4sW5xrL40mCo6RrOwpFe9V/r2KQkqeXrujbNN6VpSIrE7qvcMyOVGgOE7iA==
Message-ID: <11ad7f0b218ec665d956ebd66b2e0fc78b37b1f9.camel@svanheule.net>
Subject: Re: [PATCH v2 7/7] leds: Add support for RTL8231 LED scan matrix
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sun, 23 May 2021 23:53:44 +0200
In-Reply-To: <CAHp75VdRZQXt25mNA+6fY3_iNV4JOE9h+QoFzbtb1_nAdWYFLA@mail.gmail.com>
References: <cover.1621279162.git.sander@svanheule.net>
         <752444cff2a7ec5da38dba368c64a5ed7dd87279.1621279162.git.sander@svanheule.net>
         <CAHp75VdRZQXt25mNA+6fY3_iNV4JOE9h+QoFzbtb1_nAdWYFLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Also here I've tried to address your remarks for v3, some extra details below.

On Tue, 2021-05-18 at 01:00 +0300, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> > +static unsigned int rtl8231_led_current_interval(struct rtl8231_led *pled)
> > +{
> > +       unsigned int mode;
> 
> > +       unsigned int i = 0;
> 
> This...
> 
> > +       if (regmap_field_read(pled->reg_field, &mode))
> > +               return 0;
> > +
> > +       while (i < pled->modes->num_toggle_rates && mode != pled->modes-
> > >toggle_rates[i].mode)
> > +               i++;
> 
> ...and this will be better as a for-loop.
> 
> > +       if (i < pled->modes->num_toggle_rates)
> > +               return pled->modes->toggle_rates[i].interval;
> 
> > +       else
> 
> Redundant.
> 
> > +               return 0;
> > +}

Shrunk down to "for (...) if (...) return ...;" in v3.


> 
> > +               interval = 500;
> 
> interval_ms

Good suggestion, thanks. Don't need those comments in the code then.


> 
> > +       u32 addr[2];
> > +       int err;
> > +
> 
> > +       if (!fwnode_property_count_u32(fwnode, "reg"))
> 
> err = fwnode_property_count_u32(...);
> if (err < 0)
>   return err;
> if (err == 0)
>   return -ENODEV;
> 
> > +               return -ENODEV;
> > +
> > +       err = fwnode_property_read_u32_array(fwnode, "reg", addr,
> > ARRAY_SIZE(addr));
> 
> If count returns 1? What's the point of counting if you always want two?

If count returns 1, or more than 2, that's an error. But this check was missing
in v2, so I added it in v3.


> 
> > +       if (!device_property_match_string(dev, "realtek,led-scan-mode",
> > "single-color")) {
> 
> It seems that device_property_match_string() and accompanying
> functions have wrong description of returned codes, i.e. it returns
> the index of the matched string. It's possible that some APIs are
> broken (but I believe that the former is the case).
> 
> That said, I think the proper comparison should be >= 0.

Thanks, fixed.


Best,
Sander

