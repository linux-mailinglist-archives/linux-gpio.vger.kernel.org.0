Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1144B6F57
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 15:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbiBOOqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 09:46:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239175AbiBOOpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 09:45:52 -0500
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC0311628F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 06:44:11 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 4D44E100D5867;
        Tue, 15 Feb 2022 15:44:09 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 288D42EDABB; Tue, 15 Feb 2022 15:44:09 +0100 (CET)
Date:   Tue, 15 Feb 2022 15:44:09 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: bcm2835: Use bcm2835 gpio_chip label for bcm2711
Message-ID: <20220215144409.GA12830@wunner.de>
References: <c399da9deab3ede9b0c4d4680d8ac508707aa8c3.1644903104.git.lukas@wunner.de>
 <c1e31ad4-3a65-9370-3a5c-ffde723a04aa@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1e31ad4-3a65-9370-3a5c-ffde723a04aa@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 01:00:47PM +0100, Stefan Wahren wrote:
> Am 15.02.22 um 06:52 schrieb Lukas Wunner:
> > Commit b1d84a3d0a26 ("pinctrl: bcm2835: Add support for all GPIOs on
> > BCM2711") used a different label for the bcm2711 gpio_chip vis-à-vis
> > the bcm2835.
> >
> > That breaks compatibility for GPIO_LOOKUP_IDX() and GPIO_HOG() clauses
> > when porting from older Raspberry Pi Compute Modules to the CM4 or CM4S.
> 
> could you explain the breakage more in detail, is it kernel or user space?

This kernel module (which is sought to be upstreamed mid-term)
requests GPIOs at runtime for a chardev:

https://github.com/RevolutionPi/piControl/blob/master/revpi_core.c#L50

That fails on BCM2711 because a different label name was used,
even though the pin-controller is otherwise compatible to BCM2835.


> A little bit off topic, but what is this CM4S? Is it special version of
> the CM4? Can you provide a link or something?

BCM2711 in a CM1/CM3-compatible form factor.  There is no public
documentation at this point besides the device-tree overlay and
what's being discussed in the forums and on GitHub:

https://github.com/raspberrypi/linux/blob/rpi-5.15.y/arch/arm/boot/dts/bcm2711-rpi-cm4s.dts
https://forums.raspberrypi.com/viewtopic.php?t=325975
https://github.com/search?q=cm4s&type=commits


> > The name change seems unwarranted given it's essentially the same
> > hardware, so use the old name instead.
> 
> I disagree at this point. The pinctrl of bcm2835 and bcm2711 are
> different. For example the bcm2835 has only 54 GPIOs while the bcm2711
> has 58.

Four additional GPIOs don't justify a different label name given the
pin-controller otherwise behaves the same.  We also had minimal
differences in pin assignment on BCM2835/6/7 and that didn't
justify a different label name either.

Thanks,

Lukas
