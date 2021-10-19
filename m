Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5784333FF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 12:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbhJSK5O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 06:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhJSK5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 06:57:14 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99349C061745
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 03:55:01 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id s3so18029131ild.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NDB8D8TfZqCGnqAYnU/I/JJMv1zpQuUUkf40rgGSoU=;
        b=F1F8n9mmM/9jOrEH9G1XgISAoWRIwy5LUlITNwD9wlj0KsB2LHgLIw9u3IM+YXbvNQ
         DAeTBy3TjycsDJmKmC3pwY5+CdpI4WNmZzEs21ps4xC5n4VhRsd9XAaLmhs0LpE05VJu
         LIWVd+b0DAKqJcGCycoJtpskDh39lP+IpIc/zUS6aM715DWz/gXZ0o9x/V6pvTcVuHS5
         9dUWGNgk751wP66zPuaLN2+QFdqM/p25JMcmj1aHwro/ZFYTJxvNp3HnMy1chtqvpv9M
         j3wJT7d4slPzJmoV7oJIGCPTL67RotrCGsjcpkCsPIANej3ATKEhVNEUIqoEOQEOhyQF
         q+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NDB8D8TfZqCGnqAYnU/I/JJMv1zpQuUUkf40rgGSoU=;
        b=zQqKgzIYLtzL/tOJGpg1SqToE3qBgmbW5BaeIAQLVHAJ3FGSh+HBQuG5bAu2weVE4H
         hTYzLH6HnywIxCeFcFHUfssy2wNSahhshBXpw3oMlve6wRgHMWlPRc2yo4nWyXUYksjY
         Tn/V/YteM6fQxnTYmtI3dVCar8L/x0mZUdaW3bII4q84dHUfwuQkwxm0k4eRSuh93kXQ
         waiLztRw9eVn4n97L3qkEkDlt206pcBJGxlxBDxljIursR+rtc5QhYUk5cn6h6uxdCHe
         +d+Xg4WAhigsrl+jKPK9+oGT7k21hDbimDrnRZHqzcQOrauhuj8hChGLQ0QJgA5Kz8YW
         h5rg==
X-Gm-Message-State: AOAM5334VIhM39y3WeRkidE/UJ9IKSAgqIZC+FNPlEYXk1WJWRdkRWml
        M5Wl+/GHLthfAqWV+SUdNBlLMGbXT19QPbN3UFSpGQ==
X-Google-Smtp-Source: ABdhPJxIq6mlwrLoaIjqjqH/xMYSi81uzKoeL2stWejW1qsIN7OfNoqGcVTAxWskrY1fYHTeQaLnEkaAh7tYKxq4jHw=
X-Received: by 2002:a05:6e02:5c4:: with SMTP id l4mr1584439ils.56.1634640901047;
 Tue, 19 Oct 2021 03:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <YW4n7hUIEB320dFv@lunn.ch>
In-Reply-To: <YW4n7hUIEB320dFv@lunn.ch>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 19 Oct 2021 12:54:50 +0200
Message-ID: <CA+HBbNGQ9OCn9T-XW7MUL-H8LkL6Dcot1NExO+xv9gsuPxjLRw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        "Jonathan M. Polom" <jmp@epiphyte.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 4:05 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > > +  GPIO controller module provides GPIO-s for the SFP slots.
> > > > > +  It is split into 3 controllers, one output only for the SFP TX disable
> > > > > +  pins, one input only for the SFP present pins and one input only for
> > > > > +  the SFP LOS pins.
>
> Late to the conversation, so i might be asking questions already
> asked...
>
> So the PLD has restrictions? You have a collection of GPOs and a
> collection of GPIs? You don't have an GPIOs?

Yes, the CPLD is hardwired per board with the specific FW for it.
There are no true GPIO-s, only input or output pins depending on their
purpose in the SFP cage.
>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - delta,tn48m-gpio-sfp-tx-disable
> > > > > +      - delta,tn48m-gpio-sfp-present
> > > > > +      - delta,tn48m-gpio-sfp-los
>
> Do these names have any real significant? Are you really forced to
> connect the SFP cage in this dedicated manor? Is there any reason why
> i cannot use a GPO to control an LED? A GPI for a button?

Yes, there are connected like this on the TN48M switch, names directly
match their
purpose. The CPLD is customized per each switch model, so TN4810M which is the
48 x 10G SFP+ uses the same CPLD model but is wired differently and
with a different FW.
Since it's a CPLD you technically use whatever pin to connect stuff,
but it completely depends
on the FW implementation as there is no traditional GPIO block with
XYZ number of pins.
I have multiple vendors and models using the same CPLD but its wired
completely different
and the register layout is different.

So you cant force any of the input pins to output mode or change their
value at all, its all hardwired.

Regards,
Robert
>
>         Andrew



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
