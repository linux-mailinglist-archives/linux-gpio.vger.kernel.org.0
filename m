Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC66A3BA18B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 15:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhGBNsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 09:48:07 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37458 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232654AbhGBNsH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 09:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ALmwgqUw8xCCQst4oxbjM/eh7ulpVe3fZ6mcmGg55Uw=; b=bhn09CgsSPQf9ZVxXwDa9BXfQ5
        IRq5RNnWOXslOZtra05ujQBMe61psPP91RhrcmxTvlDqeie7TwwnxLOqr4zYx/BPDGpaOyP6EeE26
        fa0Ot0jXfJM8PKs2b/RJBVLg0v9EYwA7Kla2N50yL4gbKTkx2t7AXWdpFKVqmgN5RvAc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJU5-00BvIA-6i; Fri, 02 Jul 2021 15:45:33 +0200
Date:   Fri, 2 Jul 2021 15:45:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] gpio: tqmx86: really make IRQ optional
Message-ID: <YN8YfTHFDc1a9z0d@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <aee1d5a46b75fcaf4c231ddaf221f9ac2538440d.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee1d5a46b75fcaf4c231ddaf221f9ac2538440d.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:47PM +0200, Matthias Schiffer wrote:
> The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> causes warnings with newer kernels.
> 
> Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> missing IRQ properly.
> 
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

The system i was using this on made use of interrupts, so i never
tested with it missing.

It is a shame platform_get_irq_optional() does something different to
all the other _optional() calls :-(

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
