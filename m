Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B003BA1D2
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhGBODA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 10:03:00 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37508 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232700AbhGBODA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 10:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=Yn8dILk7SaxgrwIdkqjUSo2LpPLZvadnuNn4JtaFs0k=; b=lO3B/ywuxzoGkJf6sGpLn3HXQl
        hLoA27O7/WR121k4QL3u7edck4RTDxKsHDHY/STQsVtVJBrIvvlmDKvHhD7cZ0itADGQoA6G14d5p
        dq8I7KLI8YInhUtZTkEn6tv5vuRwPgsggHMzMcIe9OK/I+MDVzf7GimaYkfKr45frvxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lzJiT-00BvMt-H0; Fri, 02 Jul 2021 16:00:25 +0200
Date:   Fri, 2 Jul 2021 16:00:25 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] mfd: tqmx86: fix typo in "platform"
Message-ID: <YN8b+QVSnB1tvFgp@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <7c689191a76ddf0f18ff14989651038f509f1746.1625227382.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c689191a76ddf0f18ff14989651038f509f1746.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:50PM +0200, Matthias Schiffer wrote:
> Rename variable from "ocores_platfom_data" to "ocores_platform_data".
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: new patch
> 
>  drivers/mfd/tqmx86.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 9b65dbedc1bb..ff1bdb742e3f 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c
> @@ -76,7 +76,7 @@ static struct i2c_board_info tqmx86_i2c_devices[] = {
>  	},
>  };
>  
> -static struct ocores_i2c_platform_data ocores_platfom_data = {
> +static struct ocores_i2c_platform_data ocores_platform_data = {

Ah. Missed that in the vendor code :-(

FYI: I used tqmx86-drivers_1.3. If you have any fixes in later
versions, you might want to submit patches.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
