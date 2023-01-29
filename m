Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35A96800CF
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Jan 2023 19:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjA2Sdt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Jan 2023 13:33:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjA2Sdt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Jan 2023 13:33:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A7A196AC
        for <linux-gpio@vger.kernel.org>; Sun, 29 Jan 2023 10:33:46 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1pMCUn-0003vR-G8; Sun, 29 Jan 2023 19:33:41 +0100
Received: from rsc by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1pMCUl-00004y-5A; Sun, 29 Jan 2023 19:33:39 +0100
Date:   Sun, 29 Jan 2023 19:33:39 +0100
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230129183339.GY24167@pengutronix.de>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126104927.GE23347@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 11:49:27AM +0100, Sascha Hauer wrote:
> What's missing is a way to let a GPIO stay in the current state when I
> release a GPIO chip. Unlike the new features you listed above this is a
> feature that the sysfs API offers and that's important for us.

An example where it is used is labgrid: our test automation controller
(LXA-TAC) doesn't run any software for controlling power of the device-
under-test; to switch on a DuT, labgrid does

  ssh tac echo 1 > /sys/some/path/to/gpio

While this could also be done with a daemon offering a dbus api, this
would be significantly more complex. In a critical environment, one
needs to make sure that the daemon process never fails, otherwhise the
power of the DuT would maybe be in a random state. Then of course one
can add a watchdog, but with the current sysfs interface it's really
simple. Of course that would also work if the new interface would offer
a "keep this line as it is" feature, but adding a dbus daemon just for
keeping the state of a pin sounds overcomplex when the kernel could also
provide that functionality.

Another example that came up on friday when we talked about this is a
motor for an airplane: It doesn't have only one "safe state" it could
fall back to if something fails (i.e. daemon disappears). The safe state
on power-on (with uninitialized external hardware) might be different
from the one on the ground (motor-off) or while being in the air
(motor-on). Of course one would probably not build an airplane without
further safety mechanics, but we have several less-desasterous-but-
still-very-expensive-in-the-case-of-failure use cases in the field, like
multi hundret kilowatt motors in agricultural or heavy construction
machine equipment being switched on/off by a GPIO that cause significant
loss of material / work on failure.

I hope those examples help a bit to understand the issues. As Sascha
said: when the new interface provides the same features sysfs offers
today, without adding tons of new complexity, increasing the pressure on
people to move there is perfectly fine. 

rsc
-- 
Pengutronix e.K.                           | Dipl.-Ing. Robert Schwebel  |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
