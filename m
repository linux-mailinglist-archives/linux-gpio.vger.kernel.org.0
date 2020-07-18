Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADD7224D51
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 19:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgGRRYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 13:24:46 -0400
Received: from muru.com ([72.249.23.125]:37436 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbgGRRYq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 13:24:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 403A180AF;
        Sat, 18 Jul 2020 17:24:43 +0000 (UTC)
Date:   Sat, 18 Jul 2020 10:24:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] pinctrl: core: print gpio in pins debugfs file
Message-ID: <20200718172446.GC10993@atomide.com>
References: <20200718154908.1816031-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718154908.1816031-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200718 15:53]:
> If there is a gpio range mapping for the pin, then print out the gpio
> number for the pin in the debugfs 'pins' file.
> 
> Here is an example output on the BeagleBone Black from:
> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
> 
> pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
> pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
> pin 105 (PIN105) GPIO-115 44e109a4 00000027 pinctrl-single
> pin 106 (PIN106) GPIO-116 44e109a8 00000027 pinctrl-single
> pin 107 (PIN107) GPIO-117 44e109ac 00000027 pinctrl-single
> pin 108 (PIN108) GPIO-19 44e109b0 00000027 pinctrl-single
> pin 109 (PIN109) GPIO-20 44e109b4 00000027 pinctrl-single
> pin 110 (PIN110) 44e109b8 00000030 pinctrl-single
> pin 111 (PIN111) 44e109bc 00000028 pinctrl-single
> pin 112 (PIN112) 44e109c0 00000030 pinctrl-single
> pin 113 (PIN113) 44e109c4 00000028 pinctrl-single
> pin 114 (PIN114) 44e109c8 00000028 pinctrl-single

This looks nice to me, maybe just show NA if no GPIO name is
available?

This is debugfs so the output format can change at any point
AFAIK.

Regards,

Tony
