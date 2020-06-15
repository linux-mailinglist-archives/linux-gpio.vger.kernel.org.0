Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CDD1F95D9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgFOMBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:01:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:17289 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729787AbgFOMBN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:01:13 -0400
IronPort-SDR: Y179tOdiYp8At+yAXdXBWhUOVCB9m0VTs5CLZzYCvy1SC+gjABxVNscFUh9WgUIKY+P78n4c2Z
 OpJfwnPpbJkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 05:01:12 -0700
IronPort-SDR: dXvOGRNtqnr3uXW5Iu8GtF0iMaKhkP3LcvJ6mhaYCZDp4HyBgFrE8FmOQZ4PGzIEb9VHqxjF/3
 z/N3tTw+fSvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="382524203"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 15 Jun 2020 05:01:04 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 15 Jun 2020 15:01:03 +0300
Date:   Mon, 15 Jun 2020 15:01:03 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/13] pinctrl: intel: Disable input and output buffer
 when switching to GPIO
Message-ID: <20200615120103.GH247495@lahna.fi.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 12, 2020 at 05:49:54PM +0300, Andy Shevchenko wrote:
> It's possible scenario that pin has been in different mode, while
> the respective GPIO register has a leftover output buffer enabled.
> In such case when we request GPIO it will switch to GPIO mode, and
> thus to output with unknown value, followed by switching to input
> mode. This can produce a glitch on the pin.
> 
> Disable input and output buffer when switching to GPIO to avoid
> potential glitches.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There was a minor comment on one patch but other than that this looks
good.

For the whole series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
