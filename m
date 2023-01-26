Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A094067C90E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 11:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236302AbjAZKuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 05:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236383AbjAZKuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 05:50:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A77762798
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 02:49:31 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKzou-0002UH-7o; Thu, 26 Jan 2023 11:49:28 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKzot-0005cb-S0; Thu, 26 Jan 2023 11:49:27 +0100
Date:   Thu, 26 Jan 2023 11:49:27 +0100
From:   Sascha Hauer <sha@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230126104927.GE23347@pengutronix.de>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 10:35:22AM +0100, Linus Walleij wrote:
> On Wed, Jan 25, 2023 at 10:35 AM Sascha Hauer <sha@pengutronix.de> wrote:
> 
> > You are trying to remove the GPIO sysfs API for many years now without
> > success so far, and I doubt that you will succeed in future because the
> > Kernel comes with the promise that userspace won't be broke.
> 
> I see it more as permanent deprecation and nudging than removal as of now.

I am fine with permanent nudging. The sysfs API is deprecated and it's
ok to remind people that there's a new API they should use instead, but
as said, please don't actively break this API. Well to be correct,
adding this warning is not breaking the API by itself, instead it
motivates other people to do so, so you're getting there even without
making your own hands dirty ;)

> 
> For some reason people perceive all nudging as militant and as a
> my-way-or-the-highway style of communication but it's not really intended.
> OK maybe I am softer now than in the past, one grow humbler with
> old age.
> 
> It will become more interesting once we removed all in-kernel users of
> the global numberspace, which is well underway. At that point we can
> move the management of the global numberspace into the sysfs code
> and distros etc that don't want to use it can compile it out completely.

Perfectly fine with me. As I said: Push the sysfs API into a corner
where it hurts nobody let it stay there.

> 
> But the idea was never to slam people to not use something they use and like,
> it was to offer something new because they want it and like it more.
> 
> So using the character device with libgpiod users can:
> 
> - Get and set multiple lines at the same time
> - Do biasing (if supported by HW) pull up/down
> - Do drive strength (if supported by HW)
> - Properly listen to IRQ-driven events on lines with real-time timestamps
>   to ensure strict event order
> - Use HTE timestamps (new feature!)
> - libgpiod for the above with C, C++, Python and Rust bindings
> 
> By offering those new tasty features only for the character device and not
> for the sysfs ABI, at least the advanced users are expected to switch over
> to using the character device.

Ack, perfectly fine with me. Providing new features only for the new API
is a good way of gently pushing people towards the new API.

What's missing is a way to let a GPIO stay in the current state when I
release a GPIO chip. Unlike the new features you listed above this is a
feature that the sysfs API offers and that's important for us.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
