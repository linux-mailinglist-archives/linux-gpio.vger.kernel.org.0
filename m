Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55FD5E95A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 18:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGCQiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 12:38:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:50176 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfGCQiR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 12:38:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 09:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="184802042"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 03 Jul 2019 09:38:13 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Jul 2019 19:38:12 +0300
Date:   Wed, 3 Jul 2019 19:38:12 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: baytrail: Use GENMASK() consistently
Message-ID: <20190703163812.GZ2640@lahna.fi.intel.com>
References: <20190703151554.30454-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703151554.30454-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 03, 2019 at 06:15:54PM +0300, Andy Shevchenko wrote:
> Use GENMASK() macro for all definitions where it's appropriate.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
