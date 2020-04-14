Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06B61A77B8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 11:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437897AbgDNJtp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 05:49:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:38597 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437891AbgDNJtl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 05:49:41 -0400
IronPort-SDR: APFW40HfmlAF0JZb1Mpkei53FiqZWuQt4yUHotXtmw8Hkkv74KFGkeC3yDkaQNfpmav5vl7sPs
 RbMj6FAwjRDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 02:49:40 -0700
IronPort-SDR: SELeJc0xPcWG/ZnJ3RPEtZbWD4xs8TGIpPmyxV3mB3RuXIyddauZeLcsrTv8RlIZdQyWnDxv6m
 ZRsPxQ6mWKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363330866"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 02:49:38 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 14 Apr 2020 12:49:38 +0300
Date:   Tue, 14 Apr 2020 12:49:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/6] pinctrl: cannonlake: Use generic flag for special
 GPIO base treatment
Message-ID: <20200414094938.GG2567@lahna.fi.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
 <20200413111825.89866-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413111825.89866-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 02:18:21PM +0300, Andy Shevchenko wrote:
> Since we have a generic flag for special GPIO base treatment,
> use it in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
