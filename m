Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C454B854E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Feb 2022 11:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiBPKOn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Feb 2022 05:14:43 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiBPKOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Feb 2022 05:14:42 -0500
X-Greylist: delayed 509 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Feb 2022 02:14:30 PST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5EB2ABD2C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 02:14:30 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 48FF030001184;
        Wed, 16 Feb 2022 11:05:53 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 374FB2ECFF4; Wed, 16 Feb 2022 11:05:53 +0100 (CET)
Date:   Wed, 16 Feb 2022 11:05:53 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: bcm2835: Use bcm2835 gpio_chip label for bcm2711
Message-ID: <20220216100553.GA4315@wunner.de>
References: <c399da9deab3ede9b0c4d4680d8ac508707aa8c3.1644903104.git.lukas@wunner.de>
 <c1e31ad4-3a65-9370-3a5c-ffde723a04aa@i2se.com>
 <20220215144409.GA12830@wunner.de>
 <09a5a501-40d7-4dae-56c9-a3796fc95c4b@i2se.com>
 <2a5aad11-0ac6-943f-158a-585648b396be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5aad11-0ac6-943f-158a-585648b396be@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 09:17:49AM -0800, Florian Fainelli wrote:
> >>> Am 15.02.22 um 06:52 schrieb Lukas Wunner:
> >>>> Commit b1d84a3d0a26 ("pinctrl: bcm2835: Add support for all GPIOs on
> >>>> BCM2711") used a different label for the bcm2711 gpio_chip vis-à-vis
> >>>> the bcm2835.
[...]
> I agree with Stefan here, besides changing the driver name now would
> mean potentially breaking user-space since the driver name is visible in
> a variety of places. Seems to me like this is too late, we should have
> caught this during the introduction of 2711.

This isn't about the driver name but the gpio_chip label.

The .name attribute of bcm2711_pinctrl_desc and bcm2711_pinctrl_gpio_range
is only visible in debugfs, which doesn't count as user-space ABI.

The .label attribute of bcm2711_gpio_chip is indeed visible in sysfs
and could in theory be used by udev rules, though I doubt it.

It definitely was a mistake not to use the same label as pinctrl-bcm2835.
Using a different label hinges on the notion that it's a different chip,
and while that may apply for the 4B+ and CM4, the assumption falls apart
with the CM4S which seeks to be a drop-in replacement for CM1/CM3,
but really is not because of mistakes like this one.  We're likely
not the only ones bitten by this, just the first to report.

Thanks,

Lukas
