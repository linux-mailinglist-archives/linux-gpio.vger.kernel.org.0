Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2D65E26C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 13:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfGCLCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 07:02:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:31605 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfGCLCJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 07:02:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 04:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="184722363"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 03 Jul 2019 04:02:06 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Jul 2019 14:02:06 +0300
Date:   Wed, 3 Jul 2019 14:02:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 2/2] pinctrl: baytrail: Re-use data structures from
 pinctrl-intel.h
Message-ID: <20190703110206.GQ2640@lahna.fi.intel.com>
References: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
 <20190703003018.75186-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703003018.75186-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 03, 2019 at 03:30:18AM +0300, Andy Shevchenko wrote:
> We have some data structures duplicated across the drivers.
> Let's deduplicate them by using ones that being provided by
> pinctrl-intel.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 299 +++++------------------
>  1 file changed, 60 insertions(+), 239 deletions(-)

Nice cleanup!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
