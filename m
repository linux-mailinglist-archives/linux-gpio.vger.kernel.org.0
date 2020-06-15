Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620501F949A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 12:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgFOK3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 06:29:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:10708 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729403AbgFOK27 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 06:28:59 -0400
IronPort-SDR: SNTo46vQvWQNmXF882+T3JoOuIritjrGsFodl0DX4m+/18ALrRY7xvJUTU6sQcTlq+QvidIgXl
 qYS7bdvtRE1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 03:28:58 -0700
IronPort-SDR: Vsxq6KgdAK0Uww5iGlo5uWeSkb81x/MdE25r/p7fcLO62LRluDd5bYvn2/1F6kRiwMcJmSn4lB
 6p/mbxhueKLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="449344016"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2020 03:28:57 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jkmMN-00DY7S-IA; Mon, 15 Jun 2020 13:28:59 +0300
Date:   Mon, 15 Jun 2020 13:28:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/6] pinctrl: cherryview: Introduce chv_readl() helper
Message-ID: <20200615102859.GW2428291@smile.fi.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
 <20200610131605.GN247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610131605.GN247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 04:16:05PM +0300, Mika Westerberg wrote:
> On Tue, Jun 09, 2020 at 09:24:44PM +0300, Andy Shevchenko wrote:
> > There are plenty of places where we call
> > 	readl(chv_padreg(pctrl, offset, ...));
> > 
> > Replace them with newly introduced chv_readl() helper
> > 	chv_readl(pctrl, offset, ...);
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> For patches 1-6,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

Also includes Linus' Ack, since the first submission went pass by mailing list
on which Linus replied.

-- 
With Best Regards,
Andy Shevchenko


