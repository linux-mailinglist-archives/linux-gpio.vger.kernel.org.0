Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80B21D2E0C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 13:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgENLSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 07:18:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:2752 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgENLSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 07:18:34 -0400
IronPort-SDR: DozW82+9eQmGu2j8zYvGXaKtJNflGEIQ/dZWQlybyykORyNtJwoKgbNmlN6+maIT9Znp+w5pZd
 M6ysulP++9FQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:18:34 -0700
IronPort-SDR: Ud1H7+43oVRRvTYbZAKvPWSNzuhJSIb6UkanM0FBz5Vo+YQbRxPNhpIEgNend0nkmcIfLZi8HQ
 Q2Dg/I4JUIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="266207689"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 14 May 2020 04:18:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jZBsq-006c0I-52; Thu, 14 May 2020 14:18:36 +0300
Date:   Thu, 14 May 2020 14:18:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.8-1
Message-ID: <20200514111836.GB185537@smile.fi.intel.com>
References: <20200514105147.GA44595@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514105147.GA44595@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 14, 2020 at 01:51:47PM +0300, Andy Shevchenko wrote:
> Hi Linus,
> 
> Collected Intel pin control drivers for v5.8 cycle. It has all previous fixes
> that doesn't appear in your for-next branch, thus, duplicates.

Sorry for the confusion, should be read as 'that does appear ... with different IDs'.

-- 
With Best Regards,
Andy Shevchenko


