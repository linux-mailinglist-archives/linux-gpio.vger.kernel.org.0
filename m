Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4E214B2A9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 11:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgA1Kep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 05:34:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:45116 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgA1Kep (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 05:34:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 51BA8ACA3;
        Tue, 28 Jan 2020 10:34:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
Date:   Tue, 28 Jan 2020 11:17:17 +0100
Cc:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <devicetree@vger.kernel.org>,
        "Stefan Wahren" <stefan.wahren@i2se.com>
Subject: Re: [RFC PATCH 0/4] pinctrl: bcm2835: Add support for all BCM2711
 GPIOs
From:   "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>
To:     "Stefan Wahren" <stefan.wahren@i2se.com>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Ray Jui" <rjui@broadcom.com>,
        "Scott Branden" <sbranden@broadcom.com>
Message-Id: <C07CI3G3XJXI.3C8TI4AHX37K2@linux-9qgx>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Jan 27, 2020 at 7:15 PM, Stefan Wahren wrote:
> The BCM2711 supports 58 GPIOs [1] by using the existing BCM2835 GPIO
> registers
> completely. So there is no need to change the binding.
>
> Patch 1 and 2 prepare the pinctrl driver to be extended to 58 GPIOs in
> Patch 3.
> I didn't want to squash them in order to make review as easy as
> possible.
> The final patch 4 assigns all SoC GPIOs a label as we already did for
> the older Raspberry Pi boards.
>
> [1] -
> https://github.com/raspberrypi/linux/issues/3101#issuecomment-573092294
>
> Stefan Wahren (4):
> pinctrl: bcm2835: Drop unused define
> pinctrl: bcm2835: Refactor platform data
> pinctrl: bcm2835: Add support for all GPIOs on BCM2711
> ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
>
> arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 74 ++++++++++++++++++++++++
> drivers/pinctrl/bcm/pinctrl-bcm2835.c | 106
> ++++++++++++++++++++++++++--------
> 2 files changed, 156 insertions(+), 24 deletions(-)

Apart from the review, I gave it a test on an RPi4 and RPi3b, looks good to=
 me.
