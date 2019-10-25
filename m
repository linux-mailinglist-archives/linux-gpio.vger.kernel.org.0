Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDA97E4806
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 12:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbfJYKC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 06:02:28 -0400
Received: from mga17.intel.com ([192.55.52.151]:42977 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405764AbfJYKC2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 06:02:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 03:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="210346434"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 25 Oct 2019 03:02:25 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 25 Oct 2019 13:02:25 +0300
Date:   Fri, 25 Oct 2019 13:02:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] pinctrl: baytrail: Group GPIO IRQ chip
 initialization
Message-ID: <20191025100225.GM2593@lahna.fi.intel.com>
References: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
 <20191024143343.17638-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024143343.17638-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 05:33:43PM +0300, Andy Shevchenko wrote:
> After commit aee0f04d5f3b ("pinctrl: intel: baytrail: Pass irqchip
> when adding gpiochip") the GPIO IRQ chip structure is being initialized under
> conditional when IRQ resource has been discovered. But that commit left aside
> the assignment of ->init_valid_mask() callback that is done unconditionally.
> 
> For sake of consistency and preventing some garbage in GPIO IRQ chip structure
> group initialization together.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
