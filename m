Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E28BB771
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 17:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfIWPDj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 11:03:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:26036 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbfIWPDi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Sep 2019 11:03:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 08:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; 
   d="scan'208";a="203140575"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 23 Sep 2019 08:03:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 23 Sep 2019 18:03:33 +0300
Date:   Mon, 23 Sep 2019 18:03:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20190923150333.GD16243@kuha.fi.intel.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
 <20190920231228.GH12672@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920231228.GH12672@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 21, 2019 at 02:12:28AM +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> (CC'ing Heikki as the original author of software nodes support)
> 
> Thank you for the patch.
> 
> On Wed, Sep 11, 2019 at 12:52:10AM -0700, Dmitry Torokhov wrote:
> > Instead of fwnode_get_named_gpiod() that I plan to hide away, let's use
> > the new fwnode_gpiod_get_index() that mimics gpiod_get_index(), bit
> 
> s/bit/but/
> 
> > works with arbitrary firmware node.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> On a side note, as I'm not very familiar with software nodes, I tried to
> see how they are to be used, and it seems they are completely
> undocumented :-( Heikki, is this something that could be fixed ?

OK. I'll start writing API documentation for it.

thanks,

-- 
heikki
