Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B8F19A8E0
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 11:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbgDAJuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 05:50:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:8309 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727724AbgDAJuG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 05:50:06 -0400
IronPort-SDR: oLIMSY8yHHPRQrX+1z7IZEd3aTTQfN44hopHryUNSXjykFIdARVZ35JggmPRjbpZmvVzW0qz45
 EXO87tsAFrsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 02:50:05 -0700
IronPort-SDR: 8XpcN/+QewYMfphwwXcw0fNOgdmaHCjYPuMuTETsyp2gnOtk532HxU2QsZ9G3yrczdHKWKLMr5
 KrwtXYGdEj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="359810255"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Apr 2020 02:50:03 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Apr 2020 12:50:02 +0300
Date:   Wed, 1 Apr 2020 12:50:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: sunrisepoint: Fix PAD lock register offset
 for SPT-H
Message-ID: <20200401095002.GR2564@lahna.fi.intel.com>
References: <20200401085553.8770-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401085553.8770-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 11:55:53AM +0300, Andy Shevchenko wrote:
> It appears that SPT-H variant has different offset for PAD locking registers.
> Fix it here.
> 
> Fixes: 551fa5801ef1 ("pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
