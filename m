Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B9D1A77DC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 11:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438019AbgDNJwS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 05:52:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:15003 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437981AbgDNJwR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 05:52:17 -0400
IronPort-SDR: FkhDbvi+S7dDekZuKE1HcMPF9/kMe5V5RtAuNUcNZWkiOz/1CPHqUnMezstrHY4yz179Dls4Ax
 iapjFPJXJgOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 02:52:16 -0700
IronPort-SDR: ldkVUrTAo/CJR73eU4K6ODDk0WL5jS1zYQyp3l5baB/V8JKXKjNAEPWLqDdXMORbSP78KKB4eh
 CKyuuZSwor1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363331693"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 02:52:14 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 14 Apr 2020 12:52:13 +0300
Date:   Tue, 14 Apr 2020 12:52:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/6] pinctrl: intel: Introduce new flag to force GPIO
 base to be 0
Message-ID: <20200414095213.GJ2567@lahna.fi.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
 <20200413111825.89866-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413111825.89866-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 02:18:24PM +0300, Andy Shevchenko wrote:
> In some cases not the first group would like to have GPIO base to be 0.
> It's not possible right now due to 0 has special meaning already. Thus,
> introduce a new flag to allow drivers to force GPIO base to be 0 on
> a certain group. It's assumed that it can be only one group per device
> with such flag enabled.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
