Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5215CE4805
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 12:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408093AbfJYKCE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 06:02:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:18087 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405764AbfJYKCD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 06:02:03 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 03:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="210346387"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 25 Oct 2019 03:02:01 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 25 Oct 2019 13:02:00 +0300
Date:   Fri, 25 Oct 2019 13:02:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Allocate IRQ chip dynamic
Message-ID: <20191025100200.GL2593@lahna.fi.intel.com>
References: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 05:33:42PM +0300, Andy Shevchenko wrote:
> Keeping the IRQ chip definition static shares it with multiple instances
> of the GPIO chip in the system. This is bad and now we get this warning
> from GPIO library:
> 
> "detected irqchip that is shared with multiple gpiochips: please fix the driver."
> 
> Hence, move the IRQ chip definition from being driver static into the struct
> intel_pinctrl. So a unique IRQ chip is used for each GPIO chip instance.
> 
> Fixes: 9f573b98ca50 ("pinctrl: baytrail: Update irq chip operations")
> Depends-on: aee0f04d5f3b ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
