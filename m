Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733BD29E59C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 09:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgJ2IAv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 04:00:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:23619 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgJ2IAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 04:00:50 -0400
IronPort-SDR: QoxPAUsx4V1cfgK2He9iafkRI0wkT+takO7VvyTCjimBYLOE2rLmxxxbh4LX7h2o561ecYcM6p
 dBRDr1LGuW6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168493599"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="168493599"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:00:49 -0700
IronPort-SDR: VR7YhiAcfRUHHJb6Om7cQRdGZxxP5jm4twR7yryt7C+qY/qVvgbnX0dNcp3c5x2IkWRB4sHNhC
 ArwZ83XLo6NQ==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="323626906"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:00:46 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 29 Oct 2020 10:00:42 +0200
Date:   Thu, 29 Oct 2020 10:00:42 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Lakefield pin controller
 support
Message-ID: <20201029080042.GL2495@lahna.fi.intel.com>
References: <20201026192325.20813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026192325.20813-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 09:23:25PM +0200, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Lakefield SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
> 
> Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
