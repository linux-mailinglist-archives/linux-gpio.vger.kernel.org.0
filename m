Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F502E8839
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Jan 2021 19:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbhABSZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Jan 2021 13:25:05 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:46404 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbhABSZE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 2 Jan 2021 13:25:04 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kvlZL-00Fdur-HB; Sat, 02 Jan 2021 19:24:03 +0100
Date:   Sat, 2 Jan 2021 19:24:03 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Adam Lackorzynski <adam@l4re.org>
Cc:     maz@kernel.org, tglx@linutronix.de,
        linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com
Subject: Re: [PATCH 2/6] irqchip/armada-370-xp: Fix return check in IPI alloc
Message-ID: <X/C6Qw4Smal6X+I2@lunn.ch>
References: <20210102175859.335447-1-adam@l4re.org>
 <20210102175859.335447-2-adam@l4re.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210102175859.335447-2-adam@l4re.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 02, 2021 at 06:58:55PM +0100, Adam Lackorzynski wrote:
> __irq_domain_alloc_irqs returns a negative error
> code upon failure, not only 0. Also use irq_domain_alloc_irqs
> to require less default arguments.
> 
> Signed-off-by: Adam Lackorzynski <adam@l4re.org>

Fixes: f02147dd02eb ("irqchip/armada-370-xp: Configure IPIs as standard interrupts")

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
