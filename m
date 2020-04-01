Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D270419A8D2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbgDAJqY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 05:46:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:60133 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726974AbgDAJqX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 05:46:23 -0400
IronPort-SDR: 1f+qQ/bKQfaRx429DwysVUVo+bkBZdwQJ+QLI0IJZUhNy0DPHgfvwC3goW8QPG9OXQWrr6tDr0
 h6JPuNEdmkOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 02:46:23 -0700
IronPort-SDR: w/vgo8n9VWu9KWgaYcTgHFEEyVgFPnesbxdz2J+tnrL9BYj1dd1CC5fyDdN2KDmMxP5VKOO7pK
 suwcolNTlgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="359809499"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Apr 2020 02:46:20 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Apr 2020 12:46:20 +0300
Date:   Wed, 1 Apr 2020 12:46:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Enable pin configuration setting
 for GPIO chip
Message-ID: <20200401094620.GQ2564@lahna.fi.intel.com>
References: <20200331152428.33951-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331152428.33951-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 31, 2020 at 06:24:28PM +0300, Andy Shevchenko wrote:
> It appears that pin configuration for GPIO chip hasn't been enabled yet
> due to absence of ->set_config() callback.
> 
> Enable it here for Intel Baytrail.
> 
> Fixes: c501d0b149de ("pinctrl: baytrail: Add pin control operations")
> Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
