Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412D321DF48
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 20:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgGMSFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 14:05:23 -0400
Received: from muru.com ([72.249.23.125]:36694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729689AbgGMSFX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jul 2020 14:05:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 41B8D8106;
        Mon, 13 Jul 2020 18:05:20 +0000 (UTC)
Date:   Mon, 13 Jul 2020 11:05:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
Message-ID: <20200713180519.GN5849@atomide.com>
References: <20200625002736.GA24954@x1>
 <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
 <20200712215630.GA1298162@x1>
 <20200713150220.GJ5849@atomide.com>
 <20200713174747.GA1424108@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713174747.GA1424108@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200713 17:47]:
> Do you mean you would like to see the mapping added as a column in the pins file?
> 
> debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
> registered pins: 142
> pin 0 (PIN0) 44e10800 00000027 pinctrl-single
> pin 1 (PIN1) 44e10804 00000027 pinctrl-single
> pin 2 (PIN2) 44e10808 00000027 pinctrl-single
> pin 3 (PIN3) 44e1080c 00000027 pinctrl-single
> pin 4 (PIN4) 44e10810 00000027 pinctrl-single
> pin 5 (PIN5) 44e10814 00000027 pinctrl-single
> pin 6 (PIN6) 44e10818 00000027 pinctrl-single
> pin 7 (PIN7) 44e1081c 00000027 pinctrl-single
> pin 8 (PIN8) 44e10820 00000027 pinctrl-single
> 
> So that could be:
> 
> debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
> registered pins: 142
> pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
> pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
> pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
> pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
> pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
> pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
> pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
> pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
> pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22

Yes that would make the debugfs output more understandable and
easier to use.

> Should I try to add that in pcs_pin_dbg_show()?
> 
> It currently prints:
> 
>         seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
> 
> so I could change that to include the GPIO number if mapping exists.

Sounds good to me yeah :) However, the issue of relying on
debugfs for this still remains unsolved. But seems that
probably should be done with the existing GPIO related
API instead and a different issue from the pinctrl
changes.

Regards,

Tony
