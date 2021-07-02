Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C4B3BA156
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 15:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbhGBNoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 09:44:02 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37448 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232392AbhGBNoB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 09:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=kchqsuQLvbI71SC88Xxd9k0q25E9iDGofPdCgD98g/o=; b=maNqJ16v3eIZ54p1TD0iSqD78y
        rxtug5mOfX3OAmdt+1buKgIhdwWxR/t+xLfoZCVhC+O9sWJg+Zg7kIgbwX3rrwexXBmynqAVE63EC
        QB9gaGySSiaIOMjum7SjCwJ5unMszzdJzfrsykDHC3YlkZ/0x/oHm5OaCtHO4V+GWwfE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJQ6-00BvHU-28; Fri, 02 Jul 2021 15:41:26 +0200
Date:   Fri, 2 Jul 2021 15:41:26 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
Message-ID: <YN8Xhu3XXGeLAlhj@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:46PM +0200, Matthias Schiffer wrote:
> Updated patch series:
> 
> - A number of new patches (more hardware support and a few fixes)
> - Patches 1-3 have gained Fixes tags
> - Patch 2 depends on 1, so maybe we can push the GPIO patch through the
>   MFD tree to keep them together?
> - The change in patch 7 was somewhat controversial. I've added a
>   warning, but it is the last patch of the series, so it doesn't affect
>   the rest of the series if it is rejected.

Hi Matthias

Nice to see the vendor involved. That does not happen enough.

Please split these into fixes and new features. They go into different
trees, so splitting them makes it easier for the maintainers.

I would also suggest splitting the patches per subsystem, and send
them to the specific subsystem maintainer. The exception would be when
there is cross subsystem dependencies.

     Andrew
