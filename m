Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF15C2EE2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 10:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732738AbfJAIbr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 04:31:47 -0400
Received: from mga02.intel.com ([134.134.136.20]:22200 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727361AbfJAIbr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Oct 2019 04:31:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 01:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="205024327"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 01:31:43 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 11:31:43 +0300
Date:   Tue, 1 Oct 2019 11:31:42 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Allocate IRQ chip dynamic
Message-ID: <20191001083142.GA2714@lahna.fi.intel.com>
References: <20190916144751.21525-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916144751.21525-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 05:47:51PM +0300, Andy Shevchenko wrote:
> Keeping the IRQ chip definition static shares it with multiple instances of
> the GPIO chip in the system. This is bad and now we get this warning from
> GPIO library:
> 
> "detected irqchip that is shared with multiple gpiochips: please fix the driver."
> 
> Hence, move the IRQ chip definition from being driver static into the struct
> intel_pinctrl. So a unique IRQ chip is used for each GPIO chip instance.
> 
> Fixes: ee1a6ca43dba ("Add Intel Broxton pin controller support")
> Depends-on: 5ff56b015e85 ("Disable GPIO pin interrupts in suspend")
> Reported-by: Federico Ricchiuto <fed.ricchiuto@gmail.com>
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to intel.git/fixes, thanks!
