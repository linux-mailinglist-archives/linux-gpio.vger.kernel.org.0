Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F2AE7061
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 12:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbfJ1L3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 07:29:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:31817 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730811AbfJ1L3r (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Oct 2019 07:29:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Oct 2019 04:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; 
   d="scan'208";a="210858576"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 28 Oct 2019 04:29:44 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 28 Oct 2019 13:29:43 +0200
Date:   Mon, 28 Oct 2019 13:29:43 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
Message-ID: <20191028112943.GV2593@lahna.fi.intel.com>
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 25, 2019 at 05:06:21PM +0300, Andy Shevchenko wrote:
> There is a logical continuation of the commit 5fbe5b5883f8 ("gpio: Initialize
> the irqchip valid_mask with a callback") to split IRQ initialization to
> hardware and valid mask setup parts.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
