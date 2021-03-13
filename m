Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086B2339D49
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Mar 2021 10:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhCMJ24 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Mar 2021 04:28:56 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49245 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbhCMJ2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Mar 2021 04:28:45 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3D80460004;
        Sat, 13 Mar 2021 09:28:42 +0000 (UTC)
Date:   Sat, 13 Mar 2021 10:28:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v9 2/4] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <YEyFyQ0TF5u/WS9X@piout.net>
References: <20210302053059.1049035-1-drew@beagleboard.org>
 <20210302053059.1049035-3-drew@beagleboard.org>
 <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349b09f8-fe99-d0d4-dd11-c288bf66cb4d@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/03/2021 14:57:54+0100, Enrico Weigelt, metux IT consult wrote:
> On 02.03.21 06:30, Drew Fustini wrote:
> 
> Hi folks,
> 
> > Add "pinmux-select" to debugfs which will activate a pin function for a
> > given pin group:
> > 
> >    echo "<group-name function-name>" > pinmux-select
> > 
> > The write operation pinmux_select() handles this by checking that the
> > names map to valid selectors and then calling ops->set_mux().
> 
> I've already been playing with similar idea, but for external muxes.
> For example, some boards have multiple SIM slots that can be switched
> via some gpio pin.
> 
> Not sure whether traditional pinmux would be a good match for that.
> 

If you want to be able to use both, then I guess gpio-mux is what you
are looking for. Obviously, it will also require support in the bus
core. On what bus are those SIMs? (I guess the answer will be UART and
then unfortunately UARTs are not represented as busses).


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
