Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB9723A273
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 12:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgHCKDB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 06:03:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:5435 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgHCKDB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Aug 2020 06:03:01 -0400
IronPort-SDR: KTceCYw0uTBRhlzIau048VjUrKJwMXsXVNAOSaXm0+eA0vHPUozvx65+kfgW42cBz34mUeb79o
 j/e94wZQa22g==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="149871332"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="149871332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 03:03:00 -0700
IronPort-SDR: XRRUF8OdmuHBf1WW6sysIVNwb9fCTCsy9PToqRB7QDAhX2kZEDiY1bwWHRVLSNN38HOYAutnox
 GsZKIJNALqmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="396004962"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 03:02:59 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 13:02:58 +0300
Date:   Mon, 3 Aug 2020 13:02:58 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: cherryview: Drop stale comment
Message-ID: <20200803100258.GF1375436@lahna.fi.intel.com>
References: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 07:12:14PM +0300, Andy Shevchenko wrote:
> There is no more .groups member in struct chv_pinctrl,
> drop associated comment because it's not applicable anymore.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For this and the other patches in this series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
