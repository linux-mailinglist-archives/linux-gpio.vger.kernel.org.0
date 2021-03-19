Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592BF341E10
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 14:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCSNXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 09:23:40 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37120 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhCSNXd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 09:23:33 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lNF69-00BtB8-BQ; Fri, 19 Mar 2021 14:23:29 +0100
Date:   Fri, 19 Mar 2021 14:23:29 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        David Thompson <davthompson@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: Support interrupts in gpio-mlxbf2.c
Message-ID: <YFSl0Vrh04etK28J@lunn.ch>
References: <1614120685-7452-1-git-send-email-Asmaa@mellanox.com>
 <1614120685-7452-2-git-send-email-Asmaa@mellanox.com>
 <CH2PR12MB38958655696585998CFDF67BD7919@CH2PR12MB3895.namprd12.prod.outlook.com>
 <CH2PR12MB3895A0BC2910997D8B64896BD7689@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR12MB3895A0BC2910997D8B64896BD7689@CH2PR12MB3895.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> We cannot really pass it through the ACPI table because the ACPI
> table is common to all BlueField-2 boards.  And each board may have
> a different GPIO pin associated with a particular function. This is
> why we use ACPI properties instead of GpioInt(). So that the
> bootloader can change the GPIO pin value based on the board id
> detected at boot time.

That sounds very broken.

ACPI describes the hardware. If the hardware is different, you need
different ACPI. And i assume the ACPI spec says GpioInt() is the
correct way to do this, and does not say you can hack around
limitations of your bootloader using properties?

	    Andrew
