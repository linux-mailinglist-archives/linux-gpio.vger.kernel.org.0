Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5F9BB8DB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 18:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732783AbfIWQA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 12:00:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49992 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387706AbfIWQA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 12:00:57 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 270F653B;
        Mon, 23 Sep 2019 18:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569254455;
        bh=Etat8NN7YLvsW2f3sC337/iHi/6qZmsmzIordeWfKk0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HkZLp6T2S5QxbJRI7OaV54luhyvzV8n+O1mR5gtRTjuF6hnhK/kji0uJzF7LsONPJ
         iuYn0eUA3oYTT/3KqkHeTICg0gzqMTAho7VwH2/bxjlXlMB2MGtA5Z2ziIQCplolcU
         peP0LQ0N1BnqbCyXMyxbqkGL0PZNe+/YlxqQjCTE=
Date:   Mon, 23 Sep 2019 19:00:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190923160045.GE5056@pendragon.ideasonboard.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
 <20190920231228.GH12672@pendragon.ideasonboard.com>
 <20190923150333.GD16243@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923150333.GD16243@kuha.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Heikki,

On Mon, Sep 23, 2019 at 06:03:33PM +0300, Heikki Krogerus wrote:
> On Sat, Sep 21, 2019 at 02:12:28AM +0300, Laurent Pinchart wrote:
> > Hi Dmitry,
> > 
> > (CC'ing Heikki as the original author of software nodes support)
> > 
> > Thank you for the patch.
> > 
> > On Wed, Sep 11, 2019 at 12:52:10AM -0700, Dmitry Torokhov wrote:
> > > Instead of fwnode_get_named_gpiod() that I plan to hide away, let's use
> > > the new fwnode_gpiod_get_index() that mimics gpiod_get_index(), bit
> > 
> > s/bit/but/
> > 
> > > works with arbitrary firmware node.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > On a side note, as I'm not very familiar with software nodes, I tried to
> > see how they are to be used, and it seems they are completely
> > undocumented :-( Heikki, is this something that could be fixed ?
> 
> OK. I'll start writing API documentation for it.

That's great, thanks ! I'll do my best to review it if you CC me.

-- 
Regards,

Laurent Pinchart
