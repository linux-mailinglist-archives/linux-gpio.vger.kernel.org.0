Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9268B19BCBE
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgDBHd6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:33:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:64686 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgDBHd6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 03:33:58 -0400
IronPort-SDR: 9+sD5WzoK9XauO5MbhxwyKwXfhKUggvTcgjxRDpQS614HLf0RRvmtFrVjjWuf59vHZqyKXYvKb
 n1b/y9dZiqqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 00:33:58 -0700
IronPort-SDR: pg775sYkhGpSeeKaxjJbn8ufY6/USgVPtcO99KWD4yOy6sC5mUGhRuVpxoEHx5w5NbVUa0BXQI
 cuM+WH71/jQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; 
   d="scan'208";a="360111283"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2020 00:33:55 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 02 Apr 2020 10:33:55 +0300
Date:   Thu, 2 Apr 2020 10:33:55 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/2] pinctrl: cherryview: Re-use data structures from
 pinctrl-intel.h (part 2)
Message-ID: <20200402073355.GI2564@lahna.fi.intel.com>
References: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 08:35:01PM +0300, Andy Shevchenko wrote:
> We have some data structures duplicated across the drivers.
> Let's deduplicate them by using ones that being provided by
> pinctrl-intel.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
