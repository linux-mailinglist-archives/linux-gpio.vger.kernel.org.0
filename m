Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6BD3BA1BE
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 15:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbhGBNz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 09:55:27 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37484 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232786AbhGBNz1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 09:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=mNyNvw8av9TSdQw6xty8iSp9mx3JvoRXFPvfkook/Ag=; b=p/PVYpcGbLgCM9zLEuzjzbGfCb
        tKQgeDDYQjURx3cnnU9AE9V7cHa4RAZCQg2wY2Ui1e4xIJ8NEOtApNMjgtGgtgZ5XDbhoR14Iu/4o
        pz0UeWn8jU7qM/NqZ9AKE4gDbjFE8/z52z1efD3fGNjrgFu07TkNB1sCXhu4OnUF5ZZ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJbA-00BvKr-42; Fri, 02 Jul 2021 15:52:52 +0200
Date:   Fri, 2 Jul 2021 15:52:52 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ
 is set
Message-ID: <YN8aNAgSg+3OdUPI@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <25ee92527847b2fa15e2c82ca486a92b4fd1d44e.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ee92527847b2fa15e2c82ca486a92b4fd1d44e.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:48PM +0200, Matthias Schiffer wrote:
> The driver was registering IRQ 0 when no IRQ was set. This leads to
> warnings with newer kernels.
> 
> Clear the resource flags, so no resource is registered at all in this
> case.
> 
> Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: add Fixes line
> 
> Andy recommended to use IORESOURCE_DISABLED instead, but this doesn't
> have any effect for platform_get_irq(), so I'm resubmitting this patch
> without functional changes. Grepping for '\.flags = 0;' shows other
> drivers doing the same.

IORESOURCE_DISABLED seems to have an odd meaning. It seems to be about
ACPI and the resource needs to be enabled before it can be used.

So .flags = 0 seems reasonable.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
