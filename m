Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3F938E598
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 13:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhEXLnJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 07:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbhEXLnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 07:43:08 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAB8C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 04:41:40 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 1E10A202EE0;
        Mon, 24 May 2021 13:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621856498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kkYvlvl+TzbsvnlWGdyJtSlIh102hU4alkeL/+S1xBk=;
        b=S0Y9tIYdHzjLCIEHqKSIqvdXNBYN9x2q6Tk+1HwYMYsBNNLIABN3q9zMvISPNAPJLKYv5f
        VxWSO6ofTbmX+M82jzJVKn/UK+iEZH8jiZIGz7vMcQ6lFJGL/c1BXd64HGyMpkQcdEHtSq
        9ykFjs2trdxTM/XwP5xVOs0W098XFz5I3gBU24C+r/3GLk8rDy862e3chfy4HNgB0/JVn4
        rMuV26zbi9+rElZLXkbWCUawyH7bEYa4Tlr2PCC276C0at0TPJpO3gNTI/ptG0CpoTUbQf
        zfgEbHBM3EaUpqhGit8BEXylJGfSELAsf/kSR6OzoLf++BmqAKQS2cVFrEmuIg==
Message-ID: <6d5b7b678d68f04e16d3fdc92e2de860135300fc.camel@svanheule.net>
Subject: Re: [PATCH v3 4/6] mfd: Add RTL8231 core device
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
Date:   Mon, 24 May 2021 13:41:36 +0200
In-Reply-To: <CAHp75VfVNJSuiErRYNLvUrCytWXwzos5Uj87Hj+bSBee7p2YfQ@mail.gmail.com>
References: <cover.1621809029.git.sander@svanheule.net>
         <6d14b72bc545a818675d99c8e91e99c96cc3e286.1621809029.git.sander@svanheule.net>
         <CAHp75VcbRKGYSJZK_Rg969-Uck=h+8byWt0B3MtQJDqwbdf2sw@mail.gmail.com>
         <cb8593ab7a70528528bae3de45e33fae68a9ec1c.camel@svanheule.net>
         <CAHp75VfVNJSuiErRYNLvUrCytWXwzos5Uj87Hj+bSBee7p2YfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 13:18 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 11:23 AM Sander Vanheule <sander@svanheule.net> wrote:
> > On Mon, 2021-05-24 at 11:02 +0300, Andy Shevchenko wrote:
> > > On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net>
> > > wrote:
> 
> ...
> 
> > > > +       usleep_range(1000, 10000);
> > > 
> > > It's strange to see this big range of minimum and maximum sleep.
> > > Usually the ratio should not be bigger than ~3-4 between the values.
> > 
> > I could also change this from a usleep to a polling loop that checks (with a
> > loop limit) if the reset bit has self-cleared already.
> > 
> > The datasheet that I have doesn't mention how fast it should self-clear. So
> > I
> > checked, and it appears to be done after one loop iteration already. So,
> > certainly faster than the current usleep.
> > 
> > Would a polling loop (with maybe like max. 10 iterations) be a good
> > alternative
> > for you?
> 
> I guess it's the right way to go. Just check the iopoll.h for helpers.
> Also regmap has regmap_read_poll_timeout().

Thanks for the pointers. Replaced the usleep by regmap_read_poll_timeout.


Best,
Sander

