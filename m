Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7294D3BA1DB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhGBOEa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 10:04:30 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37528 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232858AbhGBOE3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 10:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=R6DckeZgtg3V51Sx0cjR8Pu4OSMjTj4JgtVcMO8EmD0=; b=jfetKrMTblvVqOrFbffmkjJH7/
        DgTddZo+bf0aZbJtao2UBKUQ5jeO7rz74UzQD+4iuxFWEMODr3I3Wnkml4vzzyIxAxVrbBqMXtZf8
        KDtiTFzSjE2ctWTEAe9pjdquOeMnwSWSgw96WOPkeSG5p523ZG2fr0UwAZLO9NBsKGIw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJjv-00BvNf-8K; Fri, 02 Jul 2021 16:01:55 +0200
Date:   Fri, 2 Jul 2021 16:01:55 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] mfd: tqmx86: add support for TQ-Systems DMI IDs
Message-ID: <YN8cU5Pewnn0miuF@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <11bef2179e4745a4edcf579ff96185cb6987931d.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11bef2179e4745a4edcf579ff96185cb6987931d.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:52PM +0200, Matthias Schiffer wrote:
> Newer TQMx86 modules use TQ-Systems instead of TQ-Group as their vendor
> ID.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
