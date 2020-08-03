Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4A523A581
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 14:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgHCMho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 08:37:44 -0400
Received: from mga18.intel.com ([134.134.136.126]:34397 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729591AbgHCMen (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Aug 2020 08:34:43 -0400
IronPort-SDR: 7Tzvpev1qI2szilOil0hguLChifoEe7jwMyXbINQBefdE1UQRvtWAdbnxFncfzQRGDiRtT04sM
 4nrzTrn0kYBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139668786"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="139668786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 05:34:43 -0700
IronPort-SDR: OxNuwXEYISB3MRZk3XTQkOnC4C1eTtr69X6ha4AlPMmfkuShohChb1PL0C6lL47FTY9G1lbzAR
 Zao7A32pw+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="396039379"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 05:34:41 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 15:34:40 +0300
Date:   Mon, 3 Aug 2020 15:34:40 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: cherryview: Utilize temporary variable to
 hold device pointer
Message-ID: <20200803123440.GS1375436@lahna.fi.intel.com>
References: <20200729120230.43005-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729120230.43005-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 03:02:30PM +0300, Andy Shevchenko wrote:
> By one of the previous clean up change we got a temporary variable to hold
> a device pointer. It can be utilized in other calls in the ->probe() and
> save a bit of LOCs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
