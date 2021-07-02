Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A78C3BA1C5
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 15:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhGBN6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 09:58:42 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37494 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232412AbhGBN6m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 09:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=Yf7jnSTbPRJg7sbOAlPaB3qOLfMiV9piygeW8egGh6w=; b=1/Y5WGB/R9l6fWNKVbzsrFgSxs
        TBCY8lfZyZbUtYpQm5Z4iR9qPfSvByFwgbQaZkDhxIuHW/e96Xtg1ARJctiYSZlbMEvyZfXEXQmOV
        BHRfYWHMgYTDh1cd7ugczvsFdPO+4ImL+h00SZZ/EosW+2/c8B79PmVD4DAZ34/ML43I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJeJ-00BvLe-NC; Fri, 02 Jul 2021 15:56:07 +0200
Date:   Fri, 2 Jul 2021 15:56:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: tqmx86: remove incorrect TQMx90UC board ID
Message-ID: <YN8a95WlR7oM3/y+@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <36046861067369c0569f3d955f7a390c136689b5.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36046861067369c0569f3d955f7a390c136689b5.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:49PM +0200, Matthias Schiffer wrote:
> No TQMx90UC exists at the moment, and it is undecided whether ID 10 will
> be used eventually (and if it is, how that SoM will be named).

This was in the vendor code i was given. I just blindly kept it, since
i don't know anything except about the one system i had.

> Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")

I'm not sure this meets the stable requirements:

https://www.kernel.org/doc/html/v4.10/process/stable-kernel-rules.html

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
