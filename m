Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4547C1F3AC6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 14:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgFIMkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 08:40:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:51609 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728238AbgFIMkA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 08:40:00 -0400
IronPort-SDR: nSjuFbcSsFyxpvJMS+3ux9ksK2kSv31qnRLbpqyjBtADwQ6NNwU255Ly73jVjrKVgOCjXe2xeh
 azGggsepBpVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 05:39:59 -0700
IronPort-SDR: 6UdEfbdP4pMrhUnc1t8skUC9jkG4V7po3UjrAA0aoIpSyiEp2ss3TWdV5Qstu2B1GywRo8GFmk
 XEb4eUTLoXnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; 
   d="scan'208";a="379725439"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2020 05:39:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jidXs-00BtqA-40; Tue, 09 Jun 2020 15:40:00 +0300
Date:   Tue, 9 Jun 2020 15:40:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 3/6] mfd: core: Propagate software node group to the
 sub devices
Message-ID: <20200609124000.GO2428291@smile.fi.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-4-andriy.shevchenko@linux.intel.com>
 <20200608192524.GF4106@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608192524.GF4106@dell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 08, 2020 at 08:25:24PM +0100, Lee Jones wrote:
> On Mon, 08 Jun 2020, Andy Shevchenko wrote:
> 
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > When ever device properties are supplied for a sub device, a software node
> > (fwnode) is actually created and then associated with that device. By allowing
> > the drivers to supply the complete software node group instead of just the
> > properties in it, the drivers can take advantage of the other features the
> > software nodes have on top of supplying the device properties.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mfd/mfd-core.c   | 31 +++++++++++++++++++++++++++----
> >  include/linux/mfd/core.h |  3 +++
> >  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> I'm not sure a change to the API is justified presently (same does go
> for 'properties' really, but as it was only a couple of lines, it
> didn't seem too intrusive).

This is better and comprehensive API, but I heard you.

> My recommendation is to handle this in-house (i.e. locally in-driver)
> for now.

I think you understand that this is not gonna work (we need to attach fwnode
to the child device before it's registration.

> When (if) more users adopt the practice, then we should
> consider to draw down on line numbers and repetition and make it part
> of the API.

I briefly looked at the current state of affairs and found that properties are
used only for MFD LPSS driver. Would the conversion of that driver to swnodes
work for you?

Note, the long prospective is to get rid of platform_add_properties() API
completely.

-- 
With Best Regards,
Andy Shevchenko


