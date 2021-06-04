Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D327239B8EB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 14:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFDMYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 08:24:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:36878 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhFDMYl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Jun 2021 08:24:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lp8qj-00060t-00; Fri, 04 Jun 2021 14:22:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4042BC1B8C; Fri,  4 Jun 2021 14:22:23 +0200 (CEST)
Date:   Fri, 4 Jun 2021 14:22:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
Message-ID: <20210604122223.GA8940@alpha.franken.de>
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514123309.134048-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 02:33:07PM +0200, Thomas Bogendoerfer wrote:
> IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> to 32 gpios. All gpios could be used as an interrupt source.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v5:
>  - use bgpio spinlock
>  - made interrupt controller optional
>  - made ngpios optional
> 
> Changes in v4:
>  - added spinlock to serialize access to irq registers
>  - reworked checking of irq sense bits
>  - start with handle_bad_irq and set handle_level_irq in idt_gpio_irq_set_type
>  - cleaned up #includes
>  - use platform_get_irq
> 
> Changes in v3:
>  - changed compatible string to idt,32434-gpio
>  - registers now start with gpio direction register and leaves
>    out alternate function register for pinmux/pinctrl driver
> 
> Changes in v2:
>  - made driver buildable as module
>  - use for_each_set_bit() in irq dispatch handler
>  - use gpiochip_get_data instead of own container_of helper
>  - use module_platform_driver() instead of arch_initcall
>  - don't default y for Mikrotik RB532
> 
>  drivers/gpio/Kconfig         |  12 ++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-idt3243x.c | 206 +++++++++++++++++++++++++++++++++++
>  3 files changed, 219 insertions(+)
>  create mode 100644 drivers/gpio/gpio-idt3243x.c
> [...]

is there anything a still need to do to get this integrated for v5.14 ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
