Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AD56752B9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 11:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjATKqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 05:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjATKqy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 05:46:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352D268420
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 02:46:53 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pIov3-00005o-1a; Fri, 20 Jan 2023 11:46:49 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pIov2-0001LW-0m; Fri, 20 Jan 2023 11:46:48 +0100
Date:   Fri, 20 Jan 2023 11:46:47 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, shawnguo@kernel.org,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

I stumbled over the following warning while testing the new v6.2-rc4 on
a imx8mm-evk:

[    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.

The warning was introduced by commit [1] but at least the following
drivers are parsing the alias for a gpiochip to use it as base:
 - drivers/gpio/gpio-mxs.c
 - drivers/gpio/gpio-mxc.c
 - drivers/gpio/gpio-clps711x.c
 - drivers/gpio/gpio-mvebu.c
 - drivers/gpio/gpio-rockchip.c
 - drivers/gpio/gpio-vf610.c
 - drivers/gpio/gpio-zynq.c

According commit [2] it seems valid and correct to me to use the alias
and the user-space may rely on this.

Now my question is how we can get rid of the warning without breaking
the user-space?

[1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
[2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe

Regards,
  Marco
