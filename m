Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23901FF113
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgFRL5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:57:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:51934 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgFRL5Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 07:57:25 -0400
IronPort-SDR: hrcYnFde8UDP7115sW2SQqlZPjg5l1K0KnSq5OcEf/lvhwfmW6goxpT+gOSnEV/NhpB1SX5372
 xdbfZLq91WFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="122287858"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="122287858"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 04:57:24 -0700
IronPort-SDR: Jc1PG0Mz2jQX11QnnEgxRM6SNjOrpOFtkE39BU2/b1gGrABeFpZ73tHDlpIipFrqnVMtH/yPUO
 z+QFufmaI4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="383504499"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 18 Jun 2020 04:57:22 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 18 Jun 2020 14:57:21 +0300
Date:   Thu, 18 Jun 2020 14:57:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] gpio: pca953x: Fix GPIO resource leak on Intel
 Galileo Gen 2
Message-ID: <20200618115721.GC2795@lahna.fi.intel.com>
References: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 18, 2020 at 02:49:06PM +0300, Andy Shevchenko wrote:
> When adding a quirk for IRQ on Intel Galileo Gen 2 the commit ba8c90c61847
> ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> missed GPIO resource release. We can safely do this in the same quirk, since
> IRQ will be locked by GPIO framework when requested and unlocked on freeing.
> 
> Fixes: ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
