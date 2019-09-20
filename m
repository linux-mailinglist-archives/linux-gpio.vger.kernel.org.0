Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D65B99F6
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 01:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389873AbfITXMk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 19:12:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60992 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389793AbfITXMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 19:12:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC0662F9;
        Sat, 21 Sep 2019 01:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569021157;
        bh=rjz1wJjGxXSYjN7ynywAFExyXsol+TYBRcie4ik5QFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JeYj3LfQ2XRfPhk6Ulsz3ivewW9stOFV7hn8IvUAjrSXWo0UuPGQufLY4KiyICKy+
         nN4IdpmQgooiW64b5jnvntaP6C7v63g4CaCbYfEfAJKgR4ptfKnNFY7oFw56gjtBfB
         rOuCz07m5mhlBVKozL75z1u45T/przGI192osQdc=
Date:   Sat, 21 Sep 2019 02:12:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190920231228.GH12672@pendragon.ideasonboard.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190911075215.78047-7-dmitry.torokhov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dmitry,

(CC'ing Heikki as the original author of software nodes support)

Thank you for the patch.

On Wed, Sep 11, 2019 at 12:52:10AM -0700, Dmitry Torokhov wrote:
> Instead of fwnode_get_named_gpiod() that I plan to hide away, let's use
> the new fwnode_gpiod_get_index() that mimics gpiod_get_index(), bit

s/bit/but/

> works with arbitrary firmware node.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On a side note, as I'm not very familiar with software nodes, I tried to
see how they are to be used, and it seems they are completely
undocumented :-( Heikki, is this something that could be fixed ?

> ---
> 
>  drivers/gpu/drm/bridge/ti-tfp410.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 61cc2354ef1b..d9c9c9ebad2b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -284,8 +284,8 @@ static int tfp410_get_connector_properties(struct tfp410 *dvi)
>  	else
>  		dvi->connector_type = DRM_MODE_CONNECTOR_DVID;
>  
> -	dvi->hpd = fwnode_get_named_gpiod(&connector_node->fwnode,
> -					"hpd-gpios", 0, GPIOD_IN, "hpd");
> +	dvi->hpd = fwnode_gpiod_get_index(&connector_node->fwnode,
> +					  "hpd", 0, GPIOD_IN, "hpd");
>  	if (IS_ERR(dvi->hpd)) {
>  		ret = PTR_ERR(dvi->hpd);
>  		dvi->hpd = NULL;

-- 
Regards,

Laurent Pinchart
