Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11F6919BCCB
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387431AbgDBHeu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:34:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:5581 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729166AbgDBHeu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 03:34:50 -0400
IronPort-SDR: LyDu0EXrA1BvmgutmioArRF/Do5Kg7ROMuSglU1PSsoOixiWy2MWtIDJzA3a7bAhDlx/Qb2W3F
 liIcM2BcZstg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 00:34:49 -0700
IronPort-SDR: 2Q69oeif5BZfGvlKE5P/mACSZNkAEKkF16T7gFtQ8SCYeBF6qqQKijp/4U/MEnvNFYE87xySbc
 x/AOBAu7jnNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; 
   d="scan'208";a="360111582"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2020 00:34:46 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 02 Apr 2020 10:34:45 +0300
Date:   Thu, 2 Apr 2020 10:34:45 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 2/2] pinctrl: cherryview: Use GENMASK() consistently
Message-ID: <20200402073445.GJ2564@lahna.fi.intel.com>
References: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
 <20200401173502.27626-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401173502.27626-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 08:35:02PM +0300, Andy Shevchenko wrote:
> Use GENMASK() macro for all definitions where it's appropriate.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
